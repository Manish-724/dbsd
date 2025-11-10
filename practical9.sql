-- 1️⃣ Create Database and Table
CREATE DATABASE IF NOT EXISTS studentDB;
USE studentDB;

CREATE TABLE IF NOT EXISTS students (
  student_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  age INT,
  course VARCHAR(100)
);

-- 2️⃣ Insert Records (Create Operation)
INSERT INTO students (student_id, name, email, age, course)
VALUES 
  (1, 'Shreya', 'shreya@example.com', 20, 'Computer Science');

INSERT INTO students (student_id, name, email, age, course)
VALUES 
  (2, 'Rahul', 'rahul@example.com', 21, 'Mathematics'),
  (3, 'Anita', 'anita@example.com', 22, 'Physics');

-- 3️⃣ Read Operation
SELECT * FROM students WHERE name = 'Shreya';

-- 4️⃣ Update Operation
UPDATE students
SET course = 'Advanced Studies'
WHERE age > 21;

-- 5️⃣ Delete Operation
DELETE FROM students
WHERE student_id = 2;