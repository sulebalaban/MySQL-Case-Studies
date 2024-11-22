CREATE SCHEMA dannys_diner;

USE dannys_diner;
CREATE TABLE sales(
customer_id VARCHAR(1),
order_date DATE ,
product_id INT
);

INSERT INTO sales (customer_id, order_date, product_id)
VALUES 
('A', '2021-01-07', 2),
('A', '2021-01-10', 3),
('A', '2021-01-03', 3),
('A', '2021-01-01', 3),
('B', '2021-01-09', 7),
('B', '2021-01-04', 1),
('B', '2021-01-11', 1),
('C', '2021-01-16', 6),
('C', '2021-01-12', 1),
('C', '2021-01-13', 4),
('C', '2021-01-17', 1),
('D', '2021-01-15', 5),
('D', '2021-01-25', 5),
('D', '2021-01-28', 6),
('E', '2021-02-02', 4),
('E', '2021-02-05', 1),
('E', '2021-02-07', 3),
('F', '2021-02-10', 3),
('F', '2021-02-15', 1);


CREATE TABLE menu(
product_id INTEGER,
product_name VARCHAR(15),
price INTEGER
);

INSERT INTO menu (product_id, product_name, price)
VALUES
('1', 'sushi', '10'),
('2', 'curry', '15'),
('3', 'ramen', 12),
('4', 'tempura', 20),
('5', 'miso soup', 8),
('6', 'gyoza', 9),
('7', 'sashimi', 18);

CREATE TABLE members (
  customer_id VARCHAR(1),
  join_date DATE
);

INSERT INTO members(customer_id,join_date)
VALUES
('A', '2021-01-01'),
('B', '2021-01-04'),
('C', '2021-01-12'),
('D', '2021-01-15'),
('E', '2021-01-20'),
('F', '2021-02-01');