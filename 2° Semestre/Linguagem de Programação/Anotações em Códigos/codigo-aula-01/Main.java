package school.sptech;

// Comentários de uma única linha são feitos pelo "barra barra" (//)

/*

Comentários de múltiplas linhas
são feitos utilizando "barra asterisco asterisco barra"

*/

// Classe Main sempre será a classe principal de um projeto Java
public class Main {
    // Metodo Principal -> Metodo Main, ele quando eu executar o meu projeto, o Java vai procurar o metodo main para que funcione o programa e execute todo o código
    public  static void main(String[] args){

        // Realizando uma impressão no console
        System.out.print("Bom dia"); // Impressão no console sem quebra de linha
        System.out.println("Boa tarde"); // Impressão no console com quebra de linha

        // Criação de variáveis
        int idade; // uso apenas para representar número inteiros

        // para representar números decimais
        double valor; // eu uso quando preciso utilizar duas ou até mesmo três casas decimais
        float preco; // eu uso quando preciso utilizar mais que três casas decimais

        boolean status; // eu uso para representar verdadeiro ou falso, ligado ou desligado e etc.

        char sexo; // eu uso para representar um único caracter
        String nome;
        Long dataNascimento;
        Integer valor2;
        Double preco2;
        Boolean status2;

        /*
            Variável com letra minuscula é uma variável do tipo primitivo -> armazena o valor bruto (armazena exatamente e apenas o valor que eu escrevo). Ele não aceita valor nulo (null)
            Variável com letra maiuscula é uma variável do tipo Wapper -> são classes, assim possui metodos dentro delas. Aceita o tipo nulo, posso acessar os metodos dentro dessa classe.
        * */
    }

}
// chaves ( {} ) -> delimitadores do código