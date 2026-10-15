package school.sptech;

public class AlunoDadoInvalidoException extends Exception {
    // Lança exceção sem mensagem
    public AlunoDadoInvalidoException() {}

    // Lança excessão com mensagem
    public AlunoDadoInvalidoException(String message) {
        super(message);
    }
}
