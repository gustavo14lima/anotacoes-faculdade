dados <- data.frame(
  adubo  = factor(rep(c("A", "B", "C"), each = 5)),
  altura = c(20, 22, 19, 21, 23,  
             24, 25, 23, 26, 22,  
             28, 27, 29, 26, 30)
)

# Médias por grupo
print(aggregate(altura ~ adubo, data = dados, FUN = mean))

# ANOVA - Analise de variança (abre uma serie de possibilidade para analise de variaveis categoricas). O resto, quantitativas
# Calcula a influencia de uma variavel categoria em uma varivael qualitativa

# variança = desvio padrão sem raiz quadrada -> raiz quadrada retira a unidade de medida. Mostra quanto os valores se afastam 
# da média.

# ANOVA:
# compara a variança geral/global com a variança individual. 
# Se a diferença da valor de comparação das varianças (geral com a individual) foi muito grande, maior a variavel categorica está interferindo
# Quanto mais perto de um, menor o efeito a variavel categoria possui. 
# f-value (quanto mais próximo de 1, menos impacto), valor para achar a comparação das variaveis

# f-value = variança geral (61.67) / variança entre grupos (2.5)

# Boxplot ou curva de gaus igual, nenhuma variança. 

modelo_anova <- aov(altura ~ adubo, data = dados)

# Tabela ANOVA
summary(modelo_anova)

# p-value - significancia estatisitica 


# Post-hoc (quais grupos diferem)
# Teste de Tukey
TukeyHSD(modelo_anova)

# Gráficos 
boxplot(altura ~ adubo, data = dados,
        col = c("#9ecae1", "#a1d99b", "#fdae6b"),
        main = "Altura das plantas por tipo de adubo",
        xlab = "Adubo", ylab = "Altura (cm)")