# 5. UML e Caso de Uso

## 5.1 Definição de UML

O UML  é uma linguagem focada na modelação de qualquer sistema, pois nele temos um encontro de várias linguagens de diagramas, utilizadas para especificar, estruturar, documentar e validar toda a parte do sistema. Ele é sustentada pela OMG, um conjunto de empresas grandes e famosas com o objetivo de sustentar e também de investir no UML. 

Vale ressaltar que a origim do UML não é diferente de outras inovações, ele veio com a necessidade de padronizar os diagramas, pois cada empresa tinha um jeito e uma organização diferente para criar seus diagramas.

O UML é fortemente amparado em conceitos de Orientação a Objetos, mas não está preso a este conceito. Ou seja, o UML é apoiado na Orientação a Objetos, mas você pode utilizar os diagramas e conceitos de UML em qualquer outro projeto. Os diagramas do UML são divididos em dois grupos: Estruturais e Comportamentais. 

## 5.2 Diferença entre Diagrama Estrutural e Diagrama Comportamental

O Diagrama Estrutural foca nas estruturas estáticas e nos relacionamentos do sistema. Um forte exemplo de um Diagrama Estrutural é o Diagrama de Classe, que vimos muito em Linguagem de programação. Sua função é determinar todos os atributos e métodos que uma determinada classe terá, além de todos os relacionamentos entre as classes. Dessa forma, apresentando como será a estrutura de uma classe e como ela pode se relacionar com outra classe.

Por outro lado, o Diagrama Comportamental, é um diagrama voltado para a operação do sistema, ou seja, como o sistema irá funcionar, quais ações e funcionalidades o meu sistema terá. Um grande exemplo desse tipo de Diagrama é o Diagrama de Caso de Uso, que nele é apresentado as funcionalidade que cada autor pode exercer dentro do sistema. 

## 5.3 Diagrama de Caso de Uso

### 5.3.1 Definição de Diagrama de Caso de Uso

O Diagrama de Caso de Uso é um diagrama mais geral e informal, utilizado principalmente na fase de levantamento de requisitos comportamentais do sistema. Ele é utilizado desde o início até a modelagem do sistema, e também, é sempre consultado no decorrer do desenvolvimento do sistema. Ele possui uma linguagem mais informal para que cada usuário, desde o cliente para a validação até o desenvolvedor possam entender e analisar o que quer ser expressado sem muita dificuldade ou dúvida.

Sua principal função é apontar quem serão os autores do sistema e suas funcionalidades, ou seja, o que cada usuário ou até mesmo o que cada sistema fará e quais ações ele irá fazer. O Diagrama de Caso de Uso não foca em detalhamento e nem em ordem de execução, ele foca apenas em documentar quais serão as principais ações e funcionalidades que determinado autor terá.  Neste modo, eu apresento quais serão as partes em que o meu sistema irá ter uma interação com o meu usuário ou até mesmo com outro sistema, e defino muito bem qual será o escopo do meu projeto. 

Apenas refornando, o Diagrama de Caso de Uso não precisa conter alguns elementos de interatividade, por exemplo "após o usuário clicar no botão", "aqui o usuário será redirecinado" ou relacionados, o diagrama foca em apresentar as principais funcionalidades que o usuário poderá fazer, sem ter muito detalhamento (a parte de detalhamento pode ser feita em outro diagrama) e não precisa ter uma ordem de execução, ou seja, essa funcionalidade vem primeiro que essa. 

### 5.3.2 Construição de um Diagrama de Caso de Uso

#### Autor 

Na construção de um Diagrama de Caso de Uso, geralmente, a primeira coisa que é definida é o autor. O autor é uma representatividade de um papel de determinado usuário, ao invés de eu representar o Geraldo, um Gerente, eu represento o meu autor como Gerente ao invés de Geraldo. Além disso, o autor também pode representar não humanos, como por exemplo, as funções que determinada parte do meu sistema pode fazer. Ele é representado por um simples boneco de palito.  

#### Caso de Uso

Além do autor, também existe o Caso de Uso, uma elipse que representa toda funcionalidade, função ou processo em que o autor poderá fazer. 

#### Assosiação

É uma linha sólida que liga o autor até o caso de uso.

#### Limite do Sistema

Por fim, temos o Limite do Sistema, em que é um grande quadrado no qual dentro dele apresenta todos os casos de uso que o meu autor pode fazer.

#### Inclusão (include)

A inclusão representa que um determinado caso de uso inclui o outro. Ou seja, ela sempre executará após o primeiro caso de uso. Pense que após o primeiro caso de uso ser executado, ele será executado.  Um exemplo é: "para que o usuário entre no sistema, precisa-se validar se o usuário existe dentro do sistema.", o primeiro caso de uso será o usuário entrar no sistema, o include seria executado para validar se ele existe no sistema. Ele é utilizado quando precisa-se "quebrar"/dividir um caso de uso muito grande, e também quando existe mais de um caso de uso que precisa ter um include, por exemplo, para cadastrar e fazer login, primeiro eu preciso validar se o usuário exsite no sistema. Observe que eu tenho dois casos de uso que inclui apenas um caso de uso. 

Ele é representado por uma seta tracejada que aponta para o caso de uso incluído, ou seja, o complemento.

#### Extensão (extend)

A extensão indica que um caso de uso extendo outro. Utilizado para representar que o caso de uso possuí uma funcionalidade não padrão/não acontece toda hora. Ele é utilizado para representar casos opcionais, eu posso fazer ou não.

Ela é muito utilizado quando encontramos algum cenário onde temos opções, casos de decisão. Exemplo "eu posso efetuar o pagamanto com Pix ou dinheiro", nesse caso o pagamento pode ser feito com Pix (extend) ou dinheiro (extend). Observe que eu não preciso usar os dois, apenas um, por isso do ser um extend e não um include.

Ele é representado por uma seta tracejada que aponta para o caso de uso "principal", ou seja, a seta se originaliza do caso de uso extendido. 

#### Generalização

A generalização acontece quando eu preciso que um determinado autor herde alguns casos de uso de outro autor. Exemplo, eu tenho um autor que possui as funcionalidades de cadastrar, fazer login e acessar o sistema, mas eu também tenho um autor que pode fazer tudo isso e também modificar o sistema. Como nesse caso, os dois possuem as mesmas funcionalidades, eu posso fazer uma generalização do autor mais específico (segundo autor) até o mais geral (primeiro autor).

Fazemos a Generalização fazendo uma seta sólida que originaliza-se do autor mais específico (aquele que vai herdar as funcionalidades) para o mais geral (aquele que possui as funcionalidades a serem herdadas).

