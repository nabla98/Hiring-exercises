USE stock_market_data;

/* 
1. ¿Qué empresas fueron más volátiles (mayor diferencia entre high y low) en los últimos 6 meses?
*/

SELECT 
    c.ticker,
    c.sector,
    AVG(sp.high - sp.low) AS avg_daily_volatility
FROM 
    stock_prices sp
JOIN 
    companies c ON sp.ticker = c.ticker
WHERE 
    sp.date >= CURDATE() - INTERVAL 6 MONTH
GROUP BY 
    c.ticker, c.sector
ORDER BY 
    avg_daily_volatility DESC;


/*
2. ¿Cuáles sectores movieron más volumen total el último año?
*/

SELECT 
    c.sector,
    SUM(sp.volume) AS total_volume
FROM 
    stock_prices sp
JOIN 
    companies c ON sp.ticker = c.ticker
WHERE 
    sp.date >= CURDATE() - INTERVAL 1 YEAR
GROUP BY 
    c.sector
ORDER BY 
    total_volume DESC;


/*
3. ¿Qué empresa tuvo la mayor caída porcentual en un solo día durante los últimos 6 meses?
*/    
SELECT 
    sp.ticker,
    sp.date,
    ROUND(((sp.close - sp.open) / sp.open) * 100, 2) AS caida_porcentual
FROM 
    stock_prices sp
WHERE 
    sp.date >= CURDATE() - INTERVAL 6 MONTH
    AND ((sp.close - sp.open) / sp.open) < 0  -- Solo días con caída
ORDER BY 
    caida_porcentual ASC  -- Más negativa primero
LIMIT 1;


/*
4. ¿Cuales son las 5 empresas que aumentaron más su precio de cierre en el último año?
*/
WITH precios AS (
    SELECT 
        ticker,
        MIN(date) AS fecha_inicio,
        MAX(date) AS fecha_fin
    FROM stock_prices
    WHERE date >= CURDATE() - INTERVAL 1 YEAR
    GROUP BY ticker
),
precios_detalle AS (
    SELECT 
        p.ticker,
        sp_start.close AS close_inicio,
        sp_end.close AS close_fin
    FROM precios p
    JOIN stock_prices sp_start ON p.ticker = sp_start.ticker AND p.fecha_inicio = sp_start.date
    JOIN stock_prices sp_end ON p.ticker = sp_end.ticker AND p.fecha_fin = sp_end.date
)
SELECT 
    c.ticker,
    c.sector,
    ((pd.close_fin - pd.close_inicio) / pd.close_inicio) * 100 AS growth_percentage
FROM 
    precios_detalle pd
JOIN 
    companies c ON pd.ticker = c.ticker
ORDER BY 
    growth_percentage DESC
LIMIT 5;







