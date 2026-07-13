# 📅 Day 6 – Data Types and Constraints in SQL

## 🎯 Learning Objectives

In this lesson, I learned:

- What SQL data types are
- Different categories of data types
- When to use each data type
- What constraints are
- Common PostgreSQL constraints and their purpose
- How constraints help maintain data integrity

---

# 📌 Introduction

Before creating a table, we need to decide what type of data each column will store.

SQL provides **Data Types** to define the kind of values a column can hold.

It also provides **Constraints** to ensure that only valid and accurate data is stored in the database.

---

# 📊 SQL Data Types

Data types define the nature of data that can be stored in a column.

```
                 SQL Data Types
                       │
 ┌────────────┬─────────────┬─────────────┬────────────┐
 │            │             │             │
 Numeric   Character   Date & Time   Boolean
```

---

# 🔢 Numeric Data Types

Numeric data types store numbers.

| Data Type | Description | Example Use |
|-----------|-------------|-------------|
| INTEGER | Stores whole numbers | Age, Quantity |
| SERIAL | Auto-increment integer | Employee ID |
| BIGINT | Stores very large integers | Population |
| NUMERIC(p,s) | Exact decimal values | Salary |
| REAL | Single precision decimal | Scientific calculations |
| DOUBLE PRECISION | High precision decimal | Financial calculations |

### Example

```sql
salary NUMERIC(10,2)
age INTEGER
employee_id SERIAL
```

---

# 🔤 Character Data Types

Character data types store text.

| Data Type | Description | Example |
|-----------|-------------|---------|
| CHAR(n) | Fixed-length text | Employee Code |
| VARCHAR(n) | Variable-length text | Name, Email |
| TEXT | Unlimited text | Description |

### Example

```sql
name VARCHAR(100)
email VARCHAR(150)
description TEXT
```

---

# 📅 Date & Time Data Types

These data types store dates and time values.

| Data Type | Purpose |
|-----------|---------|
| DATE | Stores only date |
| TIME | Stores only time |
| TIMESTAMP | Stores date and time |
| TIMESTAMPTZ | Date & time with timezone |
| INTERVAL | Stores time duration |

### Example

```sql
hire_date DATE
created_at TIMESTAMP
```

---

# ✅ Boolean Data Type

The BOOLEAN data type stores logical values.

Possible values:

- TRUE
- FALSE
- NULL

### Example

```sql
is_active BOOLEAN
```

---

# 📌 What are Constraints?

Constraints are rules applied to table columns.

They ensure that only valid, accurate, and consistent data is stored.

Without constraints, incorrect or duplicate data can easily enter the database.

---

# 🔒 Types of Constraints

## 1️⃣ NOT NULL

Ensures a column cannot contain NULL values.

```sql
name VARCHAR(100) NOT NULL
```

---

## 2️⃣ UNIQUE

Prevents duplicate values.

```sql
email VARCHAR(100) UNIQUE
```

---

## 3️⃣ PRIMARY KEY

Uniquely identifies each record.

Features:

- Unique
- Not NULL
- One Primary Key per table

```sql
employee_id SERIAL PRIMARY KEY
```

---

## 4️⃣ FOREIGN KEY

Creates a relationship between two tables.

It ensures that values exist in the referenced table.

Example:

```sql
department_id INT
REFERENCES department(department_id)
```

---

## 5️⃣ CHECK

Restricts values based on a condition.

```sql
age INT CHECK(age >= 18)
```

---

## 6️⃣ DEFAULT

Assigns a default value if no value is provided.

```sql
registration_date DATE
DEFAULT CURRENT_DATE
```

---

# 📊 Constraint Summary

| Constraint | Purpose |
|------------|---------|
| NOT NULL | Prevents empty values |
| UNIQUE | Prevents duplicate values |
| PRIMARY KEY | Identifies each row uniquely |
| FOREIGN KEY | Maintains relationships between tables |
| CHECK | Validates data using conditions |
| DEFAULT | Assigns default values automatically |

---

# 🏗 Example Table

```sql
CREATE TABLE students(

student_id SERIAL PRIMARY KEY,

name VARCHAR(100) NOT NULL,

email VARCHAR(100) UNIQUE,

age INT CHECK(age >= 18),

registration_date DATE DEFAULT CURRENT_DATE

);
```

---

# 📈 How Constraints Work

```
User Input
      │
      ▼
Constraint Check
      │
 ┌────┴────┐
 │         │
Valid   Invalid
 │         │
 ▼         ▼
Stored   Rejected
```

---

# 💡 Best Practices

✅ Choose appropriate data types.

✅ Use PRIMARY KEY for every table.

✅ Make mandatory fields NOT NULL.

✅ Use UNIQUE for Email and Username.

✅ Use CHECK to validate business rules.

✅ Use DEFAULT where suitable.

---

# 📝 Interview Questions

### 1. What is the purpose of SQL data types?

**Answer:**

They define what kind of data can be stored in a column.

---

### 2. Difference between CHAR and VARCHAR?

| CHAR | VARCHAR |
|------|----------|
| Fixed length | Variable length |
| Faster for fixed values | Saves storage space |

---

### 3. Why do we use PRIMARY KEY?

It uniquely identifies every row.

---

### 4. Difference between PRIMARY KEY and UNIQUE?

PRIMARY KEY does not allow NULL values and only one can exist per table.

UNIQUE prevents duplicate values, and multiple UNIQUE constraints can exist.

---

### 5. Why are constraints important?

They maintain data accuracy, consistency, and integrity.

---

# 🎯 Key Takeaways

- Data types define what data can be stored.
- Selecting the correct data type improves efficiency.
- Constraints enforce data validation rules.
- PRIMARY KEY uniquely identifies records.
- FOREIGN KEY maintains relationships.
- CHECK and DEFAULT improve data quality.

---

# 💼 Real-World Use Case

Banks, hospitals, schools, and e-commerce platforms use data types and constraints to ensure accurate and reliable data storage.

Example:

- Employee IDs should always be unique.
- Customer email addresses should not be duplicated.
- Product prices should never be negative.
- Student age should satisfy eligibility criteria.

---

# 📂 Practice File

The SQL code for this lesson is available in:

```
Day 6 Data Type and constraints.sql
```

---

# 🚀 Progress

✅ Day 6 Completed

**Next Topic ➜ Retrieving Data Using SELECT Statement**
