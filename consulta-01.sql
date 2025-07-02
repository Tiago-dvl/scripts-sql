--SELECT * FROM vendas_transporte LIMIT 1000;

SELECT valor_pago, comissao_wemobi, taxa_conveniencia, * 
FROM vendas_transporte
WHERE status_venda = 'SALE_APPROVED'
LIMIT 100;

select count(V.id) "Total Vendas Aprovadas"
from  vendas_transporte V
where V.status_venda = 'SALE_APPROVED';


SELECT to_date(DATA_COMPRA) 
FROM  vendas_transporte;

SELECT DATE(NOW());


select * from vendas_transporte_wemobi limit 100;


