select distinct city -- seleciona as cidades sem repetir valores

from sales.customers -- define a tabela de onde os dados serão puxados (schema sales, tabela customers)

where state = 'MG' -- filtra apenas os clientes do estado de minas gerais (mg)

order by city; -- ordena as cidades em ordem alfabética

--------------------------------------------------------


select visit_id -- seleciona a coluna de id das visitas

from sales.funnel -- define a tabela de onde os dados serão puxados (schema sales, tabela funnel)

where paid_date is not null -- filtra apenas registros que possuem data de pagamento (ou seja, foram pagos)

order by paid_date desc -- ordena os resultados pela data de pagamento (do mais recente para o mais antigo)

limit 10; -- limita o resultado para apenas 10 linhas



--------------------------------------------------------------------
select * -- seleciona todas as colunas

from sales.customers -- define a tabela de onde os dados serão puxados (schema sales, tabela customers)

where birth_date >= '2000-01-01' -- filtra clientes nascidos a partir de 01/01/2000

order by score desc -- ordena do maior score para o menor

limit 10; -- limita o resultado para apenas 10 linhas
























