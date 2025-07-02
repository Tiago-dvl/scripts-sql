print  '-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-' + char(10) + 
       '    Data Inicio da Atualização: ' + convert(varchar(10), getdate(), 126) + char(10) + 
       '    Hora Inicio de Atualização: ' + (convert(char(8),getdate(),8)) + char(10) + 
       '              Nome do Servidor: ' + @@servername + char(10) + 
       '                  Nome do Host: ' + host_name() + char(10) +
       '              Usuario do Login: ' + system_user + char(10) + 
       '              Base da execução: ' + db_name () + char(10) + 
       '       Desenvolvedor do Script: ' + 'Nome do DBA' + char(10) + 
       '-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-'+ char(10)
go

/*
Scrip SQL Server para consulta de dados do cliente, com filtros e parametros de critérios.
*/


select  
tab.numero_sequencia  'Sequência das alterações', 
convert(varchar,tab.data_hora_atual,103) 'Data da alteração', 
case
    when tab.codigo_usuario = convert(varchar,tab.codigo_cliente then 'Aplicativo Mobile XY' 
    else 'Atualização na unidade pelo funcionário de matrícula ' + tab.cd_usu_atu
end 'Canal da comunicação',
,tab.numero_campo   'Campo da alteração'
,tab.valor_campo_01 'Valor antes da alteração'
,tab.valor_campo_02 'Valor depois da alteração'
from nomeTabela tab with(nolock) 
where tab.codigo_usuario = 123456789
   and tab.numero_parametro not in ( 'Parametro 01', 'Parametro 02')
   and convert(date,tab.data_hora_atual) between '20220514' and '20220830'

go
print  '-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-' + char(10) + 
       '      Hora Final da Atualização: ' + (convert(char(8),getdate(),8)) + char(10) + 
       '               Nome do Servidor: ' + @@servername + char(10) + 
       '               Base da execução: ' + db_name () + char(10) + 
       '-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-'+ char(10)
go