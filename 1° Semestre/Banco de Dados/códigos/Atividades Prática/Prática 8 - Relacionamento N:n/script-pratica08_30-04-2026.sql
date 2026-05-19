-- Criando e utilizando o banco de dados para a atividade
CREATE DATABASE pratica08;
USE pratica08;

-- Criando as tabelas de acordo com a modelagem
CREATE TABLE papel(
	id_papel INT PRIMARY KEY AUTO_INCREMENT,
    nome_papel VARCHAR(100),
    descricao TEXT,
    CONSTRAINT chTipoPapel CHECK(nome_papel IN ('Admin', 'Comum',' Editor'))
);

CREATE TABLE usuario (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email_principal VARCHAR(100),
    data_cadastro DATETIME
);

CREATE TABLE credencial (
	id_credencial INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    username VARCHAR(100),
    senha_hash VARCHAR(100),
    ultimo_login DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE sessao (
	id_sessao INT PRIMARY KEY AUTO_INCREMENT,
	id_usuario INT,  
    inicio_sessao DATETIME,
    expira_em DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Criando a tabela N:N
CREATE TABLE usuario_papel (	
	id_usuario INT,
    id_papel INT,
    atribuido_em DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_papel) REFERENCES papel(id_papel)
);

-- Populando as tabelas usuario e sessao
INSERT INTO usuario (nome, email_principal, data_cadastro) VALUES 
	('Usuário 1', 'usuario1@email.com', '2023-05-02 15:30:04'),
    ('Usuário 2', 'usuario2@email.com', '2026-01-01 00:00:00'),
    ('Usuário 3', 'usuario3@email.com', '2022-12-31 23:59:59'),
    ('Usuário 4', 'usuario4@email.com', '2024-06-15 12:00:00'),
    ('Usuário 5', 'usuario5@email.com', '2025-06-15 12:23:00');
    
INSERT INTO sessao (id_usuario, inicio_sessao, expira_em) VALUES
	(1, '2026-05-02 08:00:00', '2026-05-02 11:00:00'),
    (2, '2026-05-02 10:15:30', '2026-05-02 13:15:30'),
    (3, '2026-05-02 14:45:00', '2026-05-02 17:45:00'),
    (4, '2026-05-02 19:20:10', '2026-05-02 22:20:10'),
    (5, '2026-05-02 23:00:00', '2026-05-03 02:00:00');
    
/*
	Criando consulta:
    
    Com base neste cenário e no DER, escreva uma consulta SQL (compatível com MySQL) que retorne:
		O nome do usuário.
		A quantidade total de sessões registradas para ele.
		O tempo médio de duração de suas sessões (em minutos), arredondado para duas casas decimais.
*/

SELECT 
	u.nome AS 'Nome do Usuário',
    COUNT(s.expira_em) AS  'A quantidade total de sessões registradas pelo usuário',
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, s.inicio_sessao, s.expira_em)), 2)  AS 'Tempo médio de duração das sessões'
FROM usuario AS u
JOIN sessao AS s ON s.id_usuario = u.id_usuario
GROUP BY u.nome;