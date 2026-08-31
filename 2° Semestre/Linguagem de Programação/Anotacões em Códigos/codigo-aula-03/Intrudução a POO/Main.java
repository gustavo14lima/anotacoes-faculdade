package school.sptech;

public class Main {
    public static void main(String[] args) {

        // Instânciando um objeto - Reservando espaço na memória para este objeto
        Carro carro = new Carro();

        // Atribuindo os atributos do meu objeto
        carro.marca = "Fiat";
        carro.ano = 1971;
        carro.modelo = "Fiat Uno";
        carro.ligado();

        // Mostrando a posição de memória que "carro" está usando
        System.out.println(carro);

        // Mostrando o atributo "marca" do objeto "carro"
        System.out.println(carro.marca);
    }
}
