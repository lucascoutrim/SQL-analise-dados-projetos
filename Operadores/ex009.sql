-- 1-) Calculando quantos salários mínimos ganha cada cliente da tabela 
-- sales.customers. Selecione as colunas de: email, income e a coluna calculada "salários mínimos"
-- Considere o salário mínimo igual à R$1200

select
	email, -- seleciona o email do cliente
	income, -- seleciona a renda do cliente
	(income) / 1200 as "salários mínimos" -- calcula quantos salários mínimos o cliente ganha
from sales.customers; -- define a tabela de onde os dados serão puxados


-- 2-) Na query anterior acrescentei uma coluna informando TRUE se o cliente
-- ganha acima de 5 salários mínimos e FALSE se ganha 4 salários ou menos.
-- E chamei a nova coluna de "acima de 4 salários"

select
	email, -- seleciona o email do cliente
	income, -- seleciona a renda do cliente
	(income) / 1200 as "salários mínimos", -- calcula quantos salários mínimos o cliente ganha
	((income) / 1200) > 4 as "acima de 4 salários" -- retorna true se ganha acima de 4 salários
from sales.customers; -- define a tabela de onde os dados serão puxados


-- 3-) Na query anterior filtrei apenas os clientes que ganham entre
-- 4 e 5 salários mínimos. E utilizei o comando BETWEEN

select
	email, -- seleciona o email do cliente
	income, -- seleciona a renda do cliente
	(income) / 1200 as "salários mínimos", -- calcula quantos salários mínimos o cliente ganha
	((income) / 1200) > 4 as "acima de 4 salários" -- retorna true se ganha acima de 4 salários
from sales.customers -- define a tabela de onde os dados serão puxados
where ((income) / 1200) between 4 and 5; -- filtra clientes que ganham entre 4 e 5 salários mínimos


-- 4-)Selecionei o email, cidade e estado dos clientes que moram no estado de 
-- Minas Gerais e Mato Grosso.

select 
	email, -- seleciona o email
	city, -- seleciona a cidade
	state -- seleciona o estado
from sales.customers -- define a tabela
where state in ('MT', 'MG'); -- filtra clientes de mato grosso e minas gerais


--5-) Selecine o email, cidade e estado dos clientes que não 
-- moram no estado de São Paulo.
select 
	email, -- seleciona o email
	city, -- seleciona a cidade
	state -- seleciona o estado
from sales.customers -- define a tabela
where state not in ('SP'); -- filtra clientes que não são de são paulo


-- 6-) Selecinei os nomes das cidade que começam com a letra Z.
-- Dados da tabela temp_table.regions

select 
	city -- seleciona o nome da cidade
from temp_tables.regions -- define a tabela
where city ilike 'z%'; -- filtra cidades que começam com a letra z (sem diferenciar maiúsculas/minúsculas)