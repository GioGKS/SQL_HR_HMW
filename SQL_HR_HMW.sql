USE [HR]

-- Exc.1
SELECT first_name, last_name, employees.department_id, department_name
FROM employees
JOIN departments
ON employees.department_id=departments.department_id

-- Exc.2
SELECT e.first_name, e.last_name,
    l.city, l.state_province,
    d.department_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l 
ON d.location_id = l.location_id

-- Exc.3
SELECT e.first_name, e.last_name,
    e.salary, j.job_title 
FROM employees e
JOIN jobs j
ON e.salary BETWEEN j.min_salary AND J.max_salary

-- Exc.4
SELECT e.first_name, e.last_name,
d.department_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id 
WHERE e.department_id IN (80, 40)

-- Exc.5
SELECT E.first_name, E.last_name,
D.department_name, L.city, L.state_province
FROM employees E
JOIN departments D
ON E.department_id = D.department_id
JOIN locations L
ON D.location_id = L.location_id
WHERE E.first_name LIKE 'z%'

-- Exc.6
SELECT E.first_name, E.last_name, D.department_id, D.department_name
FROM employees E
JOIN departments D
ON E.department_id = D.department_id OR E.department_id != D.department_id

-- Exc.7
SELECT E.first_name, E.last_name, E.salary
FROM employees E
JOIN employees E2
ON E.salary < E2.salary
AND E2.employee_id = 182

-- Exc.8
SELECT E.first_name AS "Employee",
 M.first_name AS "Manager"
FROM employees E
JOIN employees M
ON E.manager_id = M.employee_id

-- Exc.9
SELECT D.department_name AS "Department Name",
L.city AS "City",
L.state_province AS "State Province"
FROM departments D
JOIN locations L
ON D.location_id = L.location_id

--Exc.10
SELECT E.first_name AS "First Name",
E.last_name AS "Last Name",
D.department_id AS "Department ID",
D.department_name AS "Department NAME"
FROM employees E
JOIN departments D
ON E.department_id = D.department_id

-- Exc.11
SELECT E.first_name AS "Employee",
M.first_name AS "Manager"
FROM employees E
LEFT OUTER JOIN employees M
ON E.manager_id = M.employee_id

-- Exc.12
SELECT E.first_name, E.last_name, E.department_id
FROM employees E
LEFT JOIN departments D
ON E.department_id = D.department_id
AND E.last_name = 'Taylor'

-- Exc.13
SELECT J.job_title AS "Job Title",
       D.department_name AS "Department Name",
       E.first_name AS "Employee First Name",
       E.last_name AS "Employee Last Name",
       E.hire_date AS "Start Date"
FROM job_history JH
JOIN jobs J
JOIN departments D
JOIN employees E
ON JH.job_id = J.job_id
ON JH.department_id = D.department_id 
ON JH.employee_id = E.employee_id
WHERE E.hire_date = '1993-01-01' AND E.hire_date <= '1997-08-31'


-- Exc.14
SELECT J.job_title AS "Job Title",
       E.first_name AS "Employee First Name",
       E.last_name  AS "Employee Last Name",
       max_salary-E.salary AS "Salary Difference" 
FROM employees E
JOIN jobs J
ON E.salary BETWEEN J.min_salary AND J.max_salary
ORDER BY [Salary Difference] DESC

-- Exc.15
SELECT D.department_name AS "Department Name", 
       AVG(E.salary) AS "Average Salary",
       COUNT(e.employee_id) AS "Count"
FROM departments D
JOIN employees E
ON D.department_id = E.department_id
GROUP BY department_name   
ORDER BY [Count] DESC

