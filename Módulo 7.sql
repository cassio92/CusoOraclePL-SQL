-- Fun��es Single Row

-- I. Fun��es de Convers�o: TO_CHAR, TO_NUMBER, TO_DATE
-- 1. TO_CHAR: Converte n�meros e datas para textos, usando um formato especificado.

-- a)Aplica��o com DATAS

SELECT
    sysdate hoje,
    TO_CHAR(sysdate, 'YYYY') ano,
    TO_CHAR(sysdate, 'MM') num_mes,
    TO_CHAR(sysdate, 'MONTH') nome_mes,
    TO_CHAR(sysdate, 'MON') mes_abreviado,
    TO_CHAR(sysdate, 'DAY') nome_dia,
    TO_CHAR(sysdate, 'DD') num_dia,
    TO_CHAR(sysdate, 'DY') dia_abreviado,
    TO_CHAR(sysdate, 'HH12') hora_12,
    TO_CHAR(sysdate, 'HH24') hora_24,
    TO_CHAR(sysdate, 'MI') minutos,
    TO_CHAR(sysdate, 'SS') segundos,
    TO_CHAR(sysdate, 'DAY, DD "de" MONTH "de" YYYY') hora_24
FROM dual;


-- a)Aplica��o com N�MEROS

SELECT
    first_name,
    salary,
    TO_CHAR(salary, '999G999D99') numero_sem_zeros,  --      1.000
    TO_CHAR(salary, '000G000D00') numero_com_zeros,  --    001.000,00
    TO_CHAR(salary, 'L999G999D99') moeda
FROM employees;







-- 2. TO_NUMBER: Converte textos para n�meros, sempre que poss�vel.

SELECT
    TO_NUMBER('234,44')
FROM dual;





-- 3. TO_DATE: Converte textos para datas, sempre que poss�vel.

SELECT
    TO_DATE('10/05/2022', 'DD/MM/YYYY')
FROM dual;



-- II. Fun��es NULL: NVL, NVL2, COALESCE, NULLIF
-- 1. NVL: Permite substituir o valor (null) por um outro valor.


SELECT
    first_name,
    commission_pct,
    NVL(commission_pct, 0)
FROM employees;

















SELECT
    first_name,
    commission_pct,
    NVL(commission_pct, 0)
FROM employees;
    

-- 2. COALESCE: Recebe uma lista de argumentos o primeiro valor n�o nulo.

SELECT
    COALESCE(NULL, NULL, NULL, NULL, 'Hashtag', NULL, 'SQL')
FROM dual;






-- 3. NVL2: � uma extens�o do NVL. Se o primeiro argumento n�o for null, retorna o segundo argumento.
-- Se o primeiro argumento for null, retorna o terceiro.

SELECT
    first_name,
    commission_pct,
    NVL2(commission_pct, 0.5, 0)
FROM employees;



SELECT
    first_name,
    commission_pct,
    NVL2(commission_pct, 0.5, 0)
FROM employees;

-- 4. NULLIF: Recebe dois argumentos. Se os dois forem iguais, retorna nulo, se n�o retorna o 1�.

SELECT 
    NULLIF(10, 10),
    NULLIF(10, 5)
FROM dual;















    

-- III. Fun��es Condicionais
-- 1. CASE WHEN
-- a) Fa�a uma consulta que retorne o sal�rio atualizado dos funcion�rios. 
-- Se o funcion�rio tiver o JOB_ID = 'ST_MAN' ele receber� 20% a mais do sal�rio.
-- Se o funcion�rio tiver o JOB_ID = 'SA_REP' ele receber� 10% a mais do sal�rio.
-- Se n�o for nenhum dos dois acima, o funcion�rio permanece com o mesmo sal�rio.

-- Vers�o 1
SELECT
    first_name,
    salary,
    job_id,
    CASE
        WHEN job_id = 'ST_MAN' THEN
            salary * 1.2
        WHEN job_id = 'SA_REP' THEN
            salary * 1.1
        ELSE
            salary
        END salario_novo
FROM employees;

-- Vers�o 2
SELECT
    first_name,
    salary,
    job_id,
    CASE job_id
        WHEN 'ST_MAN' THEN
            salary * 1.2
        WHEN 'SA_REP' THEN
            salary * 1.1
        ELSE
            salary
        END salario_novo
FROM employees;
    

-- 3. DECODE
-- a) Fa�a uma consulta que retorne o sal�rio atualizado dos funcion�rios. 
-- Se o funcion�rio tiver o JOB_ID = 'ST_MAN' ele receber� 20% a mais do sal�rio.
-- Se o funcion�rio tiver o JOB_ID = 'SA_REP' ele receber� 10% a mais do sal�rio.
-- Se n�o for nenhum dos dois acima, o funcion�rio permanece com o mesmo sal�rio.

SELECT
    first_name,
    salary,
    job_id,
    DECODE(job_id,
            'ST_MAN', salary * 1.2,
            'SA_REP', salary * 1.1,
            salary) salario_novo
FROM employees;
    