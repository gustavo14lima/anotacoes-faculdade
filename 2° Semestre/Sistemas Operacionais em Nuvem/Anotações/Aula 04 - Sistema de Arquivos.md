# 4. Sistema de Arquivos

## 4.1 Definição de um Sistema de Arquivos

Quando se trata de armazenar arquivos ou algo, é de necessário realizar uma analisar criteriosa, sendo ela:
-  A velocidade de escrita e leitura
-  A capacidade de armazenar
-  o RAID
-  E também o File System

O File System é um gerenciamento de recursos do sistema operacional que tem como principal objetivo organizar os arquivos que o usuário cria, salva ou relacionado. Vale ressaltar que cada sistema operacional possui um tipo de File System, por exemplo, o Windows possui o File System FAT e NTF, enquanto o Linux possui uma grande variedade de File System.

Além disso, no File System é guardado algumas informações vitais, como por exemplo, a partição que este File System pertence (se é NTF ou ext4) e até os metadados (metadados, são informações sobre este arquivos que não fazem parte dele. Por exemplo, os metadados informam o caminho da raiz até o arquivo, mostra todas as permissões deste arquivo e entre outro).

**Lembre-se:** tudo em Linux é um arquivo, é o que chamamos de bloco. 

A maior dor de um sistema de arquivo é a sua capacidade de armazenamento, pois caso a capacidade de armazenamento de uma instância chegar ao seu limite, fica impossível entrar na instância. Por causa que o sistema operacional está em uma constante função de escrita, como no Linux, tudo é arquivo, o sistema operacional acaba registrando/escrevendo toda ação do usuário. Dessa forma, se o sistema operacional não ter mais capacidade de armazenamento, ele não consegue mais gravar nenhuma interação do usuário com o software.
## 4.2 Sistema de Arquivos no Sistema Operacional

Tanto no Windows quanto no Linux a organiação dos arquivos baseados em disco seguem a "hierarquia de diretórios" (esses diretórios quando fala-se de GUI, são chamados de "pastas"), ou seja, em uma hierarquia de diretórios, uma pasta pode estar dentro de outra pasta que existe um arquivo dentro. Basicamente, sendo uma boneca russa.

No Sistema Operacional Linux, existem duas partições principais, sendo elas a partição de dados e a partição de troca. Por causa a existência da partição de troca, o sistema operacional Linux quase nunca fica sem mémoria.

No sistema operacional Windows, cada sistema de arquivo possui uma letra de unidade, como por exemplo, o "C:", enquanto no sistema operacional Linux, cada sistema de arquivo possui um nome de dispositivo, como por exemplo "/hda1".

## 4.3 Individualidade do Linux

Como dito antes, os sistemas operacionais baseados em Linux ou em UNIX, tudo neles são arquivos. Entrentando, existem uma particularidade, que seriam os arquivos especiais. Os arquivos especiais são a representação de diversos conteúdos, como por exemplo, os arquivos especiais englobam os dispositivos de hardware, informações sobre o sistema e até mesmo processos. 

## 4.4 Processo de Armazenamento de Arquivo

Para armazenar um arquivo no disco, primeiro fragmentamos este arquivo em partes menores, dessa forma, ele pode caber em um "slot" do seu armazenamento em disco. Imagine que em seu disco, existem várias gavetas com um limite de capacidade, para não superar esse limite e não haja perda de dados, os arquivos são fragmentados e são armazenados nessas gavetas.

Seguindo essa ideia, surgiu o **Sistema Contínuo**

### 4.4.1 Sistema Contínuo

O sistema contínuo é uma maneira que armazenar dados em um disco, ele fragmenta o arquivos em partes menores e armazena no disco sequencialmente, ou seja, todas as partes do meu arquivo precisam estar sendo armazenadas em sequência, sem pular uma "gaveta" e sem colocar outro arquivo quebrando a sequência.

O sistema contínuo leva vantagem na sua alta velocidade de leitura de arquivos, por eles estarem um seguido do outro, não precisa ficar dando voltas ou gastar tempo com procuras. Entretando, um problema que ele enfreta é em relação a apagar um arquivo do disco, pois, quando eu apago um arquivo do meu disco, eu só posso colocar algum arquivo nessa "gaveta", caso o meu novo arquivo seja exatamente o mesmo tamanho ou menor que o arquivo anterior. Pois como esse sistema armazena em sequência, eu não posso colocar um arquivo que não tenha uma gavetas suficiente ou que extrapole o tamanho da minha gaveta.

### 4.4.2 Desfragmentação de Dados

Para resolver o problema de desperdicio de espaço que o Sistema Contínuo enfrenta, surgiu a desfragmentação de dados. A desfragmentação de dados consiste em utilizar a mesma ideia de escrita/armazenamento em disco que o sistema contínuo utiliza (ou seja, guardar os arquivos em sequências dentro das gavetas). Mas, quando eu precisar apagar um arquivo, eu irei apgar todos os arquivos do disco, ou seja, irei limpar o disco e após isso, eu vou reescrever todo o disco. Dessa forma, eu elimino praticamente todas as lacunas que o Sistema Contínuo entregava.

Entretanto, a Desfragmentação de Dados enfretava um grande problema, além da grande quantidade de tempo que essa ação de apagar todo o disco e reescrever todo o disco levavá (por causa que a agulha do disco tinha que dar uma grande quantidade de voltas no disco), tinha o problema que ao fazer isso, eu acabo diminuindo a vida útil do meu disco, já que eu irei ficar "colocando dado encima de dado", dando muitas voltas com a agulha e etc., ademais, eu tinha a chance de um dos meus arquivos corromper ou ser perdido enquanto acontecia isso.

### 4.4.3 Modelo Indexado

A partir do problema que a Desframgmentação de Dados tinha, foi inventado o Modelo Indexado. Seguindo a mesma forma de armazenamento que os demais tinham, que armazenar a fragmentação do meu arquivo em "gavetas", ele trazia uma inovação na maneira de organizar. Ao invés de ser tudo sequêncial, ele trouxe o conceito de meta-dado, no qual, toda fragmentação iria vir com um "identificador" que seria como uma ordem de montagem do arquivo. Dessa forma, eu poderia colocar as fragmentações dos meus arquivos sem precisar ligar para ordem, e sim, ligando apenas na verificação se existe uma "gaveta" para armazenar esse fragmento.

A partir do indetificador, esses fragmentos iriam para a memória RAM, que com toda a sequência dos fragmentos, iria montar o arquivo. Mas, isso gera outro problema, a quantidade de voltas que o disco precisaria dar. Ele iria dar praticamente uma volta completa para achra cada fragmento (já que a montagem precisava ser em forma sequêncial, primeiro acha o primeiro fragmento, depois o segundo e assim por diante). Dando mais voltas no meu disco até montar o arquivo completo, acaba sendo mais lento e mais trabalhoso.

### 4.4.4 Tabela de Alocação de Arquivos

Para resolver o problema da alta quantidade de voltas que a agulha da disco precisa dar para achar todos os fragmentos de um arquivo, desenvolveu-se a Tabela de Alocação de Arquivos.
Com ela, eu pego uma "gaveta" do meu disco e reservo ela apenas para guardar a localização dos identificadores dos meus arquivos. Ou seja, no final do dia, essa "gaveta" reservado é como se fosse um mapa/guia que fala a localização de todos os fragmentos do arquivos que você quer.

#### "Gaveta" = Cluster

## 4.5 Diferença entre HD e SSD

O HD e o SSD são dois hardwares de armazenamento, mas com algumas diferenças. Logicamente que dependendo do usuário e da função, um se encaixa melhor que o outro. Mas, o HD possui uma vida útil e um armazenamento maior que o SSD, por causa da sua capacidade de armazenamento em disco, ou seja, ele faz um armazena as informações fisicamente. Enquanto o SSD utiliza eletricidade para a alocação de arquivos de todo sistema, o HD armazena todo no disco, usando algo fisico.

Um exemplo do por que HD armazena mais que SSD, é que quando falamos de alta quantidade de capacidade de armazenamento, os HDs são os que mais possuem essa capacidade.

Por isso, caso você seja um usuário comum em que busca agilidade em consultas de arquivos, não precisa armazenar arquivos a longo prazo e nem em muita quantidade, a melhor opção para você seria o SSD. Entrentando, caso você precise armazenar arquivos em longo prazo, não pode fazer com que eles sejam perdidos e precisa armazenar uma grande quantidade de arquivos, um HD seria a melhor opção para você. (Exemplo SSD = usuário comum | Exemplo HD = Data Center).

## 4.6 Separação entre o Linux e o Windows

Ambos os Sistemas Operacionais, Linux e Windows, entendiam e utilizavam o file system do tipo FAT (Tabela de Alocação de Arquivos), podemos dizer que ambamos andavam junto quanto se dizia a file system. Entratanto, por volta do file system FAT32, no qual a alocação de bits foi de 16 (representando o FAT16) para 32Bits, o Linux parou de utilizar o FAT.

Linux, por ter sua ideia de que tudo no sistema operacional é arquivo, precisou achar e inovar no que se diz a file system com mais segurança, permissionamento e etc. Então, vendo as limitações que o file system FAT 32 tinha relacionado  tamanho, segurança e desempenho, o linux toma a decisão e muda para o sistema de arquivos ext4. 

## 4.7 Diferença entre NTFS e ext4

Com a separação dos dois grandes sistemas operacionais a partir do file system FAT 32, cada sistema operacional começou a inovar, pesquisar e adquirir um sistema de arquivos próprios para cada um.

A Microsoft, responsável por manter e atualizar o Windows, criou o NTFS (New Technology File System), por causa das limitações e falta de recursos que o FAT entregava, no qual utiliza a mesma premissa e ideia do sistema de arquivos FAT, mas com algumas inovações e alterações. Com a vinda do NTFS, o armazenamento de informações dos arquivos, meta dados e identificadores para mais fácil construção deles, fica por parte do MFT (Master File Table), no qual é como se fosse um banco de dados que guarda todos as informações essencias do arquivo, como por exemplo, seu meta dados. Então, como resumo, enquanto o NTFS é responsável por organizar, armazenar, ler e gravar todos os dados e  arquivos no disco, o MFT é o banco de dados, que fica armazenado em um cluster, responsável por ter todas as informações sobre o arquivo, e se precisar, a ordem para a sua montagem.

Enquanto o Linux, visando em ter uma melhor escalabilidade, melhor segurança, melhor utilização de tamanho dos seus files systems e melhor desempenho, começou a utilizar o ext4. Entretanto, no sistema de arquivos ext4, temos algo chamados **inodes**, que seriam semelhante ao que temos no MFT. O inode é um tipo de arquivo no linux responsável por armazenar todas as informações sobre um determinado arquivo, como por exemplo, seus metadados, informações de tamanho, data de criação, data de última alteração e entre outros. Um comando para saber mais sobre os inodes e informações do seu arquivo, apenas coloque **stat** junto ao arquivo de sua preferência. Algumas vantagens do ext4 é a sua redução na fragmentação do sistema, a utilização de journaling (é uma técnica no qual registras as alterções pentendes em um determinado espaço antes de realmente realizar elas e armazenar no disco) e trabalhar com arquivos maiores em relação a volume.

## 4.8 RAID e EBS

Quando falamos sobre a AWS, temos o serviço mais conhecido dela sendo a EC2, mas temos além da EC2 um novo recuso e uma nova tecnológica, sendo a EB2 e a RAID.

A EB2 (Elastic Block Store) é o recurso na AWS que me permite criar e modificar os discos de armazenamento, possibilida a criação de novos discos, a alocação de novos discos em uma instância já criada e utilizada, além de permitir uma série de configurações e modificações que eu posso fazer no meu disco. Desta forma, a partir da minha EB2, eu consigo ter mais de um disco de armazenamento na mesma instância.

Já a RAID (Redundant Array of Independent Disks) é eu utilizar o recurso de alocação e criação de novos discos de armazenamento na minha instância e combinar eles,ao nível do sistema operacional,  para me entregar um melhor e um aumento de desempenho. Ou seja, utilizar RAID é como se eu pegasse dois ou mais discos no meu sistema operacional e juntar eles a nível de sistema operacional, ou seja, eu juntaria dois discos para ter um só (sendo a função dos dois discos).

## 4.9 Diferença entre um Sistema de Arquivo e um Ponto de Montagem

Enquanto um sistema de arquivo (file system) é uma estrutura responsável por toda a organização, disponibilidade e armazenamento dos seus arquivos e dados no disco, o ponto de montagem é onde todo esse sistema de arquivo é conectado para se tornar acessível para o sistema operacional.

Em outras palavras, o ponto de montagem é o diretório que o sistema operacional vai entender que terá um file system lá para fazer todo a organização, armazenamento e disponibilidade dos seus arquivos.

## 4.10 Pontos de Montagem no Linux

- /etc: diretório responsável por conter todos os arquivos de inicialização e configuração de qualquer software e aplicativo no seu sistema operacional
- /home: diretório responsável por armazenar todos os arquivos pessoais dos usuários
- /mnt: diretório responsável ser um ponto de montagem para file system temporários
- /opt:  diretório responsável por armazenar os pacotes de softwares complementares de terceiros 
- /srv: diretório responsáve por armazenar as suas aplicações back-end, ou seja, por armazenar os seus servidores que servem algo para o usuário
- /tmp: diretório responsável por armazenar arquivos temporários
- /var: diretório responsável por armazenar arquivo que deve sofrer alterações contínuas

## 4.11 Comandos para Sistemas de Arquivos

- **df** - Informa a quantidade de espaço livre em cada sistema de arquivo, além de mostrar informações como ponto de montagem, tamanho, qunatidade usada e porcentagem usada.
- **du** - Informa a quantidade de espaço em disco ocupado por cada arquivo ou diretório, caso informe um diretório, ele irá retornar a quantidade ocupada de cada arquivo presente no diretório.
- **lsblk** - Informa todos os dispositivos de armazenamento ligados ao computador, estruturado em árvore, além de mostrar informações adicionais, como o ponto de montagem.
- **findmnt** - Informa de forma hierárquica e limpa todos os file system montados no sistema.
- **mount** - Utilizando  sudo, é possível designar um diretório de ponto de montagem para uma partição. (Exemplo: sudo /dev/nvme0n1 /mnt).
- **umount** - Utilizando o sudo, eu desmonto o sistema de arquivo de forma segura do ponto de montagem específicado, desta forma, não corrompendo nenhum arquivo. 
- **mkfs.ext4** - Utilizando o sudo, eu faço uma formatação da minha partição escolhida, criando um novo sistema de arquivo, o ext4. 
- **fsck** - Utilizando o sudo, eu posso verificar e reparar blocos de partições que estão corrompidas.
- **growpart** - Utilizando o sudo, eu faço um redimencionamento na tabela de partição, desta forma, eu aviso para o sistema operacional que a partição que estou específicando, irá preencher todo espaço livre (Exemplo: sudo growpart /dev/nvme0n1 1)
- **resize2fs** - Utilizando o sudo, eu irei redimencionar o sistema de arquivo para que ele saiba também que a nova partição está utilizando todo o espaço livre.

## 4.12 SFTP Restrito

O SFTP Restrito é uma forma de comunicação entre uma instância e um computador físico, no qual, eu posso enviar um arquivo entre diferentes computadores, sem criar uma comunicação shell completa, desta forma, impedindo uma visualização completa e profunda sobre o meu sistema. A comunicação feita pelo STFP é utilizando a transfêrencia segura do SSH .

Os maiores benéficios da utilização do STFP para realizar a transfêrencia de um computador para outro, é por causa da sua segurança e limitação. Utilizando o STFP, eu preciso informar qual diretório eu irei enviar o meu arquivo, além de precisar possuir uma par de chave para realizar uma comunicação segura. Desta forma, eu asseguro que apenas aqueles que terem acesso ao meu determinado usuário possam fazer a transfêrencia, apenas aqueles que possuem o par de chave possam fazer a transfêrencia, além de que eu aspecifico o diretório para fazer a transfêrencia, assim evitando alguém acessar outros diretórios e arquivos do meu sistema.

Por utilizar o SSH como transfêrencia segura de arquivo, eu crio um ChrootDirectory, responsável por limitar a comunicação desse usuário apenas a uma determinada raiz.

### 4.12.1 Configurando o SFTP Restrito

Para configurar o SFTP Restrito, primeiro é necessário criar todo um ambiente para isso. É necessário ter um ambiente isolado para que o SFTP Restrito tenha acesso apenas ele. Eu crio um diretório normalmente e depois coloco a permissão de grupo e dono no root, para melhor utilização do ChrootDirectory. Após isso, eu crio um diretório no qual o meu usuário SFTP Restrito terá acesso total e por mim, crio o meu usuário SFTP Restrito normalmente, por fim, coloco o meu novo usuário como dono e grupo dono do diretório que ele terá acesso total.

Após isso na sua máquina, você irá criar uma par de chaves SSH, utilizando o algoritmo ed25519, após isso, irá ter que criar um local para armazenar a chave pública na sua máquina virtual e dar todas as devidas permissões para o usuário. 

Por fim, fazer a configuração no `/etc/ssh/sshd_config`, sendo:
```
Match User usuario_criado
    ForceCommand internal-sftp
    ChrootDirectory /srv/urubu
    PermitTTY no
    X11Forwarding no
    AllowTcpForwarding no
    AuthorizedKeysFile /etc/ssh/keys/urubu_sftp/authorized_keys
    PasswordAuthentication no
    PubkeyAuthentication yes
```

Desta forma, já poderemos acessar o SFTP Restrito, apenas usando o comando:
```
sftp -i ~/.ssh/par_chave usuario_EC2@IP-PUBLICO-DA-SUA-EC2
```

### 4.12.2 Comandos de Transfêrencia de Arquivos

Para você enviar um arquivo da sua máquina local para a sua máquina virtual, utilize o comando **put**. Agora, caso queira baixar um arquivo da sua máquina virtual para a sua máquina local, utilize o comando **get**. Em ambos os casos, caso queira enviar ou baixar um diretório e o seu conteúdo, apenas coloco o **-r**, após o **get** ou **put**.