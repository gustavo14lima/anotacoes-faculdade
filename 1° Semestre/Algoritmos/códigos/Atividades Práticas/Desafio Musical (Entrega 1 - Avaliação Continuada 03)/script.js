let playlist = [];

function adicionarMusica() {
    resultado.innerHTML = "";

    let titulo = ipt_titulo.value;
    titulo = titulo.trim();
    let banda = ipt_banda.value;
    banda = banda.trim();
    let duracao = Number(ipt_duracao.value);
    let anoLancamento = Number(ipt_ano_lancamento.value);
    let avaliacao = ipt_avaliacao.value ;
    let integrantes = ipt_integrantes.value;   

    // Colocando os nomes dos integrantes em um array
    let listaIntegrantes = integrantes.split(",");

    // Colocando as avaliações em um array
    let listaAvaliacao = avaliacao.split(",");
    let avaliacaoValidada = true;

    for(let i = 0; i < listaAvaliacao.length; i++){
        if(listaAvaliacao[i] > 5 || listaAvaliacao[i] < 1){
            alert(`O número ${i} não está dentro dos nosso paramêtros!`)
            avaliacaoValidada = false;
            break;
        }
    }
    if(
        (titulo == "") ||
        (banda == "") ||
        (duracao == "") ||
        !listaAvaliacao || 
        (anoLancamento == "") ||
        (integrantes == "")
    ){
        alert('Alguns dos campos estão com os valores nulos! Corrige-os antes de enviar de novo')
    } else {
        let musica = {
            "titulo": titulo,
            "banda": banda,
            "duracao": duracao,
            "anoLancamento": anoLancamento,
            "avaliacao": avaliacao,
            "integrantes": listaIntegrantes
        }
        playlist.push(musica);

        resultado.innerHTML = "A música foi adicionada com sucesso!"
        console.log(playlist);
    }
};

function listarMusicas() {
    resultado.innerHTML = "";

    for(let i = 0; i < playlist.length; i++){
        resultado.innerHTML += `
            Música ${i + 1}: <br>
            > Título da música: ${playlist[i].titulo} <br>
            > Banda da música: ${playlist[i].banda} <br>
            > Duração da música em minutos: ${playlist[i].duracao} <br>
            > Ano de lançamento da música: ${playlist[i].anoLancamento} <br>
            > Avaliação música: ${playlist[i].avaliacao} <br>
            > Todos os integrantes da música: ${playlist[i].integrantes}    
            <hr>
        `
    }
};

function removerMusica() {
    resultado.innerHTML = "";
    let tituloRemover = ipt_titulo_remover.value;
    tituloRemover = tituloRemover.trim();

    if(tituloRemover == ""){
        alert('O título não pode ser nulo!')
    } else {
        for (let i = 0; i < playlist.length; i++){
            if(playlist[i].titulo.toLowerCase() == tituloRemover.toLowerCase()){
                playlist.splice(i, 1);

                resultado.innerHTML = "Música deletada com sucesso!";
                console.log(playlist);
            } else {
                resultado.innerHTML = "Música não cadastrada no sistema!"
            }
        }
    }
};

function atualizarAnoLancamento() {
    resultado.innerHTML = "";
    let tituloAtualizarAno = ipt_titulo_atualizar_ano.value;
    tituloAtualizarAno = tituloAtualizarAno.trim();
    let novoAno = Number(ipt_novo_ano.value);

    if(tituloAtualizarAno == ""){
        alert('O título não pode ser nulo!')
    } else {
        for (let i = 0; i < playlist.length; i++){
            if(playlist[i].titulo.toLowerCase() == tituloAtualizarAno.toLowerCase()){
                playlist[i].anoLancamento = novoAno; 
                
                resultado.innerHTML = "Ano de lançamento da música atualizada com sucesso!";
                console.log(playlist);
            } else {
                resultado.innerHTML = "Música não cadastrada no sistema!"
            }
        }
    }
};

function mediaAvaliacoes() {
    resultado.innerHTML = "";
    let tituloAvaliacao = ipt_titulo_avaliacao.value;
    tituloAvaliacao = tituloAvaliacao.trim();
    let somaAvaliacoes = 0;
    let contador = 0;

    if(tituloAvaliacao == ""){
        alert('O título não pode ser nulo!')
    } else {
        for (let i = 0; i < playlist.length; i++){
            if(playlist[i].titulo.toLowerCase() == tituloAvaliacao.toLowerCase()){
                for(let j = 0; j < playlist[i].avaliacao.length; j++){
                    if(playlist[i].avaliacao[j] == "" || playlist[i].avaliacao[j] == " " || playlist[i].avaliacao[j] == "," || playlist[i].avaliacao[j] == "."){
                        continue;
                    } else {
                        somaAvaliacoes += Number(playlist[i].avaliacao[j]);
                        contador ++;
                    }
                } 
            } else {
                resultado.innerHTML = "Música não cadastrada no sistema!"
            }
            resultado.innerHTML = `A média das avaliações é: ${somaAvaliacoes / contador}`
            console.log(playlist);
        }
    }
};

function buscarBandaPorIntegrante() {
    resultado.innerHTML = "";
    
    let integrante = ipt_integrante_busca.value;
    integrante = integrante.trim();

    if(integrante == ""){
        alert('O nome do integrante não pode ser nulo!')
    } else {
        for (let i = 0; i < playlist.length; i++){
            for(let j = 0; j < playlist[i].integrantes.length; i++){
                if(playlist[i].integrantes[j].toLowerCase() == integrante.toLowerCase()){
                    resultado.innerHTML = `
                        O integrante foi achado! Ele está na banda: ${playlist[i].banda}
                    ` 
                } else {
                    resultado.innerHTML = "Integrante não cadastrada no sistema!"
                }
            }
        }
    }
};
