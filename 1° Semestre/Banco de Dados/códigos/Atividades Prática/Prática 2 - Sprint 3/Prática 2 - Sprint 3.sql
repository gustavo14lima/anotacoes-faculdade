CREATE DATABASE loja;
USE loja;

CREATE TABLE categoria (
    idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nomeCategoria VARCHAR(100)
);

CREATE TABLE produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nomeProduto VARCHAR(100),
    preco DECIMAL(10,2),
    fkCategoria INT,
    FOREIGN KEY (fkCategoria) REFERENCES categoria(idCategoria)
);

CREATE TABLE cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE venda (
    idVenda INT PRIMARY KEY AUTO_INCREMENT,
    fkCliente INT,
    dataVenda DATE,
    FOREIGN KEY (fkCliente) REFERENCES cliente(idCliente)
);

CREATE TABLE itemVenda (
    idItemVenda INT PRIMARY KEY AUTO_INCREMENT,
    fkVenda INT,
    fkProduto INT,
    quantidade INT,
    FOREIGN KEY (fkVenda) REFERENCES venda(idVenda),
    FOREIGN KEY (fkProduto) REFERENCES produto(idProduto)
);

INSERT INTO categoria (nomeCategoria) VALUES
('Periféricos'),
('Hardware'),
('Monitores');

INSERT INTO produto (nomeProduto, preco, fkCategoria) VALUES
('Mouse', 120, 1),
('Teclado', 250, 1),
('SSD', 400, 2),
('Monitor Gamer', 1500, 3),
('Memória RAM', 350, 2);

INSERT INTO cliente (nome, email) VALUES
('Ana', 'ana@email.com'),
('Bruno', 'bruno@email.com'),
('Carlos', 'carlos@email.com');

INSERT INTO venda (fkCliente, dataVenda) VALUES
(1, '2026-05-01'),
(2, '2026-05-02'),
(1, '2026-05-03'),
(3, '2026-05-04');

INSERT INTO itemVenda (fkVenda, fkProduto, quantidade) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 4, 1),
(3, 3, 2),
(3, 5, 1),
(4, 1, 1),
(4, 4, 1);

-- =====================================================
-- EXERCÍCIOS
-- =====================================================

-- 1) Mostre a quantidade de produtos por categoria.
SELECT
    COUNT(fkCategoria) AS quantidade_produto 
FROM produto 
GROUP BY fkCategoria;

-- 2) Mostre as categorias que possuem mais de 1 produto.
SELECT
	c.nomeCategoria AS nome_categoria,
    COUNT(p.fkCategoria) AS quantidade_produto
FROM produto AS p
JOIN categoria AS c ON p.fkCategoria = c.idCategoria
GROUP BY p.fkCategoria
HAVING quantidade_produto > 1;

-- 3) Mostre o produto mais caro.
SELECT 
	c.nomeCategoria AS nome_categoria,
	MAX(p.preco) produto_mais_caro
FROM produto AS p
JOIN categoria AS c ON p.fkCategoria = c.idCategoria
GROUP BY p.fkCategoria;

-- 4) Mostre o preço médio dos produtos por categoria.
SELECT
	c.nomeCategoria AS nome_categoria,
	ROUND(AVG(p.preco), 2) AS preco_medio
FROM produto AS p
JOIN categoria AS c ON p.fkCategoria = c.idCategoria
GROUP BY p.fkCategoria;

-- 5) Mostre os produtos com preço acima da média.
SELECT
	nomeProduto AS nome_produto,
    preco AS preco_produto
FROM produto
WHERE preco > (
	SELECT
		AVG(preco)
	FROM produto
);


-- 6) Mostre a quantidade de itens vendidos por produto.
SELECT
	p.nomeProduto AS nome_produto,
    COUNT(iv.fkProduto) AS quantidade_vendas
FROM itemVenda AS iv
JOIN produto AS p ON iv.fkProduto = p.idProduto
GROUP BY iv.fkProduto;

-- 7) Mostre os produtos cuja quantidade vendida seja maior que 1.
SELECT
	p.nomeProduto AS nome_produto,
    COUNT(iv.fkProduto) AS quantidade_vendas
FROM itemVenda AS iv
JOIN produto AS p ON iv.fkProduto = p.idProduto
GROUP BY iv.fkProduto
HAVING quantidade_vendas > 1;

-- 8) Mostre a média dos preços médios das categorias.
SELECT
	ROUND(AVG(media), 2) AS media_categoria
FROM (
	SELECT
		AVG(preco) AS media
	FROM produto
    GROUP BY fkCategoria
) AS media_categoria;

-- 9) Mostre o cliente que realizou mais vendas.
SELECT
	c.nome AS nome_cliente,
	COUNT(v.fkCliente) AS cliente
FROM venda AS v
JOIN cliente AS c ON v.fkCliente = c.idCliente
GROUP BY v.fkCliente
LIMIT 1;

-- 10) Mostre a maior quantidade vendida de cada produto.
SELECT
	p.nomeProduto AS nome_produto,
    COUNT(iv.fkProduto) AS quantidade_vendas
FROM itemVenda AS iv
JOIN produto AS p ON iv.fkProduto = p.idProduto
GROUP BY iv.fkProduto
HAVING quantidade_vendas IN (
	SELECT
		MAX(total_pedidos)
	FROM (
		SELECT
			COUNT(fkProduto) AS total_pedidos
		FROM itemVenda
        GROUP BY fkProduto
	) AS contagem_produtos
);

-- 11) Mostre os produtos com preço acima da média da categoria.
SELECT 
	nomeProduto AS nome_produto
FROM produto
WHERE preco > (
	SELECT
		ROUND(AVG(media), 2) AS media_categoria
	FROM (
		SELECT
			AVG(preco) AS media
		FROM produto
		GROUP BY fkCategoria
	) AS media_categoria
);

-- 12) Mostre a média das quantidades vendidas por produto.
SELECT
	p.nomeProduto AS nome_produto,
	ROUND(AVG(iv.quantidade), 2) AS media_quantidade_vendida
FROM itemVenda AS iv
JOIN produto AS p ON iv.fkProduto = p.idProduto
GROUP BY fkProduto;

-- 13) Mostre quantos produtos possuem preço acima de 300.
SELECT
	COUNT(*)  AS quantidade_produto
FROM (
	SELECT
		nomeProduto AS nome_produto
	FROM produto
    WHERE preco > 300
) AS produtos;

-- 14) Mostre a categoria com maior quantidade de produtos.
SELECT
	c.nomeCategoria AS nome_categoria,
    COUNT(fkCategoria) AS quantidade_produtos
FROM produto AS p
JOIN categoria AS c ON p.fkCategoria = c.idCategoria
GROUP BY p.fkCategoria
HAVING COUNT(preco)  IN (
		SELECT
		MAX(contagem)
	FROM (
		SELECT
			COUNT(fkCategoria) AS contagem
		FROM produto
        GROUP BY fkCategoria
    ) AS contagem_produto
);

-- 15) Mostre os produtos cujo preço seja maior que a média dos preços médios.
SELECT
	nomeProduto AS nome_produto,
    preco AS preco_produto
FROM produto
WHERE preco > (
	SELECT
		AVG(media)
	FROM (
		SELECT
			AVG(preco) AS media
		FROM produto
    ) AS precos_medios
);