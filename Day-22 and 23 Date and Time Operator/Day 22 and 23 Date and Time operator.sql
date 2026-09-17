
SELECT * from products;

-- 1. NOW() – Get Current Date and Time
select now() as current_datetime;

-- 2. CURRENT_DATE() – Get Current Date
select CURRENT_DATE as today_date;

SELECT Added_date, Current_Date, (CURRENT_DATE- added_date) AS Days_difference
FROM products;

-- 3. EXTRACT() – Extract Parts of a Date
-- Extract the year, month, and day from the added_date column.
select product_name, 
		EXTRACT (year from added_date) as year_added,
		EXTRACT (month from added_date) as month_added,
		EXTRACT (day from added_date) as day_added
		from products;

-- 4. AGE() – Calculate Age Between Dates
-- Calculate the time difference between added_date and today’s date.
select product_name,
		AGE(current_date, added_date) as Age_since_added
		from products;

-- 5. TO_CHAR() – Format Dates as Strings
-- Format added_date in a custom format (DD-Mon-YYYY).
select product_name,
	to_char(added_date,'DD-Month-YYYY') as FORMATED_DATE
	from products;

-- Day 23
-- 6. DATE_PART() – Get Specific Date Part
-- Extract the day of the week from added_date.
select product_name, added_date,
		date_part('dow',added_date) as day_of_week
		from products;

-- 7. DATE_TRUNC() – Truncate Date to Precision
-- Truncate added_date to the start of the month.
select product_name, added_date,
		date_trunc('week',added_date) as week_start
		from products;

-- 8. INTERVAL – Add or Subtract Time Intervals
-- Add 6 months to the added_date.
select product_name, added_date,
		added_date + interval '6 months' as new_date
		from products;
-- 9. CURRENT_TIME() – Get Current Time
-- Retrieve only the current time.
select current_time as current_time;

-- 10. TO_DATE() – Convert String to Date
-- Convert a string to a date format.
select to_date('23-10-2023','dd-mm-yyyy') as converted_date;














