# 8. Tipos de Relacionamento

## 8.1 Definição de Relacionamento

O relacionamento é a forma com que as classes se conectam e se interajam entre si. 
No relacionamento existem quatro tipos, sendo eles: associação, composição, agregação e herança.

Vale ressaltar que o relacionamento é feito pensando no mundo real, em uma modelagem do mundo real. Isso faz com que eu precise pensar primeiro no mundo real para depois transformar em código. Um exemplo, caso eu for realizar um relacionamento entre turma e aluno, eu preciso entender que uma turma pode ter vários alunos, e uma turma só existe quando ter pelo menos um aluno.

## 8.2 Associação

Na Associação, dizemos que as classes se relacionam de alguma forma em tempo de execução, ou seja, enquanto o código estiver "rodando", ou seja, em tempo de execução, classes que possuem um relacionamento do tipo de associação, terão algum tipo de relacionamento, não importa as regras ou condições, eles terão um relacionamento. 

No Diagrama de UML é representado apenas por uma linha reta que conecta as duas classes, mais a sua multiplicidade, ou seja, quantos objetos de uma classe pode se relacionar com a de outra classe.

## 8.3 Composição e Agregação

Na composição e agregação é um tipo de relacionamento no qual segue uma relação entre **objeto todo** e **objeto parte**. Ou seja, é um relacionamento "tem um", é como se eu dissesse: 
uma escola tem uma turma, ou seja, dentro da escola, tem uma turma.

Para implementar isso no código, nos atributos de uma classe, criamos um atributo para referenciar o objeto parte, podendo ser apenas uma variável ou uma lista de elementos, a única exceção que precisa ser atendida é que o tipo (ou seja, a tipagem) dessas variáveis precisam ser o nome da classe do seu objeto parte.

## 8.4 Diferença entre Composição e Agregação

Como visto anteriormente, na composição e agregação, temos o mesmo tipo de relacionamento, o "tem um". A única peculiaridade que diferencia um do outro, é o tipo de dependência que cada um possui com o seu objeto parte.

### 8.4.1 Peculiaridade da Agregação

Na agregação, o objeto parte pode existir livremente sem o seu objeto parte. Pode eventualmente o objeto parte se relacionar com o objeto todo, mas ele poderia existir sem o objeto todo. Por exemplo, jogador e time, um jogador pode existir sem estar dentro de um time.

No Diagrama de UML, representamos essa peculiaridade com um losango (sempre apontado para o seu objeto parte), mas o losango estando vazio.
### 8.4.2 Peculiaridade da Composição

Agora na composição, o objeto parte só existe se o objeto todo existir. Ou seja, se o objeto todo para de existir, o objeto parte também para de existir. Por exemplo, um item de um pedido não pode existir se um pedido não existir. Em resumo, na composição temos uma dependência do objeto parte com o objeto todo.

No Diagrama de UML, representamos essa peculiaridade com um losango (sempre apontado para o seu objeto parte), mas o losango estando cheio.
