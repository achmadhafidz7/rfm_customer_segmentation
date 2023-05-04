WITH cte_dataset AS (
	SELECT 
		CustomerKey, 
		SalesOrderNumber, 
		SalesAmount, 
		OrderDate
	FROM 
		AdventureWorksDW2019.dbo.FactInternetSales 
	--WHERE 
		--SalesTerritoryKey = 10
),
OrderSummary AS (
	SELECT 
		CustomerKey, 
		SalesOrderNumber, 
		OrderDate,
		SUM(SalesAmount) AS TotalSales
		--COUNT(SalesOrderNumber) OVER(PARTITION BY CustomerKey, SalesOrderNumber) AS Duplicate --<< this is for count dupes
	FROM cte_dataset
	GROUP BY CustomerKey, SalesOrderNumber, OrderDate
) SELECT * FROM OrderSummary