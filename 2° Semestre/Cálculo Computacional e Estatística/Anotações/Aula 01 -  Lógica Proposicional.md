# 1. Lógica Proposicional

## 1.1 Definição

A lógica proposicional é um ramo da lógica que trabalha com sentenças declarativas, ou seja, são sentenças que possam ser respondidas com "verdadeiro" ou "falso". Ela é a base da lógica matématica e da computação e, também, utiliza conectivos para formar preposições compostas.

Um grande exemplo de para que serve a lógica proposicional, é na área da programação, em estruturas de decição (como if e else) e em laços de repetição, no qual, ambos precisam esperar que uma determinada condição seja verdadeira para que possa ser executada ou não. Além disso, podemos enxergar sua utilidade em circuitos lógicos, em portas lógicas como AND, OR, XOR e entre outras.

Exemplos de frases de lógica proposicional:
-  O notebook é novo
- Pedro é um estagiário e Amélia é gerente de projetos
Em resumo, a lógica proposicional precisa ter sentenças verdadeiras ou falsas, mas nunca ambas.

## 1.2 Conectivos

Antes de explorar os conectivos, é de suma importancia entender algumas informações, como diferenciar uma preposição de um conectivo.
O conectivo nada mais é que a ligação entre as suas preposição. Exemplo:
- Eu estudo e passo na prova.
Aqui é nos apresentado duas proposições:
- Estudar
- Passar na prova
Elas estão ligadas por um conectivo (do tipo de conjunção).

### 1.2.1 Conjunção

O conectivo de conjunção nada mais é que o "E" da linguagem de programação e das portas lógicas. Ou seja, para uma sentença é verdadeira quando ambas as proposições são verdadeiras.
Exemplo:
- Eu entendo **e** domino a matéria.
Essa sentença é verdadeira apenas se eu entender e dominar a matéria. Caso eu não entende ou não domine a matéria, ou até mesmo ambos, essa sentença passa a ser falsa.

Aqui temos a representação da tabela verdade do conectivo de conjunção

| p   | q   | p ∧ q |
| --- | --- | ----- |
| V   | V   | V     |
| V   | F   | F     |
| F   | V   | F     |
| F   | F   | F     |
### 1.2.2 Disjunção Inclusiva
O conectivo de disjunção inclusica funciona como o "OU" da linguagem de programação e das portas lógicas. Um das preposições precisam verdadeira para a sentença ser verdadeira.
Aqui temos a representação da tabela verdade deste conectivo:

| p   | q   | p ∨ q |
| --- | --- | ----- |
| V   | V   | V     |
| V   | F   | V     |
| F   | V   | V     |
| F   | F   | F     |

Exemplo de uma sentença com o conectivo de Disjunção Inclusiva:
- Eu jogo de Aiku **ou** de Don Lorenzo.
### 1.2.3 Disjunção Exclusiva
O conectivo de disjunção exclusiva é uma das mais diferentes da linguagem de programação, mas conhecida nas portas lógicas, pois ela se assemelha a porta lógica XOR. Ela a sentença é verdadeira apenas quando uma exatamente uma das preposições for verdadeira. Não pode ser ambas e nem nenhuma, apenas uma.
Aqui temos a representação da tabela verdade deste conectivo:

|p|q|p ∨ q|
|---|---|---|
|V|V|F|
|V|F|V|
|F|V|V|
|F|F|F|

Exemplo de uma sentença com o conectivo de Disjunção Inclusiva:
- **Ou** eu assisto Horimiya **ou** eu assisto Tonikawa Kawaii.

### 1.2.4 Condicional
O conectivo condicional é um caso diferente. Nela a sentença só vai ser verdadeira na maioria dos necessários, uma excessão é caso a segunda preposição for falsa. A seguir, apresentarei um exemplo para explicar melhor:
- A rua está molhada, **então** choveu.
Nesse exemplo, a rua pode estar molhada por que chouve, mas a rua pode estar molhada não obrigatoriamente por causa da chuva, e sim, por outro fator externo. Em outras palavras, a rua pode estar molhada por outra coisa além da chuva, o que mostra que a sentença é falsa, por que a rua estar molhada não é obrigatoriamente um resultado da ação da chuva.
Aqui temos a representação da tabela verdade deste conectivo:

| p   | q   | p → q |
| --- | --- | ----- |
| V   | V   | V     |
| V   | F   | F     |
| F   | V   | V     |
| F   | F   | V     |

### 1.2.5 Bicondicional
Aqui temos o último conectivo, que é outro caso diferente. Nesse conectivo, ambas as preposições precisam ser iguais para o resultado ser verdadeiro. Ou seja, para uma sentença ser verdadeira as suas preposições precisam ser ambas verdadeiras ou ambas falsas.
Um exemplo:
- Eu jogo Azure Latch, **se e somente se**, eu jogar de CM.
Aqui, eu só vou jogar se eu jogar nessa posição específica.
Aqui está a tabela verdade deste conectivo:

| p   | q   | p ↔ q |
| --- | --- | ----- |
| V   | V   | V     |
| V   | F   | F     |
| F   | V   | F     |
| F   | F   | V     |
