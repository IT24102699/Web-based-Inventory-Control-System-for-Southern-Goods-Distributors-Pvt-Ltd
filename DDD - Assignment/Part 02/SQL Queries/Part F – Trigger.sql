-- Part F – Trigger 


/*

		Write a trigger that updates/validates/audits data. 

*/



-- Trigger Code
CREATE TRIGGER trg_PreventOverSelling
ON Order_Item
FOR INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Item i
        JOIN inserted ins ON i.ItemID = ins.ItemID
        WHERE i.Quantity < ins.Quantity
    )
    BEGIN
        RAISERROR ('Cannot complete order. Not enough stock available.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        UPDATE i
        SET i.Quantity = i.Quantity - ins.Quantity
        FROM
            Item AS i
        JOIN
            inserted AS ins ON i.ItemID = ins.ItemID;
    END;
END;
GO





-- Demonstrating the execution 

			-- Insufficient Stock (Order Fails)

-- i) Check Stock Before:
SELECT Name, Quantity FROM Item WHERE ItemID = 104;

-- ii) Attempt to Order More Than Available:
INSERT INTO Order_Item (OrderID, ItemID, Quantity) VALUES (505, 104, 10);

-- iii) Verify Stock Was Not Changed:
SELECT Name, Quantity FROM Item WHERE ItemID = 104;



			-- Sufficient Stock (Order Succeeds)

-- i) Check Stock Before:
SELECT Name, Quantity FROM Item WHERE ItemID = 104;

-- ii) Place a Valid Order:
INSERT INTO Order_Item (OrderID, ItemID, Quantity) VALUES (502, 104, 2);

-- ii) Verify Stock Was Updated:
SELECT Name, Quantity FROM Item WHERE ItemID = 104;

