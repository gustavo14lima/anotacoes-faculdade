# 27. ANOVA

## 27.1 Anotações Iniciais sobre a ANOVA

A ANOVA é um critério para verificar o efeito de uma variável categoria encima de uma variável qualitativa. Nela, utilizamos o conceito de variância, que seria o desvio padrão ao quadrado. 

Nela existem dois valores de suma importância para acharmos o f-value, que seria a variância média do grupo (ou seja, eu analiso a média de cada variável qualitativa em seus devidos grupos, em relação à média geral de todas as variáveis qualitativas, sem separar elas por grupo) divido pela variância média dentro do grupo (vai medir a dispersão de cada variável qualitativa dentro dos seus próprios grupos). 

Quando  se tem apenas as somas dos quadrados, entre o grupo e dentro do grupo, precisamos realizar a seguinte operação. Pegamos o valor dos quadrados entre o grupo e dividimos pela quantidade de grupos menos 1. Após isso, pegamos o valor dos quadrados dentro do grupo e dividimos pelo valor de observações menos a quantidade de grupos. Com isso, dividimos os dois resultados.

Quando o f-value está perto de 1, quer dizer que o grupo, ou seja, a variável categoria que estamos analisando, não possui uma diferença muito forte em relação as variáveis qualitativas. Agora, caso dê um valor bem alto, quer dizer que existe um "ruído na analise", ou seja, a variável categoria realmente está interferindo em alguns valores.  Além disso, caso a média de variância dentro do grupo for maior que  média de variância dentro do grupo, mais essa variável categórica está interferindo. 

f-value explica a razão entre a diferença da variância média pelos grupos pela variância média de forma residual (dentro dos grupos). 

O TukeyHSD é a forma de eu analisar de tem alguma variável que possui a média diferente que as demais, eu posso analisar isso com os valores `lwr` e `upr`, que caso o intervalo deles não incluir o zero, quer dizer que há uma diferença estatística entre os pares analisados. 