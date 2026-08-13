# 📅 Day 19 – Set Operators in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Understand Set Operators in SQL
* Combine results from multiple queries using `UNION`
* Combine all results using `UNION ALL`
* Find common records using `INTERSECT`
* Find records present in one result but not another using `EXCEPT`
* Work with multiple tables using Set Operators

---

# 📌 Introduction

Set Operators in SQL are used to combine the results of two or more `SELECT` statements.

They are useful when we want to compare or combine data from different tables.

The main Set Operators are:

* `UNION`
* `UNION ALL`
* `INTERSECT`
* `EXCEPT`

---

# 📌 Creating the Students Tables

For this practice, two tables were created:

* `students_2023`
* `students_2024`

Both tables contain:

```text
student_id
student_name
course
```

These tables contain student data from two different years.

---

# 📌 UNION Operator

The `UNION` operator combines the results of two `SELECT` queries and **removes duplicate rows**.

### Syntax

```sql id="j3v4qu"
SELECT column1, column2
FROM table1

UNION

SELECT column1, column2
FROM table2;
```

### Example

```sql id="9u9u3g"
SELECT student_name, course
FROM students_2023

UNION

SELECT student_name, course
FROM students_2024;
```

This combines students from both tables and removes duplicate records.

For example, **Kabir Patel** and **Ananya Desai** exist in both tables, so they appear only once in the `UNION` result.

---

# 📌 UNION ALL Operator

`UNION ALL` combines the results of two queries but **keeps duplicate rows**.

### Example

```sql id="8hbr0e"
SELECT student_name, course
FROM students_2023

UNION ALL

SELECT student_name, course
FROM students_2024;
```

Unlike `UNION`, duplicate records are not removed.

Therefore, students present in both tables will appear twice.

---

# 📌 UNION vs UNION ALL

| Operator    | Duplicate Records  |
| ----------- | ------------------ |
| `UNION`     | Removes duplicates |
| `UNION ALL` | Keeps duplicates   |

```text
UNION
   │
   ├── Combine Results
   └── Remove Duplicates

UNION ALL
   │
   ├── Combine Results
   └── Keep Duplicates
```

---

# 📌 INTERSECT Operator

The `INTERSECT` operator returns only the records that are **common to both queries**.

### Example

```sql id="1gcrb8"
SELECT student_name, course
FROM students_2023

INTERSECT

SELECT student_name, course
FROM students_2024;
```

This returns students who exist in **both** `students_2023` and `students_2024`.

In this example:

* Kabir Patel
* Ananya Desai

are present in both tables.

---

# 📌 EXCEPT Operator

The `EXCEPT` operator returns records that exist in the **first query but not in the second query**.

### Example

```sql id="4gkn2h"
SELECT student_name, course
FROM students_2023

EXCEPT

SELECT student_name, course
FROM students_2024;
```

This returns students who are present in `students_2023` but not in `students_2024`.

---

# 📊 Set Operators Flow

```text
             Two SELECT Queries
                    │
                    ▼
             ┌──────────────┐
             │ Set Operator │
             └──────────────┘
                    │
       ┌────────────┼────────────┐
       ▼            ▼            ▼
     UNION      INTERSECT      EXCEPT
       │            │            │
       ▼            ▼            ▼
    Combine       Common       First Only
    Results       Records      Records
```

---

# 📌 Important Requirement

For Set Operators to work correctly, the `SELECT` statements should generally have:

* The same number of columns
* Compatible data types
* Columns in the corresponding positions

For example:

```sql id="m1j6qf"
SELECT student_name, course
FROM students_2023

UNION

SELECT student_name, course
FROM students_2024;
```

Both queries return two compatible columns.

---

# 💡 Best Practices

* Make sure the number of columns matches between queries.
* Use compatible data types in corresponding columns.
* Use `UNION` when duplicate records should be removed.
* Use `UNION ALL` when duplicate records should be preserved.
* Use `INTERSECT` to find common records.
* Use `EXCEPT` to find records that exist only in the first query.
* Keep the column order consistent between the queries.

---

# 📝 Interview Questions

### 1. What are Set Operators in SQL?

Set Operators combine or compare the results of multiple `SELECT` queries.

### 2. What is the difference between UNION and UNION ALL?

`UNION` removes duplicate records, while `UNION ALL` keeps duplicate records.

### 3. Which operator is used to find common records?

**Answer:** `INTERSECT`

### 4. Which operator returns records from the first query that are not present in the second?

**Answer:** `EXCEPT`

### 5. What should be compatible between two queries using Set Operators?

The number of columns and their corresponding data types should be compatible.

---

# 🎯 Key Takeaways

* Set Operators combine results from multiple `SELECT` queries.
* `UNION` combines results and removes duplicates.
* `UNION ALL` combines results and keeps duplicates.
* `INTERSECT` returns common records.
* `EXCEPT` returns records from the first query that are not in the second.
* Queries used with Set Operators should have compatible columns and data types.

---

# 💼 Real-World Use Case

Set Operators are useful when comparing data from different datasets or time periods.

For example, a university can compare students from **2023 and 2024** to find students who appear in both years, students who are present only in one year, or a complete list of students across both years.

---

# 📂 Practice File

```text
Day 19 Set Operator.sql
```

---

# 🚀 Progress

✅ Day 19 Completed

**Next Topic ➜ Continue with the next SQL concept**
