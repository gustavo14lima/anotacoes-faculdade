# Unificando todos os registros em um único data frame
df_grupo = rbind(dados.arthur,
                 dados.emanuelly,
                 dados.enzo,
                 dados.gustavo,
                 dados.maria,
                 dados.rafael)


# Excluindo todos os outros data frames que não seja o unificado
rm(dados.arthur,
   dados.emanuelly,
   dados.enzo,
   dados.gustavo,
   dados.maria,
   dados.rafael)


# Calculando a média de cada componente
mean(df_grupo$ram) # Média de RAM
mean(df_grupo$cpu) # Média de CPU
mean(df_grupo$disco) # Média de Disco

# Descobrindo o valor máximo de cada componente
max(df_grupo$ram) # Valor máximo de RAM
max(df_grupo$cpu) # Valor máximo de CPU
max(df_grupo$disco) # Valor máximo de Disco

# Descobrindo o valor minímo de cada componente
min(df_grupo$ram) # Valor minímo de RAM
min(df_grupo$cpu) # Valor minímo de CPU
min(df_grupo$disco) # Valor minímo de Disco

# Criando um plot (gráfico de dispersão)
plot(df_grupo$ram,
     df_grupo$cpu,
     xlab = "Porcentagem de uso de memória RAM (%)",
     ylab = "Porcentagem de uso de CPU (%)")
