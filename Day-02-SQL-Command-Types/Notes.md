# 📅 Day 2 – SQL Command Types

## 🎯 Learning Objectives

By the end of this lesson, you will understand:

- What SQL commands are
- The five categories of SQL commands
- When each command is used
- Basic syntax of common SQL statements
- Difference between SQL and NoSQL databases

---

# 📌 Introduction

SQL provides different commands to perform different tasks on a database.

Instead of using one command for everything, SQL divides commands into categories based on their purpose.

```
                    SQL Commands
                         │
      ┌──────────┬──────────┬──────────┬──────────┬──────────┐
      │          │          │          │          │
     DDL        DML        DQL        DCL        TCL
```

Each category plays an important role in database management.

---

# 🏗️ 1. DDL (Data Definition Language)

DDL commands are used to create and modify the **structure** of database objects.

These commands do **not** manipulate data; they define how data is stored.

## Common DDL Commands

| Command | Purpose |
|----------|---------|
| CREATE | Creates a new database object |
| ALTER | Modifies an existing object |
| DROP | Deletes a database object |
| TRUNCATE | Removes all records while keeping the table |

---

### Example

```sql
CREATE TABLE Employees(
    Employee_ID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);
```

---

### Modify Table

```sql
ALTER TABLE Employees
ADD Department VARCHAR(50);
```

---

### Delete Table

```sql
DROP TABLE Employees;
```

---

### Remove All Data

```sql
TRUNCATE TABLE Employees;
```

---

# ✏️ 2. DML (Data Manipulation Language)

DML commands work with the **data stored inside tables**.

These commands allow us to insert, update, delete, and retrieve records.

---

## Common DML Commands

| Command | Purpose |
|----------|---------|
| INSERT | Adds new records |
| UPDATE | Changes existing records |
| DELETE | Removes specific records |
| SELECT | Retrieves data |

---

### Insert Data

```sql
INSERT INTO Employees
VALUES (101,'Aditya',25000);
```

---

### Update Data

```sql
UPDATE Employees
SET Salary = 30000
WHERE Employee_ID = 101;
```

---

### Delete Data

```sql
DELETE FROM Employees
WHERE Employee_ID = 101;
```

---

### View Data

```sql
SELECT *
FROM Employees;
```

---

# 🔍 3. DQL (Data Query Language)

DQL focuses only on retrieving data from a database.

The primary command in DQL is:

```sql
SELECT
```

---

### Example

```sql
SELECT Name, Salary
FROM Employees
WHERE Salary > 25000;
```

---

### Why is SELECT Important?

✔ View records

✔ Filter data

✔ Sort data

✔ Generate reports

✔ Perform analysis

Almost every Data Analyst uses the **SELECT** statement daily.

---

# 🔐 4. DCL (Data Control Language)

DCL manages **permissions** and **security**.

Database administrators use these commands to control who can access database objects.

---

## Common DCL Commands

| Command | Purpose |
|----------|---------|
| GRANT | Gives permissions |
| REVOKE | Removes permissions |

---

### Example

```sql
GRANT SELECT
ON Employees
TO User1;
```

---

### Remove Permission

```sql
REVOKE SELECT
ON Employees
FROM User1;
```

---

# 🔄 5. TCL (Transaction Control Language)

A transaction is a group of SQL operations executed together.

TCL commands help maintain data consistency.

---

## Common TCL Commands

| Command | Purpose |
|----------|---------|
| BEGIN | Starts a transaction |
| COMMIT | Saves changes |
| ROLLBACK | Cancels changes |
| SAVEPOINT | Creates a checkpoint |

---

### Transaction Flow

```
BEGIN
   │
   ▼
Execute Queries
   │
   ▼
COMMIT ✔ (Save)

or

ROLLBACK ❌ (Undo)
```

---

### Example

```sql
BEGIN;

UPDATE Employees
SET Salary = Salary + 5000;

COMMIT;
```

---

# 📊 Summary of SQL Command Types

| Category | Purpose | Commands |
|-----------|---------|----------|
| DDL | Defines database structure | CREATE, ALTER, DROP, TRUNCATE |
| DML | Manipulates data | INSERT, UPDATE, DELETE |
| DQL | Retrieves data | SELECT |
| DCL | Controls permissions | GRANT, REVOKE |
| TCL | Manages transactions | BEGIN, COMMIT, ROLLBACK, SAVEPOINT |

---

# ⚖️ SQL vs NoSQL

| Feature | SQL | NoSQL |
|----------|-----|--------|
| Database Type | Relational | Non-Relational |
| Structure | Tables | Documents, Key-Value, Graph |
| Schema | Fixed | Flexible |
| Scalability | Vertical | Horizontal |
| Best For | Banking, ERP, Business Apps | Social Media, IoT, Big Data |
| Examples | PostgreSQL, MySQL, Oracle | MongoDB, Cassandra, Redis |

---

## Visual Comparison

```
SQL
────────────
📋 Tables
│ Rows
│ Columns
│ Fixed Schema

NoSQL
────────────
📄 JSON
🔑 Key-Value
🕸 Graph
📦 Flexible Schema
```

---

# 💡 Best Practices

✅ Always use `SELECT` before updating or deleting records.

✅ Use `COMMIT` only after verifying changes.

✅ Be careful while using `DROP` and `TRUNCATE`.

✅ Grant only the required permissions to users.

---

# 📝 Interview Questions

### Q1. What are the five types of SQL commands?

**Answer:**

- DDL
- DML
- DQL
- DCL
- TCL

---

### Q2. Difference between DELETE and TRUNCATE?

| DELETE | TRUNCATE |
|----------|-----------|
| Removes selected rows | Removes all rows |
| Can use WHERE | Cannot use WHERE |
| Slower | Faster |

---

### Q3. Which SQL command is used most by Data Analysts?

**Answer:** `SELECT`

---

# 🎯 Key Takeaways

- SQL commands are divided into five categories.
- Each category performs a specific task.
- DDL manages structure.
- DML manages data.
- DQL retrieves information.
- DCL manages permissions.
- TCL controls transactions.
- Understanding command types is the foundation of SQL.

---

# 📚 Resources

- PostgreSQL Documentation: https://www.postgresql.org/docs/
- SQLBolt: https://sqlbolt.com/
- W3Schools SQL: https://www.w3schools.com/sql/

---

# 🚀 Progress

✅ Day 2 Completed

**Next Topic ➜ PostgreSQL Basics & Writing Your First SQL Query**
