package school.sptech;

public class Main {
    public static void main(String[] args) {
        // now it's your time oliver...

        // Apenas um item do Enum
        DiaSemana dia = DiaSemana.SEGUNDA;

        Tamanho camiseta = Tamanho.MEDIO;

        // Retornando o Enum como um array - Mostrando todas as constantes dentro do meu Enum
        // .values() -> transformo em um array
        for (Tamanho tamanho : Tamanho.values()) {
            System.out.println(tamanho);
        }

        // Verificar se existe um texto correspondente
        // valueOf() -> trás um texto correspondente exato ao que foi passado

        Tamanho tam = Tamanho.valueOf("GRANDE"); // caso exista, ele mostra o valor, caso contrario, lança uma excessão
        System.out.println(tam);

        // ordinal() -> retorna a posição de um item dentro do meu enum
        System.out.println(camiseta.ordinal());
    }
}
