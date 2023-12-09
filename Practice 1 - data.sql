USE practice;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    product_category VARCHAR(50),
    product_price DECIMAL(6, 2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_id, product_name, product_category, product_price)
VALUES 
(1, 'Product A', 'Category 1', 50.00),
(2, 'Product B', 'Category 1', 25.00),
(3, 'Product C', 'Category 2', 75.00),
(4, 'Product D', 'Category 2', 100.00),
(5, 'Product E', 'Category 3', 150.00);

INSERT INTO orders (order_id, product_id, customer_id, quantity, order_date)
VALUES 
(1, 1, 101, 2, '2023-01-01'),
(2, 2, 102, 1, '2023-01-02'),
(3, 3, 103, 3, '2023-01-03'),
(4, 1, 104, 1, '2023-01-04'),
(5, 5, 105, 2, '2023-01-05'),
(6, 4, 106, 4, '2023-01-06'),
(7, 2, 107, 2, '2023-01-07'),
(8, 3, 101, 1, '2023-01-08'),
(9, 1, 108, 2, '2023-01-09'),
(10, 5, 109, 3, '2023-01-10');
