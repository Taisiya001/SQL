USE myfirstdb;
CREATE TABLE staff
(id INT AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(20) NOT NULL,
lastname VARCHAR(50) NOT NULL,
age INT,
post VARCHAR(50) NOT NULL,
seniority VARCHAR(70),
salary INT
);
INSERT INTO staff (firstname, lastname, post, seniority,salary, age)
VALUES
('Вася', 'Петров', 'Начальник', 40, 10000, 60),
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
/*Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания*/
SELECT * FROM staff
ORDER BY salary;

SELECT * FROM staff
ORDER BY salary DESC;
/*Выведите 5 максимальных заработных плат*/
SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5;

/*Посчитайте суммарную зарплату по каждой специальности*/

SELECT SUM(salary), post FROM staffds
GROUP BY post;

/*Найдите кол-во сотрудников со специальностью "Рабочий" в возрасте от 24 до 49 лет включительно*/

SELECT COUNT(*) FROM staff
WHERE post='Рабочий' AND age BETWEEN 24 AND 49;

/*Найдите количество специальностей*/

SELECT COUNT(DISTINCT post) FROM staff;

/*Выведите специальности, у которых средний овзраст сотрудников меньше 30 лет*/

SELECT DISTINCT post FROM staff
WHERE age < 30;
