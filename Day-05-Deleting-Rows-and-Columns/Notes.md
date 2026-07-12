# 📅 Day 5 – Deleting Rows and Columns in SQL

## 🎯 Learning Objectives

In this lesson, I learned how to:

- Delete specific rows from a table
- Remove unwanted columns
- Delete an entire table
- Delete a database
- Understand the difference between DELETE, DROP COLUMN, DROP TABLE, and DROP DATABASE

---

# 📌 Introduction

Managing a database is not just about adding data—it also involves removing unnecessary or outdated information.

SQL provides different commands depending on what needs to be deleted:

- Delete specific records
- Remove a column
- Delete a table
- Delete a database

Choosing the correct command is important because some operations can be reversed while others permanently remove data.

---

# 🗑️ DELETE Statement

The `DELETE` statement removes one or more rows from a table.

### Syntax

```sql
DELETE FROM table_name
WHERE condition;
```

### Example

```sql
DELETE FROM employee2
WHERE employee_id = 105;
```

### Explanation

- Deletes only the row where `employee_id` equals **105**.
- The table structure remains unchanged.
- Other records are not affected.

---

# 📌 Why Use WHERE?

Using a `WHERE` clause ensures that only the intended rows are deleted.

⚠️ Without a `WHERE` clause:

```sql
DELETE FROM employee2;
```

All rows in the table will be deleted, but the table itself will still exist.

---

# 🗂️ Removing a Column

Sometimes a column is no longer required in a table.

The `ALTER TABLE ... DROP COLUMN` statement removes a column permanently.

### Syntax

```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

### Example

```sql
ALTER TABLE employee2
DROP COLUMN salary;
```

### Explanation

- Removes the `salary` column from the table.
- All data stored in that column is permanently deleted.

---

# 🏗️ Deleting a Table

If an entire table is no longer needed, use the `DROP TABLE` statement.

### Syntax

```sql
DROP TABLE table_name;
```

### Example

```sql
DROP TABLE IF EXISTS employee2;
```

### Explanation

- Deletes the complete table.
- Removes both the table structure and all its data.
- `IF EXISTS` prevents an error if the table does not exist.

---

# 🗄️ Deleting a Database

A database can also be removed when it is no longer required.

### Syntax

```sql
DROP DATABASE database_name;
```

### Example

```sql
DROP DATABASE IF EXISTS company2;
```

### Explanation

- Deletes the entire database.
- All tables, records, indexes, and other objects inside the database are permanently removed.

---

# 📊 Difference Between Commands

| Command | Deletes | Structure Remains? |
|----------|---------|--------------------|
| DELETE | Selected rows | ✅ Yes |
| DROP COLUMN | One column | ✅ Table remains |
| DROP TABLE | Entire table | ❌ No |
| DROP DATABASE | Entire database | ❌ No |

---

# 🔄 Visual Overview

```
Database
│
├── Table
│     ├── Rows  ← DELETE
│     ├── Columns ← DROP COLUMN
│
├── DROP TABLE
│     ↓
│   Table Removed
│
└── DROP DATABASE
      ↓
 Entire Database Removed
```

---

# 💡 Best Practices

✅ Always use `WHERE` with `DELETE` unless you intentionally want to remove all records.

✅ Take a backup before using `DROP TABLE` or `DROP DATABASE`.

✅ Verify the data before deleting it.

✅ Use `IF EXISTS` to avoid unnecessary errors.

---

# 📝 Interview Questions

### 1. What is the difference between DELETE and DROP?

**Answer:**

- `DELETE` removes data (rows) from a table.
- `DROP` removes the entire database object such as a table or database.

---

### 2. Can DELETE remove a column?

**Answer:**

No. Columns are removed using:

```sql
ALTER TABLE
DROP COLUMN;
```

---

### 3. What happens if DELETE is used without WHERE?

**Answer:**

All rows are deleted, but the table structure remains.

---

### 4. Why is `IF EXISTS` used?

**Answer:**

It prevents SQL from throwing an error if the specified table or database does not exist.

---

# 🎯 Key Takeaways

- `DELETE` removes records from a table.
- `ALTER TABLE DROP COLUMN` removes a column.
- `DROP TABLE` deletes an entire table.
- `DROP DATABASE` deletes an entire database.
- Always verify before executing deletion commands because many of them are irreversible.

---

# 📂 Practice File

The SQL commands for this lesson are available in:

```
Day 5 Delete Rows, Column from table.sql
```

---

# 🚀 Progress

✅ Day 5 Completed

**Next Topic ➜ Updating Data in a Table**
