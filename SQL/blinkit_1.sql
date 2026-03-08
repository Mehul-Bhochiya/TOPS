create database blinkit;
use blinkit;
 
 
 create table customers ( 
	customers_id int primary key auto_increment,
	customer_name varchar(100) not null,
	mobile_no varchar(15) not null unique,
	email varchar(100) not null unique,
	address varchar(200) not null,
	singup_date datetime default current_timestamp
 );

 create table seller (
	seller_id INT PRIMARY KEY auto_increment,
    seller_name VARCHAR(50) not null,
    seller_city VARCHAR(30) not null,
    seller_rating DECIMAL(2,1),
    seller_active BOOLEAN not null
 );

 create table products (
	product_id int primary key auto_increment,
    product_name varchar(500) not null,
    product_catogery varchar(500) not null,
    product_price decimal(10,2),
    stock INT check (stock >= 0),
	seller_id INT,
    FOREIGN KEY (seller_id) REFERENCES seller(seller_id)
 );

 create table orders (
	order_id int primary key auto_increment,
    Order_status varchar(200) not null,
    order_date DATE,
    payment_method VARCHAR(30) not null,
    customers_id int,
    foreign key(customers_id)references customers(customers_id) ON DELETE CASCADE 
 );
 
 CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY auto_increment,
    order_id INT,
    delivery_partner VARCHAR(50),
    shipment_mode VARCHAR(30),
    delivery_days INT,
    delivery_status VARCHAR(30),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
 
 CREATE TABLE reviews (
    review_id INT PRIMARY KEY auto_increment,
    product_id INT,
    customers_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text VARCHAR(255),
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customers_id) REFERENCES customers(customers_id)
);

 
INSERT INTO customers (customer_name, mobile_no, email, address)
VALUES ( 'Kaushal Patel', 78546931252,'kapatel@gmail.com','Memnagar, Ahmedabad' ),
('Rohan Mehta', '9876543210', 'rohan.mehta@gmail.com', 'Navrangpura, Ahmedabad'),
('Priya Shah', '9123456789', 'priya.shah@yahoo.com', 'Satellite, Ahmedabad'),
('Amit Verma', '9988776655', 'amit.verma@outlook.com', 'Bopal, Ahmedabad'),
('Neha Joshi', '9090909090', 'neha.joshi@gmail.com', 'Vastrapur, Ahmedabad'),
('Sanjay Patel', '8899776655', 'sanjay.patel@gmail.com', 'Maninagar, Ahmedabad'),
('Anjali Desai', '9012345678', 'anjali.desai@gmail.com', 'Paldi, Ahmedabad'),
('Kunal Rana', '9345678123', 'kunal.rana@icloud.com', 'Gota, Ahmedabad'),
('Pooja Trivedi', '9567890123', 'pooja.trivedi@gmail.com', 'Thaltej, Ahmedabad'),
('Vikas Malhotra', '9786543210', 'vikas.malhotra@protonmail.com', 'Chandkheda, Ahmedabad');

INSERT INTO customers (customer_name, mobile_no, email, address)
VALUES
('Rahul Singh', '9812345670', 'rahul.singh@gmail.com', 'Naranpura, Ahmedabad'),
('Sneha Kapoor', '9823456781', 'sneha.kapoor@yahoo.com', 'Prahlad Nagar, Ahmedabad'),
('Arjun Patel', '9834567892', 'arjun.patel@outlook.com', 'Science City, Ahmedabad'),
('Mehul Jain', '9845678903', 'mehul.jain@gmail.com', 'Motera, Ahmedabad'),
('Kavita Sharma', '9856789014', 'kavita.sharma@gmail.com', 'Ranip, Ahmedabad'),
('Nikhil Joshi', '9867890125', 'nikhil.joshi@icloud.com', 'Sabarmati, Ahmedabad'),
('Ritu Agarwal', '9878901236', 'ritu.agarwal@gmail.com', 'Ellis Bridge, Ahmedabad'),
('Yash Malviya', '9889012347', 'yash.malviya@protonmail.com', 'Iskon, Ahmedabad'),
('Divya Choudhary', '9890123458', 'divya.choudhary@gmail.com', 'Jodhpur, Ahmedabad'),
('Harsh Vora', '9801234569', 'harsh.vora@gmail.com', 'Vejalpur, Ahmedabad');


INSERT INTO seller (seller_name, seller_city, seller_rating, seller_active)
VALUES ('Ram patel', 'Patan', 2.2, 0),
('Ajay Shah', 'Ahmedabad', 4.5, 1),
('Neha mehta', 'Surat', 3.8, 1),
('Rakesh Kumar', 'Vadodara', 4.0, 0),
('Pooja Patel', 'Rajkot', 2.9, 1),
('Sanjay Verma', 'Gandhinagar', 4.7, 1),
('Kiran Joshi', 'Bhavnagar', 3.2, 0),
('Manish Rana', 'Junagadh', 4.1, 1),
('Anita Desai', 'Anand', 2.5, 0),
('Vikram Chauhan', 'Mehsana', 3.9, 1);


INSERT INTO products (product_name, product_catogery, product_price, stock, seller_id)
VALUE ('zebronics mouse', 'Electronics', 599, 8, 2),
('Logitech Keyboard', 'Electronics', 1299, 12, 1),
('Samsung Power Bank', 'Electronics', 1899, 15, 3),
('Boat Headphones', 'Electronics', 2499, 6, 4),
('HP Laptop Backpack', 'Accessories', 1799, 10, 5),
('Mi Smart Band', 'Wearables', 2999, 20, 6),
('Philips Trimmer', 'Personal Care', 1599, 9, 7),
('Canon Printer', 'Electronics', 8499, 4, 8),
('Prestige Induction Cooktop', 'Home Appliances', 3299, 7, 9),
('Wildcraft Travel Bag', 'Accessories', 2199, 11, 10);

INSERT INTO orders (order_status, order_date, payment_method, customers_id)
VALUE ('shipped', '2025-11-16','COD', 4),
('pending', '2025-11-17', 'UPI', 1),
('delivered', '2025-11-18', 'Card', 2),
('cancelled', '2025-11-19', 'COD', 3),
('shipped', '2025-11-20', 'UPI', 5),
('processing', '2025-11-21', 'Card', 6),
('delivered', '2025-11-22', 'COD', 7),
('returned', '2025-11-23', 'UPI', 8),
('shipped', '2025-11-24', 'Card', 9),
('pending', '2025-11-25', 'COD', 10);



INSERT INTO deliveries (order_id, delivery_partner, shipment_mode, delivery_days, delivery_status)
VALUES (3, 'Bluedart', 'Express',  2, 'Delivered'),
(4, 'Delhivery', 'Standard', 5, 'InTransit'),
(5, 'Ecom Express', 'Express',  3, 'Delivered'),
(6, 'Amazon Logistics', 'Standard', 6, 'Pending'),
(7, 'DTDC', 'Express',  2, 'Delivered'),
(8, 'XpressBees', 'Standard', 4, 'InTransit'),
(9, 'Shadowfax', 'Express',  1, 'Delivered'),
(10,'Bluedart', 'Standard', 5, 'Delay'),
(2, 'Delhivery', 'Express',  3, 'Delivered');



INSERT INTO reviews (product_id, customers_id, rating, review_text, review_date)
VALUES (1, 1, 5, 'Mouse quality is excellent and comfortable.', '2025-04-30'),
(3, 2, 4, 'Power bank charges fast and works well.', '2025-05-01'),
(4, 4, 3, 'Sound quality is decent for the price.', '2025-05-02'),
(5, 5, 5, 'Backpack is strong and looks premium.', '2025-05-03'),
(6, 6, 4, 'Smart band features are very useful.', '2025-05-04'),
(7, 7, 3, 'Trimmer is good but battery could be better.', '2025-05-05'),
(8, 8, 4, 'Printer gives clear prints.', '2025-05-06'),
(9, 9, 5, 'Cooktop heats quickly and is easy to use.', '2025-05-07'),
(9, 9, 5, 'Cooktop heats quickly and is easy to use.', '2025-05-07'),
(10, 10, 4, 'Travel bag has good space and quality.', '2025-05-08');


select * from customers;
