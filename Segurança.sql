/* Administra��o de Banco de Dados e Seguran�a

-- I. GRANT e REVOKE

-- Voc� pode conceder permiss�es (GRANT) ou retirar permiss�es (REVOKE) a uma s�rie de objetos dentro de um banco de dados.

-- 1. GRANT privil�gios sobre uma tabela

Voc� pode conceder aos usu�rios privil�gios a tabelas. Esses privil�gios podem ser uma combina��o de SELECT, INSERT, 
UPDATE, DELETE, ALTER, REFERENCES, INDEX, ALL.

Sintaxe:

GRANT privilegios ON objeto TO usario;

REVOKE privilegios ON objeto FROM usario;


1) Onde os privil�gios podem ser:

    SELECT                  - Possibilidade de selecionar tabelas.
    INSERT                  - Possibilidade de inserir dados em tabelas.
    UPDATE                  - Possibilidade de atualizar tabelas.
    DELETE                  - Possibilidade de excluir tabelas.
    REFERENCES              - Possibilidade de criar constraints que fazem refer�ncia a uma tabela.
    ALTER                   - Possibilidade de utilizar comandos do tipo ALTER TABLE.
    INDEX                   - Possibilidade de criar �ndices em uma tabela.
    ALL                     - Todos os privil�gios de uma tabela.
    EXECUTE                 - Possibilidade de executar uma function ou procedure.
    CREATE SESSION          - Possibilidade de se conectar ao banco de dados.
    CREATE TABLE            - Possibilidade de criar uma tabela
    CREATE VIEW             - Possibilidade de criar uma view
    CREATE ANY TRIGGER      - Possibilidade de criar uma trigger
    CREATE ANY PROCEDURE    - Possibilidade de criar uma procedure
    CREATE ANY FUNCTION     - Possibilidade de criar uma function
    CREATE SEQUENCE         - Possibilidade de criar uma sequence
    
2) Objeto se trata do nome do objeto do banco de dados ao qual est�o sendo dadas as permiss�es.

3) Usu�rio � o nome do usu�rio ao qual ser�o dados os privil�gios.

*/







-- II. Usu�rios

-- Um usu�rio se trata de uma conta de banco de dados que permite uma pessoa fazer um login no sistema.

-- 1. Criando um usu�rio

CREATE USER teste
    IDENTIFIED BY 123;
    

-- 2. Alterando a senha de um usu�rio

ALTER USER teste
    IDENTIFIED BY 456;
    
-- 3. Excluindo usu�rio

DROP USER teste;
    







 
-- III. Concedendo permiss�o para criar nova sess�o.

/*
    SELECT                  - Possibilidade de selecionar tabelas.
    INSERT                  - Possibilidade de inserir dados em tabelas.
    UPDATE                  - Possibilidade de atualizar tabelas.
    DELETE                  - Possibilidade de excluir tabelas.
    REFERENCES              - Possibilidade de criar constraints que fazem refer�ncia a uma tabela.
    ALTER                   - Possibilidade de utilizar comandos do tipo ALTER TABLE.
    INDEX                   - Possibilidade de criar �ndices em uma tabela.
    ALL                     - Todos os privil�gios de uma tabela.
    EXECUTE                 - Possibilidade de executar uma function ou procedure.
    CREATE SESSION          - Possibilidade de se conectar ao banco de dados.
    CREATE TABLE            - Possibilidade de criar uma tabela
    CREATE VIEW             - Possibilidade de criar uma view
    CREATE ANY TRIGGER      - Possibilidade de criar uma trigger
    CREATE ANY PROCEDURE    - Possibilidade de criar uma procedure
    CREATE ANY FUNCTION     - Possibilidade de criar uma function
    CREATE SEQUENCE         - Possibilidade de criar uma sequence

*/

GRANT CREATE SESSION TO teste;

CREATE TABLE clientes(id INT, nome VARCHAR2(100));

GRANT CREATE TABLE TO teste;



