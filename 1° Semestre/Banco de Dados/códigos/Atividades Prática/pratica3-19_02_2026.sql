/*
        Exercício 1: Início
*/

-- Criando o banco de dados
CREATE DATABASE game_store;

-- Utilizando o banco de dados
USE game_store;

-- Criando a tabela 'jogo'
CREATE TABLE jogo (
	id INT PRIMARY KEY AUTO_INCREMENT ,
    nome VARCHAR(30), 
    diretor VARCHAR(30),
    genero VARCHAR(30),
    dtLancamento DATE,
    nota TINYINT,
    qtdDisponivel INT,
    -- Alterando a tabela para criar uma checagem na inserção da nota, onde o valor não pode ser menor que 0 e nem maior que 10
    CONSTRAINT cNota CHECK (nota BETWEEN 0 AND 10)
);

-- Inserindo registros
INSERT INTO jogo (nome, diretor, genero, dtLancamento, nota, qtdDisponivel) VALUES
	('Red Dead Redemptiom 2', 'RockStar Games', 'Velho Oeste', '2018-10-28', '10', '999'),
    ('Bloons Tower Defence 6', 'Ninja Kiwi', 'Tower Defence',  '2018-06-14', '9', '998'),
    ('Resident Evil 4', 'Capcom', 'Zumbi', '2005-01-11', '8', '987') ,
    ('Gears of War: Judgment', 'Epic Games', 'Tiro', '2013-03-19', '9', '999'),
    ('Spider-Man', 'Beenox', 'Homem Aranha', '2010-11-7', '9', '80');
    
-- Alterando tabela inserindo uma coluna que represente o tipo de mídia que deve armazenar o tipo de jogo apenas com os valores “física” ou “digital”
ALTER TABLE jogo
ADD COLUMN midia VARCHAR(7) ;
    
ALTER TABLE jogo
ADD CONSTRAINT cMidia CHECK(midia IN ('física', 'digital'));
    
-- Atualizando os registros dos jogos inseridos anteriormente
UPDATE jogo SET midia = 'física' WHERE id < 4;
UPDATE jogo SET midia = 'digital' WHERE id > 3;
    
-- Exibindo apenas os jogos com data de lançamento a partir de 2015.
SELECT 
* 
FROM jogo 
WHERE dtLancamento > '2015-01-01';

-- Exibindo os jogos que tenham a letra “a” em seu nome e são de mídia física
SELECT 
* 
FROM jogo
WHERE nome LIKE '%a%' AND midia = 'física';

-- Exibindo os jogos onde o nome do diretor não contenha a letra “e”.
SELECT 
* 
FROM jogo
WHERE diretor NOT LIKE '%e%';

-- Altere a tabela para criar uma checagem na inserção da nota, onde o valor não pode ser menor que 0 e nem maior que 10
ALTER TABLE jogo
ADD CONSTRAINT cNota CHECK(nota IN (BETWEEN 0 AND 10));

-- Exibindo os jogos de um determinado gênero e que ainda esteja em estoque
SELECT 
* 
FROM jogo
WHERE qtdDisponivel > 0;

-- Excluindo os jogos que não têm mais unidades disponíveis em estoque.
DELETE FROM jogo WHERE qtdDisponivel = 0;
-- Em caso de erro com id primario, utilize
SELECT 
* 
FROM jogo
WHERE 	qtdDisponivel = 0;
DELETE FROM jogo WHERE id = 5; -- no caso seria o ID do jogo que nenhuma unidade disponível

-- Renomeando a coluna “diretor” para “criador” e exibindo como ficou a estrutura da tabela
ALTER TABLE jogo
RENAME COLUMN diretor TO criador;

DESCRIBE jogo;

/*
        Exercício 1: Fim
        Exercício 2: Início
*/

-- Criando banco de dados
CREATE DATABASE olimpiadas;

-- Ussando o banco de dados
USE olimpiadas;

-- Criando a tabela 'esporte'
CREATE TABLE esporte(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(20),
    numero INT,
    estreia DATE,
    pais VARCHAR(30),
    CONSTRAINT cCategoria CHECK(categoria IN ('Individual', 'Coletivo'))
);

-- Inserindo pelo menos 5 registros na tabela
INSERT INTO esporte (nome, categoria, numero, estreia, pais) VALUES
	('Neymar', 'Coletivo', 10, '2009-10-02',  'Brasil'),
	('Bruno Henrique', 'Coletivo', 27, '2011-01-20', 'Brasil'),
	('Cristiano Ronaldo', 'Coletivo', 7, '2002-01-31', 'Portugal'),
	('Yusuf Dikeç', 'Individual', 1, '2001-04-21', 'Turquia'),
	('Ribamar', 'Coletivo', 9, '2015-11-03', 'Brasil');
    
-- Alterando  a tabela para adicionar uma coluna popularidade que armazene a popularidade do esporte como um valor decimal entre 0 e 10 e exiba como ficou a estrutura da tabela
ALTER TABLE esporte
ADD COLUMN popularidade DECIMAL(4, 2);

ALTER TABLE esporte
ADD CONSTRAINT cPopularidade CHECK(popularidade BETWEEN 0 AND 10);

DESCRIBE esporte;

-- Atualizando os registros para definir a popularidade dos esportes inseridos anteriormente
UPDATE esporte
SET popularidade = 8.00
WHERE id = 1;

UPDATE esporte
SET popularidade = 9.90
WHERE id = 2;

UPDATE esporte
SET popularidade = 9.00
WHERE id = 3;

UPDATE esporte
SET popularidade = 8.90
WHERE id = 4;

UPDATE esporte
SET popularidade = 10.00
WHERE id = 5;

-- Exibindo os esportes ordenados por popularidade em ordem crescente
SELECT 
*
 FROM esporte
ORDER BY popularidade ASC;

-- Exiba apenas os esportes que estrearam nas Olimpíadas a partir do ano 2000
SELECT 
* 
FROM esporte
WHERE estreia > 2000-01-01;

-- Crie uma checagem para que não possa ser inserido valores dentro de estreia que seja menor que 06 de abril de 1896 e depois da data atual.
ALTER TABLE esporte
ADD CONSTRAINT cEstreia CHECK(estreia > '1896-04-06' AND estreia < '2026-02-19');

-- Alterando a tabela para excluir a regra de inserção de categoria, assim podendo colocar valores além de "Individual" ou "Coletivo".
ALTER TABLE esporte
DROP CHECK cCategoria;

-- Exibindo apenas os esportes cujo nome do país de origem tenha "a" na segunda letra.
SELECT
*
FROM esporte
WHERE pais LIKE '_a%';

-- Exibindo os dados onde o número de jogadores por equipe esteja entre 4 e 11.
SELECT 
* 
FROM esporte
WHERE numero BETWEEN 4 AND 11;

-- Removendo os registros onde id seja 1, 3 e 5
DELETE FROM esporte
WHERE id IN (1, 3, 5);

/*
        Exercício 2: Fim
        Exercício 3: Início
*/

-- Criando o banco de dados
CREATE DATABASE desenho;

-- Usando o banco de dados
USE desenho;

-- Criando tabela
CREATE TABLE catalago (
	id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50),
    lancamento DATE, 
    emissora VARCHAR(50),
    classificacao INT,
    statusDesenho VARCHAR(15),
    nota TINYINT,
    CONSTRAINT cNota CHECK(nota BETWEEN 1 AND 5)
) AUTO_INCREMENT = 10;

-- Inserindo dados na tabela
INSERT INTO catalago (titulo, lancamento, emissora, classificacao, statusDesenho, nota) VALUES 
	('Dragon Ball Z', '1989-04-26', 'Cartoon Network', 10, 'finalizado', 4),
	('Bob Esponja', '1999-05-01', 'Nickelodeon', 0, 'exibindo', 4),
	('Picles e Amendoim', '2015-09-07', 'Disney XD', 10, 'finalizado', 4),
	('Padrinhos Magicos', '2001-03-30', 'Nickelodeon', 0, 'finalizado', 3),
	('Apenas um Show', '2010-09-06', 'Cartoon Network', 10, 'finalizado', 5);
    
-- Exibindo todos os dados da tabela
SELECT 
* 
FROM catalago;

-- Exibindo todos os desenhos com a classificação menor ou igual a 14 anos
SELECT 
*
FROM catalago
WHERE classificacao <= 14;

-- Exibindo todos os desenhos de uma mesma emissora original
SELECT 
*
FROM catalago
WHERE emissora = 'Cartoon Network';

-- Modificando o campo status, para que aceite apenas o status 'exibindo', 'finalizado', 'cancelado', tente inserir algum outro valor para ver se a regra foi aplicada
ALTER TABLE catalago
ADD CONSTRAINT cStatusDesenho CHECK(statusDesenho IN ('exibindo', 'finalizado', 'cancelado'));

INSERT INTO catalago (titulo, lancamento, emissora, classificacao, statusDesenho, nota) VALUE
	('Dragon Ball Z', '2015-06-05', 'Cartoon Network', 10, 'em exibição', 4);  -- Error Code: 3819. Check constraint 'cStatusDesenho' is violated.

-- Modificando o status 'exibindo' para 'finalizado' de 2 desenhos pelo ID
UPDATE catalago
SET statusDesenho = 'exibindo'
WHERE id = 12;

-- Deletando a linha do desenho de ID 12
DELETE FROM catalago
WHERE id = 12;

-- Exibindo apenas os desenhos que comecem com uma determinada letra
SELECT 
* 
FROM catalago
WHERE titulo LIKE 'D%';

-- Renomeando a coluna classificacao para classificacaoIndicativa
ALTER TABLE catalago
RENAME COLUMN classificacao TO classificacaoIndicativa;

-- Atualizando a nota e data de lançamento do desenho de ID 11
UPDATE catalago
SET lancamento = '2008-01-14'
WHERE id = 11;

-- Limpando todos os dados da tabela
TRUNCATE catalago;

-- Removendo a regra do status do desenho
ALTER TABLE catalago
DROP CHECK cStatusDesenho;

/*
        Exercício 3: Fim
        Exercício 4: Início
*/

-- Criando banco de dados
CREATE DATABASE estoque;

-- Usando o banco de dados
USE estoque;

-- Criando tabela
CREATE TABLE MisteriosSA (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtCompra DATE,
    preco DECIMAL(5, 2),
    peso INT,
    dtRetirada DATE
);

-- Insira na tabela, no mínimo 5 compras de alimentos com datas diferentes. Por agora, não preencha a coluna referente a "data de retirada"
INSERT INTO MisteriosSA (nome, dtCompra, preco, peso) VALUES
	('macarrão', '2026-02-04', '19.99', '1500'),
    ('pão', CURDATE(), '2.00', '800'),
    ('bolo', '2026-01-14', '20.00', '3000'),
    ('hamburguer', '2026-02-15', '25.00', '1000'),
    ('batata', '2026-02-13', '30.00', '5000');
    
-- Verificando se os valores foram inseridos corretamente
SELECT 
CASE
	WHEN preco > 199.99 THEN 'Algo está errado...'
    ELSE 'tudo está certo. Nice'
    END AS verificacaoPreco
FROM MisteriosSA;

-- Exibindo os nomes, as datas de compra e retirada e o id dos alimentos ordenados a partir da data de compra mais antiga.
SELECT
nome, dtCompra, dtRetirada, id
FROM MisteriosSA
ORDER BY dtCompra ASC;

-- Alguém comeu uma caixa de biscoitos, atualizando a data de retirada da caixa de “Biscoitos Scooby” que foi comprada a mais tempo
SELECT 
* 
FROM MisteriosSA; -- descobrindo o id do Biscoitos Scooby

UPDATE MisteriosSA
SET dtRetirada = CURDATE()
WHERE id = 5; -- Colocando o id do Biscoitos Scooby

-- Exibindo os produtos onde o nome seja "Biscoitos Scooby" de forma que o nome das colunas dataCompra apareça como "data da compra" e dataRetirada apareça como "data da retirada".
SELECT
id,
nome,
dtCompra AS 'data da compra',
preco, 
peso, 
dtRetirada AS 'data da retirada'
FROM MisteriosSA
WHERE nome = 'Biscoitos Scooby';

-- Exibindo os alimentos que foram comprados antes do dia 25 de julho de 2024.
SELECT 
* 
FROM MisteriosSA
WHERE dtCompra < 2024-06-25;

-- Exibindo os alimentos que possuem um preço acima ou igual a 30.50
SELECT
*
FROM MisteriosSA
WHERE preco >= 30.50;

-- Limpando a tabela
TRUNCATE MisteriosSA;

/*
        Exercício 4: Fim
        Exercício 5: Início
*/

-- Criando banco de dados
CREATE DATABASE vingadores;

-- Usando o banco de dados
USE vingadores;

-- Criando tabela no banco de dados
CREATE TABLE heroi (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
    versao VARCHAR(45),
    habilidade VARCHAR(45),
	altura INT
);

-- Inserindo 5 herois a tabela
INSERT INTO heroi (nome, versao, habilidade, altura) VALUES
	('Homem Aranha', 'Simbionte', 'Soltar Teia', '170'),
    ('Pantera Negra', 'Ultimato', 'Velocidade e Força', '175'),
    ('Homem Formiga', 'Ultimato', 'Se transformar em Formiga', '178'),
    ('Gavião Arqueiro', 'Luta Contra Loki', 'Atirar Flechas', '180'),
    ('Wolverine', 'x-Men', 'Garras', '185');
    
-- Exibindo os dados inseridos na tabela
SELECT
*
FROM heroi;

-- Adicione um campo de regeneração, onde ele aceitará apenas os valores booleanos de TRUE ou FALSE
ALTER TABLE heroi
ADD COLUMN regeneracao CHAR(5);

ALTER TABLE heroi
ADD CONSTRAINT cRegeneracao CHECK(regeneracao IN('TRUE', 'FALSE'));

-- Modificando o campo versão para aceitar até 100 caracteres
ALTER TABLE heroi
MODIFY COLUMN versao VARCHAR(100);

-- Removendo o herói de id 3 pois ele se morreu em batalha
DELETE FROM heroi
WHERE id = 3;

-- Chegou reforços, insirindo um novo herói para a equipe
INSERT INTO heroi (nome, versao, habilidade, altura, regeneracao) VALUE
	('Guardiões das Galaxias', 'Primeiro Filme', 'Protegem a galaxia', '200', 'TRUE');
    
-- Exibindo todos os dados inseridos na tabela onde o nome do herói começa com “C” ou “H”.
SELECT 
* 
FROM heroi
WHERE nome LIKE 'C%' OR nome LIKE 'H%';

-- Exibindo todos os dados inseridos na tabela onde o nome do herói não contém a letra “A” no campo nome
SELECT 
*
FROM heroi
WHERE nome NOT LIKE '%a%';

-- Exibindo apenas o nome do herói onde a altura for maior que 190.
SELECT
*
FROM heroi
WHERE altura > 190;

-- Exibindo todos os dados da tabela de forma decrescente pelo nome onde a altura do herói for maior que 180.
SELECT
* 
FROM heroi
WHERE altura > 180
ORDER BY nome DESC;

-- Limpando os dados da tabela
TRUNCATE heroi;