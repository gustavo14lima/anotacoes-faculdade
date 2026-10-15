package school.sptech;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Leitor {
    public void ler() {
        // Classe que é obrigado  a utilizar try-catch
        try {
            // Classes para ler arquivos
            FileInputStream fileInputStream = new FileInputStream("");
        } catch (FileNotFoundException e) {
            System.err.println(e.getMessage());
        }
    }

    // Este método não trata esta exceção, mas sim, que vai utilizar este método
    public void ler2() throws FileNotFoundException {
        FileInputStream fileInputStream = new FileInputStream("");
    }
}
