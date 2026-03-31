-- PARA QUE SERVE ##################################################################
-- Servem para comparar dois valores retornando TRUE ou FALSE
-- Muito utilizado em conjunto com a função WHERE para filtrar linhas de uma seleção


-- TIPOS ###########################################################################
-- =  -- igual
-- >  -- maior que
-- <  -- menor que
-- >= -- maior ou igual
-- <= -- menor ou igual
-- <> -- diferente


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Uso de operadores como flag
-- Crie uma coluna que retorne TRUE sempre que um cliente for um profissional clt 

select
	customer_id, -- seleciona o id do cliente
	first_name, -- seleciona o primeiro nome
	professional_status, -- seleciona o status profissional
	(professional_status = 'clt') as cliente_clt -- retorna true ou false se o cliente for clt
from sales.customers; -- define a tabela de onde os dados serão puxados (schema sales, tabela customers)


-- RESUMO ##########################################################################
-- (1) Servem para comparar dois valores retornando TRUE ou FALSE
-- (2) Muito utilizado em conjunto com a função WHERE para filtrar linhas de uma 
-- seleção
-- (3) Utilizados para criar colunas Flag que retornem TRUE ou FALSE
-- (4) Utilize o Guia de comandos para consultar os operadores utilizados no SQL





