-- Part B – SQL DDL Implementation


-- 1. Category Table

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);


-- 2. Item Table

CREATE TABLE Item (
    ItemID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    Quantity INT DEFAULT 0 CHECK (Quantity >= 0),
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);


-- 3. Supplier Table

CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactNo VARCHAR(15),
    Address VARCHAR(255)
);


-- 4. Customer Table

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);


-- 5. Employee Table

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Role VARCHAR(50),
    Salary DECIMAL(10,2) CHECK (Salary >= 0)
);


-- 6. Orders Table

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


-- 7. Order_Item (M:N Relationship)

CREATE TABLE Order_Item (
    OrderID INT,
    ItemID INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    PRIMARY KEY (OrderID, ItemID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
);


-- 8. Stock_Receive Table

CREATE TABLE Stock_Receive (
    ReceiveID INT PRIMARY KEY,
    ReceiveDate DATE NOT NULL,
    SupplierID INT,
    EmpID INT,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);


-- 9. Receive_Item (M:N Relationship)

CREATE TABLE Receive_Item (
    ReceiveID INT,
    ItemID INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    PRIMARY KEY (ReceiveID, ItemID),
    FOREIGN KEY (ReceiveID) REFERENCES Stock_Receive(ReceiveID),
    FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
);
