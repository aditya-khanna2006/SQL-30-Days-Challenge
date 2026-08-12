# 📅 Day 12 – Import CSV File in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Create a table for CSV data
* Understand the structure of a CSV file
* Import CSV data into PostgreSQL
* Use the COPY command
* Use `DELIMITER` while importing CSV data
* Use `CSV HEADER` when the first row contains column names
* Verify imported data using SELECT

---

# 📌 Introduction

CSV stands for **Comma-Separated Values**.

CSV files are commonly used to store tabular data such as employee records, customer information, product details, and other structured data.

PostgreSQL provides the `COPY` command to import data from a CSV file directly into a table.

---

# 📌 Creating the Employee Table

Before importing the CSV file, a table must be created with columns that match the data in the CSV file.

```sql
CREATE TABLE employee2 (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email VARCHAR(50),
    department VARCHAR(20),
    salary NUMERIC(10,2),
    joining_date DATE,
    age INT
);
```

This creates an `employee2` table to store employee data.

---

# 📌 Viewing the Table

To check the table data:

```sql
SELECT * FROM employee2;
```

Initially, the table will be empty because the CSV data has not been imported yet.

---

# 📌 Importing CSV Data Using COPY

The `COPY` command is used to import data from a CSV file into a PostgreSQL table.

### Syntax

```sql
COPY table_name
(column1, column2, column3)
FROM 'file_path'
DELIMITER ','
CSV HEADER;
```

---

# 📌 Example

```sql
COPY employee2(
    employee_id,
    first_name,
    last_name,
    email,
    department,
    salary,
    joining_date,
    age
)
FROM 'D:\Course Updates\30 Day Series\SQL\CSV\employee_data.csv'
DELIMITER ','
CSV HEADER;
```

This imports the employee data from the CSV file into the `employee2` table.

---

# 📌 Understanding COPY Options

### `COPY`

Used to transfer data between a PostgreSQL table and a file.

### `FROM`

Specifies the location of the file from which data should be imported.

### `DELIMITER ','`

Specifies that values in the CSV file are separated by commas.

### `CSV HEADER`

Indicates that the first row of the CSV file contains column names.

---

# 📌 Verifying Imported Data

After importing the CSV file, we can use:

```sql
SELECT * FROM employee2;
```

This displays the employee records imported from the CSV file.

---

# 📊 CSV Import Flow

```text
CSV File
   │
   ▼
COPY Command
   │
   ▼
PostgreSQL Table
   │
   ▼
SELECT *
   │
   ▼
Imported Data
```

---

# ⚠️ Important Points

* The CSV columns should match the table columns being imported.
* Make sure the file path is correct.
* The delimiter should match the format of the CSV file.
* Use `CSV HEADER` when the first row contains column names.
* The data types in the CSV should be compatible with the table columns.
* The PostgreSQL process must be able to access the specified file when using server-side `COPY`.

---

# 💡 Best Practices

* Check the CSV file before importing it.
* Make sure column names and data types match.
* Verify the imported data using `SELECT`.
* Keep a backup of important data before performing large imports.
* Use the correct delimiter for the CSV file.
* Check for duplicate primary key values before importing.

---

# 📝 Interview Questions

### 1. What is a CSV file?

CSV stands for **Comma-Separated Values** and is commonly used to store tabular data.

### 2. Which PostgreSQL command can be used to import CSV data?

**Answer:** `COPY`

### 3. What is the purpose of `CSV HEADER`?

It tells PostgreSQL that the first row of the CSV file contains column names.

### 4. What is the purpose of `DELIMITER ','`?

It specifies that values in the file are separated by commas.

### 5. How can you verify that CSV data was imported successfully?

By using:

```sql
SELECT * FROM employee2;
```

---

# 🎯 Key Takeaways

* CSV files are commonly used to store structured data.
* PostgreSQL provides the `COPY` command for importing file data.
* The target table should have compatible columns and data types.
* `DELIMITER` defines how values are separated.
* `CSV HEADER` tells PostgreSQL that the first row contains column names.
* `SELECT` can be used to verify imported data.

---

# 💼 Real-World Use Case

Companies often receive employee, customer, sales, or product data in CSV format.

Instead of manually inserting thousands of records, the CSV file can be imported directly into a PostgreSQL table using the `COPY` command.

---

# 📂 Practice File

```text
Day 12 Import CSV File in SQL.sql
```

---

# 🚀 Progress

✅ Day 12 Completed

**Next Topic ➜ Continue with the next SQL concept**
