SELECT * FROM products;


-- Assign a unique row number to each product within the same category.
select product_name,category,price,
		row_number() over (PARTITION by category order by price desc) as row_num
		from products;

select product_name,category,price,
		dense_rank() over (PARTITION by category order by price desc) as row_num
		from products;

SELECT product_name, category, price,
		sum(price) OVER(PARTITION BY category ORDER BY price ASC) AS Running_Total
FROM products;

SELECT product_name, category, price,
		avg(price) OVER(PARTITION BY category ORDER BY price ASC) AS Running_Total
FROM products;
