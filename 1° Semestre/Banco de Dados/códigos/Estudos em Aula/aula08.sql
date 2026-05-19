-- HAVING = restrição para grupos
-- WHERE = restrição para linhas 
-- GROUP BY = cria grupos de acordo com algum parametro

CREATE  DATABASE ccoasp02;
USE ccoasp02;

CREATE TABLE cliente (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11)
);

CREATE TABLE pedido (
	id INT PRIMARY KEY AUTO_INCREMENT,
    dt_pedido DATETIME,
    valor DECIMAL(7, 2),
    fk_cliente INT,
    CONSTRAINT ctFkCliente FOREIGN KEY (fk_cliente) REFERENCES cliente(id)
);

INSERT INTO cliente (nome, cpf) VALUES
	('Clara', '11111111111'),
    ('Matheus', '11111111112'),
	('Luiz Phelipe', '11111111113');
    
INSERT INTO pedido (dt_pedido, valor, fk_cliente) VALUES
	(NOW(), 2500.00, 1),
    (NOW(), 3100.00, 1),
    ('2026-04-22 10:00:00', 9800.00, 1),
    (NOW(), 1250.00, 3);
    
-- SUM() = funcção que soma todos os elementos, especificado no parametro
SELECT SUM(valor) AS 'Receita Total' FROM pedido;

-- AVG() = função que realiza a medida de elementos, de acordo com o parametro
SELECT AVG(valor) AS 'Ticket Medio' FROM pedido;

-- ROUND() = função para arredondar a saída. Coloca o valor e depois a quantidade de casas decimais
-- é similar ao toFIxed do JavaScript, você especifica a quantidade de casas decimais
SELECT ROUND(AVG(valor), 2) AS 'TIcket Médio' FROM pedido;

-- TRUNCATE() = função que elimina as casas decimas, após o valor especificado.
-- Eu especifico o valor, e quantidade de casas decimais que eu quero, as restantes, ele tira
SELECT TRUNCATE(SUM(valor), 1) AS 'Receita Total Formatada' FROM pedido;

-- MAX() = função que traz o maior valor do elemento especificado
SELECT MAX(valor) FROM pedido;

-- MIN() = função que traz o menor valor do elemento especifico
SELECT MIN(valor) FROM pedido;

-- COUNT() = função que conta a quantidade de elementos especificado
SELECT COUNT(*) FROM pedido;

SELECT 
c.nome AS 'Nome do Cliente',
SUM(p.valor) AS 'Total Gasto'
FROM cliente c
JOIN pedido p ON p.fk_cliente = c.id
-- estou agrupando a função soma a patir do nome do cliente
GROUP BY c.nome;

SELECT 
c.nome AS 'Maiores Compradores',
SUM(p.valor) AS 'Total Gasto'
FROM cliente c
JOIN pedido p ON p.fk_cliente = c.id
-- WHERE = considera linha a linha
WHERE p.valor > 3000
GROUP BY c.nome;

SELECT 
c.nome AS 'Maiores Compradores',
SUM(p.valor) AS 'Total Gasto'
FROM cliente c
JOIN pedido p ON p.fk_cliente = c.id
GROUP BY c.nome
-- HAVING = considera o bloco como um total. Utilizado mais para funções agregadas
HAVING SUM(p.valor) > 3000;

-- Order de uma query de um SELECT
/*
	SELECT ...
    FROM ...
    JOIN .... ON ....
    WHERE ...
    GROUP BY...
    HAVING ....
    ORDER BY...
*/