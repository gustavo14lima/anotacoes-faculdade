let numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
let eNumero = false;

function validacao(valor){
    valor = valor.toString();

    if(valor == ""){
        console.log(`O valor: ${valor} é nulo! Insira outro valor`);
    }

    for (let i = 0; i < valor.length; i++){
        for (let j = 0; j < numeros.length; j++){
            if(valor[i] == numeros[j]){
                eNumero = true;
                break;
            };
        };
    }

    if(eNumero){
        return true;
    } else {
        console.log(`tipo inválido para o argumento!`);
        return false;
    }
};

function soma(numero1, numero2, campoSaida) {
    if(validacao(numero1) && validacao(numero2)){
        numero1 = Number(numero1);
        numero2 = Number(numero2);

        campoSaida.innerHTML = `A soma dos valors informados é: ${numero1 + numero2}`
    } else {
        campoSaida.innerHTML = `Algo deu errado! Verifique o console`
    }
};

function calcularDistancia (x1, y1, x2, y2, campoSaida){

    if(validacao(x1) && validacao(y1) && validacao(x2) && validacao(y2)){
        campoSaida.innerHTML = `A distancia é: ${Math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)}`
    }else {
        campoSaida.innerHTML = `Algo deu errado! Verifique o console`
    }
};

function converterParaHoraMinutoSegundo(numero, campoSaida){
    if(validacao(numero)){
        let horas = 0;
        let minutos = 0;
        let segundos = 0;
        let resto = 0;

        if(numero >= 3600){
            horas = parseInt(numero / 3600); 
            resto = parseInt(numero % 3600);
        } 
        if(numero >= 60){
            if(resto != 0){
                minutos = parseInt(resto / 60);
                segundos = parseInt(resto % 60);
            } else {
                minutos = parseInt(numero / 60);
                segundos = parseInt(numero % 60);   
            }
        } else {
            segundos = numero;
        }

        campoSaida.innerHTML =  `A conversão de ${numero}, para horas:minutos:segundos é: ${horas}:${minutos}:${segundos}`
    }else {
        campoSaida.innerHTML = `Algo deu errado! Verifique o console`
    }
};

function ePrimo(numero, campoSaida){
    if(validacao(numero)){
        let contador = 0;
        // créditos: https://www.javascriptprogressivo.net/2018/12/Verificar-Numero-Primo-Testar-Descobrir.html
        for(let i = 1; i <= numero; i++){
            if(numero % i == 0){
                contador ++;
            }
        };
    
        if(contador == 2){
            campoSaida.innerHTML = `O número ${numero} é primo (${contador == 2})`;
        } else {
            campoSaida.innerHTML = `O número ${numero} não é primo (${contador == 2})`;
        }
    } else {
        campoSaida.innerHTML = `Algo deu errado! Verifique o console`
    }
};

function calcularFatorial(numero, campoSaida){
    if(validacao(numero)){
        numero = Number(numero);
        let somaNumeros = 1;

        for (let i = numero; i > 0; i--){
            somaNumeros *= i
        }

        campoSaida.innerHTML = `O fatorial de ${numero} é: ${somaNumeros}`
    } else {
        campoSaida.innerHTML = `Algo deu errado! Verifique o console`
    }
}

function calcularMedia(vetor, campoSaida) {
    let soma = 0;
    let arrayValidado = false;

    for(let i = 0; i < vetor.length; i++){
        if(validacao(vetor[i])){
            vetor[i] = Number(vetor[i]);

            soma += vetor[i];
            arrayValidado = true;
        } else {
            break;
        }
    };

    if(arrayValidado){
        campoSaida.innerHTML = `A média do array: [${vetor}], é: ${soma / vetor.length}`;
    }else {
        campoSaida.innerHTML = `Algo deu errado! Verifique o console`
    }
};

function calcularMediaPonderada(vetorMedias, vetorPesos, campoSaida){
    let somaPesos = 0;
    let mediaPonderada = 0;
    let podeContinuar = false;

    if(vetorMedias.length != vetorPesos.length){
        campoSaida.innerHTML = `Algo deu errado! Verifique o console`
        console.log("A quantidade de informações não são iguais nos arrays de medias e pesos!");
        return;
    } else {
        for(let i = 0; i < vetorMedias.length; i++){
            if(validacao(vetorMedias[i]) && validacao(vetorPesos[i])){
                podeContinuar = true;
            } else {
                break;
            }
        }

        if(podeContinuar){
            for (let i = 0; i < vetorPesos.length; i++){
                somaPesos += vetorPesos[i];
            }
        
            if(somaPesos != 1){
                campoSaida.innerHTML = `Algo deu errado! Verifique o console`
                console.log("A  soma dos pesos deve ser 1");
            }
        
            for (let i = 0; i < vetorMedias.length; i++){
                mediaPonderada += (vetorMedias[i] * vetorPesos[i]);
            }
            campoSaida.innerHTML = `A media ponderada dos seus valores é: ${mediaPonderada}`
        } else {
            campoSaida.innerHTML = `Algo deu errado! Verifique o console`
        }
    }
};
