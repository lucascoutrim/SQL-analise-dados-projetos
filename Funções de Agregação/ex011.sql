-- PARA QUE SERVE ##################################################################
-- Serve para agrupar registros semelhantes de uma coluna
-- Normalmente utilizado em conjunto com as Funções de agregação


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Contagem agrupada de uma coluna
-- Calcule o nº de clientes da tabela customers por estado

select state, count(*) as contagem  -- Seleciona o estado e conta quantos clientes existem em cada estado
from sales.customers  -- Tabela de clientes
group by state  -- Agrupa todos os registros que possuem o mesmo estado
order by contagem desc;  -- Ordena do maior para o menor número de clientes


-- (Exemplo 2) Contagem agrupada de várias colunas
-- Calcule o nº de clientes por estado e status profissional 

select state, professional_status, count(*) as contagem  -- Seleciona estado, status profissional e conta os registros
from sales.customers  -- Tabela de clientes
group by state, professional_status  -- Agrupa pelos dois campos (estado + status)
order by state, contagem desc;  -- Ordena por estado e depois pela contagem (maior primeiro)


-- (Exemplo 3) Seleção de valores distintos
-- Selecione os estados distintos na tabela customers utilizando o group by

select distinct state  -- Retorna apenas estados únicos (sem repetição)
from sales.customers;

select state  -- Seleciona o estado
from sales.customers  -- Tabela de clientes
group by state;  -- Agrupa por estado (funciona como DISTINCT, removendo duplicados)


-- RESUMO ##########################################################################
-- (1) Serve para agrupar registros semelhantes de uma coluna, 
-- (2) Normalmente utilizado em conjunto com as Funções de agregação
-- (3) Pode-se usar posição das colunas (ex: GROUP BY 1,2)
-- (4) GROUP BY sozinho funciona como DISTINCT, eliminando duplicados