SET SQL_SAFE_UPDATES = 0;

CREATE SCHEMA `consessionaria` ;

USE consessionaria;

CREATE TABLE Clientes (
    Cli_Id INT AUTO_INCREMENT PRIMARY KEY,
    Cli_Nome VARCHAR(100) NOT NULL,
    Cli_Telefone VARCHAR(20),
    Cli_Email VARCHAR(100),
    Cli_Rua VARCHAR(45),
    Cli_Bairro VARCHAR(45),
    Cli_Cnumero VARCHAR(45),
    Cli_Cidade VARCHAR(45),
    Cli_Estado_sigla VARCHAR(45),
    Cli_Cep VARCHAR(45),
    Cli_TotalComp INT
);

CREATE TABLE Disponibilidade(
	Disp_Id INT AUTO_INCREMENT PRIMARY KEY,
    Disp_Desc VARCHAR(45)
);

CREATE TABLE Categoria(
	Cat_Id INT AUTO_INCREMENT PRIMARY KEY,
    Cat_Categoria VARCHAR(45)
);

CREATE TABLE Modelo (
	Mod_Id INT PRIMARY KEY AUTO_INCREMENT,
    Mod_Modelo VARCHAR(45)
);

CREATE TABLE Marca(
	Marc_Id INT AUTO_INCREMENT PRIMARY KEY,
    Marc_Marca VARCHAR(45),
    Marc_Valor FLOAT
);

CREATE TABLE FormaPagamento(
	Pag_Id INT AUTO_INCREMENT PRIMARY KEY,
    Pag_Tipo VARCHAR(45)
);

CREATE TABLE Venda(
	Ven_Id INT AUTO_INCREMENT PRIMARY KEY,
    Ven_Valor FLOAT,
    Ven_Data DATE,
    Ven_fk_Modelo INT,
	Ven_fk_Disp_Id INT,
	Ven_fk_Cat_Id INT,
    Ven_fk_Marca INT,
    FOREIGN KEY (Ven_fk_Disp_Id) REFERENCES Disponibilidade(Disp_id),
    FOREIGN KEY (Ven_fk_Cat_Id) REFERENCES Categoria(Cat_id),
	FOREIGN KEY (Ven_fk_Modelo) REFERENCES Modelo(Mod_id),
    FOREIGN KEY (Ven_fk_Marca) REFERENCES Marca(Marc_id)
);

CREATE TABLE Recebimento(
	Rec_id INT AUTO_INCREMENT PRIMARY KEY,
    Rec_fk_Pag_Id INT,
    Rec_fk_Ven_Id INT,
    Rec_Valor_Recebido DECIMAL(10, 2),
    Rec_Data_Recebimento DATE,
	FOREIGN KEY (Rec_fk_Pag_Id) REFERENCES FormaPagamento(Pag_Id),
    FOREIGN KEY (Rec_fk_Ven_Id) REFERENCES Venda(Ven_Id)
);

CREATE TABLE Vendedor (
    Vend_Id INT AUTO_INCREMENT PRIMARY KEY,
    Vend_Nome VARCHAR(100) NOT NULL,
    Vend_Telefone VARCHAR(20),
    Vend_Email VARCHAR(100),
    Vend_Rua VARCHAR(45),
    Vend_Bairro VARCHAR(45),
    Vend_Cnumero VARCHAR(45),
    Vend_Cidade VARCHAR(45),
    Vend_Cep VARCHAR(45),
    Vend_TotalVend INT,
    Vend_fk_Cliente INT,
    Vend_fk_Venda INT,
    FOREIGN KEY (Vend_fk_Cliente) REFERENCES Clientes(Cli_Id),
    FOREIGN KEY (Vend_fk_Venda) REFERENCES Venda(Ven_Id)
);

-- Tabela Disponibilidade
INSERT INTO Disponibilidade (Disp_Desc) VALUES ('Disponível'), ('Indisponível');

-- Tabela Categoria
INSERT INTO Categoria (Cat_Categoria) VALUES 
('SUV'), ('Sedan'), ('Hatchback'), ('Crossover'), ('Pickup'),
('Minivan'), ('Coupe'), ('Conversível'), ('Esportivo'), ('Station Wagon');

-- Tabela Modelo
INSERT INTO Modelo (Mod_Modelo) VALUES 
('Gol'), ('Civic'), ('Corolla'), ('Fusca'), ('Fiesta'),
('Hilux'), ('Onix'), ('Compass'), ('Kicks');

-- Tabela Marca
INSERT INTO Marca (Marc_Marca, Marc_Valor) VALUES 
('Volkswagen', 50000.00), 
('Honda', 60000.00), 
('Toyota', 70000.00), 
('Ford', 55000.00), 
('Chevrolet', 65000.00), 
('Nissan', 62000.00), 
('Jeep', 75000.00), 
('Hyundai', 58000.00), 
('Kia', 60000.00), 
('Renault', 54000.00);

-- Tabela FormaPagamento
INSERT INTO FormaPagamento (Pag_Tipo) VALUES 
('Dinheiro'), 
('Cartão de Crédito'), 
('Débito'), 
('Transferência Bancária'), 
('Cheque'), 
('Boleto'), 
('Financiamento'), 
('Leasing'), 
('PayPal'), 
('PIX');


-- Tabela Venda
INSERT INTO Venda (Ven_Valor, Ven_Data, Ven_fk_Modelo, Ven_fk_Disp_Id, Ven_fk_Cat_Id, Ven_fk_Marca) VALUES 
(55000.00, '2024-09-01', 1, 1, 1, 1),
(62000.00, '2024-09-02', 2, 1, 2, 2),
(70000.00, '2024-09-03', 3, 2, 3, 3),
(55000.00, '2024-09-04', 4, 1, 4, 4),
(65000.00, '2024-09-05', 5, 2, 5, 5),
(62000.00, '2024-09-06', 6, 1, 6, 6),
(75000.00, '2024-09-07', 7, 2, 7, 7),
(58000.00, '2024-09-08', 8, 1, 8, 8),
(60000.00, '2024-09-09', 9, 1, 9, 9);


-- Tabela Recebimento
INSERT INTO Recebimento (Rec_fk_Pag_Id, Rec_fk_Ven_Id, Rec_Valor_Recebido, Rec_Data_Recebimento) VALUES 
(1, 1, 55000.00, '2024-09-01'),
(2, 2, 62000.00, '2024-09-02'),
(3, 3, 70000.00, '2024-09-03'),
(4, 4, 55000.00, '2024-09-04'),
(5, 5, 65000.00, '2024-09-05'),
(6, 6, 62000.00, '2024-09-06'),
(7, 7, 75000.00, '2024-09-07'),
(8, 8, 58000.00, '2024-09-08'),
(9, 9, 60000.00, '2024-09-09');

-- Tabela Clientes
INSERT INTO Clientes (Cli_Nome, Cli_Telefone, Cli_Email, Cli_Rua, Cli_Bairro, Cli_Cnumero, Cli_Cidade, Cli_Cep, Cli_TotalComp) VALUES 
('Júlia Martins', '321654987', 'julia.martins@example.com', 'Rua X', 'Bairro A', '321', 'Cidade X', '32165-432', 5),
('Fernando Alves', '654789321', 'fernando.alves@example.com', 'Rua Y', 'Bairro B', '654', 'Cidade Y', '65478-543', 8),
('Patrícia Souza', '987654321', 'patricia.souza@example.com', 'Rua Z', 'Bairro C', '987', 'Cidade Z', '98765-432', 10),
('Rodrigo Lima', '876543210', 'rodrigo.lima@example.com', 'Rua W', 'Bairro D', '876', 'Cidade W', '87654-321', 12),
('Mariana Costa', '543210987', 'mariana.costa@example.com', 'Rua V', 'Bairro E', '543', 'Cidade V', '54321-098', 15),
('Ricardo Santos', '210987654', 'ricardo.santos@example.com', 'Rua U', 'Bairro F', '210', 'Cidade U', '21098-765', 7),
('Camila Pereira', '098765432', 'camila.pereira@example.com', 'Rua T', 'Bairro G', '098', 'Cidade T', '09876-543', 9),
('Eduardo Ferreira', '345678901', 'eduardo.ferreira@example.com', 'Rua S', 'Bairro H', '345', 'Cidade S', '34567-890', 6),
('Beatriz Oliveira', '456789012', 'beatriz.oliveira@example.com', 'Rua R', 'Bairro I', '456', 'Cidade R', '45678-901', 11),
('Vinícius Silva', '567890123', 'vinicius.silva@example.com', 'Rua Q', 'Bairro J', '567', 'Cidade Q', '56789-012', 13);
-- Tabela Vendedor
INSERT INTO Vendedor (Vend_Nome, Vend_Telefone, Vend_Email, Vend_Rua, Vend_Bairro, Vend_Cnumero, Vend_Cidade, Vend_Cep, Vend_TotalVend, Vend_fk_Cliente, Vend_fk_Venda) VALUES 
('Carlos Silva', '123456789', 'carlos.silva@example.com', 'Rua A', 'Bairro 1', '123', 'Cidade A', '12345-678', 10, 1, 1),
('Ana Oliveira', '234567890', 'ana.oliveira@example.com', 'Rua B', 'Bairro 2', '456', 'Cidade B', '23456-789', 15, 2, 2),
('João Santos', '345678901', 'joao.santos@example.com', 'Rua C', 'Bairro 3', '789', 'Cidade C', '34567-890', 20, 3, 3),
('Maria Lima', '456789012', 'maria.lima@example.com', 'Rua D', 'Bairro 4', '101', 'Cidade D', '45678-901', 12, 4, 4),
('Paulo Costa', '567890123', 'paulo.costa@example.com', 'Rua E', 'Bairro 5', '202', 'Cidade E', '56789-012', 18, 5, 5),
('Juliana Almeida', '678901234', 'juliana.almeida@example.com', 'Rua F', 'Bairro 6', '303', 'Cidade F', '67890-123', 22, 6, 6),
('Lucas Pereira', '789012345', 'lucas.pereira@example.com', 'Rua G', 'Bairro 7', '404', 'Cidade G', '78901-234', 16, 7, 7),
('Fernanda Rocha', '890123456', 'fernanda.rocha@example.com', 'Rua H', 'Bairro 8', '505', 'Cidade H', '89012-345', 14, 8, 8),
('Roberto Martins', '901234567', 'roberto.martins@example.com', 'Rua I', 'Bairro 9', '606', 'Cidade I', '90123-456', 19, 9, 9);
ALTER TABLE Venda
ADD COLUMN Ven_fk_Vendedor INT,
ADD FOREIGN KEY (Ven_fk_Vendedor) REFERENCES Vendedor(Vend_Id);
UPDATE Venda SET Ven_fk_Vendedor = 1 WHERE Ven_Id = 1;
UPDATE Venda SET Ven_fk_Vendedor = 2 WHERE Ven_Id = 2;
UPDATE Venda SET Ven_fk_Vendedor = 3 WHERE Ven_Id = 3;
UPDATE Venda SET Ven_fk_Vendedor = 4 WHERE Ven_Id = 4;
UPDATE Venda SET Ven_fk_Vendedor = 5 WHERE Ven_Id = 5;
UPDATE Venda SET Ven_fk_Vendedor = 6 WHERE Ven_Id = 6;
UPDATE Venda SET Ven_fk_Vendedor = 7 WHERE Ven_Id = 7;
UPDATE Venda SET Ven_fk_Vendedor = 8 WHERE Ven_Id = 8;
UPDATE Venda SET Ven_fk_Vendedor = 9 WHERE Ven_Id = 9;



-- ATIVIDADE

-- 1-Listar todos os carros disponíveis na concessionária.

SELECT 
    m.Mod_Modelo AS Modelo, 
    c.Cat_Categoria AS Categoria, 
    ma.Marc_Marca AS Marca, 
    v.Ven_Valor AS Valor,
    d.Disp_Desc AS Disponibilidade
FROM 
    Venda v
JOIN 
    Modelo m ON v.Ven_fk_Modelo = m.Mod_Id
JOIN 
    Categoria c ON v.Ven_fk_Cat_Id = c.Cat_Id
JOIN 
    Marca ma ON v.Ven_fk_Marca = ma.Marc_Id
JOIN 
    Disponibilidade d ON v.Ven_fk_Disp_Id = d.Disp_Id
WHERE 
    d.Disp_Desc = 'Disponível';


-- 2-Contar o número total de carros de uma determinada marca.

SELECT 
    ma.Marc_Marca AS Marca, 
    COUNT(*) AS Total_Carros
FROM 
    Venda v
JOIN 
    Marca ma ON v.Ven_fk_Marca = ma.Marc_Id
WHERE 
    ma.Marc_Marca = 'Volkswagen'
GROUP BY 
    ma.Marc_Marca;

-- 3-Calcular a média de preço dos carros disponíveis.

SELECT 
    AVG(v.Ven_Valor) AS Media_Preco
FROM 
    Venda v
JOIN 
    Disponibilidade d ON v.Ven_fk_Disp_Id = d.Disp_Id
WHERE 
    d.Disp_Desc = 'Disponível';


-- 4-Encontrar o carro mais caro na concessionária.

SELECT 
    m.Mod_Modelo AS Modelo, 
    c.Cat_Categoria AS Categoria, 
    ma.Marc_Marca AS Marca, 
    v.Ven_Valor AS Valor,
    d.Disp_Desc AS Disponibilidade
FROM 
    Venda v
JOIN 
    Modelo m ON v.Ven_fk_Modelo = m.Mod_Id
JOIN 
    Categoria c ON v.Ven_fk_Cat_Id = c.Cat_Id
JOIN 
    Marca ma ON v.Ven_fk_Marca = ma.Marc_Id
JOIN 
    Disponibilidade d ON v.Ven_fk_Disp_Id = d.Disp_Id
ORDER BY 
    v.Ven_Valor DESC
LIMIT 1;

-- 5-Identificar o número total de carros vendidos no mês.

SELECT 
    COUNT(*) AS Total_Carros_Vendidos
FROM 
    Venda
WHERE 
    Ven_Data BETWEEN '2024-09-01' AND '2024-09-30';

-- 6-Calcular o lucro total da concessionária no mês.

SELECT 
    SUM(v.Ven_Valor) AS Lucro_Total
FROM 
    Venda v
WHERE 
    v.Ven_Data BETWEEN '2024-09-01' AND '2024-09-30';


-- 7-Identificar o vendedor que mais vendeu carros no mês.


SELECT 
    vdr.Vend_Nome AS Vendedor,
    COUNT(v.Ven_Id) AS Total_Vendas
FROM 
    Venda v
JOIN 
    Vendedor vdr ON v.Ven_fk_Vendedor = vdr.Vend_Id
WHERE 
    v.Ven_Data BETWEEN '2024-09-01' AND '2024-09-30'
GROUP BY 
    vdr.Vend_Nome
ORDER BY 
    Total_Vendas DESC
LIMIT 1;



-- 8-Encontrar os clientes que mais compraram carros na concessionária.

SELECT 
    c.Cli_Nome AS Cliente,
    COUNT(v.Ven_Id) AS Total_Compras
FROM 
    Venda v
JOIN 
    Clientes c ON v.Ven_fk_Cliente = c.Cli_Id
GROUP BY 
    c.Cli_Nome
ORDER BY 
    Total_Compras DESC;
   
-- 9-Identificar os carros mais vendidos por categoria (por exemplo, SUVs, sedans, etc.).
SELECT 
    c.Cat_Categoria AS Categoria,
    m.Mod_Modelo AS Modelo,
    COUNT(v.Ven_Id) AS Total_Vendas
FROM 
    Venda v
JOIN 
    Categoria c ON v.Ven_fk_Cat_Id = c.Cat_Id
JOIN 
    Modelo m ON v.Ven_fk_Modelo = m.Mod_Id
GROUP BY 
    c.Cat_Categoria, m.Mod_Modelo
ORDER BY 
    c.Cat_Categoria, Total_Vendas DESC;

-- 10-Encontrar o mês com o maior número de vendas.

SELECT 
    DATE_FORMAT(v.Ven_Data, '%Y-%m') AS Mes,
    COUNT(v.Ven_Id) AS Total_Vendas
FROM 
    Venda v
GROUP BY 
    DATE_FORMAT(v.Ven_Data, '%Y-%m')
ORDER BY 
    Total_Vendas DESC

