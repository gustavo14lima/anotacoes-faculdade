## 1.5 Definição de Requisitos

Os requisitos são todas as funções, restrições e recursos que precisam estar no produto final/sistema.  Pois os requisitos em um software são todas as funções que definem como o sistema deve funcionar, como deve ser e qualquer outras funcionalidades que precisam ser atentidas para ser considerado como bem-sucedido, ou seja, considerado que o trabalho está feito.

No levantamento de requisitos para um software, é utilizado a espeiral de requisitos, que se consiste em seguir uma série de marcos para obter requisitos refinados e claros:

- Inicia-se na **especificação de requisitos do negócio**, que seria os requisitos que o sistema precisa atender para suprir uma necessidade ou problema. Aqui começa a surgir as premissas e restrições do sistema.
- Após isso, vamos para o **estudo de viabilidade**, que consiste em analisar financeiramente quanto o projeto vai custar e se o cliente está disposta a pagar pelo projeto.
- Em seguida, entra a **elicitação de requisitos de usuário** que são os requisitos que o usuário quer que tenha em seu sistema, desde funcionalidades até restrições que o usuário gostaria de ter. Lembre-se, o seu cliente pode estar falando em uma linguagem natural ou meio informal, então, certifique-se que todos os requisitos estão sendo capturados de forma clara e sem ambiguidade.
- Após isso, entra a parte de **Especificação de requisitos de usuário** no qual você especifica os requisitos capturados pelo usuário, ou seja, você começa lapidar e polir os requisitos que você capturou com o seu cliente.
- Em seguida você faz a **Elicitação de requisitos de sistema** e **Especificação de requisitos de sistema**, no qual você define detalhadamente as funções, serviços e restrições que o seu sistema terá. Além de também de lapidar e polir esses requistos assim como os requistos de usuário.
- Por fim, você realiza uma **prototipação** de todos os requisitos coletados para apresentar para o usuário, faz **revisões** e se tudo der certo, você realiza um **Documento de requisitos do sistema**

No fim do dia, a ordem da espiral de levantamento de requisitos fica desta forma:
- Especificação de Requisitos do Negócio -> Estudo de Viabilidade -> 
- Elicitação de Requisitos de Usuário -> Especificação de Requisitos de Usuário -> 
- Elicitação de Requisitos de Sistema -> Especificação de Requisitos de Sistema -> 
- Prototipação -> Revisões -> Documento de Requisitos do Sistema

Uma observação:
- os requisitos de negócio possui um baixo nível de detalhamento 
- os requisitos de usuário possui um médio nível de detalhamento 
- os requisitos de sistema possui um alto nível de detalhamento 

## 1.6 Diferença entre Requisitos de Usuário e Requisitos de Sistema

Os requisitos de usuário são as necessidades do usuário que precisam ser atentidas e resolvidas. Com ele, é criado os requisitos funcionais e não funcionais, eles precisam estar em uma linguagem mais natural para que os usuários sem conhecimento tecnicos possam utilizar o seu sistema sem que tenham dificuldades ou seja muito complicado.
Um exemplo de um requisito de usuário seria que o login e cadastro sejam bastante intuitivos, com campos fácil de se entender e que não demore muito para realizar o login ou cadastro.

Já os requisitos de sistema são os componentes, técnicas e ferramentas necessárias para realizar a construção do sistema. Ele apresenta todos recursos, características e restrições que precisa possuir para a construção do  software.
Um exemplo desse requisito é em qual linguagem de programação, em qual banco de dados e em qual servidor o software utilizará.

## 1.7 Diferença entre Requisitos Funcionais e Requisitos Não Funcionais

Os requisitos funcionais são todas as caracterisitcas, funcionalidades, necessidades e solicitação que o software precisa apresentar. Ele representa **o que o software deve fazer**.
Exemplo:
- O login e cadastro deve possuir campos limpos e intuitivos, além de que deve ser feito com um e-mail e senha válido.

Enquanto o requisito não funcional está ligado ao desempenho, disponibilidade, segurança e integridade do software. Ele representa **como o software deve fazer/ como o software deve atuar**.
Exemplo:
- O login e cadastro deve ser feito em aproximadamente 300ms.
## 1.8 Elicitação de Requisitos

Antes de definir e explicar a elicitação de requisitos, é necessário deixar claro que nada é óbivio!
A elicitação de requisitos é a obtenção de informações detalhadas do que se pretende fazer. É uma técnica de interação com o usuário/cliente para a obtenção de informações para entender o que se pretender fazer ou solucionar. 

Lembre-se, em uma conversa com o cliente, haveŕa diferentes visões e entendimentos sobre as necessidades dele, um dos motivos é pela diferença entre os conhecimentos. Por isso, garanta que o seu cliente se expresse da melhor forma possível, não deixe que com seus requisitos sejam compliacdos de se entender e achar uma solução. 

A elicitação de requisitos possue algumas fases, sendo elas:
- Entrevista e Levantamento
- Análise
- Validação
- Documentação
- Gerenciamnto
Essas fases tem como objetivo documentar o requisitos caputrados e reduzir a existência de possíveis requisitos com ambuiguidade ou com algum problema que afete as partes realmente importantes.

Há vários metódos para realizar a eliticação de requisitos, sendo as mais comuns:
- Entrevista - Uma conversa com o seu cliente.
- Brainstorm - Uma chuva de ideias com toda sua equipe
- Analise de sistemas atuais e suas documentações - ler documentos antigos e entender a situação atual do sistema
- Questionários 
- Benchmark - analisar o seu sistema atual e comparar algumas funcionalidades dele com a do mercado atual
- Análise in-loco do processo - analisar o problema a partir do local