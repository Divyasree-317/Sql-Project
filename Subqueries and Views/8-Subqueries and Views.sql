CREATE DATABASE World;
USE World;

CREATE TABLE Country (
    country_id INT PRIMARY KEY ,
    country_name VARCHAR(100),
    population INT,
    rating DECIMAL(3,1)
);

CREATE TABLE Persons (
    person_id INT PRIMARY KEY ,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    country_id INT,
    rating DECIMAL(3,1),
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

Desc Country;

Desc Persons;

INSERT INTO Country (Country_id, Country_name ,Population, Rating) VALUES
(1, 'USA', 331002651, 4.5),
(2, 'Canada', 37742154, 4.5),
(3, 'UK', 67886011, 4.2),
(4, 'France', 65273511, 4.0),
(5, 'Germany', 83783942, 4.3);

Select * from Country;

INSERT INTO Persons(Person_id, First_name ,Last_name, Country_id, Rating) VALUES
(1, 'John', 'Doe', 1, 4.2),
(2, 'Jane', 'Smith', 1, 4.5),
(3, 'Mike', 'Johnson', 2, 3.8),
(4, 'Jais', 'Williams', 2, 4.1),
(5, 'David', 'Brown', 3, 3.9),
(6, 'Emma', 'Davis', 3, 4.0),
(7, 'James', 'Wilson', 4, 3.7),
(8, 'Sophie', 'Martin', 4, 3.5),
(9, 'Thomas', 'George', 5, 4.4),
(10, 'Anna', 'Marry', 5, 4.2);

Select * from Persons;

SELECT c.country_name, COUNT(p.person_id) as person_count
FROM Country c
LEFT JOIN Persons p ON c.country_id = p.country_id
GROUP BY c.country_name;

SELECT c.country_name, COUNT(p.person_id) as person_count
FROM Country c
LEFT JOIN Persons p ON c.country_id = p.country_id
GROUP BY c.country_name
ORDER BY person_count DESC;

SELECT c.country_name, AVG(p.rating) as avg_rating
FROM Country c
JOIN Persons p ON c.country_id = p.country_id
GROUP BY c.country_name
HAVING AVG(p.rating) > 3.0;

SELECT country_name, rating
FROM Country
WHERE rating = (
    SELECT rating
    FROM Country
    WHERE country_name = 'USA'
);

SELECT country_name, population
FROM Country
WHERE population > (
    SELECT AVG(population)
    FROM Country
);

CREATE DATABASE Product;
USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(20),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

DESC Customer;

INSERT INTO Customer(Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)Values
(1, 'John', 'Doe', 'john.doe@email.com', '123-456-7890', '123 Main St', 'Los Angeles', 'California', '90001', 'US'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '234-567-8901', '456 Oak Ave', 'San Francisco', 'California', '94102', 'US'),
(3, 'Mike', 'Johnson', 'mike.j@email.com', '345-678-9012', '789 Pine Rd', 'New York', 'New York', '10001', 'US'),
(4, 'Sarah', 'Williams', 'sarah.w@email.com', '456-789-0123', '321 Elm St', 'Chicago', 'Illinois', '60601', 'US'),
(5, 'David', 'Brown', 'david.b@email.com', '567-890-1234', '654 Maple Dr', 'Houston', 'Texas', '77001', 'US'),
(6, 'Emma', 'Davis', 'emma.d@email.com', '678-901-2345', '987 Cedar Ln', 'Los Angeles', 'California', '90002', 'US');

Select * from Customer;

CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM Customer;

CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'US';

CREATE VIEW Customer_details AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_Name,
    Email,
    Phone_no,
    State
FROM Customer;

UPDATE Customer 
SET Phone_no = CONCAT('1-', Phone_no)
WHERE State = 'California';

SELECT * FROM Customer WHERE State = 'California';

SELECT State, COUNT(*) as customer_count
FROM Customer
GROUP BY State
HAVING customer_count > 5;

SELECT State, COUNT(*) as customer_count
FROM Customer_details
GROUP BY State;

SELECT *
FROM Customer_details
ORDER BY State ASC;





