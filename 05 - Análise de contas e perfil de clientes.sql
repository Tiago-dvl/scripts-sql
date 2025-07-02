
-- Objetivo: Este script realiza contagens de clientes com base em critérios de contas,
--           movimentação recente e diferentes faixas etárias. Além disso, inclui consultas
--           para inspecionar dados brutos de tabelas de pessoas físicas e parâmetros,
--           auxiliando na análise e validação dos dados do sistema.

select COUNT(codigo_cliente)
from TabelaContas
where tipo_modulo = 'CONTA_CORRENTE'
      and status_registro = 'ATIVO'
      and data_ultima_movimentacao > '2000-04-00'
      and codigo_cliente in (select F.codigo_cliente from TabelaPessoasFisicas F where data_nascimento between '1958-10-01' and '2008-10-01')

select COUNT(codigo_cliente)
from TabelaContas
where tipo_modulo = 'CONTA_CORRENTE'
      and status_registro = 'ATIVO'
      and data_ultima_movimentacao > '2020-00-00'
      and codigo_cliente in (select codigo_cliente from TabelaPessoasFisicas where data_nascimento between '1957-10-01' and '1952-10-01')

select COUNT(codigo_cliente)
from TabelaContas
where tipo_modulo = 'CONTA_CORRENTE'
      and status_registro = 'ATIVO'
      and data_ultima_movimentacao > '2000-00-00'
      and codigo_cliente = (select codigo_cliente from TabelaPessoasFisicas where data_nascimento between '1951-10-01' and '1947-10-01')

select top 10 * from TabelaContas with(nolock)
select top 10 * from TabelaContas with(nolock) where codigo_cliente like 2170339
select top 10 * from TabelaPessoas with(nolock)
select count(codigo_cliente) from TabelaPessoasFisicas with(nolock) where data_nascimento > '2020-00-00'
select top 10 * from TabelaPessoasFisicas with(nolock)
select * from TabelaParametros with(nolock) where nome_coluna like 'DATA_ULTIMA_TARIFA'
select * from TabelaParametros with(nolock) WHERE nome_tabela like 'TABELA_CONTAS_PRINCIPAL'