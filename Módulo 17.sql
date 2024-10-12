-- PROCEDURES

-- 1. O que � uma Procedure
-- 2. Por que usar uma Procedure
-- 3. Sintaxe de uma Procedure
-- 4. Exemplos de Procedures
-- 5. Como excluir uma Procedure



-- 1. O que � uma Procedure
-- � um bloco de c�digo que possui um nome e pode ser armazenado no banco de dados.
-- Ele pode incluir uma s�rie de comandos SQL para executar alguma tarefa.


-- 2. Por que usar uma Procedure
-- Procedures s�o usadas para fazer tarefas repetitivas que n�o s�o poss�veis em queries do SQL.
-- Pode incluir estruturas de controle e comandos DDL, DML, TCL.


-- 3. Sintaxe de uma Procedure
/*

CREATE OR REPLACE PROCEDURE pr_name(p1 INT, p2 VARCHAR2)
AS
    vari�veis...
BEGIN

    instru��es da procedure - comandos

END pr_name;
*/


-- Exemplos de Procedures

-- Exemplo 1. Crie uma Procedure de Boas Vindas.

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE boas_vindas
AS
BEGIN

    dbms_output.put_line('Bem vindo, Impressionador!');

END boas_vindas;


EXEC boas_vindas;















-- Exemplo 2: Crie uma procedure para cadastrar uma nova venda de um produto (com par�metros).
-- Produto: iPhone 11
-- Cliente: B�rbara Campos
-- Quantidade: 1


-- 1� Passo: Definir as vari�veis a serem utilizadas.
-- 2� Passo: Armazenar o valor de id_produto de acordo com o produto vendido
-- 3� Passo: Armazenar o valor de id_cliente de acordo com o nome do cliente
-- 4� Passo: Utilizar o INSERT INTO para inserir os dados na tabela vendas
-- 5� Passo: Atualizar a tabela produtos com o estoque final


SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM vendas;

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE registro_venda(vNomeProduto VARCHAR2, vNomeCliente VARCHAR2, vQuantidadeVendida INT)
AS

    vIdProduto INT;
    vIdCliente INT;
    vEstoque INT;

BEGIN
    
    SELECT estoque
    INTO vEstoque
    FROM produtos
    WHERE nome_produto = vNomeproduto;
    
    IF vEstoque >= vQuantidadeVendida THEN
    
        SELECT id_produto
        INTO vIdProduto
        FROM produtos
        WHERE nome_produto = vNomeProduto;
        
        SELECT id_cliente
        INTO vIdCliente
        FROM clientes
        WHERE nome_cliente = vNomeCliente;
        
        INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade) VALUES
            (vendas_seq.NEXTVAL, sysdate, vIdCliente, vIdProduto, vQuantidadeVendida);
            
        
        UPDATE produtos
        SET estoque = (estoque - vQuantidadeVendida)
        WHERE id_produto = vIdProduto;
        
        COMMIT;
    
        dbms_output.put_line('Venda registrada com sucesso!');
    
    ELSE
        
        dbms_output.put_line('Venda n�o realizada por falta de estoque!');
    END IF;


END registro_venda;


EXEC registro_venda('Samsung S22', 'Juliana Pires', 100);


SELECT * FROM vendas;
SELECT * FROM produtos;
























-- Exemplo 3: Crie uma procedure para cadastrar uma nova venda de um produto (com par�metros)

SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM vendas;

SET SERVEROUTPUT ON:

CREATE OR REPLACE PROCEDURE registro_venda2(vNomeProduto VARCHAR2, vNomeCliente VARCHAR2, vQuantidade INT)
AS
    vIdProduto INT;
    vPreco NUMBER(10, 2);
    vIdCliente INT;
    vEstoque INT;
BEGIN

    SELECT estoque
    INTO vEstoque
    FROM produtos
    WHERE nome_produto = vNomeProduto;
    
    IF vEstoque >= vQuantidade THEN
    
        SELECT id_produto, preco_unit
        INTO vIdProduto, vPreco
        FROM produtos
        WHERE nome_produto = vNomeProduto;
        
        SELECT id_cliente
        INTO vIdCliente
        FROM clientes 
        WHERE nome_cliente = vNomeCliente;
        
        INSERT INTO vendas(id_venda, data_venda, id_cliente, id_produto, quantidade)
            VALUES (vendas_seq.NEXTVAL, sysdate, vIdCliente, vIdProduto, vQuantidade);
        
        UPDATE produtos
        SET estoque = (estoque - vQuantidade)
        WHERE id_produto = vIdProduto;
        
        COMMIT;
        
        dbms_output.put_line('Venda realizada com sucesso!');
    
    ELSE
        dbms_output.put_line('Venda n�o realizada por falta de estoque!');
    END IF;
END registro_venda2;


EXEC registro_venda2('Moto G60', 'Helen Viana', 50);

SELECT * FROM vendas;
SELECT * FROM produtos;


-- 5. Excluindo Procedures

DROP PROCEDURE registro_venda;





























-- 6. Functions vs. Procedures
/*

Temos abaixo uma lista de principais diferen�as entre Functions e Procedures.

Diferen�a 1.
- Procedures s�o usadas para executar um processo, uma sequ�ncia de comandos e blocos SQL.
- Functions s�o usadas para fazer c�lculos

Diferen�a 2.
- Procedures n�o podem ser 'chamadas' dentro da cl�usula SELECT
- Functions podem ser 'chamadas' dentro da cl�usula SELECT (desde que n�o contenham comandos SELECT)

Diferen�a 3.
- Procedures n�o precisam retornar nenhum valor
- Functions precisam retornar algum valor










*/


