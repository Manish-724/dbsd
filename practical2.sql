--2.	Design and develop SQL Queries – all types of joins, sub-queries and views.
-- 1️⃣ Create Database and Use It
CREATE DATABASE IF NOT EXISTS student;
USE student;

-- 2️⃣ Create Main Table
CREATE TABLE stud_tab (
  stud_id INT(4),
  stud_name VARCHAR(20),
  stud_dept VARCHAR(10),
  stud_dob DATE,
  stud_address VARCHAR(10)
);

-- 3️⃣ Insert Initial Data
INSERT INTO stud_tab VALUES
(1, 'Ram', 'Comp', '2002-11-05', 'Pune'),
(2, 'Soham', 'IT', '2002-09-03', 'Nashik'),
(3, 'Ramesh', 'Comp', '2002-03-19', 'Pune'),
(4, 'Mohan', 'AI&DS', '2002-02-22', 'Nagpur');

-- 4️⃣ Add New Column
ALTER TABLE stud_tab ADD shift VARCHAR(10);

-- 5️⃣ Update Shift Values
UPDATE stud_tab SET shift='first' WHERE stud_id=1;
UPDATE stud_tab SET shift='second' WHERE stud_id=2;
UPDATE stud_tab SET shift='first' WHERE stud_id=3;
UPDATE stud_tab SET shift='first' WHERE stud_id=4;

-- 6️⃣ Insert New Record with Shift
INSERT INTO stud_tab (stud_id, stud_name, stud_dept, stud_dob, stud_address, shift)
VALUES (5, 'Omkar', 'ENTC', '2002-06-26', 'Pune', 'second');

-- 7️⃣ Delete Record by Address
DELETE FROM stud_tab WHERE stud_address='Nagpur';

-- 8️⃣ Update ID for Omkar
UPDATE stud_tab SET stud_id=4 WHERE stud_name='Omkar';

-- 9️⃣ Filter by Date Range
SELECT * FROM stud_tab
WHERE stud_dob BETWEEN '2002-01-01' AND '2002-07-01';

-- 🔟 Add Fees Column
ALTER TABLE stud_tab ADD stud_fees INT;

-- 1️⃣1️⃣ Update Fees
UPDATE stud_tab SET stud_fees=15000 WHERE stud_id=1;
UPDATE stud_tab SET stud_fees=20000 WHERE stud_id=2;
UPDATE stud_tab SET stud_fees=20000 WHERE stud_id=3;
UPDATE stud_tab SET stud_fees=15000 WHERE stud_id=4;

-- 1️⃣2️⃣ Subquery: Max Fees
SELECT * FROM stud_tab
WHERE stud_fees = (SELECT MAX(stud_fees) FROM stud_tab);

-- 1️⃣3️⃣ Subquery: Sum of Fees
SELECT SUM(stud_fees) FROM stud_tab;

-- 1️⃣4️⃣ Create Second Table for Joins
CREATE TABLE stud_info AS
SELECT stud_id, stud_name FROM stud_tab;

-- 1️⃣5️⃣ Set Operation: UNION
SELECT stud_id FROM stud_tab
UNION
SELECT stud_id FROM stud_info;

-- 1️⃣6️⃣ INNER JOIN
SELECT s.stud_name, i.stud_id
FROM stud_tab s
INNER JOIN stud_info i ON s.stud_id = i.stud_id;

-- 1️⃣7️⃣ LEFT JOIN
SELECT s.stud_name, i.stud_id
FROM stud_tab s
LEFT JOIN stud_info i ON s.stud_id = i.stud_id;

-- 1️⃣8️⃣ RIGHT JOIN
SELECT s.stud_name, i.stud_id
FROM stud_tab s
RIGHT JOIN stud_info i ON s.stud_id = i.stud_id;

-- 1️⃣9️⃣ FULL OUTER JOIN (MySQL workaround)
SELECT s.stud_id, s.stud_name FROM stud_tab s
LEFT JOIN stud_info i ON s.stud_id = i.stud_id
UNION
SELECT i.stud_id, i.stud_name FROM stud_info i
LEFT JOIN stud_tab s ON s.stud_id = i.stud_id;

-- 2️⃣0️⃣ Subquery: Students with fees above average
SELECT * FROM stud_tab
WHERE stud_fees > (SELECT AVG(stud_fees) FROM stud_tab);

-- 2️⃣1️⃣ Subquery: Departments with more than one student
SELECT * FROM stud_tab
WHERE stud_dept IN (
  SELECT stud_dept FROM stud_tab
  GROUP BY stud_dept
  HAVING COUNT(*) > 1
);

-- 2️⃣2️⃣ Create View
CREATE VIEW stud_summary AS
SELECT stud_name, stud_dept, stud_fees
FROM stud_tab
WHERE stud_fees IS NOT NULL;

-- 2️⃣3️⃣ Query View
SELECT * FROM stud_summary;
