-- First I am Creating the database
CREATE DATABASE abc_perfume_Traders;
USE abc_perfume_Traders;
-- Creating the Customer Table 
-- This table stores customer information including their login credentials
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) ,
    Password VARCHAR(255) NOT NULL,
    Address TEXT,
    Telephone_Number VARCHAR(20),
    Last_Login DATETIME
);

-- Create the Supplier table
-- This table stores the names of all suppliers.
CREATE TABLE Supplier (
    Supplier_ID INT PRIMARY KEY AUTO_INCREMENT,
    Supplier_Name VARCHAR(255) NOT NULL UNIQUE
);

-- Create the Category table
-- This table stores different categories for products.
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(255) NOT NULL UNIQUE
);

-- Create the Product table
-- This table contains details about each product.
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Supplier_ID INT,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    Category_ID INT,
    Fragrance VARCHAR(255),
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID),
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);

-- Create the Tag table
CREATE TABLE Tag (
    Tag_ID INT PRIMARY KEY AUTO_INCREMENT,
    Tag_Name VARCHAR(255) NOT NULL UNIQUE
);

-- Create the Product_Tags table
CREATE TABLE Product_Tags (
    Product_ID INT,
    Tag_ID INT,
    PRIMARY KEY (Product_ID, Tag_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Tag_ID) REFERENCES Tag(Tag_ID)
);

-- Create the Orders table
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Order_Date DATETIME,
    Total_Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Create the Order_Items table
CREATE TABLE Order_Items (
    Order_Item_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Returned BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

-- Create the Inventory table
CREATE TABLE Inventory (
    ProductID INT PRIMARY KEY,
    StockQuantity INT,
    FOREIGN KEY (ProductID) REFERENCES Product(Product_ID)
);

-- Insert data into Customer table
INSERT INTO Customer (FullName, Email, Last_Login, Password, Address, Telephone_Number) VALUES
    ('John Digel Smith', 'john.smith@example.com', '2024-05-19 14:30:00', 'password123', '123 Elm St, Some City, Country', '9876543210'),
    ('Sarah ana Johnson', 'sarah.johnson@example.com', '2024-04-19 15:45:00', 'letmein456', '456 Oak Ave, Another City, Country', '1234567890'),
    ('David Davis miller', 'david.davis@example.com', '2024-05-03 09:20:00', 'mypassword123', '789 Pine Rd, New City, Country', '9999999999'),
    ('Jennifer eva Brown', 'jennifer.brown@example.com', '2024-02-21 10:30:00', 'password987', '123 Cedar Ln, Another City, Country', '5555555555'),
    ('Michaela morn Wilson', 'michaela.wilson@example.com', '2024-01-22 11:45:00', 'password456', '456 Maple Ave, Yet Another City, Country', '1111111111'),
    ('Chris eves Thompson', 'chris.thompson@example.com', '2024-11-23 08:30:00', 'mypassword567', '789 Birch Rd, Another City, Country', '2222222222'),
    ('Jayanth Kumar', 'jayanth@example.com', '2024-05-26 10:00:00', 'password123', '123 Main St', '123-456-7890'),
    ('Kamal Hassan', 'kamal@example.com', '2024-05-25 14:30:00', 'securepass', '456 Oak Ave', '234-567-8901'),
    ('Suhail Ahmed', 'suhail@example.com', '2024-05-18 09:15:00', 'mypass123', '789 Pine Ln', '345-678-9012'),
    ('John Doe', 'john@example.com', '2024-06-17 18:45:00', 'johnpass', '1011 Elm St', '456-789-0123'),
    ('Michael Smith', 'michael@example.com', '2024-06-01 12:20:00', 'mikepass', '1213 Birch Ave', '567-890-1234'),
    ('Nandu Reddy', 'nandu@example.com', '2024-05-13 16:55:00', 'nandupass', '1415 Cedar Ln', '678-901-2345'),
    ('Yeshwanth Rao', 'yesh@example.com', '2024-05-11 11:35:00', 'yeshpass', '1617 Willow St', '789-012-3456'),
    ('Laya Kapoor', 'laya@example.com', '2024-05-01 20:10:00', 'layapass', '1819 Maple Ave', '890-123-4567'),
    ('Chandu Sharma', 'chandu@example.com', '2024-04-24 17:25:00', 'chandupass', '2021 Oakwood Ln', '901-234-5678'),
    ('Lucky Singh', 'lucky@example.com', '2024-05-26 08:50:00', 'luckypass', '2223 Pinehurst St', '012-345-6789');
    
    
    
    -- Insert data into Category table
INSERT INTO Category (Category_Name) VALUES
    ('Floral'),
    ('Woody'),
    ('Sweet'),
    ('Unisex'),
    ('Oriental'),
    ('Fresh');

-- Insert data into Supplier table
INSERT INTO Supplier (Supplier_Name) VALUES
    ('Perfume Paradise'),
    ('Fragrance Fusion'),
    ('Scent Story'),
    ('Fresh Scents'),
    ('Flower Perfumes'),
    ('Woody Wonders'),
    ('Oriental Scents'),
    ('Aqua Scents'),
    ('Floral Fantasies'),
    ('Musk Masters');

-- Insert data into Product table
INSERT INTO Product (Name, Supplier_ID, Description, Price, Category_ID, Fragrance) VALUES
    ('Rose Elegance', 1, 'A classic rose fragrance', 80.00, 1, 'Rose'),
    ('Sandalwood Mystique', 2, 'Warm and woody scent', 95.00, 2, 'Sandalwood'),
    ('Oud Royale', 3, 'Rich and opulent oud fragrance', 150.00, 3, 'Oud'),
    ('Citrus Splash', 4, 'Zesty and refreshing citrus blend', 60.00, 4, 'Citrus'),
    ('Jasmine Bloom', 5, 'Delicate jasmine fragrance', 75.00, 1, 'Jasmine'),
    ('Cedarwood Spice', 6, 'Spicy and aromatic cedarwood scent', 85.00, 2, 'Cedarwood'),
    ('Amber Elixir', 7, 'Exotic and warm amber fragrance', 120.00, 3, 'Amber'),
    ('Ocean Breeze', 8, 'Clean and invigorating ocean scent', 55.00, 4, 'Ocean'),
    ('Lavender Dreams', 9, 'Calming and relaxing lavender fragrance', 70.00, 1, 'Lavender'),
    ('Musk Allure', 10, 'Sensual and alluring musk scent', 90.00, 3, 'Musk');

-- Insert data into Tag table
INSERT INTO Tag (Tag_Name) VALUES 
    ('Floral'),
    ('Sweet'),
    ('Spicy'),
    ('Woody'),
    ('Fresh'),
    ('Citrus'),
    ('Oriental'),
    ('Musky'),
    ('Unisex'),
    ('Evening');

-- Insert data into Product_Tags table
INSERT INTO Product_Tags (Product_ID, Tag_ID) VALUES
    (1, 1), (1, 2),
    (2, 4), (2, 3),
    (3, 7), (3, 8),
    (4, 5), (4, 6),
    (5, 1),
    (6, 4), (6, 3),
    (7, 7),
    (8, 5),
    (9, 1),
    (10, 8), (10, 9);

-- Insert data into Orders table
INSERT INTO Orders (Customer_ID, Total_Amount) VALUES
    (1, 235.00),
    (2, 150.00),
    (3, 80.00),
    (4, 140.00),
    (5, 60.00),
    (6, 175.00),
    (7, 95.00),
    (8, 125.00),
    (9, 75.00),
    (10, 205.00);
-- Insert data into Order Items table
INSERT INTO Order_Items (Order_ID, Product_ID, Quantity, Price, Returned) VALUES
    (1, 1, 1, 80.00, FALSE),
    (1, 2, 1, 95.00, FALSE),
    (1, 3, 1, 150.00, FALSE),
    (2, 3, 1, 150.00, FALSE),
    (3, 1, 1, 80.00, FALSE),
    (4, 4, 2, 60.00, TRUE), 
    (4, 5, 1, 75.00, FALSE),
    (5, 4, 1, 60.00, TRUE),
    (6, 6, 1, 85.00, FALSE),
    (6, 7, 1, 120.00, FALSE),
    (7, 2, 1, 95.00, FALSE),
    (8, 8, 1, 55.00, FALSE),
    (8, 9, 1, 70.00, FALSE),
    (9, 5, 1, 75.00, FALSE),
    (10, 1, 1, 80.00, FALSE),
    (10, 10, 1, 90.00, FALSE),
    (10, 4, 1, 55.00, TRUE);

-- Insert data into Inventory table
INSERT INTO Inventory (ProductID, StockQuantity) VALUES
    (1, 50),
    (2, 40),
    (3, 30),
    (4, 60),
    (5, 70),
    (6, 20),
    (7, 25),
    (8, 80),
    (9, 65),
    (10, 35);
    
-- 1. provides a Detail information about suppliers and the number of products they provide.
SELECT 
    s.Supplier_Name, 
    COUNT(p.Product_ID) AS NumberOfProducts
FROM 
    Supplier s
LEFT JOIN 
    Product p ON s.Supplier_ID = p.Supplier_ID
GROUP BY 
    s.Supplier_Name;
 
  -- 2. 10 best-selling products with the total amount and their supplier.
    SELECT 
    p.Name AS ProductName,
    s.Supplier_Name AS SupplierName,
    SUM(oi.Quantity * oi.Price) AS TotalSales
FROM 
    Product p
JOIN 
    Supplier s ON p.Supplier_ID = s.Supplier_ID
JOIN 
    Order_Items oi ON p.Product_ID = oi.Product_ID
GROUP BY 
    p.Name, s.Supplier_Name
ORDER BY 
    TotalSales DESC
LIMIT 10;

    -- 3. List of customers and their overall total purchases
    
    SELECT 
    c.FullName AS CustomerName,
    c.Email AS Email,
    SUM(o.Total_Amount) AS TotalPurchases
FROM 
    Customer c
JOIN 
    Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY 
    c.Customer_ID, c.FullName, c.Email
ORDER BY 
    TotalPurchases DESC;
 
 -- 4. List of the returned items
    
    SELECT 
    oi.Order_Item_ID,
    o.Order_ID,
    c.FullName AS CustomerName,
    p.Name AS ProductName,
    oi.Quantity,
    oi.Price,
    oi.Price * oi.Quantity AS TotalAmount
FROM 
    Order_Items oi
JOIN 
    Orders o ON oi.Order_ID = o.Order_ID
JOIN 
    Customer c ON o.Customer_ID = c.Customer_ID
JOIN 
    Product p ON oi.Product_ID = p.Product_ID
WHERE 
    oi.Returned = TRUE
ORDER BY 
    oi.Order_Item_ID;
 
 -- 5. Get the most popular product based on the number of orders
    SELECT 
    p.Product_ID,
    p.Name AS ProductName,
    COUNT(oi.Order_Item_ID) AS NumberOfOrders
FROM 
    Order_Items oi
JOIN 
    Product p ON oi.Product_ID = p.Product_ID
GROUP BY 
    p.Product_ID, p.Name
ORDER BY 
    NumberOfOrders DESC
LIMIT 3;

-- 6 total revenue generated by each product:
SELECT p.Name, SUM(oi.price * oi.Quantity) AS Total_Revenue
FROM Product p
JOIN Order_Items oi ON p.Product_ID = oi.Product_ID
GROUP BY p.Product_ID;

-- 7 Main trigger This trigger will update the Inventory table whenever a new order item is inserted, reducing the stock quantity based on the ordered quantity:

DELIMITER //

CREATE TRIGGER update_inventory AFTER INSERT ON Order_Items
FOR EACH ROW
BEGIN
    UPDATE Inventory
    SET StockQuantity = StockQuantity - NEW.Quantity
    WHERE ProductID = NEW.Product_ID;
END;
//

DELIMITER ;


SELECT * FROM Orders WHERE Order_ID = 1;

-- Creating Views:
-- This view will display detailed order information including customer name, product names, quantities, and total prices, excluding the 
CREATE VIEW OrderDetails AS
SELECT 
    Orders.Order_ID,
    Customer.FullName AS CustomerName,
    Product.Name AS ProductName,
    Order_Items.Quantity,
    Order_Items.Price,
    (Order_Items.Quantity * Order_Items.Price) AS TotalPrice
FROM 
    Orders
JOIN 
    Customer ON Orders.Customer_ID = Customer.Customer_ID
JOIN 
    Order_Items ON Orders.Order_ID = Order_Items.Order_ID
JOIN 
    Product ON Order_Items.Product_ID = Product.Product_ID;
    
    SELECT * FROM OrderDetails;




    

    
    



