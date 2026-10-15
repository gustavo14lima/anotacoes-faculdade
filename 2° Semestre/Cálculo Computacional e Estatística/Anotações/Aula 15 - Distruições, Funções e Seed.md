# 15. Distruições, Funções e Seed

## 15.1 Teoria da Probabilidade

Como foi visto anteriormente, a teoria da probabilidade é uma área de estudo da matématica que tem como objeto estudar e entender o acaso e incertezas. Tem como objetivo ajudar a calcular a change de algo, inprovável ou com poucas chances de acontecer, de realmente acontecer.

Geralmente, é coletada uma parte de toda a "população", ou seja, de toda as evidências e pesquisas que se foi coletado. Esta parte é chamada de "amostra", na qual, terá uma estatística descritiva encima dela, ou seja, terá uma analise e exploração de dados encima desta amostra. Assim, aplicando uma analise e cálculo probabilistico, é possível a partir deste resultado tomar uma decisão encima desta "população", ou seja, encima das personas que foram coletadas as pesquisas e evidências.

## 15.2 Tipos de Distruições

Nos tipos de distruições, existem duas principais, sendo elas as contínuas (representando números dentro de um intervalo de dados, ou seja, números decimais) e as discretas (representando os números inteiros).

### 15.2.1 Tipos de Distruições Contínuas

Dentro da distruição continua, temos a famosa **distruição normal**, é uma distruição bastente conheceida e utilizada, especialmente para servir como base para testes estastísicos. A sua principal caracterísitca seria a sua famosa **curva de sino**, essa curva só é possível quando a média, mediana e moda estão unidas e no centro da curva, e o desvio padrão responsável por dizer a largura da curva, ou seja, o intervalo de um registro e outro.

Na distruição normal é um conceito abordado, sendo a **regra empírica**, que diz o seguinte:
- 68% dos dados estaram concetrados no meio da distruição
- 95% dos dados estaram concetrados a "um ponto de desvio padrão" do meio da distruição
- 99.7% dos dados estaram concetrados a "dois ponto de desvio padrão" do meio da distruição

### 15.2.2 Tipos de Distruições Discretas

Dentro da distruição discreta temos a **distruição binominal**, esta é uma distruição utilizada para realizar cálculo de probabilidade de determinado evento acontecer um certo número de vezes, quando tem apenas dois possíveis resultados: **sucesso** ou **fracasso**. Por exemplo, se eu lançar uma moeda 10 vezes, quantas vezes irá cair cara? Eu tenho um total de 10 números de vezes que esse evento irá acontecer, e eu gostaria de saber quantas vezes terá o **sucesso**, ou seja, cair cara. Suas principais características são a quantidade fixa de vezes que um evento será repedido (por exemplo, no exemplo acima foi devido a quantidade de vezes que esse evento irá acontecer), cada tentativa tem apenas dois resultados (sucesso ou fracasso), a probabilidade de um evento ter sucesso, não muda a cada tentativa (não é acumulativo) e o resultado de uma tentativo não influência a outra.

Além da distruição binominal, existe a **distrição poisson**, que serve para cálcular a quantidade de ocorrências que um determinado evento pode ter, em um intervalo de tempo. Por exemplo, com a distruição de poisson, eu posso calcular a quantidade de pessoas que entram em uma loja no irtervalo de 8 horas (desta forma, eu posso calcular quantas pessoas entram na loja por hora). Suas principais características são a taxa de um determinado evento acontecer, não muda ao decorrer do tempo, o resultado de uma ocorrência não muda o resultado do seguinte ou dos resultados futuros e o foco é contar a quantidade de vezes que um determinado evento acontece em um intervalo de tempo, não o números de tentativas até esse evento acontecer. 

### 15.2.3 Resumo

#### Distruição Normal (Gaussiana)

Dados se agrupam em torno da média

#### Distruição Binomial

Contagem de sucessos em um número fixo de tentativas

#### Distruição Poisson

Contagem de eventos em um intervalo de tempo

## 15.3 Funções de Distruição no R

Vale ressaltar que, as funções abaixo seram apenas para realizar a criação de amostras, ou seja, a aleatoriazação de dados, a partir dos conceitos de distruição comentadas acima. A criação de gráfico ou histogramas continua a mesma coisa.

### 15.3.1 Distruição Normal

Para criar amostra de dados a partir de uma distruição normal, utilizamos a função **rnorm()**. Com ela, criamos dados aleatórios utilizando o conceito de distruição normal (fazendo a famosa curva de sino). Para isso, usamos este exemplo de função:

```
rnomr(n = numero_amostra,
	  mean = numero_media,
	  sd = numero_desvio_padrao)
```

Neste código, utilizamos o valor de **n** para dizer a quantidade de amostrar que eu quero gerar, o valor de **mean** para ser a média dos meus dados, e **sd** para ser o desvio padrão, ou seja, o quanto os meus dados vão variar a partir da média. Exemplo, se eu colocar (**n = 10, mean = 5, sd = 1**), eu terei dez registros de números que variam uma únidade do 5, ou seja, podendo vir 4, 5, 5.2 e etc.

### 15.3.2 Distruição Binominal

Para obter dados/amostragem, seguindo o conceito da distruição de binominal, utilizamos a função **rbiom()**.

```
rbiom(numero_amostra,
	  1,
	  probabilidade
```

Neste código, temos a mesma lógica de iniciar específicando a quantidade de registros que seram gerados. Após isso, temos a utilização do números 1, para representar se um registro será verdadeiro (resultado igual a 1) ou falso (resultado igual a 0), desta forma, tento a representação de um resultado **sucesso** ou **fracasso**. E por fim, temos a probabilidade, que é a representação de uma ocorrência/dessa amostragem, ser um sucesso.

### 15.3.3 Distruição Poisson

Para gerar amostrar utilizando a distruição poisson, é utilizado a função **rpois()**. 

```
rpois(n = numero_registros,
	  lambida = numero_taxa_media)
```

Neste código, o **n** continua com a mesma premissa, representar a quantidade de registros/amostras que eu irei gerar a partir desta função. Além disso, o **lambida** representa a taxa média esperada de cada ocorrência dos eventos. Exemplo, se eu colocar (**n = 8, lambida = 10**), eu teria oito registros, sendo que a média entre eles seria igual a 10, claro, com algumas variações de dados, mas tudo em torno de 10.

## 15.4 Função rep() vs Função seq()

No R, temos algumas funções destinadas a repetição de valores, sendo elas o rep() e o seq().

### 15.4.1 Função rep()

A função rep() é utilizada para repetiro valores ou vetores em uma determinada quantidade de vezes. A função não cria nada de novo, ela apenas duplica/repete todo o conjunto de valor ou vetor que você colocou. A função seria:

```
rep(x, times, each, length.out)
```

Neste código, o valor de **x** é o conjunto de valores ou vetores que serão repetidos, o valor de **times** é a quantidade de vezes que esse valor ou vetor será repetido, o valor de **each** é a quantidade de vezes que um elemento individual será repetido e o valor de **length.out** é o valor do comprimento final do meu vetor que eu quero.

Exemplo de entrada e saída:

```
rep(1:3, times = 4) # Output: 1 2 3 1 2 3 1 2 3 1 2 3
```

### 15.4.2 Função seq()

A função seq() é para gerar uma sequência de números ordenandos. Ela realmente cria novos valores, seguindo uma lógica para realizar uma certa sequência. A função seria:

```
`seq(from, to, by, length.out)`
```

Neste código, o valor de **from** é o valor inicial que eu quero começar a minha sequência, o valor de **to** é o valor final que eu quero que minha sequência termine, o valor de **by** é o valor de incrementação de um elemento para outro (isso que faz a sequência existir) e o valor de **length.out** é o número total de valores que eu quero que tenha no meu vetor.

Exemplo de entrada e saída:

```
seq(from = 1, to = 10) # Output: 1 2 3 4 5 6 7 8 9 10
```

## 15.5 Seed()

Quando utilizamos algumas funções de criação de amostragem, ou seja, randomizar valores para uma análise de dados (como por exemplo as funções estudadades aqui), toda vez que executar ou modificar o código, os valores que foram gerados das funções de distruições serão diferentes, ou seja, toda vez que eu executar a função, virá um conjunto de valores novos. 

Um exemplo de como não trocar de valores a cada execução, é utilizando o comando **set.seed()**, no qual eu crio um gerador de números aleatórios interno, desta maneira eu garanto que todos os números aleatórios sejam o mesmo (padronizando a randomização), mas, a única exigência é que o valor do parâmetro da função set.seed() seja a mesma.