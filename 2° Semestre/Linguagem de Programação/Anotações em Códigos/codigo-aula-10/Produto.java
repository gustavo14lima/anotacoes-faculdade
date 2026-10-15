package school.sptech;

// Valida para que os atributos de uma classe/construdor, não sejam nulos
import java.util.Objects;

public class Produto {
    // Lista de Atributos
    private String nome;
    private Double preco;
    private Integer qtd;

    // Criando construdor cheio
    public Produto(String nome, Double preco, Integer qtd) {
        this.nome = Objects.requireNonNull(nome, "Nome não pode ser nulo"); // Estou pedindo para que não seja nulo
        this.preco = Objects.requireNonNull(preco, "Preço não pode ser nulo");
        this.qtd = Objects.requireNonNull(qtd, "Quantidade não pode ser nulo");
    }


}
