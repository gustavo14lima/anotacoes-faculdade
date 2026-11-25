package school.sptech;

import java.util.List;

public class Validador {
    // Lista de Atributos
    private List<Validavel> validaveis;

    // Lista de Métodos
    public void adicionarValidavel(Validavel validavel) {
        validaveis.add(validavel);
    }

    public void validar() {
        for (Validavel validavel : validaveis) {
            validavel.validar();
        }
    }
}
