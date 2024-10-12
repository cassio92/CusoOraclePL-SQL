-- Estruturas de Controle


-- I. Comando IF

/*
*** Sintaxe

IF condicao
THEN
    comandos
ELSE
    comandos
END IF;
*/


-- Exemplo 1. Existe um indicador chamado NPS que mede a satisfa��o de um cliente em rela��o a um produto/servi�o.
-- Este indicador se trata da uma nota de 0 a 10, onde o cliente pode se encaixar em uma das 3 categorias abaixo, 
-- de acordo com a sua nota.

-- Promotor: Nota entre 9-10
-- Neutro: Nota entre 7-8
-- Detrator: Nota entre 0-6

-- Crie um programa que receba um determinado NPS de um cliente e o classifique de acordo com a sua nota.

SET SERVEROUTPUT ON;

ACCEPT resposta PROMPT 'Digite o NPS do cliente.';

DECLARE
    vNPS NUMBER(10, 2) := &resposta;
BEGIN

    IF vNPS >= 9 THEN
        dbms_output.put_line('Este cliente � um PROMOTOR. Nota: ' || vNPS);
    ELSE
        IF vNPS >= 7 THEN
            dbms_output.put_line('Este cliente � NEUTRO. Nota: ' || vNPS);
        ELSE
            dbms_output.put_line('Este cliente � um DETRATOR. Nota: ' || vNPS); 
        END IF;
    END IF;

END;



















-- Exemplo 2: Fa�a uma altera��o nos pre�os dos produtos da tabela PRODUTOS do banco MARCUS.
-- O usu�rio deve conseguir inserir uma categoria e, de acordo com ela, atualizar com um % de desconto.

-- Celular: 10% de desconto
-- Notebook: 20% de desconto
-- Televis�o: 50% de desconto

SET SERVEROUTPUT ON;

ACCEPT resposta PROMPT 'Insira a categoria que receber� o desconto.'

DECLARE
    vCategoria VARCHAR2(100) := '&resposta';
    vPercentualDesconto NUMBER(10, 2);
BEGIN

    IF vCategoria = 'Celular' THEN
        vPercentualDesconto := 15;
    ELSE
        IF vCategoria = 'Notebook' THEN
            vPercentualDesconto := 20;
        ELSE
            vPercentualDesconto := 50;
        END IF;
    END IF;
    
    UPDATE produtos
    SET preco_unit = preco_unit - preco_unit * vPercentualDesconto / 100
    WHERE categoria = vCategoria;
    
    dbms_output.put_line('Desconto aplicado com sucesso!');
    
END;

SELECT * FROM produtos;


ROLLBACK;
























-- II. Comando CASE

/*
*** Sintaxe

CASE
WHEN condicao
    comandos
WHEN condicao
    comandos
ELSE
    comandos
END CASE;
*/


-- Exemplo 1. Existe um indicador chamado NPS que mede a satisfa��o de um cliente em rela��o a um produto/servi�o.
-- Este indicador se trata da uma nota de 0 a 10, onde o cliente pode se encaixar em uma das 3 categorias abaixo, 
-- de acordo com a sua nota.

-- Promotor: Nota entre 9-10
-- Neutro: Nota entre 7-8
-- Detrator: Nota entre 0-6

-- Crie um programa que receba um determinado NPS de um cliente e o classifique de acordo com a sua nota.

SET SERVEROUTPUT ON;

ACCEPT resposta PROMPT 'Digite o NPS do cliente.';

DECLARE
    vNPS NUMBER(10, 2) := &resposta;
BEGIN

    CASE
        WHEN vNPS >= 9 THEN
            dbms_output.put_line('Este cliente � PROMOTOR. Nota: ' || vNPS);
        WHEN vNPS >= 7 THEN
            dbms_output.put_line('Este cliente � NEUTRO. Nota: ' || vNPS);
        ELSE
            dbms_output.put_line('Este cliente � DETRATOR. Nota: ' || vNPS);
    END CASE;

END;




















-- III. Comando LOOP B�sico

-- Objetivo: Permite criar uma estrutura de repeti��o sem a necessidade de especificar uma condi��o ou um contador.

-- Exemplo 1: Fa�a um contador que printe na tela valores desde um valor inicial at� um valor limite,
-- que dever� ser passado atrav�s de uma vari�vel (usando o comando ACCEPT).

SET SERVEROUTPUT ON;

ACCEPT resposta PROMPT 'Informe o valor limite da sequ�ncia.';

DECLARE
    vContador INT := 1;
    vFinal INT := &resposta;
BEGIN

    LOOP
        dbms_output.put_line('O contador �: ' || vContador);
        EXIT WHEN vContador = vFinal;
            vContador := vContador + 1;
    END LOOP;
END;















-- IV. Comando FOR LOOP

-- O FOR LOOP permite criar uma estrutura de repeti��o 

-- Exemplo 2: Fa�a um contador que printe na tela valores desde um valor inicial at� um valor limite,
-- que dever� ser passado atrav�s de uma vari�vel (usando o comando ACCEPT).

SET SERVEROUTPUT ON;
ACCEPT resposta PROMPT 'Informe o valor limite da sequ�ncia.'

DECLARE
    vInicial INT := 1;
    vFinal INT := &resposta;
BEGIN
    
    FOR i IN vInicial..vFinal LOOP
        dbms_output.put_line('O valor �: ' || i);    
    END LOOP;
    
END;









-- V. Comando WHILE LOOP

-- O WHILE LOOP permite criar uma estrutura de repeti��o 

-- Exemplo 3: Fa�a um contador que printe na tela valores desde um valor inicial at� um valor limite,
-- que dever� ser passado atrav�s de uma vari�vel (usando o comando ACCEPT).

SET SERVEROUTPUT ON;
ACCEPT vFinal PROMPT 'Informe o valor limite da sequ�ncia.'

DECLARE
    vContador INT := 1;
    vFinal INT := &vFinal;
BEGIN
    
    WHILE vContador <= vFinal LOOP
        dbms_output.put_line('O valor �: ' || vContador);
        vContador := vContador + 1;
    END LOOP;
    
END;




