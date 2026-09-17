-- Assignment
/* 1. CASE with AND & OR Operators – Stock Status
We will classify products based on quantity available:

In Stock if quantity is 10 or more.
Limited Stock if quantity is between 5 and 9.
Out of Stock Soon if quantity is less than 5.
*/
select product_name, quantity,
		case  
			when quantity>=10 then 'In Stock'
			when quantity>=5 and quantity<=9 then 'Limited Stock'
			else 'Out of Stock'
		end as stock_details
	from products;

/* 2. CASE with LIKE Operator – Category Classification
Check if the category name contains "Electronics" or "Furniture" using LIKE.
*/

select product_name, category,
		case 
			when category like 'Electronics%' then 'Electronic Item'
			when category like 'Furniture%' then 'Furniture Item'
			ELSE 'Accessory Item'
		end as category_distribution
	from products;