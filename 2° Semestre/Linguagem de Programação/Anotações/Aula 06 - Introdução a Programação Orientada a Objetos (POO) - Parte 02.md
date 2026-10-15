# 6. Introdução a Programação Orientada a Objetos (POO) - Parte 02

## 6.1 Vida útil de um objeto 

Quando criamos um objeto, ou seja, instânciamos uma classe usando o **new**, nãos sabemos quando iremos parar de utilizar esse objeto, ou seja, quando esse objeto não será mais chamado ou usado. Desta forma, essa falta de saber quando destruir um objeto gera um problema de ocupação de memória sem realmente estar utilizando um objeto.

A partir deste problema, é criado o **Garbage Collector** (coletor de lixo), que nada mais é que um processo do **Java RunTime** que é executado periodicamente verificando quais são os objetos que estão sendo realmente utilizados no projeto. Caso ele ache algum objeto que foi instânciado, mas não destruido, e já está a um bom tempo sem ser chamado ou utilizado, ele destroi esse objeto. Desta forma, o Garbage Collector resolve o problema de ocupação de memória sem usar o objeto. 

## 6.2 Construtor

Um construtor é bastante parecido com um método, mas ele não é um método. A principal diferença entre um construtor e um método é que um método eu posso chamar ele quantas vezes eu precisar ou quiser, enquanto o construtor, eu chamo apenas quando eu preciso, literalmente, construir o meu objeto.

Voltando aos nossos exemplos, para criar um carro, eu primeiramente crio um molde para o carro (crio uma classe para criar o carro), defino algumas características que este meu carro terá (crio a lista de atributos que a classe precisa ter) e crio as ações que esse molde poderá realizar (crio todo os métodos que a classe pode fazer). Com isso, eu tenho o meu molde praticamente completo! Mas, como eu utilizo este molde? É aí que entra a parte do construtor!

Algumas particularidades do construtor é:
-  ter o mesmo nome da classe 
- não retornar nada

Para criar um construtor, é simples. Apenas execute o construtor e coloque os valores dos atributos dentro do seu parâmetro. Por exemplo, imagine que você tem um construtor para criar um carro, sendo que os atributos desse carro são: `nome`, `modelo`, `ano` e `quilometragem`. No seu arquivo `Main` você irá instânciar um objeto chamando o seu construtor e passando os valores dos parâmetros na ordem! Exemplo:

```
Carro uno = new Carro("Fiat Uno", "Uno", 1971, 672.3);
```

No código acima, eu já criei o meu objeto iniciando ele com os valores para os seus atributos! Mas para isso, precisariamos configurar o construtor, que para isso criariamos um código semelhante a este:

```
public Carro(String nome, String modelo, Integer ano, Double quilometragem) {
	this.nome = nome;
	this.modelo = modelo;
	this.ano = ano;
	this.quilometrage = quilometrage;
}
```

O que este código está dizendo? Que os valores recepidos pelo o parâmetro serão os valores para os atributos deste arquivo!

## 6.3 Construtores Sobrecarregados

Da mesma forma que podemos criar um método sobrecarregado, ou seja, criar o mesmo método mudando apenas os parâmetros, é possível fazer a mesma coisa com um construtor. Para fazer isso, apenas modifique os parâmetros do construtor! Dessa forma, eu posso ter um construtor para cada atributo, ou para uma série específicas de atributos. Assim, eu não fico preso em utilizar apenas o construtor cheio.

## 6.4 Palavra-chave this.

A utilização da palavra this é de suma importância quando se trata de construtores. A palavra-chave this é uma forma de diferenciar os atributos dessa classe com as variáveis do parâmetro do construtor. Observe o exemplo:

```
public Carro(String nome, String modelo, Integer ano, Double quilometragem) {
	this.nome = nome;
	this.modelo = modelo;
	this.ano = ano;
	this.quilometrage = quilometrage;
}
```

Neste exemplo, estamos falando que o atributo da classe, `nome` (representado pelo `this.nome`) receberá o valor que está vindo do parâmetro do construtor, `nome`. Caso eu quisesse, eu poderia trocar o nome das variáveis do parâmetro do construtor, ficando algo semelhante a isso:

```
public Carro(String nome_carro, String modelo_carro, Integer ano_fabricacao, Double quilometragem_carro) {
	nome = nome_carro;
	modelo = modelo_carro;
	ano = ano_fabricacao;
	quilometrage = quilometrage_carro;
}
```

Além disso, eu posso utilizar a palavra-chave this para chamar um construtor dentro de um construtor! Como utilizamos um construtor por classe, apenas colocando o this mais os parâmetros, já funciona! Exemplo:

```
Carro() {
	this("Fiat Uno", "Uno", 1971);
}
```

Neste caso, eu chamei o construtor para instânciar uma classe, apenas utilizando a sobrecarga de construtor e o this!