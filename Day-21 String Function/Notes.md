# 📅 Day 21 – String Functions in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Convert text to uppercase using `UPPER()`
* Convert text to lowercase using `LOWER()`
* Combine strings using `CONCAT()`
* Extract characters using `SUBSTRING()`
* Find the length of a string using `LENGTH()`
* Remove leading and trailing spaces using `TRIM()`
* Replace text using `REPLACE()`
* Extract characters from the right side using `RIGHT()`

---

# 📌 Introduction

String Functions in SQL are used to work with and manipulate text values.

They are useful for cleaning data, formatting text, combining columns, extracting parts of strings, and replacing unwanted text.

Some commonly used String Functions are:

* `UPPER()`
* `LOWER()`
* `CONCAT()`
* `SUBSTRING()`
* `LENGTH()`
* `TRIM()`
* `REPLACE()`
* `RIGHT()`

---

# 📌 UPPER() Function

The `UPPER()` function converts text into **uppercase**.

### Example

```sql id="3w6q0j"
SELECT UPPER(category) AS cat_cap
FROM products;
```

This converts all category names to uppercase.

Example:

```text
Electronics → ELECTRONICS
Furniture   → FURNITURE
```

---

# 📌 LOWER() Function

The `LOWER()` function converts text into **lowercase**.

### Example

```sql id="zv6y4v"
SELECT LOWER(category) AS cat_cap
FROM products;
```

This converts all category names to lowercase.

Example:

```text
Electronics → electronics
Furniture   → furniture
```

---

# 📌 CONCAT() Function

The `CONCAT()` function is used to combine two or more strings.

### Example

```sql id="e2o6bc"
SELECT CONCAT(product_name, '-', category) AS products_details
FROM products;
```

This combines the product name and category with a hyphen.

Example:

```text
Laptop-Electronics
Desk-Furniture
Mouse-Accessories
```

---

# 📌 SUBSTRING() Function

The `SUBSTRING()` function is used to extract a specific part of a string.

### Syntax

```sql id="x4w8qk"
SUBSTRING(string, start_position, length)
```

### Example

```sql id="o5a0dc"
SELECT SUBSTRING(product_name, 1, 5) AS short_name
FROM products;
```

This extracts the first **5 characters** from the product name.

For example:

```text
Laptop → Lapto
Monitor → Monit
```

---

# 📌 LENGTH() Function

The `LENGTH()` function returns the number of characters in a string.

### Example

```sql id="s6n5qb"
SELECT product_name,
       LENGTH(product_name) AS count_of_char
FROM products;
```

This returns the product name along with its character count.

---

# 📌 TRIM() Function

The `TRIM()` function removes leading and trailing spaces from a string.

### Example

```sql id="p6w0gj"
SELECT LENGTH(TRIM('  Monitor    ')) AS trimmed_text;
```

Here, the spaces before and after `Monitor` are removed before calculating the length.

Compare:

```sql id="g1apg5"
SELECT LENGTH('  Monitor    ') AS trimmed_text;
```

with:

```sql id="5f2b1q"
SELECT LENGTH(TRIM('  Monitor    ')) AS trimmed_text;
```

The second query returns a smaller length because the extra spaces are removed.

---

# 📌 REPLACE() Function

The `REPLACE()` function replaces one piece of text with another.

### Syntax

```sql id="kjy6yl"
REPLACE(string, old_text, new_text)
```

### Example

```sql id="g4f7nx"
SELECT REPLACE(product_name, 'phone', 'device') AS updated
FROM products;
```

This replaces the text `phone` with `device` when that text appears in the product name.

For example:

```text
Smartphone → Smartdevice
```

---

# 📌 RIGHT() Function

The `RIGHT()` function extracts a specified number of characters from the **right side** of a string.

### Example

```sql id="4a4c8r"
SELECT RIGHT(category, 3) AS category_capital
FROM products;
```

This extracts the last **3 characters** from the category.

For example:

```text
Electronics → ics
Furniture   → ure
```

---

# 📊 String Functions Flow

```text id="3ikjcp"
Text Data
    │
    ├── UPPER()     ──► Uppercase
    │
    ├── LOWER()     ──► Lowercase
    │
    ├── CONCAT()    ──► Combine Text
    │
    ├── SUBSTRING() ──► Extract Text
    │
    ├── LENGTH()    ──► Count Characters
    │
    ├── TRIM()      ──► Remove Spaces
    │
    ├── REPLACE()   ──► Replace Text
    │
    └── RIGHT()     ──► Extract From Right
```

---

# 📌 String Functions Summary

| Function      | Purpose                             |
| ------------- | ----------------------------------- |
| `UPPER()`     | Converts text to uppercase          |
| `LOWER()`     | Converts text to lowercase          |
| `CONCAT()`    | Combines strings                    |
| `SUBSTRING()` | Extracts part of a string           |
| `LENGTH()`    | Counts characters                   |
| `TRIM()`      | Removes leading and trailing spaces |
| `REPLACE()`   | Replaces text                       |
| `RIGHT()`     | Extracts characters from the right  |

---

# 💡 Best Practices

* Use `UPPER()` and `LOWER()` when standardizing text.
* Use `TRIM()` when cleaning data that contains unwanted spaces.
* Use `CONCAT()` when combining information from multiple columns.
* Use `SUBSTRING()` when only a specific part of a text value is required.
* Use `REPLACE()` carefully when modifying text values.
* Use meaningful aliases for calculated or transformed columns.

---

# 📝 Interview Questions

### 1. Which function converts text to uppercase?

**Answer:** `UPPER()`

### 2. Which function converts text to lowercase?

**Answer:** `LOWER()`

### 3. Which function is used to combine strings?

**Answer:** `CONCAT()`

### 4. Which function is used to count the number of characters?

**Answer:** `LENGTH()`

### 5. Which function removes leading and trailing spaces?

**Answer:** `TRIM()`

### 6. Which function is used to replace text?

**Answer:** `REPLACE()`

### 7. Which function extracts characters from the right side?

**Answer:** `RIGHT()`

---

# 🎯 Key Takeaways

* String Functions are used to manipulate text data.
* `UPPER()` and `LOWER()` change text case.
* `CONCAT()` combines multiple strings.
* `SUBSTRING()` extracts a specific part of a string.
* `LENGTH()` counts characters.
* `TRIM()` removes unwanted spaces.
* `REPLACE()` replaces specific text.
* `RIGHT()` extracts characters from the right side.

---

# 💼 Real-World Use Case

String Functions are commonly used in data cleaning and data analysis.

For example, companies can standardize category names, clean unwanted spaces, combine product information, extract parts of names, count characters, and replace incorrect text values.

---

# 📂 Practice File

```text
Day 21 String Function.sql
```

---

# 🚀 Progress

✅ Day 21 Completed

**Next Topic ➜ Continue with the next SQL concept**
