package school.sptech;

public class SelectionSort {

    public void selectionSort(int[] v) {
        for (Integer i = 0; i < v.length - 1; i++) {
            for (Integer j = i + 1; j < v.length; j++) {
                if (v[j] < v[i]) {
                    Integer auxiliar = v[i];
                    v[i] = v[j];
                    v[j] = auxiliar;
                }
            }
        }
    }
}
