package school.sptech;

import java.time.LocalDate;

public class Usuario {
    // Lista de Atributos
    private String nome;
    private LocalDate dataNascimento;
    private String email;
    private String cpf;

    // Criando um Construtor Cheio
    public Usuario(String nome, LocalDate dataNascimento, String email, String cpf) {
        this.nome = nome;
        this.dataNascimento = dataNascimento;
        this.email = email;
        this.cpf = cpf;
    }

    // Criando os Getters e Setters
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public LocalDate getDataNascimento() {
        return dataNascimento;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    // Criando o toString, para melhor exibição
    @Override
    public String toString() {
        return "Usuario{" +
                "nome='" + nome + '\'' +
                ", dataNascimento=" + dataNascimento +
                ", email='" + email + '\'' +
                ", cpf='" + cpf + '\'' +
                '}';
    }
}
