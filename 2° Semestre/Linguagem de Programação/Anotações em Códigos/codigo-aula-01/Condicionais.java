package school.sptech;

public class Condicionais {
    public static void main(String[] args) {
        Integer idade = 18;

        // Estrutura de If, Else e Else If padrão
        if(idade >= 18){
            System.out.println("Você é maior de idade, pode dirigir e pode votar!");
        } else if(idade >= 16){
            System.out.println("Você é menor de idade, mas pode votar, entretanto, não pode dirigir");
        } else {
            System.out.println("Você é menor de idade, não pode votar e nem dirigir");
        }

        // Operador ternário. É igual ao do JavaScript

        String texto = idade >= 18 ? "Você é maior de idade." : "Você é menor de idade.";

        System.out.println(texto);

        // Comparação entre duas variáveis
        Integer num1 = 1100;
        Integer num2 = 1100;

        // Comparação de Wapper = por serem classes, Java está vendo se o endereço de memoŕia do num1 é o mesmo que o num2
        if(num1 == num2){
            System.out.println("São iguais!");
        } else {
            System.out.println("São diferentes!");
        }

        // Usando o metodo .equals(), eu começo a verificar o valor da variável do que o espaço de memória
        if(num1.equals(num2)){
            System.out.println("São iguais!");
        } else {
            System.out.println("São diferentes!");
        }

        String nome1 = "Senhor Ramster";
        String nome2 = "Senhor Ramster";

        // O metodo .equalsIgnoreCase() é uma comparação entre os valores da variável sem levar em conta se tem letras maiusculas e minusculas diferentes
        if(nome1.equalsIgnoreCase(nome2)){
            System.out.println("São iguais!");
        } else {
            System.out.println("São diferentes!");
        }
    }
}
