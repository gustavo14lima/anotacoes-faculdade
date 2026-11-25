package school.sptech;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        Pet pet = new Gato("Carlos",  3.0, 6, "Cinza", "Pequeno", true);
        Cachorro cachorro = new Cachorro("Pulga", 2.5, 1, "Preto", "Pequeno", true);

        System.out.println("=".repeat(50));
        pet.comer();
        pet.emitirSom();
        System.out.println("=".repeat(50));
        cachorro.comer();
        cachorro.emitirSom();
        System.out.println("=".repeat(50));

        System.out.println("\n".repeat(10));

        PetShop petShop = new PetShop("Pet Shop");

        petShop.adicionarPet(cachorro);
        petShop.alimentar();
    }
}
