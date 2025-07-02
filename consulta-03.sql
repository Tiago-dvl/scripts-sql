

-- 03 
-- Liste as 5 empresas com maior faturamento bruto (ValorPago + ComissaoWemobi + TaxaConveniencia) no período completo disponível..

SELECT empresa "Empresa", to_char( SUM( valor_pago 
                   + comissao_wemobi 
                   + taxa_conveniencia), 'FM99G999G999D99')"Faturamento Bruto"
FROM vendas_transporte_wemobi 
WHERE status_venda = 'SALE_APPROVED'
GROUP BY empresa
ORDER BY count(*) desc
LIMIT 5;

-- Mostre também o número total de vendas por empresa.
SELECT empresa "Empresa",to_char(COUNT(*),'FM99G999') "Total de Vendas"
FROM vendas_transporte_wemobi 
WHERE status_venda = 'SALE_APPROVED'
GROUP BY empresa
ORDER BY count(*) desc;

-- 134259
select to_char(COUNT(*),'FM999G999') "Total Vendas Aprovadas"
from  vendas_transporte_wemobi 
where status_venda = 'SALE_APPROVED';

