CREATE DATABASE library;
USE library;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(100),
    Contact_no VARCHAR(15)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(100),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10,2),
    Status VARCHAR(3),
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(100),
    Reg_date DATE
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VAlUES
(1, 101, 'Mavelikara, Alappuzha', '1234567890'),
(2, 102, 'Kakkanad, Ernakulam', '2345678901');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)VALUES
(1, 'Krishna', 'Manager', 60000.00, 1),
(2, 'Nikhil', 'Librarian', 45000.00, 1),
(3, 'Amala', 'Manager', 65000.00, 2),
(4, 'Milha', 'Assistant', 35000.00, 2);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)VALUES
('9780001234567', 'World History', 'History', 30.00, 'yes', 'John Smith', 'ABC Publishers'),
('9780001234568', 'Advanced Mathematics', 'Education', 25.00, 'yes', 'Mary Johnson', 'XYZ Books'),
('9780001234569', 'The Art of War', 'History', 20.00, 'no', 'Sun Tzu', 'Classic Books'),
('9780001234570', 'Modern Physics', 'Science', 35.00, 'yes', 'Robert Wilson', 'Science Press');

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'Alice ', 'Mavelikara, Alappuzha', '2021-06-15'),
(2, 'Bibin', 'Pala, Kottayam', '2022-03-20'),
(3, 'Carol Martinez', 'Aluva, Ernakulam', '2021-12-28'),
(4, 'David Anderson', 'Guruvayoor, Trissur', '2023-01-10');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES 
(1, 1, 'World History', '2023-06-15', '9780001234567'),
(2, 2, 'Advanced Mathematics', '2023-06-20', '9780001234568');

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(1, 1, 'World History', '2023-06-30', '9780001234567'),
(2, 2, 'Advanced Mathematics', '2023-07-05', '9780001234568');

-- 1. Retrieve available books
 
SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'yes';

-- 2. List employees by salary
SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;

-- 3. Books and their issuers
SELECT b.Book_title, c.Customer_name
FROM Books b
JOIN IssueStatus i ON b.ISBN = i.Isbn_book
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

-- 4. Count of books by category
SELECT Category, COUNT(*) as total_books
FROM Books
GROUP BY Category;

-- 5. Employees with salary > 50000
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

-- 6. Customers registered before 2022 with no issues
SELECT c.Customer_name
FROM Customer c
LEFT JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE c.Reg_date < '2022-01-01' AND i.Issue_Id IS NULL;

-- 7. Employee count by branch
SELECT Branch_no, COUNT(*) as employee_count
FROM Employee
GROUP BY Branch_no;

-- 8. Customers who issued books in June 2023
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE MONTH(i.Issue_date) = 6 AND YEAR(i.Issue_date) = 2023;

-- 9. History books
SELECT Book_title
FROM Books
WHERE Category = 'History';

-- 10. Branches with more than 5 employees
SELECT e.Branch_no, COUNT(*) as employee_count
FROM Employee e
GROUP BY e.Branch_no
HAVING COUNT(*) > 5;

-- 11. Branch managers and addresses
SELECT e.Emp_name, b.Branch_address
FROM Employee e
JOIN Branch b ON e.Branch_no = b.Branch_no
WHERE e.Position = 'Manager';

-- 12. Customers who issued expensive books
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
JOIN Books b ON i.Isbn_book = b.ISBN
WHERE b.Rental_Price > 25;










