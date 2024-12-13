# Usar a imagem base do Nginx
FROM nginx:latest

# Copiar a configuração personalizada do Nginx para o container
COPY nginx.conf /etc/nginx/nginx.conf

# Copiar arquivos de site para o diretório padrão do Nginx
COPY ./html /usr/share/nginx/html

# Expor a porta 80
EXPOSE 80

# Comando para iniciar o Nginx
CMD ["nginx", "-g", "daemon off;"]
