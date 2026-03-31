-- PARA QUE SERVE ##################################################################
-- Usados para unir expressões simples em uma composta

-- TIPOS ###########################################################################
-- AND
-- OR
-- NOT
-- BETWEEN
-- IN
-- LIKE
-- ILIKE
-- IS NULL


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Uso do comando BETWEEN 
-- Selecione veículos que custam entre 100k e 200k na tabela products
select * -- seleciona todas as colunas
from sales.products -- define a tabela de onde os dados serão puxados (schema sales, tabela products)
where price >= 100000 and price <= 200000; -- filtra produtos com preço entre 100000 e 200000

select * -- seleciona todas as colunas
from sales.products -- define a tabela de onde os dados serão puxados (schema sales, tabela products)
where price between 100000 and 200000; -- filtra produtos com preço entre 100000 e 200000 (forma mais simples)


-- (Exemplo 2)  Uso do comando NOT
-- Selecione veículos que custam abaixo de 100k ou acima 200k 

select * -- seleciona todas as coluna
from sales.products -- define a tabela de onde os dados serão puxados (schema sales, tabela products)
where price < 100000 or price > 200000; -- filtra produtos fora da faixa entre 100000 e 200000


select * -- seleciona todas as colunas
from sales.products -- define a tabela de onde os dados serão puxados (schema sales, tabela products)
where price not between 100000 and 200000; -- filtra produtos fora da faixa entre 100000 e 200000 (forma mais simples)


-- (Exemplo 3) Uso do comando IN
-- Selecionar produtos que sejam da marca HONDA, TOYOTA ou RENAULT

select * -- seleciona todas as colunas
from sales.products -- define a tabela de onde os dados serão puxados (schema sales, tabela products)
where brand = 'HONDA' or brand = 'TOYOTA' or brand = 'RENAULT'; -- filtra produtos das marcas honda, toyota ou renault


select * -- seleciona todas as colunas
from sales.products -- define a tabela de onde os dados serão puxados (schema sales, tabela products)
where brand in ('HONDA', 'TOYOTA','RENAULT'); -- filtra produtos das marcas honda, toyota ou renault (forma mais simples)




-- (Exemplo 4) Uso do comando LIKE (matchs imperfeitos)
-- Selecione os primeiros nomes distintos da tabela customers que começam
-- com as iniciais ANA

select distinct first_name -- seleciona nomes sem repetição
from sales.customers -- define a tabela de onde os dados serão puxados (schema sales, tabela customers)
where first_name = 'ANA'; -- filtra apenas o nome exatamente igual a ANA

select distinct first_name -- seleciona nomes sem repetição
from sales.customers -- define a tabela de onde os dados serão puxados (schema sales, tabela customers)
where first_name like 'ANA%'; -- filtra nomes que começam com ANA (ex: ana, anabela, anaclara)


-- (Exemplo 5) Uso do comando ILIKE (ignora letras maiúsculas e minúsculas)
-- Selecione os primeiros nomes distintos com iniciais 'ana'

select distinct first_name -- seleciona nomes sem repetição
from sales.customers -- define a tabela de onde os dados serão puxados (schema sales, tabela customers)
where first_name like 'ana%'; -- filtra nomes que começam com "ana" (sensível a maiúsculas/minúsculas)


select distinct first_name -- seleciona nomes sem repetição
from sales.customers -- define a tabela de onde os dados serão puxados (schema sales, tabela customers)
where first_name ilike 'ana%'; -- filtra nomes que começam com "ana" (não diferencia maiúsculas/minúsculas)


-- (Exemplo 6) Uso do comando IS NULL
-- Selecionar apenas as linhas que contém nulo no campo "population" na tabela
-- temp_tables.regions

select * -- seleciona todas as colunas
from temp_tables.regions; -- define a tabela de onde os dados serão puxados (schema temp_tables, tabela regions)



select * -- seleciona todas as colunas
from temp_tables.regions -- define a tabela de onde os dados serão puxados (schema temp_tables, tabela regions)
where population is null; -- filtra apenas registros onde a população é nula


-- RESUMO ##########################################################################
-- (1) Usados para unir expressões simples em uma composta
-- (2) AND: Verifica se duas comparações são simultaneamente verdadeiras
-- (3) OR: Verifica se uma ou outra comparação é verdadeiras
-- (4) BETWEEN: Verifica quais valores estão dentro do range definido
-- (5) IN: Funciona como multiplos ORs
-- (6) LIKE e ILIKE: Comparam textos e são sempre utilizados em conjunto com o 
-- operador %, que funciona como um coringa, indicando que qualquer texto pode 
-- aparecer no lugar do campo
-- (7) ILIKE ignora se o campo tem letras maiúsculas ou minúsculas na comparação
-- (8) IS NULL: Verifica se o campo é nulo
-- (9) Utilize o Guia de comandos para consultar os operadores utilizados no SQL
