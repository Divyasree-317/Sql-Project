CREATE DATABASE CountryPersons;
USE CountryPersons;

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population BIGINT,
    Area FLOAT
);

DESC Country;

INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9833520),
(2, 'Canada', 38000000, 9984670),
(3, 'UK', 67000000, 243610),
(4, 'India', 1380000000, 3287263),
(5, 'Australia', 25600000, 7692024),
(6, 'Germany', 83000000, 357022),
(7, 'France', 67000000, 551695),
(8, 'Brazil', 213000000, 8515767),
(9, 'Russia', 144000000, 17098246),
(10, 'Japan', 126000000, 377975);

SELECT * FROM Country;

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(100),
    Lname VARCHAR(100),
    Population BIGINT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(100)
);

DESC Persons;

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 331000000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 38000000, 3.8, 2, 'Canada'),
(3, 'Alice', 'Brown', 67000000, 4.2, 3, 'UK'),
(4, 'Ravi', 'Kumar', 1380000000, 4.6, 4, 'India'),
(5, 'Anu', 'Johnson', 25600000, 4.1, 5, 'Australia'),
(6, 'Hansu', 'Müller', 83000000, 3.9, 6, 'Germany'),
(7, 'Sanu', 'Dubois', 67000000, 4.0, 7, 'France'),
(8, 'Christy', 'Silva', 213000000, 4.7, 8, 'Brazil'),
(9, 'Ivan', 'Petrov', 144000000, 4.3, 9, 'Russia'),
(10, 'Bobby', 'Tanaka', 126000000, 4.8, 10, 'Japan');

SELECT * FROM Persons;

SELECT p.Id AS Person_Id, p.Fname, p.Lname, c.Country_name, c.Population, c.Area
FROM Persons p
INNER JOIN Country c ON p.Country_Id = c.Id;

SELECT p.Id AS Person_Id, p.Fname, p.Lname, c.Country_name, c.Population, c.Area
FROM Persons p
LEFT JOIN Country c ON p.Country_Id = c.Id;

SELECT p.Id AS Person_Id, p.Fname, p.Lname, c.Country_name, c.Population, c.Area
FROM Persons p
RIGHT JOIN Country c ON p.Country_Id = c.Id;

SELECT DISTINCT Country_name
FROM (
    SELECT Country_name FROM Country
    UNION
    SELECT Country_name FROM Persons
) AS Combined_Countries;

SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

SELECT Id, Fname, Lname, Population, ROUND(Rating) AS Rounded_Rating, Country_Id, Country_name
FROM Persons;
























