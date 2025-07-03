
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