FROM ubuntu:latest AS builder

# Instalar dependências do sistema
RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
    bash \
    git \
    curl \
    unzip \
    xz-utils \
    && apt-get clean

# Clonar o repositório do Flutter
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Configurar o caminho do Flutter e Dart no PATH
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:/root/.pub-cache/bin:$PATH"

# Rodar o Flutter Doctor para garantir que tudo está correto
RUN flutter doctor

# Copiar os arquivos do projeto para o contêiner
run mkdir workspace
COPY . ./workspace
WORKDIR /workspace

RUN ls

RUN flutter pub get
RUN /bin/sh -c dart run melos bootstrap
RUN /bin/sh -c dart run melos run build:web 

RUN ls
# Configurar a imagem do Nginx para servir a aplicação
FROM nginx:alpine

COPY --from=builder /workspace/config/nginx/404.html /usr/share/nginx/html
COPY --from=builder /workspace/config/nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /workspace/apps/app/build/web /usr/share/nginx/html

# Copiar os arquivos gerados pelo build para o diretório do Nginx

# # Expor a porta 80 para acessar o serviço
EXPOSE 80

# # Iniciar o Nginx no contêiner
CMD ["nginx", "-g", "daemon off;"]
