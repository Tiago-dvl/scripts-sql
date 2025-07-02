
/*
2.Receita total (bruta e líquida)
Calcule a receita bruta utilizando as colunas ValorPago + ComissaoWemobi + TaxaConveniencia 
e o status da venda SALE_APPROVED

 e a receita líquida, 
utilizando os status da venda SALE_APPROVED e SALE_CANCELED por mês.
*/


SELECT 01 "Ordem", 'JANEIRO' as "Mes", to_char( SUM( valor_pago 
                   + comissao_wemobi 
                   + taxa_conveniencia), 'FM99G999G999D99')"Receita Bruta"
FROM vendas_transporte_wemobi 
WHERE status_venda = 'SALE_APPROVED'
AND TO_CHAR(data_compra, 'MM') = '01'

UNION

SELECT 02, 'FEVEREIRO', to_char( SUM( valor_pago 
                   + comissao_wemobi 
                   + taxa_conveniencia), 'FM99G999G999D99')
FROM vendas_transporte_wemobi 
WHERE status_venda = 'SALE_APPROVED'
AND TO_CHAR(data_compra, 'MM') = '02'

UNION

SELECT 03, 'MARÇO' as "Mes", to_char( SUM( valor_pago 
                   + comissao_wemobi 
                   + taxa_conveniencia), 'FM99G999G999D99')"Receita Bruta"
FROM vendas_transporte_wemobi 
WHERE status_venda = 'SALE_APPROVED'
AND TO_CHAR(data_compra, 'MM') = '03'

UNION

SELECT 04, 'ABRIL' as "Mes", to_char( SUM( valor_pago 
                   + comissao_wemobi 
                   + taxa_conveniencia), 'FM99G999G999D99')"Receita Bruta"
FROM vendas_transporte_wemobi 
WHERE status_venda = 'SALE_APPROVED'
AND TO_CHAR(data_compra, 'MM') = '04'

UNION

SELECT 05, 'MAIO' as "Mes", to_char( SUM( valor_pago 
                   + comissao_wemobi 
                   + taxa_conveniencia), 'FM99G999G999D99')"Receita Bruta"
FROM vendas_transporte_wemobi 
WHERE status_venda = 'SALE_APPROVED'
AND TO_CHAR(data_compra, 'MM') = '05'

UNION

SELECT 06, 'JUNHO' as "Mes", to_char( SUM( valor_pago 
                   + comissao_wemobi 
                   + taxa_conveniencia), 'FM99G999G999D99')"Receita Bruta"
FROM vendas_transporte_wemobi 
WHERE status_venda = 'SALE_APPROVED'
AND TO_CHAR(data_compra, 'MM') = '06'

UNION

SELECT 07, 'JULHO' as "Mes", to_char( SUM( valor_pago 
                   + comissao_wemobi 
                   + taxa_conveniencia), 'FM99G999G999D99')"Receita Bruta"
FROM vendas_transporte_wemobi 
WHERE status_venda = 'SALE_APPROVED'
AND TO_CHAR(data_compra, 'MM') = '07'

UNION

SELECT 08, 'AGOSTO' as "Mes", to_char( SUM( valor_pago 
                   + comissao_wemobi 
                   + taxa_conveniencia), 'FM99G999G999D99')"Receita Bruta"
FROM vendas_transporte_wemobi 
WHERE status_venda = 'SALE_APPROVED'
AND TO_CHAR(data_compra, 'MM') = '08'

UNION

SELECT 09, 'SETEMBRO' as "Mes", to_char( SUM( valor_pago 
                   + comissao_wemobi 
                   + taxa_conveniencia), 'FM99G999G999D99')"Receita Bruta"
FROM vendas_transporte_wemobi 
WHERE status_venda = 'SALE_APPROVED'
AND TO_CHAR(data_compra, 'MM') = '09'

UNION

SELECT 10, 'OUTUBRO' as "Mes", to_char( SUM( valor_pago 
                   + comissao_wemobi 
                   + taxa_conveniencia), 'FM99G999G999D99')"Receita Bruta"
FROM vendas_transporte_wemobi 
WHERE status_venda = 'SALE_APPROVED'
AND TO_CHAR(data_compra, 'MM') = '10'

UNION

SELECT 11, 'NOVEMBRO' as "Mes", to_char( SUM( valor_pago 
                   + comissao_wemobi 
                   + taxa_conveniencia), 'FM99G999G999D99')"Receita Bruta"
FROM vendas_transporte_wemobi 
WHERE status_venda = 'SALE_APPROVED'
AND TO_CHAR(data_compra, 'MM') = '11'

UNION

SELECT 12, 'DEZEMBRO' as "Mes", to_char( SUM( valor_pago 
                   + comissao_wemobi 
                   + taxa_conveniencia), 'FM99G999G999D99')"Receita Bruta"
FROM vendas_transporte_wemobi 
WHERE status_venda = 'SALE_APPROVED'
AND TO_CHAR(data_compra, 'MM') = '12'