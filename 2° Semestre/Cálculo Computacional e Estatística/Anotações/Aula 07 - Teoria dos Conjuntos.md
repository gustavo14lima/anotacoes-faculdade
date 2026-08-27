# 7. Lógica Proposicional

## 7.1 Definição de Sets

Na programação, definimos que set são conjuntos. E sets são coleções de certo tipo de dado ou elementos. Um set não possui uma ordem de organização definida, por isso, é irrelevante a sua ordenação ou buscar um elemento por indíce. Algumas características básicas dos sets (conjuntos):
- Não são ordenados
- Os elementos que eu insiro dentro do meu conjunto são únicos, ou seja, eu não posso colocar dois elementos iguais em um conjunto.
- Eu posso mudar um conjunto, mas não os elementos que estão no conjunto. Ou seja, quando eu crio um conjunto, eu posso manipular ele totalmente, posso adicionar, remover elementos e entre outros, o que eu realmente não posso é trocar o tipo de dado de um elemento desse conjunto. 

Vale ressaltar que é possível colocar mais de um tipo de dado em um conjunto, ou seja, ao mesmo tempo que eu posso ter um conjunto contendo apenas números inteiros e outro conjunto apenas tendo strings, eu posso ter um conjunto que tenha string e números inteiros (isso foi apenas um exemplo, um conjunto pode ter quantos e quais tipos de dados você quiser).

## 7.2 Dados Estruturados e Dados Não Estruturados

### 7.2.1 Dados Estruturados

Dados estruturados são facilmente identificados, pois os dados estruturados são apresentados em tabelas, ou seja, em linhas e colunas, assim facilitando a sua procura e identificação. Eles requerem menos armazenamento e possui uma fácil gestão e segurança sobre os dados.

Exemplo: Um banco de dados, excel, csv e entre outros

### 7.2.2 Dados não estruturados

Dados não estruturados já dificulda a sua identificação, pois eles não seguem um padrão de armazenamento, tipo de dados ou até tamanho, quantidade e variedade de dado de cada elemento (pontos que o dado estruturado segue a risca). Por não ter um padrão de quantidade, tipo de dado e volume, eles são mais dificies de se armazenar em linhas e colunas e também eles requerem muito mais armazenamento.

Exemplo: arquivo de foto, vídeo, aúdio e entre outros.

## 7.3 Diagrama de Euler-Veen

Vale ressaltar que uma das melhores maneiras para se representar graficamente um conjunto é com o Diagrama de Euler-Veen. Ele utiliza círculos para representar diagramas que possui nenhum elemento em comum ou até mesmo com elementos que se repetem no mesmo conjunto.

## 7.4 Conjuntos com Python

### 7.4.1  Criação de Conjuntos (sets)

Apenas para relembrar, conjuntos são coleções de dados não ordenados que podem armazenar diferentes tipos de dados, mas não podem repetir os seus elementos. Eu posso criar um conjunto (ou set) a partir de duas maneiras:

``` 
# 1° Maneira - Usando o método set
conjunto_sub20 = set(['Rin', 'Aiku', 'Karazu'])

# 2° Maneira - Usando chaves
conjunto_ubers = {'Aiku', 'Lorenzo', 'Barou'}

```

Interessante saber que com o método set ele precisa de uma lista para criar o conjunto, o que abre possibilidade de criar uma lista ou usar uma lista já criada no seu código para transformar em um conjunto. 

Um conjunto pode ser representado por uma regra que define uma característica específica dos seus elementos. Por exemplo, posso criar um conjunto apenas com números pares.

Caso queira criar um conjunto vazio, existe três formas para isso:
``` 
# 1° Forma - chaves vazias
conjunto_teste = {} # Método não eficaz, pois pode ser confundido com um dicionário

# 2° Forma - Usando o método set
conjunto_teste = set([])

# 3° Forma - usando o símbolo Ø
```

Lembre-se, que o conjunto vazio está contido (C) em todos os conjuntos.

### 7.4.2 Relação Pertence

A relação pertence é importânte para a teória dos conjuntos pois ela averigua se um elemento pertence (∈) ou não pertence (∉) de um terminado elemento. Ou seja, a pertinência é uma relação entre elemento e conjunto. 

Em python, podemos represetar a pertinência usando o `in` para pertence e `in not` para não pertence 

``` 
'Aiku' in conjunto_sub20
# Output: True -> Pois 'Aiku' pertence ao conjunto_sub20

'Shidou' in conjunto_ubers 
# Output: False -> Pois 'Shidou' não pertence do conjunto_ubers

'isagi' in not conjunto_ubers
# Output: True -> Pois 'Isagi' não pertence do conjunto_ubers
```

### 7.4.3 Relação Subconjunto

Além de eu averiguar se um elemento pertence a um conjunto, eu posso verificar se um conjunto pertece a outro conjunto. Utilizando as propriedades  contido (C), não está contido (Ȼ) para saber se um conjunto A está dentro do conjunto B, e contém (Ɔ) para saber o conjunto B está dentro do conjunto A. Exemplo:

- A C B (Todos os elementos de A estão em B).
- C Ȼ B (Os elementos dos conjuntos são diferentes).
- B Ɔ A (Todos elementos de A estão em B).

Em python usando os métodos `.issubset (ou <=)` para representar o contido e `.issuperset (ou >=)` para representar o contém

``` 
conjunto_sub20.issubset(conjunto_ubers)
# Output: False -> Sub20 não está contido (não está dentro) de Ubers

conjunto_copa_sub20.issuperset(conjunto_neo_egoista)
# Output: True -> Todos da neo egoista pertence a copa sub20
```

### 7.4.4 União 

A união, representada pelo símbolo U, é utilizada para juntar os elementos de dois ou mais conjuntos sem que repita os elementos. No diagrama de Euler-Veen, a representação dos conjuntos é além dos próprios conjuntos, a imagem (o que tem de igual entre os dois) dos dois conjuntos. 

No python, utilizamos a função `union`  ou o símbolo `|` para fazer a união

```
conjunto_sub20.union(conjunto_copa_sub20, conjunto_ubers)
# Output: todos os elementos que estão presentes em todos os conjuntos, estando presentes em todos os conjuntos ou não

conjunto_sub20 | conjunto_copa_sub20 | conjunto_ubers
```
### 7.4.5 Intersecção

A intersecção, representada pelo símbolo ∩, é a representação de um **novo conjunto** com apenas os elementos que se repetem em ambos os conjuntos. No diagrama de Euler-Veen, ele é representado apenas pela imagem (o que tem de igual entre os dois) dos dois conjuntos. 

No python, utilizamos a função `.intersection` ou o `&` para realizar a intersecção:

```
conjunto_sub20.union(conjunto_ubers)
# Output: {'Aiku'} -> O único elemento que está em ambos os conjuntos 
```

### 7.4.6 Diferença

A diferença, representada pelo símbolo -, são todos os elementos do primeiro conjunto, que não estão dentro do segundo conjunto. No diagrama de Euler-Veen, ele é apenas os elementos do conjunto da minha escolha (seguindo o exemplo acima, do primeiro conjunto).

No python, usamos o símbolo `^` ou a função `.difference()`, que aceita mais de um conjunto:

```
conjunto_sub20.difference(conjunto_ubers)
# Output: {'Rin' , 'Karazu'}

conjunto_ubers.difference(conjunto_sub20)
# Output: {'Aiku'}
```

### 7.4.7 Igualdade 

A igualdade, representada pelo símbolo de =, é usada para analisar se os elementos de ambos conjuntos são idênticos, ou seja, se todos os elementos do conjunto A são os todos elementos do conjunto B.

No python, usando o símbolo de igual `==`, igual quando iremos fazer uma comparação:
```
conjunto_sub20 == conjunto_ubers
# Output: False

conjunto_ubers == conjunto_ubers
# Output: True
```

### 7.4.8 Adicionando e removendo um elemento do conjunto

Em python, para adicionar um novo elemento em um conjunto, utilizamos a função `.add ()` e para remover, usamos a função `.remove()`

```
conjunto_sub20.add('Reo')
# Output: {'Rin', 'Aiku', 'Karazu'}

conjunto_ubers.remove('Barou')
# Output: {'Aiku', 'Lorenzo'}
```