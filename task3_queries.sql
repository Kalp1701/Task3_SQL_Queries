-- Query to find distinct categories
SELECT DISTINCT Category FROM sale_report;

-- Query to get total stock
SELECT SUM(Stock) AS total_stock FROM sale_report;

-- Subquery example: Average stock per Size for DRESS above overall average
SELECT Size, AVG(Stock) AS avg_stock
FROM sale_report
WHERE Category = 'DRESS'
GROUP BY Size
HAVING AVG(Stock) > (
    SELECT AVG(Stock)
    FROM sale_report
    WHERE Category = 'DRESS'
);

-- Create view for average stock per Size for DRESS
CREATE VIEW IF NOT EXISTS dress_avg_stock AS
SELECT Size, AVG(Stock) AS avg_stock
FROM sale_report
WHERE Category = 'DRESS'
GROUP BY Size;

-- Create index on Category to optimize queries
CREATE INDEX IF NOT EXISTS idx_category ON sale_report(Category);
