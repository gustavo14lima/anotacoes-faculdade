package school.sptech;

public class Servico implements Tributavel, Validavel {
    // Lista de Atributos
    private String descricao;
    private Double valor;

    // Construtor
    public Servico(String descricao, Double valor) {
        this.descricao = descricao;
        this.valor = valor;
    }

    // Lista de Métodos
    @Override
    public Double calcularAtributo() {
        return valor * 0.08;
    }

    @Override
    public void validar() {
        if (descricao == null || valor == null || valor < 0.0) {
            throw new IllegalArgumentException();
        }
    }

    // Getters e Setters
    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    // Sobrescrevendo toString()
    @Override
    public String toString() {
        return "Servico{" +
                "descricao='" + descricao + '\'' +
                ", valor=" + valor +
                '}';
    }
}
