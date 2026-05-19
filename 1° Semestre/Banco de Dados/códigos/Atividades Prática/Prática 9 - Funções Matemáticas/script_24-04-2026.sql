/*
	Criando e utilizando o banco de dados para a atividade
*/
CREATE DATABASE pratica09;
USE pratica09;

-- Criando a tabela 'professor' 
CREATE TABLE professor (
	id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    disciplina VARCHAR(45)
) AUTO_INCREMENT = 10000;	

-- Criando a tabela 'grupo'
CREATE TABLE grupo (
	id_grupo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao_projeto VARCHAR(200)
);

-- Criando a tabela 'aluno'
CREATE TABLE aluno (
	ra CHAR(8) UNIQUE NOT NULL,
    nome VARCHAR(45),
    email VARCHAR(45),
    fk_grupo INT,
    CONSTRAINT chFkGrupo FOREIGN KEY (fk_grupo) REFERENCES grupo(id_grupo)
);

-- Criando a tabela 'avaliacao' (que será uma tabela N:N)
CREATE TABLE avaliacao (
	fk_grupo INT,
    fk_professor INT,
    dt_inicio DATETIME,
    nota_professor INT,
    CONSTRAINT ctFKGrupo FOREIGN KEY (fk_grupo) REFERENCES grupo(id_grupo),
    CONSTRAINT chFkProfessor FOREIGN KEY (fk_professor) REFERENCES professor(id_professor)
);

-- Inserindo dados na tabela 'professor'
INSERT INTO professor (nome, disciplina) VALUES
	('Professor 1', 'DIsciplina 1'),
    ('Professor 2', 'DIsciplina 2'),
    ('Professor 3', 'DIsciplina 3'),
    ('Professor 4', 'DIsciplina 4'),
    ('Professor 5', 'DIsciplina 5');
    
-- Inserindo dados na tabela 'grupo'
INSERT INTO grupo (nome, descricao_projeto) VALUES
	('Grupo 1', 'Descrição do Projeto 1'),
    ('Grupo 2', 'Descrição do Projeto 2'),
    ('Grupo 3', 'Descrição do Projeto 3'),
    ('Grupo 4', 'Descrição do Projeto 4'),
    ('Grupo 5', 'Descrição do Projeto 5');
    
-- Inserindo dados na tabela 'aluno'
INSERT INTO aluno (ra, nome, email, fk_grupo) VALUES
	(11111111, 'Aluno 1', 'E-mail 1', 1),
    (11111112, 'Aluno 2', 'E-mail 2', 1),
    (11111113, 'Aluno 3', 'E-mail 3', 2),
    (11111114, 'Aluno 4', 'E-mail 4', 2),
    (11111115, 'Aluno 5', 'E-mail 5', 3),
    (11111116, 'Aluno 6', 'E-mail 6', 3),
    (11111117, 'Aluno 7', 'E-mail 7', 4),
    (11111118, 'Aluno 8', 'E-mail 8', 4),
    (11111119, 'Aluno 9', 'E-mail 9', 5),
    (11111110, 'Aluno 10', 'E-mail 10', 5);
    
-- Inserindo dados na tabela 'avaliacao'
INSERT INTO avaliacao (fk_grupo, fk_professor, dt_inicio, nota_professor) VALUES
	(1, 10003, '2026-02-12 12:12:12', 9),
    (2, 10000, '2026-03-24 14:21:00', 8),
    (3, 10001, '2026-02-01 10:21:31', 7),
    (4, 10004, '2026-04-01', 10),
    (5, 10001, '2026-02-12 14:59:59', 8);
    
-- Exibindo todos os dados da tabela 'professor'
SELECT * FROM professor;

-- Exibindo todos os dados da tabela 'grupo'
SELECT * FROM grupo;

-- Exibindo todos os dados da tabela 'aluno'
SELECT * FROM aluno;

-- Exibindo todos os dados da tabela 'avaliacao'
SELECT * FROM avaliacao;

-- Exibindo os dados dos grupos e os dados dos seus respectivos alunos
SELECT 
	g.nome,
    g.descricao_projeto,
    a.ra,
    a.nome,
    a.email
FROM grupo AS g
JOIN aluno AS a ON a.fk_grupo = g.id_grupo;

-- Exibindo os dados deum determinado grupo e os dados dos seus respectivos alunos
SELECT 
	g.nome,
    g.descricao_projeto,
    a.ra,
    a.nome,
    a.email
FROM grupo AS g
JOIN aluno AS a ON a.fk_grupo = g.id_grupo
WHERE g.nome LIKE '%1%';

-- Exibindo a média das notas atribuidas pelo grupo
SELECT
    CONCAT('A nota geral dos grupos foi: ', AVG(nota_professor)) AS 'Média de notas'
FROM avaliacao;

-- Exibindo a menor e maior nota dos grupos
SELECT
    CONCAT('A menor nota dos grupos foi: ', MIN(nota_professor)) AS 'Menor nota',
    CONCAT('A maior nota dos grupos foi: ', MAX(nota_professor)) AS 'Maior nota'
FROM avaliacao;

-- Exibindo a soma das notas
	SELECT
    CONCAT('A somas de todas as notas foi: ', SUM(nota_professor)) AS 'Soma das notas'
FROM avaliacao;

-- Exibindo os dados do professor que avaliaram os grupos, junto com sua data e hora
SELECT 
	p.nome,
    p.disciplina,
    g.nome,
    g.descricao_projeto,
    a.dt_inicio
FROM avaliacao AS a
JOIN professor AS p ON a.fk_professor = p.id_professor
JOIN grupo AS g ON a.fk_grupo = g.id_grupo;

-- Exibindo os dados do professor que avaliaram determinado grupo, junto com sua data e hora
SELECT 
	p.nome,
    g.nome,
    a.dt_inicio
FROM avaliacao AS a
JOIN professor AS p ON a.fk_professor = p.id_professor
JOIN grupo AS g ON a.fk_grupo = g.id_grupo
WHERE g.nome LIKE '%4';

-- Exibindo os nomes dos grupos que foram avaliados por um determinado professor
SELECT 
	p.nome,
    p.disciplina,
    g.nome,
    g.descricao_projeto,
    a.dt_inicio
FROM avaliacao AS a
JOIN professor AS p ON a.fk_professor = p.id_professor
JOIN grupo AS g ON a.fk_grupo = g.id_grupo
WHERE p.nome LIKE '%4';

-- Exibindo os dados dos grupos, dos alunos, dos professores e a data e hora
SELECT
	p.nome,
    p.disciplina,
	a.ra,
    a.nome,
    a.email,
    g.nome,
    g.descricao_projeto,
     v.dt_inicio
FROM avaliacao AS v
JOIN grupo AS g ON v.fk_grupo = g.id_grupo
JOIN aluno AS a ON a.fk_grupo = g.id_grupo
JOIN professor AS p ON v.fk_professor = p.id_professor;

-- Exibindo a quantidade de notas distintas
SELECT 
	CONCAT('A quantidade de notas distintas são: ', COUNT(DISTINCT nota_professor)) AS 'Quantidade de notas distintas'
FROM avaliacao;

-- Exibindo a identidado do professor, a média das notas e a soma das notas dos grupos, agrupada por professor
SELECT 
	p.nome,
    AVG(a.nota_professor),
    SUM(a.nota_professor)
FROM avaliacao AS a
JOIN professor AS p ON a.fk_professor = p.id_professor
GROUP BY p.nome;

-- Exibindo a identidado do professor, a média das notas e a soma das notas dos grupos, agrupada por grupo
SELECT 
	g.nome,
    AVG(a.nota_professor),
    SUM(a.nota_professor)
FROM avaliacao AS a
JOIN grupo AS g ON a.fk_grupo = g.id_grupo
GROUP BY g.nome;

-- Exibindo a identidado do professor, a maior e menor nota dos grupos, agrupada por professor
SELECT 
	p.nome,
    MIN(a.nota_professor),
    MAX(a.nota_professor)
FROM avaliacao AS a
JOIN professor AS p ON a.fk_professor = p.id_professor
GROUP BY p.nome;

-- Exibindo a identidado do professor, a maior e menor nota dos grupos, agrupada por grupo
SELECT 
	g.nome,
    MIN(a.nota_professor),
    MAX(a.nota_professor)
FROM avaliacao AS a
JOIN grupo AS g ON a.fk_grupo = g.id_grupo
GROUP BY g.nome;