let contador = 1;

async function buscarGatinho() {
    let retornoAPI = await fetch(`https://api.thecatapi.com/v1/images/search`);
    let retornoGatnho = await retornoAPI.json();
    
    resultado.innerHTML += `
    <div class="card">
        <img src="${retornoGatnho[0].url}" alt="Foto do ${contador}° Gatinho">
        <p>Foto do ${contador}° Gatinho</p>
    </div>
    `

    contador++;
};
