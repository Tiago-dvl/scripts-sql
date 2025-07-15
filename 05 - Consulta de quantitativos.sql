
select COUNT(cod_cli)
from TbelCnt
where tipo_modulo = 'MODULO 01'
      and stt_reg = 'LIBERADO'
      and dt_ult_mov > '2000-04-00'
      and cod_cli in (select F.cod_cli from TbelPessF F where dt_nas between '1958-10-01' and '2008-10-01')

select COUNT(cod_cli)
from TbelCnt
where tipo_modulo = 'MODULO 01'
      and stt_reg = 'LIBERADO'
      and dt_ult_mov > '2020-00-00'
      and cod_cli in (select cod_cli from TbelPessF where dt_nas between '1957-10-01' and '1952-10-01')

select COUNT(cod_cli)
from TbelCnt
where tipo_modulo = 'MODULO 01'
      and stt_reg = 'LIBERADO'
      and dt_ult_mov > '2000-00-00'
      and cod_cli = (select cod_cli from TbelPessF where dt_nas between '1951-10-01' and '1947-10-01')