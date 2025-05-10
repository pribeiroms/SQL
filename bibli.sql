-- Criação do banco de dados
CREATE DATABASE biblioteca;

-- Usando o banco de dados
USE biblioteca;

-- Criação da tabela de autores
CREATE TABLE autores (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

-- Criação da tabela de livros
CREATE TABLE livros (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    id_autor INT,
    ano_publicacao INT,
    genero VARCHAR(50),
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

-- Criação da tabela de empréstimos
CREATE TABLE emprestimos (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) DEFAULT 'Em andamento',
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

-- Inserção de dados
INSERT INTO autores (nome_autor, nacionalidade)
VALUES 
('J.K. Rowling', 'Britânica'),
('George Orwell', 'Britânica');

INSERT INTO livros (titulo, id_autor, ano_publicacao, genero)
VALUES 
('Harry Potter e a Pedra Filosofal', 1, 1997, 'Fantasia'),
('1984', 2, 1949, 'Distopia');

INSERT INTO emprestimos (id_livro, data_emprestimo, data_devolucao)
VALUES 
(1, '2025-05-10', '2025-06-10');

SELECT e.id_emprestimo, l.titulo, a.nome_autor, e.data_emprestimo, e.data_devolucao, e.status_emprestimo
FROM emprestimos e
JOIN livros l ON e.id_livro = l.id_livro
JOIN autores a ON l.id_autor = a.id_autor;
