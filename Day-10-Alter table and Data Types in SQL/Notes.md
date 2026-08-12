# 📅 Day 10 – Alter Column and Data Type in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Modify an existing table using ALTER TABLE
* Rename a column
* Change the data type of a column
* Add a NOT NULL constraint
* Add a CHECK constraint
* Rename a table
* Understand how table structure can be modified

---

# 📌 Introduction

The `ALTER TABLE` statement is used to modify the structure of an existing table.

Using `ALTER TABLE`, we can rename columns, change data types, add or modify constraints, and rename tables without creating a new table.

---

# 📌 ALTER TABLE Statement

### Syntax

```sql
ALTER TABLE table_name
operation;
```

The `ALTER TABLE` statement can be used for different operations depending on what we want to change.

---

# 📌 Renaming a Column

The `RENAME COLUMN` operation is used to change the name of an existing column.

```sql
ALTER TABLE users
RENAME COLUMN username TO full_name;
```

This changes the column name from `username` to `full_name`.

---

# 📌 Changing Column Data Type

The data type of an existing column can also be changed.

```sql
ALTER TABLE users
ALTER COLUMN age TYPE SMALLINT;
```

This changes the data type of the `age` column from `INT` to `SMALLINT`.

---

# 📌 Adding NOT NULL Constraint

The `NOT NULL` constraint ensures that a column cannot contain `NULL` values.

```sql
ALTER TABLE users
ALTER COLUMN city SET NOT NULL;
```

After adding this constraint, every new record must have a value for the `city` column.

---

# 📌 Adding CHECK Constraint

A `CHECK` constraint is used to make sure that column values satisfy a specific condition.

```sql
ALTER TABLE users
ADD CONSTRAINT age CHECK(age >= 18);
```

This ensures that the `age` value must be **18 or greater**.

---

# 📌 Testing CHECK Constraint

After adding the constraint, we can insert a record to test it.

```sql
INSERT INTO users (full_name, email, age, city)
VALUES ('Vinod', 'rajesh@gmail.com', 19, 'Mumbai');
```

Since the age is **19**, it satisfies the condition `age >= 18`.

---

# 📌 Renaming a Table

The `ALTER TABLE` statement can also be used to rename an existing table.

```sql
ALTER TABLE users
RENAME TO customers;
```

This changes the table name from `users` to `customers`.

---

# 📌 Viewing the Modified Table

After modifying the table, we can use `SELECT` to view the data.

```sql
SELECT *
FROM customers
ORDER BY user_id ASC;
```

This displays the records from the renamed `customers` table.

---

# 📊 ALTER TABLE Flow

```text
Existing Table
      │
      ▼
ALTER TABLE
      │
      ├── Rename Column
      │
      ├── Change Data Type
      │
      ├── Add Constraint
      │
      └── Rename Table
      │
      ▼
Modified Table
```

---

# 💡 Best Practices

* Check the existing table structure before modifying it.
* Use `ALTER TABLE` carefully on important tables.
* Make sure the new data type is compatible with existing data.
* Use constraints to maintain data quality.
* Test changes after modifying the table structure.
* Be careful when renaming columns because existing queries may depend on the old column name.

---

# 📝 Interview Questions

### 1. Which SQL command is used to modify an existing table structure?

**Answer:** `ALTER TABLE`

### 2. How can you rename a column in PostgreSQL?

**Answer:** Using `RENAME COLUMN`.

Example:

```sql
ALTER TABLE users
RENAME COLUMN username TO full_name;
```

### 3. How can you change the data type of a column?

**Answer:** Using `ALTER COLUMN ... TYPE`.

### 4. What is the purpose of a CHECK constraint?

It ensures that values inserted into a column satisfy a specific condition.

### 5. How can you rename a table?

**Answer:** Using `ALTER TABLE ... RENAME TO`.

---

# 🎯 Key Takeaways

* `ALTER TABLE` is used to modify an existing table.
* Columns can be renamed using `RENAME COLUMN`.
* Column data types can be changed using `ALTER COLUMN ... TYPE`.
* `NOT NULL` prevents a column from containing `NULL` values.
* `CHECK` ensures that data follows a specific condition.
* Tables can be renamed using `RENAME TO`.
* Table structure can be modified without recreating the table.

---

# 💼 Real-World Use Case

As applications grow, database structures often need to change.

For example, a company may rename a column, change a column's data type, add data validation rules, or rename a table to better represent its purpose.

`ALTER TABLE` allows developers and database administrators to make these structural changes to existing tables.

---

# 📂 Practice File

```text
Day 10 Alter Column and Data type in SQL.sql
```

---

# 🚀 Progress

✅ Day 10 Completed

**Next Topic ➜ Continue with the next SQL concept**
