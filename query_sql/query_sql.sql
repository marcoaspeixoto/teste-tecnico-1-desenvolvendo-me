CREATE DATABASE human_resources;

CREATE TABLE teams
(
    id int unsigned not null auto_increment,
    name varchar(40) not null,
    PRIMARY KEY (id)
);
