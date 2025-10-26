USE [test-db];
GO

-- Create Users table
CREATE TABLE Users (
    Id int IDENTITY(1,1) PRIMARY KEY,
    Name nvarchar(100) NOT NULL,
    Email nvarchar(255) NOT NULL UNIQUE,
    CreatedAt datetime2 NOT NULL DEFAULT GETUTCDATE()
);
GO

-- Create Orders table
CREATE TABLE Orders (
    Id int IDENTITY(1,1) PRIMARY KEY,
    UserId int NOT NULL,
    Amount decimal(18,2) NOT NULL,
    OrderDate datetime2 NOT NULL DEFAULT GETUTCDATE(),
    Status nvarchar(50) NOT NULL DEFAULT 'Pending',
    FOREIGN KEY (UserId) REFERENCES Users(Id)
);
GO

-- Create AnalyticsReports table
CREATE TABLE AnalyticsReports (
    Id int IDENTITY(1,1) PRIMARY KEY,
    ReportDate datetime2 NOT NULL UNIQUE,
    TotalUsers int NOT NULL,
    TotalOrders int NOT NULL,
    TotalRevenue decimal(18,2) NOT NULL,
    AverageOrderValue decimal(18,2) NOT NULL
);
GO

-- Create ScheduledJobs table
CREATE TABLE ScheduledJobs (
    Id int IDENTITY(1,1) PRIMARY KEY,
    JobName nvarchar(100) NOT NULL,
    LastRun datetime2 NOT NULL,
    NextRun datetime2 NOT NULL,
    Status nvarchar(50) NOT NULL,
    Result nvarchar(500) NULL
);
GO

-- Create indexes for better performance
CREATE INDEX IX_Orders_UserId ON Orders(UserId);
CREATE INDEX IX_Orders_OrderDate ON Orders(OrderDate);
CREATE INDEX IX_Orders_Status ON Orders(Status);
CREATE INDEX IX_ScheduledJobs_JobName_LastRun ON ScheduledJobs(JobName, LastRun);
CREATE INDEX IX_Users_Email ON Users(Email);
CREATE INDEX IX_Users_CreatedAt ON Users(CreatedAt);
GO

-- Insert sample data
INSERT INTO Users (Name, Email, CreatedAt) VALUES
('Mario Rossi', 'mario.rossi@email.com', DATEADD(DAY, -30, GETUTCDATE())),
('Giulia Bianchi', 'giulia.bianchi@email.com', DATEADD(DAY, -25, GETUTCDATE())),
('Luca Verdi', 'luca.verdi@email.com', DATEADD(DAY, -20, GETUTCDATE())),
('Anna Neri', 'anna.neri@email.com', DATEADD(DAY, -15, GETUTCDATE())),
('Marco Ferrari', 'marco.ferrari@email.com', DATEADD(DAY, -10, GETUTCDATE()));
GO

INSERT INTO Orders (UserId, Amount, OrderDate, Status) VALUES
(1, 99.99, DATEADD(DAY, -25, GETUTCDATE()), 'Completed'),
(2, 149.50, DATEADD(DAY, -20, GETUTCDATE()), 'Completed'),
(1, 79.99, DATEADD(DAY, -18, GETUTCDATE()), 'Completed'),
(3, 199.99, DATEADD(DAY, -15, GETUTCDATE()), 'Completed'),
(4, 59.99, DATEADD(DAY, -12, GETUTCDATE()), 'Pending'),
(2, 89.99, DATEADD(DAY, -10, GETUTCDATE()), 'Completed'),
(5, 129.99, DATEADD(DAY, -8, GETUTCDATE()), 'Processing'),
(1, 39.99, DATEADD(DAY, -5, GETUTCDATE()), 'Completed'),
(3, 259.99, DATEADD(DAY, -3, GETUTCDATE()), 'Pending'),
(4, 179.99, DATEADD(DAY, -1, GETUTCDATE()), 'Processing');
GO