package school.sptech;

import java.util.ArrayList;
import java.util.List;

public class Faculdade {
    // Lista de Atributos
    private String nome;
    private List<Aluno> alunos;

    // Criando o construtor
    public Faculdade(String nome) {
        this.nome = nome;
        this.alunos = new ArrayList<>();
    }

    // Lista de métodos
    public Double calcularMediaNotasFinais() {
        Double total = 0.0;

        for(Aluno aluno : alunos) {
            total += aluno.calcularNotaFinal();
        }

        return total / alunos.size();
    }

    public Double calcularMediaNotasFinaisPos() {
        Double total = 0.0;
        Integer quantidae = 0;

        for(Aluno aluno : alunos) {
            if(aluno instanceof AlunoPos alunoPos) {
                total += alunoPos.calcularNotaFinal();
                quantidae ++;
            }
        }

        if(quantidae == 0) return null;

        return total / quantidae;
    }

    public void adicionarAluno(Aluno aluno) {
        alunos.add(aluno);
    }

    // Criando os getters
    public String getNome() {
        return nome;
    }

    public List<Aluno> getAlunos() {
        return alunos;
    }

    // Sobrescrevendo o toString()
    @Override
    public String toString() {
        return "Faculdade{" +
                "nome='" + nome + '\'' +
                ", alunos=" + alunos +
                '}';
    }
}
