package school.sptech;

public class Main {
    public static void main(String[] args) {
        // Instânciando um Aluno
        Aluno aluno01 = new Aluno("Lucas", "04261100");

        // Colocando notas para o Aluno 01
        aluno01.setNotaAc1(5.0);
        aluno01.setNotaAc2(7.0);
        aluno01.setNotaAc3(4.0);

        System.out.println(aluno01);
        System.out.println("Nota final do aluno: " + aluno01.calcularNotaFinal());

        // Instânciando um Aluno Pôs Graduação
        AlunoPos alunoPos01 = new AlunoPos("Isabela", "04261112");

        // Colocando notas para o Aluno Pôs 01
        alunoPos01.setNotaAc1(8.0);
        alunoPos01.setNotaAc2(9.0); // Como é perceptível, o aluno pôs está herdando os métodos da superclasse aluno
        alunoPos01.setNotaAc3(10.0);

        alunoPos01.setNotaTcc(7.0);

        System.out.println(alunoPos01);
        System.out.println("Nota final do aluno pôs graduação: " + alunoPos01.calcularNotaFinal());

        // Eu posso criar uma variável que o tipo dela é uma superclasse, mas o valor dela é de uma subclasse
        Aluno alunoPos02 = new AlunoPos("Cleiton", "04261067"); // Aluno -> Superclasse | AlunoPos() -> Subclasse

        // Desta forma eu perco todos os métodos e relacionandos da classe filho/subclasse

        // Se a variável alunoPos02 for uma instância de AlunoPos (criação de um objeto do AlunoPos)
        if(alunoPos02 instanceof AlunoPos) {

            // Casting ou Cast
            // Mudando a tipagem do alunoPos02 para AlunoPos
            AlunoPos alunoPosConfirmado = (AlunoPos) alunoPos02;
            alunoPosConfirmado.setNotaTcc(6.7);
        }

        // Instânciando uma Faculdade
        Faculdade faculdade = new Faculdade("São Paulo Tech School");

        // Adicionando alunos na faculdade
        faculdade.adicionarAluno(aluno01);
        faculdade.adicionarAluno(alunoPos01);
        faculdade.adicionarAluno(alunoPos02);

        System.out.println("Médias das notas finais da faculdade: " + faculdade.calcularMediaNotasFinais());
    }
}
