# Usar imagem baseada em Debian com PHP pré-compilado
FROM php:8.2-apache-bullseye

# Variáveis de ambiente para otimização
ENV DEBIAN_FRONTEND=noninteractive
ENV MAKEFLAGS="-j$(nproc)"

# Usar mirror brasileiro para downloads mais rápidos
RUN echo "deb http://mirror.ufscar.br/debian bullseye main" > /etc/apt/sources.list \
  && echo "deb http://mirror.ufscar.br/debian bullseye-updates main" >> /etc/apt/sources.list \
  && echo "deb http://security.debian.org/debian-security bullseye-security main" >> /etc/apt/sources.list

# Instalar dependências essenciais primeiro
RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  unzip \
  git \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Instalar dependências para extensões PHP em etapas separadas
RUN apt-get update && apt-get install -y --no-install-recommends \
  libpng-dev \
  libjpeg62-turbo-dev \
  libfreetype6-dev \
  libzip-dev \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Instalar ICU usando package binário (mais rápido que compilar)
RUN apt-get update && apt-get install -y --no-install-recommends \
  libicu67 \
  libicu-dev \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Instalar extensões PHP críticas primeiro (sem intl)
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) \
  gd \
  pdo \
  pdo_mysql \
  mysqli \
  zip \
  opcache

# Instalar intl separadamente com timeout maior
RUN timeout 1800 docker-php-ext-install intl || \
  (echo "Intl installation failed, trying alternative method..." && \
  apt-get update && \
  apt-get install -y php8.2-intl && \
  rm -rf /var/lib/apt/lists/*)

# Habilitar mod_rewrite do Apache
RUN a2enmod rewrite headers ssl

# Configurar PHP para produção
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Copiar configurações personalizadas do PHP
COPY docker/php.ini $PHP_INI_DIR/conf.d/custom.ini

# Configurar Apache
COPY docker/apache.conf /etc/apache2/sites-available/000-default.conf

# Definir diretório de trabalho
WORKDIR /var/www/html

# Copiar composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copiar arquivos do projeto
COPY . .

# Instalar dependências do Composer
RUN composer install --no-dev --optimize-autoloader

# Criar diretórios necessários e configurar permissões
RUN mkdir -p /var/www/html/logs \
  && mkdir -p /var/www/html/assets/upload \
  && mkdir -p /var/www/html/assets/banners \
  && mkdir -p /var/www/html/assets/img \
  && chown -R www-data:www-data /var/www/html \
  && chmod -R 755 /var/www/html \
  && chmod -R 777 /var/www/html/logs \
  && chmod -R 777 /var/www/html/assets/upload

# Renomear arquivo de configuração para produção
RUN mv conexao.prod.php conexao.php

# Expor porta 80
EXPOSE 80

# Comando de inicialização
CMD ["apache2-foreground"]
