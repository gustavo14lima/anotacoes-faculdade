package school.sptech;

import javax.swing.*;

public class Interpolacao {
    public static void main(String[] args) {
        // Concatenação
        System.out.println("Exemplo " + 1);

        // Interpolação #1
        // Para imprimir uma string, uso o %s, para número inteiro uso %d, para números decimais utilizo %f (para determinar a quantidade de casas decimais, coloco ponto (.) e a quantidade de casas que eu quero. Exemplo: %.2f)

        String nome = "Senhor Ramster";
        Integer idade = 11;
        Double altura = 1.67;

        String texto1 = "Meu nome é %s e tenho %d anos de idade e minha altura é %.2f".formatted(nome, idade, altura);

        System.out.println(texto1);

        // Interpolação #2
        String texto2 = String.format("Meu nome é %s e tenho %d anos de idade e minha altura é %.2f", nome, idade, altura);

        System.out.println(texto2);

        // Interpolação #3
        System.out.printf("Meu nome é %s e tenho %d anos de idade e minha altura é %.2f", nome, idade, altura);

        String textoGrande = "Meu nome é %s\nTenho %d anos de idade\nMinha altura é %.2f".formatted(nome, idade, altura);
        System.out.println(textoGrande);

        // String Box - Caixa de String
        String textoGrande2 = """
               Meu nome é %s
               Tenho %d anos de idade
               Minha altura é de %.2f metros 
                """.formatted(nome, idade, altura);

        System.out.println(textoGrande2);
    }
}
