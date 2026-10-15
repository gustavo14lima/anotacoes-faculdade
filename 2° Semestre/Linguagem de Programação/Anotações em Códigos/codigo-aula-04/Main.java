package school.sptech;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        Jogo jogo = new Jogo("GTA VI" , "Mundo Aberto", "Rockstar", false, new ArrayList<>(List.of("Playstation 5", "Playstation 5 Pro", "Xbox Series S", "Xbox Series X")));

        System.out.println(jogo);
    }
}
