-- Display Local Databases - Schemas
SHOW DATABASES;

-- Create Databases - Schemas
CREATE DATABASE firstexample;

-- Drop Database - Schemas
DROP DATABASE firstexample;

-- Create new Databases - Schemas
CREATE DATABASE Publicacoes;

-- Use a Particular Database - Schemas
USE Publicacoes;

-- Display Tables From Selected Database
SHOW TABLES;

-- Create tables
CREATE TABLE periodicos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_periodico VARCHAR(25),
    issn INT,
    id_editora INT
);

CREATE TABLE editora(
    id INT AUTO_INCREMENT,
    nome_editora VARCHAR(120) UNIQUE,
    pais VARCHAR(10),
    PRIMARY KEY(id)
);

-- Add Foreign Key - Relationship
ALTER TABLE periodicos ADD CONSTRAINT fk_editora_periodicos
FOREIGN KEY (id_editora) REFERENCES editora(id);

-- Insert Datas
INSERT INTO editora(nome_editora, pais)
VALUES ("IEEE", "EUA"), ("DataScienceMagazine", "EUA"), ("IEEE_EU", "EU");

INSERT INTO periodicos (nome_periodico, issn, id_editora)
VALUES ("Special Issue", 156795164, (SELECT id FROM firstexample.editora WHERE nome_editora = "IEEE")),
("Special Issue 2", 186795164, (SELECT id FROM firstexample.editora WHERE nome_editora = "IEEE_EU"));