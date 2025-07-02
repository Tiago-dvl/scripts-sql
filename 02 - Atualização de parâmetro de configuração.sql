
print  '-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-' + char(10) + 
       '    Data Inicio da Atualiza��o: ' + convert(varchar(10), getdate(), 126) + char(10) + 
       '    Hora Inicio de Atualiza��o: ' + (convert(char(8),getdate(),8)) + char(10) + 
       '              Nome do Servidor: ' + @@servername + char(10) + 
       '                  Nome do Host: ' + host_name() + char(10) +
       '              Usuario do Login: ' + system_user + char(10) + 
       '              Base da execu��o: ' + db_name () + char(10) + 
       '       Desenvolvedor do Script: ' + 'Nome do DBA' + char(10) + 
       '-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-'+ char(10)
go

/* Este script SQL tem como objetivo atualizar um par�metro espec�fico em uma tabela de configura��o. Ele primeiro 
   consulta o valor atual do par�metro 'API_STATUS_PARAMETRO', em seguida, atualiza esse valor para '13323', 
   e por fim, realiza uma nova consulta para verificar se a altera��o foi aplicada com sucesso. A transa��o �
   encapsulada em um BEGIN TRAN e COMMIT para garantir a atomicidade da opera��o. */

Begin Tran

select * from nome_tabela with(nolock) where campo_nome like 'API_STATUS_PARAMETRO'

UPDATE nome_tabela
SET    campo_valor = '13323'
WHERE  campo_nome  = 'API_STATUS_PARAMETRO'

select * from nome_tabela with(nolock) where campo_nome like 'API_STATUS_PARAMETRO'

Commit

go
print  '-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-' + char(10) + 
       '      Hora Final da Atualiza��o: ' + (convert(char(8),getdate(),8)) + char(10) + 
       '               Nome do Servidor: ' + @@servername + char(10) + 
       '               Base da execu��o: ' + db_name () + char(10) + 
       '-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-'+ char(10)
go