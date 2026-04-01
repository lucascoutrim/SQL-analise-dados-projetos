-- EXEMPLOS ########################################################################

-- (Exemplo 1) Análise de recorrência dos leads
-- Calcule o volume de visitas por dia ao site separado por 1ª visita e demais visitas

with primeira_visita as (  -- Cria uma CTE (tabela temporária)
	select customer_id, min(visit_page_date) as visita_1  -- Para cada cliente, pega a data da primeira visita
	from sales.funnel  -- Tabela de visitas
	group by customer_id  -- Agrupa por cliente
)

select
	fun.visit_page_date,  -- Data da visita
	(fun.visit_page_date <> primeira_visita.visita_1) as lead_recorrente,  -- TRUE = visita recorrente | FALSE = primeira visita
	count(*)  -- Conta quantas visitas existem nessa condição

from sales.funnel as fun  -- Tabela principal de visitas
left join primeira_visita  -- Junta com a tabela da primeira visita
	on fun.customer_id = primeira_visita.customer_id  -- Relaciona pelo cliente
group by fun.visit_page_date, lead_recorrente  -- Agrupa por data e tipo de visita (nova ou recorrente)
order by fun.visit_page_date desc, lead_recorrente;  -- Ordena por data (mais recente primeiro)



-- (Exemplo 2) Análise do preço versus o preço médio
-- Calcule, para cada visita, quanto o preço do veículo estava acima ou abaixo da média da marca

with preco_medio as (  -- Cria uma CTE com o preço médio por marca
	select brand, avg(price) as preco_medio_da_marca  -- Calcula a média de preço por marca
	from sales.products  -- Tabela de produtos
	group by brand  -- Agrupa por marca
)

select
	fun.visit_id,  -- ID da visita
	fun.visit_page_date,  -- Data da visita
	pro.brand,  -- Marca do veículo
	(pro.price * (1 + fun.discount)) as preco_final,  -- Calcula o preço final considerando desconto/aumento
	preco_medio.preco_medio_da_marca,  -- Traz a média de preço da marca
	((pro.price * (1 + fun.discount)) - preco_medio.preco_medio_da_marca) as preco_vs_media  -- Diferença entre preço final e média

from sales.funnel as fun  -- Tabela de visitas
left join sales.products as pro  -- Junta com produtos
	on fun.product_id = pro.product_id  -- Relaciona pelo ID do produto
left join preco_medio  -- Junta com a tabela de preço médio
	on pro.brand = preco_medio.brand;  -- Relaciona pela marca