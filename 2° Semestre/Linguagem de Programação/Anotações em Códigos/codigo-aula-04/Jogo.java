package school.sptech;

import java.util.List;

// private -> ninguém fora da classe vai poder modificar ou ver esse atributo ou método
// default -> todos que estão no mesmo pacote, pode ver esse atributo ou método

// O modificador (conceito de encapsulamento) que você vai usar no seu método ou atributo, vai depender da sua regra de negócio

// Organização padrão de uma classe = Atributo -> Construtor -> Métodos -> getters e setters -> toString


public class Jogo {
    // Lista de Atributos
    private String nome;
    private String genero;
    private String desenvolvedora;
    private Boolean temMidiaFisica;
    private Double preco;
    private List<String> plataforma;

    // Criando um construtor vazio. Nasce tudo como nulo
    public Jogo() {}

    // Construtores (tanto a quantidade de construtores quanto os atributos do construtor) está ligado a regra de negócio

    // Criando um construtor com todos os atributos
    public Jogo(String nome, String genero, String desenvolvedora, Boolean temMidiaFisica, List<String> plataforma) {
        // this = palavra para se referir ao objeto. Referencio o atributo da classe
        // Estudar um pouco mais afundo sobre o this
        this.nome = nome;
        this.genero = genero;
        this.desenvolvedora = desenvolvedora;
        this.temMidiaFisica = temMidiaFisica;
        this.plataforma = plataforma;
    }

    // Criando getters e setters

    // Definir uma valor especíifco para preço
    public void setPreco(Double preco) {
        if(preco <= 0.0) {
            System.out.println("Preço inválido");
            return;
        }

        this.preco = preco;
    }

    // Visualizar o valor do preço
    public Double getPreco() {
        return this.preco;
    }

    // Sobreescrevendo um metodo
    @Override // Notação que avisa para o programador que esse método é uma sobreescrita do método original
    public String toString() {
        return "Jogo{" +
                "nome='" + nome + '\'' +
                ", genero='" + genero + '\'' +
                ", desenvolvedora='" + desenvolvedora + '\'' +
                ", temMidiaFisica=" + temMidiaFisica +
                ", preco=" + preco +
                ", plataforma=" + plataforma +
                '}';
    }
}
