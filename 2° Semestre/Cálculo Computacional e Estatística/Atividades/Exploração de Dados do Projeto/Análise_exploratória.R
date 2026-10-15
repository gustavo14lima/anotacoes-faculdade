library(corrplot)

dados <- MF.SPTECH.001

dados_quantitativos <- dados[, c("Porcentagem_CPU", "Freq_CPU",
                                 "Porcentagem_RAM", "Load")]

matriz_cor <- cor(dados_quantitativos)

corrplot(matriz_cor,
         method = "color",
         col = colorRampPalette(c("#EAF2F8", "#2F6FA3"))(200),
         addCoef.col = "black",
         tl.col = "black")

regressao_cpu_ram <- lm(Porcentagem_RAM ~ Porcentagem_CPU, data = dados)

plot(dados$Porcentagem_CPU, dados$Porcentagem_RAM,
     main = "Uso de RAM em funcao da CPU",
     xlab = "Uso de CPU (%)",
     ylab = "Uso de RAM (%)",
     pch = 16,
     col = "darkblue")
abline(regressao_cpu_ram, col = "red", lwd = 2)

regressao_cpu_load <- lm(Load ~ Porcentagem_CPU, data = dados)

plot(dados$Porcentagem_CPU, dados$Load,
     main = "Load em funcao da CPU",
     xlab = "Uso de CPU (%)",
     ylab = "Load",
     pch = 16,
     col = "darkblue")
abline(regressao_cpu_load, col = "red", lwd = 2)

regressao_ram_load <- lm(Porcentagem_RAM ~ Load, data = dados)

plot(dados$Load, dados$Porcentagem_RAM,
     main = "Uso de RAM em funcao do Load",
     xlab = "Load",
     ylab = "Uso de RAM (%)",
     pch = 16,
     col = "darkblue")
abline(regressao_ram_load, col = "red", lwd = 2)

