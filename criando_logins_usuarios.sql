USE master

CREATE LOGIN usuario_aula WITH PASSWORD = 'teste123'
USE guiatour
CREATE USER usuario_aula FOR LOGIN usuario_aula;

GRANT SELECT
ON pais
TO usuario_aula;

EXECUTE AS USER = 'usuario_aula'

SELECT * FROM estado;

REVERT