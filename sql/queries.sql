-- queries for table creation in schema.sql file.
-- Insert a new investment into the investment table.
INSERT INTO Investment (InvestorID, StockID, DateOfInvestment, NumberOfShares, TypeOfInvestment)
VALUES (1, 2, '2023-04-10', 100, 'Stock');

-- Update the number of shares held for an investment in the investments table.
UPDATE Investment
SET NumberOfShares = 150
WHERE InvestmentID = 2;

-- Delete an investment from the investments table.
DELETE
FROM Investment
WHERE InvestmentID = 1;

-- Retrieve the total return for each investment.
SELECT InvestmentID, TotalReturn
FROM Investment;

-- Join the investments table with the market data table to retrieve the stock prices for a particular date.
SELECT i.InvestmentID, i.StockID, m.DateOfMeasurement, m.StockPrice
FROM Investment i
         INNER JOIN MarketData m ON i.StockID = m.StockID
WHERE m.DateOfMeasurement = '2023-04-01';

-- Group the investments by type and retrieve the average annualized return for each type.
SELECT TypeOfInvestment, AVG(AnnualizedReturn) AS AvgAnnualizedReturn
FROM Investment
GROUP BY TypeOfInvestment;

-- Filter the investments by risk level and retrieve the top-performing investments.
SELECT InvestmentID, InvestorID, StockID, AnnualizedReturn
FROM Investment
WHERE RiskLevel <= 0.5
ORDER BY AnnualizedReturn
LIMIT 5;

-- Calculate the total value of all investments based on the number of shares held and the current stock prices from the market data table.
SELECT i.InvestmentID, i.NumberOfShares, m.StockPrice, i.NumberOfShares * m.StockPrice AS TotalValue
FROM Investment i
         INNER JOIN MarketData m ON i.StockID = m.StockID and
                                    m.DateOfMeasurement = CURDATE();

-- Calculate the portfolio’s overall annualized return based on the investments’ individual returns and the number of shares held.
SELECT SUM(NumberOfShares * AnnualizedReturn) AS TotalAnnualizedReturn
FROM Investment;

-- Calculate the correlation between two investments’ performance using the performance metrics table.
SET @Corr = NULL;
CALL CalculateCorr(2, 3, @Corr);
SELECT @Corr AS CORR;
-- TODO

-- Retrieve the most recent inflation rate from the other financial information table.
SELECT Date, InflationRate
FROM OtherFinancialInfo
ORDER BY Date DESC
LIMIT 1;

-- Filter the market data table by date range and retrieve the stock prices for a particular investment.
SELECT m.DateOfMeasurement, m.StockPrice
FROM Investment i
         INNER JOIN MarketData m ON i.StockID = m.StockID
WHERE i.InvestmentID = 1
  AND m.DateOfMeasurement BETWEEN i.DateOfInvestment AND i.DateOfMeasurement;

-- Calculate the percentage change in stock prices for a particular investment between two dates.
SELECT ((md2.StockPrice - md1.StockPrice) / md1.StockPrice) * 100 AS PercentageChange
FROM MarketData md1
         INNER JOIN MarketData md2 ON md1.StockID = md2.StockID AND md2.DateOfMeasurement = '2023-04-10'
WHERE md1.DateOfMeasurement = '2023-04-01'
  AND md1.StockID = 1;
-- TODO

-- Calculate the volatility of an investment’s returns using the performance metrics table.
SELECT SQRT(POWER((TotalReturn - AnnualizedReturn), 2)) AS VOLATILITY
FROM Investment
WHERE InvestmentID = 2;

-- Retrieve the top-performing investments based on annualized return and risk level.
SELECT i.InvestmentID, s.NameOfStock, i.NumberOfShares, i.AnnualizedReturn, i.RiskLevel
FROM Investment i
         INNER JOIN Stock s ON i.StockID = s.StockID
ORDER BY i.AnnualizedReturn DESC, i.RiskLevel ASC
LIMIT 5;

-- Group the investments by type and retrieve the total number of shares held for each type.
SELECT TypeOfInvestment, SUM(NumberOfShares) AS TotalShares
FROM Investment
GROUP BY TypeOfInvestment;

-- Update Metrics
CALL UpdateMetrics(10);