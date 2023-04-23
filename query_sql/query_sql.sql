CREATE DATABASE human_resources;

CREATE TABLE teams
(
    id int unsigned not null auto_increment,
    name varchar(40) not null,
    PRIMARY KEY (id)
);

INSERT INTO teams (name) VALUES ('TI');
INSERT INTO teams (name) VALUES ('Suporte');
INSERT INTO teams (name) VALUES ('Financeiro');

CREATE TABLE job_titles
(
    id int unsigned not null auto_increment,
    name varchar(40) not null,
    PRIMARY KEY (id)
);


