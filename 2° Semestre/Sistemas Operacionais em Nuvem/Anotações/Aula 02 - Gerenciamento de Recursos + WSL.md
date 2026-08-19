## 2.1 Virtualização

A virtualização, nada mais é, do que você representar algo virtual em seu próprio computador. Um dos grandes exemplos é a virtualização de componentes físicos (componente de armazenamento, memória, rede e processamento) para a virtualização de um sistema operacional.

A virtualização garante alguns benefícios, como por exemplo:
- Escalabilidade - Eu posso aumentar ou diminuir os componentes físicos de uma instância de acordo com a minha necessidade.
- Acessos simultâneos - Eu posso utilizar o protocolo SSH para que multiplas pessoas possam acessar uma mesma instância.
- Otimização da Infraestrutura - Ao invés de eu ter uma grande estrutura de on-premise, com uma grande quantidade de componentes físicos, eu posso ter uma separação de servidores tudo utilizando a virtualização de máquinas virtuais.

Com a virtualização é possível separar a aplicação em vários mini-blocos, assim, deixando a aplicação separada em partes para melhor controle e organização. 

Existema alguns tipos de virtualização, um deles é a virtualização isolamento total e o isloamento parcial/total com WSL:
- Isolamento total - Seria a virtualização que já vimos anteriormente, utilizando um hypervisor, que assim terá um sistema operacional guest que terá todas as suas funcionalidades e particularidades. Ele cria ambientes ambientes isolados e possui uma camada inteira de virtualização.
- Isolmento parcial - Seria um tipo de arquitetura chamada WSL, que seria Um subsistema Linux para Windows. Ele é um ambiente linux que roda junto com o sistema windows.


## 2.2 WSL

A WSL (Windows Subsystem for Linux) é um recurso Windows que possibilita que você utilize e execute um ambiente linux em uma máquina/computador que possue um sistema operacional Windows, sem que precise utilizar uma máquina virtual ou utilizar o demido dual boot. O seu objetivo principal foi permitir que um desenvolvedor possa utiliizar o windows junto com o linux ao mesmo tempo, sem interfêrencia ou perca de performance, eficiência e etc.

Com o passar do tempo, surgiu o WSL2 que trouxe como inovação a virtualização do kernel do linux em uma máquina virtual bastante leve.  O sistema operacional do linux é executado a partir de container isolados dentro da VM do WSL2. Outro benefício da WSL2 foi o aumento de desempenho do sistema de arquivos e a compatibilidade total de chamadas de sistemas Linux no Windows, em relação ao WSL 1. 

A maioria das distruições Linux individuais podem ser executadas pela arquitetura WSL1 ou WSL2.  Outra inovação da virtualização isolada particalmente é o fato de eu poder utilizar mais de um sistema operacional Linux lado a lado, posso manipular cada distribuição (atualizar, rebaixar, instalar, desistalar e entre outros) a qualquer momento, utilizando a arquitetura WSL.

As poucas diferenças entre as virtualizações isoladas parcialmente, ficam entorno do:
- a utilização de um kernel Linux real dentro de uma máquina virtual gerenciada 
- a compatibilidade total de chamadas de sistema, ou seja, o windows hospeda um kernel linux real rodando de forma isolada e ultraveloz, processando as ordens de baixo nível
- o desempenho nos sistemas operacionais Linux e Windows
- o WSL executa o kernel linux em containers isolados dentro de uma máquina virtual gerenciada

A arquitetura WSL 2 supera a WSL 1 em vários aspectos, tirando o desempenho no gerenciamento de arquivo no sistema operacional, isso pode ser resolvido apenas armazenando os seus arquivos no mesmo lugar que você armazena as ferramentas que você usa para trabalhar no seu projeto. 

A aquitetura WSL 2 está apenas disponível para windows 11 ou 10, versão 1903, build 18362 ou posterior. Para descobrir a versão do windows apenas utilize a tecla WIndows + R e escreva **winver**. Windows com a build menor que 14393, o WSL não funciona.

O WSL 2 é mais recomendado que o WSL 1, mas em alguns momentos, é recomendado que utilize o WSL 1, sendo eles:
- quando você precisa acessar e armazenar os seus arquivos de projetos no windows. O WSL 1 oferece o acesso mais rápidos a arquivos montado no Windows.
- O projeto precisa acessar alguma porta serial ou a porta USB
- Quando você possui requisitos de memórias mais rigidos 
- Quando o projeto que você está trabalhando, precisa que o mesmo endereço IP da sua máquina windows, seja da sua distruição Linux. Como o WSL 2 trabalha com máquina virtual, acaba ocorrendo uma distruição de IP para essa máquina virtual. 
## 2.3 Ambientes

Ambientes são tudo aquilo que um projeto precisa para ser desevolvido, implementado, testado e no final de tudo, sair funcionando. Nos ambientes encontramos processos, orientações, ferramentas, modelos e a infraestrutura, tudo para melhorar a criação ou manutenção de um software.
Uma infraestrutura se resumo em três grandes ambientes:
- Ambiente de desenvolvimento - É um ambiente individual e local de cada desenvolvedor, é nele onde ocorre a criação do código e repositório. Em resumo, o ambiente de desenvolvimento é a própria máquina/computador do desenvolvedor.
- Ambiente de Homologação - É aqui onde acontece todo os testes do código desenvolvidor pelos desenvolvedores. Aqui testamos se o software está de acordo com as regras de performance, disponibilidade e as regras da empresa.
- Ambiente de Produção - É aqui no qual o software fica disponivel para todos acessarem, especialmente o cliente.

## 2.4 Bônus Professor

A diferença entre distribuição stable e rolling release:
- Distribuição stable são distruições estáveis, são distruições testaveis e oficiais, caso receba alguma atualização, geralmente é apenas com o intuito de corrigir bugs e patchs de segurança, e não novas funcionalidades.
- Distruição Rolling release são distruições sem uma versão fixa ou oficial, o que significa que ela recebe atualizações de forma continua.

Todo desenvolvedor precisa de um sistema operacional confiável para trabalhar, pois caso precise ficara atualizando toda hora ou ficar mudando de sistema operacional toda hora, pode causar problemas como perda de tempo, eficiencia e também o desenvolvedor pode se confundir com peculiaridades de diferentes sistemas operacionais.

A tecnologia SLAT armazena parte dos processos na memória RAM e outra parte no armazenamento de disco. Um processo só vai ir para a memória RAM quando ele for ou irá precisar ser utilizado pelo processador.