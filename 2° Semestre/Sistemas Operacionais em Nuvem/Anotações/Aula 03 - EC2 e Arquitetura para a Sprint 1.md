# 3 - EC2 e Arquitetura para a Sprint 1

## 3.1 Regime de Responsabilidade

O modelo de Regime de Responsabilidade define quem e em qual nível de infraestrutura você está atualmente. Ele também define quem é responsável por gerenciar e manter cada camada do ecossistema de TI, se  a própria empresa ou uma provedora de nuvem. A matriz de responsabilidade, vai desde ter a posse de um servidor, até mesmo fazer o gerenciamento da sua  aplicação. Abaixo, apresentarei alguns pontos sobre a Matriz de responsabilidade:
- Networking - infraestrutura de rede física e lógica.
- Storage - Dispositivos de armazenamento de dados. 
- Server HW - Os servidors físicos (geralmente alguns racks ou um monte de computador físico)
- Virtualização - Camada que divide os recursos físicos para as máquinas virtuais
- Servers - Sistemas operacionais ou serviços que processam as requisções
- Banco de Dados - Sistema de gerencialmente e armazenamento estruturdado de dados 
- Segurança e Interações - Regras de barreira, firewalls e entre outros.
- Runtimes - Ambientes de execução e bibliotecas necessárias para rodar os códigos
- Aplicações - Softwares e interfaces que os usuários finais utilizam diretamente

## 3.2 Arquiteturas do Regime de Responsabilidade

Existe quatro (4) arquiteturas de regime de responsabilidade, sendo:
- On-primece - é uma arquitetura no qual o cliente/empresa precisa ter tudo, desde o servidor físico, com os seus dispositivos de armazenamento, até as aplicações para o seu serviço.
	- Exemplo: DataCenters
- IAAS (Infraestrutura como Serviço) - aqui começamos a entrar em um arquitetura em nuvem. A IAAS é uma arquitetura disponibilizada pelos provedores de nuvem, pois elas apenas entregam um sistema virtualizado para você, onde apenas possui o sistema operacional e você é responsável por fazer o restante das coisas. 
	- Exemplo: AWS
- PAAS  (Plataforma como Serviço)- outra arquitetura em nuvem onde o provedor já lhe entrega algumas outra funcionalidades, além de o servidor estar por conta do provedor de nuvem (assim como o IAAS), no PAAS o provedor também é responsável pelo banco de dados, segurança e runtimes, ou seja, você apenas cria a sua aplicação que o restante o provedor assegura.
	- Exemplo: TOTVS
- SAAS (Software como Servilo) - última arquitetura em nuvem, no qual, o provedor assegura todos os pontos da matriz de responsabilidade, você apenas utiliza os serviços que a aplicação do SAAS tem a te oferecer.
	- Exemplo: Netflix
Uma observação é, quanto mais você deixa o provedor ter controle dos pontos da matriz de responsabilidade, além de ficar mais caro, você tem menos controle, permissão de alteração, possibilidade de modificar algo e etc.

## 3.3 Provedores de nuvem

Provedores de nuvem como Azure, AWS e até o Google Clound Plataform, além de fornecer o serivdor para que você configure, manipule e etc., assim como foi abordado na arquitetura IAAS, esses provedores de nuvem tem mais presença no requisito de ser um provedor de nuvem. Quando um provedor de nuvem possui mais presença, o serviço tem mais disponibilidade e maior quantidade de servidores espalhados pelo mundo.

Quando se cria um provedor de nuvem, você possui um monte de racks ou computadores para virtualizar mais computadores para os seus clientes, com base na quantidade de recursos que o seus computadores tem. Com isso, é preciso ter algo chamado de **Zona de Disponibilidade**, que seria não ter apenas uma fonte de energia, um provedor de internet, um sistma de refrigeração e etc. Pois, caso um caia, toda os seus computadores iram cair também, assim, você não terá uma grande disponibilidade para os seus clientes.

Por isso, de acordo com a AWS, para um bom provedor de nuvem, você precisa ter pelo menos três (3) zonas de disponibilidades, ou seja, três fontes de energia, três provedor de internet, três formas de refrigeramento e entre outros pontos. 

**Região** são o conjunto de zonas de disponibilidade, ou seja, são onde todos os servidores se encontram. Por exemplo, o Leste da Virginia é considerado uma região. Para escolher uma região para ter uma instância de um provedor de nuvem, você precisa considerar alguns pontos, sendo os principais o preço e a latência.

Vale ressaltar que, zonas de guerra, paises com infraestrutura precaria, regiões com altos indices de desastres naturais, são regiões que não tem ou que não compensam ter servidores.

## 3.4 EC2

A EC2 (Amazon Elastic Compute Cloud) é um serviço web que permite que você aumente ou diminua a quantidade de recursos de uma máquina virtual em nuvem. Essa é um dos benéficios da AWS, pois permite fácil escalabilidade para os desenvolvedores. Você pode obter e configurar a capacidade da máquina a partir da EC2. Ela te entrega um vasto controle sobre os recursos computacionais, além dos diferentes sistemas operacionas (lembre-se, quanto mais recurso, mais você paga). A EC2 diminui o tempo para obter e inicializar uma nova instância e permite escalar rapidamente a capacidade da sua instância, claro, conforme a capacidade e recursos físicos que você tem.

Vale ressaltar que a AWS utiliza um conceito chamado de Preço sob demanda (On-Demand Pricing), que seria você paga pela quantidade de tempo que você possui com a sua instância ligada ou rodando, e pela quantidade de recursos que você pega. Ou seja, eu vou estar pagando pela quantidade de hora que eu utilizo uma instância (semelhanta ao conceito usando em Lan-House) 

## 3.5 Diferença entre Instância e AMI

A AMI (Imagem de Máquina na Amazon) é um modelo que contém uma configuração de software (como por exemplo, um sistema operacional). Com uma AMI, eu posso criar e utilizar uma instâcia, que essa instância é uma cópia de determinada AMI. Pense que uma AMI é um modelo de instância já configurada, ou seja, já possui sistema operacional, componentes para ser usada, tudo, você apenas cópia essa AMI para uma instância para que você possa utilizar ela. Você pode criar e usar várias instâncias a partir de uma mesma AMI. Caso uma instância morra ou tenha algum erro, você pode subir uma nova instância a partir da mesma AMI ou de uma nova AMI.

Uma instância é um nova mais refinado para máquina virtual. Uma máquina virtual precisa de componentes virtualizados a partir de componentes físicos de uma máquina física real. Você precisa utilizar um virtualizador. 

Para conectar em uma instância de um provedor de nuvem, você pode utilizar o protocolo de comunicação SSH, que utilizando a internet para acessar o rack ou máquina do provedor onde se encontra a sua instância. 

Para criar uma instância em um provedor de nuvem, você primeiramente escolhe qual será o sistema operacional da sua instância, configura todos os componentes que deseja que sua instância tenha (disco, processador, memória RAM), depois disso, você configura a chave de acesso, que seria um par de chaves (seria a chave que possibilida que você utilize o protocolo SSH para se comunicar com a sua instância. Esse metodo é mais seguro que utilizar um token), configura o perímetro de rede (quais IPs vão acessar sua instância).  