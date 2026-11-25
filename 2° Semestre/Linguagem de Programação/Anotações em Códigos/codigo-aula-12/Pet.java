package school.sptech;

// Para fazer uma classe ou um método abstrato, o atributo "abstract" precisa sempre estar entre o "public" (encapsulamento) e o class ou tipo de dado

// Classe abstrata representa uma ideia, utilizada com o objetivo de ser uma superclasse
// Ela possui uma regra, ela não pode ser instânciada (criar um objeto com essa classe)
// Pois ela é só uma ideia, ela é abstrata. Só serve para ter filhos
// Você  obriga o desenvolvedor a realizar uma sobrescrita
public abstract class Pet {
    // Lista de Atributos
    private String nome;
    private Double peso;
    private Integer idade;
    private String cor;
    private String porte;

    // Construtor
    public Pet(String nome, Double peso, Integer idade, String cor, String porte) {
        this.nome = nome;
        this.peso = peso;
        this.idade = idade;
        this.cor = cor;
        this.porte = porte;
    }

    // Lista de métodos

    // Método abstrato, ele só pode existir em classes abstratas
    public abstract void comer();

    public abstract void emitirSom();

    // Getters e Setters
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Double getPeso() {
        return peso;
    }

    public void setPeso(Double peso) {
        this.peso = peso;
    }

    public Integer getIdade() {
        return idade;
    }

    public void setIdade(Integer idade) {
        this.idade = idade;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getPorte() {
        return porte;
    }

    public void setPorte(String porte) {
        this.porte = porte;
    }

    // Sobrescrevendo toString()
    @Override
    public String toString() {
        return "Pet{" +
                "nome='" + nome + '\'' +
                ", peso=" + peso +
                ", idade=" + idade +
                ", cor='" + cor + '\'' +
                ", porte='" + porte + '\'' +
                '}';
    }
}
