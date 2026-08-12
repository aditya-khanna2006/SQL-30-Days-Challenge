# 📅 Day 8 – Updating and Managing Data in PostgreSQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Create a table in PostgreSQL
* Insert records into a table
* Retrieve data using the SELECT statement
* Sort records using ORDER BY
* Update existing records using UPDATE
* Update multiple columns at once
* Update records using conditions
* Update values using expressions
* Delete records using the DELETE statement
* Manage table data using PostgreSQL tools

---

# 📌 Introduction

In PostgreSQL, data stored inside a table can be **retrieved, updated, sorted, and deleted** using SQL statements.

In this lesson, I practiced working with a `users` table and learned how to modify existing records using different conditions.

---

# 📌 Creating the Users Table

```sql
CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    age INT,
    city VARCHAR(50)
);
```

This creates a `users` table with columns for user ID, username, email, age, and city.

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

This query inserts sample user records into the `users` table.

---

# 📌 Retrieving Data Using SELECT

To retrieve all records:

```sql
SELECT * FROM users;
```

To retrieve specific columns:

```sql
SELECT username, city
FROM users;
```

This returns only the `username` and `city` columns.

---

# 📌 Sorting Data Using ORDER BY

```sql
SELECT *
FROM users
ORDER BY user_id ASC;
```

`ORDER BY` is used to sort the result.

* `ASC` → Ascending order
* `DESC` → Descending order

---

# 📌 Updating Data

The `UPDATE` statement is used to modify existing records.

### Syntax

```sql
UPDATE table_name
SET column_name = value
WHERE condition;
```

### Example

```sql
UPDATE users
SET age = 28
WHERE username = 'Rajesh';
```

This changes Rajesh's age to **28**.

---

# 📌 Updating Multiple Columns

Multiple columns can be updated in a single `UPDATE` statement.

```sql
UPDATE users
SET
    age = 31,
    city = 'Kolkata'
WHERE username = 'Priya';
```

This updates both the age and city of Priya.

---

# 📌 Updating Multiple Rows Using a Condition

```sql
UPDATE users
SET city = 'Chennai'
WHERE age >= 30;
```

This updates the city for all users whose age is **30 or greater**.

---

# 📌 Updating Data Using an Expression

We can also update a column based on its existing value.

```sql
UPDATE users
SET age = age + 1
WHERE email LIKE '%@gmail.com';
```

This increases the age by **1** for users whose email ends with `@gmail.com`.

---

# 📌 Deleting Data

The `DELETE` statement is used to remove records from a table.

### Syntax

```sql
DELETE FROM table_name
WHERE condition;
```

### Example

```sql
DELETE FROM users
WHERE user_id = 6;
```

This deletes the record whose `user_id` is **6**.

---

# ⚠️ Importance of WHERE Clause

The `WHERE` clause is very important when using `UPDATE` and `DELETE`.

For example:

```sql
UPDATE users
SET city = 'Delhi';
```

Without a `WHERE` clause, the city of **every user** will be changed.

Similarly:

```sql
DELETE FROM users;
```

Without a `WHERE` clause, **all records** from the table will be deleted.

---

# 📊 Data Management Flow

```text
Users Table
     │
     ├── SELECT ──► Retrieve Data
     │
     ├── ORDER BY ──► Sort Data
     │
     ├── UPDATE ──► Modify Data
     │
     └── DELETE ──► Remove Data
```

---

# 💡 Best Practices

* Always use the `WHERE` clause when updating or deleting specific records.
* Use `SELECT` to verify data before making changes.
* Use `ORDER BY` when sorted results are required.
* Be careful when using `DELETE`.
* Verify the affected records after an `UPDATE` or `DELETE`.
* PostgreSQL tools can also be used to view and manage table data.

---

# 📝 Interview Questions

### 1. Which SQL command is used to modify existing records?

**Answer:** `UPDATE`

### 2. Which SQL command is used to delete records?

**Answer:** `DELETE`

### 3. How can you sort records in SQL?

**Answer:** Using the `ORDER BY` clause.

### 4. What is the purpose of the WHERE clause?

It is used to apply a condition and select specific records for operations such as `SELECT`, `UPDATE`, and `DELETE`.

### 5. Can multiple columns be updated in one UPDATE statement?

**Answer:** Yes.

---

# 🎯 Key Takeaways

* `SELECT` is used to retrieve data.
* `ORDER BY` is used to sort data.
* `UPDATE` modifies existing records.
* Multiple columns can be updated together.
* Existing column values can be used in an update expression.
* `DELETE` removes records from a table.
* `WHERE` helps prevent accidental changes to all records.
* PostgreSQL tools can be used to manage table data.

---

# 💼 Real-World Use Case

Applications frequently need to update user information such as age, city, email, or other details.

For example, a company may update customer information, change user locations, modify account details, or remove old user records from its database.

---

# 📂 Practice File

```text
Day 8 Updating and Managing Data in PostgreSQL.sql
```

---

# 🚀 Progress

✅ Day 8 Completed

**Next Topic ➜ Continue with the next SQL concept**
