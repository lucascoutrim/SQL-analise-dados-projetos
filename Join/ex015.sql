-- EXERCÍCIOS ########################################################################

-- (Exemplo 1) Identifique qual é o status profissional mais frequente nos clientes 
-- que compraram automóveis no site

select 
	cus.professional_status,  -- Seleciona o status profissional do cliente
	count(fun.paid_date) as pagamentos  -- Conta quantas compras (pagamentos) foram feitas por esse grupo

from sales.funnel as fun  -- Tabela de funil (onde estão os registros de visitas e compras)
left join sales.customers as cus  -- Junta com a tabela de clientes
	on fun.customer_id = cus.customer_id  -- Relaciona as tabelas pelo ID do cliente
group by cus.professional_status  -- Agrupa os resultados por status profissional
order by pagamentos desc;  -- Ordena do maior para o menor número de compras






-- (Exemplo 2) Identifique qual é o gênero mais frequente nos clientes que compraram
-- automóveis no site. Obs: Utilizar a tabela temp_tables.ibge_genders

select * from temp_tables.ibge_genders limit 10;  -- Visualiza os primeiros registros da tabela de gêneros

select
	ibge.gender,  -- Seleciona o gênero identificado
	count(fun.paid_date)  -- Conta quantas compras foram feitas por cada gênero
from sales.funnel as fun  -- Tabela de funil
left join sales.customers as cus  -- Junta com clientes
	on fun.customer_id = cus.customer_id  -- Relaciona pelo ID do cliente
left join temp_tables.ibge_genders as ibge  -- Junta com tabela de gêneros
	on lower(cus.first_name) = ibge.first_name  -- Relaciona pelo primeiro nome (convertendo para minúsculo)
group by ibge.gender;  -- Agrupa os resultados por gênero



-- (Exemplo 3) Identifique de quais regiões são os clientes que mais visitam o site
-- Obs: Utilizar a tabela temp_tables.regions

select * from sales.customers limit 10;  -- Visualiza clientes
select * from temp_tables.regions limit 10;  -- Visualiza regiões

select
	reg.region,  -- Seleciona a região do cliente
	count(fun.visit_page_date) as visitas  -- Conta quantas visitas ao site foram feitas por região

from sales.funnel as fun  -- Tabela de funil (visitas)
left join sales.customers as cus  -- Junta com clientes
	on fun.customer_id = cus.customer_id  -- Relaciona pelo ID do cliente
left join temp_tables.regions as reg  -- Junta com tabela de regiões
	on lower(cus.city) = lower(reg.city)  -- Relaciona pela cidade (ignorando maiúsculas/minúsculas)
	and lower(cus.state) = lower(reg.state)  -- Relaciona também pelo estado
group by reg.region  -- Agrupa os resultados por região
order by visitas desc;  -- Ordena da região com mais visitas para a menor