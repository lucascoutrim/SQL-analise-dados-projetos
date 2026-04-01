-- PARA QUE SERVE ##################################################################
-- Servem para consultar dados de outras consultas.


-- TIPOS ###########################################################################
-- Subquery no WHERE
-- Subquery com WITH
-- Subquery no FROM
-- Subquery no SELECT


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Subquery no WHERE
-- Informe qual é o veículo mais barato da tabela products

select *  -- Retorna todas as colunas do produto
from sales.products  -- Tabela de produtos
where price = (select min(price) from sales.products);  -- Filtra apenas o(s) produto(s) com menor preço

select min(price) from sales.products;  -- Consulta separada que retorna o menor preço da tabela


-- (Exemplo 2) Subquery com WITH
-- Calcule a idade média dos clientes por status profissional

with alguma_tabela as (  -- Cria uma tabela temporária (CTE)
select
	professional_status,  -- Seleciona o status profissional
	(current_date - birth_date) /365 as idade  -- Calcula a idade aproximada
from sales.customers  -- Tabela de clientes
)

select
	professional_status,  -- Seleciona o status profissional
	avg(idade) as idade_media  -- Calcula a média das idades
from alguma_tabela  -- Usa a tabela temporária criada
group by professional_status;  -- Agrupa por status profissional


-- (Exemplo 3) Subquery no FROM
-- Calcule a média de idades dos clientes por status profissional

select
	professional_status,  -- Seleciona o status profissional
	avg(idade) as idade_media  -- Calcula a média das idades
from (
		select
			professional_status,  -- Seleciona o status profissional
			(current_date - birth_date) /365 as idade  -- Calcula a idade
		from sales.customers  -- Tabela de clientes
	) as alguma_tabela  -- Subquery tratada como uma tabela
group by professional_status;  -- Agrupa por status profissional


-- (Exemplo 4) Subquery no SELECT
-- Cria uma coluna com o número de visitas acumuladas por loja

select
	fun.visit_id,  -- ID da visita
	fun.visit_page_date,  -- Data da visita
	sto.store_name,  -- Nome da loja
	(
		select count(*)  -- Conta quantas visitas já aconteceram
		from sales.funnel as fun2  -- Outra referência da mesma tabela
		where fun2.visit_page_date <= fun.visit_page_date  -- Considera visitas até a data atual
			and fun2.store_id = fun.store_id  -- Apenas da mesma loja
	) as visitas_acumuladas  -- Nome da nova coluna calculada
from sales.funnel as fun  -- Tabela principal de visitas
left join sales.stores as sto  -- Junta com a tabela de lojas
	on fun.store_id = sto.store_id  -- Relaciona pelo ID da loja
order by sto.store_name, fun.visit_page_date;  -- Ordena por loja e data


-- RESUMO ##########################################################################
-- (1) Servem para consultar dados de outras consultas.
-- (2) Subqueries no WHERE e SELECT devem retornar apenas um valor
-- (3) Subqueries no FROM funcionam, mas WITH (CTE) é mais legível