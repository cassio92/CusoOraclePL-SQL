-- Criando Views

-- O que �?
-- Uma View nada mais � do que o resultado do SELECT salvo no nosso banco de dados.

SELECT * FROM employees
WHERE job_id = 'ST_MAN';



-- Vantagens de se usar Views:
-- 1. Restringir acesso aos dados 
-- Por exemplo, se queremos dar acesso � tabela de employees a um usu�rio, mas n�o � coluna 
-- de sal�rio. Podemos criar uma view a partir da tabela, e dar acesso apenas � view.

-- 2. Reutilizar consultas complexas
-- Se precisamos usar com frequ�ncia uma consulta que possui muitos joins, where, group by, etc,
-- em vez de recriar o c�digo toda vez, podemos criar uma view e reaproveitar de forma mais simples.

-- 3. Representar diferentes vis�es de uma mesma tabela
-- Podemos fazer diferentes filtros em uma mesma tabela, para que diferentes vis�es sejam 
-- compartilhadas entre diferentes usu�rios.















-- 1. Criando/Substituindo uma View
-- Crie uma View armazenando o resultado dos funcion�rios de JOB_ID = 'ST_MAN'.

CREATE OR REPLACE VIEW vEmpSTMan AS
SELECT *
FROM employees
WHERE job_id = 'ST_MAN';


SELECT * FROM vEmpSTMan;


-- 2. Excluindo uma view

DROP VIEW vEmpSTMan;








