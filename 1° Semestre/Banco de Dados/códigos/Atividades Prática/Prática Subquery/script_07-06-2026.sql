/*
	Criando e utilizando o banco de dados para o exercício
*/
CREATE DATABASE pratica_subquery;
USE pratica_subquery;

-- Criando as tabelas de acordo coma modelagem lógica

-- Criando a tabela cliente
CREATE TABLE cliente (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cidade VARCHAR(45)
);

-- Criando a tabela pedido
CREATE TABLE pedido (
	id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    data DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

-- Criando a tabela produto
CREATE TABLE produto (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    categoria VARCHAR(45),
    preco DECIMAL(10, 2)
);

-- Criando a tabela itens_produto
CREATE TABLE itens_produto (
	id INT AUTO_INCREMENT,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    CONSTRAINT ctPkComposta PRIMARY KEY(id, pedido_id, produto_id),
    FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);

-- Inserindo dados nas tabelas criadas de acordo com a modelagem lógica
 
-- Inserindo dados na tabela cliente
INSERT INTO cliente (nome, cidade) VALUES
	('Cliente 1', 'Cidade 1'),
    ('Cliente 2', 'Cidade 2'),
    ('Cliente 3', 'Cidade 3'),
    ('Cliente 4', 'Cidade 4'),
    ('Cliente 5', 'Cidade 5');
    
-- Inserindo dados na tabela pedido 
INSERT INTO pedido (cliente_id, data, valor_total) VALUES
	(1, '2026-02-23', 231.99),
    (2, '2026-06-03', 199.99),
    (3, '2026-06-07', 200.00),
    (4, '2026-01-14', 1999.99),
    (5, '2025-06-12', 2999.99);
    
-- Inserindo dados na tabela produto
INSERT INTO produto(nome, categoria, preco) VALUES
	('Produto 1', 'Categoria A', 69.99),
    ('Produto 2', 'Categoria A', 79.99),
    ('Produto 3', 'Categoria B', 89.99),
    ('Produto 4', 'Categoria B', 129.99),
    ('Produto 5', 'Categoria C', 99.99);
    
-- Inserindo dados na tabela itens_produto
INSERT INTO itens_produto (pedido_id, produto_id, quantidade, preco_unitario) VALUES
	(1, 1, 3, 79.99),
    (2, 2, 7, 129.99),
    (3, 3, 2, 69.99),
    (4, 4, 1, 89.99),
    (5,5, 9, 99.99);

/*
	Exercício (Fácil): Início
*/

-- 1.Clientes com pedidos acima da média
SELECT 
	c.nome AS nome_cliente,
    ip.quantidade AS quantidade_pedidos
FROM itens_produto AS ip
JOIN pedido AS pe ON ip.pedido_id = pe.id
JOIN cliente AS c ON pe.cliente_id = c.id
WHERE ip.quantidade > (
	SELECT 
		AVG(quantidade)
	FROM itens_produto
);
	
-- 2.Produto mais caro
SELECT
	nome,
    categoria,
    preco
FROM produto
WHERE preco IN (
	SELECT
		MAX(preco)
	FROM produto
);

-- 3.Pedidos acima do menor valor
SELECT 
	c.nome AS nome_cliente,
	pe.data AS data_pedido,
    pr.nome AS nome_produto,
    pr.categoria AS categoria_produto,
    pr.preco AS preco_produto
FROM itens_produto AS ip
JOIN pedido AS pe ON ip.pedido_id = pe.id
JOIN cliente AS c ON pe.cliente_id = c.id
JOIN produto AS pr ON ip.produto_id - pr.id
WHERE pr.preco > (
	SELECT 
		MIN(preco)
	FROM produto
);
    
-- 4.Clientes sem pedidos
SELECT * 
FROM cliente
JOIN pedido ON pedido.cliente_id = cliente.id
WHERE cliente_id IS NULL;

-- 5.Produtos acima da média
SELECT 
	nome,
    categoria,
    preco
FROM produto
WHERE preco > (
	SELECT 
		AVG(preco)
	FROM produto
);

/*
	Exercício (Fácil): Fim
    Exercícios (Intermediário): Inicio
*/

-- 6.Clientes com total acima da média
SELECT 
	c.nome AS nome_cliente,
    p.data AS data_pedido,
    p.valor_total AS valor_total_pedido
FROM cliente AS c
JOIN pedido AS p ON p.cliente_id = c.id
WHERE valor_total > (
	SELECT 
		AVG(valor_total)
	FROM pedido
);

-- 7.Pedido com maior valor
SELECT 
	c.nome AS nome_cliente,
    p.data AS data_pedido,
    p.valor_total AS valor_total_pedido
FROM cliente AS c
JOIN pedido AS p ON p.cliente_id = c.id
WHERE valor_total IN (
	SELECT 
		MAX(valor_total)
	FROM pedido
);

-- 8.Produtos nunca vendidos
SELECT 
	p.nome AS nome_produto,
    p.categoria AS categoria_produto,
    p.preco AS preco_produto
FROM produto AS p
JOIN itens_produto AS ip ON ip.produto_id = p.id
WHERE ip.produto_id NOT IN (
	SELECT id
    FROM produto
);

-- 9.Total de pedidos por cliente
SELECT
	c.nome AS nome_cliente,
    pr.nome AS nome_produto,
    SUM(ip.quantidade) AS quantidade_total_pedidos,
    ip.preco_unitario AS preco_unitario_produto
FROM itens_produto AS ip
JOIN pedido AS pe ON ip.pedido_id = pe.id
JOIN cliente AS c ON pe.cliente_id = c.id
JOIN produto AS pr ON ip.produto_id = pr.id
GROUP BY c.nome, pr.nome, ip.preco_unitario;

-- 10.Categorias com mais de 5 produtos
SELECT
	nome,
	COUNT(categoria) AS categoria,
    preco
FROM produto
WHERE categoria > 5
GROUP BY nome, preco;

/*
    Exercícios (Intermediário): Fim
	Exercícios (Avançado): Inicio
*/

-- 11.Clientes que gastaram mais que a média da cidade
SELECT 
	c.nome AS nome_cliente,
    c.cidade AS cidade_cliente
FROM cliente AS c
JOIN pedido AS pe ON pe.cliente_id = c.id
WHERE valor_total > (
	SELECT 
		AVG(valor_total)
	FROM pedido
);

-- 12.Pedidos acima da média do cliente
SELECT
	pe.data AS data_pedido,
    pe.valor_total AS valor_total_pedido
FROM pedido AS pe
WHERE valor_total > (
	SELECT 
		AVG(valor_total)
	FROM pedido
);

-- 13.Produtos mais vendidos
SELECT
	p.nome AS nome_produto,
    p.categoria AS categoria_produto,
    p.preco AS preco_produto,
    ip.quantidade AS quantidade_pedidos
FROM itens_produto AS ip
JOIN produto AS p ON ip.produto_id = p.id
WHERE quantidade IN (
	SELECT 
		MAX(quantidade)
	FROM itens_produto
);

-- 14.Clientes acima da média de pedidos
SELECT 
	c.nome AS nome_cliente,
    c.cidade AS cidade_cliente
FROM cliente AS c
JOIN pedido AS pe ON pe.cliente_id = c.id
JOIN itens_produto AS ip ON ip.pedido_id = pe.id
WHERE quantidade > (
	SELECT
		AVG(quantidade)
	FROM itens_produto
);

-- 15.Pedidos acima de duas médias
SELECT 
	c.nome AS nome_cliente,
    pe.data AS data_pedido,
    pe.valor_total AS valor_total_pedido,
    ip.quantidade AS quantidade_pedido
FROM itens_produto AS ip
JOIN pedido AS pe ON ip.pedido_id = pe.id
JOIN cliente AS c ON pe.cliente_id = c.id
WHERE ip.quantidade > (
	SELECT
		AVG(quantidade)
	FROM itens_produto
) AND pe.valor_total > (
		SELECT
		AVG(valor_total)
	FROM pedido
);

/*
	Exercícios (Avançado): Fim
	Exercícios (Desafio): Inicio
*/

-- 16.Cliente que mais gastou
SELECT 
	c.nome AS nome_cliente,
    c.cidade AS cidade_cliente
FROM cliente AS c
JOIN pedido AS p ON p.cliente_id = c.id
WHERE valor_total IN (
	SELECT 
		MAX(valor_total)
	FROM pedido
);

-- 17.Top 3 produtos
SELECT 
    p.nome AS nome_produto,
    p.categoria AS categoria_produto,
    p.preco AS preco_produto
FROM produto AS p
JOIN itens_produto AS ip ON ip.produto_id = p.id
JOIN (
    SELECT 
		DISTINCT quantidade
    FROM itens_produto
    ORDER BY quantidade ASC
    LIMIT 3
) AS top_produtos ON ip.quantidade = top_produtos.quantidade;

-- 18.Ticket médio acima da média
SELECT 
	c.nome AS nome_cliente,
    c.cidade AS cidade_cliente,
    p.data AS data_pedido,
    p.valor_total AS valor_total_pedido,
    AVG(valor_total) AS ticket_medio
FROM cliente AS c
JOIN pedido AS p ON p.cliente_id = c.id
WHERE p.valor_total > (
    SELECT AVG(valor_total) 
    FROM pedido
)
GROUP BY c.nome, c.cidade, p.data, p.valor_total;

-- 19.Categorias com preço médio alto
SELECT 
	nome,
    categoria,
    preco
FROM produto
WHERE preco > (
	SELECT 
		AVG(preco)
	FROM produto
) AND preco IN (
	SELECT 
		MAX(preco)
	FROM produto
) ;

-- 20.Pedidos com mais itens que a média
SELECT 
	p.id AS numero_pedido,
	p.data AS data_pedido,
    p.valor_total AS valor_total_pedido
FROM pedido AS p
JOIN itens_produto AS ip ON ip.produto_id = p.id
WHERE ip.quantidade > (
	SELECT
		AVG(quantidade)
	FROM itens_produto
);