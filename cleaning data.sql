-- joins --
SELECT *
FROM employee_demographics
;
SELECT *
FROM employee_salary
;

SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
       ON dem.employee_id = sal.employee_id;
       
-- outer Joins --
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
       ON dem.employee_id = sal.employee_id
       ;
SELECT emp1.employee_id As emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id As emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
   ON emp1.employee_id + 1 = emp2.employee_id;
   
-- Joining Multiple Tables Together --
   

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
       ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd
       ON sal.dept_id = pd.department_id;
       
SELECT *
FROM parks_departments;

-- Union --
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;


SELECT first_name, last_name, 'Old man' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'male'
UNION
SELECT first_name, last_name, 'Old lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'female'
UNION
SELECT first_name, last_name, 'Highly paid employee' AS Label
FROM employee_salary
WHERE salary > 70000 
ORDER BY first_name, last_name
;


-- String function --
SELECT LENGTH('skyfall');
SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2
;
SELECT UPPER('sky');
SELECT LOWER('sky');
SELECT TRIM('        sky       ');

SELECT first_name,  
LEFT(first_name, 4),
RIGHT(first_name, 4),
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2) AS birth_month
FROM employee_demographics;

SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;

SELECT LOCATE('X', 'Alexander');

SELECT first_name, last_name,
CONCAt(first_name, '' ,last_name) AS fullname
FROM employee_demographics;

-- case statement --
SELECT 
first_name,
last_name,
CASE
     WHEN age<=30 THEN 'YOUNG'
     WHEN age BETWEEN 31 and 50 THEN 'old'
     WHEN age >= 50 THEN 'on death door'
     END
FROM employee_demographics;

-- payb increase and bonus ---
SELECT first_name, last_name, salary,
CASE
    WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END AS new_salry,

CASE
   WHEN  dept_id = 6 THEN salary *.10
END AS Bonus
FROM employee_salary;

SELECT *
FROM employee_demographics;
SELECT *
FROM parks_departments;

-- subqueries
SELECT *
FROM employee_demographics
WHERE employee_id IN
                ( SELECT employee_id
				     FROM employee_salary
					WHERE dept_id = 1)
                    
;

SELECT first_name, salary,
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary
GROUP BY first_name, salary
;
-- CTES --
select gender, AVG('Max(age)')
FROM
(SELECT gender, AVG(age), MAX(age), MIN(age), Count(age)
FROM employee_demographics
GROUP BY gender) AS age_Table
GROUP BY gender

;

