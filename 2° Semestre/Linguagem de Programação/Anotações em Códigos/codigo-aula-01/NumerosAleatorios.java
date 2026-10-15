package school.sptech;

import java.util.concurrent.ThreadLocalRandom;

public class NumerosAleatorios {
    public static void main(String[] args) {
        // Numero Aleatorio com a biblioteca Math
        Double numeroAleatorio1 = Math.random();

        // Numero Aleatorio com a importação do pacote ThreadLocalRandom
        // nextInt(10) -> o meu intervalo vai de 0 até 9 (o 10 não conta)
        // nextInt(5, 10) -> o meu intervalo vai de 5 até 9
        Integer numeroAleatorio2 = ThreadLocalRandom.current().nextInt(5, 10);

        System.out.println(numeroAleatorio1);
        System.out.println(numeroAleatorio2);
    }

    public static void nomeMetodo (Integer a, Integer b){
        System.out.println(a + b);
    }
}
