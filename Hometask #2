USE sales;
CREATE TABLE sales
(
id INT AUTO_INCREMENT PRIMARY KEY,
order_date varchar(100) not null,
count_product int
);
INSERT INTO sales (order_date,count_product)
VALUES
("2022-01-01",156),
("2022-01-02",180),
("2022-01-03",21),
("2022-01-04",124),
("2022-01-05",341);
SELECT id, count_product,
CASE 
WHEN count_product BETWEEN 0 AND 100 THEN "Маленький заказ"
WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
WHEN count_product > 300 THEN "Большой заказ"
ELSE "others"
END as GEEDFR
FROM sales;
    
