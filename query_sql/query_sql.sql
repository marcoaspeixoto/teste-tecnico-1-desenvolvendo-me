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

ALTER TABLE employees MODIFY cpf char(14) not null;

INSERT INTO employees (first_name, last_name, cpf, team_id, job_title_id)
VALUES ('Pedro', 'Alves', '665.415.876-80', 2, 3);

INSERT INTO employees (first_name, last_name, cpf, team_id, job_title_id)
VALUES ('Tiago', 'Nogueira', '032.336.130-75', 1, 1);

INSERT INTO employees (first_name, last_name, cpf, team_id, job_title_id)
VALUES ('João', 'Neves', '461.636.517-23', 1, 2);

SELECT CONCAT(first_name, ' ', last_name) AS 'full name', cpf, teams.name AS team, job_titles.name AS 'job title'
FROM  employees
JOIN teams ON employees.team_id = teams.id
JOIN job_titles ON employees.job_title_id = job_titles.id
ORDER BY cpf;