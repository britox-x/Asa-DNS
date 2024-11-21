# Base da imagem
FROM nginx:latest

# Instalar curl (necessário para o HEALTHCHECK)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copiar o arquivo HTML para o contêiner
COPY index.html /usr/share/nginx/html

# Ajustar permissões do arquivo
RUN chmod 644 /usr/share/nginx/html/index.html

# Comando de saúde para verificar se o servidor está respondendo
HEALTHCHECK CMD curl -f http://localhost/index.html || exit 1
