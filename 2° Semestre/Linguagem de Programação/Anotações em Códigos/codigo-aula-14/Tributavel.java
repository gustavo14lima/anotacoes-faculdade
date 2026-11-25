package school.sptech;

// Tipo de classe diferente do Java. A interface não tem atributos! Apenas métodos, entretanto, pode ter constantes.
// A interface funciona como um contrato. Todas as classes que herdam a classe interface, teram que implementar o método da interface.
// Interface é muito mais comum de ser utilizado no mercado.
// Uma classe só pode herdar de uma classe (uma classe só pode ter um pai), mas uma classe pode implementar (implements) várias interfaces

// Além disso, eu posso herdar uma interfae em outra interface
public interface Tributavel {
    // Lista de Métodos

    // Todo método na interface, por padrão, já é público e abstrato
    Double calcularAtributo();
}


