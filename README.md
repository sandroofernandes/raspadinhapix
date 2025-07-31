# RaspaPix - Sistema de Raspadinhas Online

Sistema completo de raspadinhas online com pagamento via PIX.

## Recursos

- 🎯 Sistema de raspadinhas interativo
- 💰 Pagamentos via PIX integrado
- 👥 Sistema de afiliados
- 🔐 Painel administrativo completo
- 📱 Interface responsiva
- 🔒 Segurança avançada

## Tecnologias

- PHP 8.2
- MySQL 8.0
- Apache
- Docker
- Bootstrap/Tailwind
- jQuery

## Deploy com Coolify

### Pré-requisitos

1. Servidor com Coolify instalado
2. Domínio configurado
3. Certificado SSL

### Variáveis de Ambiente Necessárias

```env
DB_HOST=db
DB_DATABASE=raspadinhapix
DB_USERNAME=root
DB_PASSWORD=senha_segura
SITE_NAME=RaspaPix
SITE_URL=https://seu-dominio.com
DIGITOPAY_CLIENT_ID=seu_client_id
DIGITOPAY_CLIENT_SECRET=seu_client_secret
```

### Estrutura do Banco

Importe o arquivo `database/raspadinhapix.sql` no seu banco MySQL.

### Configurações de Produção

1. Configure as variáveis de ambiente no Coolify
2. Configure o domínio e SSL
3. Configure webhooks para pagamentos
4. Configure backup automático

## Estrutura do Projeto

```
├── admin/              # Painel administrativo
├── api/               # APIs REST
├── assets/            # Recursos estáticos
├── callback/          # Webhooks de pagamento
├── classes/           # Classes PHP
├── components/        # Componentes reutilizáveis
├── docker/           # Configurações Docker
├── database/         # Scripts SQL
└── logs/             # Logs da aplicação
```

## Configuração de Webhooks

### DigitoPay
- URL: `https://seu-dominio.com/callback/digitopay.php`
- URL Saque: `https://seu-dominio.com/callback/digitopay_withdraw.php`

### Gateway Próprio
- URL: `https://seu-dominio.com/callback/gatewayproprio.php`

## Segurança

- Headers de segurança configurados
- Validação de entrada rigorosa
- Logs detalhados
- Sanitização de dados
- Proteção CSRF

## Monitoramento

- Logs em `logs/digitopay_webhook.log`
- Monitoramento de performance
- Alertas automáticos

## Suporte

Para suporte técnico, consulte a documentação ou entre em contato.
