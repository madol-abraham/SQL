-- WHERE Clause
SELECT *
FROM employee_salary
WHERE
salary < 50000
;
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
;

-- And OR Not --- logical operators
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male'
;
SELECT *
FROM employee_demographics
WHERE (first_name = 'leslie' AND age = 44) OR age > 55
;
-- % and _  LIKE statement

SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%'
;
