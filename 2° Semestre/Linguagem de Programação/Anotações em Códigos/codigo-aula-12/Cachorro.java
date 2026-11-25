package school.sptech;

public class Cachorro extends Pet {
    // Lista de Atributos
    private Boolean morde;

    // Construtor
    public Cachorro(String nome, Double peso, Integer idade, String cor, String porte, Boolean morde) {
        super(nome, peso, idade, cor, porte);
        this.morde = morde;
    }

    // Todo método abstrato, a classe concetra (classe que não é abstrata) que herda da classe abstrata, precisa obrigatoriamente implementar o método abstrato (sobrescrever método abstrato).

    // Lista de Métodos
    @Override
    public void comer() {
        System.out.println("Comendo carne...");
    }

    @Override
    public void emitirSom() {
        System.out.println("Au au...");
    }

    // Getters e Setters
    public Boolean getMorde() {
        return morde;
    }

    public void setMorde(Boolean morde) {
        this.morde = morde;
    }

    // sobrescrevendo toString()
    @Override
    public String toString() {
        return "Cachorro{" +
                "morde=" + morde +
                "} " + super.toString();
    }
}
