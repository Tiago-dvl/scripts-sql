
/* Este script T-SQL foi projetado para gerenciar e auditar cadastros de clientes, utilizando tabelas temporárias 
   para manipulação inicial dos dados. Ele identifica e processa registros com base em diversas condições, 
   como duplicidade, inexistência ou status de processamento prévio. O objetivo principal é garantir a integridade 
   dos dados de cadastro, registrando cada etapa do processamento e eventuais restrições em um histórico dedicado,
   além de gerar relatórios claros sobre os cadastros processados e não processados. */

DECLARE @startTime DATETIME 
SET @startTime = GETDATE()

SET ANSI_NULLS ON 
GO
SET QUOTED_IDENTIFIER ON 
GO

Begin Tran

  set NOCOUNT ON 

  declare   @cod_unidade  smallint     = 3,
            @cod_posto    tinyint      = 2,
            @id_motivo    char(1)      = 'K',
            @desc_motivo  varchar(255) = 'Alteracao dos Dados',
            @data_inc     datetime     = getdate(),
            @cod_usuario  varchar(15)  = 'USUARIO_TESTE',
            @canal_origem char(1)      = 'D'

  if OBJECT_ID('tempdb..#lista_temp') is not null drop table #lista_temp 
  create table #lista_temp (identificador_doc varchar(14)   NOT NULL, 
                             cod_cadastro     integer       NULL,
                             nome_completo    varchar(55)   NULL,
                             id_expurgo       bit           NULL,
                             desc_restricao   varchar(255)  NULL,
    primary key (identificador_doc)) 
  create index idx_lista_temp_codcadastro   on #lista_temp(cod_cadastro) 
  create index idx_lista_temp_descrestricao on #lista_temp(desc_restricao)

  insert into #lista_temp (identificador_doc) values
    ('11111111111'),('22222222222'),('33333333333'),('44444444444'),('55555555555'),('66666666666'),('77777777777'),('88888888888')
  insert into #lista_temp (identificador_doc) values
    ('99999999999'),('10101010101'),('12121212121'),('13131313131'),('14141414141'),('15151515151'),('16161616161'),('17171717171')

  update #lista_temp set cod_cadastro = P.cod_cadastro, nome_completo = P.nome_completo, id_expurgo = 3, desc_restricao = NULL from TabelaPessoa P with (nolock) 
    where P.identificador_doc = #lista_temp.identificador_doc and P.status_cadastro <> 'P'
      and (select count(0) from TabelaPessoa Q with (nolock) where Q.identificador_doc = #lista_temp.identificador_doc and Q.status_cadastro <> 'P') = 2

  update #lista_temp set cod_cadastro = P.cod_cadastro, nome_completo = NULL, id_expurgo = 3, desc_restricao = 'Cadastro Duplicado' from TabelaPessoa P with (nolock)
    where P.identificador_doc = #lista_temp.identificador_doc and P.status_cadastro <> 'P'
      and (select count(0) from TabelaPessoa Q with (nolock) where Q.identificador_doc = #lista_temp.identificador_doc and Q.status_cadastro <> 'E') > 2

  update #lista_temp set cod_cadastro = 0, nome_completo = NULL, id_expurgo = 0, desc_restricao = 'Cadastro Inexistente'
    where not exists (select top 1 0 from TabelaPessoa Q with (nolock) where Q.identificador_doc = #lista_temp.identificador_doc)

  update #lista_temp set cod_cadastro = P.cod_cadastro, nome_completo = P.nome_completo, id_expurgo = 0, desc_restricao = 'Cadastro já processado' from TabelaPessoa P with (nolock)
    where P.identificador_doc = #lista_temp.identificador_doc and P.status_cadastro = 'H'
      and not exists (select top 1 0 from TabelaPessoa Q where Q.identificador_doc = #lista_temp.identificador_doc and Q.status_cadastro <> 'P')

  update #lista_temp set cod_cadastro = 4, nome_completo = NULL, id_expurgo = 7, desc_restricao = 'Situacao Nao Prevista' where cod_cadastro is NULL

  insert into TabelaHistorico (cod_cadastro,data_inc,id_canal_origem,cod_unidade,cod_posto,id_motivo,desc_motivo,cod_usuario)
    select cod_cadastro,@data_inc,@canal_origem,@cod_unidade,@cod_posto,@id_motivo,@desc_motivo,@cod_usuario
      from #lista_temp where #lista_temp.id_expurgo = 7

  exec spu_processa_cadastros @data_inc 

  update #lista_temp set id_expurgo = 12, desc_restricao = E.detalhe_retorno from TabelaHistorico E with (nolock)
    where #lista_temp.cod_cadastro = E.cod_cadastro and E.id_expurgo_retorno = 0 and #lista_temp.id_expurgo = 5

  select 'Cadastros da lista Processados'
  select cod_cadastro 'Codigo Cliente', identificador_doc 'Documento', nome_completo 'Nome' from #lista_temp where id_expurgo = 1 order by identificador_doc, cod_cadastro
  select 'Cadastros da lista NAO Processados'
  select cod_cadastro 'Codigo Cliente', identificador_doc 'Documento', nome_completo 'Nome', desc_restricao 'Restricao para Processamento' from #lista_temp
  where id_expurgo = 3 order by identificador_doc, cod_cadastro

rollback