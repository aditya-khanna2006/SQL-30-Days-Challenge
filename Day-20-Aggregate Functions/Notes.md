# 📅 Day 20 – Aggregate Functions in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Understand Aggregate Functions in SQL
* Calculate the total using `SUM()`
* Count records using `COUNT()`
* Calculate average values using `AVG()`
* Find the maximum value using `MAX()`
* Find the minimum value using `MIN()`
* Use Aggregate Functions with conditions
* Use `WHERE` with Aggregate Functions

---

# 📌 Introduction

Aggregate Functions in SQL are used to perform calculations on multiple rows and return a **single result**.

They are commonly used for data analysis and reporting.

The main Aggregate Functions are:

* `SUM()` – Calculates the total
* `COUNT()` – Counts records
* `AVG()` – Calculates the average
* `MAX()` – Finds the highest value
* `MIN()` – Finds the lowest value

---

# 📌 Creating the Products Table

For this lesson, a `products` table was created.

```sql
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10, 2),
    quantity INT,
    added_date DATE,
    discount_rate NUMERIC(5, 2)
);
```

The table contains product information such as:

* Product name
* Category
* Price
* Quantity
* Added date
* Discount rate

---

# 📌 SUM() Function

The `SUM()` function calculates the total of a numeric column.

### Example

```sql
SELECT SUM(quantity) AS total_quantity
FROM products;
```

This calculates the **total quantity available** across all products.

---

# 📌 COUNT() Function

The `COUNT()` function counts the number of records.

### Example

```sql
SELECT COUNT(*) AS total_product
FROM products;
```

This returns the **total number of products** in the table.

---

# 📌 COUNT() with Condition

`COUNT()` can also be used with a `WHERE` condition.

```sql
SELECT COUNT(*) AS total_products
FROM products
WHERE product_name LIKE '%phone%';
```

This counts products whose name contains the word **"phone"**.

The `%` wildcard allows characters to appear before and after `phone`.

---

# 📌 AVG() Function

The `AVG()` function calculates the average value of a numeric column.

### Example

```sql
SELECT AVG(price) AS average_price
FROM products;
```

This calculates the **average price of all products**.

---

# 📌 AVG() with Condition

Aggregate Functions can be combined with the `WHERE` clause.

```sql
SELECT AVG(price) AS average_price
FROM products
WHERE category = 'Accessories'
   OR added_date > '2024-02-01';
```

This calculates the average price of products where:

* The category is `Accessories`

**OR**

* The product was added after `2024-02-01`

---

# 📌 MAX() and MIN() Functions

The `MAX()` function returns the highest value.

The `MIN()` function returns the lowest value.

### Example

```sql
SELECT
    MAX(price) AS maximum_price,
    MIN(price) AS minimum_price
FROM products;
```

This returns the **highest and lowest product prices**.

---

# 📊 Aggregate Functions Flow

```text
Multiple Rows
     │
     ▼
Aggregate Function
     │
     ├── SUM()   ──► Total
     │
     ├── COUNT() ──► Number of Records
     │
     ├── AVG()   ──► Average
     │
     ├── MAX()   ──► Highest Value
     │
     └── MIN()   ──► Lowest Value
     │
     ▼
Single Result
```

---

# 📌 Aggregate Functions Summary

| Function  | Purpose             | Example         |
| --------- | ------------------- | --------------- |
| `SUM()`   | Calculates total    | `SUM(quantity)` |
| `COUNT()` | Counts records      | `COUNT(*)`      |
| `AVG()`   | Calculates average  | `AVG(price)`    |
| `MAX()`   | Finds maximum value | `MAX(price)`    |
| `MIN()`   | Finds minimum value | `MIN(price)`    |

---

# 💡 Best Practices

* Use Aggregate Functions for calculations across multiple rows.
* Use meaningful aliases for calculated results.
* Use `WHERE` when you need to calculate results for specific records.
* Use the correct Aggregate Function according to the requirement.
* Verify the data before performing calculations.

---

# 📝 Interview Questions

### 1. What are Aggregate Functions in SQL?

Aggregate Functions perform calculations on multiple rows and return a single result.

### 2. Which function is used to calculate the total?

**Answer:** `SUM()`

### 3. Which function is used to count records?

**Answer:** `COUNT()`

### 4. Which function is used to calculate the average?

**Answer:** `AVG()`

### 5. Which functions are used to find the highest and lowest values?

**Answer:** `MAX()` and `MIN()`

### 6. Can Aggregate Functions be used with WHERE?

**Answer:** Yes.

For example:

```sql
SELECT AVG(price)
FROM products
WHERE category = 'Accessories';
```

---

# 🎯 Key Takeaways

* Aggregate Functions perform calculations on multiple rows.
* `SUM()` calculates totals.
* `COUNT()` counts records.
* `AVG()` calculates averages.
* `MAX()` finds the highest value.
* `MIN()` finds the lowest value.
* Aggregate Functions can be combined with `WHERE` conditions.
* Aliases make calculated results easier to understand.

---

# 💼 Real-World Use Case

Aggregate Functions are widely used in business data analysis.

For example, a company can calculate total inventory, count the number of products, find the average product price, and identify the most expensive and least expensive products.

---

# 📂 Practice File

```text
Day 20 Aggregate Function.sql
```

---

# 🚀 Progress

✅ Day 20 Completed

**Next Topic ➜ Continue with the next SQL concept**
