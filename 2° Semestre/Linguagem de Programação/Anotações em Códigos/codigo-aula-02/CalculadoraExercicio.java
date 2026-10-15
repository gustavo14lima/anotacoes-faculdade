package school.sptech;

public class CalculadoraExercicio {
    Integer somar(int n1, int n2){
        return n1 + n2;
    }

    Integer somar (Integer[] nums){
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

    double dividir (int n1, int n2, int n3){
        return 0;
    }
}
