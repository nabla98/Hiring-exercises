CREATE DATABASE IF NOT EXISTS stock_market_data;
USE stock_market_data;

CREATE TABLE IF NOT EXISTS companies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ticker VARCHAR(10) UNIQUE NOT NULL,
    sector VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS stock_prices (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    ticker VARCHAR(10),
    date DATE,
    open DECIMAL(12, 4),
    high DECIMAL(12, 4),
    low DECIMAL(12, 4),
    close DECIMAL(12, 4),
    volume BIGINT,
    FOREIGN KEY (ticker) REFERENCES companies(ticker),
    UNIQUE(ticker, date)
);

CREATE TABLE IF NOT EXISTS financial_metrics (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    ticker VARCHAR(10),
    period DATE,
    metric_name VARCHAR(100),
    metric_value DECIMAL(20, 4),
    FOREIGN KEY (ticker) REFERENCES companies(ticker),
    UNIQUE(ticker, period, metric_name)
);



# Ejemplo de insercion de datos en las tablas

/* 
INSERT INTO companies (ticker, name, sector)
VALUES ('MSFT', 'Technology'),
       ('JNJ', 'Healthcare'),
       ('JPM', 'Financials');
       
INSERT INTO stock_prices (ticker, date, open, high, low, close, volume)
VALUES ('MSFT', '2024-04-23', 291.56, 294.10, 290.21, 293.80, 19873400);

INSERT INTO financial_metrics (ticker, period, metric_name, metric_value)
VALUES ('MSFT', '2023-12-31', 'Total Revenue', 168000000.00),
       ('MSFT', '2023-12-31', 'Net Income', 60000000.00);
/* 