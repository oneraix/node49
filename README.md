-----QUERY-----
--Tìm 5 người đã like nhà hàng nhiều nhất
SELECT `users`.`userId`, `fullName`, `email`, COUNT(`users`.`userId`) AS `lượt thích`
FROM `users`
INNER JOIN `like_res` ON users.userId = like_res.userId
GROUP BY users.userId
ORDER BY COUNT(`users`.`userId`) DESC
LIMIT 5

--Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT `restaurants`.`resId`, `resName`, `restaurants`.`image`, `restaurants`.`desc`, 
COUNT(`restaurants`.`resId`) AS `lượt thích`
FROM `restaurants`
INNER JOIN `like_res` ON restaurants.resId = like_res.resId
GROUP BY restaurants.resId
ORDER BY COUNT(`restaurants`.`resId`) DESC
LIMIT 2

--Tìm người đã đặt hàng nhiều nhất
SELECT `users`.`userId`, `fullName`, `email`, COUNT(`users`.`userId`) AS `lần đặt hàng`
FROM `users`
INNER JOIN `orders` ON users.userId = orders.userId
GROUP BY users.userId
ORDER BY COUNT(`users`.`userId`) DESC 
LIMIT 1

--Tìm người dùng không hoạt động
SELECT u.*
FROM users 
LEFT JOIN orders ON users.userId = orders.userId
LEFT JOIN like_res ON users.userId = like_res.userId
LEFT JOIN rate_res ON users.userId = rate_res.userId
WHERE orders.userId IS NULL AND like_res.userId IS NULL AND rate_resr.userId IS NULL;

