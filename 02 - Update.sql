
Begin Tran

select * from nome_tabela with(nolock) where cp_nome like 'API_STATUS_PARAMETRO'

UPDATE nome_tabela
SET    cp_var = '13323'
WHERE  cp_nome  = 'API_STATUS_PARAMETRO'

select * from nome_tabela with(nolock) where cp_nome like 'API_STATUS_PARAMETRO'

Commit