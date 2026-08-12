# 📅 Day 14 – Arithmetic Operators in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Use arithmetic operators in SQL
* Perform calculations on column values
* Calculate employee bonuses
* Calculate annual salary
* Calculate salary increments
* Calculate a new salary after an increment
* Create calculated columns using aliases

---

# 📌 Introduction

Arithmetic operators in SQL are used to perform mathematical calculations on numeric values.

They can be used directly with table columns to calculate values such as bonuses, annual salaries, increments, discounts, and other derived values.

---

# 📌 Common Arithmetic Operators

| Operator | Description    |
| -------- | -------------- |
| `+`      | Addition       |
| `-`      | Subtraction    |
| `*`      | Multiplication |
| `/`      | Division       |
| `%`      | Modulus        |

---

# 📌 Calculating a 10% Bonus

```sql
SELECT first_name, salary,
       (salary * 0.10) AS bonus
FROM employee2;
```

This calculates a **10% bonus** based on the employee's salary.

For example, if the salary is `60000`, the bonus will be `6000`.

---

# 📌 Calculating Annual Salary

Monthly salary can be multiplied by `12` to calculate the annual salary.

```sql
SELECT first_name,
       last_name,
       salary,
       (salary * 12) AS annual_salary
FROM employee2;
```

This calculates the yearly salary of each employee.

---

# 📌 Calculating a 5% Salary Increment

```sql
SELECT first_name,
       last_name,
       salary,
       (salary * 0.05) AS increment_salary
FROM employee2;
```

This calculates **5% of the current salary** as the increment amount.

---

# 📌 Calculating New Salary

The new salary can be calculated by adding the increment to the current salary.

```sql
SELECT first_name,
       last_name,
       salary,
       (salary * 0.05) AS increment_salary,
       (salary + salary * 0.05) AS new_salary
FROM employee2;
```

Here:

```text
New Salary = Current Salary + Increment
```

---

# 📌 Another Way to Calculate New Salary

The same calculation can also be written using multiplication.

```sql
SELECT first_name,
       last_name,
       salary,
       (salary * 1.05) AS new_salary
FROM employee2;
```

Multiplying the salary by `1.05` increases the salary by **5%**.

---

# 📊 Salary Calculation Flow

```text
Monthly Salary
      │
      ├── × 12 ──► Annual Salary
      │
      └── × 5% ──► Salary Increment
                       │
                       ▼
             Current Salary + Increment
                       │
                       ▼
                  New Salary
```

---

# 💡 Best Practices

* Use meaningful aliases for calculated columns.
* Use parentheses to make calculations easier to understand.
* Verify calculations with sample values.
* Keep calculated expressions simple and readable.
* Use the correct arithmetic operator for the required calculation.

---

# 📝 Interview Questions

### 1. Which operator is used for multiplication in SQL?

**Answer:** `*`

### 2. How can you calculate 10% of a salary?

```sql
salary * 0.10
```

### 3. How can you calculate annual salary from monthly salary?

```sql
salary * 12
```

### 4. How can you calculate a 5% salary increment?

```sql
salary * 0.05
```

### 5. How can you calculate the new salary after a 5% increment?

```sql
salary * 1.05
```

---

# 🎯 Key Takeaways

* Arithmetic operators can be used directly with SQL columns.
* `*` is used for multiplication.
* Salary calculations can be performed directly in a `SELECT` query.
* Aliases make calculated columns easier to understand.
* Annual salary can be calculated by multiplying monthly salary by `12`.
* A salary increment can be calculated using a percentage.
* A new salary can be calculated using arithmetic expressions.

---

# 💼 Real-World Use Case

Companies use arithmetic calculations in SQL to calculate employee bonuses, salary increments, annual salaries, discounts, taxes, commissions, and other financial values.

For example, an HR database can calculate a **5% salary increment** for employees without changing the original salary stored in the table.

---

# 📂 Practice File

```text
Day 14 Arithmetic Operator.sql
```

---

# 🚀 Progress

✅ Day 14 Completed

**Next Topic ➜ Continue with the next SQL concept**
