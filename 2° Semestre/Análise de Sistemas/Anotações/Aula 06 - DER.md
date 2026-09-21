# 6. DER

## 6.1 Definição de DER

DER é uma ferramenta de apoio ao levantamento e entedimento dos requisitos, utilizado para modelar como serão armazenados os dados e, caso tenha, como será o relacionamento entre eles.

## 6.2 Modelagem de Dados

A modelagem de dados possui cinco etapas, sendo elas:
-  Identificação - Conhecer e identificar melhor o contexto do négocio;
-  Documentar - Representar todos os dados que serão uteis e também necessários para armazenar para atender as dificuldades ou necessidades do meu contexto de négocio
-  Criar - Eu começo a criar o banco de dados para armazenar os dados
-  Compartilhamento - Um dos principais pontos, o compartilhamento de dados. Vimos em banco de dados que a principal função/motivo de armazenar os dados é provover o seu compartilhamento. Dessa forma, mostramos ao usuário informações uteis e possam acarretar em uma tomada de decisão.
-  Unicidade - Garantir a organização no meu banco de dados para que existe apenas um determinado dado, ou seja, para que não exista dados repetidos. Por exemplo, em um banco, garantir que não exista dois clientes iguais.

## 6.3 Elementos de um DER

### 6.3.1 Entidade

A entidade é uma representação de algo no mundo real, em que precisa existir, ter atributos e também que faça sentido/ser relevante para o contexto do negócio. 

No DER, para representar uma entidade utilizamos um retângulo com o nome da entidade dentro desse retângulo. Em questão de comparação, o DER é como se fosse a tabela no banco de dados.

### 6.3.2 Atributos

Os Atributos são características, propriedades ou informações de uma entidade. São as informações que o sistema vai guardar de cada entidade.

Em questão de comparação, o atributo seria como se fosse um campo/coluna em banco de dados.

### 6.3.3 Ocorrência ou Instância de uma Entidade

Uma instância é um conjunto de atributos de uma mesmo elemento de uma entidade. Por exemplo, em uma entidade chamada "Aluno", teria o atributo "nome" (pois, o nome é uma característica de uma aluno) e uma instância poderia ser "Gustavo" (ou seja, o nome de um aluno poderia ser "Gustavo").

Em questão de comparação, a instância seria o registro em banco de dados.

### 6.3.4 Relacionamento

Estabelece uma relação ou associação entre uma entidade e outra, ou seja, diz que uma determinada entidade atua/depende das instâncias de outra entidade. Exemplo, uma entidade chamada empregados e empresa, os empregados possui um relacionamento com empresa, pois os empregados trabalham/possui uma relação com a empresa.

### 6.3.5 Cardinalidade

Define a numeração do relacionamento entre duas ou mais entidades. Pode ser 1 ou N, o que quer dizer que, a entidade A pode ter um elemento da entidade B e entidade B pode ter um elemento da entidade A (1:1), a entidade A pode ter um elemento da entidade B e a entidade B pode ter um ou mais elementos da entidade A (1:N) ou a entidade A pode ter ou mais elementos da entidade B e a entidade B pode ter um ou mais elementos da entidade A (N:N).

### 6.3.6 Entidade Fraca

A entidade fraca não possui uma identicada própria, ela depende de outra entidade para ser identificada. Por exemplo, livro depende de uma biblioteca ou livraria para existir. Aluno depende de uma instituição de ensino para ser identificado.

### 6.3.7 Entidade Associativa

A entidade associativa surgi a partir da cardinalidade de duas ou mais entidades definada como muitos para muitos. Para existir uma entidade associativa, precisa-se de um atributo que diferencia-se das duas entidades relacionadas, se não, ela é apenas um relacionamento de muitos para muitos. Por exemplo, em um relacionamento entre médico e paciênte, pode-se criar uma entidade associativa que guarde o horário da consulta, caso eu não tivesse a necessidade de guardar o horário da consulta, eu não precisaria criar uma entidade associativa, apenas criaria um relacionamento entre médico e paciênte.

## 6.4 Planejamento antes de criar o DER

Antes de criar um DER, é de muita utilizada seguir este planejamento:
- Identificar quais serão as entidades do seu sistema
- Identificar quais terão e quais serão os relacionamentos entre as entidades do seu sistemas
- Identificar quais serão os atributos das entidades do seu sistema
- Identificar quais serão as chaves primárias das entidades do seu sistema
- Identificar quais serão as chaves estrangeiras das entidades do seu sistema
- Identificar a cardinalidades entre as entidades do seu sistema
- Identificar, e se precisar, criar as entidades associativas no seu sistema
- Caso tenha, criar ou identificar entidades que guardam logs, históricos ou relacionados
- Identificar as tabelas auxiliares do seu sistema.