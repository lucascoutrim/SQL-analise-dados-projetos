-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada cliente

with numero_de_visitas as (  -- Cria uma CTE (tabela temporária)
	select customer_id, count(*) as n_visitas  -- Conta quantas visitas cada cliente realizou
	from sales.funnel  -- Tabela de visitas
	group by customer_id  -- Agrupa por cliente para contar individualmente
)

select
	cus.*,  -- Seleciona todas as colunas da tabela de clientes
	n_visitas  -- Adiciona a coluna com o número de visitas do cliente

from sales.customers as cus  -- Tabela principal de clientes
left join numero_de_visitas as ndv  -- Junta com a tabela de número de visitas
	on cus.customer_id = ndv.customer_id;  -- Relaciona pelo ID do cliente