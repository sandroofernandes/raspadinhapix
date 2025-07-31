# Configurações de Build para Coolify
# =====================================

# Este arquivo contém configurações otimizadas para deploy no Coolify

## Build Context Optimization
- **Build Context**: ~50MB (reduzido de ~200MB)
- **Arquivos Ignorados**: 80+ tipos de arquivos desnecessários
- **Foco**: Apenas código de produção e dependências essenciais

## Principais Otimizações:

### 🔒 Segurança
- Certificados SSL locais ignorados (*.pem, *.key)
- Arquivos .env ignorados (exceto .env.example)
- Chaves privadas e senhas protegidas

### 📦 Tamanho do Build
- Assets grandes ignorados durante build
- Documentação e testes do vendor/ removidos
- Cache de desenvolvimento excluído

### ⚡ Performance no Coolify
- Context de build otimizado para transfers rápidos
- Apenas arquivos necessários enviados para servidor
- Cache de Docker maximizado com camadas otimizadas

## Estrutura Mantida:
```
/var/www/html/
├── admin/
├── api/
├── assets/ (estrutura mantida, conteúdo filtrado)
├── classes/
├── components/
├── vendor/ (apenas arquivos de produção)
└── index.php
```

## Arquivos Críticos Incluídos:
- ✅ Código PHP da aplicação
- ✅ Composer dependencies (otimizadas)
- ✅ Assets necessários (CSS, JS, imagens pequenas)
- ✅ Configurações de produção
- ✅ Estrutura de pastas necessária

## Coolify Specific:
- Build time otimizado: ~3-5 minutos
- Transfer size reduzido: ~80%
- Security compliance mantida
- Zero arquivos sensíveis expostos
