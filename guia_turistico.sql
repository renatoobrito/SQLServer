CREATE DATABASE guia_turistico;
USE guia_turistico;

CREATE TABLE pais (
  id INT NOT NULL IDENTITY PRIMARY KEY,
  nome VARCHAR(50) NOT NULL DEFAULT '',
  continente VARCHAR(15) CHECK(continente IN('América', 'África', 'Europa', 'Oceania', 'Ásia')) NOT NULL,
  codigo CHAR (3) NOT NULL DEFAULT ''
);

SELECT * FROM INFORMATION_SCHEMA.TABLES

SELECT * FROM INFORMATION_SCHEMA.COLUMNS  WHERE TABLE_NAME = 'pais'

CREATE TABLE estado (
  id INT NOT NULL IDENTITY PRIMARY KEY,
  nome VARCHAR(50) NOT NULL DEFAULT '',
  sigla CHAR(2) NOT NULL DEFAULT ''
);

CREATE TABLE cidade (
  id INT NOT NULL IDENTITY PRIMARY KEY,
  nome VARCHAR(50) NOT NULL DEFAULT '',
  populacao INT NOT NULL DEFAULT '0'
);

CREATE TABLE ponto_tur (
  id INT NOT NULL IDENTITY PRIMARY KEY,
  nome VARCHAR(50) NOT NULL DEFAULT '',
  populacao INT NOT NULL DEFAULT '0',
  tipo VARCHAR(20) CHECK(tipo IN ('Atrativo', 'Serviço', 'Equipamento', 'Infraestrutura', 'Instituição', 'Organização')),
  publicado CHAR(3) CHECK(publicado IN('Não', 'Sim')) NOT NULL DEFAULT 'Não'
);

INSERT INTO pais
VALUES ('Índia', 'Ásia', 'IDN'),
('China', 'Ásia', 'CHI'),
('Japão', 'Ásia', 'JPN');

INSERT INTO estado 
VALUES ('Maranhã', 'MA'),
('Bahia', 'BA'),
('São Paulo', 'SP'),
('Minas Gerais', 'MG'),
('Espírito Santo', 'ES');

UPDATE estado
SET nome = 'Maranhão' WHERE id = 1;

INSERT INTO cidade
VALUES ('Sorocaba', 700000),
('Déli', 26000000),
('Xangai', 22000000),
('Tóquio', 38000000);

INSERT INTO ponto_tur (nome, tipo)
VALUES ('Quinzinho de Barros', 'Instituição'),
('Parque Estadual do Jalapão', 'Atrativo'),
('Torre Eifel', 'Atrativo'),
('Fogo de Chão', 'Serviço');

CREATE TABLE linguagemPais (
  id INT NOT NULL IDENTITY PRIMARY KEY,
  codigoPais INT,
  linguagem VARCHAR(30) NOT NULL DEFAULT '',
  oficial CHAR(3) CHECK(oficial IN('Sim', 'Não')) NOT NULL DEFAULT 'Não'
);

ALTER TABLE linguagemPais
ADD CONSTRAINT FK_linguagemPais
FOREIGN KEY (codigoPais) REFERENCES pais(id);

SELECT * FROM pais;
SELECT * FROM cidade;
SELECT * FROM estado;
SELECT * FROM ponto_tur;
SELECT * FROM linguagemPais;

SELECT DISTINCT continente FROM pais;

SELECT nome, tipo FROM ponto_tur
WHERE tipo LIKE 'Atrativo';

SELECT nome FROM pais WHERE nome LIKE 'J%';