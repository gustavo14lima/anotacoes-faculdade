# Data frame - uma tabela com linhas e colunas, exemplo, .csv

# Padrão de nomenclatura = o comum é separar por ponto, mas por questões acadêmicas, usaremso o _

# Criando o primeiro data  frame em R
df_teste <- data.frame(
  nome = c("Aiku", "Don", "Snuffy", "Nico", "Barou"),
  idade = c(19, 19, 42, 17, 18),
  salario = c(600000, 320000, 500000, 42000, 130000)
)

# Mostrando uma prévia do seu data frame (como se fosse o cabeçalho)
head(df_teste)

# Mostra as dimensões do data frame
dim(df_teste) # Linhas e Colunas

# Calculando a media de um data frame
mean(df_teste$idade) # A coluna precisa ser de um tipo númerico

# Calculando a mediana de um data frame
median(df_teste$idade)

# Mostrando todos os registros de uma determinada coluna
df_teste$idade

# Exibindo um determinando registro na coluna e linha
df_teste[1,2]

# Exibindo apenas a linha
df_teste[1,]

# Exibindo apenas a coluna
df_teste[, 3]

# Filtrando as linhas das colunas
# Aqui eu estou falando que quero todas as linhas que a idade for maior que 17
df_teste[df_teste$idade > 17,]

# Pegando um valor minimo de uma coluna especifica do data frame 
min(df_teste$idade)

# Pegando um valor maximo de uma coluna especifica do data frame
max(df_teste$idade)

# Traz um relatorio geral de cada coluna (um resumo estatistico)
summary(df_teste)

# Quartil - divisão do data frame em quatro

# Criando uma coluna nova no data frame
df_teste$ganha_bem <- "Sim"

# inserindo uma nova coluna usando condicional
df_teste$ganha_bem <- df_teste$salario > 50000 # returna um tipo de dado booleano
df_teste$ganha_bem <- ifelse(df_teste$salario > 50000, "Ganha bem", "Não ganha bem (como foi para a copa?)") # Confição, saida verdadeira, saida falsa

# Estudar mais sobre a função "cut()"

# Apagando uma coluna
df_teste$ganha_bem <- NULL

# Comando rbin() junta as linhas de dois CSVS (ou seja, data frame) diferentes

# Mostra a estrutura de um data frame
str(df_teste)
