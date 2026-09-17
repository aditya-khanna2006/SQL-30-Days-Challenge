# 📅 Day 29 – Advanced SQL JOINs

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Understand `FULL OUTER JOIN`
* Understand `CROSS JOIN`
* Understand `SELF JOIN`
* Combine matching and non-matching records using `FULL OUTER JOIN`
* Generate all possible combinations using `CROSS JOIN`
* Join a table with itself using `SELF JOIN`
* Use table aliases to distinguish between multiple references to the same table
* Compare employees belonging to the same department

---

# 📌 Introduction

In the previous lesson, I learned about `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN`.

In this lesson, I explored some additional JOIN types:

* `FULL OUTER JOIN`
* `CROSS JOIN`
* `SELF JOIN`

These JOINs are useful for different analytical and business requirements.

---

# 📌 Step 1 – View the Employees Table

We first check the employee data.

### Example

    SELECT * FROM employees3;

---

# 📌 Step 2 – View the Departments Table

We also check the department data.

### Example

    SELECT * FROM Departments;

Our tables contain employees and departments that can be related using `department_id`.

---

# 📌 FULL OUTER JOIN

A `FULL OUTER JOIN` returns:

* All matching rows
* All unmatched rows from the left table
* All unmatched rows from the right table

If there is no matching record, SQL returns `NULL` for the columns from the table where the match is missing.

### Example

    SELECT e.employee_id,
           e.first_name,
           e.last_name,
           d.department_id,
           d.department_name
    FROM employees3 e
    FULL OUTER JOIN departments d
        ON e.department_id = d.department_id;

---

# 📌 Understanding FULL OUTER JOIN

In our data:

* `Simran` has no department because her `department_id` is `NULL`.
* `HR` has no employee because its `department_id` is `104`.

A `FULL OUTER JOIN` keeps both of these unmatched records.

### Result Concept

| Employee | Department |
|---|---|
| Rahul Sharma | Sales |
| Priya Mehta | Marketing |
| Ankit Verma | IT |
| Aman Singh | Sales |
| Simran Kaur | NULL |
| NULL | HR |

Therefore, no row from either table is lost.

---

# 📊 FULL OUTER JOIN Flow

    Employees3                 Departments
        |                           |
        |                           |
        +---------- JOIN -----------+
                    |
                    ↓
          Matching + Unmatched
             Records from
             Both Tables
                    |
                    ↓
              Final Result

---

# 📌 FULL OUTER JOIN vs Other JOINs

| JOIN Type | Records Returned |
|---|---|
| `INNER JOIN` | Matching records only |
| `LEFT JOIN` | All left records + matching right records |
| `RIGHT JOIN` | All right records + matching left records |
| `FULL OUTER JOIN` | All records from both tables |

---

# 📌 CROSS JOIN

A `CROSS JOIN` produces every possible combination of rows between two tables.

It is also called a **Cartesian Product**.

### Example

    SELECT e.first_name,
           e.last_name,
           d.department_name
    FROM Employees3 e
    CROSS JOIN Departments d;

### Explanation

Every employee is combined with every department.

If:

    Employees = 5 rows
    Departments = 4 rows

Then:

    5 × 4 = 20 rows

will be generated.

---

# 📊 CROSS JOIN Example

Suppose we have:

### Employees

| Employee |
|---|
| Rahul |
| Priya |
| Ankit |
| Simran |
| Aman |

### Departments

| Department |
|---|
| Sales |
| Marketing |
| IT |
| HR |

The `CROSS JOIN` produces combinations such as:

| Employee | Department |
|---|---|
| Rahul | Sales |
| Rahul | Marketing |
| Rahul | IT |
| Rahul | HR |
| Priya | Sales |
| Priya | Marketing |
| Priya | IT |
| Priya | HR |
| ... | ... |

Every employee is paired with every department.

---

# 📌 When is CROSS JOIN Useful?

`CROSS JOIN` can be useful when we intentionally need every possible combination.

Examples include:

* Creating product and size combinations
* Generating employee and shift combinations
* Creating date and category combinations
* Testing possible combinations
* Generating scenarios for analysis

However, a `CROSS JOIN` can produce a very large number of rows, so it should be used carefully.

---

# 📌 SELF JOIN

A `SELF JOIN` means joining a table with itself.

SQL does not have a separate `SELF JOIN` keyword.

Instead, we use a normal `JOIN` and reference the same table using different aliases.

### Example

    SELECT e1.first_name AS employee_name1,
           e2.first_name AS employee_name2,
           d.department_name
    FROM employees3 e1
    JOIN employees3 e2
        ON e1.department_id = e2.department_id
        AND e1.employee_id <> e2.employee_id
    JOIN departments d
        ON e1.department_id = d.department_id;

---

# 📌 Understanding SELF JOIN

Here we use the same `employees3` table twice:

    employees3 e1
    employees3 e2

The aliases allow SQL to treat the two references as separate instances.

The query compares employees with each other.

### Main Condition

    e1.department_id = e2.department_id

This means both employees must belong to the same department.

### Second Condition

    e1.employee_id <> e2.employee_id

This prevents an employee from being matched with themselves.

---

# 📊 SELF JOIN Example

Suppose the Sales department contains:

    Rahul
    Aman

The SELF JOIN can produce:

| Employee 1 | Employee 2 | Department |
|---|---|---|
| Rahul | Aman | Sales |
| Aman | Rahul | Sales |

Both employees belong to the same department, but they have different employee IDs.

---

# 📌 Why Are Table Aliases Important in SELF JOIN?

When the same table is used more than once, aliases help us identify which reference we are using.

For example:

    e1.first_name

means the employee from the first reference.

While:

    e2.first_name

means the employee from the second reference.

Without aliases, it would be difficult for SQL to distinguish between the two references.

---

# 📌 Understanding `<>`

The operator:

    <>

means **not equal to**.

In the SELF JOIN:

    e1.employee_id <> e2.employee_id

ensures that an employee is not paired with themselves.

For example:

    Rahul ID = 1
    Rahul ID = 1

This combination is excluded because:

    1 <> 1

is false.

---

# 📊 Advanced JOIN Flow

    FULL OUTER JOIN
          |
          ↓
    Matching + Unmatched
    rows from both tables


    CROSS JOIN
          |
          ↓
    Every row × Every row
          |
          ↓
    Cartesian Product


    SELF JOIN
          |
          ↓
    Same table used twice
          |
          ↓
    Compare rows within
    the same table

---

# 📊 Advanced JOIN Summary

| JOIN | Main Purpose |
|---|---|
| `FULL OUTER JOIN` | Returns all records from both tables |
| `CROSS JOIN` | Returns every possible combination |
| `SELF JOIN` | Compares rows within the same table |

---

# 💡 Best Practices

* Use `FULL OUTER JOIN` when unmatched records from both tables are important.
* Use `CROSS JOIN` only when all possible combinations are actually required.
* Be careful with `CROSS JOIN` because the number of rows can grow very quickly.
* Use aliases when joining a table to itself.
* Use conditions such as `employee_id <> employee_id` carefully to avoid self-matching.
* Clearly define the relationship between tables using the `ON` clause.
* Select only the columns needed for the analysis.
* Check the expected number of rows before running a large `CROSS JOIN`.

---

# 📝 Interview Questions

### 1. What is a FULL OUTER JOIN?

**Answer:**  
A `FULL OUTER JOIN` returns all matching and non-matching records from both tables. Unmatched columns contain `NULL`.

---

### 2. What is the difference between LEFT JOIN and FULL OUTER JOIN?

**Answer:**  
`LEFT JOIN` keeps all rows from the left table and matching rows from the right table. `FULL OUTER JOIN` keeps all rows from both tables.

---

### 3. What is a CROSS JOIN?

**Answer:**  
A `CROSS JOIN` returns every possible combination of rows from the two tables.

---

### 4. If one table has 5 rows and another has 4 rows, how many rows can a CROSS JOIN produce?

**Answer:**  

    5 × 4 = 20 rows

So, the result can contain 20 combinations.

---

### 5. What is a SELF JOIN?

**Answer:**  
A `SELF JOIN` is when a table is joined with itself to compare or relate rows within the same table.

---

### 6. Does SQL have a separate SELF JOIN keyword?

**Answer:**  
No. A SELF JOIN is created using a normal `JOIN` while referencing the same table with different aliases.

---

### 7. Why are aliases used in a SELF JOIN?

**Answer:**  
Aliases allow us to distinguish between the different references to the same table.

For example:

    employees3 e1
    employees3 e2

---

### 8. What does `<>` mean in SQL?

**Answer:**  
`<>` means "not equal to."

---

# 🎯 Key Takeaways

* `FULL OUTER JOIN` returns all records from both tables.
* Unmatched records contain `NULL` values for the missing side.
* `CROSS JOIN` generates every possible combination of rows.
* The number of rows in a CROSS JOIN can become very large.
* `SELF JOIN` allows us to compare rows within the same table.
* Table aliases are essential when using a SELF JOIN.
* `<>` is used to exclude matching values.
* Different JOIN types solve different data analysis problems.

---

# 💼 Real-World Use Case

Advanced JOINs are useful in many real-world data analysis scenarios.

### FULL OUTER JOIN

Can be used to compare two datasets and identify:

* Records that exist in both datasets
* Records missing from one dataset
* Differences between two systems

### CROSS JOIN

Can be used to generate possible combinations, such as:

* Products × Sizes
* Employees × Shifts
* Customers × Available Plans

### SELF JOIN

Can be used to compare records within the same table.

For example, an employee database can use a SELF JOIN to find employees who belong to the same department.

---

# 📂 Practice File

`Day 29 Advanced JOINs.sql`

---

# 🚀 Progress

✅ Day 29 Completed

**Next Topic ➜ Continue with the final SQL concept**
