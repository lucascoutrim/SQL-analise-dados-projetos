-- CONTEÚDO ########################################################################
-- Criação de tabela a partir de uma query
-- Criação de tabela a partir do zero
-- Deleção de tabelas


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Criação de tabela a partir de uma query
-- Crie uma tabela chamada customers_age com o id e a idade dos clientes. 
-- Chame-a de temp_tables.customers_age

select
	customer_id,  -- Seleciona o ID do cliente
	datediff('years', birth_date, current_date) idade_cliente  -- Calcula a idade do cliente em anos
into temp_tables.customers_age  -- Cria uma nova tabela com o resultado dessa query
from sales.customers;  -- Tabela de origem dos dados

select *  -- Visualiza todos os dados da nova tabela criada
from temp_tables.customers_age;  -- Tabela criada com idade dos clientes



-- (Exemplo 2) Criação de tabela a partir do zero
-- Crie uma tabela com a tradução dos status profissionais dos clientes. 

select distinct professional_status  -- Lista todos os status profissionais únicos existentes
from sales.customers;

create table temp_tables.profissoes (  -- Cria uma nova tabela vazia
	professional_status varchar,  -- Coluna com o nome original do status
	status_profissional varchar  -- Coluna com a tradução do status
);

insert into temp_tables.profissoes  -- Insere dados na tabela criada
(professional_status, status_profissional)  -- Define as colunas que receberão os dados

values  -- Lista de valores que serão inseridos
('freelancer', 'freelancer'),  -- Tradução de freelancer
('retired', 'aposentado(a)'),  -- Tradução de aposentado
('clt', 'clt'),  -- CLT permanece igual
('self_employed', 'autônomo(a)'),  -- Tradução de autônomo
('other', 'outro'),  -- Tradução genérica
('businessman', 'empresário(a)'),  -- Tradução de empresário
('civil_servant', 'funcionário público(a)'),  -- Tradução de servidor público
('student', 'estudante');  -- Tradução de estudante

select *  -- Visualiza os dados inseridos
from temp_tables.profissoes;



-- (Exemplo 3) Deleção de tabelas
-- Delete a tabela temp_tables.profissoes

drop table temp_tables.profissoes;  -- Remove completamente a tabela do banco de dados



-- RESUMO ##########################################################################
-- (1) SELECT INTO cria uma nova tabela com base no resultado de uma query
-- (2) CREATE TABLE cria a estrutura da tabela e INSERT INTO insere os dados
-- (3) DROP TABLE remove a tabela permanentemente do banco