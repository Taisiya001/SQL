USE semimar_4;
/*Создайте представление, в которое попадет информация о пользователях (имя, фамилия, город и пол), которые не старше 20 лет.*/
CREATE VIEW all_users AS
SELECT user_id, hometown, gender, birthday,
(SELECT firstname FROM users WHERE users.id = profiles.user_id) AS user_name,
(SELECT lastname FROM users WHERE users.id = profiles.user_id) AS user_lastname
FROM profiles
WHERE (YEAR(current_date) -YEAR(birthday)) - (RIGHT(current_date,5)< Right(birthday,5)) <= 20;
/*Найдите кол-во, отправленных сообщений каждым пользователем и выведите ранжированный список пользователей,
указав имя и фамилию пользователя, количество отправленных сообщений и место в рейтинге (первое место у пользователя с максимальным количеством сообщений) . (используйте DENSE_RANK)*/
SELECT from_user_id, to_user_id,
(SELECT firstname FROM users WHERE users.id = messages.from_user_id) AS user_name,
(SELECT lastname FROM users WHERE users.id = messages.from_user_id) AS user_lastname,
DENSE_RANK () OVER (PARTITION BY to_user_id order by id desc)
FROM messages;
/*Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления (created_at) 
и найдите разницу дат отправления между соседними сообщениями, получившегося списка. (используйте LEAD или LAG)*/
SELECT body, created_at,
LAG(created_at) OVER(ORDER BY created_at) AS 'LAG'
FROM messages;
