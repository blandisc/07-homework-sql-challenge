-- SCHEMA

-- DROP TABLE "Employees" CASCADE;
-- DROP TABLE "Dept_Manager" CASCADE;
-- DROP TABLE "Dept_Employees" CASCADE;
-- DROP TABLE "Salaries" CASCADE;
-- DROP TABLE "Titles" CASCADE;
-- DROP TABLE "Departments" CASCADE;


-- SELECT * FROM "Employees"
-- SELECT * FROM "Dept_Employees"
-- SELECT * FROM "Salaries"
-- SELECT * FROM "Titles"
-- SELECT * FROM "Departments"
-- SELECT * FROM "Dept_Manager"


CREATE TABLE "Employees" (
    "emp_no" integer   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "gender" varchar(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);


CREATE TABLE "Departments" (
    "dept_no" varchar(30)   NOT NULL,
    "dept_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_Employees" (
    "emp_no" integer   NOT NULL,
    "dept_no" varchar(30)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "Dept_Manager" (
    "dept_no" varchar(30)   NOT NULL,
    "emp_no" integer   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "Salaries" (
    "emp_no" integer   NOT NULL,
    "salary" integer   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "Titles" (
    "emp_no" integer   NOT NULL,
    "title" varchar(30)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

ALTER TABLE "Dept_Employees" ADD CONSTRAINT "fk_Dept_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Employees" ADD CONSTRAINT "fk_Dept_Employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");