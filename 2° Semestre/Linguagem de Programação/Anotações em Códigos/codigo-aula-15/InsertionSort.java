package school.sptech;

public class InsertionSort {

    public void insertionSort(int[] v) {
        for (Integer i = 1; i < v.length; i++) {
            Integer x = v[i];
            Integer j = i - 1;

            while (j >= 0 && v[j] > x) {
                v[j + 1] = v[j];
                j = j - 1;
            }

            v[j + 1] = x;
        }
    }
}
