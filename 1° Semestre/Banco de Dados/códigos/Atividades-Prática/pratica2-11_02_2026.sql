/*
	Exercício 1: Início
*/
                                                                 
-- Comandos essencial para todos os exercícios - Iníco

-- Criando o banco de dados 'sprint1'
CREATE DATABASE sprint1;

-- Usando o banco de dados 'sprint1'
USE sprint1;

-- Comandos essencial para todos os exercícios - Fim

-- Criando tabela chamada Atleta
CREATE TABLE Atleta (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT -- representatividade da quantidade de medalhas do atleta
);

-- Inserindo dados na tabela Atleta
INSERT INTO Atleta (nome, modalidade, qtdMedalha) VALUES
	('Bruno Henrique', 'Futebol', 67),
    ('Cristiano Ronaldo', 'Futebol', 999),
    ('Seu Madruga', 'Box', 9999999),
    ('Mique Tyson' ,'Box', 0), -- Nome colocado incorretamente propositalmente
    ('Ayrton Senna', 'Formula 1', 27);
    
    -- Exibindo todos os dados da tabela
    SELECT  *  FROM Atleta;
    
    -- Atualizando a quantidade de medalhas do atleta com id=1
    UPDATE Atleta
    SET qtdMedalha = 69
    WHERE id=1;
    
    -- Atualizano a quantidade de medalhas do atleta com id=2 e com o id=3
    UPDATE Atleta
    SET qtdMedalha = 999999999
    WHERE id  IN (2, 3);
    
    -- Atualizando o nome do atleta com id=4
    UPDATE Atleta
    SET nome = 'Mike Tyson'
    WHERE id=4;
    
    -- Adicionando o campo dtNasc na tabela
    ALTER TABLE Atleta ADD COLUMN dtNasc date;
    
    -- Atualizando a data de nascimento de todos os atletas
    UPDATE Atleta
    SET dtNasc = '1999-02-19'
    WHERE id = 1;
    
    UPDATE Atleta
    SET dtNasc = '1989-02-19'
    WHERE id = 2;
    
    UPDATE Atleta
    SET dtNasc = '1999-04-19'
    WHERE id = 3;
    
    UPDATE Atleta
    SET dtNasc = '1979-02-20'
    WHERE id = 4;
    
    UPDATE Atleta
    SET dtNasc = '1929-12-20'
    WHERE id = 5;   
    
-- Excluindo Atleta com id=5
DELETE FROM Atleta 
WHERE id = 5;

-- Exibindo os atetlas onde a modalidade é diferente de natação
SELECT * FROM Atleta WHERE modalidade <> 'Natação';

-- Exibindo os dados dos atletas que tem a quantidade  de medalhas maior ou igual a 3
SELECT * FROM Atleta WHERE qtdMedalha >= 3;

-- Modificando o campo modalidade de tamanho 40 para o tamanho 60
ALTER TABLE Atleta
MODIFY COLUMN modalidade VARCHAR(60);

-- Descrevendo os campos da tabelha mostrando a atualização do campo modalidade
DESCRIBE Atleta;

-- Limpando os dados da tabela
TRUNCATE TABLE Atleta;

/*
	Exercício 1: Fim
    Exercício 2: Início
*/

-- Criando tabela Musica
CREATE TABLE Musica (
	idMusica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
    );

-- Inserindo dados na tabela    
INSERT INTO Musica ( titulo, artista, genero) VALUES
	('Revenga', 'System Of Down', 'Rock'),
    ('Sad Statue', 'System Of Down', 'Rock'),
    ( 'Psychosocial', 'Slipknot', 'Rock'),
    ('Hoje a Noite', 'Calcinha Preta', 'Rock'),
    ('Mágica', 'Calcinha Preta', 'Rock'),
    ( 'Tora Tora', 'Raimundos', 'Rock'),
    ( 'Eu quero ver o oco', 'Raimundos', 'Rock'),
    ( 'Drain You', 'Nirvana', 'Rock'),
	( 'Não Fosse Tão Tarde', 'Lou Gargia', 'POP'),
    ( 'Bad Romance', 'Lady Gaga', 'POP');
    
-- Exibindo todos os dados da tabela
SELECT * FROM Musica;

-- Adicionando o campo curtidas do tipo int na tabela
ALTER TABLE Musica
ADD COLUMN curtidas INT;

-- Atualizando o campo curtidas de todas as musicas inseridas
UPDATE Musica
SET curtidas = 999
WHERE idMusica = 1;

UPDATE Musica
SET curtidas = 96999
WHERE idMusica = 2;

UPDATE Musica
SET curtidas = 99499
WHERE idMusica = 3;

UPDATE Musica
SET curtidas = 19999
WHERE idMusica = 4;

UPDATE Musica
SET curtidas = 39999
WHERE idMusica = 5;

UPDATE Musica
SET curtidas = 97999
WHERE idMusica = 6;

UPDATE Musica
SET curtidas = 39999
WHERE idMusica = 7;

UPDATE Musica
SET curtidas = 109999
WHERE idMusica = 8;

UPDATE Musica
SET curtidas = 924999
WHERE idMusica = 9;

UPDATE Musica
SET curtidas = 1009999
WHERE idMusica = 10;

-- Modificando o campo artista do tamanho 40 para tamanho 80
ALTER TABLE Musica
MODIFY COLUMN artista VARCHAR(80);

-- Atualizando a quantidade de curtidas das musicas comid =2 e com o id=3
UPDATE Musica
SET curtidas = 999999999
WHERE idMusica IN (2, 3);

-- Atualizando o nome da musica com o id=5
UPDATE Musica
SET titulo = 'mágica'
WHERE idMusica = 5;

-- Excluindo musica com o id=4
DELETE FROM Musica 
WHERE idMusica = 4;

-- Exibindo as musicas onde o genero é diferente de funk
SELECT * FROM Musica WHERE genero != 'Funk';

-- Exibindo os dados das musicas que tem curtidas maior ou igual a 20
SELECT * FROM Musica WHERE curtidas >= 20;

-- Descrevendo campos da tabela mostrando as atualizaçõs do campo artistico
DESCRIBE Musica;

-- Limpando dados da tabela
TRUNCATE TABLE Musica;

/*
	Exercício 2: Fim
	Exercício 3: Início
*/

-- Criando uma tabela Filme
CREATE TABLE Filme (
	idFilme INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50),
    genero VARCHAR(40),
    diretor VARCHAR(40)
);

-- Inserindo dados na tabela
INSERT INTO Filme (titulo, genero, diretor) VALUES
	( 'Club da Luta', 'Ação', 'David Fincher'),
    ('Fuga das Galinhas', 'Comédia', 'Nick Park'),
    ( 'Gente Grande', 'Comédia', 'Dennis Dugan'),
    ( 'Gente Grande 2', 'Comédia', 'Dennis Dugan'),
    ('Chainsaw Man: O Filme - Arco da Reze', 'Animação', 'Tatsuya Yoshihara'),
    ('Demon Slayer: Kimetsu no Yaiba - Castelo Infinito', 'Animação', 'Haruo Sotozaki'),
    ('Demon Slayer - Mugen Train: O Filme', 'Animação', 'Haruo Sotozaki');

-- Exibindo todos os dados da tabela
SELECT * FROM Filme;

-- Adicionando campo protagonista do tipo varchar(50) na tabela
ALTER TABLE Filme
ADD COLUMN protagonista VARCHAR(50);

-- Atualizando o campo protagonista de todos os filmes inseridos
UPDATE Filme
SET protagonista = 'Narrador'
WHERE idFilme = 1;

UPDATE Filme
SET protagonista = 'Ginger'
WHERE idFilme = 2;

UPDATE Filme
SET protagonista = 'Lenny Feder'
WHERE idFilme IN (3, 4);

UPDATE Filme
SET protagonista = 'Denji'
WHERE idFilme = 5;

UPDATE Filme
SET protagonista = 'Tanjiro'
WHERE idFilme IN (6, 7);

-- Modificando o campo diretor do tamanho 40 para o tamanho 50
ALTER TABLE Filme
MODIFY COLUMN diretor VARCHAR(50);

-- Atualizando o diretor do filme com id = 5
 UPDATE Filme
 SET diretor = 'Gustavo Lima de Araujo'
 WHERE idFilme = 5;
 
 -- Atualizando o diretor dos filmes com o id = 2 e com o id = 7
 UPDATE Filme
 SET diretor = 'Vivian'
 WHERE idFilme IN (2, 7);
 
 -- Atualizando o titulo do filme com o id = 6
 UPDATE Filme
 SET titulo = 'Demon Slayer: Regoku'
 WHERE idFilme = 6;
 
 -- Excluindo o filme com o id = 3
 DELETE FROM Filme
 WHERE idFilme = 3;
 
 -- Exibindo os filmes em que o gênero é diferente de drama
 SELECT * FROM Filme WHERE genero <> 'drama';
 
 -- Exibindo os dados dos filmes que o genero é igual a 'suspense'
 SELECT * FROM Filme WHERE genero = 'suspensa';
 
 -- Descrevendo os campos da tabela mostrando a atualização do campo protagonista e diretor
 DESCRIBE Filme;
 
 -- Limpando os dados da tabela
 TRUNCATE TABLE Filme;
 
 /*
	Exercício 3: Fim
	Exercício 4: Início
*/

-- Criando tabela chamada Professor
CREATE TABLE Professor (
	idProfessor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    especialidade VARCHAR(40),
    dtNasc DATE
);

-- Inserindo dados na tabela
INSERT INTO Professor (nome, especialidade, dtNasc) VALUES
	('Vivian', 'Banco de Dados', '1983-10-13'),
    ('Matheus', 'Introdução Sistemas Operacionais', '1990-03-10'),
    ('Matheus', 'Arquitetura Computacional', '1990-03-10'),
    ('Marcos', 'Tecnologia da Informação', '1985-02-17'),
    ('Giuliana', 'Algoritmos', '1999-11-19'),
    ('Thaigo', 'Socio Emocional', '1987-02-21');

-- Exibindo todos os dados da tabela
SELECT * FROM Professor;

-- Inserindo um novo professor
INSERT INTO Professor (nome, especialidade, dtNasc) VALUES
	('Fernando Brandão', 'Pesquisa da Inovação', '1960-02-23');

-- Excluindo o professor onde o idProfessor = 5
DELETE FROM Professor
WHERE idProfessor = 5;

--  Atualizando a data de nascimento do idProfessor igual a 3;
UPDATE Professor
SET dtNasc = '1990-09-17'
WHERE idProfessor = 3;

-- Limpando a tabela Professor;
TRUNCATE TABLE Professor;

 /*
	Exercício 4: Fim
	Exercício 5: Início
*/

-- Criando tabela 'curso'
CREATE TABLE Curso (
	idCurso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    sigla VARCHAR(3),
    coordenador VARCHAR(50)
);

-- Inserindo dados na tabela
INSERT INTO Curso (nome, sigla, coordenador) VALUES
	('Ciência da Computação', 'CCO', 'Marise Miranda'),
    ('Sistemas da Informação', 'SIS', 'Alex Barreira'),
    ('Análise e Desenvolvimento de Sistemas', 'ADS', 'Gerson Santos');
    
-- Exibindo todos os dados da tabela
SELECT * FROM Curso;

-- Exibindo apenas os coordenadores dos cursos
SELECT coordenador FROM Curso;

-- Exibindo apenas os dados dos cursos de uma determinada sigla
SELECT * FROM Curso WHERE sigla = 'CCO';

-- Exibindo os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
SELECT * FROM Curso ORDER BY coordenador DESC;

-- Exibindo os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE 'C%O';

-- Exibindo os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '%s';

-- Exibindo os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '_i%';

-- Exibindo os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '%a_';

-- Eliminando a tabela
DROP TABLE Curso;

 /*
	Exercício 5: Fim
	Exercício 6: Início
*/

-- Criando uma tabela chamada 'Revista'
CREATE TABLE Revista (
	idRevista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(30)
);

-- Inserindo dados na tabela sem informar a categoria
INSERT INTO Revista (nome) VALUES
	('mad'),
    ('Revista Culinária'),
    ('Avon' ),
    ('Natura');
    
    -- Exibindo todos os dados da tabela
    SELECT * FROM Revista;
    
    -- Atualizando os dados das categorias das 4 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
    UPDATE Revista
    SET categoria = 'Humor'
    WHERE idRevista = 1;
    
  UPDATE Revista
    SET categoria = 'Culinária'
    WHERE idRevista = 2;
    
    UPDATE Revista
    SET categoria = 'Cosméticos'
    WHERE idRevista IN (3, 4);

    SELECT * FROM Revista;
    
    -- Inserindo mais 3 registros completos
    INSERT INTO Revista (nome, categoria) VALUES
	('Veja', 'Notícias'),
    ('Quatro Rodas', 'Variedades'),
    ('Memórias do Instituto Oswaldo Cruz' , 'Científica');
    
    -- Exibindo os dados da tabela novamente
	SELECT * FROM Revista;
    
    -- Exibindo a descrição da estrutura da tabela.
    DESCRIBE Revista;
    
    -- Atualizando a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
    ALTER TABLE Revista
    MODIFY COLUMN categoria VARCHAR(40);
    
    -- Exibindo novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
    DESCRIBE Revista;
    
    -- Acrescentando a coluna periodicidade à tabela, que é varchar(15).
    ALTER TABLE Revista
    ADD COLUMN periodicidade VARCHAR(15);
    
    -- Exibindo os dados da tabela.
    TRUNCATE TABLE Revista;
    
    -- Excluindo a coluna periodicidade da tabela.
    ALTER TABLE Revista
    DROP COLUMN periodicidade;
    
/*
	Exercício 6: Fim
	Exercício 7: Início
*/

	-- Criando tabela 'Carro'
	CREATE TABLE Carro (
		idCarro INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(40),
        placa CHAR(7)
	) AUTO_INCREMENT = 1000;
    
    -- Inserindo 4 registros na tabela
    INSERT INTO Carro (nome, placa) VALUES 
		('Corsa', 'BSA8964'),
        ('Monza', 'BQO6749'),
        ('Opala 6 cilindros Turbo', 'COZ3411'),
        ('Uno Quadrado', 'FWW9086');
	
    -- Exibindo todos os dados da tabela
    SELECT * FROM Carro;
    
    -- Insirindo mais 3 registros sem a placa dos carros
    INSERT INTO Carro (nome) VALUES
		('vectra'),
        ('honda civic'),
        ('Fusca');
        
	-- Exibindo novamente os dados da tabela.
    SELECT * FROM Carro;
    
    -- Exibindo a descrição da estrutura da tabela.
    DESCRIBE Carro;
    
    -- Alterando a tabela para que a coluna nome possa ter no máximo 28 caracteres.
    ALTER TABLE Carro
    MODIFY COLUMN nome VARCHAR(28);
    
    -- Exibindo novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna;
    DESCRIBE Carro;
    
    -- Acrescentando a coluna ano à tabela, que é char(4);
    ALTER TABLE Carro
    ADD COLUMN ano CHAR(4);
    
    -- Atualizando todos os dados nulos da tabela;
    
    -- Adicionando ano de lançamento
    UPDATE Carro
    SET ano ='1994'
    WHERE idCarro = 1000;
    
    UPDATE Carro
    SET ano ='1982'
    WHERE idCarro = 1001;   

    UPDATE Carro
    SET ano ='1968'
    WHERE idCarro = 1002;        
    
    UPDATE Carro
    SET ano ='1984'
    WHERE idCarro = 1003;
    
   UPDATE Carro
    SET ano ='1993'
    WHERE idCarro = 1004;
 
	UPDATE Carro
    SET ano ='1972'
    WHERE idCarro = 1005;
	
    UPDATE Carro
    SET ano ='1928'
    WHERE idCarro = 1006;
    
    -- Adicionando Placa de Carro a partir do id 1004
    UPDATE Carro
    SET placa = 'FXJ9083'
    WHERE idCarro = 1004;
    
    UPDATE Carro
    SET placa = 'GJN3314'
    WHERE idCarro = 1005;
    
    UPDATE Carro
    SET placa = 'CLS3929'
    WHERE idCarro = 1006;