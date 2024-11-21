# Base da imagem
FROM ubuntu:latest 

# Atualiza repositórios e instala dependências
RUN apt update -y && \
    apt install bind9 dnsutils -y

# Copia arquivos de configuração para o contêiner
COPY named.conf.local /etc/bind
COPY db.asa.br /etc/bind

# Ajusta permissões
RUN chown bind:bind /etc/bind/named.conf.local /etc/bind/db.asa.br

# Expõe as portas necessárias
EXPOSE 53/tcp
EXPOSE 53/udp

# Define o ponto de entrada para o contêiner
ENTRYPOINT ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf"]

# Parâmetros adicionais do contêiner
CMD ["-u", "bind"]

# Saúde do contêiner (opcional)
HEALTHCHECK CMD nslookup localhost || exit 1
