
USE stock_market_data;

CREATE OR REPLACE VIEW vista_volatilidad_empresas AS
SELECT 
    sp.ticker,
    c.sector,
    AVG(sp.high - sp.low) AS avg_daily_volatility
FROM 
    stock_prices sp
JOIN 
    companies c ON sp.ticker = c.ticker
WHERE 
    sp.date >= CURDATE() - INTERVAL 6 MONTH
GROUP BY 
    sp.ticker, c.sector;
    
    
CREATE OR REPLACE VIEW vista_rendimiento_acumulado AS
SELECT 
    sp.ticker,
    c.sector,
    MIN(sp.date) AS fecha_inicio,
    MAX(sp.date) AS fecha_fin,
    (MAX(sp.close) - MIN(sp.open)) / MIN(sp.open) * 100 AS rendimiento_porcentual
FROM 
    stock_prices sp
JOIN 
    companies c ON sp.ticker = c.ticker
WHERE 
    sp.date >= CURDATE() - INTERVAL 6 MONTH
GROUP BY 
    sp.ticker, c.sector;
    
/*
Ejemplos de consulta a las vistas
*/
SELECT ticker, sector, rendimiento_porcentual
FROM vista_rendimiento_acumulado
ORDER BY rendimiento_porcentual DESC
LIMIT 5;

SELECT ticker, sector, avg_daily_volatility
FROM vista_volatilidad_empresas
ORDER BY avg_daily_volatility DESC
LIMIT 5;



