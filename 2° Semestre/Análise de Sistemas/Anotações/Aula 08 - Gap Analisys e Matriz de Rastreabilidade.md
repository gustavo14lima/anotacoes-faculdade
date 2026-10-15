# 8. Gap Analisys e Matriz de Rastreabilidade

## 8.1 Definição do Gap Analisys

No ramo empresarial existe várias ferramentas essenciais para a captura de requisitos para a criação de um novo negócio ou para incrementar uma nova funcionalidade em algo já existente. Mas agora, iremos começar a falar sobre ferramentas que tem como funcionalidade o aperfeiçoamento de um negócio, ou seja, existem ferramentas que além de capturar, estudar, analisar e implementar requisitos, existem ferramentas que são utilizadas para melhorar esse requisito.

Um exemplo, eu pego um requisito, por exemplo, efetuar Login. Este meu requisito está demorando 3 segundos para ser realizado. Eu posso fazer uma melhoria desse requisito para que o meu Login seja feito em apenas 1 segundo ou até menos. Desta forma, eu não criei um novo requisito, mas sim, peguei um requisito já existente, ou até mesmo, já realizado e aperfeiçoei ele.

Com este contexto, entra o Gap Analisys. O Gap Analisys é uma ferramente que serve justamente para comparar o que está sendo realizado/feito atualmente com como poderia estar sendo feito, ele é fundamental para achar melhorias no requisito, achar seus pontos fracos e fortes, eu posso observar qual está sendo o desempenho deste requisito atual e como ele será após ser melhorado. Ou seja, o Gap Analisys é analisar um requisito ou um processo atual, e observar como ele poderia ser melhor. 

Vale ressaltar que o Gap Analisys é uma ferramenta não só limitada a área de desenvolvimento, mas sim, para qualquer área em que eu consiga comparar como um processo está sendo realizado e como eu posso melhorar ele.

Caso você não esteja imerso em um projeto e não entenda muito em relação ao processo em específico, você pode facilmente realizar perguntas aos interessados, como por exemplo, para os antigos desenvolvedores ou até mesmo para o cliente. Caso precise, desenhe, faça mais perguntas, descreva todo o processo da forma como você entendeu. Com isso, identifique as lacunas com o Gap Analisys e faça o seu plano de ação, para que no fim possa ser validado com os interessados. 

Mas no fim, por que é fundamental fazer um Gap Analisys? Identificar processos que podem ser melhorados agregam valor para o negócio do cliente. Uma tela que ao invés de demorar 3 segundos para carregar, demore 1 segundo ou menos, acaba gerando melhor satisfação para o cliente, que por sua vez, acaba voltando mais a plataforma do seu cliente ou até mesmo recomendando que mais pessoas entre na plataforma do seu cliente. 

## 8.2 Ferramentas para realizar o Gap Analisys

O Gap Analisys, geralmente, é feito encima do BPMN, ou seja, os analistas pegam o BPMN de um determinado processo e começam a identificar melhorias ou complementos para o processo ficar melhor do que eles pegaram. 

Com isso, para realizar o Gap Analisys é feito com duas ferramentas, ou utilizadas juntas, ou apenas um. Sendo elas a criação de um novo BPMN e a criação de uma tabela de Gap Analisys. 
- A criação de um novo BPMN é simplesmente pegar o BPMN antigo e  criar um novo BPMN a partir da analise que os analistas fizeram, colocando mais atividades, mais condições, tarefas paralelas e entre outras.
- A criação de uma tabela de Gap Analisys é você descrever um pouco mais profundamente a sua alteração, especificando informações como, o processo antigo, como ele irá ficar, o motivo por isso e entre outros. Agora, irei apresentar os tópicos da tabela de Gap Analisys:
	-  **Nome do processo**: Você específica qual é o nome do processo
	- **Atual As Is**: Você descreve como este processo está atuando atualmente
	- **Ideal To Be**: Você descreve como o processo poderia ficar, descreve as melhorias que ele poderia ter.
	- **Vantagem Competitiva**: Aqui você fala a diferença entre o processo como ele está agora e como seria ele ideal, ou seja, você fala o que precisa ser feito para o processo estar no estado "perfeito" dele
	- **Estratégia**: Aqui você específica como será implementado o processo ideal, ou seja, qual é a estratégia que você vai utilizar para implementar as alterações no seu processo.
	- **Benefícios e Riscos**: Você vai especificar todos os benefícios que o negócio terá após a implementação desta mudança, e também irá abordar qual será os riscos para o negócio de implementar este processo ideal.

| **Nome do processo** | **Atual As Is** | **Ideal To Be** | **Vantagem Competitiva** | **Estratégia** | **Benefícios e Riscos** |
| -------------------- | --------------- | --------------- | ------------------------ | -------------- | ----------------------- |
## 8.3 Rastreabilidade de Requisitos

A rastreabilidade de requisito é uma ferramenta utilizada para identificar e documentar todo o trajeto que um requisito teve até ser desenvolvido. Ou seja, eu começo a analisar todos os rastros que esse requisito teve até ser desenvolvido. 

Na rastreabilidade de requisito, eu começo a observar todas as demais ferramentas utilizadas para a criação desse requisito. Por exemplo, eu observo a User Storie, observo o Lean Ux Canvas, observo a Prota Persona e entre outras ferramentas para identificar o motivo e como esse requisito surgiu.

O objetivo da rastreabilidade de requisitos é garantir que todos os requisitos do projeto, mesmo que eles não estejam conversando um com o outro, estejam totalmente alinhados um com os outros, desta forma, quando eu for verificar um requisito para realizar uma alteração, ou até mesmo uma incrementação, eu saiba quais outros requisitos estão ligados a este determinado processo, para que não tenha algum impacto na minha mudança.

A importância da utilização da rastreabilidade de requisitos são, além de observar o impacto na mudança de um requisito pode causa no negócio e no escopo, eu posso observar os requisitos para aplicar o Gap Analisys, ou seja, posso analisar os requisitos e encontrar lacunas para melhorias antes que este requisito comece a ser codificado (desta forma, evitando retrabalho), posso observar que o impacto da mudança do requisito prejudica apenas os requisitos ligados a ele ou se prejudica outros objetivos, e é uma forma confiável de se verificar se todos os requisitos estão sendo abordados.

## 8.4 Matrix de Rastreabilidade de Requisito

A Matrix de Rastreabilidade de Requisito é uma tabela, que pode ser feita na Excel ou em qualquer outro software, em que consiste em algumas colunas que facilitam a identificação de onde este requisito surgiu. Abaixo, eu irei sitar alguns tópicos interessantes de se ter em uma Matrix de Rastreabilidade de Requisito (não precisa obrigatoriamente ter apenas estes pontos, podem ter mais ou menos, depende de como sua Matrix irá ficar):
- Identificador do Requisito
- Nome do Requisito
- Descrição do Requisito
- Prioridade do Requisito (Igual ao do Product BackLog)
- Tipo de Requisito (Se é funcional ou não funcional)
- Código de qual ferramente foi mencionado este requisito (eu posso ter uma coluna chamada User Stories e falar de qual User Storie este requisito surgiu. Isso vale para qualquer outra ferramente, como por exemplo, Lean Ux Canvas, WireFrame, DER e Caso de Uso)
- Código de Teste (Caso precise, este tópico é uma referência para os testes necessários para a validação deste requisito)

Vale ressaltar que, como este documento é semelhante ao Product BackLog, ele é vivo, ou seja, pode ser alterado e modificado a todo momento.