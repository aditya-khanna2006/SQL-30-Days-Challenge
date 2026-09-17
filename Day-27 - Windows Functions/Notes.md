# 📅 Day 27 – Window Functions in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Understand Window Functions in SQL
* Assign unique row numbers using `ROW_NUMBER()`
* Rank rows using `DENSE_RANK()`
* Divide data into groups using `PARTITION BY`
* Sort rows inside a window using `ORDER BY`
* Calculate running totals using `SUM()`
* Calculate running averages using `AVG()`
* Perform calculations across related rows without grouping them into a single row

---

# 📌 Introduction

Window Functions are powerful SQL functions that allow us to perform calculations across a set of related rows while still keeping each individual row in the result.

Unlike `GROUP BY`, Window Functions do not combine multiple rows into one row.

For example, we can use Window Functions to:

* Rank products within each category
* Assign row numbers
* Calculate running totals
* Calculate running averages
* Compare rows within the same group

### Basic Syntax

    function_name() OVER (
        PARTITION BY column
        ORDER BY column
    )

The `OVER()` clause tells SQL that the function should work as a Window Function.

---

# 📌 Step 1 – View the Products Table

We first check the data in the `products` table.

### Example

    SELECT * FROM products;

---

# 📌 Step 2 – ROW_NUMBER()

`ROW_NUMBER()` assigns a unique sequential number to every row within a window.

### Example

    SELECT product_name, category, price,
           ROW_NUMBER() OVER (
               PARTITION BY category
               ORDER BY price DESC
           ) AS row_num
    FROM products;

### Explanation

* `ROW_NUMBER()` assigns a unique number to each product.
* `PARTITION BY category` creates a separate window for each category.
* `ORDER BY price DESC` sorts products from highest price to lowest price.
* Numbering starts again from `1` for every category.

### Example Result

| Product | Category | Price | Row Number |
|---|---|---:|---:|
| Laptop | Electronics | 60000 | 1 |
| Phone | Electronics | 30000 | 2 |
| Mouse | Electronics | 1500 | 3 |
| Chair | Furniture | 12000 | 1 |
| Table | Furniture | 10000 | 2 |

Each category gets its own numbering.

---

# 📌 Understanding PARTITION BY

`PARTITION BY` divides the result into separate groups for the Window Function.

For example:

    PARTITION BY category

means SQL creates a separate window for every category.

If the categories are:

    Electronics
    Furniture
    Accessories

the Window Function processes each category separately.

### Important

`PARTITION BY` does **not** remove rows.

Every original row remains in the result.

---

# 📌 Understanding ORDER BY in Window Functions

The `ORDER BY` inside `OVER()` determines the order in which the Window Function processes the rows.

For example:

    ORDER BY price DESC

means:

* Highest price comes first
* Lowest price comes last

While:

    ORDER BY price ASC

means:

* Lowest price comes first
* Highest price comes last

---

# 📌 Step 3 – DENSE_RANK()

`DENSE_RANK()` assigns rankings to rows based on the specified ordering.

### Example

    SELECT product_name, category, price,
           DENSE_RANK() OVER (
               PARTITION BY category
               ORDER BY price DESC
           ) AS row_num
    FROM products;

### Explanation

* Products are ranked within each category.
* The highest price receives rank `1`.
* Products with the same price receive the same rank.
* `DENSE_RANK()` does not skip ranking numbers after a tie.

### Example

Suppose prices are:

    50000
    40000
    40000
    30000

Using `DENSE_RANK()`:

| Price | Rank |
|---:|---:|
| 50000 | 1 |
| 40000 | 2 |
| 40000 | 2 |
| 30000 | 3 |

The next rank after the tie is `3`.

---

# 📌 ROW_NUMBER() vs DENSE_RANK()

These two Window Functions behave differently when duplicate values exist.

### ROW_NUMBER()

Every row receives a unique number.

    50000 → 1
    40000 → 2
    40000 → 3
    30000 → 4

### DENSE_RANK()

Rows with the same ordering value receive the same rank.

    50000 → 1
    40000 → 2
    40000 → 2
    30000 → 3

### Summary

| Function | Duplicate Values | Ranking |
|---|---|---|
| `ROW_NUMBER()` | Gets different numbers | 1, 2, 3, 4 |
| `DENSE_RANK()` | Gets the same rank | 1, 2, 2, 3 |

---

# 📌 Step 4 – Running Total Using SUM()

Window Functions can also calculate cumulative or running totals.

### Example

    SELECT product_name, category, price,
           SUM(price) OVER (
               PARTITION BY category
               ORDER BY price ASC
           ) AS Running_Total
    FROM products;

### Explanation

* `SUM(price)` calculates the total price.
* `PARTITION BY category` calculates the running total separately for each category.
* `ORDER BY price ASC` processes products from the lowest price to the highest price.
* Each row contains the cumulative total up to that point.

### Example

Suppose a category has:

| Product | Price |
|---|---:|
| Mouse | 1000 |
| Keyboard | 2000 |
| Monitor | 5000 |

The running total becomes:

| Product | Price | Running Total |
|---|---:|---:|
| Mouse | 1000 | 1000 |
| Keyboard | 2000 | 3000 |
| Monitor | 5000 | 8000 |

---

# 📌 Step 5 – Running Average Using AVG()

`AVG()` can also be used as a Window Function to calculate a cumulative average.

### Example

    SELECT product_name, category, price,
           AVG(price) OVER (
               PARTITION BY category
               ORDER BY price ASC
           ) AS Running_Average
    FROM products;

### Explanation

The query calculates the average price of all rows encountered so far within each category.

For example:

| Price | Running Average |
|---:|---:|
| 1000 | 1000 |
| 2000 | 1500 |
| 5000 | 2666.67 |

The average changes as more rows are included.

---

# 📊 Window Function Flow

    Products Table
          |
          ↓
    PARTITION BY category
          |
          ↓
    Create separate windows
          |
          ↓
    ORDER BY price
          |
          ↓
    Apply Window Function
          |
          ↓
    Return every original row
          |
          ↓
    Add calculated result

---

# 📊 Common Window Functions

| Function | Purpose |
|---|---|
| `ROW_NUMBER()` | Assigns a unique number to each row |
| `RANK()` | Assigns ranking and leaves gaps after ties |
| `DENSE_RANK()` | Assigns ranking without gaps |
| `SUM()` | Calculates totals or running totals |
| `AVG()` | Calculates averages or running averages |
| `COUNT()` | Counts rows within a window |
| `MIN()` | Finds minimum value within a window |
| `MAX()` | Finds maximum value within a window |

---

# 📌 Window Functions vs GROUP BY

Window Functions and `GROUP BY` are different.

### GROUP BY

`GROUP BY` combines rows into groups.

Example:

    SELECT category, SUM(price)
    FROM products
    GROUP BY category;

This returns one row per category.

### Window Function

    SELECT product_name, category, price,
           SUM(price) OVER (PARTITION BY category) AS category_total
    FROM products;

This keeps every product row while also showing the category total.

### Comparison

| GROUP BY | Window Function |
|---|---|
| Combines rows | Keeps individual rows |
| Usually returns fewer rows | Keeps original number of rows |
| Used for grouped summaries | Used for calculations across related rows |
| Uses `GROUP BY` | Uses `OVER()` |

---

# 💡 Best Practices

* Use `PARTITION BY` when calculations should restart for each group.
* Use `ORDER BY` inside `OVER()` when the calculation depends on row order.
* Use `ROW_NUMBER()` when every row needs a unique sequence number.
* Use `DENSE_RANK()` when equal values should receive the same rank.
* Use `SUM()` with `ORDER BY` to calculate running totals.
* Use `AVG()` with `ORDER BY` to calculate running averages.
* Remember that Window Functions do not remove individual rows.
* Give calculated columns meaningful aliases such as `row_num`, `Running_Total`, or `Running_Average`.

---

# 📝 Interview Questions

### 1. What is a Window Function?

**Answer:**  
A Window Function performs a calculation across a set of related rows while keeping each individual row in the result.

---

### 2. What is the purpose of `OVER()`?

**Answer:**  
`OVER()` defines the window of rows on which the Window Function operates.

---

### 3. What does `PARTITION BY` do?

**Answer:**  
`PARTITION BY` divides the rows into separate groups for the Window Function without combining or removing the rows.

---

### 4. What is the difference between `ROW_NUMBER()` and `DENSE_RANK()`?

**Answer:**  
`ROW_NUMBER()` gives every row a unique sequential number, while `DENSE_RANK()` gives the same rank to tied values and does not skip ranking numbers.

---

### 5. What happens when two products have the same price with `DENSE_RANK()`?

**Answer:**  
Both products receive the same rank.

For example:

    50000 → 1
    40000 → 2
    40000 → 2
    30000 → 3

---

### 6. Can aggregate functions like `SUM()` and `AVG()` be used as Window Functions?

**Answer:**  
Yes. Functions such as `SUM()`, `AVG()`, `COUNT()`, `MIN()`, and `MAX()` can be used with `OVER()`.

---

### 7. What is a running total?

**Answer:**  
A running total is a cumulative sum that increases as each row is processed.

---

### 8. What is the difference between `GROUP BY` and Window Functions?

**Answer:**  
`GROUP BY` combines rows into groups, while Window Functions perform calculations across related rows without removing the individual rows.

---

# 🎯 Key Takeaways

* Window Functions perform calculations across related rows.
* `OVER()` is used to define a Window Function.
* `PARTITION BY` creates separate windows for groups.
* `ORDER BY` controls the order within the window.
* `ROW_NUMBER()` assigns a unique number to each row.
* `DENSE_RANK()` assigns the same rank to tied values without gaps.
* `SUM()` can be used to calculate running totals.
* `AVG()` can be used to calculate running averages.
* Window Functions keep the original rows in the result.
* Window Functions are extremely useful for analytics and reporting.

---

# 💼 Real-World Use Case

Window Functions are commonly used in business reporting and data analysis.

For example, an e-commerce company can use `ROW_NUMBER()` to identify the most expensive products within each category.

    ROW_NUMBER() OVER (
        PARTITION BY category
        ORDER BY price DESC
    )

A company can also use `SUM()` to calculate cumulative sales over time or `AVG()` to monitor how the average price changes as more products are considered.

These techniques are frequently used for:

* Product ranking
* Sales analysis
* Performance reports
* Running totals
* Running averages
* Category-wise analysis
* Business dashboards

---

# 📂 Practice File

`Day 27 Window Functions.sql`

---

# 🚀 Progress

✅ Day 27 Completed

**Next Topic ➜ Continue with the next SQL concept**
