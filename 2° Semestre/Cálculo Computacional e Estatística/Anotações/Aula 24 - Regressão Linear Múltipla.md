# 24. Regressão Linear Múltipla

A regressão linear múltipla é quando queremos analisar a relação de **uma variável dependente** com **mais de uma variável independente**.

Por exemplo, eu utilizo ela quando eu quero saber qual é a relação entre ataque cardíaco com andar de bicicleta e fumar. Nesse exemplo, podemos analisar facilmente quais serão as variáveis independente e qual será a variável dependente, no qual sendo a dependente ataque cardíaco e as independentes, fumar e andar de bicicleta.

Vale ressaltar que, para realizar uma regressão linear múltipla, cada variável independente deve ter coma correlação (pelo menos forte) com a variável dependente, mas não obrigatoriamente precisam ter correlação entre si. Voltando para o exemplo, fumar não precisa ter uma correlação com andar de bicicleta, mas precisa ter uma correlação com ataque cardíaco. A mesma lógica vale para andar de bicicleta, quem nada de bicicleta não precisa obrigatoriamente ter uma correlação com fumar, mas precisa ter correlação com ataque cardíaco. 

Exemplo no código R:

```
lm(ataque.cardiaco ~ fumar + andar.bicicleta)
```

