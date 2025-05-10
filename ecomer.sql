CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(100) NOT NULL
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(150) NOT NULL,
    id_categoria INT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT DEFAULT 0,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(100) UNIQUE NOT NULL,
    endereco_cliente VARCHAR(255) NOT NULL
);

CREATE TABLE vendas (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO categorias (nome_categoria) 
VALUES 
('Eletrônicos'),
('Roupas'),
('Alimentos');

INSERT INTO produtos (nome_produto, id_categoria, preco, estoque) 
VALUES 
('Smartphone', 1, 999.99, 50),
('Camiseta', 2, 29.90, 100),
('Cereal', 3, 5.50, 200);

INSERT INTO clientes (nome_cliente, email_cliente, endereco_cliente) 
VALUES 
('Lucas Silva', 'lucas.silva@email.com', 'Rua A, 123, SP'),
('Maria Oliveira', 'maria.oliveira@email.com', 'Avenida B, 456, RJ');

INSERT INTO vendas (id_cliente, valor_total) 
VALUES 
(1, 1029.89), 
(2, 35.40);    

SELECT v.id_venda, v.valor_total, c.nome_cliente, c.email_cliente, v.data_venda
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente;
