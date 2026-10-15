# 7.Introdução a Programação Orientada a Objetos (POO) - Parte 03

## 7.1 Encapsulamento

Quando utilizamos a paradigma da programação, programação orientada a objetos, criamos alguns atributos, métodos, construtores e entre outros. Mas, quando criamos um atributo, apenas determinamos o seu tipo de dado e o nome deste atributo, por exemplo:

```
String nome;
String modelo;
Integer ano;
Double quilometragem;
```

Mas, quando fazemos desta forma, estamos deixando que qualquer outra classe ou método acesse os nossos atributos e modifique eles por completo! Por exemplo, eu posso estar criando os atributos da classe `carro` e no pacote relacionado a `pessoa` alterar os atributos da classe carro!

Vê o perigo disso? Por isso, o encapsulamento garante o controle e gerenciamento de quem pode acessar os seus métodos e atributos, desta forma, ocultando as informações importantes e confidênciais.


Ou seja, no Encapsulamento, uma das vantagens é omitir os atributos do usuário, permitindo a sua modificação a partir de métodos (garantindo uma cerca segurança com validações). Desda forma, garantindo uma privacidade e segurança em relação a modificação dos atributos.

## 7.2 Conceitos de Encapsulamento com a Classe

Alguns conceitos e padrões para a implementação de encapsulamento em class são:
-  Você não pode deixar a mostrar os seus parâmentros
-  E você deve deixar os seus métodos a mostra

## 7.3 Getters e Setters

A partir do conceito anterior, vimos que não podemos deixar os atributos a mostra, ou seja, não podemos permitir acesso direto aos atributos. Então, como vamos editar ou acessar eles? É aí que entra o conceito de Getters e Setters!

Quando "privatizamos" os nossos atributos, precisamos criar getters e setters para eles, que seriam métodos que tem como objetivo modificar (setter) e acessar (getter) o seu  atributo. Mas, podemos colocar algumas validações no nosso setter para que realmente aquela classe que está chamando o método setter possa modificar o atributo. 

Assim, não dando acesso direto ao atributo e sim a partir do setter, criamos uma camada a mais de segurança e validação!

## 7.4 Modificadores de Acesso 

Os modificadores de acesso são como se fosse camadas de proteção para o atributo ou método. De início, utilizaremos quatro deles, sendo:
- private (-):  Apenas a classe pode acessoar os Atributos ou/e Métodos
- default(~) - Todas as classes no mesmo pacote pode acessar os Atributos ou/e Métodos (vem como valor padrão quando criamos uma variável e não especificamos o modificador)
- protected (#) - Todas as classes do mesmo pacote podem acessar os Atributos ou/e Métodos, além de que, classes que são heranças das classes do mesmo pacote, podem acessar.
- public (+) - Permissão total, tudo e todos podem acessar os Atributos ou/e Métodos.

## 7.5 UML

O UML é um dito de Diagrama Estrutural responsável por ser uma representação e padrão visual dos atributos e métodos que devem possuir na classe, além de específicar também o escapsulamento de cada atributo e método.  

Um exemplo de como criar um UML é, utilizando um retângulo, utilizando o nome da classe como lista, além de ter uma separação ao meio no retângulo, sendo para os atributos (primeira parte), no qual especifica o nome do atributo e o seu encapsulamento, e os métodos (segunda parte), no qual especifica o nome do método e o seu encapsulamento.  Vale ressaltar que em ambos é especificado a tipagem e o encapsulamento. 