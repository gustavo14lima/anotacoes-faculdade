function cadastrarUsuario() {
    let nomeUsuario = ipt_nome.value;
    let mensagemUsuario = ipt_mensagem.value;
    let generoUsuario = select_genero.value;

    let imagemMasculino = "https://cdn-icons-png.flaticon.com/256/3681/3681928.png";
    let imagemFeminino = "https://cdn-icons-png.flaticon.com/512/706/706830.png";

    if(nomeUsuario.trim() == "" || mensagemUsuario.trim() == "" ){
        alert(`Por favor, preencha todos os campos!`)
    }else {
        div_resultado.innerHTML += `
        <div class="card">
            <div class="card-img-usuario">
                <img class="img-usuario" src="${generoUsuario == "select_genero_masculino" ? imagemMasculino : imagemFeminino}" alt="${generoUsuario == "select_genero_masculino" ? "Icon Masculino" : "Icon Feminino"}">
            </div>
            <div class="card-text">
                <h1>
                    Meu nome é: <span class="nome_usuario cor-texto">${nomeUsuario}</span>
                </h1>
            
                <p>
                    Mensagem: <span class="mensagem_usuario cor-texto">${mensagemUsuario}</span>
                </p>
            </div>
        </div>
        `
    }
};
