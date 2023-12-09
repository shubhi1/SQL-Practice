-- How many orders were placed for each product?
SELECT product_name AS 'Product Name',
SUM(quantity) AS 'Number of Orders'
FROM products
JOIN orders
ON products.product_id = orders.product_id
GROUP BY product_name;


-- What is the total quantity sold for each product category?
SELECT product_category AS 'Product Category',
SUM(quantity) AS 'Total Quantity Sold'
FROM products
JOIN orders
ON products.product_id = orders.product_id
GROUP BY product_category;


-- Which product has generated the most sales revenue?
SELECT product_name AS 'Product Name', SUM(quantity*product_price) AS 'Sales Revenue'
FROM products
JOIN orders
ON products.product_id = orders.product_id
GROUP BY product_name
ORDER BY SUM(quantity*product_price) DESC
LIMIT 1;


-- Which customers have purchased 'Product A'?
SELECT customer_id AS 'Customer ID', product_name AS 'Product Name'
FROM products
JOIN orders
ON products.product_id = orders.product_id
WHERE product_name = 'Product A';


-- How many unique customers have made purchases?
SELECT COUNT(DISTINCT customer_id) AS 'Unique Customers'
FROM orders
WHERE quantity > 0;
