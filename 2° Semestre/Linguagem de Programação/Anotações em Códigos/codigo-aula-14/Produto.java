package school.sptech;

// Para uma classe herdar uma interface, utilizasse o "implements".
// Por que a classe implementa a interface
public class Produto implements Tributavel, Validavel {
    // Lista de Atributos
    private String nome;
    private Double preco;

    // Construtor
    public Produto(String nome, Double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    // Lista de Métodos
    @Override
    public Double calcularAtributo() {
        return preco * 0.05;
    }

    @Override
    public void validar() {
        if (nome == null || preco == null || preco < 0.0) {
            throw new IllegalArgumentException();
        }
    }

    // Getters e Setters
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Double getPreco() {
        return preco;
    }

    public void setPreco(Double preco) {
        this.preco = preco;
    }

    // Sobrescrevendo toString()
    @Override
    public String toString() {
        return "Produto{" +
                "nome='" + nome + '\'' +
                ", preco=" + preco +
                '}';
    }
}
