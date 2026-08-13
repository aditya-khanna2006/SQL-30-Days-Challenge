# 📅 Day 18 – Other SQL Operators and Clauses

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Check for NULL values using `IS NULL`
* Sort data using `ORDER BY`
* Sort salary from highest to lowest
* Limit the number of returned records using `LIMIT`
* Retrieve the top 5 highest-paid employees
* Retrieve unique values using `DISTINCT`

---

# 📌 Introduction

SQL provides several useful operators and clauses that help us retrieve and organize data efficiently.

In this lesson, I learned:

* `IS NULL` – Check for missing values
* `ORDER BY` – Sort query results
* `LIMIT` – Restrict the number of returned records
* `DISTINCT` – Retrieve unique values

---

# 📌 IS NULL Operator

The `IS NULL` operator is used to find records where a column contains a `NULL` value.

### Syntax

```sql
SELECT *
FROM table_name
WHERE column_name IS NULL;
```

### Example

```sql
SELECT first_name, last_name, email
FROM employee2
WHERE email IS NULL;
```

This retrieves employees whose email address is missing (`NULL`).

---

# 📌 ORDER BY Clause

The `ORDER BY` clause is used to sort query results.

### Syntax

```sql
SELECT column_name
FROM table_name
ORDER BY column_name;
```

By default, `ORDER BY` sorts values in **ascending order**.

---

# 📌 Sorting in Descending Order

The `DESC` keyword is used to sort values from highest to lowest.

### Example

```sql
SELECT first_name, last_name, salary
FROM employee2
ORDER BY salary DESC;
```

This displays employees with the **highest salary first**.

---

# 📌 LIMIT Clause

The `LIMIT` clause is used to restrict the number of records returned by a query.

### Syntax

```sql
SELECT *
FROM table_name
LIMIT number;
```

### Example

```sql
SELECT first_name, last_name, salary
FROM employee2
ORDER BY salary DESC
LIMIT 5;
```

This retrieves the **top 5 highest-paid employees**.

Here, `ORDER BY salary DESC` first sorts employees by salary from highest to lowest, and `LIMIT 5` returns only the first five records.

---

# 📌 DISTINCT Keyword

The `DISTINCT` keyword is used to remove duplicate values from the result.

### Example

```sql
SELECT DISTINCT department
FROM employee2;
```

This returns a list of **unique departments** from the `employee2` table.

For example:

```text
IT
Finance
HR
Marketing
Operations
```

If multiple employees belong to the same department, that department will appear only once.

---

# 📊 Query Flow

```text
Employee Table
      │
      ▼
    SELECT
      │
      ├── IS NULL ──► Find Missing Values
      │
      ├── ORDER BY ─► Sort Data
      │
      ├── LIMIT ────► Restrict Results
      │
      └── DISTINCT ─► Remove Duplicates
```

---

# 💡 Best Practices

* Use `IS NULL` to check for missing values.
* Do not use `= NULL` to check for NULL values.
* Use `ORDER BY` when the order of results matters.
* Use `DESC` for highest-to-lowest sorting.
* Use `LIMIT` when only a specific number of records are required.
* Use `DISTINCT` when you need unique values.

---

# 📝 Interview Questions

### 1. How do you find NULL values in SQL?

Using the `IS NULL` operator.

```sql
WHERE email IS NULL;
```

### 2. Can we use `= NULL` to check for NULL?

**Answer:** No.

Use:

```sql
IS NULL
```

instead.

### 3. Which keyword is used to sort data from highest to lowest?

**Answer:** `DESC`

### 4. Which clause is used to restrict the number of returned rows?

**Answer:** `LIMIT`

### 5. Which keyword is used to retrieve unique values?

**Answer:** `DISTINCT`

---

# 🎯 Key Takeaways

* `IS NULL` is used to find missing values.
* `ORDER BY` sorts query results.
* `DESC` sorts values from highest to lowest.
* `LIMIT` restricts the number of returned records.
* `DISTINCT` returns unique values.
* These clauses are useful for organizing and filtering query results.

---

# 💼 Real-World Use Case

These SQL features are commonly used for analyzing business data.

For example, a company can find employees with missing email addresses, identify the highest-paid employees, retrieve the top 5 salaries, or generate a list of unique departments.

---

# 📂 Practice File

```text
Day 18 Other Operator.sql
```

---

# 🚀 Progress

✅ Day 18 Completed

**Next Topic ➜ Continue with the next SQL concept**
