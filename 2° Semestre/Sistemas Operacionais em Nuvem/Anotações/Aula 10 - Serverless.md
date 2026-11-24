# 10. Serverless

## 10.1 Definição de Serverless

Serverless é uma maneira pela qual os desenvolvedores podem disponibilizar suas aplicações na nuvem sem que precisam se preocupar com partes da infraestrutura e gerenciamento do servidor. Apenas da tradução de serverless ser "sem servidor", ainda sim, possui uma máquina no qual está armazenando toda sua infraestrutura, seu servidor e sua aplicação, sendo o servidor em nuvem. Em resumo, o termo serveless se trata ao relacionamento entre o desenvolvedor e o servidor, que para ele, é invisível, por não configurar e gerenciar ele. 

Para o desenvolvedor, o serverless é mil maravilhas, pois, o desenvolvedor se preocupa apenas em criar um bom código e subir para o servidor em nuvem em formato de container. E por sua vez, o provedor de nuvem dará todo o suporte para o seu container, fazendo balanceamento de componentes, cuidado de toda a infraestrutura, atualizando a infraestrutura, cuidado da segurança, ou seja, tudo o que for relacionado com a infraestrutura, saúde, manter a aplicação em pé e não for relacionado com o desenvolvimento da aplicação, o provedor de nuvem fará.

O custo de um serviço serverless é com base nos cálculos que o próprio provedor de nuvem faz, com base no seu código e relacionados, e ele cobra apenas do momento em que a aplicação liga, até o momento em que a aplicação termina, ou seja, o provedor de nuvem cobra apenas pelo intervalo de tempo em que a aplicação esteve no ar, além de todos os seus recursos necessários para fazer ela ficar no ar. 

Além disso, o Serverless, como dito antes, é um serviço de "sem servidor", no qual, você não se preocupa com a infraestrutura, mas, você precisa ter cuidado por causa que serviços do tipo serverless estão ligado a responsabilidade, e o serverless possui o menor nível de responsabilidade possível (por causa que o provedor de nuvem cuida de tudo para você), e como se já sabe, quanto menor o nível de responsabilidade, menor é as formas e meios de você agir caso a sua aplicação cai ou tenha algum problema. 

O serverless veio com a ideia de ser um facilitador para os desenvolvedores, com o objetivo de abstrair partes complexas de colocar uma aplicação no ar (como por exemplo, infraestrutura, gerenciamento, segurança e entre outros), além de agilizar o deploy. Entretanto, essa facilidade se torna em uma menor responsabilidade e também menor entendimento sobre como as coisas estão funcionando ou "o que eu faço quando tudo quebrar?", assim você fica dependente da situação e do provedor de nuvem. Além de que, serviços Serverless são mais caros do que se eu configurasse tudo na mão bonitinho. Com isso, eu sempre preciso pensar na infraestrutura e no custo quanto for colocar uma aplicação no ar. 

## 10.2 Ecossistema de Serverless

O serverless é mais do que uma função como serviço (FaaS). O FaaS nada mais é do que uma função como serviço que, possibilita desenvolvedores executar seus códigos ou containers a partir de resposta de eventos ou solicitações específicas sem precisar se preocupar com infraestrutura e relacionados. 

Vale ressaltar que o serverless não é apenas o FaaS, o serverless é uma pilha mais completa de serviços que respondem a eventos ou solicitações específicas, ele possui o diferencial que, quando existe uma resposta para um evento ou solicitação específica, ele começa a executar e a "cobrar", mas quando ele não é mais executado, ele não custa, desta forma, fazendo um escalamento para zero. 

Existem outros tipos de serviços Serverless, como por exemplo, serviços de banco de dados e gateways de API.

A arquitetura serverless e baseada em eventos acontece quanto um serviço serverless é associado a eventos individuais, desta forma tornando a função como serviço em uma baseada em eventos (EDA), ela é baseada na publicação, captura, processamento e armazenamento de eventos. Pensa que uma arquitetura EDA é aquela que espera um determinado acontecimento ocorrer para que ela seja executada. 

## 10.3 Prós e Contras do Serverless

### 10.3.1 Prós

Os prós do serverless é principalmente a parte em que os desenvolvedores precisarem se preocupar especialmente com o desenvolvimento de um bom código, deixando essa parte de infraestrutura, segurança, política e entre outros com provedor de nuvem. O custo de um serverless é mais baixo que uma infraestrutura normal, pois enquanto em uma infraestrutura normal você deve provisionar instância, discuto, porta e tudo mais, no serverless ele começa a executar quando for "chamado" e termina quando terminar o código, o que deixa mais barato que uma instância 24/7. Além de que um Serverless é multilinguagem, o que permiti que serverless receba código em qualquer linguagem de programação. 

Além disso, como o Serverless possui sua infraestrutura toda configurada e gerenciada pelo provedor de nuvem, o DevOps acaba ficando mais "tranquilo", por não precisar fazer testes, segurança, políticas, provisionamento e entre outros. Além de que, ele pode possuir um desempenho mais econômico dependendo da situação, caso você precisa que ele seja executado apenas em momentos específicos. Pode reduzir a latência por ficar mais perto do usuário final, e possui uma maior visibilidade do uso.

## 10.3.2 Contras

Você perde o gerenciamento e o controle da sua aplicação, transferindo tudo o controle do servidor, parte de hardware, infraestrutura, para um provedor de nuvem (desta forma, caso tenha algum erro, você não terá uma forma de contornar e solucionar esse erro, apenas resta esperar pelo provedor). Outro ponto negativo de utilizar um serviço serverless é que cada provedor terá seus recursos exclusivos, desda forma, fica impossível de transferir todo o seu serviço serverless para outro provedor. Em ambientes de tempo real, a utilização de um serviço serverless não é muitas das vezes uma boa escolha, por causa que a latência pode interferir nesse quesito, desta forma, afetando o desempenho e resposta. 

O processo de depuração, ou seja, de limpar impurezas, reformular o código, pode ser um pouco mais complexo que o normal, por causa da invisibilidade do processo e arquitetura back-end. Por fim, a utilização de serviços serverless em serviços prolongados não pode ser uma boa escolha, por causa que quanto mais tempo eu deixo o meu código executando dentro do serverless, pode custar mais que toda uma infraestrutura de uma instância. 

## 10.4 Casos de Uso Serverless

### 10.4.1 Microsserviços

O uso de serverless mais comum no mercado hoje em dia, é o serverless com compatibilidade com microsserviços. Microsserviçoss são um tipo de modelo que decida-se a criação de pequenos serviços que realização um trabalho único e se comunicam a partir de APIs. Os microsserviços podem facilmente ser construídos e operados em um PaaS ou em um container, mas a utilização de serviços serverless para esse cenário está sendo cada vez mais utilizado, tudo isso por causa do provisionamento rápido, cobrança apenas quando o código está sendo executado e entre muitos outros aspectos.

### 10.4.2 Back-end de APIs

Toda função ou ação de um serviço serverless pode virar um end-point HTTP. Por exemplo, criando uma URL, que pode ser um end-point HTTP, eu posso chamar uma função que executa um determinado tipo de código, e volta a informação para a minha aplicação web (semelhante a como estamos fazendo no projeto para a criação de relatório). Esse método é chamado de ações de web.

### 10.4.3 Operações de computação e "mapeamento" massivamente paralelas

Qualquer atividade embaraçosamente paralela é interessante a utilização de um serviço serverless, por que, eu posso fazer com que cada função possa chamar outra função, dessa maneira, eu crio um tipo de mapeamento que eu consiga chamar de mais de uma função.

### 10.4.4 Cargas de trabalho de processamento do fluxo

Caso você misture um sistema com base em eventos, mais conhecido como Apache Kafka, gerenciado por um FaaS junto comum serviço de banco de dados ou até mesmo um tipo especifico de armazenamento, eu consigo criar uma base de pipelines de dados em tempo real robusto (o que seria mais parecido com um aplicativo de streaming). Esse tipo de arquitetura é a melhor quando precisamos trabalhar com o fluxo de dados, como por exemplo, dados de sensores de IoT. 

### 10.4.5 Processamento de dados:

A utilização de serviços serverless são muito interessante no que se diz a captura de dados e sua transformação, podemos validar e até limpar esses dados. Como por exemplo, criação e processamento de PDF, ETLs, normalização de áudios e entre outros.

## 10.5 Amazon Lambda

### 10.5.1 Definição de Lambda

O lambda é um serviço de computação com alta disponibilidade com o objetivo de executar o seu código e tomar conta de todas a parte de infraestrutura, saúde, segurança, provisionamento e escalabilidade de componentes e entre outros. Ou seja, com base nessa breve descrição, é possível afirmar que a Lambda é um tipo de serviço Serverless.

O lambda funciona a partir de funções e eventos, ou seja, você deve disponibilizar seu código em uma da função da lambda (código esse que deve estar dentro todas as linguagens de programação que a lambda suporta) e esperar que um certo evento acione a lambda (podendo ser um gatilho, um acesso em uma URL e entre outros). 

É interessante ressaltar que no Lambda, você é responsável apenas pelo código, ou seja, informações mais "avançadas", como infraestrutura, runtime, componentes, logs, e entre outras informações, você não tem acesso facilmente ou até mesmo não possui ele. O que pode acontecer é que, quando mais o seu código pesar e ficar em tempo de execução, mais o lambda pode cobrar por componentes e por tempo de execução. 

### 10.5.2 Quando podemos utilizar a Lambda

Podemos utilizar o serviço de S3 para um melhor aproveitamento de um data lake. Por exemplo, quando a lambda captar um evento, ou seja, quando a lambda captar que um arquivo foi adicionado em um certo prefixo, a lambda pode executar o código, que por sua vez, pode fazer todo tratamento e direcionar para o próximo prefixo (igual o Data Lake que esta sendo feito no projeto em grupo).

Além de fazer o processamento de dados, eu posso realizar o monitoramento desses dados, como por exemplo, eu posso pegar todos os dados que estão ativando o evento da minha lambda e estou, a partir de um parâmetro, fazendo algum tratamento ou redirecionamento com eles.

Ademais, eu posso usar a Lambda além do ramo de dados, como por exemplo, utilizar a lambda em aplicações web. Como vimos anteriormente, um serviço serverless pode sim ter uma compatibilidade e usabilidade com serviços web, o que pode fazer o seu serviço web escalar verticalmente, melhorando a experiência do usuário. Como por exemplo, usar a lambda para ser o seu back-end, a partir de um evento no seu front-end, você aciona um gatilho ou gera uma URL para que o código da sua lambda seja executado. 