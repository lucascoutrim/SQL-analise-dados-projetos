-- CONTEÚDO ########################################################################
-- Inserção de colunas
-- Alteração de colunas
-- Deleção de colunas


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Inserção de Colunas
-- Insira uma coluna na tabela sales.customers com a idade do cliente

alter table sales.customers  -- Define a tabela que será modificada
add customer_age int;  -- Adiciona uma nova coluna chamada customer_age do tipo inteiro

select * from sales.customers limit 10;  -- Visualiza as primeiras linhas da tabela

update sales.customers  -- Atualiza os dados da tabela
set customer_age = datediff('years', birth_date, current_date)  -- Calcula a idade do cliente
where true;  -- Aplica a atualização em TODAS as linhas (equivalente a não usar WHERE)



-- (Exemplo 2) Alteração do tipo da coluna
-- Altere o tipo da coluna customer_age de inteiro para varchar

alter table sales.customers  -- Define a tabela
alter column customer_age type varchar;  -- Altera o tipo da coluna para texto

select * from sales.customers limit 10;  -- Visualiza a alteração



-- (Exemplo 3) Alteração do nome da coluna
-- Renomeie o nome da coluna "customer_age" para "age"

alter table sales.customers  -- Define a tabela
rename column customer_age to age;  -- Renomeia a coluna

select * from sales.customers limit 10;  -- Visualiza a mudança



-- (Exemplo 4) Deleção de coluna
-- Delete a coluna "age"

alter table sales.customers  -- Define a tabela
drop column age;  -- Remove a coluna da tabela

select * from sales.customers limit 10;  -- Visualiza a tabela sem a coluna



-- RESUMO ##########################################################################
-- (1) ALTER TABLE é usado para modificar a estrutura da tabela
-- (2) ADD adiciona uma nova coluna
-- (3) ALTER COLUMN muda o tipo da coluna
-- (4) RENAME COLUMN altera o nome da coluna
-- (5) DROP COLUMN remove a coluna