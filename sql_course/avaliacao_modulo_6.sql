CREATE DATABASE avaliacao_modulo_6;

USE avaliacao_modulo_6;

CREATE TABLE pilotos
(
    id int unsigned not null auto_increment,
    nome varchar(45) not null,
    equipe char(1) not null,
    pontos int not null,
    PRIMARY KEY (id)
);

INSERT INTO pilotos (nome, equipe, pontos) VALUES ('Fernando', 'A', 2);
INSERT INTO pilotos (nome, equipe, pontos) VALUES ('Paulo', 'B', 5);
INSERT INTO pilotos (nome, equipe, pontos) VALUES ('Richa', 'A', 3);
INSERT INTO pilotos (nome, equipe, pontos) VALUES ('Gomes', 'C', 6);
INSERT INTO pilotos (nome, equipe, pontos) VALUES ('Fred', 'B', 7);

SELECT * FROM pilotos;

SELECT COUNT(pontos) FROM pilotos WHERE equipe = 'B';

SELECT * FROM pilotos WHERE equipe IN
(SELECT equipe FROM pilotos GROUP BY equipe HAVING SUM(pontos) > 5);