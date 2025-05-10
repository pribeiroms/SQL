-- Criação da tabela
CREATE TABLE tarefas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL,
    concluida BOOLEAN DEFAULT FALSE,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO tarefas (descricao, concluida)
VALUES 
('Estudar JavaScript', FALSE),
('Comitar projeto no GitHub', TRUE),
('Criar tabela SQL aleatória', TRUE);

SELECT * FROM tarefas WHERE concluida = FALSE;
