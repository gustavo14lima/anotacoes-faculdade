package school.sptech;

public class Gato extends Pet {
    // Lista de Atributos
    private Boolean arranha;

    // Construtor
    public Gato(String nome, Double peso, Integer idade, String cor, String porte, Boolean arranha) {
        super(nome, peso, idade, cor, porte);
        this.arranha = arranha;
    }

    // Lista de métodos
    @Override
    public void comer() {
        System.out.println("Comendo peixe...");
    }

    @Override
    public void emitirSom() {
        System.out.println("Miau miau...");
    }

    // Getters e Setters
    public Boolean getArranha() {
        return arranha;
    }

    public void setArranha(Boolean arranha) {
        this.arranha = arranha;
    }

    // Sobrescrevendo toString()
    @Override
    public String toString() {
        return "Gato{" +
                "arranha=" + arranha +
                "} " + super.toString();
    }
}
