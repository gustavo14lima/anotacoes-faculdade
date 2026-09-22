n <- 200 # Número do meu úniverso amostral. De tudo o meu espaço amostral, eu quero analisar apenas registros até este número
set.seed(123) # Criando uma semente de aleatoriedade. Sempre vai resultar no mesmo conjunto aleatório. Garantindo que os 
                # resultados de códigos que usam aleatoriedade possam ser reproduzidos exatamente iguais em execuções futuras.
opcoes_carro <- c(0:3) # Crio uma sequência de número de 0 à 3

# sample() -> gerando uma amostra aleatória dos elementos de um conjunto de dados.
amostra_qtd_carros <- sample(opcoes_carro, n, 
                             replace = TRUE, # replace = TRUE -> eu falo que esse sample terá repetição de valor
                             prob = c(0.4, 0.2, 0.3, 0.1)) # Eu estou mexendo na probabilidade de cada item sair 
                                                          # (Cada indice do c() é um indice da minha variável opcao_carro)
                                                          # Exemplo: Ter 0 carro possui uma probabilidade de 40%, ou seja, 0.4

# rnorm() é um função que gera registros aleatórios seguindo uma distribuição normal, ou seja, seguindo a Curva de Gauss. 
rnorm(n, # quantidades de registros a serem simulados
    mean = 10, # a média dos meus registros estaram em torno de 10. Como se fosse a base para gerar meus registros aleatórios
     sd = 10) # o desvio padrão dos meus registros estaram por volta de 10. Ou seja, os meus registros poderam ser 0 a mais da 
            # minha base  ou 10 a mais da minha base, podendo resultar em registros igual a 10, 10.5, 11 ou até 19.5, 20, 19.6 
            # e por ai vai.
            # Lembre-se de definir a quantidade de casas decimais limite que gostaria que seus registros tivessem.

# sd() é a função utilizada para calcular o desvio padrão de uma determinada variável.
# Lembre-se que, quando maior o desvio padrão, maior o "gap" ou a variação os seus registros tem.
# quando menor o desvio padrão, menor a variação dos seus registros, e também mais perto da média eles estaram.
sd(variavel) 

amostra_qtd_carros

barplot(table(amostra_qtd_carros))

# A principal diferença entre a função rnorm() e a função sample() é que a função rnorm() gera números aleatórios 
# seguindo uma distribuição normal, enquanto a função sample() retira uma amostra aleatória a partir de um conjunto
# de elementos que você já possui ou especificou.