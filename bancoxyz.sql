-- Criação da database do Banco XYZ
create database sistemaBancoxyz;
use sistemaBancoxyz;

-- Criação da tabela de clientes
CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
	cpf VARCHAR(15) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    profissao VARCHAR(50) NOT NULL,
    id_conta_bancaria VARCHAR(20) UNIQUE
);

-- Criação da tabela de contas bancárias
CREATE TABLE conta_bancaria (
    id_conta_bancaria VARCHAR(20) PRIMARY KEY,
    tipo_conta_bancaria VARCHAR(20) NOT NULL,
    limite_credito DECIMAL(10, 2),
    saldo DECIMAL(10, 2),
    cpf_cliente VARCHAR(15),
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf)
);

-- Inserção de dados de clientes
INSERT INTO clientes (nome, cpf, data_nascimento, endereco, telefone, profissao, id_conta_bancaria)
VALUES 
("João Silva", "456.542.012-98", "1990-01-02", "Rua A, 10", "(24) 96542-9854", "Engenheiro","54216-9"),
("Maria Nascimento", "321.054.048-91", "1985-12-11", "Rua B, 120", "(21) 94651-2578", "Médica","58412-8"),
("Pedro Oliveira", "621.230.032-12", "1995-03-09", "Rua C, 56", "(99) 97945-5412", "Advogado","24314-9"),
("Luciana Pereira", "329.203.300-11", "1992-04-01", "Rua D, 78", "(71) 94545-9745", "Dentista","64215-8"),
("Ana Santos", "487.642.325-12", "1991-09-02", "Rua E, 255", "(51) 93209-5469", "Engenheira","54210-9"),
("Welliton Costa", "465.214.354-85", "1988-10-10", "Rua F, 45", "(61) 96542-6498", "Professor","98452-8"),
("Julia Gomes", "645.598.321-96", "1994-01-10", "Rua G, 90", "(14) 99745-6445", "Arquiteta","45621-9"),
("Thiago Almeida", "645.210.987-89", "1989-02-08", "Rua H, 40", "(19) 94584-6452", "Contador","45210-8");

-- Inserção de dados bancários dos clientes
INSERT INTO conta_bancaria (id_conta_bancaria, tipo_conta_bancaria, limite_credito, saldo, cpf_cliente)
VALUES 
("54216-9", "Corrente", 10000.00, 5000.00, "456.542.012-98"),
("58412-8", "Poupança", 5000.00, 1000.00, "321.054.048-91"),
("24314-9", "Corrente", 15000.00, 7500.00, "621.230.032-12"),
("64215-8", "Poupança", 8000.00, 2000.00, "329.203.300-11"),
("54210-9", "Corrente", 20000.00, 10000.00, "487.642.325-12"),
("98452-8", "Poupança", 1000.00, 500.00, "465.214.354-85"),
("45621-9", "Corrente", 5000.00, 2000.00, "645.598.321-96"),
("45210-8", "Poupança", 7000.00, 1500.00, "645.210.987-89");

-- Transferir R$100,00 da conta 54216-9 para a conta 58412-8
UPDATE conta_bancaria SET saldo = saldo - 100 WHERE id_conta_bancaria = '54216-9';
UPDATE conta_bancaria SET saldo = saldo + 100 WHERE id_conta_bancaria = '58412-8';

-- Depositar R$500,00 na conta 24314-9
UPDATE conta_bancaria SET saldo = saldo + 500 WHERE id_conta_bancaria = '24314-9';

-- Sacar R$50,00 da conta 64215-8
UPDATE conta_bancaria SET saldo = saldo - 50 WHERE id_conta_bancaria = '64215-8';

-- Transferir R$200,00 da conta 54210-9 para a conta 98452-8
UPDATE conta_bancaria SET saldo = saldo - 200 WHERE id_conta_bancaria = '54210-9';
UPDATE conta_bancaria SET saldo = saldo + 200 WHERE id_conta_bancaria = '98452-8';

-- Depositar R$1000,00 na conta 45621-9
UPDATE conta_bancaria SET saldo = saldo + 1000 WHERE id_conta_bancaria = '45621-9';

-- Mascarar conta bancária do cliente para uma maior segurança
SELECT nome, MASK(id_conta_bancaria, 'X') as id_conta_bancaria_mascarada
FROM nome;

-- Buscar a conta bancária do cliente chamado João Silva
SELECT id_conta_bancaria FROM clientes WHERE nome = 'João Silva';

-- Buscar o nome do cliente que mora na Rua B, 120
SELECT nome FROM clientes WHERE endereco = 'Rua B, 120';

-- Buscar o cpf do cliente que é contador
SELECT cpf FROM clientes WHERE profissao = 'Contador';