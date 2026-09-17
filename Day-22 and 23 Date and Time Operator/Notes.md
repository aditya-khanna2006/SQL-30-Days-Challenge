# 📅 Day 22 & Day 23 – Date & Time Functions in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

* Get the current date and time using `NOW()`
* Get the current date using `CURRENT_DATE`
* Get the current time using `CURRENT_TIME`
* Calculate the difference between dates
* Extract year, month, and day using `EXTRACT()`
* Calculate the difference between two dates using `AGE()`
* Format dates using `TO_CHAR()`
* Extract specific date parts using `DATE_PART()`
* Truncate dates using `DATE_TRUNC()`
* Add or subtract time using `INTERVAL`
* Convert strings into dates using `TO_DATE()`

---

# 📌 Introduction

Date and time operations are very important in SQL because real-world databases contain many date-related values such as:

* Product added dates
* Order dates
* Customer registration dates
* Employee joining dates
* Payment dates
* Delivery dates
* Transaction timestamps

PostgreSQL provides several built-in functions to work with dates and times efficiently.

In this lesson, I practiced different PostgreSQL Date & Time Functions using the `products` table and its `added_date` column.

---

# 📌 1. NOW() – Get Current Date and Time

The `NOW()` function returns the current date and time.

### Example

    SELECT NOW() AS current_datetime;

### Example Output

    current_datetime
    ---------------------------
    2025-01-15 14:30:25.123456

### Explanation

`NOW()` returns both:

* Current Date
* Current Time

It is commonly used when we need the exact current timestamp.

---

# 📌 2. CURRENT_DATE – Get Current Date

`CURRENT_DATE` returns only the current date.

### Example

    SELECT CURRENT_DATE AS today_date;

### Example Output

    today_date
    ----------
    2025-01-15

### Explanation

Unlike `NOW()`, `CURRENT_DATE` does not return the current time.

It is useful when only the date is required.

---

# 📌 Calculate Difference Between Dates

We can subtract one date from another to calculate the number of days between them.

### Example

    SELECT
        added_date,
        CURRENT_DATE,
        (CURRENT_DATE - added_date) AS days_difference
    FROM products;

### Explanation

If a product was added 30 days ago, the query will return approximately:

    days_difference
    ---------------
    30

This can be useful for calculating how long a product has been stored in the system.

---

# 📌 3. EXTRACT() – Extract Parts of a Date

The `EXTRACT()` function is used to extract a specific part from a date or timestamp.

We can extract:

* Year
* Month
* Day
* Hour
* Minute
* Second
* Day of week
* And other date/time parts

### Example

    SELECT
        product_name,
        EXTRACT(YEAR FROM added_date) AS year_added,
        EXTRACT(MONTH FROM added_date) AS month_added,
        EXTRACT(DAY FROM added_date) AS day_added
    FROM products;

### Explanation

If:

    added_date = 2024-06-15

The result can be:

    year_added = 2024
    month_added = 6
    day_added = 15

---

# 📌 4. AGE() – Calculate Difference Between Dates

The `AGE()` function calculates the difference between two dates and returns an interval.

### Example

    SELECT
        product_name,
        AGE(CURRENT_DATE, added_date) AS age_since_added
    FROM products;

### Example Result

    product_name    | age_since_added
    -----------------+----------------
    Laptop           | 1 year 3 mons 5 days
    Chair            | 8 mons 12 days

### Explanation

`AGE()` is useful when we want the difference in a human-readable format such as:

    2 years 4 mons 10 days

Instead of getting only the total number of days.

---

# 📌 5. TO_CHAR() – Format Dates as Strings

The `TO_CHAR()` function converts a date or timestamp into a formatted text value.

### Example

    SELECT
        product_name,
        TO_CHAR(added_date, 'DD-Month-YYYY') AS formatted_date
    FROM products;

### Example Output

    product_name    | formatted_date
    -----------------+-----------------
    Laptop           | 15-June-2024
    Keyboard         | 20-July-2024

### Common Formatting Patterns

| Format | Meaning |
|---|---|
| `DD` | Day |
| `MM` | Month number |
| `Month` | Full month name |
| `Mon` | Short month name |
| `YYYY` | Four-digit year |
| `YY` | Two-digit year |

### Example

    SELECT TO_CHAR(added_date, 'DD-Mon-YYYY')
    FROM products;

This can return:

    15-Jun-2024

---

# 📌 Day 23 – Advanced Date & Time Functions

Day 23 continues with more PostgreSQL date and time functions.

---

# 📌 6. DATE_PART() – Get a Specific Date Part

`DATE_PART()` extracts a specific part of a date or timestamp.

It is similar to `EXTRACT()`.

### Example

    SELECT
        product_name,
        added_date,
        DATE_PART('dow', added_date) AS day_of_week
    FROM products;

### Explanation

`dow` represents the day of the week.

In PostgreSQL:

    0 = Sunday
    1 = Monday
    2 = Tuesday
    3 = Wednesday
    4 = Thursday
    5 = Friday
    6 = Saturday

### Example

If:

    added_date = 2024-06-15

The result can be:

    day_of_week = 6

because June 15, 2024 was a Saturday.

---

# 📌 7. DATE_TRUNC() – Truncate Date to a Specific Precision

`DATE_TRUNC()` truncates a date or timestamp to a specified level of precision.

It can be used with:

* Year
* Month
* Week
* Day
* Hour
* Minute
* Second

### Example

    SELECT
        product_name,
        added_date,
        DATE_TRUNC('week', added_date) AS week_start
    FROM products;

### Explanation

If we truncate a date to `week`, PostgreSQL returns the timestamp representing the beginning of that week.

This is useful for:

* Weekly reports
* Monthly reports
* Grouping data by time periods
* Time-based analysis

### Another Example

    SELECT DATE_TRUNC('month', added_date)
    FROM products;

This returns the beginning of the month.

---

# 📌 8. INTERVAL – Add or Subtract Time

`INTERVAL` is used to add or subtract a specific amount of time from a date or timestamp.

### Example

    SELECT
        product_name,
        added_date,
        added_date + INTERVAL '6 months' AS new_date
    FROM products;

### Explanation

If:

    added_date = 2024-01-15

Then:

    added_date + INTERVAL '6 months'

will produce a date/time around:

    2024-07-15

### We can also subtract time

    SELECT
        added_date - INTERVAL '30 days'
    FROM products;

This moves the date 30 days backward.

---

# 📌 9. CURRENT_TIME – Get Current Time

`CURRENT_TIME` returns the current time without the date.

### Example

    SELECT CURRENT_TIME AS current_time;

### Example Output

    current_time
    -------------
    14:30:25.123456+05:30

### Difference Between NOW(), CURRENT_DATE and CURRENT_TIME

| Function | Returns |
|---|---|
| `NOW()` | Current date + time |
| `CURRENT_DATE` | Current date |
| `CURRENT_TIME` | Current time |

---

# 📌 10. TO_DATE() – Convert String to Date

`TO_DATE()` converts a string into a date using a specified format.

### Example

    SELECT TO_DATE('23-10-2023', 'DD-MM-YYYY') AS converted_date;

### Result

    converted_date
    --------------
    2023-10-23

### Explanation

The first argument contains the date as text.

The second argument tells PostgreSQL how the text is formatted.

    '23-10-2023'
          ↓
    'DD-MM-YYYY'
          ↓
    2023-10-23

This is useful when importing or cleaning data where dates are stored as text.

---

# 📌 Date & Time Functions Summary

| Function | Purpose |
|---|---|
| `NOW()` | Get current date and time |
| `CURRENT_DATE` | Get current date |
| `CURRENT_TIME` | Get current time |
| `EXTRACT()` | Extract year, month, day, etc. |
| `AGE()` | Calculate difference between dates |
| `TO_CHAR()` | Format date as text |
| `DATE_PART()` | Extract a specific date part |
| `DATE_TRUNC()` | Truncate date to a specific precision |
| `INTERVAL` | Add or subtract time |
| `TO_DATE()` | Convert text into a date |

---

# 📌 Date & Time Functions – Quick Flow

    Date / Timestamp Data
             ↓
    ┌──────────────────────┐
    │ Need Current Date?    │
    │ CURRENT_DATE          │
    └──────────┬───────────┘
               ↓
    ┌──────────────────────┐
    │ Need Current Time?    │
    │ CURRENT_TIME          │
    └──────────┬───────────┘
               ↓
    ┌──────────────────────┐
    │ Need Date + Time?     │
    │ NOW()                 │
    └──────────┬───────────┘
               ↓
    ┌──────────────────────┐
    │ Need Date Components? │
    │ EXTRACT / DATE_PART   │
    └──────────┬───────────┘
               ↓
    ┌──────────────────────┐
    │ Need Date Difference? │
    │ AGE() / Date Subtract │
    └──────────┬───────────┘
               ↓
    ┌──────────────────────┐
    │ Need Formatting?      │
    │ TO_CHAR()             │
    └──────────┬───────────┘
               ↓
    ┌──────────────────────┐
    │ Need Date Adjustment? │
    │ INTERVAL              │
    └──────────┬───────────┘
               ↓
    ┌──────────────────────┐
    │ Need Date Conversion? │
    │ TO_DATE()             │
    └──────────────────────┘

---

# 💡 Best Practices

* Use `CURRENT_DATE` when only the date is required.
* Use `CURRENT_TIME` when only the time is required.
* Use `NOW()` when both date and time are required.
* Use `EXTRACT()` or `DATE_PART()` when you need a specific component of a date.
* Use `AGE()` when you want a readable difference between dates.
* Use `TO_CHAR()` when displaying dates in a specific format.
* Use `DATE_TRUNC()` for time-based reporting and grouping.
* Use `INTERVAL` when adding or subtracting time periods.
* Use `TO_DATE()` when converting properly formatted text into a date.
* Always understand whether a column contains a `DATE`, `TIMESTAMP`, or text value before performing date operations.

---

# 📝 Interview Questions

### 1. What is the difference between NOW() and CURRENT_DATE?

`NOW()` returns the current date and time, while `CURRENT_DATE` returns only the current date.

---

### 2. What is the difference between CURRENT_DATE and CURRENT_TIME?

`CURRENT_DATE` returns the current date, while `CURRENT_TIME` returns the current time.

---

### 3. What is the purpose of EXTRACT()?

`EXTRACT()` is used to retrieve a specific part of a date or timestamp, such as year, month, or day.

---

### 4. What is the difference between EXTRACT() and DATE_PART()?

Both can be used to extract parts of a date or timestamp.

For example:

    EXTRACT(YEAR FROM added_date)

and:

    DATE_PART('year', added_date)

can be used for the same type of task.

---

### 5. What does AGE() do?

`AGE()` calculates the difference between two dates and returns an interval.

---

### 6. What is TO_CHAR() used for?

`TO_CHAR()` converts a date or timestamp into formatted text.

---

### 7. What is DATE_TRUNC() used for?

`DATE_TRUNC()` truncates a date or timestamp to a specified precision such as month, week, day, or hour.

---

### 8. How can you add six months to a date?

Using `INTERVAL`:

    SELECT added_date + INTERVAL '6 months'
    FROM products;

---

### 9. How do you convert a string into a date?

Using `TO_DATE()`:

    SELECT TO_DATE('23-10-2023', 'DD-MM-YYYY');

---

### 10. How can you find the number of days between two dates?

For date values, subtract one date from another:

    SELECT CURRENT_DATE - added_date
    FROM products;

---

# 🎯 Key Takeaways

* `NOW()` returns the current date and time.
* `CURRENT_DATE` returns today's date.
* `CURRENT_TIME` returns the current time.
* Date subtraction can be used to calculate the number of days between dates.
* `EXTRACT()` retrieves specific parts of a date.
* `AGE()` calculates a readable difference between dates.
* `TO_CHAR()` formats dates for display.
* `DATE_PART()` extracts a specific date component.
* `DATE_TRUNC()` is useful for time-based reporting.
* `INTERVAL` allows us to add or subtract time periods.
* `TO_DATE()` converts formatted text into a PostgreSQL date.
* Date and time functions are extremely useful in reporting, analytics, and real-world database applications.

---

# 💼 Real-World Use Case

Date and time functions are commonly used in real-world applications such as:

### 📦 E-Commerce

* Find how long a product has been available.
* Calculate order processing time.
* Track delivery dates.
* Generate daily or monthly sales reports.

### 👨‍💼 Employee Management

* Calculate employee experience.
* Find joining dates.
* Generate monthly attendance reports.

### 📊 Data Analytics

* Analyze monthly sales.
* Compare weekly performance.
* Extract year and month from transaction dates.
* Create time-based dashboards.

### 🏦 Banking & Transactions

* Track transaction dates.
* Calculate account age.
* Analyze daily and monthly transactions.

---

# 📂 Practice File

`Day 22 & 23 Date and Time Functions.sql`

---

# 🚀 Progress

**Day 22 & Day 23 Completed! 🎉**

I learned how to work with PostgreSQL Date & Time Functions and practiced extracting, formatting, comparing, and manipulating dates.

### Progress:

**23 / 30 Days Completed — 77% 🎯**

    ███████████████████████░░░░░  77%

**Next Topic ➜ Continue with the next SQL concept**
