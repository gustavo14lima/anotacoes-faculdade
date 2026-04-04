/*
	Criando e utilizando o banco de dados para a atividade
*/

CREATE DATABASE AlunoProjeto;
USE AlunoProjeto;
	
/*
	Exercício 1: Início
*/

-- Criar as tabelas equivalentes à modelagem.
CREATE TABLE projetos (
	id_projeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao VARCHAR(200)
);

CREATE TABLE aluno (
	ra CHAR(8) PRIMARY KEY,
    nome VARCHAR(45),
    telefone VARCHAR(11),
    fk_representante CHAR(8) ,
    fk_projeto INT,
    CONSTRAINT ctFkRepresentante FOREIGN KEY (fk_representante) REFERENCES aluno(ra),
    CONSTRAINT ctFkProjeto FOREIGN KEY (fk_projeto) REFERENCES projetos(id_projeto)
);

-- Inserir dados nas tabelas.
INSERT INTO projetos (nome, descricao) VALUES
	('TIL_ICE', 'Um "monitoramento" de temperatura e umidade em containers de transporte de tilápia'),
    ('Danone', 'Monitorar temperatura de danone'),
    ('Estufa', 'Monitoramento de luminosidade em plantas');
    
INSERT INTO aluno (ra, nome, telefone, fk_projeto) VALUES
	('11111111', 'Anderson', '11999999999',1),
    ('11111112', 'Gus', '11999999998',1),
    ('11111113', 'Kauê', '11999999997',3),
    ('11111114', 'Gustavo Lima', '11999999996', 1),
    ('11111115', 'Maria', '11999999995', 3),
    ('11111116', 'João Pedro', '11999999994',2);

UPDATE aluno
SET fk_representante = 11111111
WHERE ra IN ('11111112', '11111114');

UPDATE aluno
SET fk_representante = 11111113
WHERE ra = '11111115';

-- Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM projetos;
SELECT * FROM aluno;

-- Exibir os dados dos alunos e dos projetos correspondentes.
SELECT 
a.ra AS 'RA do Aluno',
a.nome AS 'Nome do Aluno',
a.telefone AS 'Telefone do Aluno',
p.nome AS 'Nome do Projeto',
p.descricao AS 'Descrição do Projeto'
FROM aluno AS a
JOIN projetos AS p ON a.fk_projeto = p.id_projeto;

-- Exibir os dados dos alunos e dos seus representantes.
SELECT 
a.ra AS 'RA do Aluno',
a.nome AS 'Nome do Aluno',
a.telefone AS 'Telefone do Aluno',
IFNULL(r.ra, 'Sem Representante') AS 'RA do Aluno Representante',
IFNULL(r.nome, 'Sem Representante') AS 'Nome do Aluno Representante',
IFNULL(r.telefone, 'Sem Representante') AS 'Telefone do Aluno Representante'
FROM aluno AS a
LEFT JOIN aluno AS r ON a.fk_representante = r.ra;

-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente de um determinado projeto (indicar o nome do projeto na consulta).
SELECT 
a.ra AS 'RA do Aluno',
a.nome AS 'Nome do Aluno',
a.telefone AS 'Telefone do Aluno',
p.nome AS 'Nome do Projeto',
p.descricao AS 'Descrição do Projeto'
FROM aluno AS a
JOIN projetos AS p ON a.fk_projeto = p.id_projeto
WHERE p.nome = 'TIL_ICE';

/*
	Exercício 1: Fim
	Exercício 2: Início
*/

-- Criar um banco de dados chamado Campanha.
CREATE DATABASE Campanha;

-- Selecionar esse banco de dados.
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
