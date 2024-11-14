Correção do Erro: "Ports are not available: exposing port UDP 0.0.0.0:53"
Erro encontrado: Ao tentar executar um contêiner Docker que utiliza a porta 53 (UDP), recebi o erro de que a porta não estava disponível, 
pois já estava em uso por outro serviço no sistema Windows. 
Esse problema geralmente ocorre porque o serviço DNS Client (dnscache) utiliza essa porta para cache de consultas DNS, o que impede o Docker de utilizá-la.

Solução aplicada: Desativei o serviço DNS Client diretamente no Editor de Registro do Windows. Essa abordagem avançada permite liberar a porta 53 para o Docker, 
permitindo que o contêiner use a porta sem conflitos.
