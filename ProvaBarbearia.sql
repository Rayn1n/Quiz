CREATE SCHEMA barbearia;

USE	barbearia;

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

CREATE TABLE numeroCasa(
	Nc_Id INT PRIMARY KEY AUTO_INCREMENT,
    Nc_num VARCHAR(10)
);

CREATE TABLE clientes (
    Cli_Id INT AUTO_INCREMENT PRIMARY KEY,
    Cli_Nome VARCHAR(100) NOT NULL,
    Cli_PrefNome VARCHAR(60),
    Cli_SobreNome VARCHAR(45),
    Cli_Telefone VARCHAR(20),
    Cli_Email VARCHAR(100),
    Cli_DataNascimento DATE,
    Cli_Cep VARCHAR(45),
    Cli_fk_pais INT,
    Cli_fk_estado INT,
    Cli_fk_bairro INT,
    Cli_fk_numeroCasa INT,
    Cli_fk_cidade INT,
    Cli_fk_rua INT,
    FOREIGN KEY (Cli_fk_pais) REFERENCES país(P_Id),
    FOREIGN KEY (Cli_fk_rua) REFERENCES rua(R_Id),
    FOREIGN KEY (Cli_fk_estado) REFERENCES estado(Est_Id),
    FOREIGN KEY (Cli_fk_bairro) REFERENCES bairro(Bai_Id),
	FOREIGN KEY (Cli_fk_cidade) REFERENCES cidade(Ci_Id),
    FOREIGN KEY (Cli_fk_numeroCasa) REFERENCES numeroCasa(Nc_Id)
);

CREATE TABLE tipo(
	Tip_Id INT AUTO_INCREMENT PRIMARY KEY,
    Tip_Tipo VARCHAR(45)
);

CREATE TABLE serviços(
	Serv_Id INT AUTO_INCREMENT PRIMARY KEY,
    Serv_Nome VARCHAR(45),
    Serv_Status VARCHAR(45),
    Serv_Valor DECIMAL(10, 2),
    Serv_Data DATETIME,
    Serv_fk_tipo INT,
    FOREIGN KEY (Serv_fk_tipo) REFERENCES tipo(Tip_Id)
);
CREATE TABLE Statu(
	Stat_Id INT PRIMARY KEY AUTO_INCREMENT,
    Stat_st VARCHAR(45)
);

CREATE TABLE produtos(
	Prod_Id INT PRIMARY KEY AUTO_INCREMENT,
    Prod_Nome VARCHAR(45),
    Prod_Quantidade INT,
    Prod_Valor DECIMAL(10, 2),
    Prod_fk_tipo INT,
    FOREIGN KEY (Prod_fk_tipo) REFERENCES tipo(Tip_Id)
);

CREATE TABLE formapagamento(
	Fpag_Id INT PRIMARY KEY AUTO_INCREMENT,
    Fpag_tipo VARCHAR(45)
);



CREATE TABLE pagamento(
	Pag_Id INT PRIMARY KEY AUTO_INCREMENT,
    Pag_quantidade INT,
    Pag_fk_serviços INT,
    Pag_fk_clientes INT,
    Pag_fk_produtos INT,
    Pag_fk_formapagamento INT,
    Pag_fk_stat INT,
    FOREIGN KEY(Pag_fk_stat) REFERENCES statu(Stat_Id),
    FOREIGN KEY (Pag_fk_serviços) REFERENCES serviços(Serv_Id),
    FOREIGN KEY (Pag_fk_clientes) REFERENCES clientes(Cli_Id),
    FOREIGN KEY (Pag_fk_produtos) REFERENCES produtos(Prod_Id),
    FOREIGN KEY (Pag_fk_formapagamento) REFERENCES formapagamento(Fpag_Id)
);
ALTER TABLE `barbearia`.`pagamento` 
ADD COLUMN `Pag_Data` VARCHAR(7) NULL AFTER `Pag_fk_stat`;

CREATE TABLE totalserviços(
	Tot_Id INT PRIMARY KEY AUTO_INCREMENT,
    Tot_Total INT
);
CREATE TABLE maior_pagamento(
	Maior_Id INT PRIMARY KEY AUTO_INCREMENT,
    Maior_valor FLOAT
);

CREATE TABLE Produto_Mais_Caro (
    Prod_Id INT,
    Prod_Nome VARCHAR(45),
    Valor FLOAT,
    FOREIGN KEY (Prod_Id) REFERENCES Produtos(Prod_Id)
);

INSERT INTO numerocasa(Nc_num) VALUES('22');
INSERT INTO numerocasa(Nc_num) VALUES('13');
INSERT INTO numerocasa(Nc_num) VALUES('16');
INSERT INTO numerocasa(Nc_num) VALUES('8');
INSERT INTO numerocasa(Nc_num) VALUES('10');

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

INSERT INTO clientes(Cli_Nome, Cli_PrefNome, Cli_SobreNome, Cli_Telefone, Cli_Email, Cli_DataNascimento, Cli_Cep, Cli_fk_pais, Cli_fk_estado, Cli_fk_bairro, Cli_fk_numeroCasa, Cli_fk_cidade, Cli_fk_rua)
VALUES ('João', 'João', 'Silva', '241512', 'jaoo@gmail.com', '2000-03-15', '325432', '1', '1', '1', '1', '1', '1'),
	   ('João', 'João', 'Silva', '241512', 'jaoo@gmail.com', '2003-01-03', '565432', '2', '2', '2', '2', '2', '2'),
       ('João', 'João', 'Silva', '241512', 'jaoo@gmail.com', '2002-08-12', '875432', '3', '3', '3', '3', '3', '3'),
       ('João', 'João', 'Silva', '241512', 'jaoo@gmail.com', '2001-02-13', '125432', '4', '4', '4', '4', '4', '4'),
       ('Wagner', 'Wagner', 'Carvalho', '234312', 'wagnerzw@gmail.com', '2005-06-15', '675432', '5', '5', '5', '5', '5', '5');
       
INSERT INTO formapagamento (Fpag_tipo) VALUES ('Cartão de Crédito');
INSERT INTO formapagamento (Fpag_tipo) VALUES ('Cartão de Débito');
INSERT INTO formapagamento (Fpag_tipo) VALUES ('Dinheiro');
INSERT INTO formapagamento (Fpag_tipo) VALUES ('Pix');
INSERT INTO formapagamento (Fpag_tipo) VALUES ('Boleto');

INSERT INTO `barbearia`.`tipo` (`Tip_Tipo`) VALUES ('Corte');
INSERT INTO `barbearia`.`tipo` (`Tip_Tipo`) VALUES ('Produto');
INSERT INTO `barbearia`.`tipo` (`Tip_Tipo`) VALUES ('Lavagem');

INSERT INTO `barbearia`.`produtos` (`Prod_Nome`, `Prod_Quantidade`, `Prod_Valor`, `Prod_fk_tipo`) VALUES ('Gillette', '50', '3', '2');
INSERT INTO `barbearia`.`produtos` (`Prod_Nome`, `Prod_Quantidade`, `Prod_Valor`, `Prod_fk_tipo`) VALUES ('Espuma para babear', '89', '5', '2');
INSERT INTO `barbearia`.`produtos` (`Prod_Nome`, `Prod_Quantidade`, `Prod_Valor`, `Prod_fk_tipo`) VALUES ('Tesoura', '98', '12', '2');

INSERT INTO `barbearia`.`serviços` (`Serv_Nome`, `Serv_Status`, `Serv_Valor`, `Serv_Data`, `Serv_fk_tipo`) VALUES ('Americano', 'Incompleto', '29', '2024-09-23 10:30', '1');
INSERT INTO `barbearia`.`serviços` (`Serv_Nome`, `Serv_Status`, `Serv_Valor`, `Serv_Data`, `Serv_fk_tipo`) VALUES ('Lavagem do Cabelo', 'Completo', '30', '2024-08-13 17:30', '3');
INSERT INTO `barbearia`.`serviços` (`Serv_Nome`, `Serv_Status`, `Serv_Valor`, `Serv_Data`, `Serv_fk_tipo`) VALUES ('Degradê', 'Completo', '20', '2024-07-15 11:20', '1');

INSERT INTO `barbearia`.`statu` (`Stat_st`) VALUES ('Pago');
INSERT INTO `barbearia`.`statu` (`Stat_st`) VALUES ('Em aberto');

INSERT INTO `barbearia`.`pagamento` (`Pag_quantidade`, `Pag_fk_clientes`, `Pag_fk_produtos`, `Pag_fk_formapagamento`, `Pag_fk_stat`) VALUES ('7', '1', '1', '1', '1');
INSERT INTO `barbearia`.`pagamento` (`Pag_fk_serviços`, `Pag_fk_clientes`, `Pag_fk_formapagamento`, `Pag_fk_stat`) VALUES ('1', '2', '2', '2');
INSERT INTO `barbearia`.`pagamento` (`Pag_quantidade`, `Pag_fk_serviços`, `Pag_fk_clientes`, `Pag_fk_produtos`, `Pag_fk_formapagamento`, `Pag_fk_stat`) VALUES ('4', '2', '3', '2', '3', '1');

CREATE VIEW  Ver_onde_o_cliente_mora AS
SELECT 
    p.P_CodigoISO AS país,
    b.Bai_Nome AS bairro,
    c.Ci_Nome AS cidade,
    e.Est_Sigla AS estado
FROM clientes cli
JOIN país p ON cli.Cli_fk_pais = p.P_Id
JOIN bairro b ON cli.Cli_fk_bairro = b.Bai_Id
JOIN cidade c ON cli.Cli_fk_cidade = c.Ci_Id
JOIN estado e ON cli.Cli_fk_estado = e.Est_Id;

CREATE VIEW ver_servicos_prestados AS
SELECT 
    s.Serv_Nome AS serviço, s.Serv_Valor, s.Serv_Data, s.Serv_Status,
    t.Tip_Tipo AS tipo_serviço, cli.Cli_Nome AS cliente
FROM serviços s
JOIN tipo t ON s.Serv_fk_tipo = t.Tip_Id
JOIN clientes cli ON cli.Cli_Id = (SELECT Pag_fk_clientes FROM pagamento WHERE Pag_fk_serviços = s.Serv_Id);

CREATE VIEW ver_produtos_vendidos AS
SELECT 
    p.Prod_Nome AS produto, p.Prod_Quantidade AS quantidade_disponível, 
    pag.Pag_quantidade AS quantidade_comprada, p.Prod_Valor, 
    cli.Cli_Nome AS cliente, f.Fpag_tipo AS forma_pagamento
FROM produtos p
JOIN pagamento pag ON pag.Pag_fk_produtos = p.Prod_Id
JOIN clientes cli ON pag.Pag_fk_clientes = cli.Cli_Id
JOIN formapagamento f ON pag.Pag_fk_formapagamento = f.Fpag_Id;

CREATE VIEW ver_pagamentos AS
SELECT 
    cli.Cli_Nome AS cliente, 
    pag.Pag_quantidade AS quantidade,
    f.Fpag_tipo AS forma_pagamento, 
    st.Stat_st AS status
FROM pagamento pag
JOIN clientes cli ON pag.Pag_fk_clientes = cli.Cli_Id
JOIN formapagamento f ON pag.Pag_fk_formapagamento = f.Fpag_Id
JOIN statu st ON pag.Pag_fk_stat = st.Stat_Id;





DELIMITER //

CREATE TRIGGER atualizar_quantidade_produto
AFTER INSERT ON pagamento
FOR EACH ROW
BEGIN
    UPDATE produtos
    SET Prod_Quantidade = Prod_Quantidade - NEW.Pag_quantidade
    WHERE Prod_Id = NEW.Pag_fk_produtos;
END //

DELIMITER //
CREATE TRIGGER verificar_maior_pagamento
AFTER INSERT ON pagamento
FOR EACH ROW
BEGIN
    DECLARE max_pagamento DECIMAL(10, 2);
    SELECT MAX(Pag_quantidade * (SELECT Prod_Valor FROM produtos WHERE Prod_Id = NEW.Pag_fk_produtos)) INTO max_pagamento
    FROM pagamento;
    INSERT INTO maior_pagamento (Maior_valor)
    VALUES (max_pagamento);
END //

DELIMITER //
CREATE TRIGGER somar_quantidade_servicos
AFTER INSERT ON pagamento
FOR EACH ROW
BEGIN
    UPDATE totalserviços
    SET Tot_Total = Tot_Total+ 1 
    WHERE Tot_Id = 1;
END //

DELIMITER ;

