CREATE DATABASE curso_sql;

USE curso_sql;

CREATE TABLE funcionarios
(
    id int unsigned not null auto_increment,
    nome varchar(45) not null,
    salario double not null default '0',
    departamento varchar(45) not null,
    PRIMARY KEY (id)
);

CREATE TABLE veiculos
(
    id int unsigned not null auto_increment,
    funcionario_id int unsigned default null,
    veiculo varchar(45) not null default '',
    placa varchar(10) not null default '',
    PRIMARY KEY (id),
    CONSTRAINT fk_veiculos_funcionarios FOREIGN KEY (funcionario_id) REFERENCES funcionarios (id)
);

CREATE TABLE salarios
(
    faixa varchar(45) not null,
    inicio double not null,
    fim double not null,
    PRIMARY KEY (faixa)
);

ALTER TABLE funcionarios CHANGE COLUMN nome nome_func varchar(45) not null;
ALTER TABLE funcionarios CHANGE COLUMN nome_func nome varchar(45) not null;

DROP TABLE salarios;

CREATE INDEX departamentos ON funcionarios (departamento);
CREATE INDEX nomes ON funcionarios (nome(6));

INSERT INTO funcionarios (id, nome, salario, departamento)
VALUES (1, 'Fernando', 1400, 'TI');
INSERT INTO funcionarios (id, nome, salario, departamento)
VALUES (2, 'Guilherme', 2500, 'Jurídico');
INSERT INTO funcionarios (nome, salario, departamento)
VALUES ('Fabio', 1700, 'TI');
INSERT INTO funcionarios (nome, salario, departamento)
VALUES ('José', 1800, 'Marketing');
INSERT INTO funcionarios (nome, salario, departamento)
VALUES ('Isabela', 2200, 'Jurídico');

SELECT * FROM funcionarios;
SELECT * FROM funcionarios WHERE salario > 2000;
SELECT * FROM funcionarios WHERE nome = 'José';
SELECT * FROM funcionarios WHERE id = 3;

UPDATE funcionarios SET salario = salario * 1.1;
UPDATE funcionarios SET salario = salario * 1.1 WHERE id = 1;
SELECT * FROM funcionarios;

SET SQL_SAFE_UPDATES = 1;
SET SQL_SAFE_UPDATES = 0;

UPDATE funcionarios SET salario = ROUND(salario * 1.1, 2);

DELETE FROM funcionarios WHERE id = 4;

INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (1, 'Carro', 'SB-001');
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (1, 'Carro', 'SB-002');

SELECT * FROM veiculos;

UPDATE veiculos SET funcionario_id = 5 WHERE id = 2;

INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista Jr', 1000, 2000);
INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista Pleno', 2000, 4000);

SELECT * FROM salarios;

SELECT * FROM funcionarios f WHERE salario > 2000;

SELECT * FROM funcionarios;
SELECT * FROM veiculos;

SELECT * FROM funcionarios INNER JOIN veiculos ON funcionario_id = funcionarios.id;

SELECT * FROM funcionarios LEFT JOIN veiculos ON funcionario_id = funcionarios.id;

SELECT * FROM funcionarios RIGHT JOIN veiculos ON funcionario_id = funcionarios.id;

SELECT * FROM funcionarios LEFT JOIN veiculos ON funcionario_id = funcionarios.id
UNION
SELECT * FROM funcionarios RIGHT JOIN veiculos ON funcionario_id = funcionarios.id;


INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (null, 'Moto', 'SB-0003');

CREATE TABLE cpfs
(
    id int unsigned not null,
    cpf varchar(14) not null,
    PRIMARY KEY (id),
    CONSTRAINT fk_cpf FOREIGN KEY (id) REFERENCES funcionarios(id)
)

INSERT INTO cpfs (id, cpf) VALUES (1, '111.111.111-11');
INSERT INTO cpfs (id, cpf) VALUES (2, '222.222.222-22');
INSERT INTO cpfs (id, cpf) VALUES (3, '333.333.333-33');
INSERT INTO cpfs (id, cpf) VALUES (5, '555.555.555-55');

SELECT * FROM funcionarios INNER JOIN cpfs on funcionarios.id = cpfs.id;
SELECT * FROM funcionarios INNER JOIN cpfs USING(id);

CREATE TABLE clientes
(
    id int unsigned not null auto_increment,
    nome varchar(45) not null,
    quem_indicou int unsigned,
    PRIMARY KEY (id),
    CONSTRAINT fk_quem_indicou FOREIGN KEY (quem_indicou) REFERENCES clientes (id)
);

INSERT INTO clientes (id, nome, quem_indicou) VALUES (1, 'André', null);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (2, 'Samuel', 1);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (3, 'Carlos', 2);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (4, 'Rafael', 1);

SELECT a.nome AS CLIENTE, b.nome as 'QUEM INDICOU'
FROM clientes a JOIN clientes b on a.quem_indicou = b.id;

SELECT * FROM funcionarios
INNER JOIN veiculos ON funcionario_id = funcionarios.id
INNER JOIN cpfs ON cpfs.id = funcionarios.id;

CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 1700;

SELECT * FROM funcionarios_a;

UPDATE funcionarios SET salario = 1500 WHERE id = 3;

DROP VIEW funcionarios_a;

CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 2000;

SELECT COUNT(*) FROM funcionarios;

SELECT COUNT(*) FROM funcionarios WHERE salario > 2000;

SELECT COUNT(*) FROM funcionarios WHERE salario > 1600;

SELECT COUNT(*) FROM funcionarios WHERE salario > 1600 AND departamento = 'Jurídico';

SELECT SUM(salario) FROM funcionarios;

SELECT SUM(salario) FROM funcionarios WHERE departamento = 'TI';

SELECT AVG(salario) FROM funcionarios;

SELECT AVG(salario) FROM funcionarios WHERE departamento = 'TI';

SELECT MAX(salario) FROM funcionarios;

SELECT MAX(salario) FROM funcionarios WHERE departamento = 'TI';

SELECT MIN(salario) FROM funcionarios;

SELECT MIN(salario) FROM funcionarios WHERE departamento = 'TI';

SELECT departamento FROM funcionarios;

SELECT DISTINCT(departamento) FROM funcionarios;

SELECT * FROM funcionarios;

SELECT * FROM funcionarios ORDER BY nome;

SELECT * FROM funcionarios ORDER BY nome DESC;

SELECT * FROM funcionarios ORDER BY salario;

SELECT * FROM funcionarios ORDER BY departamento, salario;

SELECT * FROM funcionarios ORDER BY departamento DESC, salario DESC;

SELECT * FROM funcionarios LIMIT 2;

SELECT * FROM funcionarios LIMIT 2 OFFSET 1;

SELECT * FROM funcionarios LIMIT 1, 2;

SELECT departamento, AVG(salario) FROM funcionarios
GROUP BY departamento;

SELECT departamento, AVG(salario) FROM funcionarios
GROUP BY departamento HAVING AVG(salario) > 2000;

SELECT departamento, COUNT(*) FROM funcionarios GROUP BY departamento;

SELECT nome FROM funcionarios WHERE departamento IN
(SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000);

SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento;
SELECT nome FROM funcionarios WHERE departamento = 'Jurídico';

CREATE USER 'andre'@'localhost' IDENTIFIED BY 'Milani123456#';
GRANT ALL ON curso_sql.* TO 'andre'@'localhost';

CREATE USER 'andre'@'%' IDENTIFIED BY 'Andreviagem123#';
GRANT SELECT ON curso_sql.* TO 'andre'@'%';
/* GRANT ALL ON curso_sql.* TO 'andre'@'%';*/
GRANT INSERT ON curso_sql.funcionarios TO 'andre'@'%';

REVOKE INSERT ON curso_sql.funcionarios FROM 'andre'@'%';
REVOKE SELECT ON curso_sql.* FROM 'andre'@'%';

GRANT SELECT ON curso_sql.funcionarios TO 'andre'@'%';
GRANT SELECT ON curso_sql.veiculos TO 'andre'@'%';

REVOKE INSERT ON curso_sql.funcionarios FROM 'andre'@'%';
REVOKE INSERT ON curso_sql.veiculos FROM 'andre'@'%';

REVOKE ALL ON curso_sql.* FROM 'andre'@'localhost';

DROP USER 'andre'@'%';
DROP USER 'andre'@'localhost';

SELECT user FROM mysql.user;

SHOW GRANTS FOR 'andre'@'%';

#====== Avaliação módulo 7 =========

CREATE USER 'andre'@'localhost' IDENTIFIED BY 'Andre123#';

GRANT * TO veiculos ON 'andre';

GRANT ALL ON veiculos TO 'andre'@'localhost';

SHOW GRANTS FOR 'andre'@'localhost';

REVOKE UPDATE ON veiculos FROM 'andre'@'localhost';

GRANT SELECT ON veiculos TO 'andre'@'localhost';

REVOKE ALL ON veiculos TO 'andre'@'localhost';

SHOW ENGINES;

CREATE TABLE contas_bancarias
(
    id int unsigned not null auto_increment,
    titular varchar(45) not null,
    saldo double not null,
    PRIMARY KEY (id)
) engine = InnoDB;

INSERT INTO contas_bancarias (titular, saldo) VALUES ('André', 1000);
INSERT INTO contas_bancarias (titular, saldo) VALUES ('Carlos', 2000);

SELECT * FROM contas_bancarias;

start transaction;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
rollback;

start transaction;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
commit;

CREATE TABLE pedidos
(
    id int unsigned not null auto_increment,
    descricao varchar(100) not null,
    valor double not null default '0',
    pago varchar(3) not null default 'Não',
    PRIMARY KEY (id)
);

INSERT INTO pedidos (descricao, valor) VALUES ('TV', 3000);
INSERT INTO pedidos (descricao, valor) VALUES ('Geladeira', 1400);
INSERT INTO pedidos (descricao, valor) VALUES ('DVD Player', 300);

UPDATE pedidos SET pago = 'Sim' WHERE id = 8;

SELECT * FROM pedidos;

DELIMITER $$
CREATE PROCEDURE limpa_pedidos()
BEGIN
    DELETE FROM pedidos WHERE pago = 'Não';
END $$
DELIMITER ;

CALL limpa_pedidos();

CREATE TABLE estoque
(
    id int unsigned not null auto_increment,
    descricao varchar(50) not null,
    quantidade int not null,
    PRIMARY KEY (id)
);

CREATE TRIGGER gatilho_limpa_pedidos
    BEFORE INSERT
    ON estoque
    FOR EACH ROW
    CALL limpa_pedidos();

SELECT * FROM pedidos;

INSERT INTO estoque (descricao, quantidade) VALUES ('Fogão', 5);

INSERT INTO estoque (descricao, quantidade) VALUES ('Forno', 3);