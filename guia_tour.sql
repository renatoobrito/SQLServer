CREATE DATABASE  guiatour;
USE guiatour;

SELECT * FROM INFORMATION_SCHEMA.TABLES;

SELECT * FROM INFORMATION_SCHEMA.COLUMNS;

CREATE TABLE pais (
  id INT NOT NULL IDENTITY PRIMARY KEY,
  nome VARCHAR(50) NOT NULL DEFAULT '',
  continente VARCHAR(15) CHECK(continente IN('América', 'Oceania', 'Ásia', 'África', 'Antártida', 'Europa')) NOT NULL,
  codigo CHAR(3) NOT NULL DEFAULT ''
);

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
  tipo VARCHAR(20) CHECK(tipo IN('Atrativo', 'Serviço', 'Equipamento', 'Infraestrutura', 'Instituição', 'Organização')),
  publicado CHAR(3) CHECK(publicado IN('Não', 'Sim')) NOT NULL DEFAULT 'Não'
);

INSERT INTO pais
VALUES('Brasil', 'América', 'BRA'),
('Índia', 'Ásia', 'IND'),
('China', 'Ásia', 'CHI'),
('Japão', 'Ásia', 'JPN');

SELECT * FROM pais;

INSERT INTO estado
VALUES('Maranhão', 'MA'),
('São Paulo', 'SP'),
('Santa Catarina', 'SC'),
('Rio Janeiro', 'RJ');

SELECT * FROM estado;

INSERT INTO cidade
VALUES('Sorocaba', 700000),
('Déli', 26000000),
('Xangai', 22000000),
('Tóquio', 38000000);

SELECT * FROM cidade;

INSERT INTO ponto_tur (nome, tipo)
VALUES('Quinzinho de Barros', 'Instituição'),
('Parque Estadual do Jalapão', 'Atrativo'),
('Torre Eiffel', 'Atrativo'),
('Fogo no Chão', 'Serviço');

SELECT * FROM pais;
SELECT * FROM estado;
SELECT * FROM cidade;
SELECT * FROM ponto_tur;

-- CONTROLE TRANSACIONAL SÓ FUNCIONA EM MANIPULAÇÃO DOS DADOS COMO (INSERT, UPDATE, DELETE) QUE TRABALHEM COM REGISTROS.
BEGIN TRANSACTION t1
  UPDATE ponto_tur SET nome = 'Quinze de Barros' WHERE id = 1
COMMIT TRANSACTION t1