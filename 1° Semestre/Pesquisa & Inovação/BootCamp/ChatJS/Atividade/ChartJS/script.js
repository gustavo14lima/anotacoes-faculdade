// Pegando id's do HTML
const graficoLinha = document.getElementById("grafico-linha");
const graficoBarra = document.getElementById("grafico-barra");

// Dados para o gráfico de linha
const horarios = ["12:00", "13:00", "14:00", "15:00", "16:00", "17:00"];
const dadosTemperatura = [30, 29, 28, 25, 22, 25];
const dadosUmidade = [80, 82, 93, 87, 88, 82];

// Dados para o gráfico de barras
const meses = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho"];
const temperaturaMedia = [22, 24, 27, 23, 20, 18];
const umidadeMedia = [90, 89, 93, 87, 88, 82];

// Criando gráfico de linha
new Chart(graficoLinha, {
  type: "line",
  data: {
    labels: horarios,
    datasets: [
      {
        label: "Temperatura",
        data: dadosTemperatura,
        borderWidth: 5,
        borderColor: "#FF6382",
        backgroundColor: "#FF6382",
      },
      {
        label: "Umidade",
        data: dadosUmidade,
        borderWidth: 5,
        borderColor: "#42A0DF",
        backgroundColor: "#42A0DF",
      },
    ],
  },
  options: {
    scales: {
      y: {
        beginAtZero: true,
        min: 0,
        max: 100,
        ticks: {
          stepSize: 10
        },
      },
    },
    plugins: {
      legend: {
        labels: {
            font: {
                size: 16,
            },
        },
      },
    },
  },
});

// Criando gráfico de barras
new Chart(graficoBarra, {
  type: "bar",
  data: {
    labels: meses,
    datasets: [
      {
        label: "Temperatura Média",
        data: temperaturaMedia,
        borderWidth: 5,
        borderColor: "#FF6382",
        backgroundColor: "#FF6382",
      },
      {
        label: "Umidade Média",
        data: umidadeMedia,
        borderWidth: 5,
        borderColor: "#42A0DF",
        backgroundColor: "#42A0DF",
      },
    ],
  },
  options: {
    scales: {
      y: {
        beginAtZero: true,
        min: 0,
        max: 100,
        ticks: {
          stepSize: 10,
        },
      },
    },
    plugins: {
      legend: {
        labels: {
          font: {
            size: 16,
          },
        },
      },
    },
  },
});

// Calculadando dados para os KPI's

// KPI's gráfico de linha

// pegandos os id's do HTML
let mediaTemperatura = media_temperatura;
let mediaUmidade = media_umidade;

// Inicializando variaveis para armazenar valores totais
let valorTemperatura = 0;
let valorUmidade = 0;

// Pegando a quantidade de registros
let quantidadeRegistrosLinha = dadosTemperatura.length;

// laços de repetição para pegar cada valor dos arrays
for (let i = 0; i < quantidadeRegistrosLinha; i++){
    valorTemperatura += dadosTemperatura[i];
    valorUmidade += dadosUmidade[i];
}

// mostrando na dashboard
mediaTemperatura.innerHTML = (valorTemperatura / quantidadeRegistrosLinha).toFixed(2);
mediaUmidade.innerHTML = (valorUmidade / quantidadeRegistrosLinha).toFixed(2);

// KPI's gráfico de barra

// pegandos os id's do HTML
let mesTemperatura = mes_temperatura;
let mesUmidade = mes_umidade;

// Capturando qual é a maior temperatura
let maiorTemperatura = 0;
let maiorUmidade = 0;

// Pegando a quantidade total de registros 
let quantidadeRegistrosBarra = temperaturaMedia.length;

// laço de repetição para achar o maior valor
for (let i = 0; i < quantidadeRegistrosBarra; i++){
    maiorTemperatura < temperaturaMedia[i] ? maiorTemperatura = temperaturaMedia[i] : maiorTemperatura
    maiorUmidade < umidadeMedia[i] ? maiorUmidade = umidadeMedia[i] : maiorUmidade 
}

// pegando o index da maior temperatura e umidade
let indexTemperatura = temperaturaMedia.indexOf(maiorTemperatura);
let indexUmidade = umidadeMedia.indexOf(maiorUmidade);

// Mostrando o mês da maior temperatura e umidade
mesTemperatura.innerHTML = meses[indexTemperatura];
mesUmidade.innerHTML = meses[indexUmidade];