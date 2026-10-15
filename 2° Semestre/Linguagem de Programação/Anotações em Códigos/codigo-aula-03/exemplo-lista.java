package school.sptech;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        // Criando um valor estático no Java. Eu já específico o tamanho total dele
        Integer[] vetorEstatico = new Integer[5];

        // Criando um vetor dinámico. Eu não específico o tamanho total dele, posso tirar e colocar sem me preocupar com o tamanho.
        // Específicando a partir do diamond (<>) que o meu array dinâmico será tipado, só aceitará dados do tipo String
        List<String> vetorDinamico = new ArrayList(); // Usando a classe List para importar a classe ArrayList

        // Quando eu inicializo um ArrayList(), ele começa com o tamanho 10 (ele cria um vetor estático)
        // Quando chegar perto do limite, ele vai pegar a metade do tamanho original e vai acrescentar em um novo array estático.
        // Além de copiar tudo o que está no array dinâmico Original.
        // array[10] -> novoArray[15]
        // O único ruim é que ele vai ocupar mais espaço que eu precisaria (só se eu colocar muito elemento na minha lista)

        // Comando para adicionar um novo elemento no meu array dinámico
        vetorDinamico.add("Senhor Ramster");
        vetorDinamico.add("Luiz");
        vetorDinamico.add("Gustavo");
        vetorDinamico.add("Carlos");
        vetorDinamico.add("Enzo");

        // Diferente do array estático, com o arrayList eu posso "printar" os seus valores normalmente
        // Tendo um output similar ao do JavaScript
        System.out.println(vetorDinamico);

        // Acessando um indiice específico do meu arrayList
        System.out.println("Acessando a segunda posição do meu arrayList: " + vetorDinamico.get(1));
        // vetorDinamico.get(1) == vetorEstatico[1]

        // Acessandoo último elemento do meu arrayList
        System.out.println("Acessando a última posição do meu arrayList: " + vetorDinamico.get(vetorDinamico.size() - 1));
        // vetorDinamico.get(vetorDinamico.size() - 1) == vetorEstatico[vetorEstatico.lenght - 1]

        // Em laços de repetição, o arrayList e o array estático funcional perfeitamente. Apenas com as diferenças mostradas acima

        // Removendo um elemento do meu arrayList
        vetorDinamico.remove(0); // removo quem está no indice 0
        vetorDinamico.remove("Carlos"); // Ele procura na lista se o nome do parametro está dentro do arrau, e caso estiver, remove

        // Por padrão, o .remove() apenas remove a primeira aparição do elemento específicado

        // Agora, caso eu tente colocar um tipo de dado diferente que String, resultará em um erro!

        // A classe List do Java recebe objetos, e pelos tipos de dados são objetos, eles vai aceitar todo tipo de dado que eu colocar
        // Toda classe do Java é um objeto. Por exemplo, um tipo de dado wrapper

        // Diamonds do List aceita apenas
        List<Integer> numeros = new ArrayList();

        numeros.add(1);
        numeros.add(2);
        numeros.add(3);

        System.out.println(numeros);
        numeros.remove(2); // Aqui quando eu escolho remover o 2, o remove está pegando o indice 2
                                // Pois todo numero que está no parametro o java entende que é um int.
                                // Caso eu queira remover o número 2 (que está no indice 1), eu preciso criar uma variavel Integer para isso
        System.out.println(numeros);

        // Atualizando um arrayList
        vetorDinamico.set(2, "Lima"); // Eu específico o indice e coloco o tipo de dado que quero atualizar
        System.out.println(vetorDinamico);

        // Existem vários metódos do arrayList muito parecidos com o JavaScript, como por exemplo, indexOf, constain e entre outros.

        List<Integer> novaListaNumeros = new ArrayList();
        novaListaNumeros.add(10);

        System.out.println(novaListaNumeros);

        // Criando um arrayList com elementos já setados. Entretando, eu não poss atualizar eles, assim, ficando imutavel.
        List<Integer> novaListaNumeros2 = List.of(10);

        novaListaNumeros2.add(20);

        System.out.println(novaListaNumeros2);
    }
}
