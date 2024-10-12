/***  INTRODU��O AO SQL ***
*
*

-- I. INTRODU��O AO SQL E GRUPOS DE COMANDOS
-- O SQL � uma linguagem de programa��o para trabalhar com dados. Podemos dividir esses comandos em 4 grupos:
-- a) DDL - Data Definition Language
-- 

-- b) DML - Data Manipulation Language
-- c) TCL - Transact Control Language
-- d) DCL - Data Control Language



-- II. DOCUMENTA��O DA ORACLE
-- A Oracle possui uma documenta��o muito rica, que pode ser acessada atrav�s do site abaixo.
https://otn.oracle.com


-- III . EXPLORANDO AS TABELAS DO BANCO DE DADOS HR
-- Para acessar as tabelas do banco de dados HR � muito simples. Basta clicar em cima da tabela
-- que voc� deseja visualizar e uma janela ser� aberta.

-- Nessa janela, temos acesso a informa��es como: Colunas, Dados, Modelo, Restri��es (Constraints) e assim vai.


-- IV. DESCRIBE/DESC - EXIBINDO A ESTRUTURA DE TABELAS
*/

DESCRIBE employees;

DESC employees;

DESC departments;

DESC regions;

-- V. SELECT *, SELECT: Como selecionar colunas em uma tabela.

-- Existem duas formas de selecionar colunas de uma tabela:
-- a) Todas de uma vez
-- b) Apenas colunas espec�ficas

-- Selecione a tabela LOCATIONS

SELECT * FROM locations;

-- Selecione a tabela EMPLOYEES

SELECT * FROM employees;

-- Selecione a coluna DEPARTMENT_NAME da tabela DEPARTMENTS

SELECT department_name FROM departments;

-- Selecione apenas as colunas FIRST_NAME, EMAIL e SALARY da tabela EMPLOYEES

SELECT first_name, email, salary
FROM employees;
    

-- Dica: Sele��o r�pida de tabelas (arrastando com o mouse)



-- VI. FORMAS DE EXECUTAR UM C�DIGO

-- Existem duas formas de executar c�digos no Oracle
-- a) Executar instru��o (CTRL + ENTER)
-- b) Executar script (F5)




-- VII. FORMAS DE COMENTAR UM C�DIGO

-- Existem duas formas de criar coment�rios em um c�digo.
-- a) Coment�rio de 1 linha
-- b) Coment�rio de linha m�ltipla


-- � um coment�rio de 1 linha.
SELECT * FROM employees;

/*

SELECT * 
FROM employees;

permite
comentar
m�ltiplas
linhas

*/


-- VIII. DEFININDO ALIAS PARA COLUNAS E TABELAS

-- Um alias � uma forma de dar um nome mais intuitivo para as colunas e tabelas do c�digo
-- Podemos deefinir um alias para:
-- a) Colunas
-- b) Tabelas

-- Selecione as colunas FIRST_NAME, EMAIL e SALARY da tabela EMPLOYEES. 
-- D� um nome para as colunas da tabela.

SELECT 
    first_name "primeiro nome", 
    email "e-mail", 
    salary "sal�rio (R$)"
FROM employees;

-- Selecione todas as colunas da tabela JOBS.
-- D� um nome para a tabela JOBS.

SELECT *
FROM JOBS J;


-- Relaciona as tabelas employees e departments por meio de um LEFT JOIN.
-- Al�m disso, as tabelas s�o renomeadas com o aliasing.
SELECT 
    e.employee_id,
    e.first_name,
    e.email,
    e.department_id,
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;


-- IX. OPERADOR || (CONCATENAR) E RESOLVENDO PROBLEMA DO ' DENTRO DE UMA STRING

-- Fa�a uma consulta que retorne o nome completo dos funcion�rios (FIRST_NAME + LAST_NAME)

SELECT 
    first_name || ' ' || last_name "Nome Completo"
FROM employees;


-- Fa�a uma consulta que retorne o nome completo + o sal�rio do funcion�rio (FIRST_NAME + LAST_NAME + SALARY)

SELECT 
    first_name || ' ' || last_name || '. Sal�rio: R$' || salary "Funcion�rio"
FROM employees;


-- Fa�a uma consulta que retorne a lista de funcion�rios e seus respectivos gerentes

SELECT
    first_name || q'[. Employee's manager id: ]' || manager_id "Funcion�rio e Gerente"
FROM employees;


-- X. C�LCULOS SIMPLES E TABELA DUAL

-- Adicione um b�nus de R$100 aos sal�rios de todos os funcion�rios

SELECT
    first_name,
    last_name,
    salary,
    salary + 100 "sal�rio + b�nus"
FROM employees;


-- Adicione um b�nus de 25% do sal�rio para todos os funcion�rios

SELECT
    first_name,
    last_name,
    salary,
    salary * (1 + 0.25) "sal�rio + b�nus (25%)"
FROM employees;

-- Execute simplesmente uma multiplica��o de valores ( 2 * 2)

SELECT 2 * 2
FROM dual;


-- Retorne a data atual do sistema

SELECT sysdate
FROM dual;




-- XI. DISTINCT: RETORNANDO VALORES DISTINTOS DA TABELA


-- Qual � o total de departamentos? Fa�a esta an�lise em cima da tabela

SELECT
    DISTINCT department_id
FROM employees;

-- Retorne os valores distintos de nomes completos dos funcion�rios

SELECT
    DISTINCT first_name, last_name
FROM employees;

