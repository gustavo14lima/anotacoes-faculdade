function calcularMedia(array) {
    let soma = 0;

    for(let i = 0; i < array.length; i++){
        soma += array[i];
    }

    let media = soma / array.length;

    // o returno da função
    return media;
};
