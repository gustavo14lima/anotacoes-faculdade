package school.sptech;

// Herança

// Herdando todos os atributos e métodos da classe Aluno.
// Estou estentendo a minha classe com a classe Aluno
// Uma classe só pode extender uma classe.

// Subclasse
public class AlunoPos extends Aluno{
    private Double notaTcc;

    // Implentando o construdor da classe Aluno
    public AlunoPos(String nome, String ra) {
        // Chamando o construtor da superclasse. Mesma lógica de criar um construdor dentro da mesma classe
        super(nome, ra); // Construtor de Aluno
        this.notaTcc = 0.0;
    }

    // Polimorfismo (Várias formas) -> O mesmo método pode fazer coisas diferentes
    // Tipos de Polimorfismo:
        // Sobrecarga de método (método com assinatura, mas quantidae de métodos diferentes)
        // Sobrescrita (o filho sobrescreve o método do pai, ou seja, método com assinatura, mas em classes diferentes)

    @Override // Opcional - Apenas uma documentação para o próximo entender que este método é uma sobrescrita
    public Double calcularNotaFinal() {
        Double notaFinalTCC = this.notaTcc * 0.40;

        // Eu posso herdar um método utilizando o super (específico que é um método da superclasse) ou colocar sem super, o método direto
        // Isso acontece por que o método está sendo herdado, ou seja, a subclasse pode acessar sem problemas

        // Vale ressltar que os atributos que tiverem private não poderam ser acessados, apenas se os atributos estiverem protected.
        // Caso meus atributos da superclasse estivessem como private, eu teria que utilizar os getters para atributir o valor na variável
        Double notaFinalAc1 = super.notaAc1 * 0.20; // Usando o super
        Double notaFinalAc2 = super.notaAc2 * 0.20;
        Double notaFinalAc3 = notaAc3 * 0.20; // Sem usar super

        return notaFinalTCC + notaFinalAc1 + notaFinalAc2 + notaFinalAc3;
    }

    // Criando getters e setters
    public Double getNotaTcc() {
        return notaTcc;
    }

    public void setNotaTcc(Double notaTcc) {
        this.notaTcc = notaTcc;
    }

    // Modificando o toString()
    @Override
    public String toString() {
        return "AlunoPos{" +
                "notaTcc=" + notaTcc +
                "} " + super.toString();
    }
}
