package school.sptech;

public class Main {
    public static void main(String[] args) {
        // Não instancio uma interface, ela não tem nem atributo ou construtor
        Produto produto = new Produto("GTA VI", 500.0);
        Servico servico = new Servico("Concertar PC", 200.0);

        CalculadoraTributo calculadora = new CalculadoraTributo();

        Validador validador = new Validador();

        validador.adicionarValidavel(produto);
        validador.adicionarValidavel(servico);
        
        validador.validar();

        calculadora.adicionarTributavel(produto);
        calculadora.adicionarTributavel(servico);

        System.out.println(calculadora.getTotalTributo());
    }
}
