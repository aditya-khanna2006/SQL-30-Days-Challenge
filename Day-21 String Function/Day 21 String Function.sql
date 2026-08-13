select * from products;

-- Get all the categories in Uppercase

select upper(category) as Cat_Cap
from products;

-- Get all the categories in Lowercase

select lower(category) as Cat_Cap
from products;

-- Join Product_name adn category text with hypen.
select concat(product_name,'-',category) as products_details
from products;

-- Extract the first 5 characters from product_name
select SUBSTRING(product_name,1,5) as short_name
from products;

-- Count length
SELECT product_name, LENGTH(product_name) AS COUNT_OF_CHAR
FROM products;

-- Remove leading and trailing spaces from string
 SELECT LENGTH(TRIM('  Monitor    ')) AS Trimmed_Text;
 SELECT LENGTH('  Monitor    ') AS Trimmed_Text;

-- Replace the word "phone" with "device" in product names
SELECT REPLACE(product_name, 'phone','device') AS updated
FROM products;

-- Get the first 3 characters from category
SELECT RIGHT(category, 3) AS Catergory_Capital
FROM products;

