

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
