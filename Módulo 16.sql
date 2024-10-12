-- Functions

-- O que �?
-- Uma Function � uma sub-rotina que retorna obrigatoriamente 1 �nico valor.

/*
Sintaxe

CREATE OR REPLACE FUNCTION fn_name (f1 NUMBER, f2 INT)
RETURN NUMBER IS

vari�veis

BEGIN

    instru��es da function

END;

*/



-- Exemplo 1: Fun��o para calcular a �rea de um c�rculo.
CREATE OR REPLACE FUNCTION area_circulo (raio NUMBER)
RETURN NUMBER IS

pi NUMBER(10, 4);
area NUMBER(10, 4);

BEGIN
    -- �rea do c�rculo: pi * r * r
    pi := 3.1413;
    area := pi * (raio * raio);
    RETURN area;
END;

SET SERVEROUTPUT ON;

DECLARE 
    teste NUMBER(10, 4);
BEGIN
    teste := area_circulo(10);
    dbms_output.put_line('A �rea do c�rculo �: ' || teste);
END;

SELECT area_circulo(10)
FROM dual;





-- Exemplo 2: Cria uma function que recebe 2 argumentos: sal�rio e percentual de b�nus. 
-- Essa function dever� calcular a comiss�o recebida pelo funcion�rio (salario * perc_comissao).

CREATE OR REPLACE FUNCTION calcula_bonus(salario NUMBER, perc_comissao NUMBER)
RETURN NUMBER
IS

bonus NUMBER(10, 2);

BEGIN

    bonus := NVL(salario * perc_comissao, 0);
    
    RETURN bonus;

END;

SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    calcula_bonus(salary, commission_pct) bonus
FROM employees;


DROP FUNCTION calcula_bonus;


-- Removendo uma Function

