# 1. Conceitos Básicos

## 1.1 Definição de Linguagem de Programação

A linguagem de programação é um metodo padronizado, que contém um conjunto de regras semânticas e sintáticas, para a escrita de um código fonte, que será compilado e se transformará em um programa de computador.  Pode-se dizer, que ela é um tipo de abstração, por causa que sua função é padronizar a forma com que transcrevemos as nossas necessidades ou coisas do mundo para o computador. Em resumo, são um conjunto de regras para que eu posso "conversar" com o computador.

A linguagem de programação é composta por palavras chaves, que são convertidas para designar instruções para o computador fazer.  Vale ressaltar que a linguagem de programação defende da lógica que quem está utilizando ela.

Lembre-se! Nenhuma linguagem de programação é a melhor, a melhor linguagem de programação depende do seu objetivo e do qual específico é o seu problema. O que podemos afirmar é que não pode-se ser "fã" de uma única linguagem de programação.

## 1.2 Linguagem de Máquina

A linguagem de máquina é um conjunto de instruções para que os componentes fisicos do computador executem. Ela é expressada através de código binário, ou seja, utilizando apenas zero (0) e um (1). Pois o processador, circuitos eletricos e os demai componentes de um computador, apenas entende a notação binária (que seria tem ou não energia, ligado e desligado e etc.).

A partir da criação do Assembly, as intruções da linguagem de máquina passa a ser expressadas por mnemônico. Além que com o Assembly, é introduzido o conceito de variável (que seria o nome para a alogação de um dado em um determinado local da memória). 

Com isso, demais linguagens de programação começaram a surgir, mas todas com um mesmo porém, todas as linguagens de programação precisavem de um software para traduzir o conteúdo da linguagem de programação para a linguagem de máquina.

## 1.3 Linguagem de Alto Nível vs Linguagem de Baixo Nível

Ao decorrer do tempo, com o surgimento de novas linguagens de programção, foi necessário separar as linguagens de programação em dois tipos:
- Baixo Nível - são linguagens que estão mais próximas e dependem do hardware, com instruções mais simples, mas sendo mais díficil (o entendimento e a programação de um programa) e mais próximo a linguagem de máquina.
- Alto Nível - são linguagens que não dependem mais tanto do hardware, entretanto estão ligadas ao sistema operacional, as instruções são mais complexas, tem uma facilidade maior no entedimento e programação e está mais próxima a linguagem humana. 

## 1.4 Compiladores

Os compiladores eles fazem algumas validações semânticas e sintáticas, caso o seu programa não tenha nenhum erro de sintaxe ou também nenhum outro erro, ele traduz o seu programa feito em uma linguagem de alto nível, para uma linguagem de baixo nível. Ou seja, o compilador valida seu programa, caso passe em suas validações, ele traduz ele para uma linguagem de máquina. Uma vez gerado esse programa de linguagem de baixo nível, ele pode ser executados diversas vezes sem que seja necessário ser compilado novamente.

O ato de compilar um código de linguagem de alto nível passa por algumas etapas, sendo elas:
- Análise Léxica - Lê o código fonte (código feito por uma linguagem de alto nível), lê caracter por caracter e agrupa todos esses caracteres em unidades significativas, chamadas de tokens. Essa parte ela ignora todos os comentários e espaços em branco.
- Análise Sintática - Pega os tokens gerados e verifica se estão na gramática correta da linguagem. E organiza os tokens em uma forma hierárquica, na forma como o código deve ser devidamente executado.
- Análise Semântica - Verifica o tipo dos tokens (garante a conversão correta). Verifica a declaração e utilização de variaveis e garante se as operações do código estejam semânticamente corretas.
- Otimização - Simplifica ao máximo o código para melhor e mais rápida execução, removendo todo tipo de código morto. Ele realiza um loop retirando todo tipo de código desncessário até que chegue em um menor código possível. 
- Geração de código - Traduz as operações de alto nível para uma linguagem de baixo nível (linguagem de máquina). Faz toda a alocação dos registradores e memória RAM e gera um código final para ser executado pela CPU ou por uma máquina virtual (por exemplo, o JVM).

**Observação:** Dependendo do compilador, e também pela linguagem de programação, um código não pode funcionar em sistemas operacionais diferentes, por causa que linguagens de alto nível dependem mais do sistema operacional do que da CPU.

## 1.5 Linguagens Interpretadas

As linguagens interpretadas são aquelas que necessitam de outros software para serem executadas. Vale ressaltar que os interpretadores apenas executam o programa da linguagem de alto nível, ele não traduz/transforma o código de alto nível para um código de máquina.

Os interpretadores fazem o mesmo processo que os compiladores, eles fazem uma análise semântica e sintatica para verificar se o código não possuem algum tipo de erro, mas por sua vez, toda vez que o programa for exectuado, ele analisará todo o código, linha por linha, dessa forma, a execução acaba sendo mais demorada. 

Um exemplo de linguagem interpretada é o JavaScript, que utiliza o motor V8 Chrome como o seu interpretador.

## 1.6 Linguagens com Modelo Híbrido

As linguagens de programação no modelo híbrido são aquelas que utilizam tanto o compilador quanto o interpretador. No qual, o compilador faz a sua função e gera o código bytecode, que por sua vez, é interpretado e executado pelo interpretador.

Um exemplo de uma linguagem de modelo Híbrido é o Java.

## 1.7 Java

O Java, como anteriormente dito, é uma linguagem do modelo híbrido que trouxe uma inovação para o mercado, que foi a criação da JVM (Java Virtual Machine), que ao invés de precisar fazer um código Java para diferentes sistemas operacionais, o Java possue uma máquina virtal para que os programas rodem na máquina virtual ao invés do seu sistema operacional. 

Além disso, o Java possue outros duas criações, que seria o JRE (Java Runtime Environment) que seria todo o ambiente necessário para rodar programas feito em Java o o JDK (Java Development Kit), que seria todo o kit de desenvolvimento necessário para um desenvolvedor criar pogramas Java usando uma IDE.

## 1.8 IDE

IDE nada mais é do que um software utilizado para desenvolver programas. Nele podemos encontrar um editor de texto, um compilador, ambiente para executar o programa e um depurador.