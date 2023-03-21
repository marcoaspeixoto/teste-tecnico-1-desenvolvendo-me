CREATE DATABASE exercicio3_1;

USE exercicio3_1;

CREATE TABLE tipos
(
    codigo int unsigned not null auto_increment,
    tipo varchar(40) not null,
    PRIMARY KEY (codigo)
);

CREATE TABLE instrutores
(
    codigo int unsigned not null auto_increment,
    instrutor varchar(45) not null,
    telefone char(9) not null,
    PRIMARY KEY (codigo)
);

CREATE TABLE cursos
(
    codigo int unsigned not null auto_increment,
    curso varchar(45) not null,
    tipo_codigo int unsigned default null,
    instrutor_codigo int unsigned default null,
    valor double not null,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_cursos_tipos FOREIGN KEY (tipo_codigo) REFERENCES tipos (codigo),
    CONSTRAINT fk_cursos_instrutores FOREIGN KEY (instrutor_codigo) REFERENCES instrutores (codigo)
);

RENAME TABLE tipo TO tipos;
RENAME TABLE instrutor TO instrutores;

CREATE TABLE alunos
(
    codigo int unsigned not null auto_increment,
    aluno varchar(45) not null,
    endereco varchar(60) not null,
    email varchar(40) not null,
    PRIMARY KEY (codigo)
);

CREATE TABLE pedidos
(
    codigo int unsigned not null auto_increment,
    aluno_codigo int unsigned default null,
    data date not null,
    hora time not null,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_pedidos_alunos FOREIGN KEY (aluno_codigo) REFERENCES alunos (codigo)
);

CREATE TABLE pedido_detalhe
(
    pedido_codigo int unsigned default null,
    curso_codigo int unsigned default null,
    valor double not null,
    CONSTRAINT fk_pedido_detalhe_pedido FOREIGN KEY (pedido_codigo) REFERENCES pedidos (codigo),
    CONSTRAINT fk_pedido_detalhe_curso FOREIGN KEY (curso_codigo) REFERENCES cursos (codigo)
);

ALTER TABLE instrutores MODIFY telefone varchar(9) null;
ALTER TABLE cursos MODIFY tipo_codigo int unsigned not null;
CREATE INDEX fk_tipo ON cursos (tipo_codigo);
CREATE INDEX fk_instrutor ON cursos (instrutor_codigo);
ALTER TABLE pedidos MODIFY aluno_codigo int unsigned not null;
ALTER TABLE pedidos CHANGE data data_hora datetime not null;
CREATE INDEX fk_aluno ON pedidos (aluno_codigo);
ALTER TABLE pedido_detalhe MODIFY pedido_codigo int unsigned not null;
ALTER TABLE pedido_detalhe MODIFY curso_codigo int unsigned not null;
CREATE INDEX fk_pedido ON pedido_detalhe (pedido_codigo);
CREATE INDEX fk_curso ON pedido_detalhe (curso_codigo);
ALTER TABLE pedido_detalhe ADD PRIMARY KEY (pedido_codigo, curso_codigo);

ALTER TABLE alunos ADD data_nascimento varchar(10);
ALTER TABLE alunos CHANGE data_nascimento nascimento date;
CREATE INDEX idx_aluno ON alunos (aluno);
ALTER TABLE instrutores ADD email char(100);
ALTER TABLE instrutores DROP COLUMN email;
ALTER TABLE alunos MODIFY COLUMN nascimento date null;
ALTER TABLE alunos MODIFY COLUMN email varchar(100);

INSERT INTO tipos (tipo) VALUES ('Banco de dados');
INSERT INTO tipos (tipo) VALUES ('Programação');
INSERT INTO tipos (tipo) VALUES ('Modelagem de dados');

INSERT INTO instrutores (instrutor, telefone) VALUES ('André Milani', '1111-1111');
INSERT INTO instrutores (instrutor, telefone) VALUES ('Carlos Tosin', '1212-1212');

SELECT * FROM instrutores;

INSERT INTO cursos (curso, tipo_codigo, instrutor_codigo, valor)
VALUES ('Java Fundamentos', 2, 2, 270);

SELECT * FROM cursos;

INSERT INTO cursos (curso, tipo_codigo, instrutor_codigo, valor)
VALUES ('Java Avançado', 2, 2, 330);

INSERT INTO cursos (curso, tipo_codigo, instrutor_codigo, valor)
VALUES ('SQL Completo', 1, 1, 170);

INSERT INTO cursos (curso, tipo_codigo, instrutor_codigo, valor)
VALUES ('Php Básico', 2, 1, 270);

INSERT INTO alunos (aluno, endereco, email)
VALUES ('José', 'Rua XV de Novmenbro 72', 'jose@softblue.com.br');

INSERT INTO alunos (aluno, endereco, email)
VALUES ('Wagner', 'Av. Paulista', 'wagner@softblue.com.br');

INSERT INTO alunos (aluno, endereco, email)
VALUES ('Emĺlio', 'Rua Lajes 103, ap: 701', 'emilio@softblue.com.br');

INSERT INTO alunos (aluno, endereco, email)
VALUES ('Cris', 'Rua Tauney 22', 'cris@softblue.com.br');

INSERT INTO alunos (aluno, endereco, email)
VALUES ('Regina', 'Rua Salles 305', 'regina@softblue.com.br');

INSERT INTO alunos (aluno, endereco, email)
VALUES ('Fernando', 'Av. Central 30', 'fernando@softblue.com.br');

SELECT * FROM alunos;

ALTER TABLE pedidos DROP COLUMN hora;

INSERT INTO pedidos VALUES (1, 2, '2010-04-15 11:23:32');

INSERT INTO pedidos (aluno_codigo, data_hora)
VALUES (2, '2010-04-15 14:36:21');

INSERT INTO pedidos (aluno_codigo, data_hora)
VALUES (3, '2010-04-16 11:14:45');

INSERT INTO pedidos (aluno_codigo, data_hora)
VALUES (4, '2010-04-17 14:27:22');

INSERT INTO pedidos (aluno_codigo, data_hora)
VALUES (5, '2010-04-18 11:18:19');

INSERT INTO pedidos (aluno_codigo, data_hora)
VALUES (6, '2010-04-19 13:47:35');

INSERT INTO pedidos (aluno_codigo, data_hora)
VALUES (6, '2010-04-20 18:13:44');

SELECT * FROM pedidos;



