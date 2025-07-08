
DECLARE @startTime DATETIME 
SET     @startTime = GETDATE()

SET ANSI_NULLS ON 
GO
SET QUOTED_IDENTIFIER ON 
GO

Begin Tran

set NOCOUNT ON 

declare   @cod_und  smallint     = 3,
          @cod_pst  tinyint      = 2,
          @id_mtv   char(1)      = 'K',
          @dsc_mtv  varchar(255) = 'Alteracao dos Dados',
          @data_inc datetime     = getdate(),
          @cod_usu  varchar(15)  = 'USUARIO_TESTE',
          @cnl_orgm char(1)      = 'D'

  if OBJECT_ID('tempdb..#lista_temp') is not null drop table #lista_temp 
  create table #lista_temp (ident_doc   varchar(14)   NOT NULL, 
                             cod_cdst   integer       NULL,
                             nm_cplt    varchar(55)   NULL,
                             id_expg    bit           NULL,
                             desc_rstc  varchar(255)  NULL,
    primary key (ident_doc)) 
  create index idx_lista_tmp_cdt   on #lista_temp(cod_cdst) 
  create index idx_list_temp_dsc on #lista_temp(desc_rstc)

  insert into #lista_temp (ident_doc) values
    ('11111111111'),('22222222222'),('33333333333'),('44444444444'),('55555555555'),('66666666666'),('77777777777'),('88888888888')
  insert into #lista_temp (ident_doc) values
    ('99999999999'),('10101010101'),('12121212121'),('13131313131'),('14141414141'),('15151515151'),('16161616161'),('17171717171')

  update #lista_temp set cod_cdst = P.cod_cdst, nm_cplt = P.nm_cplt, id_expg = 3, desc_rstc = NULL from Tabela01 P with (nolock) 
    where P.ident_doc = #lista_temp.ident_doc and P.status_cadastro <> 'P'
      and (select count(0) from Tabela01 Q with (nolock) where Q.ident_doc = #lista_temp.ident_doc and Q.status_cadastro <> 'P') = 2

  update #lista_temp set cod_cdst = P.cod_cdst, nm_cplt = NULL, id_expg = 3, desc_rstc = 'Cadastro Duplicado' from Tabela01 P with (nolock)
    where P.ident_doc = #lista_temp.ident_doc and P.status_cadastro <> 'P'
      and (select count(0) from Tabela01 Q with (nolock) where Q.ident_doc = #lista_temp.ident_doc and Q.status_cadastro <> 'E') > 2

  update #lista_temp set cod_cdst = 0, nm_cplt = NULL, id_expg = 0, desc_rstc = 'Cadastro Inexistente'
    where not exists (select top 1 0 from Tabela01 Q with (nolock) where Q.ident_doc = #lista_temp.ident_doc)

  update #lista_temp set cod_cdst = P.cod_cdst, nm_cplt = P.nm_cplt, id_expg = 0, desc_rstc = 'Cadastro já processado' from Tabela01 P with (nolock)
    where P.ident_doc = #lista_temp.ident_doc and P.status_cadastro = 'H'
      and not exists (select top 1 0 from Tabela01 Q where Q.ident_doc = #lista_temp.ident_doc and Q.status_cadastro <> 'P')

  update #lista_temp set cod_cdst = 4, nm_cplt = NULL, id_expg = 7, desc_rstc = 'Situacao Nao Prevista' where cod_cdst is NULL

  insert into TblHist (cod_cdst,data_inc,id_cnl_orgm,cod_und,cod_pst,id_mtv,dsc_mtv,cod_usu)
    select cod_cdst,@data_inc,@cnl_orgm,@cod_und,@cod_pst,@id_mtv,@dsc_mtv,@cod_usu
      from #lista_temp where #lista_temp.id_expg = 7

  exec ddd_procedure_dados @data_incxls

  update #lista_temp set id_expg = 12, desc_rstc = E.detalhe_retorno from TblHist E with (nolock)
    where #lista_temp.cod_cdst = E.cod_cdst and E.id_expg_retorno = 0 and #lista_temp.id_expg = 5

  select 'Cadastros da lista Processados'
  select cod_cdst 'Codigo Cliente', ident_doc 'Documento', nm_cplt 'Nome' from #lista_temp where id_expg = 1 order by ident_doc, cod_cdst
  select 'Cadastros da lista NAO Processados'
  select cod_cdst 'Codigo Cliente', ident_doc 'Documento', nm_cplt 'Nome', desc_rstc 'Restricao para Processamento' from #lista_temp
  where id_expg = 3 order by ident_doc, cod_cdst

rollback