/*
	Criando e utilizando o banco de dados para esta prática
*/
CREATE DATABASE pratica5;
USE pratica5;

/*
	Exercício 1: Início
*/

-- Criando a tabela 'cliente'
CREATE TABLE cliente (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    telefone_fixo VARCHAR(11),
    telefone_celular VARCHAR(11),
    cidade VARCHAR(45),
    bairro VARCHAR(45),
    rua VARCHAR(45),
    numero_casa INT
);

-- Criando a tabela 'pet'
CREATE TABLE pet (
	id_pet INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    tipo_animal VARCHAR(45),
    raca_animal VARCHAR(45),
    dt_nascimento DATE,
    fk_cliente INT,
    CONSTRAINT ctFkCliente FOREIGN KEY (fk_cliente) REFERENCES cliente(id_cliente)
) AUTO_INCREMENT  = 101;

-- Inserindo dados na tabela 'cliente'
INSERT INTO cliente (nome, telefone_fixo, telefone_celular, cidade, bairro, rua, numero_casa) VALUES
	('Vinicius Faria', '11999999998', '20999999998', 'São Paulo', 'Itaim Paulista', 'Logo ali' , 67),
    ('Clara Faria', '11999999997', '20999999997', 'São Paulo', 'Aqui perto', 'Aqui do lado', 76),
    ('Luiz Phelipe', '11999999996', '20999999996', 'São Paulo', 'Pertinho daqui', 'Mais um pouquinho chega', 98);
    
-- Inserindo dados na tabela 'pet'
INSERT INTO pet (nome, tipo_animal, raca_animal, dt_nascimento, fk_cliente) VALUES
	('Wofl', 'Cachorro', 'Husky', '2010-02-21', 1),
    ('Destruidor de Mundos', 'Hamster', 'Anão Russo', '2024-09-23', 1),
    ('Big Boss', 'Cobra', 'Cascavél', '1999-04-13', 2),
    ('Pig', 'Porco', 'Rosa', '2008-04-03', 3);
    
-- Exibindo todos os dados de cada tabela criada, separadamente
SELECT * FROM cliente;
SELECT * FROM pet;

-- Alterando o tamanho da coluna nome do cliente
ALTER TABLE cliente
MODIFY COLUMN nome VARCHAR(90);

-- Exibindo os dados de todos os pets que são de um determinado tipo (por exemplo: cachorro).
SELECT * FROM pet 
WHERE tipo_animal = 'Hamster';

-- Exibindo apenas os nomes e as datas de nascimento dos pets
SELECT
nome,
dt_nascimento
FROM pet;

-- Exibindo os dados dos pets ordenados em ordem crescente pelo nome.
SELECT * FROM pet
ORDER BY nome;

--  Exibindo os dados dos clientes ordenados em ordem decrescente pelo bairro.
SELECT * FROM cliente
ORDER BY bairro DESC;

-- Exibindo os dados dos pets cujo nome comece com uma determinada letra.
SELECT * FROM pet
WHERE nome LIKE 'D%';

-- Exibindo os dados dos clientes que têm o mesmo sobrenome.
SELECT * FROM cliente
WHERE nome LIKE '%Faria%';
-- Alterando o telefone de um determinado cliente.
UPDATE cliente
SET telefone_fixo = '40028922'
WHERE id_cliente = 1;

-- Exibindo os dados dos clientes para verificar se alterou.
SELECT * FROM cliente;

-- Exibindo os dados dos pets e dos seus respectivos donos.
SELECT 
p.nome AS 'Nome Pet',
p.tipo_animal AS 'Tipo Pet',
p.raca_animal AS 'Raça Pet',
p.dt_nascimento AS 'Data Nascimento Pet',
c.nome AS 'Nome Cliente',
c.telefone_fixo AS 'Telefone Fixo do Cliente',
c.telefone_celular AS 'Telefone Celular do Cliente',
c.cidade AS 'Cidade do Cliente',
c.bairro AS 'Bairro do Cliente',
c.rua AS 'Rua do Cliente',
c.numero_casa AS 'Número da Casa do Cliente'
FROM pet AS p
JOIN cliente AS c ON p.fk_cliente = c.id_cliente;
-- Exibindo os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente.
SELECT 
p.nome AS 'Nome Pet',
p.tipo_animal AS 'Tipo Pet',
p.raca_animal AS 'Raça Pet',
p.dt_nascimento AS 'Data Nascimento Pet',
c.nome AS 'Nome Cliente',
c.telefone_fixo AS 'Telefone Fixo do Cliente',
c.telefone_celular AS 'Telefone Celular do Cliente',
c.cidade AS 'Cidade do Cliente',
c.bairro AS 'Bairro do Cliente',
c.rua AS 'Rua do Cliente',
c.numero_casa AS 'Número da Casa do Cliente'
FROM pet AS p
JOIN cliente AS c ON p.fk_cliente = c.id_cliente
WHERE c.id_cliente = 1;
-- Excluindo algum pet.
DELETE FROM pet
WHERE id_pet = 103;

-- Exibindo os dados dos pets para verificar se excluiu.
SELECT 
p.nome AS 'Nome Pet',
p.tipo_animal AS 'Tipo Pet',
p.raca_animal AS 'Raça Pet',
p.dt_nascimento AS 'Data Nascimento Pet',
c.nome AS 'Nome Cliente',
c.telefone_fixo AS 'Telefone Fixo do Cliente',
c.telefone_celular AS 'Telefone Celular do Cliente',
c.cidade AS 'Cidade do Cliente',
c.bairro AS 'Bairro do Cliente',
c.rua AS 'Rua do Cliente',
c.numero_casa AS 'Número da Casa do Cliente'
FROM pet AS p
JOIN cliente AS c ON p.fk_cliente = c.id_cliente;
-- Excluindo as tabelas.
DROP TABLE pet;
DROP TABLE cliente;

/*
	Exercício 1: Fim
	Exercício 2: Início
*/

-- Criando a tabela 'gasto'
CREATE TABLE gasto (
	idGasto INT PRIMARY KEY AUTO_INCREMENT,
    data DATE,
	valor DECIMAL(9, 2),
    descricao VARCHAR(200)
);

-- Criando a tabela 'pessoa'
CREATE TABLE pessoa (
	idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
	dtNascimento DATE,
	profissao VARCHAR(45),
    fkGasto INT,
    CONSTRAINT ctFkGasto FOREIGN KEY (fkGasto) REFERENCES gasto(idGasto)
);
    
-- Inserindo dados na tabela 'gasto'
INSERT INTO gasto (data, valor, descricao) VALUES
	('2026-03-26', '67.31', 'O pack com três jogos do Resident Evil'),
    ('2026-04-02', '160.00', '20 unidades de Monster para a semana'),
    ('2026-08-23', '2.00', 'A lua, apenas'),
    ('2028-12-25', '9999999.99', 'Comprou a Ameŕia Latina inteira para os brasileiros');

--  Inserindo dados na tabela 'pessoa'
INSERT INTO pessoa (nome, dtNascimento, profissao, fkGasto) VALUES
	('Gustavo Lima', '2008-01-14', 'Estudante', 1),
    ('Luiz Phelipe', '2008-06-12', 'Estudante', 2),
    ('Clara Faria', '2000-04-05', 'Professora', 3),
    ('Jair Bolsonaro', '1955-03-21', 'Presidente', 4);


-- Exibindo os dados de cada tabela individualmente.
SELECT * FROM pessoa;
SELECT * FROM gasto;

-- Exibindo somente os dados de cada tabela, mas filtrando por algum dado da tabela (por exemplo, as pessoas de alguma profissão, etc).
SELECT * FROM pessoa
WHERE profissao = 'Estudante';

SELECT * FROM gasto
WHERE valor > 50;

-- Exibindo os dados das pessoas e dos seus gastos correspondentes.
SELECT 
p.nome AS 'Nom da Pessoa',
g.valor AS 'Valor do Gasto',
g.data  AS 'Data do Gasto',
g.descricao AS 'Descrição do Gasto'
FROM pessoa AS p
JOIN gasto AS g ON p.fkGasto = g.idGasto;

-- Exibindo os dados de uma determinada pessoa e dos seus gastos correspondentes.
SELECT 
p.nome AS 'Nom da Pessoa',
g.valor AS 'Valor do Gasto',
g.data  AS 'Data do Gasto',
g.descricao AS 'Descrição do Gasto'
FROM pessoa AS p
JOIN gasto AS g ON p.fkGasto = g.idGasto
WHERE idPessoa = 2;

-- Atualizndo valores já inseridos na tabela.
UPDATE gasto
SET valor = '62.16'
WHERE idGasto = 1;

UPDATE gasto
SET valor = '34908'
WHERE idGasto = 3;

-- Excluindo um ou mais registros de alguma tabela
DELETE FROM pessoa
WHERE idPessoa = 3;

DELETE FROM gasto
WHERE idGasto = 3;

/*
	Exercício 2: Fim
	Exercício 3: Início
*/

-- Criando um banco de dados chamado PraticaFuncionario.
CREATE DATABASE PraticaFuncionario;

-- Selecionando esse banco de dados.
USE PraticaFuncionario;

-- Criando as tabelas correspondentes à sua modelagem.
CREATE TABLE setor (
	id_setor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    andar INT
);

CREATE TABLE funcionario (
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    telefone VARCHAR(11),
    salario DECIMAL(7 ,2),
    fk_setor INT,
    CONSTRAINT ctFkSetor FOREIGN KEY (fk_setor) REFERENCES setor(id_setor)
);

CREATE TABLE acompanhante (
	id_acompanhante INT AUTO_INCREMENT,
    nome VARCHAR(45),
    tipo_relacao VARCHAR(45),
    dt_nascimento DATE,
    fk_funcionario INT,
    PRIMARY KEY (id_acompanhante, fk_funcionario),
    CONSTRAINT ctFkFuncionario FOREIGN KEY (fk_funcionario) REFERENCES funcionario(id_funcionario)
);
    
-- Inserindo dados nas tabelas, de forma que exista mais de um funcionário em cada setor cadastrado.
INSERT INTO setor (nome, andar) VALUES
	('Desenvolvimento', 7),
    ('Marketing', 2),
    ('TI', 1);
    
INSERT INTO funcionario (nome, telefone, salario, fk_setor) VALUES
	('Gustavo Lima', '1199999999', '10.00', 1),
    ('Luiz Phelipe', '1199999998', '9.99', 1),
    ('Everton Zoio', '1199999997', '2.00', 2),
    ('Kaique', '1199999997', '1.99', 2),
    ('Marcus Professor', '1199999967', '1000', 3);

INSERT INTO acompanhante (nome, tipo_relacao, dt_nascimento, fk_funcionario) VALUES
	('Sabrina Carpenter', 'Acompanhante Master', '1999-05-11', 1),
    ('Gothic Girl', 'Acompanhante Master', '2007-02-14', 2),
    ('Acompanhante', 'Relação Forte', '1999-09-21', 3),
    ('Acompanhante', 'Relação Forte', '1999-09-21', 4),
    ('Acompanhante', 'Relação Forte', '1999-09-21', 5);

-- Exibindo todos os dados de cada tabela criada, separadamente.
SELECT * FROM setor;
SELECT * FROM funcionario;
SELECT * FROM acompanhante;

-- Exibindo os dados dos setores e dos seus respectivos funcionários.
SELECT 
f.nome AS 'Nome do Funcionario', 
f.telefone AS 'Telefone do Funcionario',
f.salario AS 'Salario do Funcionario',
s.nome AS 'Nome do Setor',
s.andar AS 'Andar do Setor'
FROM funcionario AS f
JOIN setor AS s ON s.id_setor = f.fk_setor;

-- Exibindo os dados de um determinado setor (informar o nome do setor na consulta) e dos seus respectivos funcionários.
SELECT 
s.nome AS 'Nome do Setor',
s.andar AS 'Andar do Setor',
f.nome AS 'Nome do Funcionario', 
f.telefone AS 'Telefone do Funcionario',
f.salario AS 'Salario do Funcionario'
FROM setor AS s
JOIN  funcionario AS f ON s.id_setor = f.fk_setor
WHERE andar < 6;

-- Exibindo os dados dos funcionários e de seus acompanhantes.
SELECT 
f.nome AS 'Nome do Funcionario', 
f.telefone AS 'Telefone do Funcionario',
f.salario AS 'Salario do Funcionario',
a.nome AS 'Nome do Acompanhante',
a.tipo_relacao AS 'Tipo de Relação do Acompanhante com o Funcionário', 
a.dt_nascimento AS 'Data de Nascimento do Acompanhante'
FROM funcionario AS f
JOIN acompanhante AS a ON a.fk_funcionario = f.id_funcionario;

-- Exibindo os dados de apenas um funcionário (informar o nome do funcionário) e os dados de seus acompanhantes.
SELECT 
f.nome AS 'Nome do Funcionario', 
a.nome AS 'Nome do Acompanhante',
a.tipo_relacao AS 'Tipo de Relação do Acompanhante com o Funcionário', 
a.dt_nascimento AS 'Data de Nascimento do Acompanhante'
FROM funcionario AS f
JOIN acompanhante AS a ON a.fk_funcionario = f.id_funcionario
WHERE id_funcionario = 1;

-- Exibindo os dados dos funcionários, dos setores em que trabalham e dos seus companhantes.
SELECT 
f.nome AS 'Nome do Funcionario', 
f.telefone AS 'Telefone do Funcionario',
f.salario AS 'Salario do Funcionario',
s.nome AS 'Nome do Setor',
s.andar AS 'Andar do Setor',
a.nome AS 'Nome do Acompanhante',
a.tipo_relacao AS 'Tipo de Relação do Acompanhante com o Funcionário', 
a.dt_nascimento AS 'Data de Nascimento do Acompanhante'
FROM funcionario AS f
JOIN acompanhante AS a ON a.fk_funcionario = f.id_funcionario
JOIN setor AS s ON s.id_setor = f.fk_setor;

/*
	Exercício 3: Fim
	Exercício 4: Início
*/

-- Criando um banco de dados chamado Treinador.
CREATE DATABASE Treinador;

-- Selecionando esse banco de dados.
USE Treinador;

-- Criando as tabelas correspondentes à sua modelagem.
CREATE TABLE treinador (
	id_treinador INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(45),
    telefone VARCHAR(11),
    email VARCHAR(45),
    fk_treinador INT,
    CONSTRAINT ctFkTreinador FOREIGN KEY (fk_treinador) REFERENCES treinador (id_treinador)
) AUTO_INCREMENT = 10;

CREATE TABLE nadador (
	id_nadador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    estado CHAR(2),
    dt_nascimento DATE,
    fk_treinador INT,
    CONSTRAINT chFkTreinador FOREIGN KEY (fk_treinador) REFERENCES treinador (id_treinador)
) AUTO_INCREMENT = 100;

-- Inserindo dados nas tabelas, de forma que exista mais de um nadador para algum treinador, e mais de um treinador sendo orientado por algum treinador mais experiente.
INSERT INTO treinador (nome, telefone, email) VALUES
	('Seu Madruga', '1199999999', 'seumadruga@email.com'),
    ('Rocky Balboa', '1199999998', 'rockybalboa@email.com'),
    ('Davy Jones', '1199999967', 'mago@email.com');
    
UPDATE treinador
SET fk_treinador = 10
WHERE id_treinador IN (11, 12);

INSERT INTO nadador (nome, estado, dt_nascimento, fk_treinador) VALUES 
	('Peixonauta', 'MG', '2004-01-23', 10),
    ('Peixinho Dourado', 'ES',  '2002-09-30', 10),
    ('Mestre Splinter', 'SP', '1999-12-14', 11),
    ('Albert Wesker', 'AM', '1899-04-12', 12);
    
-- Exibindo todos os dados de cada tabela criada, separadamente.
SELECT * FROM treinador;
SELECT * FROM nadador;

-- Exibindo os dados dos treinadores e os dados de seus respectivos nadadores.
SELECT 
t.nome AS 'Nome do Treinador',
t.telefone AS 'Telefone do Treinador',
t.email AS 'Email do Treinador',
n.nome AS 'Nome do Nadador',
n.estado AS 'Estado de Origem do Nadador',
n.dt_nascimento AS 'Data de Nascimento do Nadador'
FROM treinador AS t
JOIN nadador AS n ON n.fk_treinador = t.id_treinador;

-- Exibindo os dados de um determinado treinador (informar o nome do treinador na consulta) e os dados de seus respectivos nadadores.
SELECT 
t.nome AS 'Nome do Treinador',
n.nome AS 'Nome do Nadador',
n.estado AS 'Estado de Origem do Nadador',
n.dt_nascimento AS 'Data de Nascimento do Nadador'
FROM treinador AS t
JOIN nadador AS n ON n.fk_treinador = t.id_treinador
WHERE t.id_treinador = 12;

-- Exibindo os dados dos treinadores e os dados dos respectivos treinadores orientadores.
SELECT 
t.nome AS 'Nome do Treinador',
t.telefone AS 'Telefone do Treinador',
t.email AS 'Email do Treinador',
IFNULL(o.nome, 'Sem Treinador Experiente') AS 'Nome do Treinador Experiente',
IFNULL(o.telefone, 'Sem Treinador Experiente') AS 'Email do Treinador Experiente',
IFNULL(o.email, 'Sem Treinador Experiente') AS 'Telefone do Treinador Experiente'
FROM treinador AS t
LEFT JOIN treinador AS o ON t.fk_treinador = o.id_treinador;

-- Exibindo os dados dos treinadores e os dados dos respectivos treinadores orientadores, porém somente de um determinado treinador orientador (informar o nome do treinador na consulta).
SELECT 
t.nome AS 'Nome do Treinador',
t.telefone AS 'Telefone do Treinador',
t.email AS 'Email do Treinador',
IFNULL(o.nome, 'Sem Treinador Experiente') AS 'Nome do Treinador Experiente',
IFNULL(o.telefone, 'Sem Treinador Experiente') AS 'Email do Treinador Experiente',
IFNULL(o.email, 'Sem Treinador Experiente') AS 'Telefone do Treinador Experiente'
FROM treinador AS t
LEFT JOIN treinador AS o ON t.fk_treinador = o.id_treinador
WHERE o.nome = 'Seu Madruga';

-- Exibindo os dados dos treinadores, os dados dos respectivos nadadores e os dados dos respectivos treinadores orientadores.
SELECT 
t.nome AS 'Nome do Treinador',
t.telefone AS 'Telefone do Treinador',
t.email AS 'Email do Treinador',
n.nome AS 'Nome do Nadador',
n.estado AS 'Estado de Origem do Nadador',
n.dt_nascimento AS 'Data de Nascimento do Nadador',
IFNULL(o.nome, 'Sem Treinador Experiente') AS 'Nome do Treinador Experiente',
IFNULL(o.telefone, 'Sem Treinador Experiente') AS 'Email do Treinador Experiente',
IFNULL(o.email, 'Sem Treinador Experiente') AS 'Telefone do Treinador Experiente'
FROM treinador AS t
LEFT JOIN treinador AS o ON t.fk_treinador = o.id_treinador 
JOIN nadador AS n ON n.fk_treinador = t.id_treinador;

-- Exibindo os dados de um treinador (informar o seu nome na consulta), os dados dos respectivos nadadores e os dados do seu treinador orientador.
SELECT 
t.nome AS 'Nome do Treinador',
t.telefone AS 'Telefone do Treinador',
t.email AS 'Email do Treinador',
n.nome AS 'Nome do Nadador',
n.estado AS 'Estado de Origem do Nadador',
n.dt_nascimento AS 'Data de Nascimento do Nadador',
IFNULL(o.nome, 'Sem Treinador Experiente') AS 'Nome do Treinador Experiente',
IFNULL(o.telefone, 'Sem Treinador Experiente') AS 'Email do Treinador Experiente',
IFNULL(o.email, 'Sem Treinador Experiente') AS 'Telefone do Treinador Experiente'
FROM treinador AS t
LEFT JOIN treinador AS o ON t.fk_treinador = o.id_treinador 
JOIN nadador AS n ON n.fk_treinador = t.id_treinador
WHERE t.nome   = 'Davy Jones';