package school.sptech;

// final pode ser utilizada na classe. Uma classe final não pode ser uma superclasse, ou seja, não pode ter herança

// final pode ser utilizada na método. Um método final não pode ser sobrescrito.
public class Usuario {
    // static = muito utilizado para utilizarios. Não precisa depender de um objeto

    // Lista atributos

    // Atributos de objeto (atributos exclusivos do meu objeto)
    private String nome;
    private String email;

    private final String senha;
    // static + final = Constante - SCREAMING_CASE
    private static final String FACULDADE_TOP = "São Paulo Tech School";

    // Atributo de Classe (atributo que pertence a classe, pertence a todos os objetos)
    private static Integer contador = 0; // Nesse exemplo, o contador será compartilhado e utilizado entre todos os objetos

    // Construtor
    public Usuario(String nome, String email, String senha) {
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        System.out.println("Usuário " + nome + " Criado com sucesso!");

        contador ++;
        System.out.println("Contador: " + contador);
    }

    // Getters e Setters
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    // Método da Classe

    // Tanto atributo quanto método pode ser estático
    public static Integer getContador() {
        return contador;
    }

    // Sobrescrevendo toString()
    @Override
    public String toString() {
        return "Usuario{" +
                "nome='" + nome + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
