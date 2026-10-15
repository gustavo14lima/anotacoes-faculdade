package school.sptech;

public class Aluno {
    // Lista de Atributos
    private String nome;
    private String ra;
    private Double nota;
    private Double individual;

    // Criando construtor cheio
    public Aluno(String nome, String ra, Double nota, Double individual) throws AlunoDadoInvalidoException {
        if(nome == null) {
            // throw é como um return, ele para o código caso ele seja chamado
            throw new AlunoDadoInvalidoException("O nome não pode ser nulo");
        }

        this.nome = nome;
        this.ra = ra;
        this.nota = nota;
        this.individual = individual;
    }

    // Lista de Métodos
    public Double calcularMediaFinal() {
        if(nota == null || individual == null) {
            throw new AlunoNotaInvalidaException("A Nota ou o Individual está nulo");
        }

        return (nota * 0.4) + (individual * 0.6);
    }

    // Criando um construtor vazio
    public Aluno() {
    }

    // Criando getters e setters
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getRa() {
        return ra;
    }

    public void setRa(String ra) {
        this.ra = ra;
    }

    public Double getNota() {
        return nota;
    }

    public void setNota(Double nota) {
        this.nota = nota;
    }

    public Double getIndividual() {
        return individual;
    }

    public void setIndividual(Double individual) {
        this.individual = individual;
    }

    // Sobreescrevendo o toString()
    @Override
    public String toString() {
        return "Aluno{" +
                "nome='" + nome + '\'' +
                ", ra='" + ra + '\'' +
                ", nota=" + nota +
                ", individual=" + individual +
                '}';
    }
}
