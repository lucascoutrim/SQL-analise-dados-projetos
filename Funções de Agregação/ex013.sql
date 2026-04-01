-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Conte quantos clientes da tabela sales.customers tem menos de 30 anos

select count(*)  -- Conta quantos clientes atendem a condição
from sales.customers  -- Tabela de clientes
where ((current_date - birth_date) / 365 ) < 30;  -- Calcula a idade aproximada e filtra clientes com menos de 30 anos



-- (Exercício 2) Informe a idade do cliente mais velho e mais novo da tabela sales.customers

select 
	max((current_date - birth_date) / 365 ),  -- Retorna a maior idade (cliente mais velho)
	min((current_date - birth_date) / 365 )  -- Retorna a menor idade (cliente mais novo)
from sales.customers;  -- Tabela de clientes



-- (Exercício 3) Selecione todas as informações do cliente mais rico da tabela sales.customers
-- (possivelmente a resposta contém mais de um cliente)

select *  -- Retorna todas as colunas do cliente
from sales.customers  -- Tabela de clientes
where income = (select max(income) from sales.customers);  -- Filtra apenas clientes com a maior renda da tabela



-- (Exercício 4) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- Ordene o resultado pelo nome da marca

select brand, count(*)  -- Seleciona a marca e conta quantos veículos existem por marca
from sales.products  -- Tabela de produtos (veículos)
group by brand  -- Agrupa os registros por marca
order by brand;  -- Ordena em ordem alfabética pelo nome da marca



-- (Exercício 5) Conte quantos veículos existem registrados na tabela sales.products
-- por marca e ano do modelo. Ordene pela nome da marca e pelo ano do veículo

select brand, model_year, count(*)  -- Seleciona marca, ano e conta os veículos
from sales.products  -- Tabela de produtos
group by brand, model_year  -- Agrupa por marca e ano do modelo
order by brand, model_year;  -- Ordena primeiro pela marca e depois pelo ano



-- (Exercício 6) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- e mostre apenas as marcas que contém mais de 10 veículos registrados

select brand, count(*)  -- Seleciona a marca e conta os veículos
from sales.products  -- Tabela de produtos
group by brand  -- Agrupa os registros por marca
having count(*) > 10;  -- Filtra apenas marcas com mais de 10 veículos