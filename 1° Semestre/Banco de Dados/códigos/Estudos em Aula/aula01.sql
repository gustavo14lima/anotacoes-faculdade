-- Comentário de linha única em MySQL
/*
Esse é um bloco de comentário
ou seja, multiplas linhas em
MySQL
*/

-- Criando um banco de dados (database)
CREATE DATABASE db_ccoa; -- Todo comando deve terminar com ponto e virgula (;)

-- Usando um banco de dados
USE db_ccoa;

-- Criando uma tabela (empresa)
CREATE TABLE empresa(
	id INT PRIMARY KEY,-- INT = usado especialmente para caracterizar quantidade e operações matematicas
    nome VARCHAR(30), -- VARCHAR = quantidade de caracter variavel, vai de 0 à 30/ CHAR = quantidade de caracter fixo 
    /*
    nome com 10 caracter
    no varchar(30), ele vai ocupar 10 "espaços", mesmo não sendo 30
    no char(30), ele vai ocupar 30 "espaços", ele vai preencher 20 caracteres para dar 30
    */
    responsavel VARCHAR(25)
    );
    
-- Descrição da tabela
DESC empresa; -- DESC/DESCRIBE = descreve a tabela

-- Inserindo um registro na tabela
INSERT INTO empresa (id, nome) VALUES
	(1, 'Safra'),
    (2, 'Accenture');
    
INSERT INTO empresa VALUES
	(3, 'Itaú', 'Luiz'),
    (4, 'C6', 'Senhor Ramster');
    
-- Selecionando registros da tabela para visualização

-- Selecionando um campo em especifico
SELECT 
nome -- Todos os campos em uma linha, boa pratica
FROM empresa; 

-- Selecionando todos os campos
SELECT * FROM empresa; 

-- Selecionando campos com restrição
SELECT * FROM empresa WHERE nome = 'Safra';

-- Selecionando campos com uma restrição que, o nome que tiver depois da % não importa, ou seja, volta o nome que começa com 'S' 
SELECT * FROM empresa WHERE nome LIKE 'S%';

-- Selecionado campos com uma restrição, o nome do campo precisa conter a letra 'A' (mesmo que se for em lugares diferentes)
SELECT * FROM empresa WHERE nome LIKE '%a%';

-- Selecionando campos com uma restrição, onde o nome deve ter sua segunda letra o 'C' (o '_' significa um espaço em branco, é ignorado)
SELECT * FROM empresa WHERE nome LIKE '_c%'; 

-- Seleciona todos os campos onde o nome é diferente (!= ou <>) que o 'Safra'
SELECT * FROM empresa WHERE nome != 'Safra';

-- Selecionando todos os campos em que o nome está em ordem alfabetica
SELECT * FROM empresa ORDER BY nome ASC;

-- Selecionando todos os campos em que o nome está em ordem decrescente
SELECT * FROM empresa ORDER BY nome DESC;


-- Teste para conferir se ainda está salvando
-- Positivo, está salvando