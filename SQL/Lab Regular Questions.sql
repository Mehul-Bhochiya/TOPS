-- Project: Employee Reporting Queries
use blinkit;
create database Employee;
use Employee;
create table employee_info( 
	employee_id int primary key auto_increment, 
	employee_name varchar(100) not null, 
	employee_salary int not null, 
	employee_city varchar(100), 
    empolyee_department varchar(50), 
	joining_date date 
);

INSERT INTO employee_info (employee_name, employee_salary, employee_city, empolyee_department, joining_date)
VALUES ('Amit Sharma', 45000, 'Ahmedabad', 'IT', '2022-03-15'),
('Neha Patel', 52000, 'Surat', 'HR', '2021-07-10'),
('Rohit Verma', 60000, 'Vadodara', 'Finance', '2020-11-25'),
('Priya Mehta', 48000, 'Rajkot', 'Marketing', '2022-01-05'),
('Sanjay Kumar', 70000, 'Gandhinagar', 'Operations', '2019-09-18'),
('Anjali Desai', 55000, 'Ahmedabad', 'HR', '2021-05-30'),
('Kunal Shah', 65000, 'Anand', 'IT', '2020-08-12'),
('Pooja Joshi', 43000, 'Bhavnagar', 'Sales', '2022-06-20'),
('Vikas Malhotra', 80000, 'Surat', 'Finance', '2018-04-02'),
('Rina Trivedi', 47000, 'Junagadh', 'Support', '2023-02-14');

-- Select only employee names
SELECT employee_name FROM employee_info;

-- Select employee name and city
SELECT employee_name,employee_city FROM employee_info;

-- Rename salary column as monthly_income
ALTER TABLE employee_info rename column employee_salary to emp_salary ;

-- Fetch department details only
SELECT empolyee_department FROM employee_info;

-- Write a query with comments:- SELECT * FROM employee_info;

-- Create dashboard-friendly SELECT query
-- 1.	Display full employee data
SELECT * FROM employee_info;

-- 2.	Show only Name & Salary
SELECT employee_name,employee_salary FROM employee_info;

-- 3.	Rename columns for Excel export

-- 4.	Add meaningful comments :- this 

-- 5.	Save queries for reuse :- done

-- Project: blinkit Search & Filter Engine
use blinkit;

-- Find customers whose name starts with ‘R’
select * from customers where customer_name like "R%" ;

-- Fetch products priced between 5000–20000
select * from products where product_price between 5000 and 20000 ;

-- Find orders paid using UPI or COD
SELECT * FROM ORDERS WHERE PAYMENT_METHOD IN ("UPI", "COD") ;

-- Find deliveries handled by Ekart
select * from deliveries where delivery_partner ="Ekart";

-- Find products with word ‘Shirt’
select * from products where product_name like "%shirt%" ;

-- Find customers using gmail
select * from customers where email like "%@gmail%" ;

-- 1.	Search customers by name pattern
select * from customers where customer_name like "R%" ;

-- 2.	Filter products by price range
select * from products where product_price between 5000 and 20000 ;

-- 3.	Filter orders by payment method
SELECT DISTINCT * FROM orders ORDER BY payment_method;

-- 4.	Identify fast deliveries
SELECT * FROM deliveries ORDER BY delivery_days ASC limit 3 ;

-- 5.	Combine multiple filters in one query
SELECT * FROM orders where order_status like "delivered" and payment_method like "COD" ;

-- Project: blinkit Top Products Dashboard
-- 1. Top 5 expensive products
SELECT *
FROM products
ORDER BY product_price DESC LIMIT 5;

-- 2. Cheapest products list
SELECT *
FROM products
ORDER BY product_price ASC;

-- 3. Unique categories list
SELECT DISTINCT
    product_category
FROM products;

-- 4. Latest orders snapshot
SELECT *
FROM orders
ORDER BY order_date ASC LIMIT 3;

-- 5. Best-rated sellers
SELECT *
FROM seller
ORDER BY seller_rating DESC LIMIT 3;

-- Count products per category
SELECT
    product_category,
    COUNT(*)
FROM products
GROUP BY product_category;

-- Avg price per category
SELECT
    product_category,
    ROUND(AVG(product_price), 2) AS avg_price
FROM products
GROUP BY product_category;

-- Orders per payment method
SELECT
    payment_method,
    COUNT(*)
FROM orders
GROUP BY payment_method;

-- Delivered orders per payment method
SELECT
    payment_method,
    COUNT(*) AS delivered_order
FROM orders
WHERE order_status = "Delivered"
GROUP BY payment_method;

-- Categories with more than 1 product
SELECT
    product_category,
    COUNT(*) AS cat_count
FROM products
GROUP BY product_category
HAVING cat_count > 1;

-- Payment methods with more than 2 orders
SELECT
    payment_method, 
    COUNT(*) AS pm_count
FROM orders
GROUP BY payment_method
HAVING pm_count > 2;

-- Project: blinkit Business Summary Report
-- 1. Product distribution by category
SELECT
    product_category,
    COUNT(*) AS total_products
FROM products
GROUP BY product_category;

-- 2. Avg price per category
SELECT
    product_category, 
    ROUND(AVG(product_price), 2) AS avg_price
FROM products
GROUP BY product_category;

-- 3. Most used payment method
SELECT
    payment_method, COUNT(*)
FROM orders
GROUP BY payment_method LIMIT 1;

-- 4. Categories with high average price
SELECT
    product_category, ROUND(AVG(product_price), 2) AS avg_price
FROM products
GROUP BY product_category
ORDER BY product_category DESC;


-- List customers with their orders
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_status,
    o.order_date,
    o.payment_method
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- Show products with seller details
SELECT
    p.product_id,
    p.product_name,
    p.product_category,
    p.product_price,
    s.seller_name,
    s.seller_city,
    s.seller_rating
FROM products p
JOIN seller s
ON p.seller_id = s.seller_id;

-- Find customers with no orders
SELECT
    c.customer_id,
    c.customer_name,
    c.email
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Show order delivery details
SELECT
    o.order_id,
    o.order_status,
    o.order_date,
    d.delivery_partner,
    d.shipment_mode,
    d.delivery_days,
    d.delivery_status
FROM orders o
LEFT JOIN deliveries d
ON o.order_id = d.order_id;

-- Find products without reviews
SELECT
    p.product_id,
    p.product_name,
    p.product_category
FROM products p
LEFT JOIN reviews r
ON p.product_id = r.product_id
WHERE r.review_id IS NULL;

-- Count orders per customer
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;

-- Project: blinkit Order Analytics
-- 1.	Customer order report
SELECT
	c.customer_id,
    c.customer_name,
    c.address,
    o.order_date,
    o.order_status,
    o.payment_method
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- 2.	Product-seller mapping
SELECT
	s.seller_id,
    s.seller_name,
    s.seller_active,
    s.seller_city,
    p.product_name,
    p.product_category,
    p.product_price,
    p.stock
FROM seller s
LEFT JOIN products p
ON s.seller_id = p.seller_id;

-- 3.	Delivery performance report
SELECT
	o.order_id,
    o.order_date,
    o.order_status,
    o.payment_method,
    d.delivery_partner,
    d.delivery_days,
    d.shipment_mode,
    d.delivery_status
FROM orders o
LEFT JOIN 	deliveries d
ON o.order_id = d.order_id;

-- 4. Customers with no orders
SELECT
    c.customer_id,
    c.customer_name,
    c.email
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 5. Order count per customer
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;

-- Show all customers & orders (FULL JOIN logic)
SELECT
    o.customer_id,
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
UNION
SELECT
    o.customer_id,
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- Find customers without orders
SELECT
    c.customer_id,
    c.customer_name,
    c.email
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Find orders without delivery
SELECT
    o.order_id,
    o.order_status,
    o.order_date,
    o.payment_method
FROM orders o
LEFT JOIN deliveries d
ON o.order_id = d.order_id
WHERE d.order_id IS NULL;

-- Find products without reviews
SELECT
    p.product_id,
    p.product_name,
    p.product_category
FROM products p
LEFT JOIN reviews r
ON p.product_id = r.product_id
WHERE r.review_id IS NULL;

-- Compare products in same category
SELECT
    p1.product_name,
    p1.product_price,
    p2.product_name,
    p2.product_price,
    p1.product_category
FROM products p1
JOIN products p2
ON p1.product_category = p2.product_category
AND p1.product_id <> p2.product_id
ORDER BY p1.product_category;

-- Create product × seller combinations
SELECT
    p.product_name,
    p.product_price,
    s.seller_name
FROM products p
CROSS JOIN seller s
ON p.seller_id = s.seller_id;

-- Show cross join output count
SELECT
    p.product_name,
    p.product_price,
    s.seller_name
FROM products p
CROSS JOIN seller s
ON p.seller_id = s.seller_id;

-- Replace RIGHT JOIN with LEFT JOIN
SELECT
    p.product_id,
    p.product_name,
    p.product_category
FROM reviews r
RIGHT JOIN products p
ON r.product_id = p.product_id
WHERE r.review_id IS NULL;

-- Combine customer & seller names
SELECT
    c.customer_name,
    s.seller_name
FROM customers c
CROSS JOIN seller s;

-- Combine delivered & cancelled orders
SELECT
    order_id,
    order_status,
    order_date
FROM orders
WHERE order_status = 'delivered'
UNION ALL
SELECT
    order_id,
    order_status,
    order_date
FROM orders
WHERE order_status = 'cancelled';

-- Create activity log using orders + deliveries
SELECT
    o.order_id,
    o.order_status,
    d.delivery_status,
    d.delivery_partner
FROM orders o
LEFT JOIN deliveries d
ON o.order_id = d.order_id;

-- Combine multiple order statuses
SELECT
    order_id,
    order_status
FROM orders
WHERE order_status IN ('pending', 'shipped', 'processing');

-- Show customer count & order count in one result
SELECT 'Customers' AS entity, COUNT(*) AS total FROM customers
UNION ALL
SELECT 'Orders', COUNT(*) FROM orders;

-- Use UNION ALL for faster report
SELECT customer_name 
FROM customers
UNION ALL
SELECT seller_name
FROM seller;

-- Sort UNION result alphabetically
SELECT customer_name
FROM customers
UNION
SELECT seller_name
FROM seller
ORDER BY customer_name ASC;

-- Combine products & sellers names
SELECT
    p.product_name,
    p.product_price,
    s.seller_name
FROM products p
CROSS JOIN seller s
ON p.seller_id = s.seller_id;

-- Create combined city list (customers + sellers)
SELECT address AS city, 'Customer' AS source
FROM customers
UNION
SELECT seller_city, 'Seller'
FROM seller;

-- Find duplicate rows using UNION vs UNION ALL
	-- Removes duplicates
		SELECT email FROM customers
		UNION
		SELECT email FROM customers;

	-- Keeps duplicates
		SELECT email FROM customers
		UNION ALL
		SELECT email FROM customers;

-- Products above average price
SELECT product_id, product_name, product_price
FROM products
WHERE product_price > (
    SELECT AVG(product_price)
    FROM products
);

-- Latest order details
SELECT *
FROM orders
WHERE order_date in (
    SELECT order_date
    FROM orders
    ORDER BY order_date 
) LIMIT 1;

-- Customers with orders
SELECT DISTINCT c.customer_id, c.customer_name
FROM customers c
WHERE c.customer_id IN (
    SELECT customer_id
    FROM orders
);

-- Products with reviews
SELECT DISTINCT p.product_id, p.product_name
FROM products p
WHERE p.product_id IN (
    SELECT product_id
    FROM reviews
);

-- Products priced above category average
SELECT p.product_id, p.product_name, p.product_price, p.product_category
FROM products p
WHERE p.product_price > (
    SELECT AVG(p2.product_price)
    FROM products p2
    WHERE p2.product_category = p.product_category
);

-- Orders after average order date
SELECT order_id, order_date, order_status
FROM orders
WHERE order_date > (
    SELECT AVG(order_date)
    FROM orders
);

-- Customers without orders
SELECT customer_id, customer_name
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
);

-- Products with max price per category
SELECT product_id, product_name, product_price, product_category
FROM products p
WHERE product_price = (
    SELECT MAX(p2.product_price)
    FROM products p2
    WHERE p2.product_category = p.product_category
);

-- Count orders using subquery
SELECT (
    SELECT COUNT(*)
    FROM orders
) AS total_orders;

-- Use subquery in SELECT
SELECT 
    customer_name,
    (SELECT COUNT(*) 
     FROM orders o 
     WHERE o.customer_id = c.customer_id) AS order_count
FROM customers c;

-- Create customer city comparison
 SELECT
	c1.customer_name as customer_1,
 c2.customer_name as customer_2,
 c1.address
 FROM customers c1
 JOIN customers c2
 ON c1.address = c2.address;

-- Count unmatched rows in JOIN
SELECT 
    COUNT(*) AS unmatched_customers
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Find delivery records without orders
SELECT
	delivery_id,
    delivery_partner,
    shipment_mode
FROM deliveries
WHERE order_id IS NULL;

-- Mini Project 2: Customer Coverage Report
-- •	Customers with orders
SELECT
    c.customer_id,
    c.customer_name,
    c.email
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id ;

-- •	Customers without orders
SELECT
    c.customer_id,
    c.customer_name,
    c.email
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- •	% conversion
WITH customer_base AS (
    SELECT
        COUNT(*) AS total_customers
    FROM customers
),
converted_customers AS (
    SELECT
        COUNT(DISTINCT c.customer_id) AS converted_customers
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
)
SELECT
    ROUND((cc.converted_customers * 100.0 / cb.total_customers),2) AS conversion_percentage
FROM customer_base cb
CROSS JOIN converted_customers cc;

-- Compare EXISTS vs IN
-- Create derived table query
-- Identify orphan records

-- Mini Project 1: Data Quality Audit
-- •	Find missing orders
SELECT 
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- •	Missing deliveries
SELECT 
    o.order_id,
    o.order_status,
    o.order_date
FROM orders o
LEFT JOIN deliveries d
    ON o.order_id = d.order_id
WHERE d.delivery_id IS NULL;

-- •	Missing reviews
SELECT 
    p.product_id,
    p.product_name,
    p.product_category
FROM products p
LEFT JOIN reviews r
    ON p.product_id = r.product_id
WHERE r.review_id IS NULL;

-- Mini Project 1: Premium Product Identification
-- •	Find products priced above category average
SELECT 
	product_id,
    product_name,
    product_category,
    stock
FROM products
WHERE product_price > (SELECT ROUND(AVG(product_price),2) FROM products);
    
-- •	Segment premium vs normal products
WITH Segment_premium AS (
    SELECT product_id, product_name,product_category,product_price, 'Premium' AS segment
    FROM products
    WHERE product_price > (SELECT AVG(product_price) FROM products)
),
normal_product AS (
    SELECT product_id, product_name,product_category,product_price, 'Normal' AS segment
    FROM products
    WHERE product_price <= (SELECT AVG(product_price) FROM products)
)
SELECT * FROM Segment_premium
UNION ALL
SELECT * FROM normal_product
ORDER BY product_category;

-- Mini Project 2: Active Customer Analysis
-- •	Identify customers with orders
WITH customers_w_orders as (
	SELECT 
		c.customer_id,
		c.customer_name
	FROM customers c
	LEFT JOIN orders o
		ON c.customer_id = o.customer_id
	WHERE o.order_id IS NOT NULL
) SELECT * FROM customers_w_orders;

-- •	Customers without orders
WITH customers_wo_orders as (
	SELECT 
		c.customer_id,
		c.customer_name
	FROM customers c
	LEFT JOIN orders o
		ON c.customer_id = o.customer_id
	WHERE o.order_id IS NULL
) SELECT * FROM customers_wo_orders;

-- Create CTE for delivered orders
WITH delivered_order as (
	SELECT *
    FROM orders
    WHERE order_status = "delivered"
) SELECT * FROM delivered_order;

-- Count delivered orders using CTE
WITH delivered_order as (
	SELECT *
    FROM orders
    WHERE order_status = "delivered"
) SELECT COUNT(*) AS total_order FROM delivered_order;

-- Orders per payment method using CTE
WITH order_per_PM as (
	SELECT 
		payment_method, 
		COUNT(*) AS total_orders
	FROM orders
	GROUP BY payment_method
) SELECT * FROM order_per_PM;

-- Customer order count using CTE
WITH count_order as (
	SELECT
		c.customer_id,
		c.customer_name,
		COUNT(o.order_id) AS total_orders
	FROM customers c
	LEFT JOIN orders o
	ON c.customer_id = o.customer_id
	GROUP BY c.customer_id, c.customer_name
	ORDER BY total_orders DESC
) SELECT * FROM count_order;

-- Products above average price using CTE
SELECT 
	product_id,
    product_name,
    product_category,
    stock
FROM products
WHERE product_price > (SELECT ROUND(AVG(product_price),2) FROM products);

-- Avg delivery days using CTE
WITH avg_del_day as (
	SELECT 
    ROUND(AVG(delivery_days),2) AS avg_day
    FROM deliveries
) SELECT * FROM avg_del_day;

-- Multiple CTEs in one query
WITH Segment_premium AS (
    SELECT product_id, product_name,product_category,product_price, 'Premium' AS segment
    FROM products
    WHERE product_price > (SELECT AVG(product_price) FROM products)
),
normal_product AS (
    SELECT product_id, product_name,product_category,product_price, 'Normal' AS segment
    FROM products
    WHERE product_price <= (SELECT AVG(product_price) FROM products)
)
SELECT * FROM Segment_premium
UNION ALL
SELECT * FROM normal_product;

-- Replace subquery using CTE
-- (Example: products priced above average price)
WITH avg_price_cte AS (
    SELECT
        AVG(product_price) AS avg_price
    FROM products
)
SELECT
    p.product_id,
    p.product_name,
    p.product_category,
    p.product_price
FROM products p
JOIN avg_price_cte a
ON p.product_price > a.avg_price;

-- Sort CTE result
WITH ranked_orders AS (
    SELECT 
        o.order_id,
        c.customer_name,
        COUNT(*) OVER (
            PARTITION BY o.customer_id
        ) AS total_orders
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
)
SELECT *
FROM ranked_orders
ORDER BY total_orders DESC;

-- Join inside CTE
WITH count_order as (
	SELECT
		c.customer_id,
		c.customer_name,
		COUNT(o.order_id) AS total_orders
	FROM customers c
	LEFT JOIN orders o
	ON c.customer_id = o.customer_id
	GROUP BY c.customer_id, c.customer_name
	ORDER BY total_orders DESC
) SELECT * FROM count_order;

-- Create KPI report using CTE
WITH customer_count AS (
	SELECT 
		count(customer_id) as customer_count
	FROM customers
), 
order_count AS (
	SELECT 
		count(order_id) as order_count
	FROM orders
),
product_count AS (
	SELECT 
		count(product_id) as product_count
	FROM products
),
seller_count AS (
	SELECT 
		count(seller_id) as seller_count
	FROM seller
)
SELECT * FROM customer_count, order_count, product_count, seller_count;

-- Recursive CTE to generate numbers
WITH RECURSIVE numbers AS (
	SELECT 1 AS n
    UNION ALL
    SELECT n+1
    FROM numbers 
    WHERE n<5
)
SELECT * FROM numbers;

-- Mini Project 1: blinkit KPI Layer
-- •	Total customers
WITH total_customer as (
	SELECT count(customer_id) as total_customer
    FROM customers
) SELECT *  FROM total_customer;

-- •	Total orders
WITH total_order as (
	SELECT count(order_id) as total_order
    FROM orders
) SELECT *  FROM total_order;

-- •	Delivered orders
WITH delivered_order as (
	SELECT *
    FROM orders
    WHERE order_status = "delivered"
) SELECT COUNT(*) AS total_order FROM delivered_order;

-- •	Avg delivery days
WITH avg_del_day as (
	SELECT 
    ROUND(AVG(delivery_days),2) AS avg_day
    FROM deliveries
) SELECT * FROM avg_del_day;

-- Mini Project 2: Customer Activity Segmentation
-- •	Customers with orders
WITH customers_w_orders as (
	SELECT 
		c.customer_id,
		c.customer_name
	FROM customers c
	LEFT JOIN orders o
		ON c.customer_id = o.customer_id
	WHERE o.order_id IS NOT NULL
) SELECT * FROM customers_w_orders;

-- •	Customers without orders
WITH customers_wo_orders as (
	SELECT 
		c.customer_id,
		c.customer_name
	FROM customers c
	LEFT JOIN orders o
		ON c.customer_id = o.customer_id
	WHERE o.order_id IS NULL
) SELECT * FROM customers_wo_orders;

-- •	Order count per customer
WITH count_order as (
	SELECT
		c.customer_id,
		c.customer_name,
		COUNT(o.order_id) AS total_orders
	FROM customers c
	LEFT JOIN orders o
	ON c.customer_id = o.customer_id
	GROUP BY c.customer_id, c.customer_name
	ORDER BY total_orders DESC
) SELECT * FROM count_order;

-- Mini Project 3: Product Price Benchmark
-- •	Category avg price
WITH avg_price_per_cat as (
	SELECT
		product_category,
		ROUND(AVG(product_price), 2) AS avg_price
	FROM products
	GROUP BY product_category
) SELECT * FROM avg_price_per_cat;

-- •	Products above benchmark
WITH price_benchmark AS (
    SELECT
        AVG(product_price) AS avg_price
    FROM products
)
SELECT
    p.product_id,
    p.product_name,
    p.product_category,
    p.product_price
FROM products p
CROSS JOIN price_benchmark b
WHERE p.product_price > b.avg_price;


-- Mini Project 4: Delivery Performance Report
-- •	Delivered orders
WITH delivered_order as (
	SELECT *
    FROM orders
    WHERE order_status = "delivered"
) SELECT * FROM delivered_order;

-- •	Avg delivery days
WITH avg_del_day as (
	SELECT 
    ROUND(AVG(delivery_days),2) AS avg_day
    FROM deliveries
) SELECT * FROM avg_del_day;

-- Show avg product price with each product
SELECT 
    product_name,
    product_price,
    product_category,
    ROUND(AVG(product_price) OVER (), 2) AS avg_price
FROM products;

-- Avg price per category using window function
SELECT 
    product_name,
    product_price,
    product_category,
    ROUND(AVG(product_price) OVER (PARTITION BY product_category ), 2) AS avg_price
FROM products;

-- Count products per category using window function
SELECT 
    product_name,
    product_price,
    product_category,
    COUNT(*) OVER (PARTITION BY product_category) AS count_product
FROM products;

-- Show total orders per customer (row-level)
SELECT 
    o.order_id,
    c.customer_name,
    COUNT(*) OVER (
        PARTITION BY o.customer_id
    ) AS total_orders_per_customer
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id;

-- Compare price vs category average
SELECT 
    product_name,
    product_category,
    product_price,
    ROUND(AVG(product_price) OVER (PARTITION BY product_category ), 2) AS avg_price
FROM products;

-- Show avg delivery days per partner
SELECT
	delivery_partner,
    shipment_mode,
    ROUND(AVG(delivery_days) OVER (PARTITION BY delivery_partner ), 2) AS avg_del_day_per_partner
FROM deliveries;

-- Show category stock value
SELECT 
    product_name,
    product_category,
    product_price,
    SUM(stock) OVER (PARTITION BY product_category)  AS stock_per_category
FROM products;

-- Window function without PARTITION BY
SELECT 
    product_name,
    product_price,
    product_category,
    ROUND(AVG(product_price) OVER (), 2) AS avg_price
FROM products;

-- Use window function with JOIN
SELECT 
    c.customer_name,
    o.order_id,
    o.order_date,
    COUNT(o.order_id) OVER (
        PARTITION BY c.customer_id 
        ORDER BY o.order_date
    ) AS running_order_count
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id;

-- Filter rows using window output
SELECT 
    product_name,
    product_category,
    product_price,
    SUM(stock) OVER (PARTITION BY product_category)  AS stock_per_category
FROM products;

-- Window function vs GROUP BY example
	SELECT 
		customer_id,
		COUNT(*) AS total_orders
	FROM orders
	GROUP BY customer_id;
									SELECT 
										order_id,
										customer_id,
										COUNT(*) OVER (PARTITION BY customer_id) AS total_orders
									FROM orders;

-- Create inventory analytics query
SELECT DISTINCT
	product_category,
	SUM(stock) OVER (PARTITION BY product_category) AS stock_percategory
FROM products;
SELECT DISTINCT
	product_name,
	SUM(stock) OVER (PARTITION BY product_name) AS product_stock
FROM products;
    
use blinkit;
-- Mini Project 1: Product Price Intelligence
-- •	Show product price
SELECT 
	product_id,
    product_name,
    product_price
FROM products;

-- •	Category average price
SELECT DISTINCT
    product_category,
    ROUND(AVG(product_price) OVER (PARTITION BY product_category ), 2) AS avg_price
FROM products;

-- •	Difference from average
SELECT 
	product_name,
    product_category,
    product_price,
    ROUND(AVG(product_price) OVER (PARTITION BY product_category), 2) AS avg_price_per_cat,
    (product_price - ROUND(AVG(product_price) OVER (), 2) ) AS dif_price
FROM products;

-- Mini Project 2: Customer Order Strength
-- •	Order count per customer (row-level)
SELECT 
    c.customer_name,
    o.order_id,
    COUNT(*) OVER (
        PARTITION BY o.customer_id
    ) AS total_orders_per_customer
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id;

-- •	Identify repeat customers
SELECT DISTINCT customer_id
FROM (
    SELECT 
        customer_id,
        COUNT(*) OVER (PARTITION BY customer_id) AS total_orders
    FROM orders
) t
WHERE total_orders > 1;

-- Rank products by price
SELECT
	product_name,
    product_category,
    product_price,
    RANK() OVER (ORDER BY product_price DESC) as rnk_prod
FROM products;

-- Dense rank products by price
SELECT
	product_name,
    product_category,
    product_price,
    DENSE_RANK() OVER (ORDER BY product_price DESC) as rnk_prod
FROM products;

-- Assign row number to products
SELECT
	product_name,
    product_category,
    product_price,
    ROW_NUMBER() OVER() as row_n
FROM products; 

-- Rank products per category
SELECT
	product_name,
    product_category,
    product_price,
    DENSE_RANK() OVER (PARTITION BY product_category ORDER BY product_price DESC) as rnk_prod
FROM products;

-- Top 3 products per category
SELECT *
 FROM   (
    SELECT
		product_name,
		product_category,
		product_price,
		DENSE_RANK() OVER (PARTITION BY product_category ORDER BY product_price DESC ) as rnk_prod
	FROM products ) AS T
WHERE rnk_prod <=3;

-- Rank customers by order count
SELECT 
    customer_name,
    total_orders,
    RANK() OVER (ORDER BY total_orders DESC) AS customer_rank
FROM (
    SELECT 
        c.customer_id,
        c.customer_name,
        COUNT(o.order_id) AS total_orders
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
	GROUP BY c.customer_id, c.customer_name
) t;

-- Rank deliveries by speed
SELECT
	delivery_id,
    delivery_partner,
    shipment_mode,
    delivery_days,
    DENSE_RANK() OVER(ORDER BY delivery_days) AS delivery_rank
FROM deliveries;

-- Ranking without PARTITION BY
SELECT
	product_name,
    product_category,
    product_price,
    DENSE_RANK() OVER (ORDER BY product_price DESC) as rnk_prod
FROM products;

-- Ranking with JOIN
SELECT 
    customer_name,
    total_orders,
    RANK() OVER (ORDER BY total_orders DESC) AS customer_rank
FROM (
    SELECT 
        c.customer_id,
        c.customer_name,
        COUNT(o.order_id) AS total_orders
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
	GROUP BY c.customer_id, c.customer_name
) t;

-- Compare RANK vs DENSE_RANK output
SELECT
	rating,
    RANK() OVER(ORDER BY rating) AS best_rat
FROM reviews;
SELECT
	rating,
    DENSE_RANK() OVER(ORDER BY rating) AS best_rat
FROM reviews;

-- Create leaderboard query
SELECT
	product_name,
    product_category,
    product_price,
    DENSE_RANK() OVER (ORDER BY product_price DESC) as rnk_prod
FROM products;

-- Mini Project 1: Category Leaderboard
-- •	Top 3 expensive products per category
SELECT *
 FROM   (
    SELECT
		product_name,
		product_category,
		product_price,
		DENSE_RANK() OVER (PARTITION BY product_category ORDER BY product_price DESC ) as rnk_prod
	FROM products ) AS T
WHERE rnk_prod <=3;

-- •	Ranking logic
SELECT
	product_name,
    product_category,
    product_price,
    DENSE_RANK() OVER (ORDER BY product_price DESC) as rnk_prod
FROM products;

-- Mini Project 2: Customer Power Users
-- •	Rank customers by number of orders
SELECT 
    customer_name,
    total_orders,
    RANK() OVER (ORDER BY total_orders DESC) AS customer_rank
FROM (
    SELECT 
        c.customer_id,
        c.customer_name,
        COUNT(o.order_id) AS total_orders
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
	GROUP BY c.customer_id, c.customer_name
) t;

-- •	Identify top buyers
SELECT 
    customer_name,
    total_orders,
    RANK() OVER (ORDER BY total_orders DESC) AS customer_rank
FROM (
    SELECT 
        c.customer_id,
        c.customer_name,
        COUNT(o.order_id) AS total_orders
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
	GROUP BY c.customer_id, c.customer_name
) t LIMIT 1;

--  Mini Project 3: Delivery Performance Ranking
-- •	Fastest delivery partners
SELECT 
    delivery_partner,
    delivery_days,
    DENSE_RANK() OVER(ORDER BY delivery_days) AS delivery_rank
FROM deliveries LIMIT 1;

-- •	Order-wise delivery ranking
SELECT 
    d.order_id,
    d.delivery_partner,
    d.delivery_days,
    DENSE_RANK() OVER (
        ORDER BY d.delivery_days ASC
    ) AS delivery_rank
FROM deliveries d;

-- Extract year from orders
SELECT 
	order_id,
    YEAR(order_date)
FROM orders;

-- Extract month from orders
SELECT
	order_id,
    MONTH(order_date)
FROM orders;

-- Show today’s date
SELECT NOW();

-- Add 10 days to order date
SELECT
	order_id,
    order_date,
    DATE_ADD(order_date, INTERVAL 10 DAY) AS add_date
FROM orders;

-- Find orders from last 15 days 
SELECT *
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 15 DAY;

-- Calculate days since each order
SELECT 
    order_id,
    order_date,
    DATEDIFF(CURDATE(), order_date) AS days_since_order
FROM orders;

-- Count orders per month
SELECT 
    MONTH(order_date) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_month
ORDER BY order_month;

-- Find oldest order
SELECT
	order_id,
    order_status,
    payment_method,
    DATEDIFF(CURDATE(), order_date) AS diff
FROM orders
ORDER BY DATEDIFF(order_date, CURDATE()) ASC
LIMIT 1;

-- Find most recent order
SELECT
	order_id,
    order_status,
    payment_method,
    DATEDIFF(CURDATE(), order_date) AS diff
FROM orders
ORDER BY DATEDIFF(order_date, CURDATE()) DESC
LIMIT 1;

-- Calculate average delivery days
SELECT 
    ROUND(AVG(delivery_days),2) AS avg_delivery_days
FROM deliveries;

-- Show orders in January
SELECT *
FROM orders
WHERE MONTH(order_date) = 1;

-- Find orders placed this year
SELECT 
	order_id,
    YEAR(CURDATE()) AS curnt_year
FROM orders
WHERE YEAR(CURDATE()) = YEAR(order_date);

-- Mini Project 1: Monthly Order Dashboard
-- •	Orders per month
SELECT
	order_id,
    payment_method,
    MONTH(order_date) AS month_order
FROM orders
GROUP BY MONTH(order_date);

-- •	Latest month sales
SELECT 
	order_id,
    MONTH(CURDATE()) AS curnt_month
FROM orders;

-- Mini Project 2: Delivery SLA Report
-- •	Avg delivery days
SELECT 
    ROUND(AVG(delivery_days),2) AS avg_delivery_days
FROM deliveries;

-- •	Fast vs slow deliveries

-- •	Delay classification
SELECT
	delivery_partner,
    shipment_mode
FROM deliveries
WHERE delivery_status = "Delay";

-- Mini Project 3: Customer Recency Analysis
-- •	Days since last order
	SELECT *
	FROM orders
	ORDER BY DATEDIFF(CURDATE(), order_date) ASC
	LIMIT 1;

-- Concatenate name & email
SELECT
	customer_name,
    email,
    CONCAT(customer_name, " - ",email) AS cus_mail
FROM customers;

-- Convert all product names to uppercase
WITH upper AS (
	SELECT
		UPPER(product_name) AS p_name
	FROM products
) SELECT * FROM upper;

-- Extract first 4 letters of product name
WITH temp AS (
	SELECT
		LEFT(product_name, 4)
    FROM products
) SELECT * FROM temp;

-- Extract last 3 letters
WITH temp AS (
	SELECT
		RIGHT(product_name, 3)
    FROM products
) SELECT * FROM temp;

-- Replace COD with Cash
WITH temp AS (
	SELECT
		payment_method,
        REPLACE(payment_method, "COD","CASH") AS new_method
    FROM orders
) SELECT * FROM temp;

-- Trim spaces from names
WITH temp AS (
	SELECT
		TRIM(" " FROM product_name) AS new_name
    FROM products
) SELECT * FROM temp;

-- Count length of seller names
WITH temp AS (
	SELECT
		seller_name,
		LENGTH(seller_name) AS len
    FROM seller
) SELECT * FROM temp;

-- Extract email domain
WITH temp AS (
	SELECT
		email,
        SUBSTRING_INDEX(email, "@", -1) AS domain
    FROM customers
) SELECT * FROM temp;

-- Combine category + price
WITH temp AS (
	SELECT
		product_id,
        product_name,
        product_category,
        product_price,
        CONCAT(product_category," - ",product_price) AS cat_price
    FROM products
) SELECT * FROM temp;

-- Standardize payment method to lowercase
WITH temp AS (
	SELECT
		payment_method,
        LOWER(payment_method) AS new_method
    FROM orders
) SELECT * FROM temp;

-- Format name properly
WITH temp AS (
	SELECT
		TRIM( UPPER(product_name) ) AS new_name
    FROM products
) SELECT * FROM temp;

-- Mini Project 1: Customer Data Cleaning
-- •	Standardize names
WITH temp AS (
	SELECT
		TRIM( UPPER(customer_name) ) AS new_name
    FROM customers
) SELECT * FROM temp;

-- •	Extract email domains
SELECT
	email,
	SUBSTRING_INDEX(email, "@", -1) AS domain
FROM customers;
    
-- •	Remove extra spaces
WITH temp AS (
	SELECT
		TRIM(" " FROM product_name) AS new_name
    FROM products
) SELECT * FROM temp;

-- Mini Project 2: Product Code Generator
-- •	Generate short code using first 3 letters + price
SELECT
	product_name,
    product_category,
    product_price,
	CONCAT((LEFT(product_name, 3) ), " - ", product_price) AS new_name
FROM products;

-- Mini Project 3: Marketing Segmentation
-- •	Group customers by email domain 
SELECT 
    SUBSTRING_INDEX(email, '@', -1) AS email_domain,
    COUNT(*) AS customer_count
FROM customers
GROUP BY email_domain
ORDER BY customer_count DESC;
    
-- •	Identify top domain users
	SELECT DISTINCT
        SUBSTRING_INDEX(email, "@", -1) AS domain
    FROM customers
    LIMIT 3;

-- Classify products by price
SELECT
	product_name,
    product_price,
CASE
		WHEN Product_price >= 5000 THEN "expensive"
        WHEN Product_price BETWEEN 1000 AND 4999 THEN "moderate"
        ELSE "affordable"
END AS price_category
FROM products;

-- Segment customers by order count
SELECT 
		customer_name, 
        total_orders,
CASE 
	WHEN total_orders >= 2 then "Regular"
	WHEN total_orders = 1 then "Normal"
	ELSE "Inactive"
END AS customer_type
FROM (
		SELECT
			c.customer_name, 
			count(o.order_id) AS total_orders
		FROM customers c
		LEFT JOIN orders o 
		ON c.customer_id = o.customer_id
		GROUP BY c.customer_id
) t;

-- Identify fast/slow deliveries
SELECT delivery_partner,
    shipment_mode,
    delivery_days,
CASE
		WHEN delivery_days < AVG(delivery_days) over() THEN "fast"
        ELSE "slow"     
END AS delivery_classification
FROM deliveries;

select * from deliveries;
select ROUND(AVG(delivery_days),2) from deliveries ;

-- Count delivered vs non-delivered orders
SELECT
	SUM(CASE WHEN order_status = "Delivered" THEN 1 ELSE 0 END) AS delivered_order,
    SUM(CASE WHEN order_status <> "Delivered" THEN 1 ELSE 0 END) AS other_orders
FROM orders;

-- Categorize sellers by rating
SELECT 
    seller_name,
    seller_rating,
    CASE 
        WHEN seller_rating >= 4.5 THEN 'Excellent'
        WHEN seller_rating >= 4 THEN 'Very Good'
        WHEN seller_rating >= 3 THEN 'Average'
        ELSE 'Poor'
    END AS rating_category
FROM seller;

-- Classify inventory status
SELECT 
    product_name,
    stock,
    CASE 
        WHEN stock = 0 THEN 'Out of Stock'
        WHEN stock <= 5 THEN 'Low Stock'
        ELSE 'In Stock'
    END AS inventory_status
FROM products;

-- Use CASE in ORDER BY
SELECT order_id, order_status
FROM orders
ORDER BY 
    CASE 
        WHEN order_status = 'delivered' THEN 1
        WHEN order_status = 'shipped' THEN 2
        ELSE 3
    END;

-- Use CASE with window function
SELECT 
    order_id,
    order_status,
    RANK() OVER (
        ORDER BY 
        CASE 
            WHEN order_status = 'delivered' THEN 1
            ELSE 2
        END
    ) AS custom_rank
FROM orders;

-- Segment orders by payment type
SELECT 
    order_id,
    payment_method,
    CASE 
        WHEN payment_method = 'COD' THEN 'Cash Payment'
        WHEN payment_method = 'UPI' THEN 'Digital Payment'
        WHEN payment_method = 'Card' THEN 'Card Payment'
        ELSE 'Other'
    END AS payment_category
FROM orders;

-- Create revenue band categories
SELECT 
    product_name,
    product_price,
    CASE 
        WHEN product_price >= 5000 THEN 'High Value'
        WHEN product_price >= 2000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS revenue_band
FROM products;

-- Nested CASE example
SELECT 
    seller_name,
    seller_rating,
    CASE 
        WHEN seller_active = 1 THEN
            CASE 
                WHEN seller_rating >= 4 THEN 'Top Active Seller'
                ELSE 'Active Seller'
            END
        ELSE 'Inactive Seller'
    END AS seller_status
FROM seller;

-- Classify customers by email domain
SELECT 
    customer_name,
    email,
    CASE 
        WHEN email LIKE '%@gmail.com' THEN 'Gmail User'
        WHEN email LIKE '%@yahoo.com' THEN 'Yahoo User'
        WHEN email LIKE '%@outlook.com' THEN 'Outlook User'
        ELSE 'Other Domain'
    END AS email_provider
FROM customers;

-- Mini Project 1: Customer Segmentation Engine
-- •	Segment into Inactive / Occasional / Frequent
SELECT 
		customer_name, 
        total_orders,
CASE 
	WHEN total_orders >= 2 then "Frequent"
	WHEN total_orders = 1 then "Occasional"
	ELSE "Inactive"
END AS customer_type
FROM (
		SELECT
			c.customer_name, 
			count(o.order_id) AS total_orders
		FROM customers c
		LEFT JOIN orders o 
		ON c.customer_id = o.customer_id
		GROUP BY c.customer_id
) t;

-- •	Create summary report 
SELECT 
		customer_name, 
        total_orders,
CASE 
	WHEN total_orders >= 2 then "Frequent"
	WHEN total_orders = 1 then "Occasional"
	ELSE "Inactive"
END AS customer_type
FROM (
		SELECT
			c.customer_name, 
			count(o.order_id) AS total_orders
		FROM customers c
		LEFT JOIN orders o 
		ON c.customer_id = o.customer_id
		GROUP BY c.customer_id
) t;

--  Mini Project 2: Product Price Intelligence
-- •	Low / Medium / High
SELECT
	product_name,
    product_price,
CASE
		WHEN Product_price >= 5000 THEN "High"
        WHEN Product_price BETWEEN 1000 AND 4999 THEN "Medium"
        ELSE "Low"
END AS price_category
FROM products;

-- •	Compare vs category average
SELECT *
FROM (
    SELECT 
        p.product_id,
        p.product_name,
        p.product_category,
        p.product_price,
        ROUND(AVG(product_price) OVER(PARTITION BY product_category) ,2) AS category_avg,
        CASE 
            WHEN p.product_price > AVG(product_price) OVER (PARTITION BY product_category)
                THEN 'Above Average'
            WHEN p.product_price < AVG(product_price) OVER (PARTITION BY product_category)
                THEN 'Below Average'
            ELSE 'At Average'
        END AS price_position
    FROM products p
) t;

-- Mini Project 3: Delivery Performance Scorecard
-- •	Classify partners
CREATE OR REPLACE VIEW classify_partner AS
	SELECT DISTINCT
		delivery_partner,
        shipment_mode,
        delivery_days,
	CASE
		WHEN delivery_days <= 2 THEN "premuim partner"
        WHEN delivery_days BETWEEN 3 AND 5 THEN "standard partner"
        ELSE "economy partner"
	END AS partner_cate
FROM deliveries;
        
-- •	Rank by performance
select delivery_id, delivery_partner,delivery_days,
case 
when delivery_days <= 2 then "fast"
when delivery_days between 3 and 5 then "normal" 
else "slow"
end as delivery_perfomance,
dense_rank() over (order by delivery_days) as delivery_rank 
from deliveries;

-- Mini Project 4: Inventory Risk Monitoring
-- •	Identify out-of-stock
SELECT 
    product_id,
    product_name,
    stock
FROM products
WHERE stock = 0;

-- •	High-demand items
SELECT 
    p.product_id,
    p.product_name,
    COUNT(o.order_id) AS total_orders
FROM products p
JOIN orders o
    ON p.product_id = o.order_id   
GROUP BY p.product_id, p.product_name
ORDER BY total_orders DESC;

-- Create customer summary view
CREATE VIEW customer_summary AS
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

SELECT * FROM customer_summary;

-- Create delivered orders view
CREATE VIEW delivered_orders AS
SELECT *
FROM orders
WHERE order_status = 'delivered';

SELECT * FROM delivered_orders;

-- Create product performance view
CREATE VIEW product_performance AS
SELECT 
    p.product_id,
    p.product_name,
    COUNT(r.review_id) AS total_reviews,
    ROUND(AVG(r.rating),2) AS avg_rating
FROM products p
LEFT JOIN reviews r
    ON p.product_id = r.product_id
GROUP BY p.product_id, p.product_name;

SELECT * FROM product_performance;

-- Query from view
SELECT * FROM product_performance;

-- Modify view using REPLACE
CREATE VIEW vw_delivery_performance AS
SELECT 
    d.delivery_partner,
    COUNT(d.delivery_id) AS total_deliveries,
    AVG(d.delivery_days) AS avg_delivery_days,
    SUM(CASE WHEN d.delivery_status = 'Delivered' THEN 1 ELSE 0 END) AS delivered_count
FROM deliveries d
GROUP BY d.delivery_partner;

-- Drop view
DROP VIEW product_performance;

-- Create view hiding sensitive columns
CREATE VIEW public_customers AS
SELECT 
    customers_id,
    customer_name,
    address
FROM customers;

-- Create view using JOIN
CREATE VIEW order_details AS
SELECT 
    o.order_id,
    c.customer_name,
    o.order_status,
    o.order_date
FROM orders o
JOIN customers c
    ON o.customers_id = c.customers_id;

-- Create view using GROUP BY
CREATE VIEW customer_summary AS
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- Use view in another query
SELECT *
FROM product_performance
WHERE avg_rating >= 4;

-- Count records from view
SELECT COUNT(*)
FROM delivered_orders;

-- Compare performance of table vs view
SELECT COUNT(*)
FROM orders
WHERE order_status = 'delivered';

SELECT COUNT(*)
FROM delivered_orders;

-- Mini Project 1: Flipkart Reporting Layer
-- Create views for:
-- •	Customer summary
CREATE VIEW vw_customer_summary AS
SELECT 
    c.customers_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    MAX(o.order_date) AS last_order_date
FROM customers c
LEFT JOIN orders o
    ON c.customers_id = o.customers_id
GROUP BY c.customers_id, c.customer_name;

-- •	Product performance
CREATE VIEW vw_product_performance AS
SELECT 
    p.product_id,
    p.product_name,
    COUNT(r.review_id) AS total_reviews,
    AVG(r.rating) AS avg_rating
FROM products p
LEFT JOIN reviews r
    ON p.product_id = r.product_id
GROUP BY p.product_id, p.product_name;

-- •	Delivery performance
CREATE VIEW vw_delivery_performance AS
SELECT 
    d.delivery_partner,
    COUNT(d.delivery_id) AS total_deliveries,
    AVG(d.delivery_days) AS avg_delivery_days,
    SUM(CASE WHEN d.delivery_status = 'Delivered' THEN 1 ELSE 0 END) AS delivered_count
FROM deliveries d
GROUP BY d.delivery_partner;

-- Mini Project 2: Executive Dashboard View
-- Single view combining:
-- •	Orders
-- •	Customers
-- •	Delivery info
CREATE VIEW vw_executive_dashboard AS
SELECT 
    o.order_id,
    c.customer_name,
    o.order_status,
    o.order_date,
    o.payment_method,
    d.delivery_partner,
    d.delivery_days,
    d.delivery_status
FROM orders o
JOIN customers c
    ON o.customers_id = c.customers_id
LEFT JOIN deliveries d
    ON o.order_id = d.order_id;

-- Mini Project 3: Secure Public Data View
-- Create limited access view for reporting team.
CREATE VIEW vw_public_customer_data AS
SELECT 
    customers_id,
    customer_name,
    address
FROM customers;

-- Mini Project 4: KPI View Layer
-- Create one view with:
-- •	Total orders
-- •	Delivered orders
-- •	Avg delivery days
-- •	Total customers
CREATE VIEW vw_kpi_dashboard AS
SELECT 
    (SELECT COUNT(*) FROM orders) AS total_orders,
    (SELECT COUNT(*) FROM orders WHERE order_status = 'delivered') AS delivered_orders,
    (SELECT AVG(delivery_days) FROM deliveries) AS avg_delivery_days,
    (SELECT COUNT(*) FROM customers) AS total_customers;

-- Create index on order_date
CREATE INDEX odate on orders(order_date); 

-- Create index on customer_id
CREATE INDEX cid on customer(coustomer_id); 

-- Create composite index
CREATE INDEX odate_cid on orders(order_date,customer_id); 

-- Drop an index
DROP index odate on orders;

-- Use EXPLAIN on SELECT query
EXPLAIN SELECT * FROM customers;

-- Compare query before & after index
EXPLAIN SELECT * FROM orders;
CREATE INDEX odate on orders(order_date); 
EXPLAIN SELECT * FROM orders;

-- Optimize date filtering query
CREATE INDEX odate on orders(order_date); 

-- Identify full table scan
EXPLAIN SELECT * FROM orders WHERE order_status = "delivered";

-- Optimize JOIN query
CREATE INDEX idx_orders_customer ON orders(customer_id);
	SELECT 
		c.customer_name,
        c.customer_id,
        o.order_id,
        o.order_status
	FROM customers c
    LEFT JOIN orders o
    ON c.customer_id = o.customer_id;

-- Show indexes of table
SHOW INDEX FROM customers;

-- Remove unnecessary index
DROP INDEX odate_cid ON orders;

-- Mini Project 1: Query Performance Audit
-- •	Use EXPLAIN
EXPLAIN SELECT * FROM orders;

-- •	Add indexes
CREATE INDEX odate on orders(order_date); 

-- •	Compare performance
EXPLAIN SELECT * FROM orders;
CREATE INDEX idx_orders_date  ON orders(order_date);
EXPLAIN SELECT * 
FROM orders
WHERE order_date >= '2025-01-01';

-- Mini Project 2: JOIN Optimization
-- •	Optimize customer-order join
CREATE INDEX idx_orders_customer ON orders(customers_id);

-- •	Add index on foreign keys
CREATE INDEX idx_products_seller ON products(seller_id);


-- Mini Project 3: Date Filtering Optimization
-- •	Replace YEAR() filtering
SELECT *
FROM orders
WHERE order_date >= '2025-01-01'
AND order_date < '2026-01-01';

-- •	Improve performance
SELECT *
FROM orders
WHERE YEAR(order_date) = 2025;

SELECT *
FROM orders
WHERE order_date >= '2025-01-01'
AND order_date < '2026-01-01';

-- Mini Project 4: Index Strategy Design
-- Design indexing plan for:
-- Orders table
CREATE INDEX idx_orders_customer_date 
ON orders(customers_id, order_date);

-- Products table
CREATE INDEX idx_products_category_price 
ON products(product_catogery, product_price);

-- Create a BEFORE INSERT trigger on customers that prevents insertion if the email does not contain “@” and raise an error using SIGNAL.
DELIMITER //

CREATE TRIGGER before_insert_customers_email
BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
    IF NEW.email NOT LIKE '%@%' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid email: must contain @';
    END IF;
END//

DELIMITER ;

-- Create a BEFORE INSERT trigger on reviews that automatically sets review_date to CURRENT_DATE if it is inserted as NULL.
DELIMITER //

CREATE TRIGGER before_insert_reviews_date
BEFORE INSERT ON reviews
FOR EACH ROW
BEGIN
    IF NEW.review_date IS NULL THEN
        SET NEW.review_date = CURRENT_DATE;
    END IF;
END //

DELIMITER ;

-- Create a BEFORE INSERT trigger on deliveries that ensures delivery_days cannot be greater than 30; if greater, set it to 30.
DELIMITER //

CREATE TRIGGER before_insert_deliveries_days
BEFORE INSERT ON deliveries
FOR EACH ROW
BEGIN
    IF NEW.delivery_days > 30 THEN
        SET NEW.delivery_days = 30;
    END IF;
END//

DELIMITER ;

--  Create an AFTER INSERT trigger on reviews that inserts a record into a new table review_log(review_id, product_id, log_time) whenever a new review is added.
DELIMITER //

CREATE TRIGGER after_insert_reviews_log
AFTER INSERT ON reviews
FOR EACH ROW
BEGIN
    INSERT INTO review_log (review_id, product_id, log_time)
    VALUES (NEW.review_id, NEW.product_id, NOW());
END//

DELIMITER ;

-- Create an AFTER INSERT trigger on customers that inserts a welcome record into a table customer_activity(customer_id, activity_type, activity_time) with activity_type = 'New Signup'.
DELIMITER //

CREATE TRIGGER after_insert_customer_activity
AFTER INSERT ON customers
FOR EACH ROW
BEGIN
    INSERT INTO customer_activity (customer_id, activity_type, activity_time)
    VALUES (NEW.customer_id, 'New Signup', NOW());
END//

DELIMITER ;

--  Create an AFTER INSERT trigger on products that inserts a row into inventory_log(product_id, stock_added, log_time) recording the initial stock value.
DELIMITER //

CREATE TRIGGER after_insert_product_inventory
AFTER INSERT ON products
FOR EACH ROW
BEGIN
    INSERT INTO inventory_log (product_id, stock_added, log_time)
    VALUES (NEW.product_id, NEW.stock, NOW());
END//

DELIMITER ;

-- Create a BEFORE UPDATE trigger on deliveries that prevents updating delivery_status to 'Delivered' if delivery_days is NULL.
DELIMITER //

CREATE TRIGGER before_update_deliveries_status
BEFORE UPDATE ON deliveries
FOR EACH ROW
BEGIN
    IF NEW.delivery_status = 'Delivered' AND NEW.delivery_days IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Delivery days must be set before marking as Delivered';
    END IF;
END//

DELIMITER ;

-- Create a BEFORE UPDATE trigger on customers that blocks updating the mobile_no if the new number already exists in another customer record.
DELIMITER //

CREATE TRIGGER before_update_customers_mobile
BEFORE UPDATE ON customers
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM customers 
        WHERE mobile_no = NEW.mobile_no 
        AND customer_id <> OLD.customer_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Mobile number already exists';
    END IF;
END//

DELIMITER ;

-- Create a BEFORE UPDATE trigger on products that prevents reducing stock by more than 50 units in a single update operation.
DELIMITER //

CREATE TRIGGER before_update_products_stock
BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    IF OLD.stock - NEW.stock > 50 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot reduce stock by more than 50 units';
    END IF;
END//

DELIMITER ;

-- Create an AFTER UPDATE trigger on deliveries that logs changes of delivery_partner into a table delivery_partner_change(order_id, old_partner, new_partner, change_time).
DELIMITER //

CREATE TRIGGER after_update_deliveries_partner
AFTER UPDATE ON deliveries
FOR EACH ROW
BEGIN
    IF OLD.delivery_partner <> NEW.delivery_partner THEN
        INSERT INTO delivery_partner_change
        (order_id, old_partner, new_partner, change_time)
        VALUES
        (NEW.order_id, OLD.delivery_partner, NEW.delivery_partner, NOW());
    END IF;
END//

DELIMITER ;

-- Create an AFTER UPDATE trigger on customers that logs address changes into customer_address_log(customer_id, old_address, new_address, change_time).
DELIMITER //

CREATE TRIGGER after_update_customer_address
AFTER UPDATE ON customers
FOR EACH ROW
BEGIN
    IF OLD.address <> NEW.address THEN
        INSERT INTO customer_address_log
        (customer_id, old_address, new_address, change_time)
        VALUES
        (NEW.customer_id, OLD.address, NEW.address, NOW());
    END IF;
END//

DELIMITER ;

-- Create an AFTER UPDATE trigger on products that logs price changes into price_change_log(product_id, old_price, new_price, change_time) only if price actually changed.
DELIMITER //

CREATE TRIGGER after_update_products_price
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    IF OLD.price <> NEW.price THEN
        INSERT INTO price_change_log
        (product_id, old_price, new_price, change_time)
        VALUES
        (NEW.product_id, OLD.price, NEW.price, NOW());
    END IF;
END//

DELIMITER ;

-- Create a BEFORE DELETE trigger on customers that prevents deletion if the customer has any records in orders.
DELIMITER //

CREATE TRIGGER before_delete_customer_orders
BEFORE DELETE ON customers
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM orders WHERE customer_id = OLD.customer_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete customer with existing orders';
    END IF;
END//

DELIMITER ;

-- Create a BEFORE DELETE trigger on products that prevents deletion if the product stock is greater than 0.
DELIMITER //

CREATE TRIGGER before_delete_product_stock
BEFORE DELETE ON products
FOR EACH ROW
BEGIN
    IF OLD.stock > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete product with stock remaining';
    END IF;
END//

DELIMITER ;

-- Create a BEFORE DELETE trigger on deliveries that prevents deletion if delivery_status = 'In Transit'.
DELIMITER //

CREATE TRIGGER before_delete_delivery_status
BEFORE DELETE ON deliveries
FOR EACH ROW
BEGIN
    IF OLD.delivery_status = 'In Transit' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete delivery that is In Transit';
    END IF;
END//

DELIMITER ;

-- Create an AFTER DELETE trigger on reviews that inserts deleted review details into deleted_reviews_log(review_id, product_id, customer_id, deleted_time).
DELIMITER //

CREATE TRIGGER after_delete_reviews_log
AFTER DELETE ON reviews
FOR EACH ROW
BEGIN
    INSERT INTO deleted_reviews_log
    (review_id, product_id, customer_id, deleted_time)
    VALUES
    (OLD.review_id, OLD.product_id, OLD.customer_id, NOW());
END//

DELIMITER ;

-- Create an AFTER DELETE trigger on products that inserts deleted product information into product_archive(product_id, product_name, deleted_time).
DELIMITER //

CREATE TRIGGER after_delete_products_archive
AFTER DELETE ON products
FOR EACH ROW
BEGIN
    INSERT INTO product_archive
    (product_id, product_name, deleted_time)
    VALUES
    (OLD.product_id, OLD.product_name, NOW());
END//

DELIMITER ;

-- Create an AFTER DELETE trigger on sellers that logs seller removal into seller_removal_log(seller_id, seller_name, removal_time).
DELIMITER //

CREATE TRIGGER after_delete_sellers_log
AFTER DELETE ON seller
FOR EACH ROW
BEGIN
    INSERT INTO seller_removal_log
    (seller_id, seller_name, removal_time)
    VALUES
    (OLD.seller_id, OLD.seller_name, NOW());
END//

DELIMITER ;