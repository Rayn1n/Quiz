
CREATE TABLE Clientes (
    Cli_id INT AUTO_INCREMENT PRIMARY KEY,
    Cli_nome VARCHAR(100) NOT NULL,
    Cli_telefone VARCHAR(20),
    Cli_email VARCHAR(100),
    Cli_endereco VARCHAR(255),
    Cli_data_cadastro DATE
);


CREATE TABLE Animais (
    Pet_id INT AUTO_INCREMENT PRIMARY KEY,
    Pet_nome VARCHAR(100) NOT NULL,
    Pet_especie VARCHAR(50),
    Pet_raca VARCHAR(50),
    Pet_data_nascimento DATE,
    Pet_fk_id_cliente INT,
    FOREIGN KEY (Pet_fk_id_cliente) REFERENCES Clientes(cli_id)
);


CREATE TABLE Vacinas (
    Vac_id INT AUTO_INCREMENT PRIMARY KEY,
    Vac_nome VARCHAR(100) NOT NULL,
    Vac_fabricante VARCHAR(100),
    Vac_validade DATE
);

CREATE TABLE OrdemServico (
    Ord_id INT AUTO_INCREMENT PRIMARY KEY,
    Ord_data_abertura DATE,
    Ord_data_fechamento DATE,
    Ord_Status VARCHAR(50),
    Ord_fk_id_cliente INT,
    Ord_fk_id_animal INT,
    FOREIGN KEY (Ord_fk_id_cliente) REFERENCES Clientes(Cli_id), 
    FOREIGN KEY (Ord_fk_id_animal) REFERENCES Animais(Pet_id) 
);


CREATE TABLE ProdutoServico (
    prod_id INT AUTO_INCREMENT PRIMARY KEY,
    prod_descricao VARCHAR(255) NOT NULL,
    prod_preco DECIMAL(10, 2)
);


CREATE TABLE VacinasAplicadas (
    vacp_id INT AUTO_INCREMENT PRIMARY KEY,
    vacp_fk_id_animal INT,
    vacp_fk_id_vacina INT,
    vacp_data_aplicacao DATE,
    FOREIGN KEY (vacp_fk_id_animal) REFERENCES Animais(pet_id),
    FOREIGN KEY (vacp_fk_id_vacina) REFERENCES Vacinas(vac_id)
);


CREATE TABLE ItensOrdemServico (
    Ite_id INT AUTO_INCREMENT PRIMARY KEY,
    Ite_id_ordem_servico INT,
    Ite_id_produto_servico INT,
    Ite_quantidade INT,
    Ite_preco DECIMAL(10, 2),
    FOREIGN KEY (Ite_id_ordem_servico) REFERENCES OrdemServico(Ord_id),
    FOREIGN KEY (Ite_id_produto_servico) REFERENCES ProdutoServico(prod_id)
);

CREATE TABLE FormaPagamento (
    Form_id INT AUTO_INCREMENT PRIMARY KEY,
    Form_descricao VARCHAR(50) NOT NULL
);


CREATE TABLE Funcionarios (
    Func_id INT AUTO_INCREMENT PRIMARY KEY,
    Func_nome VARCHAR(100) NOT NULL,
    Func_cargo VARCHAR(50),
    Func_telefone VARCHAR(20),
    Func_email VARCHAR(100)
);

CREATE TABLE Recebimento (
    Rec_id INT AUTO_INCREMENT PRIMARY KEY,
    Rec_fk_id_ordem_servico INT,
    Rec_fk_id_forma_pagamento INT,
    Rec_valor_recebido DECIMAL(10, 2),
    Rec_data_recebimento DATE,
    FOREIGN KEY (Rec_fk_id_ordem_servico) REFERENCES OrdemServico(Ord_id),
    FOREIGN KEY (Rec_fk_id_forma_pagamento) REFERENCES FormaPagamento(Form_id)
);


-- INSERTS
INSERT INTO Clientes (Cli_nome, Cli_telefone, Cli_email, Cli_endereco, Cli_data_cadastro)
VALUES 
('João Silva', '11987654321', 'joao.silva@example.com', 'Rua A, 123', '2023-01-15'),
('Maria Oliveira', '21976543210', 'maria.oliveira@example.com', 'Av. B, 456', '2023-02-10'),
('Carlos Souza', '31965432109', 'carlos.souza@example.com', 'Rua C, 789', '2023-03-05'),
('Ana Lima', '41954321098', 'ana.lima@example.com', 'Av. D, 1011', '2023-04-20'),
('Fernanda Costa', '51943210987', 'fernanda.costa@example.com', 'Rua E, 1213', '2023-05-25');
INSERT INTO Animais (Pet_nome, Pet_especie, Pet_raca, Pet_data_nascimento, Pet_fk_id_cliente)
VALUES
('Rex', 'Cachorro', 'Labrador', '2021-06-15', 1),
('Mia', 'Gato', 'Persa', '2020-11-22', 2),
('Buddy', 'Cachorro', 'Poodle', '2019-09-10', 3),
('Luna', 'Gato', 'Siamês', '2018-05-30', 4),
('Max', 'Cachorro', 'Beagle', '2022-01-10', 5);
INSERT INTO Vacinas (Vac_nome, Vac_fabricante, Vac_validade)
VALUES
('V10', 'Bayer', '2025-12-31'),
('Raiva', 'Zoetis', '2026-06-30'),
('Giárdia', 'MSD', '2024-03-15'),
('Gripe Canina', 'Virbac', '2025-09-01'),
('Leishmaniose', 'Sanofi', '2024-11-10');
INSERT INTO OrdemServico (Ord_data_abertura, Ord_data_fechamento, Ord_Status, Ord_fk_id_cliente, Ord_fk_id_animal)
VALUES
('2023-07-01', '2023-07-02', 'Finalizado', 1, 1),
('2023-07-05', NULL, 'Em Andamento', 2, 2),
('2023-07-10', '2023-07-12', 'Finalizado', 3, 3),
('2023-07-15', NULL, 'Aberto', 4, 4),
('2023-07-20', '2023-07-21', 'Finalizado', 5, 5);
INSERT INTO ProdutoServico (prod_descricao, prod_preco)
VALUES
('Banho', 50.00),
('Tosa', 40.00),
('Consulta Veterinária', 150.00),
('Vacinação', 80.00),
('Vermifugação', 60.00);
INSERT INTO VacinasAplicadas (vacp_fk_id_animal, vacp_fk_id_vacina, vacp_data_aplicacao)
VALUES
(1, 1, '2023-07-03'),
(2, 2, '2023-07-06'),
(3, 3, '2023-07-11'),
(4, 4, '2023-07-16'),
(5, 5, '2023-07-21');
INSERT INTO ItensOrdemServico (Ite_id_ordem_servico, Ite_id_produto_servico, Ite_quantidade, Ite_preco)
VALUES
(1, 1, 1, 50.00),
(1, 2, 1, 40.00),
(2, 3, 1, 150.00),
(3, 4, 1, 80.00),
(4, 5, 1, 60.00);
INSERT INTO FormaPagamento (Form_descricao)
VALUES
('Dinheiro'),
('Cartão de Crédito'),
('Cartão de Débito'),
('Transferência Bancária'),
('Pix');
INSERT INTO Funcionarios (Func_nome, Func_cargo, Func_telefone, Func_email)
VALUES
('Lucas Almeida', 'Veterinário', '11912345678', 'lucas.almeida@example.com'),
('Patrícia Rocha', 'Atendente', '21987654321', 'patricia.rocha@example.com'),
('Renato Silva', 'Tosador', '31987654322', 'renato.silva@example.com'),
('Camila Santos', 'Recepcionista', '41987654323', 'camila.santos@example.com'),
('Roberto Costa', 'Gerente', '51987654324', 'roberto.costa@example.com');
INSERT INTO Recebimento (Rec_fk_id_ordem_servico, Rec_fk_id_forma_pagamento, Rec_valor_recebido, Rec_data_recebimento)
VALUES
(1, 1, 90.00, '2023-07-02'),
(2, 2, 150.00, '2023-07-05'),
(3, 3, 150.00, '2023-07-12'),
(4, 4, 60.00, '2023-07-15'),
(5, 5, 140.00, '2023-07-21');
-- ------------------
-- A:
SELECT DISTINCT a.Pet_id, a.Pet_nome, a.Pet_especie, a.Pet_raca, c.Cli_nome
FROM Animais a
JOIN OrdemServico o ON a.Pet_id = o.Ord_fk_id_animal
JOIN Clientes c ON o.Ord_fk_id_cliente = c.Cli_id
WHERE o.Ord_Status IS NOT NULL;

-- B:

SELECT Vac_id, Vac_nome, Vac_Fabricante, vac_Validade
FROM Vacinas
WHERE vac_validade BETWEEN DATE_FORMAT(NOW()+ INTERVAL 1 MONTH, '%Y-%m-01')
AND LAST_DAY(NOW() + INTERVAL 1 MONTH);

-- C

ALTER TABLE Animais ADD COLUMN Pet_quantidade_banhos INT DEFAULT 0;

UPDATE Animais a
JOIN (
    SELECT i.Ite_id_ordem_servico, COUNT(*) AS quantidade_banhos
    FROM ItensOrdemServico i
    JOIN ProdutoServico p ON i.Ite_id_produto_servico = p.prod_id
    WHERE p.prod_descricao = 'Banho'
    GROUP BY i.Ite_id_ordem_servico
) b ON a.Pet_id = (
    SELECT o.Ord_fk_id_animal
    FROM OrdemServico o
    WHERE o.Ord_id = b.Ite_id_ordem_servico
)
SET a.Pet_quantidade_banhos = (
    SELECT SUM(quantidade_banhos)
    FROM (
        SELECT i.Ite_id_ordem_servico, COUNT(*) AS quantidade_banhos
        FROM ItensOrdemServico i
        JOIN ProdutoServico p ON i.Ite_id_produto_servico = p.prod_id
        WHERE p.prod_descricao = 'Banho'
        GROUP BY i.Ite_id_ordem_servico
    ) b
    WHERE (
        SELECT o.Ord_fk_id_animal
        FROM OrdemServico o
        WHERE o.Ord_id = b.Ite_id_ordem_servico
    ) = a.Pet_id
);





-- D:

INSERT INTO OrdemServico (Ord_data_abertura, Ord_data_fechamento, Ord_Status, Ord_fk_id_cliente, Ord_fk_id_animal)
VALUES
('2024-08-01', '2024-08-05', 'Finalizado', 1, 1); 

INSERT INTO ItensOrdemServico (Ite_id_ordem_servico, Ite_id_produto_servico, Ite_quantidade, Ite_preco)
VALUES
(1, 1, 3, 50.00), 
(1, 2, 1, 40.00);

INSERT INTO ProdutoServico (prod_descricao, prod_preco)
VALUES
('Banho', 50.00),
('Tosa', 40.00),
('Consulta Veterinária', 150.00),
('Vacinação', 80.00),
('Vermifugação', 60.00);

SELECT 
    p.prod_descricao AS Descricao_Produto,
    COALESCE(SUM(i.Ite_quantidade), 0) AS Total_Vendido
FROM 
    ProdutoServico p
LEFT JOIN 
    ItensOrdemServico i ON p.prod_id = i.Ite_id_produto_servico
LEFT JOIN 
    OrdemServico o ON i.Ite_id_ordem_servico = o.Ord_id 
                    AND MONTH(o.Ord_data_fechamento) = MONTH(CURDATE()) 
                    AND YEAR(o.Ord_data_fechamento) = YEAR(CURDATE())
GROUP BY 
    p.prod_descricao;


-- F

ALTER TABLE OrdemServico ADD COLUMN Ord_comissao DECIMAL(10, 2) DEFAULT 0;


UPDATE OrdemServico o
JOIN (
    SELECT 
        i.Ite_id_ordem_servico,
        SUM(i.Ite_preco * i.Ite_quantidade) AS Total_Faturado
    FROM 
        ItensOrdemServico i
    GROUP BY 
        i.Ite_id_ordem_servico
) t ON o.Ord_id = t.Ite_id_ordem_servico
SET o.Ord_comissao = t.Total_Faturado * 0.03;


SELECT 
    f.Func_nome,
    SUM(o.Ord_comissao) AS Comissao_Total
FROM 
    Funcionarios f
LEFT JOIN 
    OrdemServico o ON f.Func_id = o.Ord_fk_id_funcionario
WHERE 
    o.Ord_data_fechamento IS NOT NULL
    AND MONTH(o.Ord_data_fechamento) = MONTH(CURDATE())
    AND YEAR(o.Ord_data_fechamento) = YEAR(CURDATE())
GROUP BY 
    f.Func_nome;



-- G
ALTER TABLE Animais ADD COLUMN Pet_proxima_vacina DATE;

UPDATE Animais a
JOIN VacinasAplicadas va ON a.Pet_id = va.vacp_fk_id_animal
SET a.Pet_proxima_vacina = DATE_ADD(va.vacp_data_aplicacao, INTERVAL 1 YEAR)
WHERE va.vacp_data_aplicacao = (
    SELECT MAX(vacp_data_aplicacao) 
    FROM VacinasAplicadas 
    WHERE vacp_fk_id_animal = a.Pet_id
);
SELECT * From Animais;
SELECT Pet_proxima_vacina From Animais;

-- H
ALTER TABLE Clientes ADD COLUMN Cli_total_comprado DECIMAL(10, 2) DEFAULT 0;

UPDATE Clientes c
SET Cli_total_comprado = (
    SELECT SUM(i.Ite_preco * i.Ite_quantidade)
    FROM ItensOrdemServico i
    JOIN OrdemServico o ON i.Ite_id_ordem_servico = o.Ord_id
    WHERE o.Ord_fk_id_cliente = c.Cli_id
);
SELECT * From Clientes;
SELECT Cli_total_comprado From Clientes;