# 4. ArrayList

## 4.1 Diferença entre Vetores

Em Java possuimos dois tipos diferentes de vetores, os vetores dinâmicos e os vetores estáticos. Um vetor estático é aquele que definimos o tamanho máximo dele antes de começar a manipular ele. Exemplo

```
Integer[] vetorEstatico = new Integer[5];
```

Neste exemplo, eu criei um vetor estático que terá um comprimento máximo de 5 posições, ou seja, indo de 0 à 4. 

Agora, para criar um vetor dinâmico é necessário importar do pacote "java.util" as classes  `List<>` e `ArrayList()`. A partir da importação dessas classes, é possível criar um vetor dinâmico, no qual, eu não preciso me preocupar com a quantidade de elementos que eu irei adicionar ou remover do meu vetor.

```
List<String> vetorDinamico = new ArrayList();
```

Vale ressaltar que, o tipo de dado que eu específicar dentro do diamond, ou seja, do <>, será o tipo de dado que será a minha lista. Dessa forma, eu estarei dizendo que este vetor será tipado, terá um tipo de dado específico para este vetor.

## 4.2 Como funciona o Vetor Dinâmico?

O vetor dinâmico é inicializado com aproximadamente 10 espaços, ou seja, na criação de um vetor dinâmico, eu estou criando um vetor estático de baixo dos panos. Em outras palavras, a criação do vetor dinâmico é a abistração do redimensionamento do tamanho de um vetor estático. 

Quando eu estiver perto do limite desde  meu vetor dinâmico, o próprio `List<>` e `ArrayList()` iram redimensionar este vetor, aumentando o tamanho deste vetor para o valor inicial dele mais a metade de seu tamanho. Além de copiar todos os dados de um vetor estático para outro.

Exemplo, quando eu crio um vetorDinamico, eu estou criando um vetor estático com 10 espaços.

```
// O que você faz: 
List<Integer> numeros = new ArrayList(); 

// O que aconteceu por baixo dos panos:
Integer numeros = new Integer[10]; 
```

Quando você vai adicionando números dentro do seu vetor `numeros`, ele vai chegar um momento que fará:

```
// Vetor Estático
numeros[10] // Vetor numeros com 10 elementos
numeros[10] -> numeros[15] // Agora, o vetor numeros possui 15 espaços

// Além de fazer a copia de todos os arquivos
```

O único lado negativo de utilizar o `List<>` e `ArrayList()` é que quanto mais elementos eu vou colocando, mais é possível de eu ocupar mais memória do que eu preciso.
Por exemplo, se eu tenho um vetor dinâmico com 10.001 elementos, na minha memória estará constanto que este vetor está ocupando 15.000 espaços.
## 4.3 Comandos do ArrayList 

Vale ressaltar que diferente do vetor estático, o vetor dinâmico mostra os seus elementos normalmente ao utilizar o comando `System.out.println();`, tendo uma saida bem semelhante ao do JavaScript (Exemplo: [2, 3, 4]). Diferenciando-se do vetor dinâmico por não mostrar o endereço de memória.  

### 4.3.1 Adicionando um elemento novo no vetor dinâmico:

```
 numeros.add(6); // Uso o método add para adicionar no vetor dinâmico
```

Lembrando que o método `.add()` utiliza o sistema de filas, ou seja, o primeiro a entrar, é o último a sair.

### 4.3.2 Acessando indices no vetor dinâmico

Para acessar um indice no vetor dinâmico, eu utilizo o método `.get()`.

```
 numeros.get(0); // Pegando o primeiro elemento do vetor
```

Para pegar o último elemento do vetor, utilizamos a mesma lógica das demais linguagens de programação, pegamos o tamanho do vetor e subtraimos um. Para isso, utilizamos o método `.size()` que retorna um número inteiro representando o tamanho do vetor.

```
 numeros.get(numeros.size() - 1); // Pegando o último elemento do vetor
```

### 4.3.3 Removendo um elemento no vetor dinâmico

Para remover um elemento, utiliza-se o método `.remove()`, em que ele aceita um indice específico e também um objeto.

```
 vetorDinamico.remove(2); // Removo o elemento no 3° indice
 vetorDinamico.remove("Cleiton") // Procuro no meu vetor o elemento "Cleiton" e                                      se tiver, eu removo.
```

Atenção a um ponto de suma importância, o método `.remove()` remove o primeiro elemento que ele achar, por exemplo, esteja específicando um nove. Caso no seu vetor tenha dois elementos exatamente iguais, ele removerá apenas o primeiro, ou seja, o que tiver menor indice.

No exemplo de vetor de números inteiros, caso eu específique no parametro do método `.remove()` que eu quero remover o 2:

```
 numeros.remove(2);
```

Ele acabará removendo o 3° elemento do vetor. Pois, quando eu coloco um número inteiro dentro do parametro deste método, ele entende que é um tipo de dado `int`. Caso eu queira remover o elemento que seja o `2`, eu teria que criar uma variável do tipo `Integer` para ai sim colocar dentro do parametro.

### 4.3.4 Atualizando um elemento do vetor dinâmico

Para atualizar um elemento do vetor, utiliza-se o método `.set()`. No qual eu preciso específicar dois parametros, o primeiro sendo a posição/indice e o segundo o novo elemento que eu quero substituir.

```
vetorDinamico.set(1, "Lima"); 
```

No exemplo acima, eu estou substituindo o elemento da segunda posição por "Lima".

### 4.3.5 Criando um vetor imutável

Ao criar um novo vetor dinâmico, ao invés de eu inicializar um `ArrayLis()`, eu posso colocar um os elementos que eu quero que já existão no meu vetor , usando apenas o comando `List.of()`. Apenas colocando os elementos que eu quero dentro do parametro do `List.of()`.

```
 List<Integer> numerosImutaveis = List.of(4, 5, 6);
```

Desta forma, eu crio um vetor que é imutavel, eu não posso modificar os elementos dentro dele. Ou seja, ele terá esses elementos para sempre.

### 4.3.6 Outros métodos

O `ArrayList()` e o `List()` possuem alguns métodos muito semelhantes ao do JavaScript, como por exemplo os métodos `indexOf()` (que retorna a posição de um determinado elemento), `constais()` (que retorna um booleano, representando se um determinado elemento existe ou não dentro de um vetor) e entre outros métodos.

## 4.4 Particularidades do List<>

Como abordado anteriormente, é possível tipar um vetor dinâmico apenas específicando o tipo de dado que eu quero dentro do diamond (<>). Mas na verdade, a tipagem é a partir da específicação de objetos, ou seja, eu uso objetos para especificar o objeto. Por esse motivo que usando tipos de variáveis do tipo wrapper eu faço a a tipagem do meu vetor. Funciona não apenas com variáveis do tipo wrapper, mas usando outros tipos de objetos, como por exemplo, aqueles criados pelo próprio desenvolvedor (exemplo, utilizando conceitos de programação orientada a objetos). 