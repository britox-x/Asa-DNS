#!/bin/bash

# Build do DNS
echo "[*] Construindo a imagem do servidor DNS..."
docker build -t dns-server -f Dockerfile.DNS .

# Remove contêiner DNS antigo (se existir)
docker rm -f dns-server 2>/dev/null

# Rodar contêiner DNS
echo "[*] Iniciando o servidor DNS..."
docker run --name dns-server -d --network bridge -p 53:53/udp -p 53:53/tcp dns-server

# Build do Web
echo "[*] Construindo a imagem do servidor Web..."
docker build -t web-server -f Dockerfile.Web .

# Remove contêiner Web antigo (se existir)
docker rm -f web-server 2>/dev/null

# Rodar contêiner Web
echo "[*] Iniciando o servidor Web..."
docker run --name web-server -d --network bridge -p 8080:80 web-server

# Verificar contêineres em execução
docker ps
