
# Aula 02 - Intrudoção a Linguagem de Programação Java

## 2.1 Nomenclaturas

Em Java utilizaremos alguns tipos de nomenclaturas, cada nomenclatura terá uma funcionalidade, sendo elas:
- kebab-case - utilizda para nomear arquivos
- PascalCase - utilizada para nomear classes
- camelCase - utilizada para nomear varáveis e pacotes
- SNAKE-CASE - utilizada para nomear constantes

## 2.2 Pacotes

Um pacote é uma caixa de organização, usada praa separa classes, ou seja, um pacote possui classes de uma determinada finalidade.  Podemos assimilar ele a uma pasta que agrupa um conjunto de classes. O primeiro pacote criado em um projeto Java, geralmente é usado o padrão web e o seu nome geralmente é o nome de dóminio da empresa que você está trabalhando. Por exemplo, caso você esteja trabalhando na São Paulo Tech School, o nome do seu primeiro pacote será: school.sptech. Padrão web = youtube.com -> com.youtube.

## 2.3 Import

import informa que a classe atual que você está usando, irá usar uma biblioteca ou outra classe. Você pode fazer mais de um import por classe, e uma boa prática, é colocar o import depois do package (pacote), ou seja, ficando assim:
	package web.padrao;
	 import caminhoENomeDaBiblioteca

## 2.3 Alguns conceitos semelhantes ao JavaScript

- Atribuição de Variável
	- O Java se diferencia apenas por ser fortemente tipada, você precisa definer o tipo da variável antes de nomer e atribuir um valor a ele.
	- Exemplo: String nome = Gustavo;
- Operadores aritméticos
- Operadores de operação
- Operadores lógicos 
- Estrutura condicional
- Estrutura de repetição 

## 2.4 Alguns arquivos básicos da construção de um projeto
-  pom.xml - informações básicas sobre o projeto. 
- .idea - informações básicas sobre a IDE que você está utilizando.
- .mvn - configuração do maven
- src - arquivo onde se concentra todo o projeto/trabalho
- src/main - diretório que carrega o projeto
- src/main/java - todo código fonte do projeto 
- src/main/resources -arquivos de configuração (tanto os arquivos de configuração criados pelo java, quanto criados pelo o desenvolvedor)
- src/test - diretório para criar testes unitários
- target - copia compilada do código. Apenas para questão de validação de semântica e sintática. Essa parta é criado quando você executa o código.