# 7. BPMN

## 7.1 Definição de BPM (Business Process Model)

O BPM (Business Process Model) é um gerenciamento de processos de negócio.  A definição de processo tem vários significados, como por exemplo:
- Um processo é um conjunto de atividades que possue uma ou mais entradas que gera uma saída de valor para o cliente;
- Um processo de negócio é o fluxo de trabalho que atendem um ou mais objetivos da organização, que no final, geram uma tipo de valor sobre a ótipica do cliente;
- Processo é um conjunto de atividades que podem ser feitas por humanos ou máquinas para alcançar um ou mais objetivos.

Com isso, podemos juntar tudo isso é afirmar que um processo é o conjunto de atividades, com uma ou mais entradas, que pode ser feita por humano ou uma máquina, que no fim, precisa pode gerar algum tipo de resultado e/ou valor, tudo isso na visão do cliente.

Com o BPM eu consigo garantir efetividade e sucesso na realização do meu processo, além que, caso o meu processo estiver muito bem estruturado e elaborado, ele pode gerar um bom resultado para o meu cliente, sendo ele lucro ou até mesmo uma vantagem no que se diz competitividade comercial. 

A empresa atrvés do mapeamento de processos consegue analisar, definir, executar, monitorar e gerenciar os seus processos com mais eficiência, desta forma, conseguindo a vantagem na competitividade comercial.

Seu objetivo é facilitar a comunicação, deixar o processo em uma "linguagem padrão", para que qualquer desenvolvedor consiga entender e saber o que precisa ser feito, além de claro, retirar ambiguidades e retrabalho.

## 7.2 Definição de BPMN (Business Process Model and Notation)

A BPMN (Business Process Model and Notation) é uma notação da metodologia do gerenciamento processos de negócio, que tem como objetivo entregar ícones padrões e algumas outras regras para conseguir desenhar, da melhor maneira, como funcionaria o fluxo de um processo. A OMG e a ABPMP são as empresas, sem fundo lucrativos, responsáveis por continuar, acrescentar boas práticas e orientações no BPMN. 

Empresas que mantém esse tipo de ferramente, possuem a responsabilidade de organizar e padronizar as devidas ferramentas para que sejam entendidas globalmente, independente da sua localização. Ferramentas como DER, Diagrama de Caso de Uso e o BPMN, são ferramentas que são padronizadas por empresas, para que, independente de onde estejam os desenvolvedores, eles entendam tudo!

Esta etapa da modelagem é super importante na parte de automação, pois nela é onde eu consigo entender e descobrir melhor os meus processos, além de observar pontos em que são possueis uma melhor otimização. Além disso, o BPMN dá suporte para a regra de negócio, por que dependendo da regra de negócio, eu irei precisar de um processo específico ou mais rigído.

Pode-se dizer que, a criação de um fluxo de processo, ou seja, de um BPMN é uma específicação do caso de uso (ação e/ou funcionalidade) do Diagrama de Caso de Uso.

Vale ressaltar que a junção do DER com o BPMN é são as duas ferramentas que mais daram suporte em relação a regra de negócio do sistema.

Além disso, é importante ressaltar que a BPMN é um processo linear.

## 7.3 Notação de um BPMN

### 7.3.1 Objetos de Fluxo

Os objetos de Fluxo são:
-  As representações de início e fim do fluxo de um processo ("bolinha" verde e vermelha);
-  Os quadrantes de tarefa (quadrante normal) e de subprocesso (quadrante com uma quadrado com uma cruz)
-  Losangos:
	-  Estrutuda de Decisão (Losango com um "X") - É uma forma de dizer que uma ação pode ter mais de um resultado de acordo com uma condição 
	-  Estrutuda de Paralelo (Losango com um "+") - É uma forma de representar que uma ação pode acontecer simultaneamento junto com outra ação.

### 7.3.2 Objetos de Conexão

O objeto de conexão é uma seta que possui ponta indicanto o próximo processo que irá ser realizado.

### 7.3.3 Swim lanes

Em Swim lanes temos a pool, que seria um quadrante no qual representa os nossos processos e dentro da pool, possui as Lane, que seria os quadrantes para representar os autores de cada processo. É interessante ressaltar que o conceito de autor em BPMN é o mesmo que em DER.

## 7.4 Regras da BPMN

Dentro da BPMN, existem algumas regras em relação ao desenho do fluxo de um processo, sendo elas:
- As atividades devem ser representadas por verbos no infinitivo junto com o sujeito;
- O objeto de início precisa usar um sujeito junto com um verbo no pretérito;
- No objeto de fim, usar um texto que remeta que o fluxo terminou;
- As raias devem ser usadas representar quais são as ações que determinado autor deve fazer;
- Com execção do objeto de conexão, não podemos colocar nada entre as raias;
- As atividades podem ter mais de uma entrada, mas precisam ter obrigatoriamente uma saida;
- Sistema ou Aplicação podem ser consideradas como autores.

