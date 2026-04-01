-- CONTEÚDO ########################################################################
-- Inserção de linhas
-- Atualização de linhas
-- Deleção de linhas


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Inserção de linhas
-- Insira os status 'desempregado(a)' e 'estagiário(a)' na temp_table.profissoes

create table temp_tables.profissoes (  -- Cria uma nova tabela chamada profissoes
	professional_status varchar,  -- Coluna com o status original
	status_profissional varchar  -- Coluna com a tradução
);

insert into temp_tables.profissoes  -- Inicia inserção de dados na tabela
(professional_status, status_profissional)  -- Define as colunas que receberão os valores

values  -- Lista de valores que serão inseridos
('freelancer', 'freelancer'),
('retired', 'aposentado(a)'),
('clt', 'clt'),
('self_employed', 'autônomo(a)'),
('other', 'outro'),
('businessman', 'empresário(a)'),
('civil_servant', 'funcionário público(a)'),
('student', 'estudante');

select * from temp_tables.profissoes;  -- Mostra os dados inseridos

insert into temp_tables.profissoes  -- Insere novos registros na tabela existente
(professional_status, status_profissional)  -- Define as colunas

values
('unemployed', 'desempregado(a)'),  -- Novo status inserido
('trainee', 'estagiario(a)');  -- Novo status inserido



-- (Exemplo 2) Atualização de linhas
-- Corrija a tradução de 'estagiário(a)' de 'trainee' para 'intern' 

update temp_tables.profissoes  -- Define a tabela que será atualizada
set professional_status = 'intern'  -- Altera o valor da coluna professional_status
where status_profissional = 'estagiario(a)';  -- Aplica a mudança apenas nas linhas filtradas

select * from temp_tables.profissoes;  -- Visualiza os dados após a atualização



-- (Exemplo 3) Deleção de linhas
-- Delete as linhas dos status 'desempregado(a)' e 'estagiário(a)'

delete from temp_tables.profissoes  -- Define a tabela onde os dados serão removidos
where status_profissional = 'desempregado(a)'  -- Remove linhas com esse valor
or status_profissional = 'estagiario(a)';  -- Ou com esse valor

select * from temp_tables.profissoes;  -- Visualiza os dados restantes



-- RESUMO ##########################################################################
-- (1) INSERT INTO adiciona novos registros na tabela
-- (2) UPDATE altera dados existentes (sempre com WHERE para evitar alterar tudo)
-- (3) DELETE remove registros específicos (também usar WHERE com cuidado)