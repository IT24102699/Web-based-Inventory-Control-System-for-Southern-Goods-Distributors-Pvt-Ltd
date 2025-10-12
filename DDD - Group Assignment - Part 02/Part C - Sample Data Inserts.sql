-- Part C – Insert Sample Data 


-- 1. Category

INSERT INTO Category VALUES
(1, 'Electronics'),
(2, 'Furniture'),
(3, 'Stationery'),
(4, 'Appliances'),
(5, 'Clothing');


-- 2. Item

INSERT INTO Item VALUES
(101, 'Laptop', '15-inch, 8GB RAM', 10, 1200.00, 1),
(102, 'Office Chair', 'Ergonomic chair', 20, 150.00, 2),
(103, 'Notebook', '200 pages ruled', 50, 2.50, 3),
(104, 'Microwave', '800W compact', 5, 180.00, 4),
(105, 'T-shirt', 'Cotton, size M', 30, 12.00, 5);


-- 3. Supplier

INSERT INTO Supplier VALUES
(201, 'TechWorld', '0711234567', 'Colombo'),
(202, 'FurniMart', '0722345678', 'Kandy'),
(203, 'Stationery Hub', '0773456789', 'Galle'),
(204, 'HomeAppliances Ltd', '0764567890', 'Negombo'),
(205, 'FashionZone', '0755678901', 'Kurunegala');


-- 4. Customer

INSERT INTO Customer VALUES
(301, 'Binuri Umanda', 'binuri@example.com', '0771111111'),
(302, 'Nimal Perera', 'nimalp@example.com', '0772222222'),
(303, 'Kamal Silva', 'kamals@example.com', '0773333333'),
(304, 'Tharushi Fernando', 'tharushi@example.com', '0774444444'),
(305, 'Ruwan Jayasuriya', 'ruwanj@example.com', '0775555555');


-- 5. Employee

INSERT INTO Employee VALUES
(401, 'Anura Dissanayake', 'Manager', 85000.00),
(402, 'Chathura Bandara', 'Cashier', 45000.00),
(403, 'Dilani Karunathilaka', 'Stock Keeper', 50000.00),
(404, 'Sunil Weerasinghe', 'Salesperson', 40000.00),
(405, 'Heshan Perera', 'Clerk', 38000.00);


-- 6. Orders

INSERT INTO Orders VALUES
(501, '2025-09-20', 301),
(502, '2025-09-21', 302),
(503, '2025-09-22', 303),
(504, '2025-09-23', 304),
(505, '2025-09-24', 305);


-- 7. Order_Item

INSERT INTO Order_Item VALUES
(501, 101, 1),  -- Binuri bought 1 Laptop
(501, 103, 5),  -- Binuri bought 5 Notebooks
(502, 102, 2),  -- Nimal bought 2 Chairs
(503, 105, 3),  -- Kamal bought 3 T-shirts
(504, 104, 1);  -- Tharushi bought 1 Microwave


-- 8. Stock_Receive

INSERT INTO Stock_Receive VALUES
(601, '2025-09-01', 201, 401),
(602, '2025-09-02', 202, 403),
(603, '2025-09-05', 203, 403),
(604, '2025-09-10', 204, 401),
(605, '2025-09-12', 205, 405);


-- 9. Receive_Item

INSERT INTO Receive_Item VALUES
(601, 101, 10),   -- Received 10 Laptops
(602, 102, 20),   -- Received 20 Chairs
(603, 103, 50),   -- Received 50 Notebooks
(604, 104, 5),    -- Received 5 Microwaves
(605, 105, 30);   -- Received 30 T-shirts



-- Retrieve all the inserted data from created tables

SELECT * FROM Category;

SELECT * FROM Customer;

SELECT * FROM Employee;

SELECT * FROM Item;

SELECT * FROM Order_Item;

SELECT * FROM Orders;

SELECT * FROM Receive_Item;

SELECT * FROM Stock_Receive;

SELECT * FROM Supplier;
