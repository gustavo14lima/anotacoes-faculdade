# Instalando o pacote "ggplot2"
install.packages("ggplot2")

# Importando o pacote "ggplot2"
library(ggplot2)

# Importando o dataframe "iris"
data("iris")

# Chamando a função ggplot()
ggplot(
  iris, 
  aes(x = iris$Petal.Length, y = iris$Sepal.Length, shape = iris$Species, colour = iris$Species)
  ) + geom_point(size = 3) + labs(title = "Relação entre pétala e sépala", subtitle = "Somente altura (cm)")
