package school.sptech;

public class BubbleSort {

    public void bubbleSort(int[] v) {
        for (Integer i = 0; i < v.length - 1; i++) {
            for (Integer j = 1; j < v.length - i; j++) {
                if (v[j - 1] > v[j]) {
                    Integer auxiliar = v[j - 1];
                    v[j - 1] = v[j];
                    v[j] = auxiliar;
                }
            }
        }
    }
}
