# 📅 Day 7 – Updating Data in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

- Update existing records in a table
- Use the UPDATE statement
- Modify one or multiple columns
- Apply the WHERE clause to update specific rows
- Understand the importance of safe updates

---

# 📌 Introduction

The `UPDATE` statement is used to modify existing records in a table.

Instead of inserting new data, UPDATE changes the values of records that already exist.

---

# 📌 UPDATE Statement

### Syntax

```sql
UPDATE table_name
SET column_name = value
WHERE condition;
```

---

# 📌 Example

```sql
UPDATE employee
SET salary = 70000
WHERE employee_id = 101;
```

This query updates the salary of the employee whose ID is **101**.

---

# 📌 Updating Multiple Columns

```sql
UPDATE employee
SET
department = 'IT',
salary = 75000
WHERE employee_id = 101;
```

---

# ⚠️ Importance of WHERE Clause

Using `WHERE` ensures that only the required rows are updated.

Example:

```sql
UPDATE employee
SET salary = 50000;
```

Without a `WHERE` clause, **every employee's salary** will become **50000**.

---

# 📊 UPDATE Flow

```
Existing Record
      │
      ▼
UPDATE Statement
      │
      ▼
Modified Record
```

---

# 💡 Best Practices

- Always use the `WHERE` clause while updating data.
- Verify records using `SELECT` before updating.
- Update only the required columns.
- Test your query before executing it on large datasets.

---

# 📝 Interview Questions

### 1. Which SQL command is used to modify existing data?

**Answer:** `UPDATE`

### 2. Why is the WHERE clause important?

It updates only the required rows and prevents accidental changes to all records.

### 3. Can multiple columns be updated in one query?

**Answer:** Yes.

---

# 🎯 Key Takeaways

- UPDATE modifies existing records.
- WHERE makes updates safe.
- Multiple columns can be updated together.
- Always verify data before updating.

---

# 💼 Real-World Use Case

Companies use UPDATE statements to change employee salaries, customer addresses, product prices, order status, and other existing information in a database.

---

# 📂 Practice File

```
Day 7 Update data in SQL.sql
```

---

# 🚀 Progress

✅ Day 7 Completed

**Next Topic ➜ Retrieving Data Using SELECT Statement**
