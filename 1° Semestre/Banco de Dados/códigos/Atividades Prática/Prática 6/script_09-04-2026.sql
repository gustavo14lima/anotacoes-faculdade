/*
	Exercício 1: Início
*/ 

/*
	Criando e utilizando o banco de dados 'AlunoProjeto' para o exercício 1
*/
CREATE DATABASE AlunoProjeto;
USE AlunoProjeto;

-- Criando as tabelas equivalentes à modelagem
CREATE TABLE projetos (
	id_projeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao VARCHAR(200)
);

CREATE TABLE aluno (
	ra CHAR(8) PRIMARY KEY,
    nome VARCHAR(45),
    telefone VARCHAR(11),
    fk_projeto INT,
    aluno_representante CHAR(8),
    CONSTRAINT ctFkProjeto FOREIGN KEY (fk_projeto) REFERENCES projetos(id_projeto),
    CONSTRAINT ctAlunoRepresentante FOREIGN KEY (aluno_representante) REFERENCES aluno(ra)
);

CREATE TABLE acompanhante (	
	id_acompanhente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    tipo_relacao VARCHAR(45),
    fk_aluno CHAR(8),
    CONSTRAINT ctFkAluno FOREIGN KEY (fk_aluno) REFERENCES aluno(ra)
);

-- Inserindo dados nas tabelas
	INSERT INTO projetos (nome, descricao) VALUES
		('projeto 1', 'air fry 2'),
        ('projeto 2', 'abaixar o indice do aquecimento global'),
        ('projeto 3', 'coca-cola 2');
        
	INSERT INTO aluno (ra, nome, telefone, fk_projeto, aluno_representante) VALUES
		('12345678', 'aluno 1', '11999999999', 1, Null),
        ('87654321', 'aluno 2', '11999999998', 3, Null),
        ('18273645', 'aluno 3', '11999999997', 2, '87654321'),
        ('81726354', 'aluno 4', '11999999996', 1, '12345678'),
        ('12387645', 'aluno 5', '11999999995', 3, '87654321');
        
	INSERT INTO acompanhante (nome, tipo_relacao, fk_aluno) VALUES
		('acompanhante 1', 'melhor amigo', '12345678'),
        ('acompanhante 2', 'pai', '87654321'),
        ('acompanhante 3', 'mãe', '18273645'),
        ('acompanhante 4', 'tio', '81726354'),
        ('acompanhante 5', 'vô', '12387645');
        
-- Exibindo todos os dados de cada tabela criada, separadamente.
SELECT * FROM projetos;
SELECT * FROM aluno;
SELECT * FROM acompanhante;

-- Exibir os dados dos alunos e dos projetos correspondentes.
SELECT 
aluno.ra,
aluno.nome,
projetos.nome,
projetos.descricao
FROM projetos
JOIN aluno ON id_projeto = fk_projeto;

-- Exibir os dados dos alunos e dos seus acompanhantes.
SELECT 
aluno.ra,
aluno.nome,
acompanhante.nome,
acompanhante.tipo_relacao
FROM aluno
JOIN acompanhante ON fk_aluno = ra;


-- Exibir os dados dos alunos e dos seus representantes.
SELECT 
aluno.ra,
aluno.nome,
representante.ra,
representante.nome
FROM aluno AS aluno
JOIN aluno AS representante ON representante.ra = aluno.aluno_representante;

-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente de um determinado projeto (indicar o nome do projeto na consulta).
SELECT 
aluno.ra,
aluno.nome,
projetos.nome,
projetos.descricao
FROM projetos
JOIN aluno ON id_projeto = fk_projeto
WHERE projetos.nome LIKE 'projeto 1';

-- Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes.
SELECT 
aluno.ra,
aluno.nome,
projetos.nome,
projetos.descricao,
acompanhante.nome,
acompanhante.tipo_relacao
FROM projetos
JOIN aluno ON id_projeto = fk_projeto
JOIN acompanhante ON fk_aluno = ra;

/*
	Exercício 1: Fim
	Exercício 2: Início
*/

/*
	Criando e utilizando o banco de dados 'Campanha' para o exercício 2
*/
CREATE DATABASE Campanha;
USE Campanha;

-- Criar as tabelas correspondentes à sua modelagem.
CREATE TABLE organizador (
	id_organizador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    bairro VARCHAR(45), 
    rua VARCHAR(45),
    email VARCHAR(45),
    fk_organizador INT,
    CONSTRAINT ctFkOrganizador FOREIGN KEY (fk_organizador) REFERENCES organizador(id_organizador)
) AUTO_INCREMENT = 30;

CREATE TABLE campanha (
	id_campanha INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(45),
    dt_final DATE,
    fk_organizador INT,
    CONSTRAINT chFkOrganizador FOREIGN KEY (fk_organizador) REFERENCES organizador(id_organizador)
) AUTO_INCREMENT = 500;

CREATE TABLE instituicao (
	id_instituicao INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
    descricao VARCHAR(200),
    fk_campanha INT,
    CONSTRAINT ctFkCampanha FOREIGN KEY (fk_campanha) REFERENCES campanha(id_campanha)
);

-- Inserir dados nas tabelas, de forma que exista mais de uma campanha para algum organizador, e mais de um organizador novato sendo orientado por algum organizador mais experiente.
INSERT INTO organizador (nome, bairro, rua, email, fk_organizador) VALUES
	('Clara Faria', 'Logo Ali', 'Pertinho', 'clara@email.com', NULL),
	('Vinicius Faria', 'Pertinho Daqui', 'Virando a esquina', 'vinicius@email.com', 30),
	('Gustavo Lima', '5 minutos daqui', 'Rua daqui de casa', 'gustavo@email.com', 30),
	('Luiz Phelipe', 'Itaim Paulista', 'Perto da escola', 'luiz@email.com', 31);
    
INSERT INTO campanha (categoria, dt_final, fk_organizador) VALUES
	('Educação', '2026-06-30', 30),
	('Saúde', '2026-07-15', 31);
    
INSERT INTO instituicao (nome, descricao, fk_campanha) VALUES
	('Livros Comunitáros', 'Compartilhamento de Livros para pessoas carentes', 500),
	('Palestras', 'Palestras sobre conhecimento gerais para todos', 500),
	('Campanhas de vacinação', 'Vacinas nas escolas', 501),
	('Kit Higiena Mestrual', 'Kit com absorventes e relacionados para mulheres carentes', 501);

-- Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM organizador;
SELECT * FROM campanha;
SELECT * FROM instituicao;

-- Exibir os dados dos organizadores e os dados de suas respectivas campanhas.
SELECT 
o.nome AS 'Nome do Organizador',
o.bairro AS 'Bairro do Organizador', 
o.rua AS 'Rua do Organizador', 
o.email AS 'Email do Organizador',
c.categoria AS 'Categoria da Campanha', 
c.dt_final AS 'Data Final da Campanha',
i.nome AS 'Nome da Instituição', 
i.descricao AS 'Descrição da Instituição'
FROM organizador AS o
LEFT JOIN campanha AS c ON o.id_organizador = c.fk_organizador
LEFT JOIN instituicao AS i ON c.id_campanha = i.fk_campanha;

-- Exibir os dados de um determinado organizador (informar o nome do organizador na consulta) e os dados de suas respectivas campanhas.
SELECT 
o.nome AS 'Nome do Organizador',
c.categoria AS 'Categoria da Campanha', 
c.dt_final AS 'Data Final da Campanha',
i.nome AS 'Nome da Instituição', 
i.descricao AS 'Descrição da Instituição'
FROM organizador AS o
JOIN campanha AS c ON o.id_organizador = c.fk_organizador
JOIN instituicao AS i ON c.id_campanha = i.fk_campanha;

-- Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores.
SELECT 
o.nome AS 'Nome do Organizador',
o.bairro AS 'Bairro do Organizador', 
o.rua AS 'Rua do Organizador', 
o.email AS 'Email do Organizador',
e.nome AS 'Nome do Organizador',
e.bairro AS 'Bairro do Organizador', 
e.rua AS 'Rua do Organizador', 
e.email AS 'Email do Organizador'
FROM organizador AS o
JOIN organizador AS e ON o.fk_organizador = e.id_organizador;

-- Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores, porém somente de um determinado organizador orientador (informar o nome do organizador orientador na consulta).
SELECT 
o.nome AS 'Nome do Organizador',
o.bairro AS 'Bairro do Organizador', 
o.rua AS 'Rua do Organizador', 
o.email AS 'Email do Organizador',
e.nome AS 'Nome do Organizador'
FROM organizador AS o
JOIN organizador AS e ON o.fk_organizador = e.id_organizador
WHERE e.nome = 'Clara Faria';

-- Exibir os dados dos organizadores novatos, os dados das respectivas campanhas organizadas e os dados dos respectivos organizadores orientadores.
SELECT 
o.nome AS 'Nome do Organizador',
o.bairro AS 'Bairro do Organizador', 
o.rua AS 'Rua do Organizador', 
o.email AS 'Email do Organizador',
c.categoria AS 'Categoria da Campanha', 
c.dt_final AS 'Data Final da Campanha',
i.nome AS 'Nome da Instituição', 
i.descricao AS 'Descrição da Instituição',
e.nome AS 'Nome do Organizador',
e.bairro AS 'Bairro do Organizador', 
e.rua AS 'Rua do Organizador', 
e.email AS 'Email do Organizador'
FROM organizador AS o
LEFT JOIN campanha AS c ON o.id_organizador = c.fk_organizador
LEFT JOIN instituicao AS i ON c.id_campanha = i.fk_campanha
JOIN organizador AS e ON o.fk_organizador = e.id_organizador;

-- Exibir os dados de um organizador novato (informar o seu nome na consulta), os dados das respectivas campanhas em que trabalha e os dados do seu organizador orientador.
SELECT 
o.nome AS 'Nome do Organizador',
o.bairro AS 'Bairro do Organizador', 
o.rua AS 'Rua do Organizador', 
o.email AS 'Email do Organizador',
c.categoria AS 'Categoria da Campanha', 
c.dt_final AS 'Data Final da Campanha',
i.nome AS 'Nome da Instituição', 
i.descricao AS 'Descrição da Instituição',
e.nome AS 'Nome do Organizador',
e.bairro AS 'Bairro do Organizador', 
e.rua AS 'Rua do Organizador', 
e.email AS 'Email do Organizador'
FROM organizador AS o
LEFT JOIN campanha AS c ON o.id_organizador = c.fk_organizador
LEFT JOIN instituicao AS i ON c.id_campanha = i.fk_campanha
JOIN organizador AS e ON o.fk_organizador = e.id_organizador
WHERE o.nome = 'Gustavo Lima';