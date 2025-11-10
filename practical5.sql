-- Step 1: Create the table
CREATE TABLE areas (
radius DECIMAL(5,2),
area DECIMAL(10,2)
);
-- Step 2: Use a stored procedure (MySQL equivalent of PL/SQL block)
DELIMITER $$
CREATE PROCEDURE calc_area()
BEGIN
DECLARE r INT DEFAULT 5;
DECLARE a DECIMAL(10,2);
WHILE r <= 9 DO
SET a = 3.14159 * r * r;
INSERT INTO areas (radius, area) VALUES (r, a);
SET r = r + 1;
END WHILE;
END$$
DELIMITER ;
-- Step 3: Execute the procedure
CALL calc_area();
-- Step 4: View the results
SELECT * FROM areas;