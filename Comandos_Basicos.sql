-- Display Local Databases
SHOW DATABASES;

-- Create Databases
CREATE DATABASE firstexample;

-- Drop Database
DROP DATABASE firsteample;

-- Use a Particular Database
USE firstexample;

-- Display Tables From Selected Database
SHOW TABLES;

-- Create tables
CREATE TABLE firstexample.periodicos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_periodico VARCHAR(25),
    issn INT,
    id_editora INT
);

CREATE TABLE firstexample.editora(
    id INT AUTO_INCREMENT,
    nome_editora VARCHAR(120) UNIQUE,
    pais VARCHAR(10),
    PRIMARY KEY(id)
);

-- Add Foreign Key - Relationship
ALTER TABLE firstexample.periodicos ADD CONSTRAINT fk_editora_periodicos
FOREIGN KEY (id_editora) REFERENCES editora(id);

-- Insert Datas
INSERT INTO firstexample.editora(nome_editora, pais)
VALUES ("IEEE", "EUA"), ("DataScienceMagazine", "EUA"), ("IEEE_EU", "EU");

INSERT INTO firstexample.periodicos (nome_periodico, issn, id_editora)
VALUES ("Special Issue", 156795164, (SELECT id FROM firstexample.editora WHERE nome_editora = "IEEE")),
("Special Issue 2", 186795164, (SELECT id FROM firstexample.editora WHERE nome_editora = "IEEE_EU"));