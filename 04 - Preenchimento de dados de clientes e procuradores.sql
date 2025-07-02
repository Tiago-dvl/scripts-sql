
/* Este script SQL tem como objetivo coletar e consolidar informações detalhadas de clientes e seus procuradores
   em uma tabela temporária. Ele inicia com uma lista de identificadores de documentos e, em seguida, atualiza essa 
   tabela com dados de diversas fontes, incluindo informações pessoais, de contato e de representação legal. O script 
   busca preencher campos como código do cliente, nome completo, data de nascimento, telefones e dados do procurador, 
   consolidando um perfil abrangente para cada entrada na lista inicial. */

if OBJECT_ID('tempdb..#ListaClientes') is not null drop table #ListaClientes
create table #ListaClientes (
	,documento_identificacao varchar(14) not null
	,codigo_cliente          integer null
	,nome_completo           varchar(60) null
	,situacao_cadastro       varchar (4)
	,numero_agencia          integer null
	,data_nascimento         integer null
	,ddd_telefone            integer null
	,numero_telefone         integer null
	,ddd_celular             integer null
	,numero_celular          integer null
	,codigo_procurador       varchar (14)
	,nome_procurador         varchar (60)
	,tipo_representante      varchar (4)
	,ddd_procurador          integer null
	,celular_procurador      integer null
	,ddd2_procurador         integer null
	,celular2_procurador     integer null
	primary key (documento_identificacao))

create index idx_ListaClientes_documento on #ListaClientes(documento_identificacao)

insert into #ListaClientes (documento_identificacao) values ('11111111111'),('22222222222'),('33333333333'),('44444444444')

select * from #ListaClientes with(nolock)

update #ListaClientes
set codigo_cliente = p.codigo_cliente, nome_completo = P.nome_completo
from TabelaPessoas P
with(nolock) where p.documento_identificacao = #ListaClientes.documento_identificacao

update #ListaClientes
set data_nascimento = F.data_nascimento
from TabelaPessoasFisicas F
where F.codigo_cliente = #ListaClientes.codigo_cliente

update #ListaClientes
set ddd_telefone = E.nr_ddd, numero_telefone = E.nr_fn, ddd_celular = E.nr_ddd_cel, numero_celular = E.nr_cel
from TabelaEnderecos E
with(nolock)
where e.codigo_cliente = #ListaClientes.codigo_cliente

update #ListaClientes
set ddd_telefone = E.nr_ddd, numero_telefone = E.nr_fn, ddd_celular = E.nr_ddd_cel, numero_celular = E.nr_cel
from TabelaEnderecos E
with(nolock)
where e.codigo_cliente = #ListaClientes.codigo_cliente

update #ListaClientes
set codigo_procurador = M.codigo_procurador, nome_procurador = M.nome_procurador
from TabelaProcuradores M
where M.codigo_cliente = #ListaClientes.codigo_cliente

update #ListaClientes
set ddd_procurador = N.ddd_telefone, celular_procurador = N.numero_telefone, ddd2_procurador = N.ddd_celular, celular2_procurador = N.numero_celular
from TabelaEnderecos N with (nolock)
where N.codigo_cliente = #ListaClientes.codigo_procurador

select tipo_representante =
    case
        when M.tipo_representante = 'P' then 'Pai'
        when M.tipo_representante = 'M' then 'Mae'
        when M.tipo_representante = 'T' then 'Tutor'
        when M.tipo_representante = 'C' then 'Curador'
        else 'Outro'
    end
from TabelaProcuradores M
where M.codigo_cliente = #ListaClientes.codigo_cliente;

select * from #ListaClientes with(nolock)

drop table #ListaClientes