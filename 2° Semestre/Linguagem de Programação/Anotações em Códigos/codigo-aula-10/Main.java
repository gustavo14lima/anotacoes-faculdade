package school.sptech;

public class Main {
    public static void main(String[] args) {
        try {
            Aluno aluno = new Aluno(null, null, null, null);
        } catch (AlunoDadoInvalidoException e) {
            System.out.println(e.getMessage());
        }

        Produto produto = new Produto(null, 10.0, 1);
    }
}
