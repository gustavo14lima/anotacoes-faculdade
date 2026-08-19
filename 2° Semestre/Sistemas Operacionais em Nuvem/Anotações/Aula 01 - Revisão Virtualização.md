# 1. Revisão Virtualização

## 1.1 Finalidade dos Sistemas Operacionais

Um sistema operacional atua como um facilitador intermédiario na manipulação, entre o usuário do computador e o hardware do computador.  O principal objetivo do sistema operacional é facilitar e promover um ambiente melhor para que o usuário a utilize e execute os softwares de maneira mais fácil, convicente e eficiente. 

O sistema operacional é carregado na memória RAM após um programa de inicialização (o sistema operacional se encontra na memória de disco), ele gerencia o fluxo de informações para e a partir do processador principal. Um sistema operacional pode ser um GUI (Graphical User
Interface) ou um CLI (Command Line Interface) ou até mesmo ambos.

O verdadeiro cérebro de um computador é o sistema operacional, e não a CPU/processador. Pois a CPU apenas faz o papel de processar as informações, enquanto o sistema operacional é responsável por todo o gerenciamento de componentes, fluxo de informações e relação do hardware e usuário.

## 1.2 Shell

O Shell é o interpretador de comandos em um sistema operacional. Quando utilizamos o terminal e colocamos o comando `cd Documents`, o shell interpreta esse comando e manda a informação para o kernel do sistema operacional (o "coração do sistam operacional"), que ai sim, ele realizará o comando digitado pelo usuário. 

## 1.3 Arquitetura de um Sistema Operacional

Um sistema operacional, em uma forma padronizada, podemos dizer que segue a seguinte arquitetura:
- Hardware - Onde eu encontro todos os dispositivos ísicos e controladores de dispositivos
	- Exemplo: Memória RAM, SSD, Placa Mãe e etc.
- Sistema operacional - Aqui encontramos várias particularidades, como por exemplo:
	-  Drivers de dispositivos - caso o driver esteja desatualizado, o sistema operacional não irá reconhecer o periferico ou até memso software que você deseja utilizar.
	- Código de inicialização - Verificação de todos os componentes físicos e testes para validar se é possível subir o sistema operacional
	- Núcleo - Ponte fundamental para a interação entre o hardware e o software. Nele temos várias particularidades interessantes:
		- Gerenciador de Tarefas - É uma ferramenta no sistema operacional responsável por monitorar e manipular serviços, processos e programas.
		- Gerência de Proteção - É o conjunto de regras do sistema operacional que controla o acesso e permissionamento de usuários em serviços, processos e programas.
		- Gerência de Arquivos - É uma ferramenta no sistema operacional capaz de manipular de todas as maneiras arquivos e diretórios no computador.
		- Gerência de Memória - É uma função do sistema operacional que controla a memória RAM, ela decidi qual espaço as variavéis e arquivos vão ocupar.
		- Protocolo de Rede - É o conjunto de regras que definem a forma como os computadores iram compartilhar dados entre eles. Funcionando em um idioma TCP/IP para organizar o envio e recebimento dos dados, organizar os endereçamentos e correção de erro de mensagem.
		- Gerência de Energia - É um recurso no sistema operacional que controla a utilização de energia no hardware. Ela faz de tudo para o computador utilizar menos energia: reduz a velocidade do processador, desativa telas inativas e entre outros.
- Software - Seriam os aplicativos do sistema operacional.
	-  Exemplo: Word, Visual Studio Code, Intellij IDE e etc.

Quando iremos fazer um gerencimanto de atributos em um computador, precisa-se essecialmente conter pelo menos os quatros componentes principais:
- CPU/Processador
- Memória RAM
- Memória Disco/Armazenamento
- Rede

## 1.4 Hypervisor

O Hypervisor é o principal software para a virtualização. Pois seu principal objetivo é gerenciar os recursos físicos do sistema operacional host para o sistema operacial guest, ou seja, a máquina virtual, possa usar. 
Existem dois tipos de Hypervisor ou virtualizadores:
- Hypervisor tipo 1 (Hipervisor Bare-Metal)- Esse Hypervisor tem acesso diretamente no hardware de um computador. Esse Hypervisor não precisa de nenhum sistema operacional para que ele funcione, pois o próprio Hypervisor tipo 1 possui um sistema operacional leve para o gerencialmente de instâncias. Ele pode gerenciar e alocar recursos nas máquinas virtuais sem precisar de um sistema operacional. Por não ter um sistema operacional host para ser executado, ele se torna mais seguro. 
- Hypervisor tipo 2 (Hipervisor Hospedado)- Esse Hypervisor é um programa que precisa ser instalado em um sistema operacional host. Assim como os outos tipos de programa em um computador, o Hypervisor não possui acesso direto nos componentes físicos de um computador, dessa forma, o administrador do sistema operacional precisará alocar os recursos. Por ter que passar no sistema operacional host para atender uma requisição, a latência pode aumentar para atender uma requisição do próprio sistema operacional host. Além disso, ele é totalmente dependente do funcionamento do sistema operacional host.

Conclua-se que o Hypervisor do tipo 1 é mais focado para data-center e empresas grandes, enquanto o Hypervisor do tipo 2 é melhor para teste de sistemas operacionais para desenvolvedores ou curiosos no mundo dos sistemas operacionais.

## 1.5 Máquinas Virtuais

As máquinas virtuais são ambientes virtuais que simulam um computador físico em formtado de software. Ela possui vários arquivos fundamentais para o seu funcionamento, como por exemplo,o a própria configuração da máquina virtual, os componentes virtuais (como por exemplo, armazenamento) e algumas capturas instantâneas da máquina virtual que preservam o seu estado em um determinado ponto no tempo. 
