#  23. Testes de Hipóteses - Prática

## 23.1 Finalidade dos Testes

Os testes são realizados para minimizar algumas incertezas, ou seja, utilizar a matemática e utilização de dados, de forma objetiva para identificar se determinado acontecimento é realmente incomum (aconteceu a partir do acaso) ou se realmente é real esse acontecimento. 

Esses testes são realizados a partir de inferência, ou seja, realizar uma inferência é analisar uma população e tirar alguns resultados (como médias, proporções e cálculos) a partir de um estudo de uma amostra dessa população.  Ou seja, ao invés de eu estudar e tirar dados de todos os Indivíduos de uma população, eu apenas pego uma porcentagem dessa população para eu realizar todos os meus cálculos.

E por fim, os testes ajudam na tomada de decisão.

## 23.2 Tipos de Testes

Antes de analisarmos qualquer teste, é interessante definirmos algumas variáveis que podem estar aparecendo no meio do caminho. Quando algum teste estiver falando de parâmetro, podemos interpretar como se fosse a probabilidade "normal" de algo acontecer, sem colocar nenhuma hipótese ou achismo para atrapalhar no valor. Agora, a hipótese nula, como vimos anteriormente, ela é como se fosse o que estamos realmente querendo provar, como por exemplo, se algo está fora do normal.

Por exemplo, caso eu esteja analisando a probabilidade a probabilidade de uma moeda, em 10 vezes, cair 8 caras. O nosso parâmetro será 0.5, por causa que a moeda possui 50% de cair cara e 50% de cair coroa, ou seja, possui 50% de cair cara, dessa maneira, podemos concluir que o parâmetro é o valor da probabilidade sem nenhum "achismo", em outras palavras, a probabilidade normal da moeda. Por fim, a nossa hipótese nula seria 0.8, por que eu quero testar se realmente a muda tem 80% de chance de sempre cair cara.  

Vale levar em consideração, que todos os testes possuem o valor do parâmetro igual ao valor da hipótese nula.

### 23.2.1 Teste Bilateral ou bicaudal (≠)

O teste bilateral ou bicaudal é quando queremos comparar se o nosso parâmetro é estaticamente diferente que o valor da nossa hipótese alternativa. 

Neste teste, geralmente a região crítica estará nas duas caldas da distribuição. Vale ressaltar que, para realizar o calculo da região crítica, é necessário utilizar os valores das duas caldas, então, caso uma calda tenha dado 0.05, você deve utilizar 0.10, por causa da utilização das duas caldas.

### 23.2.2 Teste unilateral à esquerda 

No teste unilateral à esquerda verificamos se o nosso parâmetro é estaticamente menor que o valor da nossa hipótese alternativa. 

Neste teste, geralmente a região de crítica estará na calda esquerda da distribuição. (lower.tail=TRUE)

### 23.2.3 Teste unilateral à direita

No teste unilateral à direita verificamos se o nosso parâmetro é estaticamente maior que a nossa hipótese alternativa. (lower.tail=FALSE) 

Neste teste, geralmente a região de crítica estará na calda direita da distribuição.

### 23.2.4 Utilização dos testes no Gráfico

Quando utilizamos esses tipos de testes em gráficos, podemos reparar em alguns pontos de suma importância para serem analisados. Um deles é a diferença entre **regiões de não rejeição (RN)** e as **regiões crítica (RC)**.

A **região crítica**, muitas das vezes encontrada nas caldas/extremidades do gráfico da distribuição, é a região do gráfico que, caso a estatística do teste cair nessa região, podemos rejeitar a hipótese nula na hora. 

Agora, a **região de não rejeição**, muita das vezes sendo o restante do gráfico e maior parte dele, é a região que, quando a estatística do teste cair nessa região, podemos não rejeitar a hipótese nula. 

## 23.3 Nível de Significância 

O nível de significância, representado pela letra grega alfa (**α**), representa a probabilidade de recursarmos a hipótese nula, e ela estiver certa, desda forma, cometendo o erro do tipo I.

Vale ressaltar que existem alguns valores de nível de significância mais utilizados, como por exemplo: 
- α = 1%
- α = 5%
- α = 10%

Mas é interessante saber que o nível de significância é dado pelo próprio autor do teste, por que ele é o que mais entende e vai saber se o seu teste possui probabilidade de errar mesmo estando certo. Ou seja, para eu afirmar um nível de significância, eu tenho que entender bem sobre o ambiente do meu teste (podemos dizer que essa parte é mais uma análise de fora para dentro).

## 23.4 Teste de Hipótese

O teste de hipótese é quando calculamos e identificamos qual é o valor da estatística de teste e comparamos com o valor crítico da distribuição. Ou seja, é a verificação do meu valor de estatística de teste em relação com a RC e RN.

Caso eu esteja realizando um teste bicaudal, é interessante eu pegar o valor da minha RC (que muita das vezes, será o meu nível de significância, ou seja, o meu **α**) e dividir por dois, ou seja, cada calda vai ter um valor (sendo a metade do valor cheio).

## 23.5 P-valor (P-value)

Também é possível calcular o p-valor, que seria outra maneira de conseguirmos encontrar o valor da estatística de teste. Com o p-valor, podemos fazer a mesma comparação com o nível de significância, que seria:
- Caso o p-valor seja **menor** que o nível de significância, **rejeitamos H0** (p-valor < α)
- Caso o p-valor seja **maior** que o nível de significância, **não rejeitamos H0** (p-valor > α)

## 23.6 Faixa de Confiança

A faixa de confiança é uma faixa de dados que representa os valores plausíveis de dados para o nosso parâmetro, apenas com os dados da amostra. A faixa de confiança nos ajuda a:
- Mostrar o quanto podemos confiar na estimativa, e não só no valor final
- Indicar quais valores do parâmetro são compatíveis com os dados
- Além disso, caso o valor de H0 (hipótese nula) esteja fora da minha faixa de confiança, eu posso rejeitar a hipótese nula.

Imagine um cenário, caso eu consiga fazer uma faixa de confiança, ela pode me retornar uma faixa de dados em que provavelmente o meu valor final pode estar nela. Vale ressaltar que, quanto menor for a amostra, maior será essa faixa de confiança, dessa forma, não conseguindo confiar muito na estimativa, agora, quanto maior ser a minha amostra, menor será a minha faixa de confiança, dessa maneira, eu vou conseguir ter uma estimativa melhor e que eu consiga confiar mais nela.

Em um exemplo, caso eu tenho uma faixa de confiança de 95%, significaria que se eu repetisse o teste várias e várias vezes, 95% das vezes o intervalo/faixa de dados que for construído, terá o meu valor verdadeiro/final. O alto número não necessariamente resulta em um bom resultado, por que nesse exemplo, prova que em quase 100% dos meus testes, terá o meu valor verdadeiro, sendo mais difícil para achar o meu valor verdadeiro (por causa da grande quantidade de intervalos em que ele aparece).

## 23.7 Distribuição T vs Distribuição Normal

A diferença principal entre a distribuição normal e a distribuição t está na incerteza sobre a desvio padrão populacional e no tamanho da amostra, enquanto na distribuição normal, eu tenho o desvio padrão populacional, na distribuição t eu não tenho. Ambas são simétricas e têm formato de sino, mas a distribuição t tem caudas mais largas para acomodar a incerteza extra de estimar o desvio padrão a partir de amostras menores.

Enquanto na distribuição normal tem uma única forma padrão, tendo o seu pico sendo mais alto e as caudas caem mais rápido, na distribuição t depende de um parâmetro chamado graus de liberdade (geralmente $gl = n - 1$, onde $n$ é o tamanho da amostra). Com poucos graus de liberdade (amostras pequenas), o pico é mais baixo e as caudas são bem mais largas (aumentando a probabilidade de valores extremos e tornando intervalos de confiança mais amplos).À medida que os graus de liberdade aumentam ($n$ cresce), a distribuição t se aproxima cada vez mais da distribuição normal (sendo praticamente idêntica a ela quando os graus de liberdade tendem ao infinito).