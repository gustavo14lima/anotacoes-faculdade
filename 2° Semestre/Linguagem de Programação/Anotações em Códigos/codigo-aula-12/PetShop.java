package school.sptech;

import java.util.ArrayList;
import java.util.List;

public class PetShop {
    // Lista de Atributos
    private String nome;
    private List<Pet> pets;

    // Constrtor
    public PetShop(String nome) {
        this.nome = nome;
        this.pets = new ArrayList<>();
    }

    // Lista de Métodos
    public void adicionarPet(Pet pet) {
        pets.add(pet);
    }

    public void alimentar() {
        for (Pet pet : pets) {
            System.out.println("=".repeat(50));
            System.out.println(pet.getNome() + " está comendo!");
            pet.comer();
        }
    }

    // Getter
    public String getNome() {
        return nome;
    }

    public List<Pet> getPets() {
        return pets;
    }
}
