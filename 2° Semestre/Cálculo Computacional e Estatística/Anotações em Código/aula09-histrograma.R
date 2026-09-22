# Criando um Data Frame com todos os arquivos do grupo
df_gruop = rbind(dados.arthur,
                 dados.emanuelly,
                 dados.enzo,
                 dados.gustavo,
                 dados.maria,
                 dados.rafael)

# Removendo os demais Data Frames que não seram necessários
rm(dados.arthur,
   dados.emanuelly,
   dados.enzo,
   dados.gustavo,
   dados.maria,
   dados.rafael)

# Criando um gráfico do tipo histograma
hist(main = "Histograma de uso de CPU", # Colocando um título no meu histograma
     xlab = "CPU (%)", # Coloando uma legenda no eixo x
     ylab = "Frequência", # Colocando uma legenda no eixo y
     col = "#00FBCD", # Colocando uma cor nas barras
     df_gruop$cpu)

# primeira regra do histograma - é um gráfico e possui barras, mas não é um gráfico de barra.
# Histograma olha a frequência

# Criando um gráfico de barras
df_gruop$status_cpu <- ifelse(df_gruop$cpu < 40, "Ruim", "Bom") # Criando uma nova variável no meu Data Frame

barplot(table(df_gruop$status_cpu)) # A função barplot já espera uma tabela
# Função table já organiza a quantidade de regitros de acordo com um certo paramêtro 
table(df_gruop$status_cpu)
# Nesse exemplo, ele separa em quantos foram "Bom" e quantos foram "Ruim"

# Plot é utilizada para observar uma relação entre variavéis
plot(df_gruop$cpu, df_gruop$ram)
