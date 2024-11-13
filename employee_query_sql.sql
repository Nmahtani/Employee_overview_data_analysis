CREATE DATABASE employees_project;
USE employees_project;

-- First step is to join to Get Full Employee Details. In this case "e" refers to the table "employee_work_data" and "i" refers to table "employee_info".

SELECT e.Employee_ID, i.Name, e.Date, e.Work_Hours, e.Tasks_Completed, e.Department
FROM employee_work_data e
JOIN employee_info i 
ON e.Employee_ID = i.Employee_ID;

-- Lets calculate the total work hours by department.

SELECT i.Department, SUM(e.Work_Hours) AS Total_Hours
FROM employee_work_data e
JOIN employee_info i 
ON e.Employee_ID = i.Employee_ID
GROUP BY i.Department;

-- Next thing to do is calculate the number of absences to see how many times employees where abscent.

SELECT COUNT(*) AS Total_Absences
FROM employee_work_data
WHERE Absences = 'Yes';

-- Now lets try a left join to list all employees and include work data even if they don't have a work record.

SELECT i.Employee_ID, i.Name, i.Department, e.Date, e.Work_Hours
FROM employee_info i
LEFT JOIN employee_work_data e 
ON i.Employee_ID = e.Employee_ID;

-- This time I use a right join to include all work records and match with employee details.

SELECT e.Employee_ID, i.Name, e.Date, e.Work_Hours, e.Tasks_Completed
FROM employee_work_data e
RIGHT JOIN employee_info i 
ON e.Employee_ID = i.Employee_ID;

