# 📅 Day 15 – Comparison Operators in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Use comparison operators in SQL
* Compare column values with specific values
* Filter records using the WHERE clause
* Find records equal to a value
* Find records not equal to a value
* Find records greater than a value

---

# 📌 Introduction

Comparison operators in SQL are used to compare values and filter records based on a condition.

They are commonly used with the `WHERE` clause to retrieve only the records that match a specific condition.

---

# 📌 Common Comparison Operators

| Operator | Description              |
| -------- | ------------------------ |
| `=`      | Equal to                 |
| `<>`     | Not equal to             |
| `!=`     | Not equal to             |
| `>`      | Greater than             |
| `<`      | Less than                |
| `>=`     | Greater than or equal to |
| `<=`     | Less than or equal to    |

---

# 📌 Equal To Operator

The `=` operator is used to find records where a column is equal to a specific value.

### Example

```sql id="t7l0cz"
SELECT *
FROM employee2
WHERE age = 30;
```

This retrieves employees whose age is exactly **30**.

---

# 📌 Not Equal To Operator

The `<>` operator is used to find records whose value is not equal to the specified value.

### Example

```sql id="8y9jsm"
SELECT *
FROM employee2
WHERE age <> 30;
```

This retrieves employees whose age is **not 30**.

---

# 📌 Greater Than Operator

The `>` operator is used to find values greater than a specified value.

### Example

```sql id="fd4e4v"
SELECT *
FROM employee2
WHERE salary > 50000;
```

This retrieves employees whose salary is **greater than 50000**.

---

# 📌 Using WHERE with Comparison Operators

The `WHERE` clause is used to apply comparison conditions.

### Syntax

```sql id="3t1h6r"
SELECT column_name
FROM table_name
WHERE condition;
```

The condition determines which records will be returned.

---

# 📊 Comparison Operator Flow

```text id="g5zqkm"
Table Data
    │
    ▼
WHERE Condition
    │
    ▼
Comparison Operator
    │
    ▼
Matching Records
```

---

# 💡 Best Practices

* Use the `WHERE` clause when filtering records.
* Choose the correct comparison operator for the condition.
* Use `=` when you need an exact match.
* Use `<>` when you need records that do not match a value.
* Use `>` when looking for values greater than a specific value.
* Test your condition with sample data to verify the result.

---

# 📝 Interview Questions

### 1. What are comparison operators in SQL?

Comparison operators are used to compare values and filter records based on conditions.

### 2. Which operator is used to check equality?

**Answer:** `=`

### 3. Which operator is used for not equal to?

**Answer:** `<>` or `!=`

### 4. Which operator is used to find values greater than a specific value?

**Answer:** `>`

### 5. Which clause is commonly used with comparison operators?

**Answer:** `WHERE`

---

# 🎯 Key Takeaways

* Comparison operators are used to compare values.
* `=` checks whether values are equal.
* `<>` checks whether values are not equal.
* `>` checks for values greater than a specified value.
* Comparison operators are commonly used with `WHERE`.
* They help filter specific records from a table.

---

# 💼 Real-World Use Case

Comparison operators are commonly used to filter business data.

For example, a company can find employees with a salary greater than `50000`, employees of a specific age, or employees whose salary is not equal to a particular amount.

---

# 📂 Practice File

```text id="3b8xqk"
Day 15 Comparison Operator.sql
```

---

# 🚀 Progress

✅ Day 15 Completed

**Next Topic ➜ Continue with the next SQL concept**
