# 22. Hipóteses e Testes de Hipóteses

## 22.1 Hipótese

O ser humano constantemente cria hipóteses, que nada mais é, que uma explicação provisória de um determinado evento observado. 

### 22.1.1 Hipótese Nula 

A hipótese nula é a representação de uma hipótese assumida como verdadeira apenas com o intuito de servir como base para a construção de testes.
- Exemplo: Em um cenário em que uma moeda caiu 8 caras de 10 lançamentos, poderíamos assumir como verdade o fato que **"a moeda é uma moeda normal e não está viciada"**.

### 22.1.2 Hipótese Alternativa

A hipótese alternativa nada mais é quando temos dados suficiente para testar a hipótese, ou seja, a hipótese alternativa entra em ação quando a hipótese nula já não tem evidências o suficiente para ser considerada como verdadeira. A hipótese alternativa geralmente, é o que queremos evidenciar a partir com o estudos e estruturação dos dados.
- Exemplo: no mesmo cenário da moeda, como ela caiu 8 vezes cara, eu deduzo que essa moeda está viciada, então, eu monto a minha hipótese alternativa, sendo **"a moeda está viciada para cair sempre cara"**. 

### 22.1.3 Resumo da Diferença entre as duas Hipóteses

A Hipótese Alternativa é algo que eu quero provar, ou seja, algo que me deixou frustado ou que eu não aceitei a resposta e que resultou na necessidade de fazer uma hipóteses e testes sobre isso. Enquanto a hipótese nula é como se fosse "a negação"/"o contrário" da hipótese alternativa, com o único intuito de ser assumida como verdade para ser base das construções dos testes.

Por exemplo, no cenário tribunalístico, um réu é considerado inocente quando chega no tribuna, assim, cabe a mim, dizer com provas que ele é culpado. Nesse cenário, quando eu assumo que o réu é inocente para ser a base das minhas testes e provas, eu acabo dizendo que ele é a minha hipótese nula, agora, a partir de provas e testes, consigo dizer que ele é culpado, esse cenário seria a minha hipótese alternativa, já que esse é o intuito do meu teste (comprovar que ele é culpado) e já tenho dados suficientes para rejeitar a minha hipótese nula.

### 22.1.3 Exemplo do réu

Em um tribunal, sempre que acontece uma audiência, o réu é considerado como "inocente", assim, sendo a nossa hipótese nula, por que, por causa da que ter ele como inocente serve como base para toda nossa construção de testes.

A partir do momento em que não existem mais evidências estatísticas para assumir que o réu é realmente inocente, ele acaba sendo condenado como "culpado", sendo a nossa hipótese alternativa. 

Quando trabalhamos com hipóteses, nunca aceitamos algo, ou **"rejeitamos"** ou **"não rejeitamos"**.

## 22.2 Falácias lógicas

A baixo, terá algumas falácias lógicas para podem servir como vieses para a análises dos nossos testes e para as nossas hipóteses.  Podendo ou não, interferir na maneira como iremos criar os nossos testes e hipóteses.

### 22.2.1 Argumento da Ignorância

Quando estamos trabalhando com uma hipótese nula, e por falta de evidências estatísticas acabamos não rejeitando a hipótese nula, apenas pelo fato de eu não ter mais dados para trabalhar a minha hipótese, acaba ocorrendo o **argumento da ignorância**, ou seja, não refutamos a hipótese nula apenas por falta de fatos.

### 22.2.2 Efeito Clever Hans

O efeito de Clever Hans surgiu a partir de uma analise de um cavalo alemão, no qual, havia boatos que o cavalo conseguia realizar cálculos matemáticos apenas batendo suas patas no chão. A partir de uma investigação profunda, concluiu-se que o cavalo batia a pata no chão quando seu dono estava com uma expressão tensa, mas quando relaxava, ele parava de bater as patas no chão.

### 22.2.3 Efeito Hawthorne

O efeito Hawthorne começou com o questionamento se a produtividade do funcionário aumentava com a intensificação da luz. Mas, o resultado mostrou que mesmo com a luz fraca ou forte, os funcionários tiveram uma maior taxa de produtividade. Isso mostra que os funcionários não estavam trabalhando mais por causa da luz, mas sim, por estarem sendo observados ou se sentirem parte de algo importante.

### 22.2.4 Efeito Placebo

O efeito placebo é a simples expectativa de melhora e a crença de que o tratamento vai funcionar ativam redes cerebrais ligadas à "farmácia interna" do corpo. Isso acontece por causa que o organismos liberam algumas substâncias do bem estar, o que faz acreditar que, só por que eu tomei isso, eu melhorei.

## 22.3 Construção de uma hipótese

Na construção de uma hipótese, precisamos tomar bastante cuidado no que se diz a assumir a hipótese como verdadeira, caso eu assuma uma hipótese nula como verdadeira incorretamente, isso pode causar em falhas e incoerente no resultado e no andamentos dos testes.

Além de que, é sempre bom estar observando e analisando o andamento dos testes, já que pode existir uma variável externa que pode resultar em uma mudança em como o andamento dos testes continua, podendo aumentar uma determinada variável ou diminuir ela.

## 22.4 Tipos de Erro

### 22.4.1 Tipo de Erro I

Ocorre quando você rejeita a hipótese nula, sendo que ela é verdadeira. Você conclui que existe um efeito ou diferença quando, na realidade, não há nada.

### 22.4.2 Tipo de Erro II

Ocorre quando você não rejeita a hipótese nula (H₀), sendo que ela é falsa. Você deixa passar um efeito real ou uma diferença que realmente existe, concluindo que "não há nada de novo".
