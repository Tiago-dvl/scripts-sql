
select  
tab.num_seq  'Sequ�ncia das altera��es', 
convert(varchar,tab.dh_atual,103) 'Data da altera��o', 
case
    when tab.cod_usu = convert(varchar,tab.cod_cli then 'Aplicativo Mobile XY' 
    else 'Atualiza��o na unidade pelo funcion�rio de matr�cula ' + tab.cod_aut
end 'Canal da comunica��o',
,tab.num_campo   'Campo da altera��o'
,tab.va_campo_01 'Valor antes da altera��o'
,tab.va_campo_02 'Valor depois da altera��o'
from nomeTabela tab with(nolock) 
where tab.cod_usu = 123456789
   and tab.num_par not in ( 'Parametro 01', 'Parametro 02')
   and convert(date,tab.dh_atual) between '20220514' and '20220830'