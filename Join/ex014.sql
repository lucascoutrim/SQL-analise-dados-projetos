-- PARA QUE SERVE ##################################################################
-- Servem para combinar colunas de uma ou mais tabelas


-- SINTAXE #########################################################################

select t1.coluna_1, t1.coluna_1, t2.coluna_1, t2.coluna_2  -- Seleciona colunas específicas das duas tabelas (t1 e t2)
from schema.tabela_1 as t1  -- Define a primeira tabela e cria um apelido (alias) t1
ALGUM join schema.tabela_2 as t2  -- Define o tipo de JOIN e a segunda tabela com alias t2
    on condição_de_join  -- Define a condição que relaciona as tabelas (ex: chave em comum)


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Utilize o LEFT JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2

select * from temp_tables.tabela_1;  -- Mostra todos os dados da tabela 1
select * from temp_tables.tabela_2;  -- Mostra todos os dados da tabela 2

select t1.cpf, t1.name, t2.state  -- Seleciona CPF e nome da tabela 1 + estado da tabela 2
from temp_tables.tabela_1 as t1  -- Tabela principal (esquerda)
join temp_tables.tabela_2 as t2  -- JOIN padrão (INNER JOIN)
	on t1.cpf = t2.cpf;  -- Relaciona as tabelas pelo CPF (chave em comum)


-- (Exemplo 2) Utilize o INNER JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2

select t1.cpf, t1.name, t2.state  -- Seleciona dados das duas tabelas
from temp_tables.tabela_1 as t1  -- Tabela 1 com alias t1
inner join temp_tables.tabela_2 as t2  -- Retorna apenas registros que existem nas duas tabelas
	on t1.cpf = t2.cpf;  -- Condição de junção (CPF igual nas duas tabelas)


-- (Exemplo 3) Utilize o RIGHT JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2

select t1.cpf, t1.name, t2.state  -- Seleciona dados das duas tabelas
from temp_tables.tabela_1 as t1  -- Tabela da esquerda
right join temp_tables.tabela_2 as t2  -- Retorna todos os registros da tabela da direita (t2)
	on t1.cpf = t2.cpf;  -- Relaciona pelo CPF (se não existir em t1, vem NULL)


-- (Exemplo 4) Utilize o FULL JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2

select t1.cpf, t1.name, t2.state  -- Seleciona dados das duas tabelas
from temp_tables.tabela_1 as t1  -- Tabela 1
full join temp_tables.tabela_2 as t2  -- Retorna todos os registros de ambas as tabelas
	on t1.cpf = t2.cpf;  -- Junta pelo CPF (quando não há correspondência, retorna NULL)


-- RESUMO ##########################################################################
-- (1) Servem para combinar colunas de uma ou mais tabelas
-- (2) Pode-se usar * para trazer tudo, mas não é recomendado em produção
-- (3) Usar alias (t1, t2) melhora a leitura e organização do código
-- (4) JOIN sozinho funciona como INNER JOIN (retorna apenas correspondências)