df_cliente <- data.frame(
  nome = c("Bob", "Tom", "Ian", "Mel", "Dan"), # Representação: Variável qualitativa nominal
  idade = c(20, 30, 25, 17, 50), # Representação: Variável quantidade discreta
  salario = c(3000.4, 5000.1, 4000.5, 1500.7, 8000.5), # Representação: Variável qualitativa contínua 
  area = factor(
    c("Humanas", "Exatas", "Biológicas", "Exatas", "Humanas"),
    label = c("Humanas", "Exatas", "Biológicas")# Etiqueta da categorização. Os valores do meu vetor só podem ter 
                                                # aqueles que estão dentro do Label.
  ), # Factor = vetor
  plano = factor(
    c("Prata", "Bronze", "Prata", "Ouro", "Bronze"),# Representação: Variável qualitativa ordenal
    labels = c("Prata - Beta", "Bronze - Normal", "Ouro - Aura"), # Etiqueta. Posso colocar um nome mais agradavél
    levels = c("Prata", "Bronze", "Ouro"),
    ordered = TRUE # Eu falo que esse vetor é ordenado
  )
)

data("iris")

# Crio uma nova coluna no meu dataframe
iris$NivelAlturaPetala <- factor(
  cut(iris$Petal.Length, c(0.9, 2, 4, 7)), # Recorto de acordo com uma coluna existente
  labels = c("Pequena", "Média", "Grande"), # Falo que a altura das petalas no intervalo de 0.9 e 2, será inserido na coluna "Pequena"
  ordered = TRUE
)

df_cliente$plano
