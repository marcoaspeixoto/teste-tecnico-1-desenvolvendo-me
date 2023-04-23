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

INSERT INTO job_titles (name) VALUES ('Desenvolvedor back-end');
INSERT INTO job_titles (name) VALUES ('Desenvolvedor front-end');
INSERT INTO job_titles (name) VALUES ('Encantador de clientes');

SELECT * FROM teams;

CREATE TABLE employees
(
    id int unsigned not null auto_increment,
    first_name varchar(40) not null,
    last_name varchar(40) not null,
    cpf char(11) not null,
    team_id int unsigned,
    job_title_id int unsigned,
    PRIMARY KEY (id),
    CONSTRAINT fk_employees_teams FOREIGN KEY (team_id) REFERENCES teams (id),
    CONSTRAINT fk_employees_job_titles FOREIGN KEY (job_title_id) REFERENCES job_titles (id)
);