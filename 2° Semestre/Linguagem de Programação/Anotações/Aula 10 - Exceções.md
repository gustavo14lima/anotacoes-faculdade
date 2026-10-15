# 10. Exceções

## 10.1 Definição de Exceções

Exceções são eventos anormais que acontece na execução do código que quer dizer que alguma regra de negócio ou até mesmo comportamento inesperado aconteceu. Dois exemplos clássicos de exceções são tentar acessar um índice que não existe de uma lista e também o famosos NullPointerException, ou seja, tentar manipular e utilizar uma variável que está atribuída como null.  

Vale ressaltar que uma exceção é diferente de erro. Uma exceção é um acontecimento inesperado no código, que resulta em uma parada no código, acontece na execução do código e o seu ponto chave é que, uma exceção pode ser tratada. Enquanto um erro, acontece um imprevisto dentro da VM e não é possível de ser tratado.

## 10.2 Diferença entre Unchecked Exceptions e Checked Exceptions

A Unchecked Exceptions é uma exceção que acontece durante a execução do código. Os dois pontos chaves que diferencia ela da Checked Exceptions é que ela herda a classe RuntimeExceptions e que ela não precisa ser tratada para executar um código (pois, geralmente, exceções de Unchecked são referentes a erros de lógica).

Agora, a Checked Excpetions é uma exceção que acontece duranta a execução do código. Mas possui o diferencial que, ela herda a classe Exception e que somos obrigados a tratar essa exceção. Essas exceções acontece muitas das fezes por causa de importes de algumas bibliotecas que precisa de componente físico ou de algo externo. O que resulta na necessidade de tratar a exceção, caso contrário, o código não será compilado.

## 10.3 Tratando Exceções

Para tratar uma exceção, podemos utilizar dois conceitos.

### 10.3.1 try-catch

Try-cacht é uma estrutura que irá capturar e tratar as exceções. Acontece da seguinte maneira:
- Dentro do try, iremos colocar as nossas funções e código que pode resultar em exceção.
- Colocar o código no try significa que, vamos tentar (significa de try) rodar esse programa.
- Caso resulte em uma exceção, essa exceção será capturada pelo catch (que significa capturar) e será tratada dentro dele.

Exemplo:
```
public static void main(String[] args) {
    String nome = null;
    try {
        System.out.println("Meu nome em CAPS LOCK é: " + nome.toUpperCase());
    } catch (NullPointerException e) {
        System.out.println("Houve um erro: " + e.getMessage());
    }
}
```

Neste código, tentamos imprimir o texto junto com a variável nome, caso resulte em uma exceção (o que vai acontecer por causa da variável nome ser nula),iremos capturar esse erro com o catch (por isso do NullPoiniterException) e iremos colocar uma mensagem de erro mais amigável.

Vale ressaltar que podemos colocar infinitos catch em um try, ou seja, eu posso colocar um catch para cada exceção dentro do meu try. Mas é interessante saber que, quando um catch for acionado, nenhum outro catch será acionado.

Outra coisa interessante de saber é que podemos colocar a classe da nossa exceção (RuntimeException ou Exception) no catch, desta forma, qualquer exceção relacionada a essas duas classes retornará o catch dessas duas classes. Isso acontece por que cada exceção (como por exemplo NullPointerExcpetion) herda a classe RuntimeException ou Exception.

Um ponto de suma importância é que, utiliza-se try-cath apenas para tratar exceções, o resto, utilize a estrutura if-else. Por causa que, utilizar o try-catch acaba sendo menos performático por ele ser assíncrono, o que resulta em uma espera e utilização dos componentes maior que utilizando uma simples estrutura if-else.

### 10.3.2 throws

Outra maneira de se tratar exceções é utilizando o ***throws***. Para utiliza-lo, primeiro eu preciso colocar throws + a exceção que um determinado método resultaria. Por exemplo:

```
public static FileInputStream lerArquivo() throws FileNotFoundException {
    FileInputStream arquivo = new FileInputStream("livros.json");
    return arquivo;
}
```

Desta forma, utilizando o ***throws*** eu não trato o erro, mas sim, específico que a classe ou método que chamar a classe com o throws terá que tratar.

## 10.4 Criando uma Exceção

Mesmo o Java possuindo várias exceções, podemos criar a nossa própria exceção. Para isso, primeiro precisamos criar uma classe e herdar a classe RuntimeException ou Exception, isso vai depender se a exceção será Unchecked Exceptions ou Checked Exceptions. E criamos um construtor que apenas receberá como parâmetro uma string sendo uma mensagem e iremos usar o super() para criar um construtor da classe herdada usando a mensagem como parâmetro. No final tendo este resultado:
```
public class ExemploException extends RuntimeException {

    public ExemploException(String message) {
        super(message);
    }
}
```

Para utilizar a nossa exceção, basta, em uma estrutura if-else por exemplo, instanciar nessa nova classe de exceção que criamos usando o ***throw***. Ou seja, ficando assim:
```
public static void main(String[] args) {
    Integer a = 10;
    Integer b = 20;

    if(a == 10) {
        throw new NumeroErradoException("O número precisa ser diferente de 10!");
    }
    System.out.println("Soma: " + (a + b));
}
```

O mesmos exemplos valem para qualquer tipo de exceção.