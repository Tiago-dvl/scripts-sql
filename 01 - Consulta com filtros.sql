
select  
tab.num_seq  'Sequência das alterações', 
convert(varchar,tab.dh_atual,103) 'Data da alteração', 
case
    when tab.cod_usu = convert(varchar,tab.cod_cli then 'Aplicativo Mobile XY' 
    else 'Atualização na unidade pelo funcionário de matrícula ' + tab.cod_aut
end 'Canal da comunicação',
,tab.num_campo   'Campo da alteração'
,tab.va_campo_01 'Valor antes da alteração'
,tab.va_campo_02 'Valor depois da alteração'
from nomeTabela tab with(nolock) 
where tab.cod_usu = 123456789
   and tab.num_par not in ( 'Parametro 01', 'Parametro 02')
   and convert(date,tab.dh_atual) between '20220514' and '20220830'