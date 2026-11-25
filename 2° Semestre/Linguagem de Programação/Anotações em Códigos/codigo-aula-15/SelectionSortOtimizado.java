package school.sptech;

public class SelectionSortOtimizado {

    public void selectionSortOtimizado(int[] v) {
        Integer menorIndice = 0;

        for (Integer i = 0; i < v.length - 1; i++) {
            menorIndice = i;

            for (Integer j = i + 1; j < v.length; j++) {
                if (v[j] < v[menorIndice]) {
                    menorIndice = j;
                }
            }

            Integer auxiliar = v[i];
            v[i] = v[menorIndice];
            v[menorIndice] = auxiliar;
        }
    }
}
