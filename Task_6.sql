use mysql;

-- Create the orders table
CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    product_id INT,
    amount DECIMAL(10,2)
);

-- Insert sample data
INSERT INTO orders (order_id, order_date, product_id, amount) VALUES
(1, '2023-01-01', 101, 10.00),
(1, '2023-01-01', 102, 15.00),
(2, '2023-01-15', 103, 20.00),
(3, '2023-02-01', 101, 10.00),
(4, '2023-02-15', 104, 25.00),
(4, '2023-02-15', 105, 30.00),
(5, '2024-01-01', 101, 12.00),
(6, '2024-01-15', 102, 18.00),
(7, '2024-02-01', 103, 22.00);

-- Query to analyze monthly revenue and order volume
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    year,
    month;
