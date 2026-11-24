# 9. Docker Parte 02

## 9.1 Volumes no Docker

Quando trabalhamos com Docker, ou seja, com o conceito de conteinerização, utilizando o Docker por exemplo, criamos um ambiente isolado para a aplicação ou qualquer seja o conteúdo do Docker trabalhe, desta forma, uma das vantagens do Docker, além do seu isolamento e também por ser mais leve e versátil em comparação a uma instância, o container possibilita a gente criar e remover quantos containers quisermos em um curto intervalo de tempo, dessa forma, podemos fazer o "tentativa e erro" até o container de certo.

Mas a utilização de containers tem um problema, a persistência de dados. Pelo container ser um ambiente de armazenamento efêmero, ou seja, quando derrubamos um container, todos os dados que estavam nesse container vão junto.  Para isso, temos a solução, sendo os **Volumes**.

No Docker, existe duas principais maneiras de se utilizar volumes, sendo elas:
- **Volume Docker** - Utilizando um comando e nomeando o seu volume, o Docker será responsabilizado por instalar no seu armazenamento host um diretório apenas para a persistência de dados. Ou seja, o Volume Docker gerencia e instala onde será o volume.
- **Montagem de diretório (bind mount)** - Você mesmo cria um diretório específico no qual será utilizado para a persistência de dados do seu container e você irá conectar o seu container ao seu volume.

### 9.1.1 Comandos de Volume

#### Volume Docker:

- **docker volume create nome-volume** - O Docker cria e gerencia o meu volume.
- **docker volume ls** - Listando todos os volumes que eu tenho

Para associar um container a um volume, você precisa utilizar um comando específico na criação de um novo container, como por exemplo:
- **-v mysql-data:/var/lib/mysql** - nesse exemplo, o -**v** é a flag responsável por avisar que será alocado um volume, o **mysql-data** é o volume em si, **/var/lib/mysql** é o diretório dentro do próprio container que será armazenado todos os dados. 

Vale ressaltar que cada empresa responsável pela sua imagem possui o caminho de diretórios dentro do container para realizar o armazenamento de todos os dados.

#### Bind Mount:

- **mkdir nome-volume** - Utilizando o comando padrão do Linux para criar um diretório.
- **cd nome-volume** - Utilizando o comando padrão do Linux para "entrar" dentro do diretório criado.

Para associar um container a um volume, utiliza a mesma lógica do volume Docker, alocar o volume na criação do container, apenas com uma alteração, exemplo:
- **-v "$(pwd)":/usr/share/nginx/html** - nesse exemplo, o -**v** é a flag responsável por avisar que será alocado um volume, o **pwd** é para representar o diretório em que estamos, no qual, criamos e acessamos ele anteriormente, e por fim, o **/usr/share/nginx/html** é o diretório dentro do próprio container que será armazenado todos os dados. 

Vale ressaltar que cada empresa responsável pela sua imagem possui o caminho de diretórios dentro do container para realizar o armazenamento de todos os dados.

Usando o comando "**docker network inspect volume**" eu consigo identificar a localização do volume, ou seja, onde esta associada em um diretório que é gerenciado pelo próprio docker.

### 9.1.2 Diferença entre o Volume Docker e o Bind Mount

A principal diferença entre o Volume Docker e o Bind Mount, seria enquanto o Volume Docker é gerenciado pelo próprio Docker e o próprio Docker que cria um diretório específico para armazenar seus dados, o Bindo Mount você se responsabiliza pela criação e gerenciamento do seu volume.

O bind mount pode ser um pouco perigoso por causa do extenso caminho de diretórios que pode se formar para a criação de volumes, podendo ser um pouco prejudicial para a movimentação em máquinas. 
## 9.2 Docker Network

Quando começamos a trabalhar com diferentes e mais de um container, surgi a necessidade de pelo menos alguns desses container se comunicarem. Mas, como cada aplicação está isolada em um container, não é possível realizar uma comunicação "localhost" por exemplo. Ai que entra o **Docker Network** para resolver esse problema, criando uma rede para a comunicação entre os container.

Quando criamos um container, o próprio container cria uma rede 172, mas não é muito performático utilizar o IP do container, pois ele pode mudar e entre outros fatores. 

### 9.2.1 Tipos de Rede no Docker Network

#### Bridge Network

Esse tipo de rede é a rede padrão do Docker, ela funciona como se fosse um switch virtual dentro do Docker, ou seja, quando há requisição de um container, primeiro irá para o Bridge Network, que ele irá redirecionar essa requisição para o container, de acordo com o endereço IP e porta que essa requisição possui.

#### Host Network

Esse tipo de rede proporciona ao Docker o acesso ao endereço IP da máquina Host, meio que "retirando o isolamento de rede" que o container possui. Dessa forma, esse container pode acessar todas as portas e endereços IPs que o sistema operacional host poderia acessar.

#### Dicas de Ouro

Evite utilizar o Bridge Network, desta forma, criando suas próprias redes e nomeando elas de acordo com a função de comunicação que essa rede irá suprir, assim, melhorando a organização do serviço.

Separar as redes por funções, além de sempre verificar se um container está com conexão IP, utilizando comandos, como por exemplo, **curl** ou **ping**.

### 9.2.2 Comandos do Docker Network

Para criar uma rede, utilizamos o conceito muito parecido com o de criar um volume, sendo o comando:
- **docker network create rede** - no qual, esse comando irá criar uma rede chamada "rede". 

Agora, para associar uma rede com um container, segue a mesma lógica da criação de volume, você associa a rede na criação de container. Segue o exemplo:
- **--network rede** - nesse exemplo, eu utilizo a flag "**--network**" para avisar que essa linha seria uma associação de uma rede com esse container, e utilizo "**rede**" para especificar qual rede (a que eu já criei) eu quero associar com esse container. 

Usando o comando "**docker network inspect rede**" eu consigo identificar quais container estão associados a minha rede, apenas especificando o nome da rede (nesse exemplo, sendo "**rede**"). 

Para eu utilizar a aplicação dentro do meu container, no meu navegador, eu coloco o ip do meu container junto com a porta que eu realizei o redirecionamento. Bem semelhante com o processo que fazemos com uma aplicação local.

## 9.3 Dockerfile

Quando criamos um ambiente de produção ou desenvolvimento utilizando um container com uma imagem já existente, ainda temos o problema de ter o drift configuration, como por exemplo, criação de tabelas e variáveis, eu posso usar "usuários" em uma tabela e meu amigo "usuário" o que continua com a inconsistências no ambiente.

Para resolver isso, utilizamos Dockerfile, que seria uma forma de automatizar além da criação do ambiente isolado para utilizar o container, configuramos até código base da aplicação. 

Com o Dockerfile, em qualquer ambiente ou máquina que tenha suporte para docker irá ter a mesma aplicação com o mesmo código, pois o Dockerfile já específica todas as bibliotecas e dependências que precisa ter para rodar corretamente.

O processo é o seguinte:
- primeiro é criado o manual, que seria o DockerFile
- após isso, transformamos o Dockerfile em uma imagem
- e por fim, criamos um container com essa imagem.

### 9.3.1 Criação de um Dockerfile

Vale deixar claro, que para criar um Dockerfile, eu preciso criar um arquivo chamado ***Dockerfile***, sem nenhuma extensão e exatamente com esse nome 

Para criar um Dockerfile, utilizamos alguns prefixos para a criação da nossa estrutura básica:
- **FROM** - específico qual será a imagem base desse meu Dockerfile
- **WORKDIR** - caso eu queira, eu posso criar um diretório no qual todos os meus arquivos estarão armazenados nele
- **COPY** - específico quais arquivos do meu host eu gostaria de copiar no meu container e também especifico qual será o local que eu irei armazenar essas copias.
- **RUN** - eu especifico alguns comandos que rode a instalação dos pacotes dentro do container
- **ENV** - posso criar algumas variáveis de ambiente para o meu container
- **EXPOSE** - eu específico uma porta no qual eu gostaria de deixar exposta para a internet acessar
- **CMD** - comando final que é executado quando Docker run

Após toda a configuração do meu Dockerfile, eu posso simplesmente criar uma imagem a partir do meu Dockerfile:
- **docker build –t nomeImagem .** - esse comando constrói uma imagem a partir do Dockerfile que estiver no meu diretório atual (por isso do **.**), com o nome **"nomeImagem"**.

Após isso, apenas execute a imagem para criar um container, ao invés de utilizar uma imagem do DockerHub por exemplo, utilizo a imagem que eu mesmo criei:
- **docker run –d -p 67:67 --name nomeContainer nomeImagem**

## 9.4 Docker save / Docker load

Como já vimos anteriormente, é possível criar um Dockerfile, sendo a nossa receita para o nosso container além da imagem da tecnologia que vamos usar, ter o nosso código também, e também vimos que existe o Docker Hub, uma plataforma no qual é possível puxar e colocar imagens nela (como se fosse um GitHub apenas para imagens Docker). 

Mas, para que possamos pegar ou até mesmo subir as imagens do Docker Hub precisamos utilizar alguns comandos, sendo esses, os comandos de Docker Save e Docker Load. Dessa forma. utilizando esses comandos, podemos pegar e mandar as imagens para o Docker Hub, mas antes, esses comandos transformam as imagens em arquivos compactados antes de utilizar-las como imagens. 

A partir da criação de arquivos para as minhas imagens, isso me possibilita sincronizar com a minha instância e colocar apenas o meu arquivo da minha imagem nela. Dessa forma, eu coloco a minha imagem na minha instância sem precisar acessar a internet ou qualquer meio externo. Fazendo uma CI/CD (Integração contínua / Entrega-deploy contínuo) de forma offline e manual. 

### 9.4.1 Comandos Docker save / Docker load

- **docker save -o arquivo.tar imagem** - Com esse arquivo, eu transformo uma imagem existente na minha máquina (apenas substituindo **imagem** pela imagem de preferencia) em um arquivo .tar (apenas substituindo **arquivo.tar** para o nome da sua preferencia). 
- **docker load -i arquivo.tar** - Eu pego o meu arquivo .tar (representado por **arquivo.tar**) e eu "descompacto" ele, assim, transformando o arquivo em uma imagem novamente. 

## 9.5 Docker Hub

Docker Hub é uma plataforma semelhante ao GitHub, mas ao invés de armazenar códigos ou relacionados, ele centraliza e armazena imagens, tanto as imagens bases criados e gerenciados por grandes empresas, quantos imagens especificas criadas por desenvolvedores.

O Docker Hub é bem intuitivo e semelhante ao GitHub, pois, você precisa configurar sua conta, criar um repositório para a sua imagem, deixar público (o Docker Hub disponibiliza um repositório private e ilimitados repositórios públicos) e você pode colocar sua imagem dentro do Docker Hub via linha de comando.

### 9.5.1 Comandos Docker Hub

- **docker image tag nomeImagem:1.0 meuUsuarioDocker/meuRepositorioDocker**
	- Fazer o "tag" na minha imagem docker permite além de especificar qual será o destino da imagem (como no exemplo, o repositório de qual usuário), permitir versionamento de imagens, por exemplo, 1.0, 1.1, desta forma eu posso voltar versões. Caso eu não coloque um tag, minha imagem será "latest", o que me impede de fazer versionamento.
- **docker login** - eu faço login com a minha conta docker, a partir do navegador ou linha de comando. 
- **docker push imagemDocker/repositorioDocker:tag** - eu especifico qual imagem de qual repositório eu quero "pegar".
- **docker pull imagemDocker/repositorioDocker:tag** - eu especifico qual imagem e para qual repositório eu quero mandar. 

## 9.6 Extras

- **docker run -d ...** -  O **-d**  server para desanexar os logs de inicialização do container no terminal (sem ele, toda vez que eu inicializar um container, terá todos os logs dele). Por exemplo, caso eu tirei ele, irá aparecer mensagens mostrando a situação e o que está acontecendo durante a instalação ou criação de um container.
- **docker exec -it nomeContainer** -  A partir desse ponto, qualquer comando que ser executado estará utilizando o terminal do meu container.
- **docker exec** - Executa o container
- **docker exec -it** = Executo o container de forma interativa (criando um bash por exemplo) 
- **docker logs -f nomeContainer** - Vejo os logs do meu container 
- **docker system prone -a --volumes** - Limpo tudo o que não estiver utilizando/associado
- **prune** - Limpo imagens ou volumes não utilizados