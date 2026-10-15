package school.sptech;

// Superclasse
public class Aluno {
    // Lista de Atributos

    // Trocando de private para protected para que as subclasses (ou seja, as classes "filhas") podem acessar esses atributos

    // protected -> pode ser acessado por subclasses e classes no mesmo pacote
    protected String nome;
    protected String ra;
    protected Double notaAc1;
    protected Double notaAc2;
    protected Double notaAc3;

    // Criando um construtor cheio
    public Aluno(String nome, String ra) {
        this.nome = nome;
        this.ra = ra;
        this.notaAc1 = 0.0;
        this.notaAc2 = 0.0;
        this.notaAc3 = 0.0;
    }

    // Lista de Métodos
    public Double calcularNotaFinal() {
        return (this.notaAc1 * 0.3) + (this.notaAc2 * 0.3) + (this.notaAc3 * 0.4);
    }

    // Criando os getters e setters
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getRa() {
        return ra;
    }

    public Double getNotaAc1() {
        return notaAc1;
    }

    public void setNotaAc1(Double notaAc1) {
        this.notaAc1 = notaAc1;
    }

    public Double getNotaAc2() {
        return notaAc2;
    }

    public void setNotaAc2(Double notaAc2) {
        this.notaAc2 = notaAc2;
    }

    public Double getNotaAc3() {
        return notaAc3;
    }

    public void setNotaAc3(Double notaAc3) {
        this.notaAc3 = notaAc3;
    }

    // Modificando o toString()
    @Override
    public String toString() {
        return "Aluno{" +
                "nome='" + nome + '\'' +
                ", ra='" + ra + '\'' +
                ", notaAc1=" + notaAc1 +
                ", notaAc2=" + notaAc2 +
                ", notaAc3=" + notaAc3 +
                '}';
    }
}
