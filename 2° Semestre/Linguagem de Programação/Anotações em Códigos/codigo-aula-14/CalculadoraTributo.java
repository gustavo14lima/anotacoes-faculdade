package school.sptech;

import java.util.ArrayList;
import java.util.List;

public class CalculadoraTributo {
    // Lista de Atributos
    private List<Tributavel> tributaveis = new ArrayList<>();

    // Lista de Métodos
    public void adicionarTributavel(Tributavel tributavel) {
        tributaveis.add(tributavel);
    }

    public Double getTotalTributo() {
        Double total = 0.0;

        for (Tributavel tributavel : tributaveis) {
            total += tributavel.calcularAtributo();
        }

        return total;
    }
}
