-- TABLE'S CREATION
CREATE DATABASE SuperGames;
USE SuperGames;

CREATE TABLE localizacao (
  Id INT PRIMARY KEY IDENTITY,
  Secao VARCHAR(50) NOT NULL,
  Prateleira INT NOT NULL
);

CREATE TABLE jogo (
  Cod INT PRIMARY KEY IDENTITY,
  Nome VARCHAR(50) NOT NULL,
  Valor DECIMAL(6,2) NOT NULL,
  Localizacao_Id INT NOT NULL,
  FOREIGN KEY (Localizacao_Id)
    REFERENCES Localizacao (Id)
);

INSERT localizacao VALUES ('Guerra', '001'),
('Guerra', '002'),
('Aventura', '100'),
('Aventura', '101'),
('RPG', '150'),
('RPG', '151')

INSERT jogo VALUES ('COD 3', 125.00, 1),
('BF 1', 150.00, 2),
('GOW 4', 200.00, 3),
('SLY 1', 99.00, 4),
('FF XV', 205.00, 5)

SELECT * FROM localizacao;
SELECT * FROM jogo;


SELECT jogo.Nome, localizacao.Prateleira
FROM jogo INNER JOIN localizacao
ON localizacao.Id = jogo.Localizacao_Id


SELECT jogo.Nome
FROM jogo INNER JOIN localizacao
ON localizacao.Id = jogo.Localizacao_Id
WHERE Secao = 'Guerra'


SELECT localizacao.Secao, localizacao.Prateleira, jogo.Nome
FROM localizacao LEFT OUTER JOIN jogo
ON localizacao.Id = jogo.Localizacao_Id
ORDER BY jogo.Nome ASC

-- VALUES
SELECT COUNT(*) FROM jogo;

SELECT AVG(valor) AS 'Media Guerra' FROM jogo
INNER JOIN localizacao
ON localizacao.Id = jogo.Localizacao_Id
WHERE secao = 'Guerra'

SELECT SUM(valor) FROM jogo;

SELECT secao, AVG(valor) AS 'Media' FROM jogo
INNER JOIN localizacao
ON localizacao.Id = jogo.Localizacao_Id
GROUP BY Secao

SELECT MAX(valor) AS 'Maior Valor' FROM jogo
SELECT MIN(valor) AS 'Maior Valor' FROM jogo