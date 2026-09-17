# 📅 Day 30 – Book Store Management & Sales Analysis Project

## 🎯 Learning Objectives

In this project, I applied the SQL concepts learned throughout the 30-Day SQL Challenge to a real-world Book Store Management system.

In this lesson, I learned how to:

* Design a relational database for a bookstore
* Create multiple related tables
* Use `PRIMARY KEY` and `FOREIGN KEY`
* Insert and retrieve structured data
* Filter records using `WHERE`
* Use aggregate functions such as `SUM()`, `AVG()`, and `COUNT()`
* Sort results using `ORDER BY`
* Limit results using `LIMIT`
* Remove duplicate values using `DISTINCT`
* Combine tables using `JOIN`
* Group data using `GROUP BY`
* Filter grouped results using `HAVING`
* Handle missing values using `COALESCE()`
* Perform sales and inventory analysis using SQL

---

# 📌 Introduction

For the final project, I created a **Book Store Management & Sales Analysis System** using PostgreSQL.

The database contains three main tables:

* `Books`
* `Customers`
* `Orders`

These tables are connected using primary keys and foreign keys.

The project includes both **Basic Queries** and **Advanced Queries** to analyze books, customers, orders, sales, revenue, and inventory.

---

# 📌 Database Structure

The project contains three tables:

    Books
       |
       | Book_ID
       ↓
    Orders
       ↑
       | Customer_ID
       |
    Customers

### Books Table

Stores information about books.

### Customers Table

Stores information about customers.

### Orders Table

Stores information about customer orders.

---

# 📌 Step 1 – Create Books Table

### Example

    CREATE TABLE Books (
        Book_ID SERIAL PRIMARY KEY,
        Title VARCHAR(100),
        Author VARCHAR(100),
        Genre VARCHAR(50),
        Published_Year INT,
        Price NUMERIC(10, 2),
        Stock INT
    );

### Important Columns

| Column | Purpose |
|---|---|
| `Book_ID` | Unique identifier for each book |
| `Title` | Book title |
| `Author` | Book author |
| `Genre` | Book category |
| `Published_Year` | Year the book was published |
| `Price` | Price of the book |
| `Stock` | Available stock |

---

# 📌 Step 2 – Create Customers Table

### Example

    CREATE TABLE Customers (
        Customer_ID SERIAL PRIMARY KEY,
        Name VARCHAR(100),
        Email VARCHAR(100),
        Phone VARCHAR(15),
        City VARCHAR(50),
        Country VARCHAR(150)
    );

### Important Columns

| Column | Purpose |
|---|---|
| `Customer_ID` | Unique customer identifier |
| `Name` | Customer name |
| `Email` | Customer email |
| `Phone` | Customer phone number |
| `City` | Customer city |
| `Country` | Customer country |

---

# 📌 Step 3 – Create Orders Table

### Example

    CREATE TABLE Orders (
        Order_ID SERIAL PRIMARY KEY,
        Customer_ID INT REFERENCES Customers(Customer_ID),
        Book_ID INT REFERENCES Books(Book_ID),
        Order_Date DATE,
        Quantity INT,
        Total_Amount NUMERIC(10, 2)
    );

### Explanation

The `Orders` table connects customers and books.

    Customer_ID → Customers(Customer_ID)

    Book_ID → Books(Book_ID)

These are foreign key relationships.

This ensures that an order references an existing customer and book.

---

# 📌 Step 4 – View the Tables

### Books

    SELECT * FROM Books;

### Customers

    SELECT * FROM Customers;

### Orders

    SELECT * FROM Orders;

These queries allow us to inspect the data before performing analysis.

---

# 📌 BASIC QUERIES

# 📌 1. Retrieve All Fiction Books

### Example

    SELECT *
    FROM books
    WHERE genre = 'Fiction';

### Explanation

The `WHERE` clause filters the Books table and returns only books whose genre is `Fiction`.

---

# 📌 2. Find Books Published After 1950

### Example

    SELECT *
    FROM books
    WHERE published_year > 1950;

This returns books published after the year 1950.

---

# 📌 3. List Customers from Canada

### Example

    SELECT *
    FROM customers
    WHERE country = 'Canada';

The query filters customers based on their country.

---

# 📌 4. Show Orders Placed in November 2023

### Example

    SELECT *
    FROM orders
    WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

The `BETWEEN` operator checks whether the order date falls within the specified range.

---

# 📌 5. Calculate Total Book Stock

### Example

    SELECT SUM(stock) AS total_stock
    FROM books;

`SUM()` adds the stock values of all books.

---

# 📌 6. Find the Most Expensive Book

### Example

    SELECT *
    FROM books
    ORDER BY price DESC
    LIMIT 1;

### Explanation

* `ORDER BY price DESC` sorts books from highest to lowest price.
* `LIMIT 1` returns only the first record.

---

# 📌 7. Find Orders with Quantity Greater Than 1

### Example

    SELECT *
    FROM orders
    WHERE quantity > 1;

This retrieves orders where more than one copy of a book was ordered.

---

# 📌 8. Find Orders Above $20

### Example

    SELECT *
    FROM orders
    WHERE total_amount > 20;

This filters orders where the total amount is greater than 20.

---

# 📌 9. List All Available Genres

### Example

    SELECT DISTINCT genre
    FROM books;

`DISTINCT` removes duplicate genre values.

---

# 📌 10. Find the Book with the Lowest Stock

### Example

    SELECT *
    FROM books
    ORDER BY stock
    LIMIT 1;

The default ascending order places the lowest stock first.

---

# 📌 11. Calculate Total Revenue

### Example

    SELECT SUM(total_amount) AS Revenue
    FROM Orders;

`SUM()` calculates the total revenue generated from all orders.

---

# 📌 ADVANCED QUERIES

# 📌 1. Total Books Sold for Each Genre

### Example

    SELECT b.genre,
           SUM(o.quantity) AS Total_books_sold
    FROM orders o
    JOIN books b
        ON o.book_id = b.book_id
    GROUP BY b.genre;

### Explanation

The query:

1. Joins Orders with Books.
2. Groups orders by genre.
3. Adds the quantity sold for each genre.

---

# 📌 2. Average Price of Fantasy Books

### Example

    SELECT AVG(price) AS Average_price
    FROM books
    WHERE genre = 'Fantasy';

`AVG()` calculates the average price of books belonging to the Fantasy genre.

---

# 📌 3. Customers with at Least 2 Orders

### Example

    SELECT o.customer_id,
           c.name,
           COUNT(o.order_id) AS Order_count
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    GROUP BY o.customer_id, c.name
    HAVING COUNT(o.order_id) >= 2;

### Explanation

`GROUP BY` creates one group for each customer.

`HAVING` then filters those groups and keeps customers with at least two orders.

### Important

`WHERE` filters individual rows before grouping.

`HAVING` filters groups after aggregation.

---

# 📌 4. Find the Most Frequently Ordered Book

### Example

    SELECT o.book_id,
           b.title,
           COUNT(o.order_id) AS order_count
    FROM orders o
    JOIN books b
        ON o.book_id = b.book_id
    GROUP BY o.book_id, b.title
    ORDER BY order_count DESC
    LIMIT 1;

The query counts how many orders were placed for each book and returns the book with the highest order count.

---

# 📌 5. Top 3 Most Expensive Fantasy Books

### Example

    SELECT *
    FROM books
    WHERE genre = 'Fantasy'
    ORDER BY price DESC
    LIMIT 3;

The query first filters Fantasy books and then returns the three highest-priced books.

---

# 📌 6. Total Books Sold by Each Author

### Example

    SELECT b.author,
           SUM(o.quantity) AS total_books_sold
    FROM orders o
    JOIN books b
        ON o.book_id = b.book_id
    GROUP BY b.author;

This calculates the total quantity of books sold by each author.

---

# 📌 7. Cities of Customers with Orders Above $30

### Example

    SELECT DISTINCT c.city,
           o.total_amount
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    WHERE o.total_amount > 30;

The query identifies cities associated with orders whose total amount exceeds $30.

`DISTINCT` prevents duplicate city-and-amount combinations.

---

# 📌 8. Customer Who Spent the Most

### Example

    SELECT c.customer_id,
           c.name,
           SUM(o.total_amount) AS Total_Spent
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_id, c.name
    ORDER BY Total_Spent DESC
    LIMIT 1;

### Explanation

The query:

1. Joins customers and orders.
2. Groups orders by customer.
3. Calculates total spending using `SUM()`.
4. Sorts customers by total spending.
5. Returns the first record.

---

# 📌 9. Calculate Remaining Stock

### Example

    SELECT b.book_id,
           b.title,
           b.stock,
           COALESCE(SUM(o.quantity), 0) AS order_quantity,
           b.stock - COALESCE(SUM(o.quantity), 0) AS remaining_quantity
    FROM books b
    LEFT JOIN orders o
        ON b.book_id = o.book_id
    GROUP BY b.book_id, b.title, b.stock
    ORDER BY b.book_id;

### Explanation

This query calculates how much stock remains after fulfilling the recorded orders.

### Step 1

`LEFT JOIN` keeps all books, including books that have no orders.

### Step 2

`SUM(o.quantity)` calculates the total quantity ordered for each book.

### Step 3

`COALESCE()` replaces `NULL` with `0`.

### Step 4

The remaining stock is calculated as:

    Remaining Stock =
    Original Stock - Ordered Quantity

---

# 📊 Project Query Flow

    Books
      |
      | Book_ID
      ↓
    Orders
      |
      | Customer_ID
      ↓
    Customers

             ↓
       SQL Analysis
             ↓
    ┌──────────────────┐
    │ Filtering        │
    │ Aggregation      │
    │ GROUP BY         │
    │ HAVING           │
    │ JOIN             │
    │ Sorting          │
    │ NULL Handling    │
    └──────────────────┘
             ↓
       Business Insights

---

# 📊 SQL Concepts Used in the Project

| SQL Concept | Used For |
|---|---|
| `CREATE TABLE` | Creating database tables |
| `PRIMARY KEY` | Uniquely identifying records |
| `FOREIGN KEY` | Connecting related tables |
| `SELECT` | Retrieving data |
| `WHERE` | Filtering rows |
| `BETWEEN` | Filtering ranges |
| `DISTINCT` | Removing duplicates |
| `SUM()` | Calculating totals |
| `AVG()` | Calculating averages |
| `COUNT()` | Counting records |
| `JOIN` | Combining related tables |
| `GROUP BY` | Creating groups |
| `HAVING` | Filtering groups |
| `ORDER BY` | Sorting results |
| `LIMIT` | Limiting results |
| `COALESCE()` | Handling `NULL` values |

---

# 💡 Important Concepts Demonstrated

### 1. Filtering

    WHERE genre = 'Fiction'

Used to retrieve specific records.

### 2. Aggregation

    SUM(quantity)

Used to calculate totals.

### 3. Grouping

    GROUP BY author

Used to perform analysis for each group.

### 4. Joining

    JOIN books b
    ON o.book_id = b.book_id

Used to combine information from different tables.

### 5. Handling NULL

    COALESCE(SUM(o.quantity), 0)

Used to replace a `NULL` result with `0`.

---

# 💡 Best Practices

* Use meaningful table and column names.
* Define `PRIMARY KEY` columns for unique records.
* Use `FOREIGN KEY` relationships to maintain connections between tables.
* Use `WHERE` for row-level filtering.
* Use `HAVING` for filtering aggregated groups.
* Use `GROUP BY` whenever aggregate results are required for separate groups.
* Use `COALESCE()` when missing values need a fallback.
* Use table aliases to make JOIN queries easier to read.
* Use `ORDER BY` with `LIMIT` when finding top or bottom records.
* Select only the columns required for the analysis.
* Use appropriate numeric data types for prices and monetary amounts.

---

# 📝 Interview Questions

### 1. What is a PRIMARY KEY?

**Answer:**  
A `PRIMARY KEY` uniquely identifies each record in a table. It cannot contain duplicate values.

---

### 2. What is a FOREIGN KEY?

**Answer:**  
A `FOREIGN KEY` creates a relationship between tables by referencing a key from another table.

---

### 3. What is the difference between WHERE and HAVING?

**Answer:**  
`WHERE` filters individual rows before grouping, while `HAVING` filters groups after aggregate calculations.

---

### 4. Why is GROUP BY used?

**Answer:**  
`GROUP BY` groups rows with the same values so aggregate functions such as `SUM()`, `AVG()`, and `COUNT()` can be applied to each group.

---

### 5. How can you find the most expensive book?

**Answer:**  
One way is:

    SELECT *
    FROM books
    ORDER BY price DESC
    LIMIT 1;

---

### 6. How can you calculate total revenue?

**Answer:**

    SELECT SUM(total_amount) AS Revenue
    FROM orders;

---

### 7. Why is COALESCE() used in the remaining stock query?

**Answer:**  
Some books may not have any matching orders. In that case, `SUM(o.quantity)` can return `NULL`. `COALESCE()` converts that `NULL` to `0`.

---

### 8. What is the purpose of JOIN in this project?

**Answer:**  
JOIN is used to combine related information from the `Books`, `Customers`, and `Orders` tables.

---

### 9. How can you find customers who placed at least two orders?

**Answer:**

    SELECT customer_id,
           COUNT(order_id)
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id) >= 2;

---

### 10. How can you find the total quantity of books sold by each author?

**Answer:**

    SELECT b.author,
           SUM(o.quantity) AS total_books_sold
    FROM orders o
    JOIN books b
        ON o.book_id = b.book_id
    GROUP BY b.author;

---

# 🎯 Key Takeaways

* A relational database stores related information across multiple tables.
* `PRIMARY KEY` uniquely identifies records.
* `FOREIGN KEY` connects related tables.
* `WHERE` filters individual rows.
* `GROUP BY` allows analysis by categories or groups.
* `HAVING` filters grouped results.
* `JOIN` combines information from related tables.
* Aggregate functions such as `SUM()`, `AVG()`, and `COUNT()` are essential for analysis.
* `ORDER BY` and `LIMIT` can be used to find top or bottom records.
* `DISTINCT` removes duplicate values.
* `COALESCE()` helps handle missing values.
* SQL can be used to answer real-world business questions about sales, customers, products, and inventory.

---

# 💼 Real-World Use Case

This Book Store Management project demonstrates how SQL can be used to manage and analyze a real-world business.

A bookstore can use SQL to answer questions such as:

* Which genres sell the most books?
* What is the total revenue?
* Which books are the most frequently ordered?
* Which customers have placed multiple orders?
* Which authors have sold the most books?
* Which books are the most expensive?
* Which books have low remaining inventory?
* Which cities have customers making higher-value orders?

These types of queries can support sales reports, inventory monitoring, customer analysis, and business dashboards.

---

# 📂 Practice File

`Day 30 Book Store Management & Sales Analysis.sql`

---

# 🚀 Progress

✅ Day 30 Completed

🎉 **30-Day SQL Challenge Completed!**

**Next Topic ➜ Continue practicing SQL with real-world datasets and advanced analytical problems**
