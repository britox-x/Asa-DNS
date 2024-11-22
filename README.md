Projeto DNS e Web com Docker
Este projeto configura um servidor DNS usando o BIND9 e um servidor web Nginx, ambos executando em contêineres Docker. O servidor web exibe uma página personalizada enquanto o servidor DNS resolve consultas para o domínio asa.br.

Descrição do Projeto
O objetivo deste projeto é criar uma infraestrutura simples utilizando Docker para demonstrar a integração entre um servidor DNS (BIND9) e um servidor web (Nginx). O servidor DNS é responsável pela resolução de nomes para o domínio asa.br, enquanto o servidor web exibe uma página personalizada ao acessar o domínio através de um navegador.

Funcionalidades
Servidor DNS: Configuração de um servidor DNS com o BIND9 que resolve consultas para o domínio asa.br, retornando o endereço IP correto.
Servidor Web: Servidor Nginx configurado para servir uma página personalizada para o domínio asa.br.
Ambiente Docker: Ambos os servidores estão configurados para rodar em contêineres Docker, isolando o ambiente e facilitando a implantação.
Modificações e Correções Realizadas
Durante o desenvolvimento do projeto, várias modificações e correções foram implementadas para garantir o funcionamento adequado do ambiente. Abaixo estão as principais mudanças realizadas:

1. Correção do Erro de Porta 53
Um erro comum encontrado durante o desenvolvimento foi o "Ports are not available: exposing port UDP 0.0.0.0:53", que ocorre quando a porta 53 (usada pelo DNS) já está em uso pelo serviço de DNS Client do sistema operacional.

Solução: Desativei o serviço DNS Client no Editor de Registro do Windows, liberando a porta 53 para uso exclusivo do Docker. Essa configuração é essencial para evitar conflitos de porta ao rodar o contêiner.
2. Atualização do Dockerfile
O Dockerfile foi ajustado para garantir que os pacotes necessários (como BIND9 e Nginx) sejam instalados corretamente no contêiner, além de garantir que as configurações de DNS sejam aplicadas corretamente.

O arquivo index.html foi copiado para o contêiner Nginx para garantir que uma página personalizada seja exibida ao acessar o domínio asa.br.
3. Arquivos de Configuração do BIND9
A configuração do servidor DNS foi ajustada para garantir a resolução correta do domínio:

named.conf.local: Ajustes no arquivo de configuração para definir corretamente a zona DNS para o domínio asa.br.
db.asa.br: Arquivo criado para definir os registros de domínio e IP do servidor, como A (endereço IP) e CNAME (alias de domínio).
4. Automatização com Scripts
Para facilitar a criação e execução do ambiente, adicionei o script build.sh. Este script automatiza o processo de construção da imagem Docker e execução do contêiner com as configurações corretas.

build.sh: Script para automatizar a criação da imagem Docker e a execução do contêiner com as configurações de DNS e Web.
omo Rodar o Projeto
Requisitos
Docker instalado na máquina.
Acesso à internet para download das imagens Docker necessárias.
Passos para Executar
Clone o repositório:

bash
Copiar código
git clone https://github.com/britox-x/Asa-dns.git
cd Asa-dns
Construa a imagem Docker e inicie os contêineres com o script:

bash
Copiar código
cd Docker
./build.sh
O servidor web estará disponível na URL:

http://asa.br (ou http://localhost:8080 dependendo das configurações do seu sistema).
Para verificar a resolução de DNS:

Use o comando dig ou nslookup para testar se o domínio asa.br está resolvendo corretamente para o IP configurado.
bash
Copiar código
dig @localhost asa.br
Descrição dos Arquivos
Docker/Dockerfile
Este arquivo contém a configuração para construir a imagem Docker. Ele instala os pacotes BIND9 e Nginx, além de configurar o servidor DNS e o servidor web.

Docker/build.sh
Script que automatiza a criação do contêiner Docker com as configurações corretas para o servidor DNS e o servidor web. Basta executá-lo para construir e rodar o ambiente.

BIND9/named.conf.local
Arquivo de configuração do BIND9, onde a zona DNS do domínio asa.br é configurada. Ele define a resolução do domínio para os registros IP corretos.

BIND9/db.asa.br
Arquivo que contém os registros de DNS para o domínio asa.br, incluindo os registros A e CNAME necessários.

WEB/index.html
Página HTML personalizada exibida pelo servidor web Nginx. Pode ser editada para modificar o conteúdo do site.

Apresentação em PowerPoint
A apresentação em apresentacao.pptx contém uma visão geral do projeto, explicando a configuração do ambiente Docker, o funcionamento do servidor DNS e o servidor web.

Contribuições
Contribuições são bem-vindas! Se você quiser contribuir para este projeto, siga as etapas abaixo:

Fork o repositório.
Crie um novo branch para sua funcionalidade (git checkout -b minha-nova-funcionalidade).
Faça as mudanças necessárias e commit (git commit -m 'Adicionando nova funcionalidade').
Push para o branch (git push origin minha-nova-funcionalidade).
Abra um Pull Request.
Licença
Este projeto está licenciado sob a Licença MIT.Alteração de teste
