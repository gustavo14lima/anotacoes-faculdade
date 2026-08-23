package school.sptech;

import java.util.Arrays;

public class Vetor {
    public static void main(String[] args) {
        // Criando um vetor -> preciso colocar um conchete depois do tipo de variavel
        Integer[] numeros = new Integer[3]; // estou criando um novo vetor de inteiro
        // new int[5] -> estou definindo o tamanho do vetor

        // Atribuindo um valor para cada indice do array
        numeros[0] = 10;
        numeros[1] = 20;
        numeros[2] = 30;

        // Criando um array e já atribuindo os seus valores
        Integer[] numeros2 = new Integer[]{40, 50, 60};
        Integer[] numeros2_1 = {70, 80, 90};

        // Utilizando a classe Arrays, para transformar o array/lista em uma string para imprimir todos os seus valores
        System.out.println(Arrays.toString(numeros));
        System.out.println(Arrays.toString(numeros2));
        System.out.println(Arrays.toString(numeros2_1));

        System.out.println("----------------------------------");

        for (int i = 0; i < numeros.length; i++){
            System.out.println(numeros[i]);
        }

        System.out.println("----------------------------------");

        for (int i = numeros.length - 1; i >= 0; i--) {
            System.out.println(numeros[i]);
        }

        System.out.println("----------------------------------");

        for(Integer numero:numeros){
            System.out.println(numero);
        }
    }
}
