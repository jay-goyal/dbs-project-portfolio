CREATE DATABASE IF NOT EXISTS Portfolio;
USE Portfolio;

CREATE TABLE IF NOT EXISTS Investor
(
    InvestorID INT AUTO_INCREMENT,
    FirstName  VARCHAR(50) NOT NULL,
    LastName   VARCHAR(50) NOT NULL,
    Email      VARCHAR(50) NOT NULL,
    Password   VARCHAR(50) NOT NULL,
    CONSTRAINT PK_INVESTOR PRIMARY KEY (InvestorID)
);

CREATE TABLE IF NOT EXISTS Stock
(
    StockID     INT AUTO_INCREMENT NOT NULL,
    NameOfStock VARCHAR(50)        NOT NULL,
    StockIssued INT                NOT NULL,
    CONSTRAINT PK_STOCK PRIMARY KEY (StockID)
);

CREATE TABLE IF NOT EXISTS Investment
(
    InvestmentID      INT AUTO_INCREMENT NOT NULL,
    InvestorID        INT                NOT NULL,
    StockID           INT                NOT NULL,
    DateOfInvestment  DATE               NOT NULL DEFAULT (CURDATE()),
    NumberOfShares    INT                NOT NULL,
    TypeOfInvestment  VARCHAR(5)         NOT NULL,
    DateOfMeasurement DATE,
    AnnualizedReturn  FLOAT,
    TotalReturn       FLOAT,
    RiskLevel         FLOAT,
    CONSTRAINT PK_INVESTMENT PRIMARY KEY (InvestmentID),
    CONSTRAINT FK_INVESTOR FOREIGN KEY (InvestorID) REFERENCES Investor (InvestorID) ON DELETE CASCADE,
    CONSTRAINT FK_ISTOCK FOREIGN KEY (StockID) REFERENCES Stock (StockID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS MarketData
(
    MarketDataID      INT AUTO_INCREMENT NOT NULL,
    StockID           INT                NOT NULL,
    DateOfMeasurement DATE               NOT NULL,
    StockPrice        FLOAT              NOT NULL,
    CommodityPrice    FLOAT              NOT NULL,
    ExchangeRate      FLOAT              NOT NULL,
    CONSTRAINT PK_MARKET PRIMARY KEY (MarketDataID),
    CONSTRAINT FK_MSTOCK FOREIGN KEY (StockID) REFERENCES Stock (StockID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS OtherFinancialInfo
(
    Date          DATE  NOT NULL DEFAULT (CURDATE()),
    InflationRate FLOAT NOT NULL,
    GDPGrowthRate FLOAT NOT NULL,
    InterestRate  FLOAT NOT NULL,
    CONSTRAINT PK_FINFO PRIMARY KEY (Date)
);

-- -------------------------- ADD DATA TO INVESTOR TABLE --------------------------
INSERT INTO Investor (FirstName, LastName, Email, Password)
VALUES ('John', 'Smith', 'john.smith@example.com', 'abc123'),
       ('Sarah', 'Johnson', 'sarah.johnson@example.com', '123qwe'),
       ('Michael', 'Williams', 'michael.williams@example.com', 'password'),
       ('Emily', 'Brown', 'emily.brown@example.com', 'secure123'),
       ('David', 'Jones', 'david.jones@example.com', 'secret'),
       ('Jennifer', 'Lee', 'jennifer.lee@example.com', 'my_password'),
       ('William', 'Davis', 'william.davis@example.com', 'letmein'),
       ('Amanda', 'Martin', 'amanda.martin@example.com', 'qwerty123'),
       ('Matthew', 'Moore', 'matthew.moore@example.com', 'password123'),
       ('Elizabeth', 'Anderson', 'elizabeth.anderson@example.com', 'password1234');

-- -------------------------- ADD DATA TO STOCK TABLE --------------------------
INSERT INTO Stock (NameOfStock, StockIssued)
VALUES ('Apple', 500),
       ('Microsoft', 1000),
       ('Amazon', 200),
       ('Facebook', 300),
       ('Tesla', 400),
       ('Alphabet', 600),
       ('JP Morgan', 800),
       ('Walmart', 1200),
       ('Coca-Cola', 900),
       ('Netflix', 700);

-- -------------------------- ADD DATA TO INVESTMENT TABLE --------------------------
INSERT INTO Investment (InvestorID, StockID, DateOfInvestment, NumberOfShares, TypeOfInvestment)
VALUES (1, 1, '2023-04-01', 100, 'Stock'),
       (1, 2, '2023-04-01', 200, 'Stock'),
       (2, 3, '2023-04-01', 50, 'Stock'),
       (3, 2, '2023-04-01', 150, 'Stock'),
       (4, 1, '2023-04-01', 75, 'Stock'),
       (4, 3, '2023-04-01', 100, 'Stock'),
       (5, 2, '2023-04-01', 50, 'Bond'),
       (6, 1, '2023-04-01', 200, 'Stock');

-- -------------------------- ADD DATA TO MARKET DATA TABLE --------------------------
-- Sample data for StockID = 1
INSERT INTO MarketData (StockID, DateOfMeasurement, StockPrice, CommodityPrice, ExchangeRate)
VALUES (1, '2023-04-01', 10.5, 50.2, 0.8),
       (1, '2023-04-02', 10.8, 51.3, 0.9),
       (1, '2023-04-10', 10.6, 50.8, 0.85);

-- Sample data for StockID = 2
INSERT INTO MarketData (StockID, DateOfMeasurement, StockPrice, CommodityPrice, ExchangeRate)
VALUES (2, '2023-04-01', 8.9, 47.5, 0.7),
       (2, '2023-04-02', 9.2, 49.2, 0.75),
       (2, '2023-04-10', 9.1, 48.7, 0.73);

-- Sample data for StockID = 3
INSERT INTO MarketData (StockID, DateOfMeasurement, StockPrice, CommodityPrice, ExchangeRate)
VALUES (3, '2023-04-01', 15.6, 55.1, 1.2),
       (3, '2023-04-02', 15.9, 57.2, 1.3),
       (3, '2023-04-10', 15.7, 56.3, 1.25);

-- Sample data for StockID = 4
INSERT INTO MarketData (StockID, DateOfMeasurement, StockPrice, CommodityPrice, ExchangeRate)
VALUES (4, '2023-04-01', 7.5, 43.2, 0.6),
       (4, '2023-04-02', 7.8, 45.1, 0.65),
       (4, '2023-04-10', 7.7, 44.3, 0.63);

-- Sample data for StockID = 5
INSERT INTO MarketData (StockID, DateOfMeasurement, StockPrice, CommodityPrice, ExchangeRate)
VALUES (5, '2023-04-01', 12.5, 50.1, 1.1),
       (5, '2023-04-02', 12.8, 52.2, 1.2),
       (5, '2023-04-10', 12.6, 51.3, 1.15);

-- Sample data for StockID = 6
INSERT INTO MarketData (StockID, DateOfMeasurement, StockPrice, CommodityPrice, ExchangeRate)
VALUES (6, '2023-04-01', 6.5, 40.1, 0.9),
       (6, '2023-04-02', 6.8, 42.2, 1.0),
       (6, '2023-04-10', 6.6, 41.3, 0.95);

-- Sample data for StockID = 7
INSERT INTO MarketData (StockID, DateOfMeasurement, StockPrice, CommodityPrice, ExchangeRate)
VALUES (7, '2023-04-01', 10.45, 50.01, 1.23),
       (7, '2023-04-02', 10.33, 50.50, 1.21),
       (7, '2023-04-10', 10.55, 50.67, 1.20);

-- Sample data for StockID = 8
INSERT INTO MarketData (StockID, DateOfMeasurement, StockPrice, CommodityPrice, ExchangeRate)
VALUES (8, '2023-04-01', 5.10, 23.50, 0.90),
       (8, '2023-04-02', 5.25, 24.00, 0.88),
       (8, '2023-04-10', 5.12, 23.67, 0.92);

-- Sample data for StockID = 9
INSERT INTO MarketData (StockID, DateOfMeasurement, StockPrice, CommodityPrice, ExchangeRate)
VALUES (9, '2023-04-01', 8.20, 32.10, 1.50),
       (9, '2023-04-02', 8.40, 33.00, 1.52),
       (9, '2023-04-10', 8.60, 34.00, 1.55);

-- Sample data for StockID = 10
INSERT INTO MarketData (StockID, DateOfMeasurement, StockPrice, CommodityPrice, ExchangeRate)
VALUES (10, '2023-04-01', 12.50, 70.00, 2.00),
       (10, '2023-04-02', 12.60, 72.00, 1.98),
       (10, '2023-04-10', 12.70, 74.00, 2.05);


-- -------------------------- ADD DATA TO OTHER FINANCIAL INFO TABLE --------------------------
INSERT INTO OtherFinancialInfo (Date, InflationRate, GDPGrowthRate, InterestRate)
VALUES ('2023-04-01', 0.05, 0.02, 0.01),
       ('2023-04-02', 0.05, 0.03, 0.02),
       ('2023-04-03', 0.06, 0.03, 0.02),
       ('2023-04-04', 0.06, 0.04, 0.02),
       ('2023-04-05', 0.07, 0.04, 0.03),
       ('2023-04-06', 0.07, 0.04, 0.03),
       ('2023-04-07', 0.07, 0.05, 0.04),
       ('2023-04-08', 0.08, 0.05, 0.04),
       ('2023-04-09', 0.08, 0.06, 0.05),
       ('2023-04-10', 0.09, 0.06, 0.05);

-- -------------------------- PROCEDURES FOR THE DIFFERENT QUERIES --------------------------
-- Calculates the risk level
DELIMITER |
CREATE PROCEDURE CalculateRiskLevel(IN p_InvestmentID INT)
BEGIN
    DECLARE p_Variance FLOAT;
    DECLARE p_Average FLOAT;
    DECLARE p_RiskLevel FLOAT;
    DECLARE p_StockID INT;

    SELECT StockID
    INTO p_StockID
    FROM Investment
    WHERE InvestmentID = p_InvestmentID;

    SELECT AVG(StockPrice)
    INTO p_Average
    FROM MarketData
    WHERE stockID = p_StockID;

    SELECT VARIANCE(StockPrice)
    INTO p_Variance
    FROM MarketData
    WHERE stockID = p_StockID;

    SET p_RiskLevel = SQRT(p_Variance) / p_Average;
    UPDATE Investment
    SET RiskLevel = p_RiskLevel
    WHERE InvestmentID = p_InvestmentID;
END|
DELIMITER ;

-- Calculates the total return
DELIMITER |
CREATE PROCEDURE CalculateTotalReturn(IN p_InvestmentID INT)
BEGIN
    DECLARE p_StockPrice FLOAT;
    DECLARE p_NumShares INT;
    DECLARE p_CostPerShare FLOAT;
    DECLARE p_DateOfInvestment DATE;
    DECLARE p_TotalReturn FLOAT;

    -- Get the required information from the Investment table
    SELECT StockPrice, NumberOfShares, DateOfInvestment
    INTO p_CostPerShare, p_NumShares, p_DateOfInvestment
    FROM Investment
             INNER JOIN MarketData ON Investment.StockID = MarketData.StockID AND
                                      Investment.DateOfInvestment = MarketData.DateOfMeasurement
    WHERE InvestmentID = p_InvestmentID;

    SELECT StockPrice
    INTO p_StockPrice
    FROM Investment
             INNER JOIN MarketData ON Investment.StockID = MarketData.StockID AND
                                      MarketData.DateOfMeasurement = CURDATE()
    WHERE InvestmentID = p_InvestmentID;

    -- Calculate the total return assuming dividends to be 0
    SET p_TotalReturn = (p_StockPrice * p_NumShares - p_CostPerShare * p_NumShares) / (p_CostPerShare * p_NumShares);

    -- Update the investment table with the current date
    UPDATE Investment
    SET TotalReturn = p_TotalReturn
    WHERE InvestmentID = p_InvestmentID;
END|
DELIMITER ;

-- Calculates annualized return
DELIMITER |
CREATE PROCEDURE CalculateAnnualizedReturn(IN p_InvestmentID INT)
BEGIN
    DECLARE p_TotalReturn FLOAT;
    DECLARE p_InitialDate DATE;
    DECLARE p_YearsPassed FLOAT;

    SELECT TotalReturn, DateOfInvestment
    INTO p_TotalReturn, p_InitialDate
    FROM Investment
    WHERE InvestmentID = p_InvestmentID;

    SET p_YearsPassed = DATEDIFF(CURDATE(), p_InitialDate) / 365;

    UPDATE Investment
    SET AnnualizedReturn = (p_TotalReturn / p_YearsPassed)
    WHERE InvestmentID = p_InvestmentID;
END|
DELIMITER ;

-- Updates all metrics
DELIMITER |
CREATE PROCEDURE UpdateMetrics(IN p_InvestmentID INT)
BEGIN
    CALL CalculateTotalReturn(p_InvestmentID);
    CALL CalculateAnnualizedReturn(p_InvestmentID);
    CALL CalculateRiskLevel(p_InvestmentID);

    UPDATE Investment
    SET DateOfMeasurement = CURDATE()
    WHERE InvestmentID = p_InvestmentID;
END |
DELIMITER ;

-- Calculate Correlation between two stocks
DELIMITER |
CREATE PROCEDURE CalculateCorr(IN p_InvestmentID1 INT, IN p_InvestmentID2 INT, OUT p_Corr FLOAT)
BEGIN
    DECLARE p_Variance1 FLOAT;
    DECLARE p_TRet1 FLOAT;
    DECLARE p_ARet1 FLOAT;
    DECLARE p_StockID1 INT;
    DECLARE p_Variance2 FLOAT;
    DECLARE p_TRet2 FLOAT;
    DECLARE p_ARet2 FLOAT;
    DECLARE p_StockID2 INT;

    SELECT StockID, TotalReturn, AnnualizedReturn
    INTO p_StockID1, p_TRet1, p_ARet1
    FROM Investment
    WHERE InvestmentID = p_InvestmentID1;

    SELECT StockID, TotalReturn, AnnualizedReturn
    INTO p_StockID2, p_TRet2, p_ARet2
    FROM Investment
    WHERE InvestmentID = p_InvestmentID2;

    SELECT VARIANCE(StockPrice)
    INTO p_Variance1
    FROM MarketData
    WHERE stockID = p_StockID1;

    SELECT VARIANCE(StockPrice)
    INTO p_Variance2
    FROM MarketData
    WHERE stockID = p_StockID2;

    SET p_Corr = (p_TRet1 - p_ARet1) * (p_TRet2 - p_ARet2) / SQRT(p_Variance1 * p_Variance2);
END|
DELIMITER ;
