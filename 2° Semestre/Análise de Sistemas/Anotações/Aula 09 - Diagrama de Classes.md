# 9. Diagrama de Classes

## 9.1 Recapitulação UML

Como já visto anteriormente, o UML é uma linguagem especialização na construção, documentação e visualização de partes de um sistema. Essa linguagem é composta por vários Diagramas que nos ajudam a entender e estrutura da melhor forma possível cada parte do sistema. Vale lembrar que o UML é fortemente relacionado com o paradigma da programação orientada a objetos e ele é mantido e atualizado por várias empresas de grande nome, que tiveram a ideia de padronizar a criação e desenvolvimento de cada diagrama (para que, dessa forma, qualquer pessoa possa entender o diagrama de todos, mesmo que não seja da equipe ou até mesmo do pais). 

O UML é separado em dois grupos, sendo o **Estrutural** e o **Comportamental**. A função dos diagramas do tipo **Estrutural** é representar a estrutura estática e relacionamento que cada parte do sistema possui. 

## 9.2 Diagrama de Classe

O Diagrama de Classe é um forte exemplo de Diagrama Estrutural. O Diagrama de Classe possui a principal função de descrever o modelamento de cada parte do sistema, a partir de classes, métodos e atributos, será possível entender e poder enxergar o que cada parte do sistema poderá fazer. Além de ser o Diagrama mais conhecido e utilizado no UML, o Diagrama de Classe é considerado um forte direcionador para o processo de codificação, pois, a partir de um bom diagrama de classe, eu sou capaz de entender e já ter uma percepção inicial do que cada classe irá fazer. 

## 9.3 Componentes de um Diagrama de Classe

### 9.3.1 Classe

A classe é uma representação de algo no mundo real, físico ou até mesmo uma abstração de algo. Um exemplo, eu posso fazer uma classe chamada "Bolo". A partir dessa classe eu posso realizar vários tipos de bolos, utilizando a mesma "base/estrutura".

### 9.3.2 Atributo

Os atributos são utilizados para armazenar características e informações gerais de cada classe. Eles são os principais fatores que diferenciam um objeto do outro. Por exemplo, seguindo o mesmo exemplo da classe "Bolo", eu posso ter um atributo chamado "sabor", pois cada bolo tem um tipo de sabor, o que no final, será um dos pilares para diferenciar um bolo de outro.

Uma complementação, imagine que cada objeto terá um atributo que meio que "diferenciará" ele dos demais objetos, um exemplo sendo nome. 

### 9.3.3 Método

Os métodos de uma classe são ações ou modificações que essa determinada classe pode sofrer. Continuando no exemplo do "Bolo", eu possuo um atributo chamado "sabor", o que diferencia um bolo de outro, eu posso ter um método que seria "comer()", ou seja, o meu bolo (independente do sabor) pode ser comido. Dessa forma, o bolo sofre uma alteração (podendo alterar o atributo "numeroDeFatias" por exemplo).

### 9.3.4 Objetos

O objeto é o instanciamento de uma classe. Já que minha classe é o "Bolo", bolo pode ser muito abrangente, ou seja, pode existir muitos bolos. Utilizando a classe "Bolo" como estrutura, eu crio um objeto "Bolo de Chocolate".

## 9.4 Representação do UML

O UML é representado graficamente a partir de um grande retângulo separado em três partes principais:
- O nome da classe 
- Os atributos 
	- A estruturação de um atributo no UML é:
		- nível de acesso + nome do atributo : tipo do atributo
		- Exemplo: - nome: String
- Os métodos
	- A estruturação de um atributo no UML é:
		- nível de acesso + nome do método (parâmetro) : tipo do retorno
		- Exemplo: - emitirSom(): String

Caso a minha classe não tenha atributos ou até mesmo métodos, mesmo assim, eu preciso deixar evidente a separação do "bloco" de métodos ou atributos no meu UML.

Nível de acesso:
- público: representado pelo sinal (+) e esse atributo ou método pode ser acessado e utilizado por qualquer um.
- privado: representado pelo sinal (-) e esse atributo ou método pode ser acessado e utilizado pelas pelo próprio objeto.

## 9.5 Relacionamento entre Classes

### 9.5.1 Cardinalidade

A cardinalidade representa a multiplicidade, ou seja, quantos objetos da minha classe podem relacionar com os objetos dessa classe. Alguns dos valores para a cardinalidade:
- 1 - apenas um objeto dessa classe pode se relacionar com o objeto daquela classe
- 0..1 - de 0 até 1 objeto dessa classe pode se relacionar com o objeto daquela classe
- * - muitos objetos dessa classe pode se relacionar com o objeto daquela classe
- 0..* - de 0 até muitos objetos dessa classe pode se relacionar com o objeto daquela classe
- 1..* - de 1 até muitos objetos dessa classe pode se relacionar com o objeto daquela classe

### 9.5.2 Relacionamento Binário Simples

O relacionamento binário simples é um tipo de relacionamento geral entre duas classes, sendo representado por uma linha reta que liga as duas classes. 

### 9.5.3 Generalização/Herança

A herança é um tipo de relacionamento, sendo uma das principais características da programação orientada a objetos, o seu relacionamento acontece da seguinte maneira: 
- O elemento filho (subclasse) herda todos os atributos e métodos do elemento pai (superclasse)

Isso é feito com o objetivo de reaproveitamento de código e não precisar ficar criando os mesmos atributos e métodos que já foram escritos anteriormente. 

Por exemplo, Se eu quisesse criar uma classe Funcionario e Estudante, eu poderia criar uma classe Pessoa que irá "passar" seus atributos e métodos mais "gerais" para a classe Funcionario e Estudante, já que um funcionário e um estudante são pessoas.

### 9.5.4 Agregação

O relacionamento de agregação é um tipo de relacionamento especial, no qual, o objeto todo agrega o objeto parte. Ou seja, o objeto parte possui uma "ligação", uma certa "dependência" do objeto todo. Vale ressaltar que na agregação o objeto parte pode existir tranquilamente sem o objeto todo. Além disso, o relacionamento de agregação pode ser facilmente substituído pelo relacionamento binário simples. 

Também, quando estamos discutindo sobre agregação, é interessante ressaltar que o objeto todo tem as suas informações complementadas por um ou mais objeto parte. Por exemplo, em uma classe Playlist, as informações complementares a essa classe seriam os objetos da classe Música.

### 9.5.5 Composição

O relacionamento de Composição é bastante similar ao relacionamento de agregação, mais especificamente no relacionamento entre o objeto todo e um objeto parte. Mas, na composição a dependência pode ser um pouco mais forte, no qual, o objeto parte não pode existir sem um objeto todo. 

Por exemplo, a classe Banheiro não pode existir sem uma classe Casa, e quando a classe Casa for deletada, a classe Banheiro também vai (pegando o gancho que a classe é uma representação de algo no mundo real, se eu demolisse uma casa, eu não estaria demolindo um banheiro também?).

### 9.5.6 Diferença entre a Agregação e Composição 

A principal diferença entre a Agregação e a Composição, além de sua dependência entre o o objeto parte e o objeto todo, é a sua representação no UML.

Ambas possuem um losango sempre apontando para o objeto todo, mas na agregação, esse losango é "vazio", enquanto na composição, esse losango é "pintado", "cheio".

### 9.5.7 Associativa 

O relacionamento associativo é quando uma classe está associada ao relacionamento entre duas classes, ao invés de ser um relacionamento entre uma classe. Ela é utilizada quando existe um relacionamento com a multiplicidade muitos em ambos os lados/classes, e muito utilizando quando se precisa criar históricos ou relacionados.

### 9.5.8 Associativa com Navegabilidade

O relacionamento de associativa com navegabilidade representa que apenas uma classe pode se relacionar com outra, mas essa outra classe não pode relacionar com a classe.

(Melhor explicação): Quando eu tenho um relacionamento de associativa com navegabilidade da Classe A com a Classe B, a Classe A pode realizar diferentes métodos de acordo com a cardinalidade, mas a Classe B não pode ter relação nenhuma com a Classe A.

### 9.5.9 Relacionamento poucos utilizados

#### 9.5.9.1 Associação Reflexiva

Esse tipo de relacionamento acontece quando um objeto de uma classe pode se relacionar com um objeto da mesma classe (é como se fosse o auto relacionamento).

#### 9.5.9.2 Associação Ternária ou N-ária

Associações Ternárias são associações que relacionam objetos de mais de duas classes.

As associações ternárias são úteis para demonstrar associações complexas. No entanto, deve-se evitar utilizá-las, pois sua leitura é, por vezes difícil de ser interpretada. Por isso, utilize associação binária simples ou até mesmo associativa.

#### 9.5.9.3 Interface

O formato é semelhante ao de uma classe, mas é descrito o texto <<Interface>> e depois o nome da interface, ao invés de ter o nome da classe. 

	Interface normalmente não tem atributos, apenas métodos.