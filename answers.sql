Question 1:
USE product;

CREATE TABLE ProductDetail(
orderID INT,
customerName VARCHAR(50),
productName VARCHAR(50)
);

INSERT INTO ProductDetail (orderID, customerName, productName) 
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', ' Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

SELECT * FROM ProductDetail;

Question 2

USE product;

CREATE TABLE OrderDetails(
OrderID INT,
CustomerName VARCHAR(100),
Product VARCHAR(50),
Quantity INT
);

INSERT INTO OrderDetails(OrderID, CustomerName, Product, Quantity)
VALUE (101, "John Doe", "Laptop", 2),
(101, "John Doe", "Mouse", 1),
(102, "Jane Smith", "Tablet", 3),
(102, "Jane Smith", "Keyboard", 1),
(102, "Jane Smith", "Mouse", 2),
(103, "Emily Clark", "Phone", 2);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;






