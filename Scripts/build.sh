#!/bin/bash

# Construir a imagem para o servidor Web (Nginx)
docker build -t asa-dns-web ./WEB

# Construir a imagem para o servidor DNS (BIND9)
docker build -t asa-dns-dns ./DNS

# Rodar os contêineres
docker run -d -p 80:80 --name web-server asa-dns-web
docker run -d -p 53:53/udp --name dns-server asa-dns-dns
