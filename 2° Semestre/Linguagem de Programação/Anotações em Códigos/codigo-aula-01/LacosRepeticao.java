package school.sptech;

public class LacosRepeticao {
    public static void main(String[] args) {

        // Laço de Repetição For
        for(int i = 0; i < 10; i++){

            // No Java, tudo o que estiver dentro do print, se transforma em uma string
            System.out.println("Senhor Ramster");
        }

        // Laço de Repetição While
        int num = 0;

        while (num < 10){
            System.out.println("Número dentro do While: " + (num + 1));

            num ++;
        }

        /*
        * Utilizo o for quando eu sei a quantidade de vezes que o será executado. Sei quantas vezes preciso executar algo
        * Utilizo o while quando eu não sei a quantidade de vezes que o código será executado. Não sei quantas vezes preciso executar algo
        */

        // Laço de Repetição Do-While

        int numDoWhile = 0;

        do {
            System.out.println("Número dentro do do-while: " + (numDoWhile));

            numDoWhile++;
        } while (numDoWhile < 10);
    }
}
