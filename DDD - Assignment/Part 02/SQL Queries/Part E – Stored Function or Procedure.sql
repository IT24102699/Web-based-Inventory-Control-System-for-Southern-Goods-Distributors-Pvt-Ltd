-- Part E - Stored Function/Procedure


/*

	Write one stored function or procedure relevant to your system. 

*/



-- Function Code

CREATE FUNCTION dbo.GetOrderTotal (@OrderID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TotalValue DECIMAL(10, 2);
    SELECT @TotalValue = SUM(oi.Quantity * i.Price)
    FROM 
        Order_Item AS oi
    JOIN 
        Item AS i ON oi.ItemID = i.ItemID
    WHERE 
        oi.OrderID = @OrderID;
    RETURN ISNULL(@TotalValue, 0);
END;
GO





-- Execution

/*
	i) Get the total for a single order
*/
SELECT dbo.GetOrderTotal(501) AS OrderTotal;



/*
	ii) Get the calculated total for every order in the Orders table.
*/
SELECT 
    OrderID, 
    OrderDate, 
    dbo.GetOrderTotal(OrderID) AS CalculatedTotal
FROM 
    Orders;