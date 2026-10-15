package school.sptech;

// Classe principal do projeto
public class Main {

    // O que é o static?
        // Uso para criar um metódo e para usar esse metódo em uma classe com um public static void main. Se eu não vou usar nessa classe, não precisa
        // Metodo estatico
    // Qual é a diferença entre usar void e Tipos de dados
        // Void só vai executar o comando | Tipo de dados returno o tipo de dado específicado no metódo

    // Meotodo que inicializa o projeto
    public static void main(String[] args) {
//        mensagem();
//        System.out.println(mensagem2());

        // Estou criando uma variavel do tipo Calculadora (que é o nome da minha classe)
        // Que vai criar uma nova calculadora?
        Calculadora calculadora = new Calculadora();

        int soma = calculadora.somar(10, 20);
        System.out.println(soma);

        Integer[] numeros = new Integer[] {10, 20, 30};

        System.out.println(calculadora.somar(numeros));
    }

    static void mensagem() {

    }

    static String mensagem2() {
        return "Exemplo Aula 02";
    }
}