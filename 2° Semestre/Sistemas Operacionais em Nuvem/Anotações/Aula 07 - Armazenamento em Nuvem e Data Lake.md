# 7. Armazenamento em Nuvem e Data Lake

## 7.1 Tipos de armazenamento na AWS

Como vimos anteriormente, a AWS possui a EB2, que é um armazenamento diretamente atracado, por ser atracado, ele pode estar apenas em uma instância e estar na mesma zona de disponibilidade da instância, por causa do DAR. Vale ressaltar que a EB2 possui uma alta velocidade de leitura e gravação e é diretamente conectada a EC2.

Mas, existe outros serviços e maneiras de armazenar arquivos e dados na AWS, sendo eles a S3 e o NAS.

### 7.1.1 S3 (Simple Storage Service)

A S3 (Simple Storage Service) é um serviço da AWS que é um armazenamento de objetos. Ele não possui POSIX (ou seja, ele não possui uma convenção de comandos Linux ou inspirados em C), o que resulta em que para pegar e enviar dados (permissões, inodes e etc.) para a S3 você terá que fazer requisições do tipo HTTP.

Algo a se tomar cuidado referente a S3 é que, ela armazena uma quantidade de dados e arquivos maçante por um baixo preço, mas a única coisa a se tomar cuidado é referente ao tempo de reposta. Pois cada tipo de S3 tem um tempo para receber e para enviar arquivos, por isso, caso você precise de um rápido resposta de dados (como por exemplo, instantâneo), previra uma EC2. 

Por armazenar uma grande quantidade de arquivos por baixo preço, ele é o mais escolhido para a realização de backups. E possui uma boa escalabilidade.

### 7.1.2 NAS 

NAS é um serviço da AWS em que é um armazenamento atracado à rede, ou seja, é um volume em que pode ser compartilhado com mais de uma instância por causa da rede. Ou seja, toda para gravar ou analisar um arquivo, os dados deste arquivos precisam passar pela rede para que o arquivo seja montado no volume da sua instância ou no volume do NAS. Mas no final do dia, o NAS acaba sendo uma EB2 que possui uma conexão com a rede.

### 7.1.3 EFS e FSX

Dentro do serviço do NAS temos o EFS e o FSX, que seriam serviços de file system para o NAS.Pelo NAS ser um volume que está conectado a rede, ele precisa possuir um ponto de montagem, precisa ser anexado e até mesmo precisa de um file system para que você possa utilizar o volume da NAS.

A grande diferença entre o EFS e o FSX é que, o EFS utiliza o file system do tipo ext4, e o FSX utiliza os demais tipos de file system.

Para fazer a comunicação de volumes, ou seja, para eu escrever e utilizar o NAS, eu preciso utilizar um dos dois file system acima (EFS ou FSX) para que eles façam uma comunicação TCP de acordo com o ponto de montagem. Ou seja, tudo o que estiver no ponto de montagem "a" do NAS, estará no meu ponto de montagem "a" e vise-versa. Isso acontece por causa do middleware, que faz uma ponto que a comunicação entre a minha instância e o NAS aconteça. 

### 7.1.4 Amazon File Cache

O Amazon File Cache segue uma ideia semelhante a EC2, ou seja, é um volume que pode ser atracado em uma instância, mas possui o diferencial que contém uma velocidade de transferência mais rápida que a EC2, mas é por um preço mais alto que a EC2.

## 7.2 Definição de um Data Lake

O Data Lake é um repositório centralizado para o armazenamento de grandes volumes de dados, sendo eles estruturados (aqueles que eu não preciso processar para manipular), semi-estruturados e não estruturados (aqueles que eu preciso fazer um tipo de processamento para manipular). Ele possui algumas zonas preparadas, com o intuito de que em cada zona tenha uma estrutura de dados que atenda a necessidade de cada usuário, por exemplo, em uma zona eu já posso ter os dados em um json prontos para irem para um dashboard e em outra zona eu posso ter um csv para fazer uma análise. 

## 7.3 Arquitetura de um Data Lake

Como dito anteriormente, um Data Lake possui algumas zonas preparadas, sendo principalmente três (vale ressaltar que o nome das zonas não importa, pode ser Raw, Clean, Curated ou Bronze, Prata e Ouro, entre outros, o que realmente importa é a função que cada uma entrega).
- **Primeira camada**: a primeira camada tem como o objeto apenas receber os dados. Ela possui uma característica que eu não posso deletar nenhum dado desta camada, apenas com o intuito de preservar e ter um backup dos dados.
- **Segunda camada**: a segunda camada tem o objetivo de realizar um tratamento dos dados para servirem para uma análise e tomada de decisão. Aqui é realizado uma limpeza, transformação e integração dos dados, assim, deixando eles padronizados e bonitinhos.
- **Terceira camada**: a terceira camada tem o propósito de servir uma análise mais avançada e uma extração de valor dos dados. Esta camada é mais utilizada para descobrir padrões, tendências e insights relevantes para o negócio. Ou seja, esta camada os dados já precisam estar prontos para entrar em uma dashboard, por exemplo, para já gerar um insight para alguém.

Para realizar um Data Lake, eu utilizo a S3 (por causa do seu baixo custo e alta capacidade de armazenar dados). No S3 eu posso criar três buckets (o que é mais recomendado por causa de política e governância) ou posso criar um bucket com três prefixos. Com o objetivo de exemplificação, imagine que criar três buckets seria criar três diretórios na diretório "/", e criar um bucket com três prefixos seria criar um diretório no diretório "/", mas com mais três diretórios dentro dele.

## 7.4 Conectando uma S3 com uma EC2

Após a criação e configuração de uma S3 e de uma EC2, para fazer com que a EC2 possa utilizar da S3 apenas é preciso modificar a função do IAM (Identity and Access Management), que seria um serviço da AWS que permite você manipular e criar políticas sobre o acessos de recursos de uma determinada conta. Após você escolher uma IAM em que a sua EC2 e sua S3 possam compartilhar seus recursos, usando o comando aws s3 ls, você irá listar todos os buckets conectados na sua conta.

## 7.5 Comandos úteis

É possível criar e manipular a S3 via CLI, apenas usando alguns comandos:
- **aws s3 mb s3://nome_bucket** - eu crio um bucket
- **aws s3 ls s3://nome_bucket --recursive --human-readable** - lista o buecket e os seus objetos de uma forma mais humanizada
- **aws s3 api put-object --bucket <nome_bucket> --key <nome_prefixo>** - crio um prefixo dentro do meu bucket
- **aws s3 rb s3://nome_bucket --force** - forço a excluir um bucket
- **aws s3 rm s3://://nome_bucket/nome_prefixo/nome_arquivo.txt** -  excluo um arquivo específico de um prefixo específico de um bucket específico
- **aws s3 cp s3://nome_bucket_2/nome_arquivo.txt s3://nome_bucket_2/** - copio um arquivo de um bucket para colar em outro bucket
- **aws s3 sync /home/usuario/dados/ s3://nome_bucket/** - eu utilizo o comando sync para fazer uma sincronização entre os arquivos de um diretório específico da minha máquina, com o bucket. Vale ressaltar que é possível fazer isso entre dois buckets ou fazer de um bucket para minha máquina física.

É interessante ressaltar que os comandos do aws s3 seguem uma lógica parecida com os comandos linux, o que torna mais fácil saber o que cada comando faz.

## 7.6 Configurar o acesso da S3

Para criar uma ETL em python ou até mesmo para utilizar o "aws s3", eu preciso realizar uma configuração de credenciais da minha conta aws para o meu python por exemplo. Para isso, terei que pegar as credenciais em ***.aws/credentials*** e pegar os dados das seguintes linhas:
- aws_acess_key_id
- aws_secret_acess_key
- aws_session_token

Para verificar se a configuração ocorreu de maneira correta, apenas utilizo comando ***aws sts get-caller-identity***, que este comando irá retornar algumas informações sobre sua sessão.

Vale ressaltar que as credenciais que capturamos do ***.aws/credentials*** podem atualizar quando desligamos e inciamos a AWS. Por isso, sempre verifique se as credencias estão corretas antes de executar algo.

Para usar as credencias no python, iremos utilizar dois importes, sendo o ***boto3*** e o ***io***. A partir disso, iremos fazer a seguinte configuração:

```
import io, boto3

session = boto3.Session(
	aws_access_key_id=AWS_ACCESS_KEY_ID,
	aws_secret_access_key=AWS_SECRET_ACCESS_KEY,
	aws_session_token=AWS_SESSION_TOKEN,
	region_name="regiao_s3",
)

s3_client = boto3.client("s3")
bucket_name = "seu-nome-do-bucket"
response = s3_client.get_object(Bucket=bucket_name, Key=file_key
s3_client = session.client("s3")
```

A partir disso, o seu python já estará conversando corretamente com a S3.
