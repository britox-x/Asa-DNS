#!/bin/bash
docker build -t asa-dns .
docker run -d -p 53:53/udp -p 53:53/tcp --name asa-dns-container asa-dns
