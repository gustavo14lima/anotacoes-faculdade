# 9. Herança

## 9.1 Definição de Herança

A Herança, como anteriormente visto, é um tipo de relacionamento, mas com uma particularidade fundamental. Na Herança, eu pego todos os atributos e métodos da classe que eu estou herdando. 

Por exemplo, se eu falo que AlunoPos vai herdar Aluno, eu estou dizendo que AlunoPos vai poder ter acesso a todos os métodos e atributos que Aluno e utilizar a vontade, como se fosse dele. Neste exemplo, AlunoPos seria a classe filho e Aluno seria a classe pai.

Vale ressaltar que uma classe só pode herdar uma classe, e a classe filho não teria acesso as atributos e classes da classe avó por exemplo. Ou seja, o relacionamento entre atributos e classe acontece de um para um, sem nenhum intermediador ou relacionado.

O principal motivo para realizar a herança é para mitigar ainda mais a redundância de dados.

## 9.2 Herança no Código

### 9.2.1 extends

Para realizar uma herança, primeiro você precisa definir na sua classe qual classe você vai herdar, para isso, usamos o ***extends***. Veja no exemplo:

```
public class AlunoPos extends Aluno {
	...
}
```

Neste exemplo, eu estou dizendo que o AlunoPos está herdando todos os atributos e elementos de aluno.

### 9.2.2 superclasse e subclasse

Quando trabalhamos com herança em programação orientada a objetos, temos o termo "superclasse" e "subclasse". O que significa que, a classe que eu estou herdando (ou seja, a minha classe pai) é a superclasse, e a classe que vai herdar (ou seja, a classe filho) é a subclasse.

Saber destes temos é interessante, pois no Java temos o método ***super()***. O super() possui algumas peculiaridades interessantes, sendo elas:

Criar um construtor da classe pai dentro da classe filho. Exemplo:
```
public AlunoPos(String nome, String ra) {
	super(nome, ra);
	
}
```
Desta forma, eu posso reutilizar o construtor da classe Aluno dentro da minha classe AlunoPos. O conceito e lógica é a mesma para criar um construtor da mesma classe, sendo o ***this()***.

E a sua outra peculiaridade, seria referente a especificar que está utilizando métodos e atributos de outra classe. Por exemplo:
```
Double notaFinalAc1 = super.notaAc1 * 0.20;
Double notaFinalAc2 = super.notaAc2 * 0.20;
Double notaFinalAc3 = notaAc3 * 0.20
```
Vale ressaltar que eu posso especificar que este elemento é da superclasse ou não, assim como está no exemplo.

### 9.2.3 Diferença entre Protected e Private

Como vimos antes em encapsulamento, existem vários tipos de encapsulamento, por exemplo, o private. Mas, quando utilizamos a herança, devemos lembrar que o private só pode ser utilizar na mesma classe, o que resulta em, eu não poder utilizar um atributo em especifico na minha superclasse, a menos que eu utilize o seu getter. 

Por isso, quando fomos utilizar herança, podemos tanto utilizar o getter de um atributo private quanto podemos utilizar o protected no atributo, que como vimos antes, só pode ser acessado pela classe e pela sua subclasse, ou seja, pela classe que vai herdar.

### 9.2.4 Instanceof e Casting

O ***instanceof*** é um operador que faz verificação se um determinado objeto é uma instância, ou seja, é subclasse de uma classe. Veja o exemplo:

```

if(alunoPos instaceof AlunoPos) {
	...
}

```
Neste exemplo eu estou dizer, se a variável alunoPos (que é um objeto instanciado da classe AlunoPos) é uma instância da classe AlunoPos, faça.

Quando utilizamos instaceof, perdemos o acesso temporário aos métodos específicos do objeto, e ter acesso novamente, é preciso fazer um casting.

O casting é o ato de forçar a conversão de um objeto de um tipo para outro. Existe duas maneiras práticas de realizar o casting:

Dentro do if:
```
if(alunoPos02 instanceof AlunoPos) {
	AlunoPos alunoPosConfirmado = (AlunoPos) alunoPos02;
	alunoPosConfirmado.setNotaTcc(6.7);
}
```

E no if:
```
if(alunoPos02 instanceof AlunoPos alunoPosConfirmado) {
	alunoPosConfirmado.setNotaTcc(6.7);
}
```

Em um eu crio uma nova variável instanciando o meu objeto e na outra, eu apenas coloco a variável após a classe. Ambas comprem o seu papel. 

## 9.3 Tipos de Polimosfismo

Antes de dizer os tipos de Polimosfismo, é interessante entender primeiro o que é o Polimosfismo. O Polimosfismo é a forma com que eu utilizo o mesmo método mas de diferentes formas. Existem vários tipos de fazer o Polimosfismo. Dois exemplos seria a:
-  **Sobrecarga de método**: Como já visto anteriormente, a sobrecarga de método é a forma como que utilizo o método com a mesma assinatura, mas com a quantidade ou tipagem dos parâmetros diferentes. 
- **Sobrescrita de método**: A sobrescrita de método, é quando a subclasse sobrescreve a classe da superclasse, podendo ser a mesma assinatura, os mesmos parâmetros (ou não), mas na subclasse.

É interessante que, quando formos fazer uma sobrescrita, podemos colocar o ***@Override***, que seria uma notação para o próximo programador entender que aquele método é uma sobrescrita.