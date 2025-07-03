
select  
tab.numero_sequencia  'Sequência das alterações', 
convert(varchar,tab.data_hora_atual,103) 'Data da alteração', 
case
    when tab.codigo_usuario = convert(varchar,tab.codigo_cliente then 'Aplicativo Mobile XY' 
    else 'Atualização na unidade pelo funcionário de matrícula ' + tab.codigo_autentico
end 'Canal da comunicação',
,tab.numero_campo   'Campo da alteração'
,tab.valor_campo_01 'Valor antes da alteração'
,tab.valor_campo_02 'Valor depois da alteração'
from nomeTabela tab with(nolock) 
where tab.codigo_usuario = 123456789
   and tab.numero_parametro not in ( 'Parametro 01', 'Parametro 02')
   and convert(date,tab.data_hora_atual) between '20220514' and '20220830'