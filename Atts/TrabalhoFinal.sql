CREATE SCHEMA pastelaria_do_beiçola;

USE pastelaria_do_beiçola;


CREATE TABLE país(
	P_Id INT PRIMARY KEY AUTO_INCREMENT,
    P_CodigoISO VARCHAR(6)
);

CREATE TABLE estado(
	Est_Id  INT AUTO_INCREMENT PRIMARY KEY,
	Est_Sigla VARCHAR(4)
);

CREATE TABLE cidade(
	Ci_Id INT AUTO_INCREMENT PRIMARY KEY,
    Ci_Nome VARCHAR(60)
);

CREATE TABLE bairro(
	Bai_Id INT AUTO_INCREMENT PRIMARY KEY,
    Bai_Nome VARCHAR(60)
);

CREATE TABLE rua(
	R_Id INT AUTO_INCREMENT PRIMARY KEY,
    R_Nome VARCHAR(45)
);

CREATE TABLE clientes (
    Cli_Id INT AUTO_INCREMENT PRIMARY KEY,
    Cli_Nome VARCHAR(100) NOT NULL,
    Cli_PrefNome VARCHAR(60),
    Cli_SobreNome VARCHAR(45),
    Cli_Telefone VARCHAR(20),
    Cli_Email VARCHAR(100),
    Cli_DataNascimento DATE,
    Cli_CasaNumero VARCHAR(45),
    Cli_Cep VARCHAR(45),
    Cli_TotalComp INT,
    Cli_fk_pais INT,
    Cli_fk_estado INT,
    Cli_fk_bairro INT,
    Cli_fk_cidade INT,
    Cli_fk_rua INT,
    FOREIGN KEY (Cli_fk_pais) REFERENCES país(P_Id),
    FOREIGN KEY (Cli_fk_rua) REFERENCES rua(R_Id),
    FOREIGN KEY (Cli_fk_estado) REFERENCES estado(Est_Id),
    FOREIGN KEY (Cli_fk_bairro) REFERENCES bairro(Bai_Id),
	FOREIGN KEY (Cli_fk_cidade) REFERENCES cidade(Ci_Id)
);

CREATE TABLE tipo(
	Tip_Id INT PRIMARY KEY AUTO_INCREMENT,
    Tip_Tipo VARCHAR(45)
);

CREATE TABLE tamanho(
	Tam_Id INT PRIMARY KEY AUTO_INCREMENT,
    Tam_Tamanho VARCHAR(45)
);

CREATE TABLE produtos(
	Prod_Id INT AUTO_INCREMENT PRIMARY KEY,
    Prod_Nome VARCHAR(45),
    Prod_Recheio VARCHAR(45),
    Prod_Valor DECIMAL(10, 2),
    Prod_fk_tipo INT,
    Prod_fk_tamanho INT,
    FOREIGN KEY(Prod_fk_tipo) REFERENCES tipo(Tip_Id),
    FOREIGN KEY(Prod_fk_tamanho) REFERENCES tamanho(Tam_Id)
);


CREATE TABLE pedidos(
	Ped_Id INT AUTO_INCREMENT PRIMARY KEY,
    Ped_Quantidade INT,
    Ped_Data DATE,
    Ped_Total DECIMAL(10, 2),
    Ped_fk_produtos INT,
    Ped_fk_cliente INT,
    FOREIGN KEY(Ped_fk_produtos) REFERENCES produtos(Prod_Id),
    FOREIGN KEY(Ped_fk_cliente) REFERENCES clientes(Cli_Id)
);

CREATE TABLE tipoPagamento(
	TPag_Id INT PRIMARY KEY AUTO_INCREMENT,
    Tpag_Tipos VARCHAR(45)
);

CREATE TABLE pagamento(
	Pag_Id INT AUTO_INCREMENT PRIMARY KEY,
    Pag_fk_pedidos INT,
    Pag_fk_tipoPagamento INT,
    FOREIGN KEY(Pag_fk_pedidos) REFERENCES pedidos(Ped_Id),
    FOREIGN KEY(Pag_fk_tipoPagamento) REFERENCES tipoPagamento(TPag_Id)
);



INSERT INTO país (P_CodigoISO) VALUES ('BR');
INSERT INTO país (P_CodigoISO) VALUES ('US');
INSERT INTO país (P_CodigoISO) VALUES ('ES');
INSERT INTO país (P_CodigoISO) VALUES ('PT');
INSERT INTO país (P_CodigoISO) VALUES ('FR');

INSERT INTO estado (Est_Sigla) VALUES ('SP');
INSERT INTO estado (Est_Sigla) VALUES ('RJ');
INSERT INTO estado (Est_Sigla) VALUES ('MG');
INSERT INTO estado (Est_Sigla) VALUES ('BA');
INSERT INTO estado (Est_Sigla) VALUES ('RS');

INSERT INTO cidade (Ci_Nome) VALUES ('São Paulo');
INSERT INTO cidade (Ci_Nome) VALUES ('Rio de Janeiro');
INSERT INTO cidade (Ci_Nome) VALUES ('Belo Horizonte');
INSERT INTO cidade (Ci_Nome) VALUES ('Salvador');
INSERT INTO cidade (Ci_Nome) VALUES ('Porto Alegre');

INSERT INTO bairro (Bai_Nome) VALUES ('Centro');
INSERT INTO bairro (Bai_Nome) VALUES ('Jardins');
INSERT INTO bairro (Bai_Nome) VALUES ('Botafogo');
INSERT INTO bairro (Bai_Nome) VALUES ('Barra da Tijuca');
INSERT INTO bairro (Bai_Nome) VALUES ('Lagoa');

INSERT INTO rua (R_Nome) VALUES ('Paulista');
INSERT INTO rua (R_Nome) VALUES ('Augusta');
INSERT INTO rua (R_Nome) VALUES ('Laranjeiras');
INSERT INTO rua (R_Nome) VALUES ('Atlântica');
INSERT INTO rua (R_Nome) VALUES ('Oscar Freire');
    
INSERT INTO clientes (Cli_Nome, Cli_PrefNome, Cli_SobreNome, Cli_Telefone, Cli_Email, Cli_DataNascimento, Cli_CasaNumero, Cli_Cep, Cli_TotalComp, Cli_fk_pais, Cli_fk_estado, Cli_fk_bairro, Cli_fk_cidade, Cli_fk_rua) 
VALUES ('João Silva', 'João', 'Silva', '1111-1111', 'joao@email.com', '1980-01-01', '101', '12345-678', 5, 1, 1, 1, 1, 1);
INSERT INTO clientes (Cli_Nome, Cli_PrefNome, Cli_SobreNome, Cli_Telefone, Cli_Email, Cli_DataNascimento, Cli_CasaNumero, Cli_Cep, Cli_TotalComp, Cli_fk_pais, Cli_fk_estado, Cli_fk_bairro, Cli_fk_cidade, Cli_fk_rua) 
VALUES ('Maria Oliveira', 'Maria', 'Oliveira', '2222-2222', 'maria@email.com', '1990-02-02', '202', '23456-789', 3, 2, 2, 2, 2, 2);
INSERT INTO clientes (Cli_Nome, Cli_PrefNome, Cli_SobreNome, Cli_Telefone, Cli_Email, Cli_DataNascimento, Cli_CasaNumero, Cli_Cep, Cli_TotalComp, Cli_fk_pais, Cli_fk_estado, Cli_fk_bairro, Cli_fk_cidade, Cli_fk_rua) 
VALUES ('Carlos Souza', 'Carlos', 'Souza', '3333-3333', 'carlos@email.com', '1975-03-03', '303', '34567-890', 7, 3, 3, 3, 3, 3);
INSERT INTO clientes (Cli_Nome, Cli_PrefNome, Cli_SobreNome, Cli_Telefone, Cli_Email, Cli_DataNascimento, Cli_CasaNumero, Cli_Cep, Cli_TotalComp, Cli_fk_pais, Cli_fk_estado, Cli_fk_bairro, Cli_fk_cidade, Cli_fk_rua) 
VALUES ('Ana Lima', 'Ana', 'Lima', '4444-4444', 'ana@email.com', '1985-04-04', '404', '45678-901', 10, 4, 4, 4, 4, 4);
INSERT INTO clientes (Cli_Nome, Cli_PrefNome, Cli_SobreNome, Cli_Telefone, Cli_Email, Cli_DataNascimento, Cli_CasaNumero, Cli_Cep, Cli_TotalComp, Cli_fk_pais, Cli_fk_estado, Cli_fk_bairro, Cli_fk_cidade, Cli_fk_rua) 
VALUES ('Pedro Santos', 'Pedro', 'Santos', '5555-5555', 'pedro@email.com', '2000-05-05', '505', '56789-012', 2, 5, 5, 5, 5, 5);

INSERT INTO tipo (Tip_Tipo) VALUES ('Vegano');
INSERT INTO tipo (Tip_Tipo) VALUES ('Vegetariano');
INSERT INTO tipo (Tip_Tipo) VALUES ('Sem Lactose');
INSERT INTO tipo (Tip_Tipo) VALUES ('Lanche');
INSERT INTO tipo (Tip_Tipo) VALUES ('Bebida');

INSERT INTO tamanho (Tam_Tamanho) VALUES ('Pequeno');
INSERT INTO tamanho (Tam_Tamanho) VALUES ('Médio');
INSERT INTO tamanho (Tam_Tamanho) VALUES ('Grande');
INSERT INTO tamanho (Tam_Tamanho) VALUES ('Gigante');
INSERT INTO tamanho (Tam_Tamanho) VALUES ('Familiar');

INSERT INTO produtos (Prod_Nome, Prod_Recheio, Prod_Valor, Prod_fk_tipo, Prod_fk_tamanho) VALUES ('Pastel de Carne', 'Carne Moída', 5.50, 1, 2);
INSERT INTO produtos (Prod_Nome, Prod_Recheio, Prod_Valor, Prod_fk_tipo, Prod_fk_tamanho) VALUES ('Pastel de Frango', 'Frango Desfiado', 6.00, 1, 2);
INSERT INTO produtos (Prod_Nome, Prod_Recheio, Prod_Valor, Prod_fk_tipo, Prod_fk_tamanho) VALUES ('Pastel de Queijo', 'Queijo Muçarela', 5.00, 1, 1);
INSERT INTO produtos (Prod_Nome, Prod_Recheio, Prod_Valor, Prod_fk_tipo, Prod_fk_tamanho) VALUES ('Pastel Doce', 'Chocolate', 7.50, 2, 2);
INSERT INTO produtos (Prod_Nome, Prod_Recheio, Prod_Valor, Prod_fk_tipo, Prod_fk_tamanho) VALUES ('Sanduíche', 'Presunto e Queijo', 8.00, 4, 3);
INSERT INTO produtos (Prod_Nome, Prod_Recheio, Prod_Valor, Prod_fk_tipo, Prod_fk_tamanho) VALUES ('Pastel de Queijo', 'Queijo e Bacon', 5.00, 1, 1);
INSERT INTO produtos (Prod_Nome, Prod_Recheio, Prod_Valor, Prod_fk_tipo, Prod_fk_tamanho) VALUES ('Pastelzão', 'Queijo e Bacon', 5.00, 1, 1);

INSERT INTO pedidos (Ped_Quantidade, Ped_Data, Ped_Total, Ped_fk_produtos, Ped_fk_cliente) VALUES (3, '2024-01-01', 16.50, 1, 1);
INSERT INTO pedidos (Ped_Quantidade, Ped_Data, Ped_Total, Ped_fk_produtos, Ped_fk_cliente) VALUES (2, '2024-01-02', 12.00, 2, 2);
INSERT INTO pedidos (Ped_Quantidade, Ped_Data, Ped_Total, Ped_fk_produtos, Ped_fk_cliente) VALUES (1, '2024-03-03', 5.00, 3, 3);
INSERT INTO pedidos (Ped_Quantidade, Ped_Data, Ped_Total, Ped_fk_produtos, Ped_fk_cliente) VALUES (5, '2024-04-04', 37.50, 4, 4);
INSERT INTO pedidos (Ped_Quantidade, Ped_Data, Ped_Total, Ped_fk_produtos, Ped_fk_cliente) VALUES (4, '2024-05-05', 32.00, 4, 5);
INSERT INTO pedidos (Ped_Quantidade, Ped_Data, Ped_Total, Ped_fk_produtos, Ped_fk_cliente) VALUES (3, '2024-06-01', 16.50, 1, 1);
INSERT INTO pedidos (Ped_Quantidade, Ped_Data, Ped_Total, Ped_fk_produtos, Ped_fk_cliente) VALUES (2, '2024-07-02', 12.00, 2, 2);
INSERT INTO pedidos (Ped_Quantidade, Ped_Data, Ped_Total, Ped_fk_produtos, Ped_fk_cliente) VALUES (1, '2024-08-03', 5.00, 3, 3);
INSERT INTO pedidos (Ped_Quantidade, Ped_Data, Ped_Total, Ped_fk_produtos, Ped_fk_cliente) VALUES (5, '2024-09-04', 37.50, 4, 4);
INSERT INTO pedidos (Ped_Quantidade, Ped_Data, Ped_Total, Ped_fk_produtos, Ped_fk_cliente) VALUES (4, '2024-10-05', 32.00, 2, 5 );


INSERT INTO tipoPagamento (Tpag_Tipos) VALUES ('Cartão de Crédito');
INSERT INTO tipoPagamento (Tpag_Tipos) VALUES ('Cartão de Débito');
INSERT INTO tipoPagamento (Tpag_Tipos) VALUES ('Dinheiro');
INSERT INTO tipoPagamento (Tpag_Tipos) VALUES ('Pix');
INSERT INTO tipoPagamento (Tpag_Tipos) VALUES ('Boleto');

INSERT INTO pagamento (Pag_fk_pedidos, Pag_fk_tipoPagamento) VALUES (1, 1);
INSERT INTO pagamento (Pag_fk_pedidos, Pag_fk_tipoPagamento) VALUES (2, 2);
INSERT INTO pagamento (Pag_fk_pedidos, Pag_fk_tipoPagamento) VALUES (3, 3);
INSERT INTO pagamento (Pag_fk_pedidos, Pag_fk_tipoPagamento) VALUES (4, 4);
INSERT INTO pagamento (Pag_fk_pedidos, Pag_fk_tipoPagamento) VALUES (2, 5);


CREATE VIEW Quest1 AS
SELECT 
    cli.Cli_Nome,
    p.Prod_Nome,
    p.Prod_Recheio,
    cli.Cli_DataNascimento,
    YEAR(CURDATE()) - YEAR(cli.Cli_DataNascimento) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(cli.Cli_DataNascimento, '%m%d')) AS idade
FROM pedidos ped
JOIN clientes cli ON cli.Cli_Id = ped.Ped_fk_cliente
JOIN produtos p ON p.Prod_Id = ped.Ped_fk_produtos
JOIN tipo t ON p.Prod_fk_tipo = t.Tip_Id
WHERE t.Tip_Tipo = 'Vegano';

CREATE VIEW Quest2 AS
SELECT 
    cli.Cli_Nome,
    MONTH(ped.Ped_Data) AS Mes,
    COUNT(ped.Ped_Id) AS Numero_Pedidos
FROM 
    pedidos ped
JOIN 
    clientes cli ON cli.Cli_Id = ped.Ped_fk_cliente
WHERE 
    YEAR(ped.Ped_Data) = 2024 
GROUP BY 
    cli.Cli_Nome, MONTH(ped.Ped_Data)
ORDER BY 
    Mes, Numero_Pedidos DESC;


CREATE VIEW Quest3 AS
SELECT * FROM produtos WHERE Prod_Recheio LIKE '%Queijo e Bacon%';



CREATE VIEW Quest4 AS
SELECT SUM(Ped_Total) AS Valor_Total_Vendas
FROM pedidos
JOIN produtos ON produtos.Prod_Id = pedidos.Ped_fk_produtos
WHERE produtos.Prod_Nome LIKE '%Pastel%';



CREATE VIEW Quest5 AS
SELECT 
    ped.Ped_Id,
    cli.Cli_Nome,
    ped.Ped_Quantidade,
    ped.Ped_Data,
    ped.Ped_Total
FROM 
    pedidos ped
JOIN 
    clientes cli ON cli.Cli_Id = ped.Ped_fk_cliente
WHERE 
    ped.Ped_fk_produtos IN (SELECT Prod_Id FROM produtos WHERE Prod_Nome LIKE '%Pastel%')
    AND ped.Ped_fk_produtos IS NOT NULL  
ORDER BY 
    ped.Ped_Id;





CREATE VIEW Quest6 AS
SELECT 
    p.Prod_Nome,
    SUM(ped.Ped_Quantidade) AS Total_Vendas
FROM 
    pedidos ped
JOIN 
    produtos p ON p.Prod_Id = ped.Ped_fk_produtos
GROUP BY 
    p.Prod_Nome
ORDER BY 
    Total_Vendas ASC;
