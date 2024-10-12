-- Subqueries

-- I. O que � uma subquery? 

-- Subquery � um recurso dentro do SQL que nos permite criar queries mais otimizadas,
-- reaproveitando o resultado de uma query dentro de outra query.

-- Subqueries podem ser usadas em 3 situa��es:

-- 1) Dentro da cl�usula WHERE, como um filtro

-- 2) Dentro da cl�usula SELECT, como uma nova coluna

-- 3) Dentro da cl�usula FROM, como uma nova tabela


-- Essas subqueries podem ser divididas em 3 tipos:
-- 1) Subqueries escalares
-- 2) Subqueries de linha m�ltipla
-- 3) Subqueries correlacionadas




-- Quais s�o os funcion�rios que ganham um sal�rio acima da m�dia.

SELECT AVG(salary) FROM employees;

SELECT * FROM employees
WHERE salary >= 6461.68;





-- II. Subqueries escalar na cl�usula WHERE (single row)

-- Subqueries escalares retornam valores �nicos, sempre 1 linha e 1 coluna.

-- a) Quais funcion�rios recebem um sal�rio acima da m�dia de todos os funcion�rios?


-- 1�) Descobrir a m�dia de sal�rio

SELECT AVG(salary) FROM employees;


-- 2�) Filtrar a tabela EMPLOYEES baseado no valor acima.

SELECT *
FROM employees
WHERE salary >= (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;



-- Um detalhe importante sobre a subquery acima � que ela � executada de dentro pra fora.
-- Primeiro � executado a query mais interna, para s� depois executar a query mais externa.
-- Dessa forma, n�o existe nenhuma depend�ncia da query interna em rela��o � query externa.
-- Ela � calculada de forma independente.
-- Em alguns casos, no entanto, a query mais interna depende da query externa.






-- III) Subqueries de linha m�ltipla na cl�usula WHERE (multiple row): IN e NOT IN

-- Exemplo: Quais s�o os funcion�rios que pertencem aos departamentos de location_id = 1700 (Seattle US)?

-- SELECT * FROM employees
-- WHERE department_id IN (10, 30, 90...)  


-- 1�)  Descobrir quais ids dos departamentos dessas localidades.

SELECT department_id FROM departments
WHERE location_id = 1700;




-- 2�) Quais funcion�rios s�o destes departamentos. 

SELECT * FROM employees
WHERE department_id IN (
                        SELECT department_id FROM departments
                        WHERE location_id = 1700
                        );













-- III) Subqueries de linha m�ltipla na cl�usula WHERE (multiple row): ANY e ALL

-- Exemplo: Fa�a um filtro na tabela EMPLOYEES que mostre todos os funcion�rios que possuem
-- um sal�rio igual a qualquer uma das m�dias salarias agrupadas por departamento.

SELECT AVG(salary) FROM employees 
GROUP BY department_id
ORDER BY AVG(salary) DESC;

-- IN

SELECT *
FROM employees
WHERE salary IN (SELECT AVG(salary) FROM employees GROUP BY department_id);



-- Exemplo: Fa�a um filtro na tabela EMPLOYEES que mostre todos os funcion�rios que possuem
-- um sal�rio MENOR QUE QUALQUER uma das m�dias salarias agrupadas por departamento.

-- ANY

SELECT *
FROM employees
WHERE salary > ANY (SELECT AVG(salary) FROM employees GROUP BY department_id)
ORDER BY salary DESC;


-- Exemplo: Fa�a um filtro na tabela EMPLOYEES que mostre todos os funcion�rios que possuem
-- um sal�rio MENOR QUE TODAS as m�dias salarias agrupadas por departamento.

-- ALL

SELECT *
FROM employees
WHERE salary > ALL (SELECT AVG(salary) FROM employees GROUP BY department_id)
ORDER BY salary DESC;








-- Subquery linha m�ltipla e coluna m�ltipla.

-- Encontre os funcion�rios que ganham o maior sal�rio de cada departamento.

SELECT
    department_id,
    MAX(salary)
FROM employees
GROUP BY department_id;


SELECT *
FROM employees
WHERE (department_id, salary) IN (
                                SELECT
                                    department_id,
                                    MAX(salary)
                                FROM employees
                                GROUP BY department_id
                                )
ORDER BY department_id;




















-- IV. EXISTS/NOT EXISTS: Exemplo 1

-- Exemplo: Liste as informa��es dos departamentos que possuem funcion�rios. 
-- Liste tamb�m os departamentos que N�O possuem funcion�rios.

-- Passo 1: Descobrir os valores distintos de department_id da tabela EMPLOYEES.

SELECT DISTINCT(department_id) FROM employees;

-- Passo 2: Descobrir os valores distintos de department_id da tabela DEPARTMENTS.

SELECT DISTINCT department_id FROM departments;






-- Passo 3: Utilizar o IN/NOT IN para descobrir os departamentos que t�m funcion�rios. 


 SELECT * FROM departments
 WHERE department_id NOT IN (
                        SELECT DISTINCT department_id 
                        FROM employees 
                        WHERE department_id IS NOT NULL
                        );
 
 
 
 
 
 

-- IV. EXISTS/NOT EXISTS: Exemplo 1

-- Exemplo: Liste as informa��es dos departamentos que possuem funcion�rios. 
-- Liste tamb�m os departamentos que N�O possuem funcion�rios.


SELECT * FROM departments;

SELECT * FROM employees
WHERE department_id = 120;


SELECT * FROM departments d
WHERE NOT EXISTS (SELECT * FROM employees e
                WHERE e.department_id = d.department_id);






















-- EXISTS: Exemplo 2
-- Fa�a uma consulta que retorna apenas os funcion�rios que tamb�m s�o gerentes.

SELECT * FROM employees;

SELECT * FROM employees
WHERE manager_id = 130;


SELECT * FROM employees g
WHERE EXISTS (
                SELECT * FROM employees e
                WHERE e.manager_id = g.employee_id
                )
ORDER BY employee_id;




















-- V. Subquery correlacionada

-- Uma subquery correlacionada � aquela em que a subquery interna possui uma depend�ncia
-- da subquery externa.


-- Exemplo 1. Funcion�rios que ganham acima da m�dia salarial do seu departamento.

SELECT * FROM employees;

SELECT AVG(salary) FROM employees
WHERE department_id = 10;


SELECT *
FROM employees e1
WHERE e1.salary >= (
                    SELECT AVG(e2.salary) 
                    FROM employees e2
                    WHERE e2.department_id = e1.department_id
                );


















-- Exemplo 2: Funcion�rios que ganham o maior sal�rio de seus departamentos.

SELECT *
FROM employees e1
WHERE e1.salary = (
                    SELECT
                        MAX(e2.salary)
                    FROM employees e2
                    WHERE e2.department_id = e1.department_id
                );

















-- VI. Subconsulta na cl�usula SELECT
-- Fa�a uma consulta � tabela EMPLOYEES que retorne as seguintes colunas:
-- 1. employee_id
-- 2. first_name
-- 3. job_id
-- 4. salary
-- 5. m�dia de salary

SELECT
    employee_id,
    first_name,
    job_id,
    salary,
    ROUND((SELECT AVG(salary) FROM employees), 2) media_salario,
    salary - ROUND((SELECT AVG(salary) FROM employees), 2) desvio_salario
FROM employees;














-- VII. Subconsulta na cl�usula FROM
-- Considerando a quantidade de funcion�rios por JOB_ID, qual � o total para o JOB_ID com 
-- a maior quantidade de funcion�rios? E a menor? E a m�dia?

SELECT
    MAX(qtd_funcionarios) max_funcionarios,
    MIN(qtd_funcionarios) min_funcionarios,
    AVG(qtd_funcionarios) avg_funcionarios
FROM (
        SELECT
            job_id,
            COUNT(*) qtd_funcionarios
        FROM employees
        GROUP BY job_id
    ) t;



















