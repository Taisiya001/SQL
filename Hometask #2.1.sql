USE sales;
CREATE TABLE orders
(
id INT AUTO_INCREMENT PRIMARY KEY,
employee_id varchar(100) not null,
amount varchar(100) not null,
order_status varchar(100) not null
);
INSERT INTO orders (employee_id, amount, order_status)
VALUES 
("e03","15.00","OPEN"),
("e01","25.50","OPEN"),
("e05","100.70","CLOSED"),
("e02","22.18","OPEN"),
("e04","9.50","CANCELLED");
SELECT id, order_status,
IF (order_status = "OPEN", "Order is in open state",
    IF (order_status = "CLOSED", "Order is closed",
        IF (order_status = "CANCELLED", "Order is cancelled","NOT FOUND"))) as FULL_ORDER_STATUS
FROM orders;
