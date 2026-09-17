# 📅 Day 26 – COALESCE Function in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Add and remove columns using `ALTER TABLE`
* Add a new column with a numeric data type
* Set column values using `UPDATE`
* Store `NULL` values in a column
* Understand how `COALESCE()` handles `NULL` values
* Use `COALESCE()` to provide a fallback value
* Create a final price by using `discount_price` when available and `price` when it is `NULL`

---

# 📌 Introduction

In real-world databases, some columns may contain `NULL` values when information is missing or unavailable.

For example, a product may have a `discount_price`, while another product may not have any discount.

The `COALESCE()` function helps us handle these situations by returning the **first non-NULL value** from the given list of expressions.

### Basic Syntax

    COALESCE(value1, value2, value3, ...)

If `value1` is not `NULL`, it is returned.

If `value1` is `NULL`, SQL checks `value2`, then `value3`, and so on.

---

# 📌 Step 1 – View the Products Table

We first check the existing data in the `products` table.

### Example

    SELECT * FROM products;

This displays all columns and records from the `products` table.

---

# 📌 Step 2 – Remove the Existing Column

The existing `discount_price` column is removed before creating it again.

### Example

    ALTER TABLE products
    DROP COLUMN discount_price;

### Explanation

* `ALTER TABLE` is used to modify the structure of a table.
* `DROP COLUMN` removes a column from the table.
* The existing `discount_price` column is permanently removed along with its data.

---

# 📌 Step 3 – Add a New Discount Price Column

Now we create a new `discount_price` column.

### Example

    ALTER TABLE products
    ADD COLUMN discount_price NUMERIC(10,2);

### Explanation

* `NUMERIC(10,2)` is suitable for storing decimal values such as prices.
* `10` represents the total number of digits.
* `2` represents the number of digits after the decimal point.

For example:

    49999.99

---

# 📌 Step 4 – Set Discount Price to NULL

For `Laptop` and `Desk`, we intentionally keep the discount price unavailable.

### Example

    UPDATE products
    SET discount_price = NULL
    WHERE product_name IN ('Laptop','Desk');

### Explanation

The `IN` operator checks whether `product_name` matches any value from the provided list.

For these products:

* `discount_price` = `NULL`
* No discount price is available

---

# 📌 Step 5 – Calculate Discount Price

For all other products, we calculate a 10% discount.

### Example

    UPDATE products
    SET discount_price = price * 0.9
    WHERE product_name NOT IN ('Laptop','Desk');

### Explanation

* `price * 0.9` means the product receives a 10% discount.
* The resulting value is stored in `discount_price`.
* `NOT IN` excludes `Laptop` and `Desk` from the update.

For example:

    Original Price = 50,000
    Discount Price = 50,000 × 0.9
                   = 45,000

---

# 📌 Step 6 – View Price and Discount Price

Now we can compare the original price with the discount price.

### Example

    SELECT product_name, price, discount_price
    FROM products;

This allows us to identify products where:

* A discount price exists
* The discount price is `NULL`

---

# 📌 Step 7 – Using COALESCE()

Now we use `COALESCE()` to create a `Final_price`.

### Example

    SELECT product_name,
           COALESCE(discount_price, price) AS Final_price
    FROM products;

### Explanation

The query checks `discount_price` first.

* If `discount_price` is available → it is returned.
* If `discount_price` is `NULL` → the original `price` is returned.

This gives us a final price for every product.

---

# 📊 COALESCE() Flow

    discount_price
           |
           ↓
       Is it NULL?
        /       \
      No         Yes
      |           |
      ↓           ↓
    Return      Check price
    discount       |
    price          ↓
               Return price

---

# 📌 Example

Suppose the data is:

| Product | Price | Discount Price |
|---|---:|---:|
| Laptop | 60000 | NULL |
| Phone | 30000 | 27000 |

Using:

    COALESCE(discount_price, price)

The result will be:

| Product | Final Price |
|---|---:|
| Laptop | 60000 |
| Phone | 27000 |

For `Laptop`, the discount price is `NULL`, so the original price is used.

For `Phone`, the discount price exists, so it is used.

---

# 📌 COALESCE() with Multiple Values

`COALESCE()` can check more than two values.

### Example

    SELECT COALESCE(discount_price, price, 0) AS Final_price
    FROM products;

The function checks values from left to right:

    discount_price → price → 0

It returns the first value that is not `NULL`.

---

# 📌 NULL vs Zero

It is important to understand that `NULL` and `0` are different.

* `NULL` means the value is missing or unknown.
* `0` is an actual numeric value.

For example:

    discount_price = NULL

means no discount price is available.

Whereas:

    discount_price = 0

means the discount price is explicitly zero.

`COALESCE()` replaces `NULL` values, not zero values.

---

# 📊 COALESCE() Summary

| Situation | Result |
|---|---|
| `discount_price` has a value | `discount_price` |
| `discount_price` is `NULL` | `price` |
| Both values are `NULL` | `NULL` |
| `COALESCE(discount_price, price, 0)` | First non-NULL value |

---

# 📌 Important SQL Commands Used

| Command / Function | Purpose |
|---|---|
| `SELECT` | Retrieve data |
| `ALTER TABLE` | Modify table structure |
| `DROP COLUMN` | Remove a column |
| `ADD COLUMN` | Add a new column |
| `UPDATE` | Modify existing records |
| `IN` | Match values from a list |
| `NOT IN` | Exclude values from a list |
| `NULL` | Represents missing/unknown data |
| `COALESCE()` | Returns the first non-NULL value |

---

# 💡 Best Practices

* Use `COALESCE()` when you need a fallback value for `NULL`.
* Remember that `NULL` is different from `0` or an empty string.
* Use appropriate numeric data types for financial values.
* Always use a `WHERE` clause carefully with `UPDATE`.
* Before updating data, use `SELECT` to verify which rows will be affected.
* Use meaningful aliases such as `Final_price` for calculated columns.
* Remember that `COALESCE()` evaluates values from left to right.

---

# 📝 Interview Questions

### 1. What is the purpose of `COALESCE()`?

**Answer:**  
`COALESCE()` returns the first non-NULL value from a list of expressions.

---

### 2. What happens if the first value in `COALESCE()` is NULL?

**Answer:**  
SQL checks the next value and returns the first value that is not `NULL`.

---

### 3. What is the difference between NULL and 0?

**Answer:**  
`NULL` represents a missing or unknown value, while `0` is an actual numeric value.

---

### 4. What will this query return?

    SELECT COALESCE(NULL, 100);

**Answer:**  
It returns `100` because `100` is the first non-NULL value.

---

### 5. What will this query return?

    SELECT COALESCE(NULL, NULL, 500);

**Answer:**  
It returns `500`.

---

### 6. Can `COALESCE()` accept more than two values?

**Answer:**  
Yes. `COALESCE()` can accept multiple expressions and returns the first non-NULL value.

---

### 7. Why is `COALESCE()` useful in data analysis?

**Answer:**  
It helps handle missing values and provides fallback values, making query results more complete and useful.

---

### 8. What does `NUMERIC(10,2)` mean?

**Answer:**  
It allows a maximum of 10 total digits, with 2 digits after the decimal point.

---

# 🎯 Key Takeaways

* `COALESCE()` is used to handle `NULL` values.
* It returns the first non-NULL value.
* It can be used with two or multiple expressions.
* `NULL` is different from `0`.
* `ALTER TABLE` can modify the structure of an existing table.
* `UPDATE` is used to modify existing records.
* `IN` and `NOT IN` help filter records based on a list of values.
* `COALESCE(discount_price, price)` is useful for creating a reliable final price.

---

# 💼 Real-World Use Case

`COALESCE()` is commonly used in e-commerce and business applications.

For example, a product may have:

* A discounted price
* An original price when no discount is available

Instead of displaying a blank value when `discount_price` is `NULL`, we can use:

    COALESCE(discount_price, price) AS Final_price

This ensures that every product has a usable price in the query result.

---

# 📂 Practice File

`Day 26 COALESCE Function.sql`

---

# 🚀 Progress

✅ Day 26 Completed

**Next Topic ➜ Continue with the next SQL concept**
