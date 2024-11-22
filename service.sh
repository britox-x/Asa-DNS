#!/bin/bash

# Verifica se os argumentos foram fornecidos
if [ $# -lt 2 ]; then
    echo "Uso: $0 <servico> <acao>"
    echo "Exemplo: $0 dns start"
    exit 1
fi

# Variáveis
SERVICE=$1  # Nome do serviço (dns ou web)
ACTION=$2   # Ação (start, stop, restart)

# Função para lidar com o serviço DNS
dns_service() {
    case $ACTION in
        start)
            echo "Iniciando o serviço DNS..."
            docker run -d --name dns-server -p 53:53/udp dns-server
            ;;
        stop)
            echo "Parando o serviço DNS..."
            docker stop dns-server
            docker rm dns-server
            ;;
        restart)
            echo "Reiniciando o serviço DNS..."
            $0 dns stop
            $0 dns start
            ;;
        *)
            echo "Ação inválida para o serviço DNS. Use start, stop ou restart."
            exit 1
            ;;
    esac
}

# Função para lidar com o serviço WEB
web_service() {
    case $ACTION in
        start)
            echo "Iniciando o serviço WEB..."
            docker run -d --name web-server -p 80:80 web-server
            ;;
        stop)
            echo "Parando o serviço WEB..."
            docker stop web-server
            docker rm web-server
            ;;
        restart)
            echo "Reiniciando o serviço WEB..."
            $0 web stop
            $0 web start
            ;;
        *)
            echo "Ação inválida para o serviço WEB. Use start, stop ou restart."
            exit 1
            ;;
    esac
}

# Identifica o serviço e executa a função correspondente
case $SERVICE in
    dns)
        dns_service
        ;;
    web)
      
