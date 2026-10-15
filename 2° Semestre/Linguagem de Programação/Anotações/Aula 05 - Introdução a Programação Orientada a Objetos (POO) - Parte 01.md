# 5. Introdução a Programação Orientada a Objetos (POO) - Parte 01

## 5.1 Introdução

De maneira geral, a programação Orientada a Objetos é um paradigma da programação (modos diferentes de desenvolver soluções para problemas), em que se consiste na utilização de conceitos de objeto para a representação de entidade do mundo real. A sua principal função é simplificar e resumir blocos de códigos ou repetivios de forma de quebra-los em blocos menores.

Por exemplo, imagine um código em que você precisa criar vários usuários. Ao invés de criar infinitas variáveis para armazenar as informações dos seus usuários, você utiliza uma classe que já cria tudo isso para você!

## 5.2 Classe

### 5.2.1 Conceito de Classe

Como dito anteriormente, uma classe é uma forma de abstrair a criação de uma entidade do mundo real. Ao invés de criar uma variável para o nome, idade e entre outros, eu posso armazenar todas essas informações em uma classe para que eu possa criar mais usuários usando a mesma classe, já que as informações sempre serão as mesmas.

Em resumo, pense que uma classe seria uma molde para a criação de uma nova entidade. Caso queira criar um usuário, use a molde para criar um usuário. Dessa forma, você segue um padrão. igual receita de bolo, se você usar o mesmo molde de bolo, todos os seus bolos terão os mesmos tamanhos, mudando apenas o recheio, cobertura e etc.

### 5.2.2 Conceito de Atributo

Quando criamos uma classe, precisamos definir alguns atributos. Os atributos nada mais são que características que a sua classe precisa ter.

Imagine que você está criando a classe **usuário**, usuário precisa de um **nome**, **idade**, **cpf** e assim por diante. Observe isso são características do usuário? São informações que diferenciam os usuários. Assim, concluindo que isso são os atributos!

Continuando no exemplo do bolo. Sabemos que a classe é o molde para criar o bolo, então, os atributos podem ser informações como **sabor**, **cobertura**, **tipo de bolo** e entre outras informações. Assim, vamos especificar que para criar um bolo, primeiro precisamos informar o tipo de bolo, seu sabor e qual será sua cobertura.

### 5.3.3 Conceito de Método

Seguindo a mesma linha de raciocínio, classes são moldes para a representação de entidades do mundo real. Dependendo da entidade que queremos representar, essa entidade pode realizar algumas **ações**.

Vamos criar um carro, para a criação do carro, vamos usar um molde (classe), que vai especificar a fabricante, nome, velocidade e modelo (ou seja, nossos atributos). Esse carro pode fazer algumas ações, como por exemplo, acelerar, ligar e entre outros. Essas ações seria os métodos da nossa classe carro.

Geralmente, um método pode modificar algum valor de atributo, como por exemplo, se tivermos um atributo **quilometragem**, quando realizarmos a ação (chamar o método) **acelerar**, por resultado, a quilometragem do carro irá aumentar.

## 5.3 Objetos

A partir do momento em que já sabemos como criar um molde para uma entidade, específicando as caracterisitcas e ações que ela vai ter, precisamos realmente dar a luz a essa entidade, ou seja, criar uma entidade. É neste momento em que entra o conceito de objeto. Objeto nada mais é, em programação orientada a objetos, que o instânciamento de uma classe.

Imagine que temos toda a planta de um carro, ou seja, temos o molde de como fazer ele, todas as caracterisitcas que ele vai ter e todas as ações que esse carro vai poder fazer. Colocar a mão na massa e desenvolver o carro a partir da planta, é instâncar uma classe. A classe sendo o plano/molde do carro e o objeto sendo o carro feito.