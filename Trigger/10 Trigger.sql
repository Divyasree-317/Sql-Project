Create Database teacher;
Use teacher;


CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10,2)
);


CREATE TABLE teacher_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT,
    action VARCHAR(50),
    timestamp TIMESTAMP
);


INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'John ', 'Mathematics', 5, 55000.00),
(2, 'Anu', 'Science', 12, 68000.00),
(3, 'Milha', 'English', 8, 62000.00),
(4, 'Divya', 'History', 3, 48000.00),
(5, 'Dhanya', 'Computer Science', 15, 75000.00);

DELIMITER //
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'salary cannot be negative';
    END IF;
END;//
DELIMITER ;

DELIMITER //
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END;//
DELIMITER ;


DELIMITER //
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete teacher with more than 10 years of experience';
    END IF;
END;//
DELIMITER ;


DELIMITER //
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END;//
DELIMITER ;