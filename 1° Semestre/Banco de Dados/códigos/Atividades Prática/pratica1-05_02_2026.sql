-- Comandos essencial para todos os exercícios - Iníco

-- Criando banco de dados
CREATE DATABASE sprint1;

-- Usando a banco de dados
USE sprint1;

-- Comandos essencial para todos os exercícios - Fim

-- Exercício 1 - Início

-- Criando tabela atleta
CREATE TABLE Atleta (
	idAtleta int PRIMARY KEY, -- identificador unico que será a chave primaria
    nome VARCHAR(40), 
    modalidade VARCHAR(40),
    qtdMedalha int -- quantidade de medalha
    );
    
-- Atribuindo dados a tabela
INSERT INTO Atleta VALUES
	(1, 'Bruno Henrique', 'Futebol', 6),
    (2, 'Cristiano Ronaldo', 'Futebol', 999),
    (3, 'Mike Tyson', 'Boxe', 2),
    (4, 'Seu Madruga', 'Boxe', 999999),
    (5, 'Adam Sandler', 'Golf', 67);
    
-- Exibindo todos os dados da tabela
SELECT * FROM Atleta;

-- Exibindo nome e quantidade de medalhas da tabela
SELECT nome, qtdMedalha FROM Atleta;

-- Exibindo dados apenas da modalidade 'Boxe'
SELECT * FROM Atleta WHERE modalidade = 'Boxe';

-- Exibindo dados da tabela ordenando pela modalidade
SELECT * FROM Atleta ORDER BY modalidade ASC;

-- EXibindo dados ordenados pela quantidade de medalhas e em ordem decrescente
SELECT * FROM Atleta ORDER BY qtdMedalha DESC;

-- Exibindo dados cujo o nome contenha a letra 'S'
SELECT * FROM Atleta WHERE nome LIKE '%S%';

-- Exibindo dados cujo nome dos atletas comece com 'S'
SELECT * FROM Atleta WHERE nome LIKE 'S%';

-- Exibindo dados cujo nome do atleta termina com a letra 'O'
SELECT * FROM Atleta WHERE nome LIKE '%O';

-- Exibindo dados cujo nome do atletas tenha a penúltima letra 'R'
-- Atribuindo um dado onde o nome tenha sua penúltima letra o 'R'
INSERT INTO Atleta VALUES 
	(6, 'André', 'Golf', '0');
SELECT * FROM Atleta WHERE nome LIKE '%R_';

-- Eliminando a tabela
DROP TABLE Atleta;

-- Exercício 1 - Fim

-- Exercício 2 - Início

-- Criando tabela Musica
CREATE TABLE Musica (
	idMusica INT PRIMARY KEY,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
    );
    
-- Inserindo dados na tabela
INSERT INTO Musica VALUES 
	(1, 'Revenga', 'System Of Down', 'Rock'),
    (2, 'Sad Statue', 'System Of Down', 'Rock'),
    (3, 'Psychosocial', 'Slipknot', 'Rock'),
    (4, 'Hoje a Noite', 'Calcinha Preta', 'Rock'),
    (5, 'Mágica', 'Calcinha Preta', 'Rock'),
    (6, 'Tora Tora', 'Raimundos', 'Rock'),
    (7, 'Eu quero ver o oco', 'Raimundos', 'Rock'),
    (8, 'Drain You', 'Nirvana', 'Rock'),
	(9, 'Não Fosse Tão Tarde', 'Lou Gargia', 'POP'),
    (10, 'Bad Romance', 'Lady Gaga', 'POP');
    
-- Exibindo todos os dados da tabela
SELECT * FROM Musica;

-- Exibindo apenas os titulos e artisitas
SELECT titulo, artista FROM Musica;

-- Exibindo apenas os dados de um determinado gênero
SELECT * FROM Musica WHERE genero = 'POP';

-- Exibindo dados de um determinado artista
SELECT * FROM Musica WHERE artista = 'System Of Down';

-- Exbindo dados ordenados pelo titulo
SELECT * FROM Musica ORDER BY titulo ASC;

-- Exbiindo dados ordenados pelo artista em ordem decrescente
SELECT * FROM Musica ORDER BY artista DESC;

-- Exibindo dados cujo título comece com a letra 'R'
SELECT * FROM Musica WHERE titulo LIKE 'R%';

-- Exbindo dados cujo artista termina com uma determinada letra
SELECT * FROM Musica WHERE artista LIKE '%A';

-- Exibindo dados cujo gênero tenha como segunda letra 'O'
SELECT * FROM Musica WHERE genero LIKE '_O%';

-- Exbindo dados cujo título tenha como penultima letra 'A'
SELECT * FROM Musica WHERE titulo LIKE '%D_';

-- Eliminando tabela
DROP TABLE Musica;

-- Exercício 2 - Fim

-- Exercício 3 - Início

-- Criando tabela
CREATE TABLE Filme (
	idFilme INT PRIMARY KEY,
    titulo VARCHAR(50),
    genero VARCHAR(40),
    diretor VARCHAR(40)
    );
    
-- Atribuindo dados a tabela
INSERT INTO Filme VALUES
	(1, 'Club da Luta', 'Ação', 'David Fincher'),
    (2, 'Fuga das Galinhas', 'Comédia', 'Nick Park'),
    (3, 'Gente Grande', 'Comédia', 'Dennis Dugan'),
    (4, 'Gente Grande 2', 'Comédia', 'Dennis Dugan'),
    (5, 'Chainsaw Man: O Filme - Arco da Reze', 'Animação', 'Tatsuya Yoshihara'),
    (6, 'Demon Slayer: Kimetsu no Yaiba - Castelo Infinito', 'Animação', 'Haruo Sotozaki'),
    (7, 'Demon Slayer - Mugen Train: O Filme', 'Animação', 'Haruo Sotozaki');
    
-- Exibindo todos os dados
SELECT * FROM Filme;

-- Exibindo dados apenas os titulos e diretores
SELECT titulo, diretor FROM Filme;

-- Exibindo dados apenas os filmes de um determinado gênero 
SELECT * FROM Filme WHERE genero = 'Animação';

-- Exibindo dados apenas os filmes de um determinado diretor
SELECT * FROM Filme WHERE diretor = 'Dennis Dugan';

-- Exibindo dados ordenados pelo título do filme
SELECT * FROM Filme ORDER BY titulo ASC;

-- Exibindo dados ordenando pelo diretor em ordem decrescente
SELECT * FROM Filme ORDER BY diretor DESC;

-- Exibindo dados cujo título comece com uma determinada letra
SELECT * FROM Filme WHERE titulo LIKE 'C%';

-- Exibindo dados cujo diretor termine com uma determinada letra
SELECT * FROM Filme WHERE diretor LIKE '%N';

-- Exibindo dados dcujo gênero ternha como segunda letra uma determinada letra
SELECT * FROM Filme WHERE genero LIKE '_N%';

-- Exibindo dados cujo título tenha como penúltima letra uma determinada letra
SELECT * FROM Filme WHERE titulo LIKE '%A_';

-- Eliminando tabela
DROP TABLE Filme;

-- Exercício 3 - Fim

-- Exercício 4 - Início


-- Criando tabela
CREATE TABLE Professor (
	idProfessor INT PRIMARY KEY,
    nome VARCHAR(50),
    especialidade VARCHAR(40),
    dtNasc DATE
    );
    
-- Inserindo dados na tabela
INSERT INTO Professor VALUES 
	(1, 'Vivian', 'Banco de Dados', '1983-10-13'),
    (2, 'Matheus', 'Introdução Sistemas Operacionais', '1990-03-10'),
    (3, 'Matheus', 'Arquitetura Computacional', '1990-03-10'),
    (4, 'Marcos', 'Tecnologia da Informação', '1985-02-17'),
    (5, 'Giuliana', 'Algoritmos', '1999-11-19'),
    (6, 'Thaigo', 'Socio Emocional', '1987-02-21');
    
-- Exibindo todos os dados da tabela
SELECT * FROM Professor;

-- Exibindo apenas as especialidades dos professores
SELECT especialidade FROM Professor;

-- Exibindo dados dos professores de uma determinada especialidade
SELECT * FROM Professor WHERE especialidade = 'Banco de Dados';

-- Exibindo dados ordenando pelo nome do professor
SELECT * FROM Professor ORDER BY nome ASC;

-- Exibindo dados ordenando pela data de nascimento em ordem decrescente
SELECT * FROM Professor ORDER BY dtNasc DESC;

-- Exibindo dados cujo nome comece com uma determinada letra
SELECT * FROM Professor WHERE nome LIKE 'M%';

-- Exibindo dados cujo nome termine com uma determinada letra
SELECT * FROM Professor WHERE nome LIKE '%N';

-- Exibindo dados cujo nome tenha como segunda letra, uma determinada letra
SELECT * FROM Professor WHERE nome LIKE '_H%';

-- Exibindo dados cujo nome tenha como penúltima letra uma determinada letra
SELECT * FROM Professor WHERE nome LIKE '%U_';

-- Eliminando tabela
DROP TABLE Professor;

-- Exercício 4 - Fim

-- Exercício 5 - Início


-- Criando tabela
CREATE TABLE Jogo (
	idJogo INT PRIMARY KEY,
    nome VARCHAR(50),
    comentario VARCHAR(200),
    ranking INT
    );
    
-- Inserindo dados na tabela
INSERT INTO Jogo VALUES
	(1, 'Red Dead Redemption 2', 'Melhor jogo de todos os tempos', '1'),
    (2, 'Bloons TD 6', 'Macaquinho que estoura balão', '4'),
    (3, 'Ultrakill', 'Maquina com Raiva, Maquina atirar e bater em todos', '6'),
    (4, 'Dark Souls 1', 'Plin Plin Plon', '3'),
    (5, 'Elden Ring', 'JOGAÇO', '2'),
    (6, 'Mortal Kombat X', 'Erron Black melhor personagem', '7');
    
-- Exibindo todos os dados 
SELECT * FROM Jogo;

-- Exibindo apenas os nomes dos jogo
SELECT nome FROM Jogo;

-- Exibindo apenas o comentário de um determinado jogo
SELECT comentario FROM Jogo WHERE nome = 'Red Dead Redemption 2';

-- Exibindo os dados ordenados pelo nome do jogo
SELECT * FROM Jogo ORDER BY nome ASC;

-- Exibindo dados ordenados pelo ranking em ordem decrescente
SELECT * FROM Jogo ORDER BY ranking DESC;

-- Exibindo dados cujo nome comece com uma determinada letra
SELECT * FROM Jogo WHERE nome LIKE 'D%';

-- Exibindo dados cujo nome termine com uma determinada letra
SELECT * FROM Jogo WHERE nome LIKE '%G';

-- Exibindo dados cujo nome tenha como segunda letra uma determinada letra
SELECT * FROM Jogo WHERE nome LIKE '_L%';

-- Exibindo dados cujo nome tenha como penúltima letra uma determinada letra
SELECT * FROM Jogo WHERE nome LIKE '%L_';

-- Exibindo dados cujo nome seja diferente de Minecraft
SELECT * FROM Jogo WHERE nome != 'Minecraft';

-- Elimine a tabela
DROP TABLE Jogo;

-- Exercício 5 - Fim