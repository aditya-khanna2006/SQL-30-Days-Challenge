# 📅 Day 13 – Directly Import CSV in PostgreSQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Import a CSV file directly using pgAdmin
* Use the Import/Export Data option
* Select a CSV file for importing
* Configure CSV format and delimiter
* Use the Header option
* Match CSV columns with table columns
* Verify imported data using SELECT

---

# 📌 Introduction

PostgreSQL provides a convenient way to import CSV files directly through **pgAdmin**.

Instead of writing the `COPY` command manually, we can use the **Import/Export Data** option available on a table.

This is useful when we want to import CSV data using the graphical interface of pgAdmin.

---

# 📌 Creating the Employee Table

Before importing the CSV file, we need a table where the data will be stored.

```sql
CREATE TABLE employee3 (
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

This creates the `employee3` table for storing employee data.

---

# 📌 Direct CSV Import Using pgAdmin

The CSV file can be imported directly through the pgAdmin interface.

### Steps

1. Open **pgAdmin**.
2. Expand:

   ```text
   Servers → PostgreSQL → Databases → your_database
   ```
3. Go to:

   ```text
   Schemas → public → Tables
   ```
4. Right-click the table where you want to import the CSV.
5. Select **Import/Export Data...**
6. In the Import/Export Data window:

   * Choose **Import**
   * Select your `.csv` file
   * Set **Format** to `csv`
   * Enable **Header** if the CSV contains column names
   * Set **Delimiter** to `,`
7. Open the **Columns** tab.
8. Make sure the CSV columns match the table columns.
9. Click **OK** to start the import.

---

# 📌 CSV Import Settings

The important settings while importing a CSV file are:

### Format

Set the format to:

```text
csv
```

### Header

Enable **Header** when the first row of the CSV file contains column names.

### Delimiter

For a standard CSV file, use:

```text
,
```

The comma separates values in each row.

---

# 📌 Checking Imported Data

After the import is complete, use:

```sql
SELECT * FROM employee3;
```

This displays the data imported from the CSV file.

---

# 📊 Direct CSV Import Flow

```text
CSV File
    │
    ▼
pgAdmin
    │
    ▼
Import/Export Data
    │
    ▼
Select CSV File
    │
    ▼
Configure CSV Settings
    │
    ▼
Match Columns
    │
    ▼
Import Data
    │
    ▼
PostgreSQL Table
```

---

# ⚠️ Important Points

* Make sure the target table already exists.
* The CSV columns should match the table columns.
* Enable **Header** when the CSV contains column names.
* Use the correct delimiter.
* Make sure the CSV data types are compatible with the table columns.
* Make sure required columns such as `NOT NULL` columns contain values.
* Check the table after importing to verify the data.

---

# 💡 Best Practices

* Check the CSV file before importing.
* Verify the table structure before starting the import.
* Make sure column names and data types match.
* Use the correct CSV settings.
* Always verify imported records using `SELECT`.
* Test the import with a small dataset before importing a large CSV file.

---

# 📝 Interview Questions

### 1. How can you import a CSV file directly in pgAdmin?

Using the **Import/Export Data** option available on the table.

### 2. Which format should be selected for a CSV file?

**Answer:** `csv`

### 3. What is the purpose of the Header option?

It tells pgAdmin that the first row of the CSV file contains column names.

### 4. What delimiter is commonly used in CSV files?

**Answer:** Comma `,`

### 5. Where can you find the Import/Export Data option?

Right-click the target table in pgAdmin and select **Import/Export Data...**

---

# 🎯 Key Takeaways

* pgAdmin allows CSV files to be imported directly through its graphical interface.
* The **Import/Export Data** option is used for direct CSV imports.
* CSV format and delimiter must be configured correctly.
* Header should be enabled when the CSV contains column names.
* CSV columns should match the target table columns.
* Imported data can be verified using `SELECT`.

---

# 💼 Real-World Use Case

Database administrators and developers often receive data in CSV format from different sources.

pgAdmin's direct import feature makes it easy to load this data into PostgreSQL tables without manually writing an SQL import command.

---

# 📂 Practice File

```text
Day 13 Directly Import CSV.sql
```

---

# 🚀 Progress

✅ Day 13 Completed

**Next Topic ➜ Continue with the next SQL concept**
