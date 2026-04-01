-- PARA QUE SERVE ##################################################################
-- Serve para filtrar linhas da seleção por uma coluna agrupada


-- EXEMPLOS ########################################################################

-- (Exemplo 1) seleção com filtro no HAVING 
-- Calcule o nº de clientes por estado filtrando apenas estados acima de 100 clientes

select state,  -- Seleciona o estado
    count(*)  -- Conta quantos clientes existem em cada estado
from sales.customers  -- Tabela de clientes
group by state  -- Agrupa os registros por estado
having count(*) > 100  -- Filtra apenas os grupos (estados) com mais de 100 clientes
    and state <> 'MG';  -- Exclui o estado de MG mesmo que tenha mais de 100 clientes


-- RESUMO ##########################################################################
-- (1) Tem a mesma função do WHERE mas pode ser usado para filtrar os resultados 
-- das funções agregadas enquanto o WHERE possui essa limitação
-- (2) A função HAVING também pode filtrar colunas não agregadas