CREATE DATABASE Sales;
USE Sales;

CREATE TABLE Orders (
    Order_Id INT AUTO_INCREMENT,
    Customer_name VARCHAR(100) NOT NULL,
    Product_Category VARCHAR(50) NOT NULL,
    Ordered_item VARCHAR(100) NOT NULL,
    Contact_No VARCHAR(15) NOT NULL,
    PRIMARY KEY (Order_Id),
    UNIQUE (Contact_No)
);
desc orders;

ALTER TABLE Orders 
ADD order_quantity INT NOT NULL;
 desc orders;
 
ALTER TABLE Orders 
RENAME TO sales_orders;

INSERT INTO sales_orders (Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity) 
VALUES
('Arun', 'Electronics', 'Smartphone', '1234567890', 2),
('Dhanu', 'Books', 'Fiction Novel', '9876543210', 1),
('kevin', 'Home Appliances', 'Microwave', '1234509876', 1),
('Manu', 'Clothing', 'Jacket', '4567890123', 3),
('Evan ', 'Electronics', 'Laptop', '7890123456', 1),
('Krishna', 'Books', 'Science Textbook', '1357902468', 2),
('George ', 'Furniture', 'Office Chair', '2468135790', 1),
('Hannah ', 'Clothing', 'T-shirt', '1122334455', 5),
('Anu', 'Electronics', 'Headphones', '9988776655', 2),
('Adhi', 'Home Appliances', 'Blender', '8877665544', 1);

select *from sales_orders;

SELECT Customer_name, Ordered_item 
FROM sales_orders;


UPDATE sales_orders 
SET Ordered_item = 'Tablet' 
WHERE Order_Id = 1;


desc sales_orsers;

DROP TABLE sales_orders;







