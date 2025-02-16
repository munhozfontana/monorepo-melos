#!/bin/bash

# Para o script caso um comando falhe
set -e

echo "🚀 Iniciando a pipeline local com Melos..."

# 1️⃣ Instala as dependências do Melos
echo "📦 Instalando dependências..."
melos bootstrap

# 2️⃣ Roda a análise de código (Lint)
echo "🔍 Rodando análise de código..."
melos run analyze

# 6️⃣ Gera a imagem Docker
echo "🐳 Gerando imagem Docker..."
docker build -t lufemunhoz/meu-flutter-app:latest -f Dockerfile .

# 6️⃣ Sobe a imagem Docker
echo "🐳 Gerando imagem Docker..."
docker push lufemunhoz/meu-flutter-app:latest


# 6️⃣ Sobe a imagem Docker
echo "✅ K8S..."
kubectl apply -f config/k8s/backoffice-deployment.yaml


echo "✅ Pipeline concluída com sucesso!"
