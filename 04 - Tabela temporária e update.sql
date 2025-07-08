
if OBJECT_ID('tempdb..#LstCli') is not null drop table #LstCli
create table #LstCli (
	,doc_idntf varchar(14) not null
	,cod_clint          integer null
	,nm_complt           varchar(60) null
	,sit_cdst       varchar (4)
	,nm_agnc          integer null
	,dt_nasc         integer null
	,ddd_telfn            integer null
	,nm_telfn         integer null
	,ddd_cel             integer null
	,num_cel          integer null
	,cod_pcrdr       varchar (14)
	,nm_pcrdr         varchar (60)
	,tp_rep      varchar (4)
	,ddd_rep          integer null
	,cel_pcrdr      integer null
	,ddd_pcrdr         integer null
	,cel_pcrdr     integer null
	primary key (doc_idntf))

create index idx_LstCli_documento on #LstCli(doc_idntf)

insert into #LstCli(doc_idntf) values ('11111111111'),('22222222222'),('33333333333'),('44444444444')

select * from #LstCli with(nolock)

update #LstCli
set cod_clint = p.cod_clint, nm_complt = P.nm_complt
from TbelPess P
with(nolock) where p.doc_idntf = #LstCli.doc_idntf

update #LstCli
set dt_nasc = F.dt_nasc
from TbelPessF F
where F.cod_clint = #LstCli.cod_clint

update #LstCli
set ddd_telfn = E.nr_ddd, nm_telfn = E.nr_fn, ddd_cel = E.nr_ddd_cel, num_cel = E.nr_cel
from TbelEnd E
with(nolock)
where e.cod_clint = #LstCli.cod_clint

update #LstCli
set ddd_telfn = E.nr_ddd, nm_telfn = E.nr_fn, ddd_cel = E.nr_ddd_cel, num_cel = E.nr_cel
from TbelEnd E
with(nolock)
where e.cod_clint = #LstCli.cod_clint

update #LstCli
set cod_pcrdr = M.cod_pcrdr, nm_pcrdr = M.nm_pcrdr
from TbelPrcu M
where M.cod_clint = #LstCli.cod_clint

update #LstCli
set ddd_rep = N.ddd_telfn, cel_pcrdr = N.nm_telfn, ddd_pcrdr = N.ddd_cel, cel_pcrdr = N.num_cel
from TbelEnde N with (nolock)
where N.cod_clint = #LstCli.cod_pcrdr

select tp_rep =
    case
        when M.tp_rep = 'P' then 'Pai'
        when M.tp_rep = 'M' then 'Mae'
        when M.tp_rep = 'T' then 'Tutor'
        when M.tp_rep = 'C' then 'Curador'
        else 'Outro'
    end
from TbelPrcs M
where M.cod_clint = #LstCli.cod_clint;

select * from #LstCli with(nolock)

drop table #LstCli