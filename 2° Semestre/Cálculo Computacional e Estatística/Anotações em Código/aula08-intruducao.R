# Atribuindo um valor a uma varáivel
a <- 5
b <- 40

# Criando uma estrutura de decisão

# No R, qualquer número diferente que 0, retorna um "True"
if(c <- 5) {
  # imprimindo uma mensagem
  "teste resenha"
} else {
  "teste sem resenha"
}

# Deletando uma variável da memória
rm(a)

# Criando uma função no R

# Quando eu uso o simbolo de =, eu estou especificando que o segundo parâmetro tem um valor padrão (que seria 10) 
somar <- function(num1, num2 = 10) {
  # Cat é uma função para imprimir. Mais utilizado quando se faz interpolação ou concatenação
  cat(num1 + num2)
}

somar(2, 42)

somar(2)

# Criando um vetor (c -> combinação de dados)
nomes <- c("Aiku", "Don", "Snuffy", "Barou")
nomes[1]

# Criando um laço de repetição (for)
for(nome in nomes){
  cat(nome, "\n")
}