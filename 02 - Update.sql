

Begin Tran

select * from nome_tabela with(nolock) where campo_nome like 'API_STATUS_PARAMETRO'

UPDATE nome_tabela
SET    campo_valor = '13323'
WHERE  campo_nome  = 'API_STATUS_PARAMETRO'

select * from nome_tabela with(nolock) where campo_nome like 'API_STATUS_PARAMETRO'

Commit
