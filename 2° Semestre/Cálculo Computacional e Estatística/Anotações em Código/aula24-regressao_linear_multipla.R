# regressão multipla - efeito simultâneo de vários fatores e isolar o impacto de cada um deles

# Variaveis indepententes
cor(hospital$ciclismo, hospital$fumo) # não tem relação forte entre as variaveis
                                              # coeficinetes angulares
regressao <- lm(hospital$problema_cardiaco ~ hospital$fumo + hospital$ciclismo)

summary(regressao) # esse modelo explica 97% da variação (R²)

# cardiaco e fumo = alto (positivo) -> quanto mais você fuma, seus problemas cardiacos aumentão 17%
# cardiaco e ciclimos = abaixa (negativo) -> quanto mais você pedala, seus problemas cardiacos diminuiem 20%

# com esse modelo, eu rejeito a hipotese nula (fumar não dá problema cardiaco) -> de acordo com o sumary, o p-valor avisa que
# é muito baixo, ou seja, tem uma maior significancia estastitisca (tem bastante estrelinha no p-valor).

# adicionando uma nova variavel no coeficiente angular, o valor pode mudar.
# Ex: um ciclista pode fumar, ele vai ficar encima da "reta" (lembrar da aula da giu)

library(ggplot2)

ggplot(hospital, aes(ciclismo, problema_cardiaco)) +
  geom_point(aes(colour = fumo)) + 
  geom_smooth(method = "lm", se = FALSE, colour = "red") 

install.packages("plotly")

library(plotly)
plot_ly(hospital, x= ~fumo, y= ~ciclismo, z= ~problema_cardiaco, color = ~fumo)
