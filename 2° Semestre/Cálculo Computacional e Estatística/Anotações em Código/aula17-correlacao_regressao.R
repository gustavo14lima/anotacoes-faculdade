# Criando um DataFrame com valores quantitativos
df_aluno <- data.frame(
  nota = c(9, 8, 7, 10, 7, 4, 5, 6, 2, 6),
  tempo_ia = c(2, 3, 1, 5, 3, 15, 13, 17, 40, 7)
)

# cor() -> função para criar uma correlação linear entre duas variáveis quantitativas
correlacoa <- cor(df_aluno$nota, df_aluno$tempo_ia) 

# lm() -> função para criar uma regressão linear entre duas variáveis
regressao <- lm(df_aluno$nota ~ df_aluno$tempo_ia)

# Variável Dependente: É o resultado ou o fenômeno que você quer explicar, prever ou entender. (Seria o valor a esquerda do ~)
# Variavel independente: É o fator ou a característica usada para explicar ou prever a variável dependente. (Seria o valor a direita do ~)

# Nesse exemplo, a variável nota depende da variável tempo_ia para comprovar se o tempo que um aluno fica usando IA influencia na sua nota

# O summary() é utilizado para resumir e trazer resultados mais detalhados em relação ao resultado da regressão que calculamos anteriormente
summary(regressao)

library(ggplot2)

ggplot(df_aluno, aes(tempo_ia, nota)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)
