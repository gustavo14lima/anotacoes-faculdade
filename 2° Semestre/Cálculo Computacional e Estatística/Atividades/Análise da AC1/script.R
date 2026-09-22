# Importando o CSV
df_notas = rbind(`notas.ccoa(Planilha2)`)
df_notas

# Fazendo a média de cada nota 
mean(df_notas$Entrega.01) # Output: 8.290476
mean(df_notas$Entrega.02) # Output: 9.68254
mean(df_notas$Entrega.03) # Output: 7.903175
mean(df_notas$Pratica) # 9.066667
mean(df_notas$Integrada) # 7.149206

# Fazendo a mediana de cada nota
median(df_notas$Entrega.01) # Output: 8.8
median(df_notas$Entrega.02) # Output: 10
median(df_notas$Entrega.03) # Output: 8.2
median(df_notas$Pratica) # Output: 9.2
median(df_notas$Integrada) # Output: 7.2

# Fazendo o desvio padrão de cada nota
sd(df_notas$Entrega.01) # Output: 2.051806
sd(df_notas$Entrega.02) # Output: 1.767314
sd(df_notas$Entrega.03) # Output: 2.21905
sd(df_notas$Pratica) # Output: 0.7403138
sd(df_notas$Integrada) # Output: 1.049865

# Fazendo um histograma para cada nota
hist(df_notas$Entrega.01,
    main="Histograma da Entrega 01",
    xlab="Notas",
    ylab="Frequência")

hist(df_notas$Entrega.02,
     main="Histograma da Entrega 02",
     xlab="Notas",
     ylab="Frequência")

hist(df_notas$Entrega.03,
     main="Histograma da Entrega 03",
     xlab="Notas",
     ylab="Frequência")

hist(df_notas$Pratica,
     main="Histograma da Prática",
     xlab="Notas",
     ylab="Frequência")

hist(df_notas$Integrada,
     main="Histograma da Integrada",
     xlab="Notas",
     ylab="Frequência")


# As notas são próximas ou apresentam muita variação?
  # Em relação a todas as notas, elas possuem uma pequena variação, entre 1 e 2 pontos no máximo. Se compararmos o desvio padrão
  # A entrega 01 possui 2 pontos e a prática possui 0.7. Isso pode apresentar a evolução dos alunos e quanto eles estão se preparando
  # para as provas.

# Qual entrega apresentou maior dispersão?
  # A entrega que possui uma maior dispersão é a integrada. Por causa da sua quantidade de colunas e números de frequência, enquanto
  # as demais entregas possuem três ou duas colunas, a entregada possui 6 colunas.

# As distribuições parecem simétricas ou assimétricas?
  # De acordo com a minha analise sobre os histogramas, as distruições parecem mais assimétricas do que simétricas, por causa
  # de uma alta concetração em uma estremidade só. Com excessão da integrada, pois ela é a que mais assemelha com a famosa 
  # "curva de sino", assim sendo práticamente simétrica.
  
# A média parece representar bem as notas?
  # A média não é uma boa representação das notas, por causa dos outliers. Alguns alunos faltaram ou não entregaram algumas entregas
  # isso faz com que a média da entrega possa ser puxada para baixo ou mostrar um valor errado. Um exemplo seria a integrada, pois
  # sua média está em torno de de 7 e o seu desvio padrão está em torno de 1.

# Há indícios de uma distribuição aproximadamente normal?
  # A distruição que mais se aproxima do normal, ou seja, de fazer a "curva de sino", é a integrada. Ela não chega a fazer a curva
  # perfeitamente, mas se aproxima bem.

# Qual teve a maior média?
  # A maior média foi a da entrega 02. Uma hipotese para isso, seria a liberdade e criatividade que os alunos tiveram para criar
  # o próprio código python sobre o calculo de IMC.

# Qual apresentou maior desvio padrão?
  # A entrega que possui um maior desvio padrão foi a Entrega 03. Uma justificativa para isso foi a quantidade de faltas que essa
  # entrega teve e também pelo assunto estar próximo da prova, então, pelos alunos estiverem estudando para a prova e pela quantidade
  # de faltas, ocausionou em um alto desvio padrão.

# Em qual entrega a turma teve melhor desempenho?
  # A entrega que a turma teve um melhor desempenho foi a entrega 02. Analisando o histograma, ele está com aproximadamente 60
  # de frequência com notas entre 8 e 10. Além disso, ele possui uma nota em torno de 9 em relação a média e mediana. Por fim,
  # possui o mais baixo desvio padrão. Uma hipotese para isso, seria a liberdade e criatividade que os alunos tiveram para criar
  # o próprio código python sobre o calculo de IMC.

# Em qual houve maior desigualdade entre as notas?
  # A entrega com o maior desigualdade entre as notas, seria a entrega 03. Por causa da sua dispersão entre as colunas (mesmo)
  # e pela quantidade grande variação do desvio padrão. Uma justificativa para isso foi a quantidade de faltas que essa
# entrega teve e também pelo assunto estar próximo da prova, então, pelos alunos estiverem estudando para a prova e pela quantidade
# de faltas, ocausionou em um alto desvio padrão.

# Calcule a média final de cada aluno, adicionando-a como uma nova coluna no dataset
media_aluno <- rowMeans(df_notas[, c("Entrega.01", "Entrega.02", "Entrega.03", "Pratica", "Integrada")], na.rm = TRUE)
media_aluno

df_notas$Media.Entregas <- media_aluno 
