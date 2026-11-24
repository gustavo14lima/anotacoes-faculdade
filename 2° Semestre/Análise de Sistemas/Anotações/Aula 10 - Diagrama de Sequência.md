# 10. Diagrama de Sequência

## 10.1 Definição de um Diagrama de Sequência

O Diagrama de Sequência é um tipo de diagrama comportamental, no qual, está preocupado com a ordem temporal em que as mensagens (trocadas) serão disparadas e recebidas entre os objetos de um processo. O diagrama de sequência é baseado na utilização de aspectos do diagrama de classe e o diagrama de caso de uso, para que dessa forma consiga identificar as classes que estão fazendo a disparada de mensagens e como elas serão desenroladas. Em resumo, o diagrama de sequência foca no desenrolar de um evento gerado por uma mensagem, analisando quem foi o autor responsável por gerar essa mensagem e como ela será desenrolada no decorrer do sistema, passando por diversos caminhos até ser concluída. 

Podemos utilizar ele para entender melhor o fluxo claro das funcionalidades do sistema, além de analisar melhor as classes do sistema, que consequentemente, estaremos validando o diagrama de classe. 

## 10.2 Relação com os demais diagramas

O diagrama de sequência possui sua função de mostrar o fluxo de processos e suas interações. Baseando-se no diagrama de caso de uso, é possível que cada caso de uso tenha um diagrama de sequência, que por sua vez, o diagrama de classe terá a função de especificar quais serão os objetos relacionados com o fluxo e os métodos que serão disparados.

## 10.3 Estruturação de um Diagrama de Sequência

O diagrama de sequência possui algumas representações gráficas com os seus significados, sendo elas:
- **Objetos** - Representa o instanciamento de uma classe do diagrama de classes, ele terá toda a lógica do sistema. Pode existir desde o início ou até mesmo no fim do processo. É interessante ressaltar que sua representação é um retângulo. 
- **Mensagem** - É a demonstração de uma ocorrência de eventos. Ou seja, é como se um objeto estivesse mandando uma mensagem para outro objeto, requisitando um método. Uma mensagem é disparada entre atores e objetos com o intuito de requisitar algum método do objeto. Ela é representada por uma seta, representando a origem e o destinatário da mensagem, quando um objeto está retornando uma mensagem, geralmente sua seta é pontilhada. 
- **Retorno** - O retorno foi a seta pontinhada dita anteriormente. Uma mensagem dizendo que a execução do método foi um sucesso ou não, junto com uma resposta ou mensagem. 
- **Barra de ativação** - Indica o período que um ator ou objeto está ativo no processo, ou seja, em execução. Também chamado de foco de controle, ele é representado por um retângulo estreito e longo verticalmente. 
- **Timeline (Linha de vida)** - Representa o tempo que um objeto existe durante a execução. Representando linhas tracejadas. Quando um objeto é finalizado, geralmente é colocado um "X" no final da sua timeline. Podemos dizer resumidamente, que ela mostra quando um objeto existe, mas não está sendo executado. 
- **Self (Auto chamadas)** - São mensagens que um objeto pode enviar para si mesmo. São como associação reflexiva no diagrama de classes e auto relacionamento no diagrama de caso de uso.
- **Autor** - O autor é a representação do próprio autor do diagrama de caso de uso e ele é quem dispara a mensagem para que todo sistema trabalhe e retorne sua mensagem.
- **Limite ou Frame** - Retângulo representando o processo com seus objetos, autores, lógica e etc, e também pode representar um fragmento combinado.

## 10.4 Estereótipo Boundary

Também conhecido como estereótipo de fronteira, ela identifica uma fronteira, uma interface que serve como comunicação entre o autor e o sistema. Geralmente, uma classe do tipo "boundary" é associada como a interface do sistema, e precisa estar associada com uma classe do tipo "control". Da mesma forma que cada caso de uso pode existir um diagrama de sequência, quando um caso de uso precisar de uma interface (um front-end), pode ter a necessidade de um "boundary".  Podemos fazer uma associação com o mundo real, no qual um ator só pode interagir com a interface do sistema (que seria o boundary), e por sua vez a interface interagi com o usuário e com o back-end (que seria o control) e o back-end conversa com o banco de dados e afins (que seria o sistema).

## 10.5 Estereótipo Control

O objetivo da classe control é ser um intermediador entre a classe do tipo boundary (ou seja, a interface do sistema) e o sistema/objeto propriamente dito. Eles são responsáveis por pegar os eventos gerados pelo boundary, como por exemplo, clicar em um botão, e chamar o método correspondente ao evento do boundary no objeto do sistema. Após isso, ele retorna uma mensagem do sistema (sendo um retorno) para o boundary.  Pode existir mais de um controlador dependendo do sistema, mas sistemas em que sobrevivem com apenas um controlador, são chamados de controlador de fachada. Como vimos antes, o control só interage com o boundary (interface) e com o objeto do sistema. 

Vale ressaltar que todo boundary precisa ter um control, mas nem todo control precisa ter um boundary.

## 10.6 Fragmentos Combinados

São retângulos que englobam toda a área e segmento, determinando toda a área que irá conter o determinado tipo de fragmento combinado. Na parte superior esquerdo é determinado o tipo de fragmento combinado, que por enquanto são:
- **loop** - É a representação de uma repetição de um evento, ou seja, o loop representa uma repetição de uma área até que a condição seja atendida. Exemplo, validar senha (o diagrama de sequência só vai continuar quando o usuário acertar sua senha). Podemos assimilar com o laço de repetição while ou for na programação.
- **opt (Mensagem Condicional)** - É a representação de uma condição específica, em que, dependendo do decorrer do código e também das escolhas do usuário, ela pode ser atendida ou não. Caso seja atendida, ela irá entrar no fragmento, caso não, não irá entrar no fragmento. A assimilação desse fragmento é certamento o if da programação.
- **alt (Caminho condicionais mutuamente exclusivos)** - É a representação de uma condição, no qual, pode ter mais de uma condição que pode ser atendida. Por exemplo, eu coloco alguns fragmentos, com algumas especificações, a escolha do usuário que caber nessas condições, o diagrama "entra" no fragmento. Pode ter mais de uma condição atendida. 

É interessante relatar que a especificação, em todos os tipos de fragmentos, é feito na parte esquerda do fragmento, geralmente entre colchetes e sendo um texto explicativo.

## 10.7 Conexões

Até agora, vimos muitas ferramentas, mas caso paramos e começamos a pensar, começamos a perceber que todas as ferramentas estudadas e aprendidas estão conectadas, por exemplo:
- **Regra de negócio** - com a regra de negócio, consigo entender todas as dores e necessidade do cliente. 
- **User story** - com a user story, eu consigo entender como eu posso atender o meu usuário, como posso agregar valor para ele e como posso resolver seu problema (além de sempre ter um histórico para validações)
- **Lean UX** - com o lean ux, eu posso validar quais são os benefício cada usuário terá com a solução proposta.
- **Wireframe** - com o wireframe, eu posso criar um protótipo simples que não influencie na escolha do usuário para validar se seria usual e útil para ele.
- **BPMN** - com o BPMN, eu posso listar todos os processos que o sistema do meu usuário pode ter.
- **DER** - com o DER, eu faço uma modelagem lógica, na qual, eu irei armazenar todos os dados importantes para que o meu usuário possa utilizar e analisar eles.
- **Caso de Uso** - com o caso de uso, eu listo todos os principais processos que cada usuário pode fazer dentro do meu sistema.
- **Diagrama de classes** - com o diagrama de classe, posso listar todos as características e ações que cada classe do meu sistema terá
- **Diagrama de sequência** - com o diagrama de sequência, eu vejo qual é a ordem temporal de execução de cada método ou disparo de mensagem ao decorrer do sistema.

Caso eu queira incrementar uma nova funcionalidade ao meu sistema, seria de ótima prática seguir toda essas arquiteturas e ferramentas, para entender corretamente a dor, como resolver ela e ter uma forma visual de mostrar e validar para o meu cliente. 