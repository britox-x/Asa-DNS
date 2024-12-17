# Asa Proxy DNS

## Descrição
O **Asa Proxy DNS** é uma infraestrutura baseada em containers Docker que configura um **proxy reverso** com o Nginx e um **servidor DNS primário** utilizando o BIND. O projeto automatiza o processo de criação, exclusão, início e parada dos serviços necessários para rodar a infraestrutura. Ele foi desenvolvido para atender a uma rede de servidores, onde o proxy reverso encaminha as requisições para os servidores de aplicação, enquanto o servidor DNS gerencia as resoluções de nomes para o domínio `asa.br`.

## Estrutura do Projeto
- **Proxy Reverso (Nginx)**: Um servidor Nginx que atua como proxy reverso para encaminhar requisições HTTP para os servidores de aplicação.
- **Servidor DNS (BIND9)**: Um servidor DNS configurado com zona de resolução direta para o domínio `asa.br`, com registros A e CNAME.
- **Automatização de Serviços**: Scripts para facilitar a criação, exclusão, início e parada dos serviços Docker, proporcionando agilidade na gestão da infraestrutura.
- **Web**: Um servidor web simples com uma página de exemplo.

## Requisitos
- **Docker**: Para gerenciar containers.
- **Docker Compose**: Para orquestrar os containers e facilitar o gerenciamento da infraestrutura.

## Como Rodar
### 1. Clone este repositório:
   ```bash
   git clone https://github.com/britox-x/Asa-proxy.git
