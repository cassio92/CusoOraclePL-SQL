/* Blocos An�nimos
*
*

-- I. Introdu��o

Um Bloco An�nimo � um bloco de c�digo sem nome. Aprender sua estrutura ser� muito
importante no momento em que falarmos de Functions e Procedures.

Um Bloco Anon�nimo � composto por 3 partes: Bloco de Execu��o, Bloco de Declara��o e 
Bloco de Exce��o.

O bloco de execu��o � o �nico obrigat�rio para um bloco an�nimo. Ele inicia com a palavra 
BEGIN e termina com a palavra END. Dentro dele, escrevemos as instru��es que queremos executar.

O bloco de declara��o � onde faremos, por exemplo, a declara��o de vari�veis. 

Por fim, o bloco de exce��o cont�m tratamentos de erros.
*/

-- A estrutura mais b�sica de um bloco an�nimo � mostrada abaixo.

-- 1). Bloco de Execu��o

-- Exemplo 1: BA que printa na tela uma mensagem de boas vindas.

SET SERVEROUTPUT ON

BEGIN
    dbms_output.put_line('Bem vindo, Impressionador(a)!');
END;


-- 2). Bloco de declara��o

-- Exemplo 2: Refa�a o exerc�cio anterior, dessa vez usando uma vari�vel.
SET SERVEROUTPUT ON

DECLARE
    texto VARCHAR2(50);
BEGIN
    texto := 'SQL Impressionador';
    dbms_output.put_line(texto || ', Seja bem vindo!');
END;


-- 3) Bloco de exce��o
-- Podemos tratar os erros utilizando a instru��o EXCEPTION.
SET SERVEROUTPUT ON

DECLARE
    var1 INT;
    var2 INT;
BEGIN
    var1 := 100;
    var2 := 'A';
    dbms_output.put_line(var1 + var2);
    EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('FATAL ERROR!!!');
END;



-- Exemplo: Calcule a receita de uma venda de 10 celulares, ao valor de R$1500 cada.

DECLARE
-- Declara��o das vari�veis
    vQuantidade INT;
    vPreco NUMBER(10, 2);
    vReceita NUMBER(10, 2);
BEGIN
    /*
    *
    **** An�lise de Receita de Venda
    **** Autor: Cassio de Oliveira
    **** Data: 28/09/2024
    */
    
    vQuantidade := 10;
    vPreco := 1500;
    vReceita := vQuantidade * vPreco;
    dbms_output.put_line('Quantidade vendida: ' || vQuantidade);  -- Retorna a quantidade vendida
    dbms_output.put_line('Pre�o unit�rio: ' || vPreco);           -- Retorna o pre�o unit�rio
    dbms_output.put_line('Receita total: ' || vReceita);          -- Retorna a receita total

END;



-- II. Utilizando fun��es dentro de blocos an�nimos
-- Exemplo: Em um determinado m�s, uma empresa enviou 137 propostas no valor de R$1.000 e conseguiu fechar 25 contratos. 
-- Calcule a receita total (em R$) e a convers�o (com 4 casas decimais).

DECLARE
    -- Declara��o das vari�veis de an�lise
    
    vPropostasEnv INT;
    vContratosAss INT;
    vValorContrato NUMBER(10,2);
    vConversao NUMBER(10, 4);
    vReceita NUMBER(10, 2);
BEGIN
    /*
    *
    **** An�lise de Convers�o
    **** Autor: Cassio de Oliveira
    **** Data: 28/09/2024
    */
    
    vPropostasEnv := 137;
    vContratosAss := 25;
    vValorContrato := 1000;
    vReceita := vContratosAss * vValorContrato;
    vConversao := (vContratosAss / vPropostasEnv) * 100;
    dbms_output.put_line('Propostas enviadas: ' || vPropostasEnv); 
    dbms_output.put_line('Contratos assinados: ' || vContratosAss); 
    dbms_output.put_line('Receita total: ' || TRIM (TO_CHAR(vReceita, 'L999G999D99')));
    dbms_output.put_line('Convers�o (%): ' || ROUND(vConversao, 2));     

END;


-- III. Blocos An�nimos aninhados e escopo de vari�veis

DECLARE
    vBloco1 INT;
BEGIN
    vBloco1 := 10;
    dbms_output.put_line('Vari�vel do bloco 1: ' || vBloco1);

    DECLARE
        vBloco2 INT;    
    BEGIN
        vBloco2 := 20;
        dbms_output.put_line('Vari�vel do bloco 1: ' || vBloco1);
        dbms_output.put_line('Vari�vel do bloco 2: ' || vBloco2);
    END;
    
    dbms_output.put_line('Vari�vel do bloco 1: ' || vBloco1);
    
END;





