package school.sptech;

public class Musica {
    // Lista de Atributos
    private String nome;
    private String album;
    private String artista;
    private Integer duracaoMinutos;
    private Integer anoLancamento;

    // Criando o Construtor Cheio
    public Musica(String nome, String album, String artista, Integer duracaoMinutos, Integer anoLancamento) {
        this.nome = nome;
        this.album = album;
        this.artista = artista;
        this.duracaoMinutos = duracaoMinutos;
        this.anoLancamento = anoLancamento;
    }

    // Criando os Getters e Setters
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getAlbum() {
        return album;
    }

    public void setAlbum(String album) {
        this.album = album;
    }

    public String getArtista() {
        return artista;
    }

    public void setArtista(String artista) {
        this.artista = artista;
    }

    public Integer getDuracaoMinutos() {
        return duracaoMinutos;
    }

    public void setDuracaoMinutos(Integer duracaoMinutos) {
        this.duracaoMinutos = duracaoMinutos;
    }

    public Integer getAnoLancamento() {
        return anoLancamento;
    }

    public void setAnoLancamento(Integer anoLancamento) {
        this.anoLancamento = anoLancamento;
    }

    // Criando o toString, para melhor visualização
    @Override
    public String toString() {
        return "Musica{" +
                "nome='" + nome + '\'' +
                ", album='" + album + '\'' +
                ", artista='" + artista + '\'' +
                ", duracaoMinutos=" + duracaoMinutos +
                ", anoLancamento=" + anoLancamento +
                '}';
    }
}
