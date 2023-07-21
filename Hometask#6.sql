USE semimar_4;
/*Создайте таблицу users_old, аналогичную таблице users.
 Создайте процедуру, с помощью которой можно переместить любого (одного) пользователя из таблицы users в таблицу users_old. 
 (использование транзакции с выбором commit или rollback – обязательно*/
CREATE TABLE users_old (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE
);
CREATE PROCEDURE Move_users(id INT)

START TRANSACTION;
SELECT*INTO @user FROM users WHERE id = id;
INSERT INTO users_old(id,firstname, lastname, email)
VALUES(@user.id,@user.firstname,@user.lastname, @user.email);
DELETE FROM users WHERE id = id;
COMMIT;
CALL Move_users(1);
 
/*Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".*/
DELIMITER //

CREATE FUNCTION hello ()
RETURNS TINYTEXT NOT DETERMINISTIC
BEGIN
	DECLARE hour INT;
	SET hour = HOUR(NOW());
	CASE
		WHEN hour BETWEEN 0 AND 5 THEN RETURN "Доброй ночи";
		WHEN hour BETWEEN 6 AND 11 THEN RETURN "Доброе утро";
		WHEN hour BETWEEN 12 AND 17 THEN RETURN "Добрый день";
		WHEN hour BETWEEN 18 AND 23 THEN RETURN "Добрый вечер";
	END CASE;
END//

SELECT NOW(), hello()//
