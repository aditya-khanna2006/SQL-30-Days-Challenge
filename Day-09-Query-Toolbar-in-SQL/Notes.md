# 📅 Day 9 – PostgreSQL Query Tool

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Use the PostgreSQL Query Tool
* Execute SQL queries using the Query Tool
* Create a table using SQL
* Insert records into a table
* Retrieve table data
* Update existing records
* Sort records using ORDER BY
* Delete records from a table
* Execute multiple SQL queries in the Query Tool

---

# 📌 Introduction

The **PostgreSQL Query Tool** is used to write and execute SQL queries directly in PostgreSQL.

It allows us to create tables, insert data, retrieve records, update existing data, and delete records using SQL commands.

---

# 📌 Opening the Query Tool

The Query Tool provides an editor where SQL queries can be written and executed.

Example:

```sql
SELECT * FROM users;
```

After writing the query, it can be executed using the **Execute/Run** option in the Query Tool.

---

# 📌 Creating a Table Using Query Tool

```sql
CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    age INT,
    city VARCHAR(50)
);
```

This creates a `users` table in the database.

---

# 📌 Inserting Data

```sql
INSERT INTO users (username, email, age, city)
VALUES
('Rajesh', 'rajesh@gmail.com', 25, 'Mumbai'),
('Priya', 'priya@yahoo.com', 30, 'Delhi'),
('Ankit', 'ankit@gmail.com', 28, 'Bangalore'),
('Sneha', 'sneha@hotmail.com', 35, 'Pune'),
('Vikram', 'vikram@gmail.com', 22, 'Hyderabad');
```

This query inserts five records into the `users` table.

---

# 📌 Retrieving Data

To view all records:

```sql
SELECT * FROM users;
```

To retrieve specific columns:

```sql
SELECT username, city
FROM users;
```

The Query Tool displays the result of the executed query.

---

# 📌 Updating Data

The Query Tool can also be used to execute `UPDATE` statements.

```sql
UPDATE users
SET age = 28
WHERE username = 'Rajesh';
```

This updates Rajesh's age to **28**.

---

# 📌 Sorting Data

The `ORDER BY` clause can be executed from the Query Tool to sort records.

```sql
SELECT *
FROM users
ORDER BY user_id ASC;
```

`ASC` sorts the records in ascending order.

---

# 📌 Updating Multiple Records

```sql
UPDATE users
SET city = 'Chennai'
WHERE age >= 30;
```

This updates the city for users whose age is **30 or greater**.

---

# 📌 Updating Multiple Columns

```sql
UPDATE users
SET
    age = 31,
    city = 'Kolkata'
WHERE username = 'Priya';
```

Multiple columns can be updated in a single query.

---

# 📌 Updating Data Using Existing Values

```sql
UPDATE users
SET age = age + 1
WHERE email LIKE '%@gmail.com';
```

This increases the age by **1** for users whose email ends with `@gmail.com`.

---

# 📌 Deleting Data

Records can also be deleted using the Query Tool.

```sql
DELETE FROM users
WHERE user_id = 6;
```

This removes the record whose `user_id` is **6**.

---

# 📌 Executing Multiple Queries

The Query Tool can contain multiple SQL statements.

For example:

```sql
SELECT * FROM users;

UPDATE users
SET age = 28
WHERE username = 'Rajesh';

SELECT * FROM users;
```

Queries can be written and executed from the same Query Tool.

---

# ⚠️ Importance of WHERE Clause

The `WHERE` clause is important when updating or deleting specific records.

Example:

```sql
UPDATE users
SET city = 'Delhi';
```

Without a `WHERE` clause, the city of **all users** will be updated.

Similarly:

```sql
DELETE FROM users;
```

Without a `WHERE` clause, **all records** will be deleted.

---

# 📊 Query Tool Flow

```text
Write SQL Query
      │
      ▼
PostgreSQL Query Tool
      │
      ▼
Execute Query
      │
      ▼
Database
      │
      ▼
View Result
```

---

# 💡 Best Practices

* Check your SQL query before executing it.
* Use `SELECT` to verify records before making changes.
* Use the `WHERE` clause carefully with `UPDATE` and `DELETE`.
* Keep SQL queries organized and readable.
* Use the Query Tool to practice and test SQL commands.
* Be careful when executing queries that modify or delete data.

---

# 📝 Interview Questions

### 1. What is the PostgreSQL Query Tool?

It is a tool used to write and execute SQL queries in PostgreSQL.

### 2. What can we do using the Query Tool?

We can create tables, insert data, retrieve records, update data, delete records, and execute other SQL commands.

### 3. Can multiple SQL queries be written in the Query Tool?

**Answer:** Yes.

### 4. Which clause is important when updating or deleting specific records?

**Answer:** `WHERE`

---

# 🎯 Key Takeaways

* PostgreSQL Query Tool is used to execute SQL queries.
* SQL statements can be written directly in the Query Tool.
* Tables can be created and populated using SQL.
* Data can be retrieved using `SELECT`.
* Existing records can be modified using `UPDATE`.
* Records can be removed using `DELETE`.
* Multiple SQL statements can be executed using the Query Tool.

---

# 💼 Real-World Use Case

Developers and database administrators use PostgreSQL's Query Tool to test SQL queries, manage database tables, update records, troubleshoot data, and perform database operations during development and maintenance.

---

# 📂 Practice File

```text
Day 9 PostgreSQL Query Tool.sql
```

---

# 🚀 Progress

✅ Day 9 Completed

**Next Topic ➜ Continue with the next SQL concept**
