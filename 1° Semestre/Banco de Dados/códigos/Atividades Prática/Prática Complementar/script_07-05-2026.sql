/*
	Criando o banco de dados e utilizando-o
*/

CREATE DATABASE pratica_complementar;
USE pratica_complementar;

-- Criando a tabela professor
CREATE TABLE professor (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nomeProfessor VARCHAR(45),
    especialidade VARCHAR(45)
);

-- Criando a tabela disciplina
CREATE TABLE disciplina (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nomeDisciplina VARCHAR(45),
    cargaHoraria INT, 
    fkProfessor INT,
    FOREIGN KEY (fkProfessor) REFERENCES professor(id)
);

-- Criando a tabela curso
CREATE TABLE curso (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nomeCurso VARCHAR(45),
    coordenador VARCHAR(45)
);

-- Criando a tabela aluno
CREATE TABLE aluno (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(45),
    fkCurso INT,
    FOREIGN KEY (fkCurso) REFERENCES curso(id)
);

-- Criando a tabela projeto
CREATE TABLE projeto (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nomeProjeto VARCHAR(45),
    descricao VARCHAR(200)
);

-- Criando a tabela alunoProjeto (N:N)
CREATE TABLE alunoProjeto (
	fkAluno INT,
    fkProjeto INT,
    dataEntrada DATE,
    CONSTRAINT ctPkComposta PRIMARY KEY (fkAluno, fkProjeto),
    FOREIGN KEY (fkAluno) REFERENCES aluno(id),
    FOREIGN KEY (fkProjeto) REFERENCES projeto(id)
);

-- Criando a tabela alunoDisciplina (N:N)
CREATE TABLE alunoDisciplina (
	fkDisciplina INT,
    fkAluno INT,
    semetre VARCHAR(45)
);

-- Inserindo dados nas tabelas

-- Inserindo dados na tabela professor
INSERT INTO professor (nomeProfessor, especialidade) VALUES
	('Professor 1', 'Especialidade 1'),
    ('Professor 2', 'Especialidade 2'),
    ('Professor 3', 'Especialidade 3'),
    ('Professor 4', 'Especialidade 4'),
    ('Professor 5', 'Especialidade 5');
    
-- Inserindo dados na tabela disciplina
	INSERT INTO disciplina (nomeDisciplina, cargaHoraria, fkProfessor) VALUES
		('Disciplina 1', 2700, 1),
		('Disciplina 2', 2700, 1),
		('Disciplina 2', 2700, 2),
		('Disciplina 3', 2700, 3),
		('Disciplina 3', 2700, 2),
		('Disciplina 4', 2700, 4),
		('Disciplina 1', 2700, 4),
		('Disciplina 5', 2700, 5),
		('Disciplina 2', 2700, 5),
		('Disciplina 3', 2700, 5);
    
-- Inserindo dados na tabela curso
INSERT INTO curso (nomeCurso, coordenador) VALUES
	('CCO', 'Coordenador 1'),
    ('SIS', 'Coordenador 2'),
    ('ADS', 'Coordenador 3');
    
-- Inserindo dados na tabela aluno
INSERT INTO aluno (nome, email, fkCurso) VALUES
	('Aluno 1', 'aluno1@email.com', 1),
    ('Aluno 2', 'aluno2@email.com', 1),
    ('Aluno 3', 'aluno3@email.com', 1),
    ('Aluno 4', 'aluno4@email.com', 1),
    ('Aluno 5', 'aluno5@email.com', 1),
    ('Aluno 6', 'aluno6@email.com', 2),
    ('Aluno 7', 'aluno7@email.com', 2),
    ('Aluno 8', 'aluno8@email.com', 2),
    ('Aluno 9', 'aluno9@email.com', 2),
    ('Aluno 10', 'aluno10@email.com', 2),
    ('Aluno 11', 'aluno11@email.com', 3),
    ('Aluno 12', 'aluno12@email.com', 3),
    ('Aluno 13', 'aluno13@email.com', 3),
    ('Aluno 14', 'aluno14@email.com', 3),
    ('Aluno 15', 'aluno15@email.com', 3);
    
-- Inserindo dados na tabela projeto 
INSERT INTO projeto (nomeProjeto, descricao) VALUES
	('Projeto 1', 'Descrição 1'),
    ('Projeto 2', 'Descrição 2'),
    ('Projeto 3', 'Descrição 3'),
    ('Projeto 4', 'Descrição 4'),
    ('Projeto 5', 'Descrição 5');
    
-- Inserindo dados na tabela alunoProjeto (N:N)
INSERT INTO alunoProjeto (fkAluno, fkProjeto, dataEntrada) VALUES
    (1, 1, '2026-03-12'),
    (2, 1, '2026-03-12'),
    (7, 1, '2026-03-12'),
    (3, 2, '2026-05-12'),
    (8, 2, '2026-05-12'),
    (10, 2, '2026-05-12'),
    (5, 3, '2026-12-24'),
    (9, 3, '2026-12-24'),
    (11, 3, '2026-12-24'),
    (4, 4, '2026-03-08'),
    (13, 4, '2026-03-08'),
    (14, 4, '2026-03-08'),
    (6, 5, '2026-04-15'),
    (12, 5, '2026-04-15'),
    (15, 5, '2026-04-15');
    
-- Inserindo dados na tabela alunoDisciplina(N:N)
INSERT INTO alunoDisciplina (fkDisciplina, fkAluno, semetre) VALUES
    (1, 1, 1),
    (2, 1, 1),
    (1, 2, 1), 
    (3, 2, 2),
    (2, 3, 1), 
    (4, 3, 1),
    (1, 4, 2), 
    (5, 4, 1),
    (2, 5, 1),
    (6, 5, 2),
    (3, 6, 1), 
    (7, 6, 1),
    (4, 7, 2), 
    (8, 7, 1),
    (5, 8, 1),
    (9, 8, 2),
    (6, 9, 1), 
    (10, 9, 1),
    (7, 10, 2), 
    (1, 10, 1),
    (8, 11, 1),
    (2, 11, 1), 
    (4, 11, 2),
    (9, 12, 1), 
    (3, 12, 1),
    (10, 13, 2), 
    (5, 13, 1),
    (1, 14, 1),
    (6, 14, 1),
    (2, 15, 2), 
    (7, 15, 1);
    
/*
	Inicio dos exercícios!
*/

-- Exiba o nome dos alunos e o nome do curso ao qual pertencem
SELECT 
	a.nome AS nome_aluno,
    c.nomeCurso AS nome_curso
FROM aluno AS a
JOIN curso AS c ON a.fkCurso = c.id;

/*
    Exiba:
        nome do aluno
        nome do projeto
        data de entrada no projeto
*/
SELECT 
	a.nome AS nome_aluno,
    p.nomeProjeto AS nome_projeto,
	ap.dataEntrada AS data_entrega
FROM alunoProjeto AS ap
JOIN aluno AS a ON ap.fkAluno = a.id
JOIN projeto AS p ON ap.fkProjeto = p.id;

/*
    Exiba:
        nome do aluno
        nome da disciplina
        semestre cursado
*/

SELECT
	a.nome AS nome_aluno,
    d.nomeDisciplina AS nome_disciplina,
    ad.semetre AS semestre_cursado
FROM alunoDisciplina AS ad
JOIN aluno AS a ON ad.fkAluno = a.id
JOIN disciplina AS d ON ad.fkDisciplina = d.id;

-- Exiba os alunos que pertencem ao curso: "ADS"
SELECT 
	nome AS nome_aluno
FROM aluno
WHERE fkCurso IN (
	SELECT 
		id
	FROM curso
    WHERE nomeCurso = 'ADS'
);

-- Exiba os projetos que possuem alunos cadastrados
SELECT 
	p.nomeProjeto AS nome_projeto,
    p.descricao AS descricao_projeto
FROM alunoProjeto AS ap
JOIN projeto AS p ON ap.fkProjeto = p.id;

--     Exiba os alunos que participam do projeto: "Flow"
SELECT 
	a.nome AS nome_aluno,
    a.email AS email_aluno
FROM alunoProjeto AS ap
JOIN aluno AS a ON ap.fkAluno = a.id
JOIN projeto AS p ON ap.fkProjeto = p.id
WHERE p.nomeProjeto = 'Flow';

/*
    Exiba:
        nome do professor
        nome da disciplina ministrada
*/

SELECT
	p.nomeProfessor AS nome_professor,
    d.nomeDisciplina AS disciplina_ministrada
FROM disciplina AS d
JOIN professor AS p ON d.fkProfessor = p.id;

-- Exiba os alunos que NÃO participam de projetos
SELECT 
	a.nome AS nome_aluno,
    a.email AS email_aluno
FROM alunoProjeto AS ap
JOIN aluno AS a ON ap.fkAluno = a.id
JOIN projeto AS p ON ap.fkProjeto = p.id
WHERE ap.fkAluno <> a.id;

-- Exiba os projetos sem alunos cadastrados
SELECT 
	p.nomeProjeto AS nome_projeto,
    p.descricao AS descricao_projeto
FROM alunoProjeto AS ap
JOIN aluno AS a ON ap.fkAluno = a.id
JOIN projeto AS p ON ap.fkProjeto = p.id
WHERE ap.fkAluno <> a.id;

/*
	Crie uma VIEW chamada: vwAlunoCurso 
	A VIEW deve exibir:

			nome do aluno
			nome do curso
	*/
CREATE VIEW vwAlunoCurso AS 
	SELECT 
		a.nome AS nome_aluno,
        c.nomeCurso AS nome_curso
	FROM aluno AS a
    JOIN curso AS c ON a.fkCurso = c.id;
    
-- Consulte todos os dados da VIEW: vwAlunoCurso
SELECT * FROM  vwAlunoCurso;

/*
    Crie uma VIEW chamada: vwAlunoProjeto
	A VIEW deve exibir:

			nome do aluno
			nome do projeto
			dataEntrada
*/

CREATE VIEW vwAlunoProjeto AS
	SELECT 
		a.nome AS nome_aluno,
        p.nomeProjeto AS nome_projeto,
        ap.dataEntrada AS data_entrada_projeto
	FROM alunoProjeto AS ap
	JOIN aluno AS a ON ap.fkAluno = a.id
	JOIN projeto AS p ON ap.fkProjeto = p.id;
    
-- Consulte apenas os alunos que entraram em projetos após: '2026-01-01
SELECT 
	a.nome AS nome_aluno,
	a.email AS email_aluno
FROM alunoProjeto AS ap
JOIN aluno AS a ON ap.fkAluno = a.id
WHERE ap.dataEntrada > '2026-01-01';    

-- Exiba os alunos que cursam mais de uma disciplina
SELECT 
    a.nome AS nome_aluno,
    a.email AS email_aluno,
    COUNT(ac.fkDisciplina) AS total_disciplinas
FROM aluno AS a
JOIN alunoDisciplina AS ac ON a.id = ac.fkAluno
GROUP BY a.nome, a.email
HAVING COUNT(ac.fkDisciplina) > 1;
    
-- Exiba as disciplinas que possuem mais de 3 alunos
SELECT 
	d.nomeDisciplina AS nome_disciplina,
    d.cargaHoraria AS carga_horaria_disciplina,
    COUNT(ad.fkAluno) AS total_aluno
FROM alunoDisciplina AS ad
JOIN disciplina AS d ON ad.fkDisciplina = d.id
GROUP BY d.nomeDisciplina, d.cargaHoraria
HAVING COUNT(ad.fkAluno) > 3;
-- Exiba o professor responsável pela disciplina com maior carga horária
SELECT 
	p.nomeProfessor AS nome_professor,
    p.especialidade AS especialidade_professor
FROM professor AS p
JOIN disciplina AS d ON d.fkProfessor = p.id
WHERE cargaHoraria IN (
	SELECT
		MAX(cargaHoraria)
	FROM disciplina
);

-- Exiba os alunos que participam de mais projetos que a média de participação dos alunos
SELECT
	a.nome AS nome_aluno,
    a.email AS email_aluno,
    COUNT(ap.fkProjeto) AS total_participacao_projeto
FROM alunoProjeto AS ap
JOIN aluno AS a ON ap.fkAluno = a.id
GROUP BY a.nome, a.email
HAVING COUNT(ap.fkProjeto) > (
    SELECT 
		AVG(contagem) 
    FROM (
        SELECT 
			COUNT(fkProjeto) AS contagem
        FROM alunoProjeto
        GROUP BY fkAluno
    ) AS consulta_contagem
);

-- Exiba o projeto com maior quantidade de alunos
SELECT
	p.nomeProjeto AS nome_projeto,
    p.descricao AS descricao_projeto,
    COUNT(ap.fkAluno) AS quantidade_aluno
FROM alunoProjeto AS ap
JOIN projeto AS p ON ap.fkProjeto = p.id
GROUP BY p.nomeProjeto, p.descricao;

-- Exiba os cursos que possuem alunos cadastrados
SELECT
	c.nomeCurso AS nome_curso,
    c.coordenador AS coordenandor_curso
FROM curso AS c
JOIN aluno AS a ON a.fkCurso = c.id;

/*
    Exiba os alunos que participam simultaneamente:
        de projetos
        e de disciplinas
*/

SELECT 	
	a.nome AS nome_aluno,
    a.email AS email_aluno
FROM aluno AS a
JOIN alunoDisciplina AS ad ON ad.fkAluno = a.id
JOIN alunoProjeto AS ap ON ap.fkAluno = a.id;

-- Exiba os alunos que NÃO cursam disciplinas
SELECT 
	a.nome AS nome_aluno,
    a.email AS email_aluno
FROM alunoDisciplina AS ad
JOIN aluno AS a ON ad.fkAluno = a.id
WHERE ad.fkAluno <> a.id;
-- Exiba as disciplinas que nunca foram cursadas
SELECT
	d.nomeDisciplina AS nome_disciplina,
    d.cargaHoraria AS carga_horaria_disciplina
FROM alunoDisciplina AS ad
JOIN disciplina AS d ON ad.fkDisciplina = d.id
WHERE ad.fkDisciplina <> d.id;

-- Exiba os alunos que possuem o maior número de disciplinas cursadas
SELECT
	a.nome AS nome_aluno,
    a.email AS email_aluno,
    COUNT(ad.fkDisciplina) AS quantidade_disciplinas
FROM alunoDisciplina AS ad
JOIN aluno AS a ON ad.fkALuno = a.id
GROUP BY a.nome, a.email
HAVING COUNT(ad.fkDisciplina) IN (
	SELECT
		MAX(contagem)
	FROM (
		SELECT
			COUNT(fkDisciplina) AS contagem
		FROM alunoDisciplina
		GROUP BY fkAluno
    ) AS contagem_disciplinas
);

-- Exiba os cursos cuja quantidade de alunos está acima da média dos cursos
SELECT
    c.nomeCurso AS nome_curso,
    c.coordenador AS coordenador_curso,
    COUNT(a.fkCurso) AS quantidade_alunos
FROM curso AS c
JOIN aluno AS a ON a.fkCurso = c.id
GROUP BY c.nomeCurso, c.coordenador
HAVING COUNT(a.fkCurso) > (
    SELECT 
        AVG(contagem)
    FROM (
        SELECT
            COUNT(fkCurso) AS contagem
        FROM aluno
        GROUP BY fkCurso
    ) AS subquery_media
);

/*
    Crie uma VIEW chamada:  vwAlunoCursoProjetoDisciplina
         A VIEW deve exibir:
			nome do aluno
			curso
			quantidade de projetos
			quantidade de disciplinas cursadas
*/

CREATE VIEW vwAlunoCursoProjetoDisciplina AS
	SELECT 
		a.nome AS nome_aluno,
        c.nomeCurso AS nome_curso,
        SUM(ap.fkProjeto) AS quantidade_projetos,
        SUM(ad.fkDisciplina) AS quantidade_disciplinas
	FROM aluno AS a
    JOIN curso AS c ON a.fkCurso = c.id
    JOIN alunoProjeto AS ap ON ap.fkAluno = a.id
    JOIN alunoDisciplina AS ad ON ad.fkAluno = a.id
    GROUP BY a.nome, c.nomeCurso;
    
SELECT * 
FROM vwAlunoCursoProjetoDisciplina;