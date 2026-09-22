# Armazene os dados em uma variável
df_notas = rbind(entregas.ccoa)

# Visualize as primeiras linhas do dataset
head(df_notas)

# Calculando métricas de cada entregavél

# Calculos da Entrega 01

# Média
round((mean(df_notas$Entrega.01)), 2) # OutPut: 8.73

# Mediana
round((median(df_notas$Entrega.01)), 2) # OutPut: 8.75

 # Desvio padrão
round((sd(df_notas$Entrega.01)), 2) # OutPut: 1.8

# Calculos da Entrega 02

# Média
round((mean(df_notas$Entrega.02)), 2) # OutPut: 8.84

# Mediana
round((median(df_notas$Entrega.02)), 2) # OutPut: 9.02

# Desvio padrão
round((sd(df_notas$Entrega.02)), 2) # OutPut: 1.04

# Calculos da Entrega 03

# Média
round((mean(df_notas$Entrega.03)), 2) # OutPut: 6.52

# Mediana
round((median(df_notas$Entrega.03)), 2) # OutPut: 6.88

# Desvio padrão
round((sd(df_notas$Entrega.03)), 2) # OutPut: 1.88


# As notas são parecidas entre os alunos ou muito diferentes?
  # É possível vr uma diferença entre as notas dos alunos, especialmente pela diferença entre os desvios padrão. Se compararmos
  # o desvio padrão da Entraga 02, que retornou 1.04 com o da Entrega 03 é 1.88, assim concluimos um grande vão entre as notas. 

# Existe alguma entrega com maior variação de notas?
  # Existe, sendo a Entrega 03. Se comparada om a Entrega 02, ela possui uma variação de 0.82, o que é uma variação consideravél. 

# A média representa bem os dados em todos os casos?
  # A média não necessariamente é uma boa representação e visualização dos casos, por causa dos outliers. A melhor opção, é observar
  # a média junto com o desvio padrão, e assim criar um gráfico para melhor visualização

# O desvio padrão ajuda a entender o comportamento das notas? Como?
  # Ajuda, por causa que, com o desvio padrão, eu posso observar a quantidade variação de uma nota com outra. Por exemplo, posso
  # observar a quantidade de pessoas que tiraram entre um determinado vão de notas.

# Existe alguma evidência de distribuição normal? Justifique com base nos gráficos.

  # Histrograma Entrega 01
  hist(main = "Histograma das Entregas 01",
       xlab = "Notas", 
       ylab = "Frequência", 
       col = "#00FBCD",
       df_notas$Entrega.01)
  abline(v = round((mean(df_notas$Entrega.01)), 2), col = "red", lwd = 3, lty = 2) # Linha da média
  abline(v = round((median(df_notas$Entrega.01)), 2), col = "blue", lwd = 3, lty = 2) # Linha da mediana
  
  # Histrograma Entrega 02
  hist(main = "Histograma das Entregas 02",
       xlab = "Notas", 
       ylab = "Frequência", 
       col = "#00FBCD",
       df_notas$Entrega.02)
  abline(v = round((mean(df_notas$Entrega.02)), 2), col = "red", lwd = 3, lty = 2) # Linha da média
  abline(v = round((median(df_notas$Entrega.02)), 2), col = "blue", lwd = 3, lty = 2) # Linha da mediana

  # Histrograma Entrega 03
  hist(main = "Histograma das Entregas 03",
       xlab = "Notas", 
       ylab = "Frequência", 
       col = "#00FBCD",
       df_notas$Entrega.03)  
  abline(v = round((mean(df_notas$Entrega.03)), 2), col = "red", lwd = 3, lty = 2) # Linha da média
  abline(v = round((median(df_notas$Entrega.03)), 2), col = "blue", lwd = 3, lty = 2) # Linha da mediana
  
  # De acordo com os histrograma criados e analisados, eles não possuem um formato de um sino simétrico, assim como em uma distribuição 
  # normal. Em resumo, a maiorida dos histrogramas estão concentrados mais entre 8 e 10 (Sendo a Entrega 01 e Entrega 02) e a Entrega
  # 03 possui uma maior semelhança com o distribuição normal, tendo os dados entre 3 e 10.
  
# Parece simétrica (normal)?
  # Não possui uma simétria, pois existe uma concentração muito grande em apenas um intervalo de notas. Como por exemplo, as 
  # respostas dos histrogramas resultaram em uma concentração mais entre 8 e 10 (Sendo a Entrega 01 e Entrega 02)
  
# Existe assimetria? Para qual lado?
  # Existe uma assimetria entre os histrogramas, pois, utilizando os   histrogramas das Entrega 01 e Entrega 02, os resultados
  # entrão mais concetrados entre as notas 8 e 10.
  
# Qual entrega teve maior média?
  # A entrega com a maior média foi a Entrega 02, com 8.84.
# Qual teve maior desvio padrão?
  # A entrega com o maior desvio padrão foi a Entrega 03, com 1.88.  
  
# Em qual atividade os alunos tiveram melhor desempenho?
  # A atividade que os alunos tiveram um melhor desempenho foi a entrega 02, por causa do seu alto valor de média e mediana
  # e o seu baixo valor de desvio padrão.
  
# Em qual houve maior dificuldade ou desigualdade?
  # A atividade que os alunos tiveram maior dificuldade ou desigualdade foi a entrega 03. Por causa da sua baixa média e mediana
  # em comparaçã com as outras entregas, o seu alto desvio padrão e a sua alta dispersão de notas no histrograma.
  
# Calcule a média final de cada aluno utilizando as três entregas.
  media_aluno <- rowMeans(df_notas[, c("Entrega.01", "Entrega.02", "Entrega.03")], na.rm = TRUE)
  media_aluno

# Adicione essa média como uma nova coluna no data frame.
  df_notas$Media.Entregas <- media_aluno  

# Aluno com maior média
  max(df_notas$Media.Entregas) # Output: 9.358025
# Aluno com menor média
  min(df_notas$Media.Entregas) # Output: 3.049383
# Gere um gráfico (ex: histograma) com as médias finais.
  hist(main = "Histograma das Entregas 03",
   xlab = "Média Final", 
   ylab = "Frequência", 
   col = "#00FBCD",
   df_notas$Media.Entregas)  
  