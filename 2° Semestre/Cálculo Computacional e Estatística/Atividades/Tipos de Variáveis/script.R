# Escolhendo um data frame específico 
data("ChickWeight")

# Criando uma coluna de Variável do Tipo Qualitativa Ordinal
ChickWeight$ganhoPeso <- factor(
  ChickWeight$Diet,
  levels = c(1, 2, 3, 4),
  labels = c("Padrão", "Bom", "Excelente", "Alto"),
  ordered = TRUE
)

# Criando uma coluna de Variável do Tipo Qualitativo Nominal
ChickWeight$nome <- factor(
  ChickWeight$Chick,
  levels = c(1:50),
  labels = c(
    "Piu-Piu", "Galinaceo", "Nugget", "Pintinho Amarelinho", "Ciscador", 
    "Milho", "Pipoca", "Alfredo", "Zeca", "Chiclete", 
    "Amarelo", "Robson", "Penugem", "Algodao", "Ouro", 
    "Fuba", "Manchinha", "Pacoca", "Gema", "Pompom", 
    "Dudu", "Niko", "Lili", "Tico", "Teco", 
    "Bibi", "Nenem", "Kaka", "Lulu", "Fofinho", 
    "Cacique", "Barou", "Rei", "Barao", "Trovao", 
    "Tita", "Hercules", "Apolo", "Fenix", "Thor", 
    "Donald", "Giselo", "Pica-Pau", "Zazu", "Tweety", 
    "Snoopy", "Oliver", "Aiku", "Barnabe", "Romeu"
  ),
  ordered = TRUE
)

# Transdormando uma coluna em uma coluna de Variável do Tipo Quantitativa Contínua
ChickWeight$alturaCm <- factor(
  cut(ChickWeight$weight, c(34, 79, 159, 299, 499)),
  labels = c(17.5, 19.5, 22.2, 26.7),
  ordered = TRUE
)

# Classificando cada coluna de acordo com o tipo de variável:
  # Quantitativo
    #Contínua
      # "Diet", "weight", "Chick" e "Time"
    # Discreta
      # "alturaCm"
  # Qualitativa
    # Nominal
      # "nome"
    # Ordinal
      # "ganhoPeso"

# Histogramas para as variáveis contínuas
hist(ChickWeight$weight, 
     main = "Histograma do Largura do Pinto", 
     xlab = "Largura do Pinto (cm)", 
     col = "lightblue", 
     border = "black")

hist(ChickWeight$Time, 
     main = "Histograma do tempo de medição do Pinto desde seu nascimento", 
     xlab = "Intervalo de tempo entre o pinto nasce e registrar seu peso (s)", 
     col = "lightblue", 
     border = "black")

# Gráfico de barras para as variáveis nominais, ordinais ou discretas
freq_altura <- table(ChickWeight$alturaCm)

barplot(freq_altura, 
        main = "Altura de Cada Pinto", 
        xlab = "Alturas", 
        ylab = "Contagem", 
        col = c("pink", "lightgreen", "lightblue"))

freq_dieta <- table(ChickWeight$ganhoPeso)

barplot(freq_dieta, 
        main = "Tipo de Dieta de Cada Pinto", 
        xlab = "Tipo de Dieta", 
        ylab = "Contagem", 
        col = c("pink", "lightgreen", "lightblue"))

# A partir de uma analise dos gráficos e dos histogramas, pude concluir com base na dieta do pinto, a sua largura aumenta.
# Fazendo a comparação entre histograma de largura e o gráfico de barras da dieta, a quantidade de pintos que fazem a dieta 
# padrão e a quantidade de pintos que possuem uma largura média (entre 50 à 100 cm) é quase a mesma. Existe alguns casos no qual
# a largura do pinto é maior, por causa da dieta. Em exemplos, os pintos que possuem maior largura é aqueles que fazem a dieta
# do tipo excelente ou até alto. Dessa forma, o tipo da dieta influencia na largura do pinto.