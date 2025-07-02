
/* Este script SQL tem como objetivo consultar o hist�rico detalhado de altera��es realizadas em um cadastro espec�fico.
   Exibe informa��es como a data da altera��o, o canal pelo qual a mudan�a foi feita identificando se foi por 
   aplicativo mobile ou por um funcion�rio da unidade, o campo que sofreu a altera��o, e os valores antes e depois 
   da modifica��o. A consulta � filtrada por um c�digo de usu�rio e um per�odo espec�fico, 
   excluindo certos par�metros de altera��o. */


select  
tab.numero_sequencia  'Sequ�ncia das altera��es', 
convert(varchar,tab.data_hora_atual,103) 'Data da altera��o', 
case
    when tab.codigo_usuario = convert(varchar,tab.codigo_cliente then 'Aplicativo Mobile XY' 
    else 'Atualiza��o na unidade pelo funcion�rio de matr�cula ' + tab.cd_usu_atu
end 'Canal da comunica��o',
,tab.numero_campo   'Campo da altera��o'
,tab.valor_campo_01 'Valor antes da altera��o'
,tab.valor_campo_02 'Valor depois da altera��o'
from nomeTabela tab with(nolock) 
where tab.codigo_usuario = 123456789
   and tab.numero_parametro not in ( 'Parametro 01', 'Parametro 02')
   and convert(date,tab.data_hora_atual) between '20220514' and '20220830'