package school.sptech;

public class Pedido {
    // Lista de Atributos
    private Integer numero;
    private StatusPedido status;

    // Construtor
    public Pedido(Integer numero) {
        this.numero = numero;
        this.status = StatusPedido.PENDENTE;
    }

    // Getters e Setters
    public StatusPedido getStatus() {
        return status;
    }

    // Permitir alterar status pedido
    public void setStatus(StatusPedido status) {
        this.status = java.util.Objects.requireNonNull(status, "Status não pode ser nulo!");
    }

    // Exibindo informações sobre pedido
    public void exibirSituacao() {
        System.out.println("Pedido número: " + numero);

        switch (status) {
            case PENDENTE:
                System.out.println("Situação: Aguardando processamento");
                break;
            case PROCESSANDO:
                System.out.println("Situação: Em preparação");
                break;
            case ENVIADO:
                System.out.println("Situação: Pedido Enviado!");
                break;
            case ENTREGUE:
                System.out.println("Situação: Pedido Entregue!");
                break;
            case CANCELADO:
                System.out.println("Situação: Pedido Cancelado!");
                break;
        }
    }
}
