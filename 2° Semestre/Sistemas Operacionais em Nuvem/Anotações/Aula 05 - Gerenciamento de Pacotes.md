# 5. Gerenciamento de Pacotes

## 5.1 Retomada de Alguns assuntos

É interessante retomar alguns assuntos que foram comentados anteriormente apenas por questões de esclarecimento e também com o objeto de complementar alguns pontos.

### 5.1.1 Sistemas Operacionais

Um sistema operacional tem como objeto apenas de alocar componentes físicos, como espaço em disco, espaço na memória RAM e até a organização de threads para que um programa de computador consiga utilizar esses componentes.

Ou seja, não é o programa que utiliza os componentes, mas sim, tem o mediador sendo o sistema operacional que tem como objeto apenas organizar o que cada componente pode fornecer para um bom funcionamento de um programa. Ele apenas recebe a necessidade de componentes do programa para realizar a alocação de componentes.

### 5.1.2 Mudança de Contexto

O termo "mudança de contexto" nada mais é do que, na minha CPU eu trocar o thread que está sendo utilizado, ou seja, eu trocar o processo atual que eu estou trabalhando, para trabalhar com outro processo. Ou seja, o processo/thread que eu estou trabalhando agora é "congelado" (eu salvo o seu estado atual para trabalhar posteriormente) e começo a trabalhar com outro thread.

Isso acontece por causa da necessidade que o sistema operacional identifica.

### 5.1.3 Driver

Apenas com o intuito de relembrar, o Driver é um software que fornece informações (muitas das vezes de hardware) para que um determinado software possa controlar um hardware ou até mesmo outro programa. O Driver é como se fosse um dicionário, no qual, ele traz todas as especificações sobre um determinado hardware, por exemplo, para que os programadores não precisem fazer um programa para cada tipo de hardware.

### 5.1.4 Particionamento de Disco

Como visto antes, sabemos todos os comandos para anexar e criar um ponto de montagem de um disco em um sistema operacional. Mas, existe a possibilidade de quando reiniciarmos o sistema, o nosso disco e ponto de montagem não sejam montados automaticamente, o que faz que precisaríamos montar e criar toda vez que ligarmos uma instância.

Para suprir essa necessidade, precisaríamos configurar o arquivo ***/etc/fstab*** (file system table), este arquivo é responsável por dizer ao sistema operacional quais arquivos devem ser montados automaticamente durante o boot.

Para configurar o /etc/fstab, primeiro, precisamos pegar o ID do disco, isso é capaz graças ao comand ***blkid***. Após isso, dentro do /etc/fstab, colocamos o id do disco, seu ponto de montagem, seu filesystem (se é ext4 por exemplo), depois colocamos "defaults,nofail 0 2".

## 5.2 Serviços da AWS

Como vimos anteriormente, a AWS possui uma vasta quantidade de serviços, como a EC2 (que seria onde criamos as nossas instâncias) e o EBS (que seria onde criamos os nossos volumes). Agora existem outros serviços, como:
- **DAS (Direct-Attached Storage)**: este é um modelo da AWS em que faz com que apenas um disco pode estar acoplado há uma instância e garante que uma disco para ser anexado com uma instância apenas se estiverem na mesma zona de disponibilidade. (Este modelo é muito parecido com a vida real, já que eu não posso ter o mesmo HD em dois computadores e eu não consigo colocar um HD que está em um setor em um computador que está em outro setor). Ou seja, o DAS é responsável pela conexão entre a EC2 e a EB2. 
- **NIC (Network Interface Controller ou Card)**: a NIC é como se fosse uma placa de rede dentro da AWS, ou seja, ela é responsável por toda conexão de rede de uma EC2 e de outro recurso que precise ter a troca de pacotes. Um exemplo, é ter um HD que recebe e envia dados a partir da rede.
- **EIP (Endereço IP Elástico)**: é o IP público elástico de uma instância, seu objetivo é fazer com que a instância possa acessar a internet.

## 5.3 Diferença entre Caminho Lógico e Caminho Absoluto

O caminho lógico é uma abstração de onde um recurso estará localizado e armazenado, independentemente de sua localização física exata na infraestrutura. O caminho lógico é mais utilizado pelo sistema operacional e um exemplo do caminho lógico é o ponto de montagem.

Agora, o caminho absoluto é o endereço exato, imutável e direto de um recurso no hardware subjacente. Um exemplo seria quando anexamos um disco no sistema operacional, o "dev/nvme1n1" é um exemplo de caminho absoluto.

## 5.4 Gerenciamento de Pacotes

Algo que o Linux se diferenciou dos demais sistemas operacionais foi a introdução e utilização dos gerenciadores de pacotes.

Um gerenciador de pacote pode ser tanto um central de software quanto um comando de CLI, mas ele possui o objeto de proporcionar o usuário a manipular (instalar, configurar, atualizar, remover e etc.) pacotes.

Algumas vantagens do gerenciamento de pacotes são:
- Ele tem uma lista de todos os arquivos que tem em um pacote, o que traz como beneficio é que quando você remover um pacote, todos os arquivos relacionado há este pacote vão juntos;
- Ele atualiza prontamente os pacotes existentes sempre que surge novas atualizações;
- O gerenciador de pacotes gerência a parte de um pacote precisar de dependências, ou seja, ele instala o pacote e sua dependência juntos.

## 5.5 Definição de Pacote

Um pacote é um arquivo compactado que contém (obrigatoriamente) o executável binário, o arquivo de configuração e (opcional) as informações sobre dependências de um aplicativo (seja ele GUI ou CLI), biblioteca ou até mesmo ferramente de linha de comando. Os pacotes vieram com o objetivo de abstrair a instalação de (como por exemplo) um programa, já que antigamente você teria que acessar o README de um programa, abaixar e configurar os binários de acordo com os componentes da sua máquina e compactar e executar isso tudo.

Com esta necessidade, a Linux inicializou a sua forma de empacotamento que distribuía alguns programas a partir de pacotes para os seus usuários finais. A partir disso, cada distribuição começou a criar as suas extensões de pacotes e formas de empacotamento (como por exemplo, .deb).

Mas, vale ressaltar que para utilizar um sistema de empacotamento, você precisa ter primeiro um gerenciado de pacotes.

## 5.6 Repositórios

Quase todas as distribuições Linux possuem um repositório, que seria um local (como por exemplo, um computador) responsável por ter basicamente todos os pacotes que a distribuição possui. A distribuição pode ter sim mais de um repositório. Além disso, nos repositórios, as distribuições Linux guardam os metadados de cada pacote, guardando dados como nome do pacote, número da versão, descrição do pacote e nome do repositório e entre outros. 

Quando eu vou instalar um pacote, o meu gerenciador de pacotes primeiro interage com os metadados do repositório, pois o meu gerenciador de pacotes possui um cache local desses metadados do repositório. Caso eu queira instalar ou atualizar a versão mais atualizada de um pacote, eu posso atualizar a lista de metadados do meu cache local, assim, consultando os metadados no repositório e trazendo para o cache da minha máquina.

Para instalar um programa por exemplo, o gerenciador de pacotes analisa primeiro o cache local. Caso ele ache as informações sobre esse programa no seu cache local, ele vai até o repositório no qual está armazenado os pacotes desse programa e começa a instalar. O gerenciador de pacotes instala primeiramente os pacotes, pois, caso exista alguma dependência de pacote, o gerenciador de pacotes instala  dependência junto com o pacote. E caso você remova o pacote, o gerenciador de pacotes remove as dependências junto ou apenas avisa que existe pacotes que não estão sendo utilizados.


## 5.7 Comandos Utéis

### 5.7.1 Comandos de atualização e manutenção

- sudo apt upgrade - atualiza a lista de pacotes disponíveis (cache local)
- sudo apt update - atualiza os pacotes já instalados de acordo com a cache local
- sudo apt autoremove - remove pacotes que não são mais necessários

### 5.7.2 Comandos de instalação e remoção

- sudo apt install pacote - instala um pacote
- sudo apt remove pacote - remove um pacote (mas mantém seus arquivos de configuração)
- sudo apt purg pacote - remove um pacote junto com seus arquivos de configuração

### 5.7.2 Comandos de pesquisa e informação

- apt search nome - pesquisa pacotes com determinado nome 
- apt show pacote - mostra detalhes sobre o determinado pacote
- apt list -instaled | grew nome - lista os pacotes instalados (apt list -instaled) de acordo com o filtro do nome (|  grew nome)

### 5.7.2 Comandos com dpkg

- sudo dpkg -i pacote.deb - instala um pacote .deb manualmente
- sudo dpkg -r  pacote - remove um pacote
- sudo dpkg -L  pacote - lista os arquivos instalados pelo pacote 
- dpkg -l | grep nome - lista os pacotes instalados (dpkg -l) de acordo com o filtro do nome (|  grew nome)