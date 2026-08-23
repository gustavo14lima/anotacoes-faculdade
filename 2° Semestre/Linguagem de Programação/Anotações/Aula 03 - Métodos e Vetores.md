# Aula 03 - Métodos e Vetores

## 3.1 Definição Método

Um método é um bloco de código criado para realizar determinada tarefa específicada pelo desenvolvedor. Se um programa fosse uma empresa, os métodos seriam funcionários, pois possuem funções diferentes e maneiras diferentes de executar cada tarefa. Ao invés de executar todo o código só no método main, podemos criar métodos diferentes para deixar mais organizado e limpo.

Para criar um método, podemos utilizar alguns elementos, sendo eles:
- public - ele modifica o acesso do método, caso seja private, apenas classes do mesmo pacote podem acessar esse método.
- static - permite utilizar o metódo na própria classe main.

## 3.2 Diferença de Método sem retorno e com retorno

Para utilizar um Método sem retorno, ou seja, que ele não precisa retornar nada, apenas ser executado, utilizamos o elemento void na sua estrutura. Exemplo:
```
public static void exibirBomDia() {
	System.out.println("Bom dia!");
}
```

Como visto, ele só executará o print, sem retornar nehum valor.

Agora, utilizar um método com retorno, utilizamos algum tipo de dado, geralmente o que tipo de dados que queremos como resposta do método, em usa estrutura. Exemplo:
```
public static Double somar (Double numero1, Double numero2){
	return numero1 + numero2; 
} 
```

Aqui, estamos específicando que o retorno do método somar será um Double, que será a soma de dois números que eu específicar.

## 3.2 Parâmetros em um Método

Um parâmetro em um método é uma variável declarada quando criamos um método. O parâmetro serve para receber dados externos durante a chamada daquele método, permitindo reutilizar o código com valores diferentes. Exemplo: 

```
public static Double somar (Double numero1, Double numero2){
	return numero1 + numero2; 
} 
```

Eu posso utilizar diferentes valores no método somar, e posso utilizar o método somar em vários outros métodos. Até posso usar um método dentro de outro método!


## 3.3 Definição de Vetor

Um vetor, ou também conhecido como array, é uma estrutura que permite que eu possa armazenar diferentes valores de um mesmo tipo de dado em uma única váriavel.

## 3.4 Declarando um Vetor

Para declarar um vetor, primeiro eu preciso decidir qual será o tipo de dado que eu irei armazenar nesse vetor. Após isso, eu coloco conchetes ([]) após o tipo de dado, após isso eu nomeio e declaro a minha variável normalmente.  Exemplo:

```
Integer[] notas; 
```

Quando criamos um vetor em Java, precisamos decidir qual será o tamanho que esse vetor terá, ou seja, quantos espaços o nosso vetor terá para armazenar dados.

```
Integer[] notas = new Integer[5];
```

Nesse exemplo, eu estou específicando que o array notas poderá armazenar apenas cinco (5) notas.

## 3.5 Inserindo valores em um array

Para armazenar alguns valores em um array, existe alguns jeitos diferentes.

### 3.5.1 Acessando o array pelo indice

```
Integer[] numeros = new Integer[5];

numeros[0] = 10;
numeros[1] = 20;
numeros[2] = 30;
numeros[3] = 40;
numeros[4] = 50;
```

### 3.5.2 Inserindo valores incializando o array

```
Integer[] numeros = new Integer[5] {10, 20, 30, 40, 50};
```

```
Integer[] numeros = {10, 20, 30, 40, 50};
```