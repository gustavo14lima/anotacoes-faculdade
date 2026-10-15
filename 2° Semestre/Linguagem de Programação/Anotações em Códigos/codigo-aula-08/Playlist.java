package school.sptech;

import java.util.ArrayList;
import java.util.List;

// Fazendo relacionamento entre Classes.
// Relacionamento entre Classes -> Usar uma classe como atributo de outra classe.

public class Playlist {
    // Lista de Atributos
    private String nome;
    private Usuario dono; // Relacionamento 1:1
    private List<Musica> musicas; // Relacionamento 1:N

    // Criando um Construtor
    public Playlist(String nome, Usuario dono) {
        this.nome = nome;
        this.dono = dono;
        this.musicas = new ArrayList<>();
    }

    // Lista de métodos
    public void adicionarMusica(Musica musica) {
        if(musica == null) {
            System.out.println("Música Inválida");
            return;
        }

        this.musicas.add(musica);
    }

    public void removerMusica(Musica musica) {
        if(musica == null) {
            System.out.println("Música Inválida");
            return;
        }

        this.musicas.remove(musica);
    }

    public void removerMusica(int indiceMusica) {
        if(indiceMusica > musicas.size() || indiceMusica < 0) {
            System.out.println("O indice inválido!");
            return;
        }

        this.musicas.remove(indiceMusica);
    }

    // Criando um campo calculado
    public Integer getDuracaoTtaol() {
        Integer totalMusica = 0;

        for(Musica musica : this.musicas) {
            totalMusica += musica.getDuracaoMinutos();
        }

        return totalMusica;
    }

    // Criand os Getters e Setters de tudo


    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Usuario getDono() {
        return dono;
    }

    public void setDono(Usuario dono) {
        this.dono = dono;
    }

    public List<Musica> getMusicas() {
        return musicas;
    }

    // Criando o toString, melhorando a exibição
    @Override
    public String toString() {
        return "Playlist{" +
                "nome='" + nome + '\'' +
                ", dono=" + dono +
                ", musicas=" + musicas +
                '}';
    }
}
