package school.sptech;

import java.time.LocalDate;

public class Main {
    public static void main(String[] args) {
        // Criando um objeto
        Usuario usuario = new Usuario("Gustavo", LocalDate.of(2008, 01, 14), "gutilima161@gmail.com", "12345678901");

        Musica musica01 = new Musica(
                "Sorry",
                "Sorry",
                "Justien Biber",
                3,
                2015);
        Musica musica02 = new Musica(
                "Young and Bealtiful",
                "Young and Bealtiful",
                "Lana Del Rey",
                4,
                2013);
        Musica musica03 = new Musica(
                "Numb",
                "Meteora",
                "Link Park",
                4,
                2004);

        Playlist playlist = new Playlist(
                "As melhores do 1CCOA",
                usuario);

        playlist.adicionarMusica(musica01);
        playlist.adicionarMusica(musica02);
        playlist.adicionarMusica(musica03);

        System.out.println(playlist);
        System.out.println(playlist.getDuracaoTtaol());

        playlist.removerMusica(musica01);
        playlist.removerMusica(1);

        System.out.println(playlist);
        System.out.println(playlist.getDuracaoTtaol());
    }
}
