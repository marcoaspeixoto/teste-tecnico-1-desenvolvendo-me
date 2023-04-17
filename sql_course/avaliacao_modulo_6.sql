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

