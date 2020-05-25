-- Queries
-- List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.

SELECT 
"Employees"."emp_no" AS "Employee_number",
"Employees"."last_name" AS "Last_name",
"Employees"."first_name" AS "First_name",
"Employees"."gender"  AS "Gender",
"Salaries"."salary" AS "Salary"
FROM "Employees"
LEFT JOIN "Salaries" ON "Employees"."emp_no" = "Salaries"."emp_no";

-- List employees who were hired in 1986.

SELECT
"emp_no" AS "Employee Number",
"last_name" AS "Last Name",
"first_name" AS "First Name"
FROM "Employees"
WHERE EXTRACT(YEAR FROM "hire_date") = 1986;

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.

SELECT
"Departments"."dept_no" AS "Departament Number",
"Departments"."dept_name" AS "Departament Name",
"Dept_Manager"."emp_no" AS "Employee Number",
"Employees"."last_name" AS "Last Name",
"Employees"."first_name" AS "First Name",
"Dept_Manager"."from_date" AS "Start of Employment",
"Dept_Manager"."to_date" AS "End of Employment"

FROM (("Dept_Manager"
LEFT JOIN "Departments" ON "Dept_Manager"."dept_no" = "Departments"."dept_no")
LEFT JOIN "Employees" ON "Dept_Manager"."emp_no" = "Employees"."emp_no");

-- List the department of each employee with the following information:
-- employee number, last name, first name, and department name.

SELECT
"Employees"."emp_no" AS "Employee Number",
"Employees"."last_name" AS "Last Name",
"Employees"."first_name" AS "First Name",
"Departments"."dept_name" AS "Departament Name"

FROM (("Employees"
LEFT JOIN "Dept_Employees" ON "Employees"."emp_no" = "Dept_Employees"."emp_no")
LEFT JOIN "Departments" ON "Dept_Employees"."dept_no" = "Departments"."dept_no");

-- List all employees whose first name is "Hercules" and last names begin with "B."

SELECT
"emp_no" AS "Employee Number",
"last_name" AS "Last Name",
"first_name" AS "First Name"
FROM "Employees"
WHERE "first_name" = 'Hercules' AND "last_name"  LIKE 'B%';

-- List all employees in the Sales department,
-- including their employee number, last name, first name, and department name.

SELECT
"Employees"."emp_no" AS "Employee Number",
"Employees"."last_name" AS "Last Name",
"Employees"."first_name" AS "First Name",
"Departments"."dept_name" AS "Departament Name"

FROM (("Employees"
LEFT JOIN "Dept_Employees" ON "Employees"."emp_no" = "Dept_Employees"."emp_no")
LEFT JOIN "Departments" ON "Dept_Employees"."dept_no" = "Departments"."dept_no")
WHERE "dept_name" = 'Sales';

-- List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.

SELECT
"Employees"."emp_no" AS "Employee Number",
"Employees"."last_name" AS "Last Name",
"Employees"."first_name" AS "First Name",
"Departments"."dept_name" AS "Departament Name"

FROM (("Employees"
LEFT JOIN "Dept_Employees" ON "Employees"."emp_no" = "Dept_Employees"."emp_no")
LEFT JOIN "Departments" ON "Dept_Employees"."dept_no" = "Departments"."dept_no")
WHERE "dept_name" = 'Sales' OR "dept_name" = 'Development';

-- In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.

SELECT "last_name", COUNT(*)
FROM "Employees"
GROUP BY "last_name"
ORDER BY 2 DESC;

