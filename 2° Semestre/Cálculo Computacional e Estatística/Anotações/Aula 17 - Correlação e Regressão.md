# 17. Correlação e Regressão

## 17.1 Coeficiente de Correlação Linear

O coeficiente de correlação linear mede a relação entre duas variáveis quantitativas, mostrando dessa forma, a direção e o grau que a relação entre essas duas variáveis possui. 

No coeficiente de correlação linear trabalhamos um uma régua de valores, indo de -1 à 1. Quando um valor está entre 1 e 0.5, dizemos que ele é forte, e quando um valor está entre 0 e 0.5, dizemos que ele é fraco. Dessa forma, descobrimos o grau entre a relação entre duas variáveis, agora para dizer a sua direção, apensa observe se o resultado é positivo ou negativo. Exemplo, se um coeficiente de correlação linear resultar em 0.8, sabemos que a relação entre essas duas variáveis é positiva forte.

Mas, temos algumas outras exceções, sendo elas:
- Quando o coeficiente de correlação linear é igual a 0, essas duas variáveis não possui uma relação;
- Quando o coeficiente de correlação linear é igual a 1, essas duas variáveis possui uma correlação positiva perfeita;
- Quando o coeficiente de correlação linear é igual a -1, essas duas variáveis possui uma correlação negativa perfeita.

## 17.2 Regressão Linear

A regressão linear utiliza a correlação para moldar a relação entre duas variáveis e utiliza essa relação para prever valores. 

Utilizando o *r* para indicar o quanto vale a pena usar a regressão linear. Por exemplo, se um valor é mais próximo de 1, a relação entre duas variáveis é forte e a regressão faz sentido. Agora, quando um valor é próximo de 0, a relação é fraca e a regressão não pode ser tão útil. 

# 17.3 Correlação e Regressão no Gráfico do R

Para saber o grau e direção de uma correlação em um gráfico R, é necessário analisar a dispersão entre os elementos no gráfico com relação a reta da regressão.

Se os elementos estiverem muito próximos ou até mesmo encima da reta, podemos considerar que está é uma correlação perfeita.

Agora, se os elementos estiverem próximos a reta, mas não muito grudados nela, podemos considerar que é uma correlação forte.

Ademais, se os elementos estiverem muito afastados entre eles e pouco próximo a reta, podemos dizer que é uma correlação fraca.

Por fim, se os elementos estiverem muito dispersos entre eles e nem tiver a reta da regressão, podemos dizer que não possui correlação. 