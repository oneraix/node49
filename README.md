## 📊 SQL Queries

--Tìm ra 5 người dùng có số lượt thích (like) nhà hàng nhiều nhất.
SELECT `users`.`userId`, `fullName`, `email`, COUNT(`users`.`userId`) AS `lượt thích`
FROM `users`
INNER JOIN `like_res` ON users.userId = like_res.userId  
GROUP BY users.userId  
ORDER BY COUNT(`users`.`userId`) DESC 
LIMIT 5; 

--Tìm ra 2 nhà hàng có số lượt like nhiều nhất.
SELECT `restaurants`.`resId`, `resName`, `restaurants`.`image`, `restaurants`.`desc`, 
COUNT(`restaurants`.`resId`) AS `lượt thích`
FROM `restaurants`
INNER JOIN `like_res` ON restaurants.resId = like_res.resId  
GROUP BY restaurants.resId 
ORDER BY COUNT(`restaurants`.`resId`) DESC 
LIMIT 2;  

--Tìm ra người dùng đã đặt hàng nhiều nhất.
SELECT `users`.`userId`, `fullName`, `email`, COUNT(`users`.`userId`) AS `lần đặt hàng`
FROM `users`
INNER JOIN `orders` ON users.userId = orders.userId 
GROUP BY users.userId  -- Nhóm kết quả theo userId
ORDER BY COUNT(`users`.`userId`) DESC  
LIMIT 1;  

--Tìm ra người dùng không thực hiện bất kỳ hành động nào (like, đặt hàng, đánh giá).
SELECT u.*
FROM users u 
LEFT JOIN orders ON users.userId = orders.userId 
LEFT JOIN like_res ON users.userId = like_res.userId 
LEFT JOIN rate_res ON users.userId = rate_res.userId
WHERE orders.userId IS NULL AND like_res.userId IS NULL AND rate_res.userId IS NULL;  
