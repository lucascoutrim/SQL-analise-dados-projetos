-- ##################################################################
-- PARA QUE SERVE
-- Funções agregadas servem para executar operações aritméticas ou de contagem
-- nos registros de uma coluna, resumindo os dados da tabela.
-- ##################################################################

-- ##################################################################
-- TIPOS DE FUNÇÕES AGREGADAS
-- COUNT() -> Conta registros
-- SUM()   -> Soma valores de uma coluna
-- MIN()   -> Retorna o menor valor de uma coluna
-- MAX()   -> Retorna o maior valor de uma coluna
-- AVG()   -> Calcula a média dos valores de uma coluna
-- ##################################################################


-- ##################################################################
-- EXEMPLOS DE COUNT()
-- ##################################################################

-- (Exemplo 1) Contagem de todas as linhas da tabela
-- Conte todas as visitas realizadas ao site da empresa fictícia

select count(*)  -- Conta todas as linhas da tabela sales.funnel
from sales.funnel;  -- Tabela do funil de vendas

-- (Exemplo 2) Contagem das linhas de uma coluna
-- Conte todos os pagamentos registrados na tabela sales.funnel

select *  -- Exibe todas as colunas da tabela
from sales.funnel
limit 10;  -- Limita a exibição aos 10 primeiros registros

select count(paid_date)  -- Conta quantos registros da coluna paid_date não são NULL
from sales.funnel;  -- Na tabela sales.funnel

-- (Exemplo 3) Contagem distinta de uma coluna
-- Conte todos os produtos distintos visitados em janeiro de 2021

select count(distinct product_id)  -- Conta apenas produtos distintos
from sales.funnel
where visit_page_date between '2021-01-01' and '2021-01-31';  -- Considera apenas visitas de janeiro


-- ##################################################################
-- OUTRAS FUNÇÕES AGREGADAS
-- ##################################################################

-- (Exemplo 4) Calcule o preço mínimo, máximo e médio dos produtos

select min(price), max(price), avg(price)  -- Retorna preço mínimo, máximo e média
from sales.products;  -- Na tabela products

-- (Exemplo 5) Informe qual é o veículo mais caro

select max(price)  -- Retorna o maior preço da tabela products
from sales.products;

select *  -- Retorna todas as informações do produto
from sales.products
where price = (select max(price) from sales.products);  -- Filtra apenas o produto com o maior preço


-- ##################################################################
-- RESUMO
-- 1) Servem para executar operações aritméticas nos registros de uma coluna
-- 2) Funções agregadas não computam valores NULL
-- 3) COUNT(*) conta todos os registros
-- 4) COUNT(DISTINCT coluna) conta apenas valores exclusivos
-- ##################################################################