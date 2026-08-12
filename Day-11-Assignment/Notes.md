# 📅 Day 11 – SQL Assignment

## 🎯 Learning Objectives

In this lesson, I practiced how to:

* Create an employees table
* Insert employee records
* Retrieve specific columns
* Update existing records
* Delete records based on conditions
* Add a new column
* Rename an existing column
* Filter records using the WHERE clause
* Change the data type of a column
* Sort records using ORDER BY
* Insert new records
* Update values using existing column values

---

# 📌 Introduction

This lesson was an **SQL assignment** based on the concepts learned in previous lessons.

The assignment used an `employees` table and covered important SQL operations such as `SELECT`, `UPDATE`, `DELETE`, `ALTER TABLE`, `WHERE`, and `ORDER BY`.

---

# 📌 Creating the Employees Table

```sql
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10, 2) CHECK (salary > 0),
    joining_date DATE NOT NULL,
    age INT CHECK (age >= 18)
);
```

The `employees` table contains employee information such as name, department, salary, joining date, and age.

---

# 📌 Inserting Employee Data

```sql
INSERT INTO employees
(first_name, last_name, department, salary, joining_date, age)
VALUES
('Amit', 'Sharma', 'IT', 60000.00, '2022-05-01', 29),
('Neha', 'Patel', 'HR', 55000.00, '2021-08-15', 32),
('Ravi', 'Kumar', 'Finance', 70000.00, '2020-03-10', 35),
('Anjali', 'Verma', 'IT', 65000.00, '2019-11-22', 28),
('Suresh', 'Reddy', 'Operations', 50000.00, '2023-01-10', 26);
```

This inserts five employee records into the table.

---

# 📌 Assignment Questions

## Q1. Retrieve all employees' first names and departments.

```sql
SELECT first_name, department
FROM employees;
```

This retrieves only the `first_name` and `department` columns.

---

## Q2. Increase the salary of all IT employees by 10%.

```sql
UPDATE employees
SET salary = salary + (salary * 0.1)
WHERE department = 'IT';
```

This increases the salary of employees belonging to the `IT` department by **10%**.

---

## Q3. Delete all employees who are older than 34 years.

```sql
DELETE FROM employees
WHERE age > 34;
```

This deletes employees whose age is greater than **34**.

---

## Q4. Add a new email column to the employees table.

```sql
ALTER TABLE employees
ADD COLUMN email VARCHAR(100);
```

This adds a new `email` column to the table.

---

## Q5. Rename the department column to dept_name.

```sql
ALTER TABLE employees
RENAME COLUMN department TO dept_name;
```

This changes the column name from `department` to `dept_name`.

---

## Q6. Retrieve employees who joined after January 1, 2021.

```sql
SELECT first_name, last_name
FROM employees
WHERE joining_date > '2021-01-01';
```

This returns the names of employees whose joining date is after **January 1, 2021**.

---

## Q7. Change the salary data type to INTEGER.

```sql
ALTER TABLE employees
ALTER COLUMN salary TYPE INTEGER;
```

This changes the data type of the `salary` column from `DECIMAL` to `INTEGER`.

---

## Q8. List employees with their age and salary in descending order of salary.

```sql
SELECT first_name, age, salary
FROM employees
ORDER BY salary DESC;
```

`DESC` sorts the employees from **highest salary to lowest salary**.

---

## Q9. Insert a new employee.

```sql
INSERT INTO employees
(first_name, last_name, dept_name, salary, joining_date, age)
VALUES
('Raj', 'Singh', 'Marketing', 60000, '2023-09-15', 30);
```

This inserts a new employee named **Raj Singh** into the `employees` table.

---

## Q10. Increase the age of every employee by 1.

```sql
UPDATE employees
SET age = age + 1;
```

This increases the age of **every employee by 1**.

---

# 📊 Assignment Flow

```text
Create Employees Table
        │
        ▼
Insert Employee Data
        │
        ▼
Retrieve Data
        │
        ▼
Update Data
        │
        ▼
Delete Data
        │
        ▼
Alter Table Structure
        │
        ▼
Sort and Filter Data
```

---

# 💡 Best Practices

* Always check your data before performing `UPDATE` or `DELETE`.
* Use the `WHERE` clause when modifying specific records.
* Use `ORDER BY` to organize query results.
* Check existing column names before using `ALTER TABLE`.
* Use appropriate data types for table columns.
* Use constraints to maintain valid data.
* Test each assignment query separately.

---

# 📝 Interview Questions

### 1. Which SQL statement is used to add a new column?

**Answer:** `ALTER TABLE ... ADD COLUMN`

### 2. How can you rename a column?

**Answer:** Using `ALTER TABLE ... RENAME COLUMN`.

### 3. How can you increase a column's value by a specific amount?

By using the existing column value in an expression.

Example:

```sql
UPDATE employees
SET age = age + 1;
```

### 4. How can records be sorted from highest to lowest?

**Answer:** Using `ORDER BY ... DESC`.

### 5. Which clause is used to filter records?

**Answer:** `WHERE`

---

# 🎯 Key Takeaways

* SQL assignments help practice multiple concepts together.
* `SELECT` retrieves required data.
* `UPDATE` modifies existing records.
* `DELETE` removes records based on conditions.
* `ALTER TABLE` modifies table structure.
* `WHERE` filters records.
* `ORDER BY DESC` sorts data in descending order.
* Column values can be updated using expressions.
* Constraints help maintain valid data.

---

# 💼 Real-World Use Case

Employee databases are commonly used by companies to manage employee information such as names, departments, salaries, joining dates, and ages.

SQL can be used to update salaries, add employee information, change database structures, retrieve employees based on conditions, and manage employee records.

---

# 📂 Practice File

```text
Day 11 SQL Assignment.sql
```

---

# 🚀 Progress

✅ Day 11 Completed

**Next Topic ➜ Continue with the next SQL concept**
