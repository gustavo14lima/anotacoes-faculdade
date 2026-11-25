package school.sptech;

public class Vendas {
    public static void main(String[] args) {
        Pedido pedido = new Pedido(67);

        pedido.exibirSituacao();
        System.out.println("-".repeat(20));

        pedido.setStatus(StatusPedido.PROCESSANDO);

        pedido.exibirSituacao();
        System.out.println("-".repeat(20));

        pedido.setStatus(StatusPedido.ENVIADO);

        pedido.exibirSituacao();
        System.out.println("-".repeat(20));

        pedido.setStatus(StatusPedido.ENTREGUE);

        pedido.exibirSituacao();
        System.out.println("-".repeat(20));
    }
}
