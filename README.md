Projeto DNS e Web com Docker
Este projeto configura um servidor DNS usando o BIND9 e um servidor web Nginx, ambos executando em contêineres Docker. O servidor web exibe uma página personalizada enquanto o servidor DNS resolve consultas para o domínio asa.br.

Descrição do Projeto
Este projeto tem como objetivo a criação de uma infraestrutura simples usando Docker para demonstrar a integração entre um servidor DNS (BIND9) e um servidor web (Nginx). O DNS é responsável pela resolução de nomes para o domínio asa.br, enquanto o servidor web exibe uma página personalizada ao acessar o domínio através de um navegador.

Modificações e Correções Realizadas
Durante o desenvolvimento do projeto, várias modificações e correções foram feitas para garantir o funcionamento correto do ambiente:

Correção do Erro de Porta 53:

O erro "Ports are not available: exposing port UDP 0.0.0.0:53" foi corrigido. Este erro ocorre quando a porta 53 (utilizada pelo DNS) já está em uso no sistema operacional (no caso, Windows) pelo serviço de DNS Client (dnscache).
Solução: Desativei o serviço DNS Client no Editor de Registro do Windows, liberando a porta 53 para uso no Docker. Este ajuste é necessário para evitar conflitos de porta ao rodar o contêiner.
Atualização do Dockerfile:

Modifiquei o Dockerfile para garantir que os pacotes necessários (BIND9 e Nginx) fossem instalados corretamente e que as configurações de DNS fossem aplicadas no contêiner.
O arquivo index.html foi copiado para o contêiner Nginx, para garantir que uma página personalizada seja exibida.
Arquivos de Configuração do BIND9:

Ajustei o arquivo named.conf.local para definir corretamente a zona DNS do domínio asa.br, com os registros necessários para resolução de nome.
O arquivo db.asa.br foi criado para definir os registros de domínio e IP do servidor, como A e CNAME.
Automatização com Scripts:

Adicionei um script build.sh para automatizar a criação e execução do contêiner Docker, simplificando o processo de construção da imagem e execução do contêiner com as configurações corretas.