# 📅 Day 17 – BETWEEN, LIKE and IN Operators in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Use the `BETWEEN` operator
* Filter values within a specific range
* Use the `LIKE` operator for pattern matching
* Find emails based on a specific pattern
* Use the `IN` operator to match multiple values
* Filter records using different conditions

---

# 📌 Introduction

SQL provides operators that make it easier to filter and search data.

In this lesson, I learned three useful operators:

* `BETWEEN` – Used to filter values within a range
* `LIKE` – Used to search for a specific pattern
* `IN` – Used to match values from a list

These operators are commonly used with the `WHERE` clause.

---

# 📌 BETWEEN Operator

The `BETWEEN` operator is used to retrieve values within a specific range.

### Syntax

```sql
SELECT *
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
```

### Example

```sql
SELECT *
FROM employee2
WHERE salary BETWEEN 40000 AND 60000;
```

This retrieves employees whose salary is between **40000 and 60000**.

`BETWEEN` includes both the starting and ending values.

```text
40000 ≤ salary ≤ 60000
```

---

# 📌 LIKE Operator

The `LIKE` operator is used for **pattern matching**.

It is useful when we do not know the complete value but want to search for a specific pattern.

### Example

```sql
SELECT *
FROM employee2
WHERE email LIKE '%@gmail.com';
```

This retrieves employees whose email address **ends with `@gmail.com`**.

---

# 📌 Understanding `%` with LIKE

The `%` wildcard represents **zero or more characters**.

For example:

```sql
'%@gmail.com'
```

means that any characters can appear before `@gmail.com`.

Examples that match:

```text
raj@gmail.com
amit@gmail.com
user123@gmail.com
```

---

# 📌 IN Operator

The `IN` operator is used to check whether a value matches any value from a given list.

### Syntax

```sql
SELECT *
FROM table_name
WHERE column_name IN (value1, value2, value3);
```

### Example

```sql
SELECT *
FROM employee2
WHERE department IN ('Finance', 'Marketing');
```

This retrieves employees who belong to either the **Finance** or **Marketing** department.

---

# 📊 Operator Flow

```text
Table Data
     │
     ▼
   WHERE
     │
     ├── BETWEEN ──► Range of Values
     │
     ├── LIKE ──────► Pattern Matching
     │
     └── IN ────────► Multiple Values
```

---

# 💡 Best Practices

* Use `BETWEEN` when filtering values within a range.
* Use `LIKE` when searching for text patterns.
* Use `%` carefully when working with `LIKE`.
* Use `IN` when checking a column against multiple specific values.
* Use the `WHERE` clause to apply these operators for filtering.

---

# 📝 Interview Questions

### 1. What is the purpose of the BETWEEN operator?

It is used to filter values within a specific range.

### 2. Does BETWEEN include the starting and ending values?

**Answer:** Yes, `BETWEEN` includes both boundary values.

### 3. What is the purpose of the LIKE operator?

It is used for pattern matching in text values.

### 4. What does `%` mean in a LIKE pattern?

`%` represents zero or more characters.

### 5. What is the purpose of the IN operator?

It is used to check whether a value matches any value from a specified list.

---

# 🎯 Key Takeaways

* `BETWEEN` filters values within a range.
* `BETWEEN` includes both boundary values.
* `LIKE` is used for pattern matching.
* `%` represents zero or more characters in a `LIKE` pattern.
* `IN` is used to match multiple possible values.
* These operators are commonly used with `WHERE`.

---

# 💼 Real-World Use Case

These operators are commonly used when filtering business data.

For example, a company can find employees with salaries between a certain range, customers whose email belongs to a specific domain, or employees who work in selected departments.

---

# 📂 Practice File

```text
Day 17 Between Like and In Operator.sql
```

---

# 🚀 Progress

✅ Day 17 Completed

**Next Topic ➜ Continue with the next SQL concept**
