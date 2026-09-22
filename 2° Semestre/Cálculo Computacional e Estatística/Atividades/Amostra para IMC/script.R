# Fonte de Pesquisa referente a maioria dos pontos relacionados ao perfil dos alunos:
  # https://comunica.ufu.br/noticias/2019/05/pesquisa-revela-perfil-do-estudante-universitario-brasileiro

# Fonte de Pesquisa referente a cada probabilidade de cada classificação do IMC e para saber os pesos das matérias:
  # https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=CAEShQEB6zswFWCrj2H1z6yjtqqYdAzAclzCsEQjKC-Gn-sITYnk4nSfKSWYtBhZM5MXLcBkBzMumxz4Wcia6YdfjnX6pHP9BvOMDyttPdf-7tJ7B4_x-Jr1j2Xtg0qfD-iS7z39LEzDXLReD88cr2t5wVtadOVvycJw7Eztnv-pXcucBX2VCX0w&ved=2ahUKEwiylty85PWWAxUOppUCHV7YAAoQFnoECDEQAQ&uoh=2&usg=AOvVaw1VhEzONugBf6Vp5vRfyebd

# Fonte de Pesquisa refernte para a quantidade de universitários que fumam:
  # https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=CAEScwHrOzAVMjvKWly2Ac_N8RBEq9cHaDbgC4XvpoZOSy-s1rXeqGR_AVRj2XZcpCUosU6I_uR4ryvhK9ZDqN7QX2vzJzCeowuEbvBg6yRB3e1-tu9dyqQFcoH9W48h6y1cMFZJSL01oJG82gu5BdNxpnAjKN4&ved=2ahUKEwj5itL48fWWAxW-q5UCHbIlN_wQFnoECCwQAQ&uoh=2&usg=AOvVaw35cFUwW7TzEBISl0dbO2z9

# Criando as variaveis
numeros_casos <- 200
idade <- round(
              sample(
                c(18:30), 
                numeros_casos, 
                replace = TRUE,
                prob = c(0.2, 0.15, 0.2, 0.18, .14, 0.15, 0.2, 0.24, 0.14, 0.12, 0.1, 0.09, 0.08)
                ), 0)

altura <- round(rnorm(n = numeros_casos, mean = 1.80, sd = 0.20), 2)
peso <- round(rnorm(n = numeros_casos, mean = 70, sd = 10), 2)

# Baixo do Peso - Menor ou até 18.5
# Peso Ideal - Entre 18.6 até 24.9
# Acima do Peso - Entre 25.0 até 29.9
# Obesidade grau I - Entre 30.0 até 34.9

imc <- sample(
  c('Baixo do Peso', 'Peso Ideal', 'Acima do Peso', 'Obesidade grau I'),
  numeros_casos,
  replace = TRUE,
  prob = c(0.0, 0.5, 0.44, 0.06)
)

sexo <- sample(
  c('Masculino', 'Feminino'),
  numeros_casos,
  replace = TRUE,
  prob = c(0.45, 0.55)
)

semestre_cursando <- sample(
  c(1, 2, 3, 4, 5, 6, 7, 8),
  numeros_casos,
  replace = TRUE
)

curso <- sample(
  c('Biociências', 'Ciências Exatas', 'Humanidades'),
  numeros_casos,
  replace = TRUE,
  prob = c(0.49, 0.125, 0.385)
)

fumante <- sample(
  c('Fumante', 'Não Fumante'),
  numeros_casos,
  replace = TRUE,
  prob = c(0.49, 0.51)
)

renda.per.capita <- sample(
  c('Até 1 Sálario Miníno e Meio', 'Até 3 Sálario Miníno e Meio', 'Mais de 3 Sálario Miníno e Meio'),
  numeros_casos,
  replace = TRUE,
  prob = c(0.70, 0.16, 0.10)
)

# Criação de um data frame a partir das variaveis
df_universitarios <- data.frame(Idade = idade, Altura = altura, Peso = peso, IMC = imc, Sexo = sexo, Semestre_Cursando = semestre_cursando, Curso = curso, Fumante = fumante, Renda_Per_capita = renda.per.capita)

# Gerando gráficos de barras e histogramas para cada coluna do meu data frame
barplot(table(df_universitarios$Idade), xlab = "Idades", ylab = "Quantidade")

hist(df_universitarios$Altura, main = "Frequências de Altura", xlab = "Alturas", ylab = "Frequência")

hist(df_universitarios$Peso, main = "Frequência de Peso", xlab = "Pesos", ylab = "Frequência")

barplot(table(df_universitarios$IMC), xlab = "Classificação IMC", ylab = "Quantidade")

barplot(table(df_universitarios$Sexo), xlab = "Sexo", ylab = "Quantidade")

barplot(table(df_universitarios$Semestre_Cursando), xlab = "Semestre", ylab = "Quantidade")

barplot(table(df_universitarios$Curso), xlab = "Cursos", ylab = "Quantidade")

barplot(table(df_universitarios$Fumante), xlab = "É ou Não Fumante", ylab = "Quantidade")

barplot(table(df_universitarios$Renda_Per_capita), xlab = "Renda per capita", ylab = "Quantidade")

# Compare os gráficos com algum colega, a amostra produzida foi exatamente igual?
  # Neste código, os gráficos não serão exatamente iguais, por causa da aleatoriedade das minhas variáveis. Toda vez que eu 
  # inicializo ou executo qualquer variável novamente, ela terá um novo valor. Caso eu queira que ela tenha uma "aleatoriedade"
  # padrão, eu poderia criar um set.seed(), que serve para inicializar o gerador de números pseudoaleatórios, garantindo que 
  # resultados aleatórios possam ser reproduzidos exatamente iguais em execuções futuras.