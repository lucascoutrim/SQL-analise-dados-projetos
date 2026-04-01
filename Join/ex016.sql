-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel

select 
	pro.brand,  -- Seleciona a marca do veículo
	count(*) as visitas  -- Conta quantas vezes cada marca foi visitada

from sales.funnel as fun  -- Tabela de funil (registra visitas)
left join sales.products as pro  -- Junta com a tabela de produtos (veículos)
	on fun.product_id = pro.product_id  -- Relaciona pelo ID do produto
group by pro.brand  -- Agrupa os resultados por marca
order by visitas desc;  -- Ordena da marca mais visitada para a menos visitada


-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel

select 
	sto.store_name,  -- Seleciona o nome da loja
	count(*) as visitas  -- Conta quantas visitas cada loja recebeu

from sales.funnel as fun  -- Tabela de funil (visitas)
left join sales.stores as sto  -- Junta com a tabela de lojas
	on fun.store_id = sto.store_id  -- Relaciona pelo ID da loja
group by sto.store_name  -- Agrupa os resultados por loja
order by visitas desc;  -- Ordena da loja mais visitada para a menos visitada



-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (porte)

select
	reg.size,  -- Seleciona o porte da cidade (ex: pequena, média, grande)
	count(*) as contagem  -- Conta quantos clientes existem em cada tipo de cidade
from sales.customers as cus  -- Tabela de clientes
left join temp_tables.regions as reg  -- Junta com a tabela de regiões
	on lower(cus.city) = lower(reg.city)  -- Relaciona pela cidade ignorando maiúsculas/minúsculas
	and lower(cus.state) = lower(reg.state)  -- Relaciona também pelo estado
group by reg.size  -- Agrupa os clientes por porte da cidade
order by contagem;  -- Ordena do menor para o maior número de clientes