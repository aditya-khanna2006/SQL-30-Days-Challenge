# 📅 Day 24 – CASE Function in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Use the `CASE` function in SQL
* Apply conditions using `WHEN`
* Define results using `THEN`
* Handle multiple conditions
* Use `ELSE` for default results
* Create calculated columns using `CASE`
* Categorize data based on conditions
* Use `CASE` with product prices

---

# 📌 Introduction

The `CASE` function in SQL is used to apply conditional logic to data.

It works similarly to an **IF-ELSE statement** in programming.

The `CASE` function checks conditions one by one and returns a result when a condition is satisfied.

It is commonly used for:

* Categorizing data
* Creating labels
* Applying conditional logic
* Creating calculated columns
* Grouping values into meaningful categories
* Data analysis and reporting

The basic structure of a `CASE` expression is:

    CASE
        WHEN condition THEN result
        WHEN condition THEN result
        ELSE result
    END

---

# 📌 CASE Function Syntax

### Syntax

    CASE
        WHEN condition THEN result
        WHEN condition THEN result
        ELSE result
    END

### Explanation

* `CASE` starts the conditional expression.
* `WHEN` defines a condition.
* `THEN` defines the result if the condition is true.
* Multiple `WHEN` conditions can be used.
* `ELSE` provides a default result when none of the conditions are true.
* `END` closes the `CASE` expression.

---

# 📌 Using CASE with Product Price

Suppose we want to categorize products based on their price.

We can create three categories:

* **Expensive** → Price greater than 50,000
* **Moderate** → Price between 10,000 and 49,999
* **Affordable** → Price less than 10,000

### Example

    SELECT product_name,
           price,
           CASE
               WHEN price > 50000 THEN 'Expensive'
               WHEN price >= 10000 AND price <= 49999 THEN 'Moderate'
               ELSE 'Affordable'
           END AS price_category
    FROM products;

Here, the `CASE` expression creates a new calculated column called `price_category`.

---

# 📌 Understanding WHEN and THEN

The `WHEN` keyword is used to specify a condition.

The `THEN` keyword specifies what should be returned when that condition is true.

### Example

    CASE
        WHEN price > 50000 THEN 'Expensive'
    END

If the product price is greater than 50,000, SQL returns:

    Expensive

For example:

    Price = 75000 → Expensive

---

# 📌 Using Multiple WHEN Conditions

A `CASE` expression can contain multiple conditions.

### Example

    SELECT product_name,
           price,
           CASE
               WHEN price > 50000 THEN 'Expensive'
               WHEN price >= 10000 AND price <= 49999 THEN 'Moderate'
               ELSE 'Affordable'
           END AS price_category
    FROM products;

The conditions are checked from **top to bottom**.

For example:

    Price = 75000
       ↓
    price > 50000
       ↓
    TRUE
       ↓
    Expensive

Another example:

    Price = 25000
       ↓
    price > 50000
       ↓
    FALSE
       ↓
    price >= 10000 AND price <= 49999
       ↓
    TRUE
       ↓
    Moderate

And:

    Price = 5000
       ↓
    price > 50000
       ↓
    FALSE
       ↓
    price >= 10000 AND price <= 49999
       ↓
    FALSE
       ↓
    ELSE
       ↓
    Affordable

---

# 📌 Using ELSE in CASE

The `ELSE` clause is used to define a default result.

### Example

    SELECT product_name,
           price,
           CASE
               WHEN price > 50000 THEN 'Expensive'
               WHEN price >= 10000 AND price <= 49999 THEN 'Moderate'
               ELSE 'Affordable'
           END AS price_category
    FROM products;

If none of the `WHEN` conditions are true, the `ELSE` result is returned.

In this example:

    Price < 10,000 → Affordable

The `ELSE` clause helps ensure that every product receives a category.

---

# 📌 CASE with a Calculated Column

The result of a `CASE` expression can be given an alias.

### Example

    SELECT product_name,
           price,
           CASE
               WHEN price > 50000 THEN 'Expensive'
               WHEN price >= 10000 AND price <= 49999 THEN 'Moderate'
               ELSE 'Affordable'
           END AS price_category
    FROM products;

Here:

    price_category

is a calculated column created using the `CASE` expression.

The original `products` table is not changed.

---

# 📊 CASE Function Flow

    Product Price
         │
         ▼
    CASE
         │
         ├── price > 50,000
         │       │
         │       └──► Expensive
         │
         ├── price between 10,000 and 49,999
         │       │
         │       └──► Moderate
         │
         └── ELSE
                 │
                 └──► Affordable

---

# 📌 Important Note About Conditions

The conditions inside a `CASE` expression are evaluated from **top to bottom**.

For example:

    CASE
        WHEN price > 50000 THEN 'Expensive'
        WHEN price >= 10000 THEN 'Moderate'
        ELSE 'Affordable'
    END

SQL checks the first condition first.

Once a condition becomes true, SQL returns its result and does not continue checking the remaining conditions.

Therefore, the **order of conditions matters**.

---

# 📌 CASE Function Summary

| Keyword / Part | Purpose |
| -------------- | ------- |
| `CASE` | Starts the conditional expression |
| `WHEN` | Defines a condition |
| `THEN` | Defines the result |
| `ELSE` | Provides a default result |
| `END` | Ends the `CASE` expression |

---

# 💡 Best Practices

* Use meaningful aliases for calculated columns.
* Keep `CASE` conditions clear and easy to understand.
* Remember that `WHEN` conditions are checked from top to bottom.
* Use `ELSE` when a default result is required.
* Keep related conditions together.
* Check the boundaries of numeric conditions carefully.
* Use `CASE` for categorization and conditional calculations.
* Avoid unnecessary complexity inside a `CASE` expression.

---

# 📝 Interview Questions

### 1. What is the `CASE` function in SQL?

**Answer:** The `CASE` function is used to apply conditional logic in SQL and return different results based on specified conditions.

### 2. Which keyword is used to specify a condition in `CASE`?

**Answer:** `WHEN`

### 3. Which keyword defines the result when a condition is true?

**Answer:** `THEN`

### 4. What is the purpose of `ELSE` in a `CASE` expression?

**Answer:** `ELSE` provides a default result when none of the `WHEN` conditions are true.

### 5. Which keyword is used to close a `CASE` expression?

**Answer:** `END`

### 6. Can a `CASE` expression have multiple `WHEN` conditions?

**Answer:** Yes, a `CASE` expression can contain multiple `WHEN` conditions.

### 7. In what order are `WHEN` conditions evaluated?

**Answer:** `WHEN` conditions are evaluated from top to bottom.

### 8. Can `CASE` be used to create a calculated column?

**Answer:** Yes, `CASE` can be used to create a calculated column in the query result.

---

# 🎯 Key Takeaways

* The `CASE` function is used for conditional logic in SQL.
* `WHEN` defines a condition.
* `THEN` defines the result when the condition is true.
* Multiple `WHEN` conditions can be used.
* `ELSE` provides a default result.
* `END` closes the `CASE` expression.
* Conditions are evaluated from top to bottom.
* `CASE` can be used to categorize data.
* `CASE` can create calculated columns without modifying the original table.

---

# 💼 Real-World Use Case

The `CASE` function is commonly used in data analysis and reporting.

For example, an e-commerce company can categorize products based on price:

    Price > 50,000
          ↓
      Expensive

    10,000 – 49,999
          ↓
      Moderate

    Price < 10,000
          ↓
      Affordable

This makes raw numerical data easier to understand and analyze.

Similarly, `CASE` can be used to:

* Categorize customers based on spending
* Classify employees based on salary
* Label orders based on order value
* Identify high-value products
* Create performance categories
* Convert numerical values into meaningful business labels

---

# 📂 Practice File

    Day 24 CASE Function.sql

---

# 🚀 Progress

✅ Day 24 Completed

**Next Topic ➜ Continue with the next SQL concept**
