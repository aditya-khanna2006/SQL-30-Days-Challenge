# 📅 Day 28 – SQL JOINs Part-1

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Create tables for employees and departments
* Insert related data into multiple tables
* Understand how SQL JOINs connect tables
* Use `INNER JOIN`
* Use `LEFT JOIN`
* Use `RIGHT JOIN`
* Match records using a common column
* Understand how unmatched records are handled by different JOINs

---

# 📌 Introduction

In real-world databases, data is usually stored across multiple tables.

For example:

* Employee information can be stored in an `Employees` table.
* Department information can be stored in a `Departments` table.

Both tables can be connected using a common column such as `department_id`.

SQL JOINs allow us to combine data from multiple tables based on a related column.

### Basic Syntax

    SELECT columns
    FROM table1
    JOIN table2
    ON table1.column = table2.column;

The `ON` condition tells SQL how the two tables are related.

---

# 📌 Step 1 – Create Employees Table

We first create an `Employees3` table.

### Example

    CREATE TABLE Employees3 (
        employee_id SERIAL PRIMARY KEY,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        department_id INT
    );

### Explanation

* `employee_id` uniquely identifies each employee.
* `SERIAL` automatically generates sequential IDs.
* `first_name` stores the employee's first name.
* `last_name` stores the employee's last name.
* `department_id` identifies the employee's department.

---

# 📌 Step 2 – Insert Employee Data

Now we insert employee records.

### Example

    INSERT INTO Employees3 (first_name, last_name, department_id)
    VALUES
    ('Rahul', 'Sharma', 101),
    ('Priya', 'Mehta', 102),
    ('Ankit', 'Verma', 103),
    ('Simran', 'Kaur', NULL),
    ('Aman', 'Singh', 101);

One employee, `Simran`, does not have a department assigned, so the `department_id` is `NULL`.

---

# 📌 Step 3 – View Employees

### Example

    SELECT * FROM employees3;

This displays all employees and their department IDs.

---

# 📌 Step 4 – Create Departments Table

Now we create a separate table containing department information.

### Example

    CREATE TABLE Departments (
        department_id INT PRIMARY KEY,
        department_name VARCHAR(50)
    );

### Explanation

The `department_id` acts as the identifier for each department.

---

# 📌 Step 5 – Insert Department Data

### Example

    INSERT INTO Departments (department_id, department_name)
    VALUES
    (101, 'Sales'),
    (102, 'Marketing'),
    (103, 'IT'),
    (104, 'HR');

The department IDs connect the employee records with the department records.

---

# 📌 Step 6 – View Departments

### Example

    SELECT * FROM Departments;

This displays all departments stored in the table.

---

# 📌 Understanding the Relationship

The two tables are connected using:

    Employees3.department_id
              =
    Departments.department_id

For example:

    Rahul → 101 → Sales
    Priya → 102 → Marketing
    Ankit → 103 → IT
    Aman  → 101 → Sales

`Simran` has `NULL` as the department ID, so there is no matching department.

The `Departments` table also contains department `104 – HR`, but no employee belongs to it.

These unmatched records help us understand how different JOINs behave.

---

# 📌 Step 7 – INNER JOIN

`INNER JOIN` returns only the rows where a matching record exists in both tables.

### Example

    SELECT e.employee_id,
           e.first_name,
           e.last_name,
           d.department_id,
           d.department_name
    FROM employees3 e
    INNER JOIN departments d
        ON e.department_id = d.department_id;

### Explanation

The query matches:

    e.department_id = d.department_id

Only employees with a matching department are returned.

`Simran` is not included because her `department_id` is `NULL`.

The `HR` department is also not included because no employee has `department_id = 104`.

### Result Concept

| Employee | Department |
|---|---|
| Rahul Sharma | Sales |
| Priya Mehta | Marketing |
| Ankit Verma | IT |
| Aman Singh | Sales |

---

# 📌 Step 8 – LEFT JOIN

`LEFT JOIN` returns **all rows from the left table** and matching rows from the right table.

### Example

    SELECT e.employee_id,
           e.first_name,
           e.last_name,
           d.department_id,
           d.department_name
    FROM employees3 e
    LEFT JOIN departments d
        ON e.department_id = d.department_id;

Here:

    LEFT TABLE  → Employees3
    RIGHT TABLE → Departments

Therefore, every employee is returned.

If an employee does not have a matching department, the department columns contain `NULL`.

### Result Concept

| Employee | Department |
|---|---|
| Rahul Sharma | Sales |
| Priya Mehta | Marketing |
| Ankit Verma | IT |
| Simran Kaur | NULL |
| Aman Singh | Sales |

`Simran` appears because `LEFT JOIN` keeps all rows from `Employees3`.

---

# 📌 Step 9 – RIGHT JOIN

`RIGHT JOIN` returns **all rows from the right table** and matching rows from the left table.

### Example

    SELECT e.employee_id,
           e.first_name,
           e.last_name,
           d.department_id,
           d.department_name
    FROM employees3 e
    RIGHT JOIN departments d
        ON e.department_id = d.department_id;

Here:

    LEFT TABLE  → Employees3
    RIGHT TABLE → Departments

Therefore, every department is returned.

If a department does not have a matching employee, the employee columns contain `NULL`.

### Result Concept

| Employee | Department |
|---|---|
| Rahul Sharma | Sales |
| Aman Singh | Sales |
| Priya Mehta | Marketing |
| Ankit Verma | IT |
| NULL | HR |

`HR` appears even though no employee belongs to it.

---

# 📊 JOIN Flow

    Employees3                         Departments
    ------------                       ------------
    department_id  ←──────────────→   department_id
         |
         ↓
      JOIN
         |
         ↓
    Matching Records
         |
         ↓
    Combined Result

---

# 📊 INNER JOIN vs LEFT JOIN vs RIGHT JOIN

| JOIN Type | Returns |
|---|---|
| `INNER JOIN` | Only matching rows from both tables |
| `LEFT JOIN` | All rows from left table + matching rows from right |
| `RIGHT JOIN` | All rows from right table + matching rows from left |

---

# 📊 JOIN Example Using Current Data

### INNER JOIN

    Employees with matching departments
              ↓
    Rahul, Priya, Ankit, Aman

### LEFT JOIN

    All Employees
              ↓
    Rahul, Priya, Ankit, Simran, Aman

### RIGHT JOIN

    All Departments
              ↓
    Sales, Marketing, IT, HR

---

# 📌 Understanding Table Aliases

In the queries, we use:

    employees3 e
    departments d

Here:

* `e` is an alias for `employees3`.
* `d` is an alias for `departments`.

Instead of writing:

    employees3.first_name
    departments.department_name

we can write:

    e.first_name
    d.department_name

Aliases make JOIN queries shorter and easier to read.

---

# 📌 Understanding the ON Clause

The `ON` clause defines the relationship between the tables.

### Example

    ON e.department_id = d.department_id

SQL compares the `department_id` from both tables.

When the values match, SQL combines the corresponding rows.

---

# 💡 Best Practices

* Always identify the relationship between tables before using a JOIN.
* Use meaningful table aliases such as `e` and `d`.
* Use the `ON` clause to clearly define how tables should be joined.
* Use `INNER JOIN` when you only need matching records.
* Use `LEFT JOIN` when all records from the left table must be preserved.
* Use `RIGHT JOIN` when all records from the right table must be preserved.
* Select only the columns you actually need instead of always using `SELECT *`.
* Be careful with `NULL` values because they do not match normal values using `=`.
* Use consistent table and column naming conventions.

---

# 📝 Interview Questions

### 1. What is a JOIN in SQL?

**Answer:**  
A JOIN combines rows from two or more tables based on a related column.

---

### 2. What is an INNER JOIN?

**Answer:**  
`INNER JOIN` returns only the rows that have matching values in both tables.

---

### 3. What is a LEFT JOIN?

**Answer:**  
`LEFT JOIN` returns all rows from the left table and the matching rows from the right table. If no match exists, the right-side columns contain `NULL`.

---

### 4. What is a RIGHT JOIN?

**Answer:**  
`RIGHT JOIN` returns all rows from the right table and the matching rows from the left table. If no match exists, the left-side columns contain `NULL`.

---

### 5. What is the difference between INNER JOIN and LEFT JOIN?

**Answer:**  
`INNER JOIN` returns only matching records, while `LEFT JOIN` returns every record from the left table even when no matching record exists in the right table.

---

### 6. Why is the ON clause used?

**Answer:**  
The `ON` clause specifies the condition that determines how rows from the tables should be matched.

---

### 7. What happens to Simran in the INNER JOIN?

**Answer:**  
Simran is excluded because her `department_id` is `NULL`, so there is no matching department ID.

---

### 8. Why does HR appear in the RIGHT JOIN?

**Answer:**  
HR has `department_id = 104`, but there is no employee with that department ID. A `RIGHT JOIN` keeps all rows from the `Departments` table, so HR appears with `NULL` values for the employee columns.

---

# 🎯 Key Takeaways

* SQL JOINs are used to combine data from multiple tables.
* Tables are usually joined using related columns.
* `INNER JOIN` returns matching records only.
* `LEFT JOIN` keeps every row from the left table.
* `RIGHT JOIN` keeps every row from the right table.
* Unmatched columns are represented by `NULL`.
* Table aliases make JOIN queries easier to read.
* The `ON` clause defines the relationship between the tables.
* JOINs are essential for working with relational databases and real-world datasets.

---

# 💼 Real-World Use Case

JOINs are commonly used in business applications where information is distributed across multiple tables.

For example, an employee management system may store:

* Employee details in an `Employees` table
* Department details in a `Departments` table

Using a JOIN, we can create a report showing each employee along with their department name.

Similarly, JOINs are widely used in:

* E-commerce databases
* Employee management systems
* Banking applications
* Customer databases
* Sales reporting
* Business intelligence dashboards

---

# 📂 Practice File

`Day 28 SQL JOINs.sql`

---

# 🚀 Progress

✅ Day 28 Completed

**Next Topic ➜ Continue with the next SQL concept**
