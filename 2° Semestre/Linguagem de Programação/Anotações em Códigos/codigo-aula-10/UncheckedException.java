package school.sptech;

import java.util.ArrayList;
import java.util.List;

public class UncheckedException {
    // Se uma exceção é filha de RuntimeExcepetion, ele é uma exceção que não precisa ser checada ou validada para rodar o código
    // Agora, se uma uma exceção é filha de Excepetion, ele é uma exceção que precisa ser checada ou validada para rodar o código
    // RuntimeExcepetion herda de Excepetion

    /*
        Erro -> Não tem como tratar e acontece na JVM
        Exceção -> Não é um erro, dá para tratar
    */
    public static void main(String[] args) {
        // Exception -> tudo o que foge de uma regra de negócio de alguma classe ou operação
        // Unchecked Exception -> não é obrigatório tratar
            // Unchecked Exception são classes que herdam de RuntimeException. Caracterisitca que é associada a uma classe Unchecked Exception

        // try-catch -> tente fazer isso, caso der erro, capture o erro e faça isso.
        try {
            // Tente fazer/executar isso

            String nome = null;
            System.out.println(nome.toLowerCase());

            List<Integer> lista = new ArrayList<>();
            lista.get(10);
        } catch (NullPointerException e) { // e -> uma variável para capturar e representar o erro de NullPointerException
            // Se der erro de NullPointer, faça isso
            System.out.println("Eita porra. Agora fudeu");
            System.out.println("Deu esse erro aqui nego: " + e.getMessage());
        } catch (IndexOutOfBoundsException e) {
            System.out.println("Eita porra. Agora fudeu");
            System.out.println("Deu esse erro aqui nego: " + e);

            // Print específico para mensagens de erro. A única mudança é a utilização de uma fonte vermelha
            System.err.println(e.getMessage());
        }

        // catch(RuntimeException é um catch mais generico que engloba todas as exceções.
        // Mais utilizado como o último catch, já que eu faço todas as específicas e faço a generica que engloba todas as exceções.

        // Na estrutura try-catch, pode existir infinitos catchs para um único try
            // Mas apenas executa apenas um catch, quando dispara a primeira exeção, o try morre e vai para o catch.

        System.out.println("Mensagem");

    }
}
