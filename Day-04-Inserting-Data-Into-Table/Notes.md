# 📅 Day 4 – Inserting Data into a Table

## 🎯 Learning Objectives

In this lesson, I learned how to:

- Insert records into a table
- Use the `INSERT INTO` statement
- Insert single and multiple rows
- Follow the correct order of columns and values
- Verify inserted data using the `SELECT` statement

---

# 📌 Introduction

After creating a database and table, the next step is to store data.

SQL provides the **INSERT INTO** statement to add new records to a table.

Every record inserted becomes a new row in the table.

---

# 📌 INSERT INTO Statement

The `INSERT INTO` command is used to insert data into an existing table.

## Syntax

```sql
INSERT INTO table_name (column1, column2, column3)
VALUES (value1, value2, value3);
```

---

# 📌 Inserting a Single Record

### Example

```sql
INSERT INTO employee
(name, position, department, hire_date, salary)
VALUES
('Aditya Khanna', 'Data Analyst', 'Data Science', '2025-07-11', 50000);
```

This command inserts one employee record into the table.

---

# 📌 Inserting Multiple Records

SQL allows multiple rows to be inserted using a single statement.

### Example

```sql
INSERT INTO employee
(name, position, department, hire_date, salary)
VALUES
('Amit Sharma', 'Data Analyst', 'Data Science', '2022-05-15', 65000),
('Priya Desai', 'Software Engineer', 'IT', '2021-09-20', 75000),
('Rajesh Kumar', 'HR Manager', 'Human Resources', '2019-03-10', 82000);
```

Using one query to insert multiple records is faster and improves efficiency.

---

# 📌 Viewing Inserted Data

After inserting records, use the `SELECT` statement to verify the data.

```sql
SELECT *
FROM employee;
```

This displays all rows stored in the table.

---

# 📊 Data Flow

```
INSERT INTO
      │
      ▼
Database Table
      │
      ▼
New Row Added
      │
      ▼
SELECT * FROM employee;
```

---

# 📌 Rules for INSERT INTO

✔ Values must follow the same order as the columns.

✔ Data types should match the column definition.

✔ Mandatory columns should not contain NULL values (unless allowed).

✔ String values should be enclosed in single quotes (`' '`).

✔ Date values should follow the correct format (`YYYY-MM-DD`).

---

# 📌 Example Table

| Employee ID | Name | Position | Department | Salary |
|-------------|------|----------|------------|--------:|
| 1 | Amit Sharma | Data Analyst | Data Science | 65000 |
| 2 | Priya Desai | Software Engineer | IT | 75000 |
| 3 | Rajesh Kumar | HR Manager | Human Resources | 82000 |

---

# 💡 Best Practices

✅ Specify column names while inserting data.

✅ Insert multiple rows in one query whenever possible.

✅ Verify inserted data using `SELECT`.

✅ Ensure the values match the correct data types.

✅ Double-check date formats before execution.

---

# 📝 Interview Questions

### 1. Which SQL command is used to insert data into a table?

**Answer:** `INSERT INTO`

---

### 2. Can multiple records be inserted using one query?

**Answer:** Yes. Multiple rows can be inserted by separating each record with commas in the `VALUES` clause.

---

### 3. Why should we specify column names?

**Answer:** It improves readability, avoids errors, and ensures values are inserted into the correct columns.

---

### 4. How can we verify that data has been inserted successfully?

**Answer:** By executing:

```sql
SELECT * FROM employee;
```

---

# 🎯 Key Takeaways

- `INSERT INTO` is used to add records to a table.
- Data can be inserted as a single row or multiple rows.
- Always follow the correct column order and data types.
- Use `SELECT` to confirm successful insertion.
- Writing clean and accurate INSERT queries helps maintain data integrity.

---

# 📂 Practice File

The SQL code for this lesson is available in:

```
Day 4 Insert Data into table.sql
```

---

# 🚀 Progress

✅ Day 4 Completed

**Next Topic ➜ Retrieving Data Using the SELECT Statement**
