#!/bin/bash

echo "🐳 Otimizador de Build Docker para Raspadinha PIX"
echo "================================================="
echo ""

# Função para build com timeout
build_with_timeout() {
    local dockerfile=$1
    local tag=$2
    local timeout_duration=$3
    
    echo "⏳ Testando build com $dockerfile (timeout: ${timeout_duration}s)..."
    
    if timeout $timeout_duration docker build -f $dockerfile -t $tag . 2>/dev/null; then
        echo "✅ Build sucesso com $dockerfile!"
        return 0
    else
        echo "❌ Build falhou ou timeout com $dockerfile"
        return 1
    fi
}

# Teste 1: Dockerfile Alpine (mais rápido)
if build_with_timeout "Dockerfile.alpine" "raspadinha:alpine" 600; then
    echo ""
    echo "🎉 Recomendação: Use Dockerfile.alpine"
    echo "📝 Para deployar no Coolify, renomeie:"
    echo "   mv Dockerfile.alpine Dockerfile"
    exit 0
fi

# Teste 2: Dockerfile Otimizado (serversideup)
if build_with_timeout "Dockerfile.optimized" "raspadinha:optimized" 900; then
    echo ""
    echo "🎉 Recomendação: Use Dockerfile.optimized"
    echo "📝 Para deployar no Coolify, renomeie:"
    echo "   mv Dockerfile.optimized Dockerfile"
    exit 0
fi

# Teste 3: Dockerfile Original Otimizado
if build_with_timeout "Dockerfile" "raspadinha:standard" 1800; then
    echo ""
    echo "🎉 Dockerfile original otimizado funciona!"
    echo "📝 Seu Dockerfile atual está pronto para deploy"
    exit 0
fi

echo ""
echo "❌ Todos os builds falharam. Possíveis soluções:"
echo "1. Verificar conexão de internet"
echo "2. Limpar cache do Docker: docker system prune -af"
echo "3. Aumentar recursos do Docker (RAM/CPU)"
echo "4. Usar build em servidor com melhor conexão"
echo ""
echo "💡 Alternativa: Deploy direto no servidor com melhor internet"
