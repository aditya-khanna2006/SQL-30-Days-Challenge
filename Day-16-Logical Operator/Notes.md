# 📅 Day 16 – Logical Operators in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Use logical operators in SQL
* Combine multiple conditions using `AND`
* Use `OR` to match at least one condition
* Use `NOT` to exclude a condition
* Filter records using multiple conditions
* Combine logical operators with the WHERE clause

---

# 📌 Introduction

Logical operators in SQL are used to combine or modify multiple conditions.

They are commonly used with the `WHERE` clause to create more specific filtering conditions.

The main logical operators are:

* `AND`
* `OR`
* `NOT`

---

# 📌 AND Operator

The `AND` operator returns records only when **all conditions are true**.

### Syntax

```sql
SELECT *
FROM table_name
WHERE condition1 AND condition2;
```

### Example

```sql
SELECT *
FROM employee2
WHERE age >= 40
AND salary > 50000;
```

This retrieves employees whose:

* Age is **40 or greater**
* Salary is **greater than 50000**

Both conditions must be true.

---

# 📌 Another AND Example

```sql
SELECT *
FROM employee2
WHERE age = 60
AND salary > 50000;
```

This retrieves employees whose age is exactly **60** and salary is greater than **50000**.

---

# 📌 OR Operator

The `OR` operator returns records when **at least one condition is true**.

### Syntax

```sql
SELECT *
FROM table_name
WHERE condition1 OR condition2;
```

### Example

```sql
SELECT *
FROM employee2
WHERE age >= 60
OR salary > 90000;
```

This retrieves employees when either:

* Age is **60 or greater**
* Salary is **greater than 90000**

If either condition is true, the record is returned.

---

# 📌 NOT Operator

The `NOT` operator is used to exclude records that match a condition.

### Syntax

```sql
SELECT *
FROM table_name
WHERE NOT (condition);
```

### Example

```sql
SELECT *
FROM employee2
WHERE NOT (department = 'IT');
```

This retrieves employees whose department is **not IT**.

---

# 📊 Logical Operators Flow

```text
                WHERE
                  │
        ┌─────────┼─────────┐
        ▼         ▼         ▼
       AND       OR        NOT
        │         │         │
        ▼         ▼         ▼
    All true   One true   Exclude
    required   is enough  condition
```

---

# 💡 Best Practices

* Use `AND` when all conditions must be satisfied.
* Use `OR` when any one of multiple conditions can be satisfied.
* Use `NOT` when you want to exclude a specific condition.
* Use parentheses to make complex conditions easier to understand.
* Test logical conditions with sample data to verify the results.

---

# 📝 Interview Questions

### 1. What are logical operators in SQL?

Logical operators are used to combine or modify multiple conditions.

### 2. What does the AND operator do?

It returns records only when **all specified conditions are true**.

### 3. What does the OR operator do?

It returns records when **at least one condition is true**.

### 4. What is the purpose of the NOT operator?

It reverses a condition and can be used to exclude matching records.

### 5. Which clause is commonly used with logical operators?

**Answer:** `WHERE`

---

# 🎯 Key Takeaways

* Logical operators help create multiple conditions in SQL.
* `AND` requires all conditions to be true.
* `OR` requires at least one condition to be true.
* `NOT` is used to exclude a condition.
* Logical operators are commonly used with `WHERE`.
* Parentheses can make complex conditions easier to understand.

---

# 💼 Real-World Use Case

Logical operators are useful when filtering real-world business data.

For example, a company can find employees who are above a certain age **and** have a specific salary, employees who meet **either** of two conditions, or employees who are **not** part of a particular department.

---

# 📂 Practice File

```text
Day 16 Logical Operator.sql
```

---

# 🚀 Progress

✅ Day 16 Completed

**Next Topic ➜ Continue with the next SQL concept**
