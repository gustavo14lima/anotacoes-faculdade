function adicionarNoFinal(lista, elemento) {
    let novaLista = lista;
    novaLista[novaLista.length] = elemento;

    return novaLista;
};

function removerDoFinal(lista) {
    let novaLista = [];

    if(lista.length <= 0){
        return novaLista + " (a lista está vazia)";
    } else {
        for(let i = 0; i < (lista.length - 1); i++){
            novaLista[i] = lista[i];
        }
        return novaLista;
    }
};

function removerDoInicio(lista) {
    let novaLista = [];

    if(lista.length <= 0){
        return novaLista + " (a lista está vazia)";
    } else {
        for(let i = 1; i < lista.length; i++){
            novaLista[i - 1] = lista[i]
        }
        return novaLista;
    }
};

function adicionarNoInicio(lista, elemento) {
    let novaLista = [];
    novaLista[0] = elemento;

    for(let i = 0; i < lista.length; i++){
        novaLista[i + 1] = lista[i]
    }

    return novaLista;
};

function alterarLista(lista, indice, quantidade, novoElemento) {
    let novaLista = [];
    let posicao = 0;

    if(quantidade == 0 && novoElemento != "") {
        for(let i = 0; i < lista.length; i++){
            if(i == indice){
                novaLista[posicao] = novoElemento;
                posicao ++;
            }

            novaLista[posicao] = lista[i];
            posicao ++;
        }
    } else if(novoElemento == ""){
        if(indice >= lista.length){
            return lista;
        } else {
            for(let i = 0; i < lista.length; i++){
                if(i == indice){
                    i += quantidade;
                }
        
                novaLista[posicao] = lista[i];
                posicao ++;
            };
        }
    } else {
        for(let i = 0; i < lista.length; i++){
            if(i == indice){
                novaLista[i] = novoElemento;
                i += quantidade - 1;
                continue;
            }

            novaLista[i] = lista[i];
        }
    }

    return novaLista;
};
