USE semimar_4;
/*Посчитайте общее количество лайков, которые  получили пользователи младше 12 лет*/
/*SELECT id, firstname, lastname,
(SELECT birthday profiles WHERE profiles.user_id = users.id) AS year_age,
(SELECT (YEAR(current_date) -YEAR(birthday)) - (RIGHT(current_date,5)< Right(birthday,5)) AS age
FROM users;*/
SELECT P.user_id, P.gender, P.birthday, COUNT(*) AS like_count FROM profiles AS P
JOIN users AS U ON P.user_id = U.id
JOIN likes AS L ON P.user_id = L.user_id
/*WHERE P.user_id IN (SELECT p_age FROM P WHERE p_age < 12)
WHERE P.user_id = (SELECT P.user_id FROM profiles WHERE birthday = '1994-06-15')*/
WHERE (YEAR(current_date) -YEAR(birthday)) - (RIGHT(current_date,5)< Right(birthday,5)) < 12
GROUP BY P.user_id;
/*Определить кто больше поставил лайков: мужчины и женщины*/
SELECT  P.gender, COUNT(*)
FROM profiles AS P
JOIN likes AS L ON P.user_id = L.user_id
GROUP BY gender;
/*Вывести всех пользователей, которые не отправляли сообщения*/
SELECT * FROM users AS U
WHERE NOT EXISTS(SELECT * FROM messages AS M WHERE M.from_user_id = U.id)
GROUP BY U.id;
/*Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех написал ему сообщений*/
SELECT from_user_id, to_user_id, COUNT(*) AS like_count FROM messages AS P
WHERE to_user_id = 7
GROUP BY from_user_id;
