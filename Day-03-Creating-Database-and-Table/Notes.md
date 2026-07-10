# 📅 Day 3 – Creating a Database and Table in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

- Create a new database
- Create a table inside the database
- Understand table structure
- Define different data types
- Use constraints like `PRIMARY KEY` and `NOT NULL`

---

# 📌 What is a Database?

A **database** is a structured collection of related data.

Before storing any information, we first create a database.

Example:

- Company Database
- School Database
- Hospital Database

---

# 📌 Creating a Database

SQL provides the `CREATE DATABASE` command to create a new database.

### Syntax

```sql
CREATE DATABASE database_name;
```

### Example

```sql
CREATE DATABASE company;
```

After executing the command, a new database named **company** is created.

---

# 📌 What is a Table?

A table is where data is stored inside a database.

A table consists of:

- Rows → Records
- Columns → Attributes

Example:

| Employee ID | Name | Department | Salary |
|-------------|------|------------|--------|
| 101 | Aditya | IT | 40000 |

---

# 📌 Creating a Table

The `CREATE TABLE` command is used to define the structure of a table.

### Syntax

```sql
CREATE TABLE table_name (
    column_name datatype,
    column_name datatype
);
```

---

# 💻 Example

```sql
CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    department VARCHAR(50),
    hire_date DATE,
    salary NUMERIC(10,2)
);
```

---

# 📖 Understanding the Code

| Column | Data Type | Description |
|---------|-----------|-------------|
| employee_id | SERIAL | Automatically generates unique IDs |
| name | VARCHAR(100) | Stores employee names |
| position | VARCHAR(50) | Stores job role |
| department | VARCHAR(50) | Stores department name |
| hire_date | DATE | Stores joining date |
| salary | NUMERIC(10,2) | Stores salary with decimal values |

---

# 📌 Constraints Used

## PRIMARY KEY

- Uniquely identifies every record.
- Duplicate values are not allowed.
- NULL values are not allowed.

Example:

```sql
employee_id SERIAL PRIMARY KEY
```

---

## NOT NULL

Ensures that a column cannot contain empty values.

Example:

```sql
name VARCHAR(100) NOT NULL
```

---

# 📌 Data Types Used

| Data Type | Purpose |
|-----------|----------|
| SERIAL | Auto-increment integer |
| VARCHAR | Stores text |
| DATE | Stores date values |
| NUMERIC | Stores decimal numbers |

---

# 🖼 Database Structure

```
Company Database
        │
        ▼
 Employee Table
 ┌─────────────────────────────┐
 │ employee_id                 │
 │ name                        │
 │ position                    │
 │ department                  │
 │ hire_date                   │
 │ salary                      │
 └─────────────────────────────┘
```

---

# 💡 Best Practices

✅ Use meaningful database names.

✅ Choose appropriate data types.

✅ Always define a Primary Key.

✅ Use NOT NULL for mandatory fields.

✅ Keep table names simple and readable.

---

# 📝 Interview Questions

### 1. What is the difference between a database and a table?

**Answer:**

A database is a collection of tables, while a table stores actual records in rows and columns.

---

### 2. Why do we use PRIMARY KEY?

It uniquely identifies each record and prevents duplicate entries.

---

### 3. What is SERIAL in PostgreSQL?

SERIAL automatically generates unique integer values for each new row.

---

### 4. What does NOT NULL mean?

It ensures that a column must always contain a value.

---

# 🎯 Key Takeaways

- A database stores related tables.
- Tables organize data into rows and columns.
- `CREATE DATABASE` creates a new database.
- `CREATE TABLE` creates a new table.
- Constraints improve data integrity.
- Choosing the correct data type is important.

---

# 📂 Practice File

The SQL code used in this lesson is available in:

```
Day 3 Create Database and Table.sql
```

---

# 🚀 Progress

✅ Day 3 Completed

**Next Topic ➜ Inserting Data into Tables**
