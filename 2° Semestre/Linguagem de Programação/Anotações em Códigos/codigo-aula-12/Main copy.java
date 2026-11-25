package school.sptech;

public class Main {
    public static void main(String[] args) {
        Usuario usuario1 = new Usuario("Gustavo", "capitao.egoista@azure.latch", "wagamama");
        Usuario usuario2 = new Usuario("Senhor Ramster", "tubarao@azure.latch", "chomp chomp");

        // Como contador é um método da classe, ele não precisa de nenhum objeto para funcionar
        System.out.println(Usuario.getContador());

        final Integer numero = 10; // final = significa que esse é o valor final dessa variável, ela não pode ser alterada.
        // toda variável final precisa ter um valor atributo alguma hora no código!
        System.out.println(numero + 5);
//        System.out.println(numero += 57); // erro de compilação
        System.out.println(numero);
    }
}
