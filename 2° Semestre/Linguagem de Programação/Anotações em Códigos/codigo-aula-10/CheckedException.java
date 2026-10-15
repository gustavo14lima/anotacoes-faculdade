package school.sptech;

import java.io.FileNotFoundException;

public class CheckedException {
    public static void main(String[] args) {
        // CheckedException -> É obrigatóroi tratar a exceção.
        // Você não consegue nem rodar o código. Geralmente, erro de compilação

        // Da mesma forma que o RuntimeException é um catch generico para os UncheckedException.
        // O Exception é um catch generico para as classes CheckedException. Da mesma forma que ela também é mais utilizado no último catch

        Leitor leitor = new Leitor();

        try {
            // Preciso tratar esta exceção, pois, eu não tratei no construtor
            leitor.ler2();
        } catch (FileNotFoundException e) {
            System.err.println("Nego, cadê a porra do arquivo?");
        }

    }
}