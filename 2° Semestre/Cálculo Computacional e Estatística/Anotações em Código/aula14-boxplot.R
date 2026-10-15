# Importando o dataframe "Iris" por questão de exemplificação
data("iris")

# O bloxplot() é utilizado principalmente para criar diagramas de caixa, que visualizam a distribuição, a dispersão e a 
# comparação de dados numéricos entre diferentes grupos ou categorias.

# Fazendo um boxplot() de apenas um elemento
boxplot(iris$Petal.Length)

# Fazendo um boxplot() de um elemento filtrando ele
boxplot(iris$Petal.Length[iris$Species == "virginica"])

# "Bigode do boxplot()" - Amplitude, o alcance dos dados.
# Linha do meio - Mediana, com ela eu posso saber se possui uma distruição normal ou assimétrica

# Separação dos quartis:
  # O bigode de baixo até o "fim da caixa, é o primeiro quartil (25% de toda representação)
  # Do "fim" da caixa até a linha da mediana, é o segundo quartil (50% de toda representação)
  # Da linha da mediana até o "início" da caixa é o terceiro quartil  (75% de toda representação)
  # Do "início" da caixa até o bigode de cima é o quarto quartil (100% de toda representação)
  # Dica: leia os quartils de baixo para cima.

boxplot(iris$Petal.Length[iris$Species == "virginica"],
         iris$Petal.Length[iris$Species == "setosa"],
         iris$Petal.Length[iris$Species == "versicolor"])

# Na função boxplot(), quando existe algum outlier, irá aparecer representado uma circunferência na mesma coluna do boxpot()

# plot() - Usado para fazer comparação de variáveis
plot(iris$Sepal.Length, iris$Petal.Length)
