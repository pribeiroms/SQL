-- Criação do banco de dados
CREATE DATABASE loja_online;

-- Usando o banco de dados criado
USE loja_online;

-- Criação da tabela de clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de pedidos
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Inserção de dados
INSERT INTO clientes (nome_cliente, email_cliente)
VALUES 
('Carlos Silva', 'carlos.silva@email.com'),
('Ana Costa', 'ana.costa@email.com');

INSERT INTO pedidos (id_cliente, valor_total)
VALUES 
(1, 150.50),
(2, 320.75);

SELECT p.id_pedido, p.valor_total, c.nome_cliente, c.email_cliente
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente;
