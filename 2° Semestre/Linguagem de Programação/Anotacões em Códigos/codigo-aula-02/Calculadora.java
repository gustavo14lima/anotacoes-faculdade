package school.sptech;

public class Calculadora {
    int somar(int n1, int n2){
        return n1 + n2;
    }

    int somar (Integer[] nums){
        Integer soma = 0;
        for(Integer i = 0; i < nums.length; i++){
            soma += nums[i];
        }
        return soma;
    }

    int subtrair(int n1, int n2){
        return n1 - n2;
    }
    int multiplicar(int n1, int n2){
        return n1 * n2;
    }
    double dividir (int n1, int n2){
        return n1 / n2;
    }

    // Um metódo em Java não pode ser exatamente igual!!! Ou seja, não pode ter a mesma assinatura (nome e parâmetros)
    // Sobrecarga de metódo -> metodo com o mesmo nome que outro, só que com parametros diferentes
    double dividir (int n1, int n2, int n3){
        return 0;
    }

    // Posso utilizar metédos como parametros de outros metodos (apenas se certifique que eles teram o mesmo tipo de dado e posso usar um metodo dentro de outro metodo. Exemplo:
    /*
    * System.out.print(calculadora.somar(2, calculadora.multiplicar(2, 3));
    * */
    /*
    int somar(int n1, int n2){
        return n1 + n2;
    }


    int multiplicar(int n1, int n2){
        return somar(n1, 1) * subtrair(n2, 1);
    }
    * */
}
