# 2 - Gerência de Recursos

## 2.1 Definição

Na programção de computadores, o gerenciamento de recursos são as técnicas utilizadas para gerênciar recursos de um computador, aqueles componentes com disponibilidade limitada. Alguns programas de computadores podem realizar esse gerenciamento de seus próprios recursos, utilizando recursos expostos por linguagens de programação ou até mesmo por um host, ou seja, o sistema operacional ou uma máquina virtual gerenciando recursos de um computador.

Um gerenciameto de recursos baseado em um host é conhecido como rastreamento de recursos, e se consiste em limpar/liberar recursos, quando um recurso já foi utilizado, ele não será liberado, mas sim, ficaram ativos inoperantes. 

Existem algumas técnicas no gerenciamento de recursos, uma delas sendo a fuga de recursos, no qual, eu espero um recurso terminar de utilizar um processo, para que quando ele finalizar, eu utilize para outro processo, assim, utilizando esse recurso sem muita perda de tempo.

Com isso, podemos afirmar que a recuperação de recurso é semelhante a coleta de registros por parte da memória RAM. Em muitos casos, o sistema operacional recupera um recurso logo após o processo fazer a chamada do sistema de saída.

## 2.2 Definição de Recurso

Os recursos em um sistema operacional são todos os hardwares e softwares que precisam ser referenciados em um computador para funcionar e ser utilizado pelo usuário. Assim cada recurso tem suas regras e funcionalidades específicas que permitem o seu gerenciamento.

## 2.3 Incialização de um sistema operacional

Tudo começa com a inicialização do hardware e do sistema, assim a BIOS carrega e analisa se todos os componentes físicos estão em bom estado para pelo menos o sistema operacional poder ser utilizado. Após isso, vem as duas partes do boot loader. Após isso temos algumas funcionalidades do sistema operacional, como por exemplo, carregar o kernel do armazenamento em disco para a memória RAM, processos de INIT e prompt do usuário. 

## 2.4 Maneira de como o sistema operacional gerencia os recursos

O sistema operacional gerencia alguns recursos, sendo eles:

### 2.4.1 Gerenciamento de processador 

O sistema operacional distruibui a capacidade do processador entras as aplicações, garantindo assim que uma aplicação não monopolizasse o recurso do processador. Garanti que cada processo e aplicação tenha um tempo de uso do processador, para que funcione corretamente e garante que um processo utilize 100% do processador, dando espaço para outros processos usarem o processador.  Garantir que cada processo utilize um número de ciclos de processador para realizar suas tarefas sem que tenha perca de eficiência ou utilizar mais ciclos que o necessário.

### 2.4.2 Gerenciamento de memória e armazenamento 

Fornece um espaço na memória para cada processo, garantindo que um processo não compartlhe ou utilize o mesmo espaço na memória que outros processos ou do kernel do linux. Caso um processo utilize mais memória RAM que o computador possui, o sistema irá alocar os processos em uma memória segundária, chamada de memória SWAP (memória virtual).  Cada processo precisa de uma quantidade de memória RAM minima para ser executado. O processo não pode ser alogado no mesmo local que outro processo e outro processo não pode ser alogado no mesmo espaço de memória que esse processo. 

### 2.4.3 Gerenciamento de dispositivos

O sistema operacional interage com cada dispositivo por meio de drivers e cria modelos que permitam agrupar vários dispositivos distintos sob a mesma interface de acesso. O caminho para que acontece a comunicação entre o hardware e o sistema operacional passa pelo Driver. O Driver funciona como um tradutor entre o hardware e uma linguagem de alto nível do sistema operacional e aplicativos. Cada dispositivo/hardware possui um hardware específico, mas a maioria dos drives são executados quando o dispositivo é acionado. Quando o sistema operacional identifica que um novo dispositivo entra em contato, ele dá prioridades para os drives desse dispositivo para que ele possa acessar o hardware do próprio computador. Entrada e saída está ligado com filas e buffers.

### 2.4.4 Gerenciamento de arquivos

O objetivo dele é criar arquivos e diretórios, definindo as regras de utilização e o permissionamento deles. Ele cria uma hierarquia dos diretórios, define os caminhos de acessos para cada diretório e arquivo. Implementa o sistema de arquivos para o gerenciamento, cria algumas cópias de segurança e permite a desfragmentação de disco.