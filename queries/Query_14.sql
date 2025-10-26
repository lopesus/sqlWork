USE [test-db];
GO

-- Stored procedure for advanced analytics
CREATE OR ALTER PROCEDURE sp_GetCustomerLifetimeValue
    @TopCount INT = 10
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (@TopCount)
        u.Id as UserId,
        u.Name as CustomerName,
        u.Email,
        COUNT(o.Id) as TotalOrders,
        ISNULL(SUM(o.Amount), 0) as LifetimeValue,
        ISNULL(AVG(o.Amount), 0) as AverageOrderValue,
        MIN(o.OrderDate) as FirstOrderDate,
        MAX(o.OrderDate) as LastOrderDate,
        DATEDIFF(DAY, MIN(o.OrderDate), MAX(o.OrderDate)) as CustomerLifespanDays,
        CASE
            WHEN MAX(o.OrderDate) >= DATEADD(DAY, -30, GETUTCDATE()) THEN 'Active'
            WHEN MAX(o.OrderDate) >= DATEADD(DAY, -90, GETUTCDATE()) THEN 'At Risk'
            ELSE 'Inactive'
        END as CustomerStatus
    FROM Users u
    LEFT JOIN Orders o ON u.Id = o.UserId
    WHERE o.Id IS NOT NULL
    GROUP BY u.Id, u.Name, u.Email
    ORDER BY LifetimeValue DESC;
END;
GO

-- Stored procedure for cohort analysis
CREATE OR ALTER PROCEDURE sp_GetCohortAnalysis
AS
BEGIN
    SET NOCOUNT ON;

    WITH UserCohorts AS (
        SELECT
            Id as UserId,
            DATEFROMPARTS(YEAR(CreatedAt), MONTH(CreatedAt), 1) as CohortMonth
        FROM Users
    ),
    OrderData AS (
        SELECT
            o.UserId,
            uc.CohortMonth,
            DATEDIFF(MONTH, uc.CohortMonth, DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1)) as PeriodNumber,
            o.Amount
        FROM Orders o
        JOIN UserCohorts uc ON o.UserId = uc.UserId
    )
    SELECT
        CohortMonth,
        PeriodNumber,
        COUNT(DISTINCT UserId) as ActiveUsers,
        SUM(Amount) as Revenue,
        AVG(Amount) as AverageOrderValue
    FROM OrderData
    GROUP BY CohortMonth, PeriodNumber
    ORDER BY CohortMonth, PeriodNumber;
END;
GO

-- Stored procedure for revenue forecasting
CREATE OR ALTER PROCEDURE sp_GetRevenueForecast
    @ForecastMonths INT = 6
AS
BEGIN
    SET NOCOUNT ON;

    WITH MonthlyRevenue AS (
        SELECT
            DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1) as RevenueMonth,
            SUM(Amount) as MonthlyRevenue
        FROM Orders
        WHERE OrderDate >= DATEADD(MONTH, -12, GETUTCDATE())
        GROUP BY DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1)
    ),
    RevenueWithGrowth AS (
        SELECT
            RevenueMonth,
            MonthlyRevenue,
            LAG(MonthlyRevenue) OVER (ORDER BY RevenueMonth) as PreviousMonthRevenue,
            CASE
                WHEN LAG(MonthlyRevenue) OVER (ORDER BY RevenueMonth) > 0
                THEN ((MonthlyRevenue - LAG(MonthlyRevenue) OVER (ORDER BY RevenueMonth)) / LAG(MonthlyRevenue) OVER (ORDER BY RevenueMonth)) * 100
                ELSE 0
            END as GrowthRate
        FROM MonthlyRevenue
    )
    SELECT
        RevenueMonth,
        MonthlyRevenue,
        GrowthRate,
        AVG(GrowthRate) OVER (ORDER BY RevenueMonth ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as MovingAverageGrowth
    FROM RevenueWithGrowth
    ORDER BY RevenueMonth;
END;
GO