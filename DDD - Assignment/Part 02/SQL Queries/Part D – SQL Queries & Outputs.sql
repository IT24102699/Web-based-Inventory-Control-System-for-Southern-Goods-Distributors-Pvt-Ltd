-- Part D – SQL Queries & Outputs 


/*

Write at least 5 queries: 
• Simple SELECT 
• JOIN 
• Aggregation 
• GROUP BY / HAVING 
• Subquery

*/



-- 01. Simple SELECT 
/*
Show all items that have more than 10 in stock.
*/

SELECT ItemID, Name, Quantity, Price
FROM Item
WHERE Quantity > 10;





-- 02. JOIN
/*
List orders with customer names and ordered items.
*/

SELECT o.OrderID, c.Name AS CustomerName, i.Name AS ItemName, oi.Quantity
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN Order_Item oi ON o.OrderID = oi.OrderID
JOIN Item i ON oi.ItemID = i.ItemID;





-- 03. Aggregation 
/*
	i) Find the total sales revenue for all orders.
*/

SELECT SUM(oi.Quantity * i.Price) AS TotalRevenue
FROM Order_Item oi
JOIN Item i ON oi.ItemID = i.ItemID;


/*
	ii) Calculates the average price of all items available in the store
*/

SELECT AVG(Price) AS AverageItemPrice 
FROM Item;





-- 04. GROUP BY / HAVING 
/*
Finds orders that contain more than one type of item.
*/

SELECT 
    OrderID, 
    COUNT(ItemID) AS NumberOfItemTypes
FROM 
    Order_Item
GROUP BY 
    OrderID
HAVING 
    COUNT(ItemID) > 1;





-- 05. Subquery

/*
	i) Find items that are more expensive than the average price of all items.
*/

SELECT Name, Price
FROM Item
WHERE Price > (
				SELECT AVG(Price) 
				FROM Item
);


/*
	ii) Find the names of all customers who have placed at least one order.
*/

SELECT Name 
FROM Customer 
WHERE CustomerID IN (
				SELECT CustomerID 
				FROM Orders
);