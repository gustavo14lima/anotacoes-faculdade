# 12. Tipos de Variáveis, Factor e Cut

## 12.1 Tipos de Distruição

Na análise de dados existem três tipos princiapis de distruições, nos quais comparamos a partir do desvio padrão, mediana e media:

- Distruição Normal (Curva de Gauss): Quando a mediana, média e o desvio padão estão todos alinhados, e formando assim uma curva totalmente simétrica. 
- Distruição Assimetrica Negativa: é quando a curva está mais voltada para a direita, ou seja, quando a ordem de menor para o maior se constitui em: media, mediana e desvio padrão.
- Distruição Assimetrica Positiva: é o inverso da Distruição Assimetrica Negativa, no qual a curva está mais voltada para a esquerda e possui a ordem de menor para maior sendo: desvio padrão, mediana e media. 

## 12.2 Tipos de Variáveis

Quando falamos sobre variáveis, precisamos diferenciar elas não apenas pelo tipo que ela representa, como String e Integer, mas sim a classificação elas.

Em relação a variáveis, existem dois caminhos que podem ser seguidos, sendo eles:
- Quantitativa: representa a quantidade numerica da variável, podendo ser:
	- Contínua: representando números com casas decimais
	- Discreta: representando números inteiros
- Qualitativa: representando categórias, mas chegada a texto e classificações, podendo ser:
	- Nominal: não possui uma ordem, mais semelhantes a nomes e catégorias
	- Ordinal: possui uma ordem, como por exemplo, escolaridade, faixa etária e etc.

## 12.3 Histogramas vs Gráfico de Barras

Utilizamos histogramas quando precisamos observar distribuição, assimetria, moda e possíveis outliers. Além de sempre utilizar quando precisamos analisar variáveis que são contínua ou númerica.

Exemplo de código:
```
hist(iris$Sepal.Length, # Definição da coluna do dataframe para analisar 
	main = "Histograma do Comprimento da Sépala", # Título do histograma 
	xlab = "Comprimento da Sépala (cm)", # Título da coluna de eixo X
	col = "lightblue", # Escolhendo cor para representar as colunas 
	border = "black") # Escolhendo cor para as bordas da coluna
```

Utilizamos o gráfico de barras quando precisamos mostrar a contagem ou proporção de cada categoria. Além de sempre utilizar quando precisamos analisar variáveis que são nominal ou discreta.

Exemplo de código:
```
freq_species <- table(iris$Species) # Criando uma tabela de acordo com a coluna do dataframe
 
barplot(freq_species, # Criando o gráfico de barras da tabela criada 
	main = "Frequência das Espécies", # Título do gráfico de barra
	 xlab = "Espécie", # Título de eixo x
	 ylab = "Contagem", # Título de eixo y
	 col = c("pink", "lightgreen", "lightblue"))# Cores das barras(segue a ordem)

```

Apenas um breve resumo, utilizamos o histograma quando as variáveis são da "família" quantitativa e utilizamos gráficos de barra quando as variáveis são da "família" qualitativa.