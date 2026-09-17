# 📅 Day 25 – CASE with AND, OR & LIKE Operators in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Use `CASE` with `AND` and `OR` operators
* Classify products based on available quantity
* Create stock status categories
* Use comparison operators inside `CASE`
* Use `CASE` with the `LIKE` operator
* Classify products based on category names
* Use pattern matching with `LIKE`
* Create calculated columns using conditional logic

---

# 📌 Introduction

The `CASE` function can be combined with SQL operators such as `AND`, `OR`, and `LIKE` to create more flexible conditional logic.

This is useful when we need to classify or categorize data based on multiple conditions.

For example, we can use `CASE` to:

* Identify products that are in stock
* Find products with limited stock
* Identify products that are running out of stock
* Classify products based on their category
* Search for specific patterns in text values
* Create meaningful labels from existing data

Some commonly used operators with `CASE` are:

* `AND`
* `OR`
* `LIKE`
* `>=`
* `<=`
* `=`

---

# 📌 CASE with AND Operator

The `AND` operator is used when **multiple conditions must be true**.

Suppose we want to classify products based on their available quantity.

We can create three categories:

* **In Stock** → Quantity is 10 or more
* **Limited Stock** → Quantity is between 5 and 9
* **Out of Stock** → Quantity is less than 5

### Example

    SELECT product_name,
           quantity,
           CASE
               WHEN quantity >= 10 THEN 'In Stock'
               WHEN quantity >= 5 AND quantity <= 9 THEN 'Limited Stock'
               ELSE 'Out of Stock'
           END AS stock_details
    FROM products;

Here, the `AND` operator checks whether the quantity is both greater than or equal to 5 and less than or equal to 9.

---

# 📌 Understanding AND Operator

The `AND` operator returns `TRUE` only when **both conditions are true**.

For example:

    quantity >= 5 AND quantity <= 9

This means:

    Quantity must be 5 or more
             AND
    Quantity must be 9 or less

Examples:

    Quantity = 7
        ↓
    7 >= 5 → TRUE
    7 <= 9 → TRUE
        ↓
    Limited Stock

But:

    Quantity = 3
        ↓
    3 >= 5 → FALSE
        ↓
    Condition is FALSE

Therefore, the next condition or `ELSE` is checked.

---

# 📌 Stock Status Classification

We can use `CASE` to classify products according to their available quantity.

### Example

    SELECT product_name,
           quantity,
           CASE
               WHEN quantity >= 10 THEN 'In Stock'
               WHEN quantity >= 5 AND quantity <= 9 THEN 'Limited Stock'
               ELSE 'Out of Stock'
           END AS stock_details
    FROM products;

The classification works as follows:

    Quantity >= 10
          ↓
      In Stock

    Quantity 5 – 9
          ↓
      Limited Stock

    Quantity < 5
          ↓
      Out of Stock

This creates a new calculated column called `stock_details`.

---

# 📌 CASE with OR Operator

The `OR` operator is used when **at least one condition must be true**.

For example, suppose we want to classify products as electronic items when the category contains either `Electronics` or another related category.

### Syntax

    CASE
        WHEN condition1 OR condition2 THEN result
        ELSE result
    END

The `OR` operator returns `TRUE` when at least one of its conditions is true.

### Example

    CASE
        WHEN category = 'Electronics'
             OR category = 'Furniture'
        THEN 'Selected Item'
        ELSE 'Other Item'
    END

This checks whether the category is either `Electronics` or `Furniture`.

---

# 📌 CASE with LIKE Operator

The `LIKE` operator is used for **pattern matching** in SQL.

It is commonly used when we want to check whether a text value starts with, ends with, or contains a specific pattern.

### Example

    SELECT product_name,
           category,
           CASE
               WHEN category LIKE 'Electronics%' THEN 'Electronic Item'
               WHEN category LIKE 'Furniture%' THEN 'Furniture Item'
               ELSE 'Accessory Item'
           END AS category_distribution
    FROM products;

Here, `LIKE` is used to check the category name.

---

# 📌 Understanding LIKE with %

The `%` wildcard represents **zero or more characters**.

For example:

    category LIKE 'Electronics%'

This means the category should start with:

    Electronics

Examples that match:

    Electronics
    Electronics Accessories
    Electronics Devices

The `%` allows additional characters after `Electronics`.

Similarly:

    category LIKE 'Furniture%'

matches categories that start with:

    Furniture

---

# 📌 Category Classification using LIKE

We can classify products based on their category.

### Example

    SELECT product_name,
           category,
           CASE
               WHEN category LIKE 'Electronics%' THEN 'Electronic Item'
               WHEN category LIKE 'Furniture%' THEN 'Furniture Item'
               ELSE 'Accessory Item'
           END AS category_distribution
    FROM products;

The result can be categorized as:

    Electronics...
          ↓
    Electronic Item

    Furniture...
          ↓
    Furniture Item

    Anything else
          ↓
    Accessory Item

---

# 📌 CASE with Multiple Conditions

`CASE` can contain multiple `WHEN` conditions.

Each condition is evaluated from **top to bottom**.

### Example

    SELECT product_name,
           quantity,
           CASE
               WHEN quantity >= 10 THEN 'In Stock'
               WHEN quantity >= 5 AND quantity <= 9 THEN 'Limited Stock'
               ELSE 'Out of Stock'
           END AS stock_details
    FROM products;

SQL checks:

    First condition
         ↓
    If FALSE
         ↓
    Second condition
         ↓
    If FALSE
         ↓
    ELSE

Once a condition is `TRUE`, its corresponding `THEN` result is returned.

---

# 📊 CASE with Operators Flow

    Product Data
         │
         ▼
       CASE
         │
         ├── AND
         │     └──► Check multiple conditions
         │
         ├── OR
         │     └──► Check alternative conditions
         │
         └── LIKE
               └──► Match text patterns

---

# 📊 Stock Classification Flow

    Product Quantity
          │
          ▼
        CASE
          │
          ├── quantity >= 10
          │       │
          │       └──► In Stock
          │
          ├── quantity >= 5 AND quantity <= 9
          │       │
          │       └──► Limited Stock
          │
          └── ELSE
                  │
                  └──► Out of Stock

---

# 📊 Category Classification Flow

    Product Category
          │
          ▼
        CASE
          │
          ├── Electronics%
          │       │
          │       └──► Electronic Item
          │
          ├── Furniture%
          │       │
          │       └──► Furniture Item
          │
          └── ELSE
                  │
                  └──► Accessory Item

---

# 📌 Operators Used with CASE

| Operator | Purpose |
| -------- | ------- |
| `AND` | All conditions must be true |
| `OR` | At least one condition must be true |
| `LIKE` | Matches a text pattern |
| `>=` | Greater than or equal to |
| `<=` | Less than or equal to |
| `=` | Checks equality |

---

# 📌 LIKE Wildcard Summary

| Pattern | Meaning |
| ------- | ------- |
| `'Electronics%'` | Starts with `Electronics` |
| `'%Electronics'` | Ends with `Electronics` |
| `'%Electronics%'` | Contains `Electronics` |
| `'E%'` | Starts with `E` |
| `'%s'` | Ends with `s` |

---

# 💡 Best Practices

* Use `AND` when all specified conditions must be true.
* Use `OR` when any one of the conditions can be true.
* Use `LIKE` for pattern matching in text values.
* Use `%` carefully when creating `LIKE` patterns.
* Remember that `CASE` conditions are evaluated from top to bottom.
* Put more specific conditions before broader conditions when necessary.
* Use meaningful aliases for calculated columns.
* Check numeric boundaries carefully when creating categories.
* Use `ELSE` to handle values that do not match the specified conditions.

---

# 📝 Interview Questions

### 1. What is the purpose of using `AND` inside a `CASE` expression?

**Answer:** `AND` is used when multiple conditions must be true for the `WHEN` condition to be satisfied.

### 2. What is the purpose of the `OR` operator?

**Answer:** `OR` is used when at least one of multiple conditions must be true.

### 3. What is the `LIKE` operator used for?

**Answer:** The `LIKE` operator is used for pattern matching in text values.

### 4. What does `%` mean in a `LIKE` pattern?

**Answer:** `%` represents zero or more characters.

### 5. What does `category LIKE 'Electronics%'` mean?

**Answer:** It checks whether the category starts with `Electronics`.

### 6. Can `CASE` be used with `AND` and `OR` operators?

**Answer:** Yes, `CASE` can be combined with `AND` and `OR` to create multiple conditions.

### 7. How are multiple `WHEN` conditions evaluated?

**Answer:** They are evaluated from top to bottom, and the result of the first matching condition is returned.

### 8. What happens when none of the `WHEN` conditions are true?

**Answer:** The `ELSE` result is returned. If `ELSE` is not provided, the `CASE` expression returns `NULL`.

---

# 🎯 Key Takeaways

* `CASE` can be combined with different SQL operators.
* `AND` checks whether multiple conditions are true.
* `OR` checks whether at least one condition is true.
* `LIKE` is used for text pattern matching.
* `%` represents zero or more characters in a `LIKE` pattern.
* Multiple `WHEN` conditions can be used inside `CASE`.
* `CASE` conditions are evaluated from top to bottom.
* `ELSE` provides a default result.
* `CASE` can be used to classify products based on quantity or category.
* `CASE` creates calculated results without modifying the original table.

---

# 💼 Real-World Use Case

`CASE` with operators is commonly used in data analysis, inventory management, and reporting.

For example, an e-commerce company can classify products based on stock quantity:

    Quantity >= 10
          ↓
      In Stock

    Quantity 5 – 9
          ↓
      Limited Stock

    Quantity < 5
          ↓
      Out of Stock

The company can also classify products based on their categories:

    Electronics...
          ↓
    Electronic Item

    Furniture...
          ↓
    Furniture Item

    Other Categories
          ↓
    Accessory Item

This makes raw product data easier to understand and useful for business reporting.

Similarly, `CASE` with `AND`, `OR`, and `LIKE` can be used to:

* Identify products with low inventory
* Classify customers based on multiple conditions
* Categorize employees based on salary and department
* Create order status categories
* Identify specific product categories
* Build business reports and dashboards

---

# 📂 Practice File

    Day 25 CASE with AND OR and LIKE.sql

---

# 🚀 Progress

✅ Day 25 Completed

**Next Topic ➜ Continue with the next SQL concept**
