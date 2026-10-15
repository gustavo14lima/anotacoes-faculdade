library(ggplot2)

df_gamba = rbind(possum)

# use = "complete.obs" -> faz uma uma limpeza linha por linha antes de calcular a correlação

# Correlação entre Comprimento da Cabeça e Largura do Crânio
correlacao_cabeca_cranio <- cor(df_gamba$hdlngth, df_gamba$skullw)
regressao_cabeca_cranio <- lm(df_gamba$hdlngth ~ df_gamba$skullw)
summary(regressao_cabeca_cranio) # A Cada 46.20mm de comprimento de cabeça, aumenta 0.8mm de largura de crânio

ggplot(df_gamba, aes(hdlngth, skullw)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

# Correlação entre Comprimento Total e Comprimento da Cabeça
correlacao_total_cabeca <- cor(df_gamba$totlngth, df_gamba$hdlngth)
regressao_total_cabeca <- lm(df_gamba$totlngth ~ df_gamba$hdlngth)
summary(regressao_total_cabeca) # A cada 9.88cm de Comprimento Total, aumenta 0.8mm de comprimento de cabeça

ggplot(df_gamba, aes(totlngth, hdlngth)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

# Correlação entre Comprimento da Orelha e Comprimento do Pé
correlacao_orelha_pe <- cor(df_gamba$earconch, df_gamba$footlgth, use = "complete.obs")
regressao_orelha_pe <- lm(df_gamba$earconch ~ df_gamba$footlgth)
summary(regressao_orelha_pe) # A cada -1.25cm de Comprimento de Orelha, Aumenta 0.72cm de Pé

ggplot(df_gamba, aes(earconch, footlgth)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

# Correlação entre Perímetro do Peito e Comprimento da Cabeça
correlacao_peito_cabeca <- cor(df_gamba$chest, df_gamba$hdlngth, use = "complete.obs")
regressao_peito_cabeca <- lm(df_gamba$chest ~ df_gamba$hdlngth)
summary(regressao_peito_cabeca) # A cada -6.47cm de Perímetro de Peito, aumenta 0.36mm de Comprimento de Cabeça

ggplot(df_gamba, aes(chest, hdlngth)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

# Correlação entre Idade e Comprimento Total
correlacao_idade_comprimento <- cor(df_gamba$age, df_gamba$totlngth, use = "complete.obs")
regressao_idade_comprimento <- lm(df_gamba$age ~ df_gamba$totlngth)
summary(regressao_idade_comprimento)

ggplot(df_gamba, aes(age, totlngth)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)
  
# Correlação entre Comprimento Total e Barriga
correlacao_comprimento_barriga <- cor(df_gamba$totlngth, df_gamba$belly, use = "complete.obs")
regressao_comprimento_barriga <- lm(df_gamba$totlngth ~ df_gamba$belly)
summary(regressao_comprimento_barriga) # A Cada 60.66cm de Comprimento Total, aumenta 0.81cm de Barriga

ggplot(df_gamba, aes(totlngth, belly)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

# Correlação entre Tamanho dos olhos e Largura do Crânio
correlacao_olho_cranio <- cor(df_gamba$eye, df_gamba$skullw)
regressao_olho_cranio <- lm(df_gamba$eye ~ df_gamba$skullw)
summary(regressao_olho_cranio) # A Cada 8.86mm de tamanho de olho, aumenta 0.10mm de largura do crânio

ggplot(df_gamba, aes(eye, skullw)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

# Com toda a analise feita, é possível afirmar que a correlação entre os atributos físicos do gambás-de-cauda-de-escova-da-montanha
# são positivos e forte, entretanto a idade ou sexo não influência muito em relação ao desenvolvimento e tamanho de seus atributos físicos
# tento uma relação positiva fraca, igual ao tamanho do olho e a largura do crânio.