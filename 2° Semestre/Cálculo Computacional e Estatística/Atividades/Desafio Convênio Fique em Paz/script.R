# Determinando uma semente para padronizar valores
set.seed(42)

# Determinado o total de conveniados
conveniados.total <- 189000

# Utilizando apenas 32% daqueles que precisaram de atendimento na rede de pronto-socorro
conveniados.total <- 189000 * 0.32

# Utilizando Dados da Pesquisa Nacional de Saúde / IBGE, para descobrir a porcentagem de cada faixa etária ter um convênio médico
# https://www.scielosp.org/pdf/csc/2021.v26suppl1/2529-2541/pt

# Criança: 21%
# Adolescente: 23%
# Adulto: 29% 
# Idoso: 27%

# Valores já calculados de acordo com o grupo racial de cada faixa etária (a população branca possui quase o dobro de porcetagem que a população negra)

conveniados.separado.faixa.etaria <- sample(
                                            c("Criança", "Adolescente", "Adulto", "Idoso"), 
                                            conveniados.total,
                                            replace = TRUE,
                                            prob = c(0.21, 0.23, 0.29, 0.27)
                                      )

# Colocando uma idade para cada faixa etária
idades.simuladas <- ifelse(conveniados.separado.faixa.etaria == "Criança", sample(7:12, sum(conveniados.separado.faixa.etaria == "Criança"), replace = TRUE),
                           ifelse(conveniados.separado.faixa.etaria == "Adolescente", sample(13:17, sum(conveniados.separado.faixa.etaria == "Adolescente"), replace = TRUE),
                                  ifelse(conveniados.separado.faixa.etaria == "Adulto", sample(18:54, sum(conveniados.separado.faixa.etaria == "Adulto"), replace = TRUE),
                                         sample(55:82, sum(conveniados.separado.faixa.etaria == "Idoso"), replace = TRUE))))

# Separando apenas as faixa etárias que irei analisar
qtd.conveniados.adolescente <- sum(conveniados.separado.faixa.etaria == "Adolescente")
qtd.conveniados.idosos <- sum(conveniados.separado.faixa.etaria == "Idoso")

# Selecionando a quantidade de crianças de idosos com problemas respiratórios 

# Pesquisa feita pela "Hospital Paulista" afirma que crianças e adolescentes possuem 20% de chances de ter problemas respiratórios
# https://www.hospitalpaulista.com.br/30-da-populacao-brasileira-sofre-de-doencas-respiratorias-afirmam-especialistas-do-hospital-paulista/

# Pesquisa feita pela "National Library of Medicine" afirma que idosos possuem 7% de chances de ter problemas respiratórios
# https://pmc-ncbi-nlm-nih-gov.translate.goog/articles/PMC10961796/?_x_tr_sl=en&_x_tr_tl=pt&_x_tr_hl=pt&_x_tr_pto=tc

qtd.conveniados.adolescente.problemas.respiratorios <- qtd.conveniados.adolescente * 0.20
qtd.conveniados.idosos.problemas.respiratorios <- round(qtd.conveniados.idosos * 0.07)

# Armazenando os conveniados que possuem problemas respiratórios em uma variável
conveniados.problemas.respiratorios <- c(
  Adolescentes = qtd.conveniados.adolescente.problemas.respiratorios,
  Idosos = qtd.conveniados.idosos.problemas.respiratorios
)

# Fazendo um histograma para identificar a média/pico de idade com mais atendimentos (Pergunta 1)
hist(idades.simuladas, 
     )breaks = seq(5, 85, by = 5, 
     xaxt = "n",
     main = "Histograma e Pico de Atendimentos por Idade", 
     xlab = "Idade", 
     ylab = "Frequência"
)

axis(side = 1, at = seq(5, 85, by = 5))

# Fazendo um gráfico de barras geral
barplot(
    table(conveniados.separado.faixa.etaria),
    main = "Quantidade de Convênio médico de acordo com Faixa Etárias"
)

# Criando um gráfico de barras que mostra a relação de problemas respiratórios
barplot(conveniados.problemas.respiratorios,
        main = "Conveniados com Problemas Respiratórios (Priorização)",
        ylab = "Quantidade"
)

# Calculando o percentual de cada grupo em relação ao total com problemas respiratórios
total.problemas <- sum(conveniados.problemas.respiratorios)
percentual.grupos <- (conveniados.problemas.respiratorios / total.problemas) * 100

percentual.grupos
