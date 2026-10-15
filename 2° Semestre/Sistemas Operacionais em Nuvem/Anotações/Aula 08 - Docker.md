# 8. Docker

## 8.1 Retomada sobre Data Lake

Como vimos anteriormente, um Data Lake é a centralização de um grande volume de dados, independente de qual tipo de dado seja. 

A utilização de um Data Lake garante uma certa governança em relação as zonas (arquitetura de medalhão), pois em cada uma eu posso definir o que vão receber e como vão tratar.  Além disso, usar um Data Lake me garante uma certa persistência de dados, ou seja, eu sei onde meus dados estarão e garanto que terão uma alta disponibilidade e baixa chance de serem perdidos ou excluídos. Ao utilizar as zonas, como por exemplo, a arquitetura de medalhão, eu estarei auxiliando na análise exploratório e depois, na análise confirmatória.

As vantagens da utilização de um Data Lake, além das ditas acima, são:
- Disponibilidade
- Baixo custo
- Persistência de dados
- Escalabilidade/Dinâmica de Nuvem (por causa que, a infraestrutura acompanha a demanda)

Um conjunto de pontos que determina qual serviço da AWS você irá utilizar para armazenar seus dados, de Data Lake, está centralizado no que se diz a: **Latência e frequência de acesso**. Com isso, você pode escolher se irá utilizar um S3 ou um EB2.

## 8.2 Arquitetura Lambda (ou Arquitetura Kappa)

A Arquitetura Lambda (ou Arquitetura Kappa) é um arquitetura que tem como o objetivo separar os dados de um Big Data em três caminhos, com base na necessidade de tempo para acessar os dados e quantidade de dados:
- **Hot Path**: eu acesso os dados instantaneamente, ou seja, eu preciso acessar as linhas em tempo real.
- **Warm Path**: eu acesso os dados após um intervalo curto de tempo, como por exemplo, em segundos ou até uma determinada quantidade de minutos. Um exemplo da sua utilizada, é em dashboards.
- **Cold Path**: eu acesso os dados em um intervalo maior de tempo, por exemplo, diariamente ou mais. Um exemplo da sua utilizada é para realizar analises estatísticas.

## 8.3 Definição de Container

Um Container é uma abstração na camada do software que empacota o código do seu software junto com todas as dependências necessárias para o seu código funcionar. 

Com um container, o gap de divergência de um ambiente de trabalho para outro diminui. Pois, quando eu utilizo um container, a chance de um estar usando uma versão de uma linguagem de programação diferente da linguagem de programação do meu colega diminui consideravelmente. 

Além de que, se eu parar de criar uma máquina virtual para cada aplicação, e utilizar container, o meu consumo de componentes e meu tempo de criação acabam diminuindo por causa da praticidade e da abstração que usar um container entrega.  Ao invés de eu usar um hypervisor e um sistema operacional guest para rodar uma aplicação, eu apenas utilizo um software que gerencia os container e crio, uso, manipulo quantos containers eu quiser. Utilizar um container diminui a quantidade de kernels que estarão rodando encima do meu hardware, já que um ou mais containers podem rodar no mesmo kernel.

Em resumo, um container é o empacotamento das bibliotecas, binários e o código da sua aplicação, de uma forma padronizada, para que ela consiga rodar tranquilamente. Ela tem o objetivo de mitigar o configure drift (ou seja, o gap de versionamento já comentado acima). O Container é um serviço que funciona entre o sistema operacional e a aplicação.

É interessante dizer que, o container é efêmero, ou seja, caso eu apague com container, todos os dados que estiverem dentro dele, também serão apagados. Por esse motivo, a conteinerização de banco de dados acaba sendo um erro, pois, o container não possui uma persistência de dados como um EB2 ou uma S3, por exemplo. Um adentro, dependendo de quanto confidencial ou importante um dado é, surgi a necessidade de criar um servidor on-primisse. 

## 8.4 Diferença entre Container e Instância

A utilização de containers permite que execute quantos containers eu quiser e no compartilhando o mesmo kernel, entre si e com o usuário. Desta forma, eu não preciso ficar criando máquinas virtuais e configurando kernel para a minha aplicação funcionar, assim, fazendo com que o container gaste menos recurso de componente que uma instância, possibilitando rodar mais containers.

Além disso, vale ressaltar que cada componente roda em um container isolado, ou seja, um container não se comunica com o outro (apenas se você configurar uma rede de comunicação entre eles) e nenhum afeta o outro.

O único problema de se utilizar container é o compartilhamento de kernel com o usuário. Caso o kernel do usuário caia, todos os containers também iram cair.

## 8.4 Docker

Docker é uma ferramenta para o gerenciamento de containers. Para criar um container usando docker, primeiro você precisa ir até o registry, que seria uma plataforma onde possui vários tipos de imagens de container, como se fosse um GitHub, mas para imagens de container. Um exemplo de plataforma registry seria o DockerHub. Dependendo de qual imagem você escolher a própria empresa fica gerenciando esta imagem, como por exemplo, a imagem do mysql é gerenciada pela empresa do mysql. Quando você começa a instalar um container, a imagem vem automaticamente, então, você pode abaixar a imagem primeiro para depois começar a construir o container, ou já pode construir o container direto que a imagem já irá ser abaixada. 

## 8.5 Comandos Uteis do Docker

- **docker -v** - Analisa a versão do Docker
- **docker pull nome_imagem:versão_imagem** - você abaixa a versão da imagem (assim como foi explicado acima)
- **docker images** - você verifica todas as imagens que estão salvas na sua máquina
- **docker ps** - você verifica todos os container ativos (start)
- **docker ps -a** - você verifica todos os container desligados (stop)
- **docker stats nome_container** - você verifica o consumo de cada container
- **docker exec –it nome_container bash** - você cria um bash interativo para manipular o container
- **docker stop nome_container** - você fecha a conexão com o container
- **docker start nome_container** - você inicia o contaienr novamente 
- **docker rm nome_container** - você remove um container
- **docker rmi nome_imagem:versão_imagem** - você remove uma imagem

Agora, irei explicar o comando de criar um container, pois ele é um pouco grande:
**docker run -d -p porta_host:porta_container --name nome_container -e "CONSTANTE_SENHA=senha" nome_imagem:versão_imagem**

- docker run: comando para criar um container
- -d: cria em segundo plano
- -p: especifica a porta, sendo primeiro a porta que vão chamar no seu sistema operacional e segundo (após os dois pontos) a porta que o seu container precisa responder.
- -- name nome_container: especificação de qual será o nome do container
- -e "CONSTANTE_SENHA=senha": você cria uma constante, semelhante ao do .env, para a senha do root do seu container
- nome_imagem:versão_imagem: nome e versão da imagem para criar o seu container