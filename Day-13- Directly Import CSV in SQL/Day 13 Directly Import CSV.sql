-- import CSV File DIRECT MODE 

/*
1. Open pgAdmin.
2. Expand:
Servers → PostgreSQL → Databases → your_database
3. Go to:
Schemas → public → Tables
4. Right-click the table where you want to import the CSV.
5.Select Import/Export Data...
6. In the Import/Export Data window:
	Choose Import
	Select your .csv file	
	Format: csv
	Enable Header if your CSV has column names
	Delimiter: ,
7. Go to the Columns tab and make sure the CSV columns match your table columns.
8. Click OK.*/


DROP TABLE IF EXISTS employee3;

CREATE TABLE employee3(
	employee_id	INT	PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	email VARCHAR(50),	
	department VARCHAR(20),	
	salary NUMERIC(10,21),	
	joining_date DATE,	
	age INT	
);

SELECT * FROM employee3;
