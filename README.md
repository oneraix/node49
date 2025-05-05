## 📊 SQL Queries

### 🔹 Tìm 5 người đã like nhà hàng nhiều nhất
```sql
-- Truy vấn này tìm ra 5 người dùng có số lượt thích (like) nhà hàng nhiều nhất.
SELECT `users`.`userId`, `fullName`, `email`, COUNT(`users`.`userId`) AS `lượt thích`
FROM `users`
INNER JOIN `like_res` ON users.userId = like_res.userId  -- Liên kết bảng users với bảng like_res
GROUP BY users.userId  -- Nhóm kết quả theo userId
ORDER BY COUNT(`users`.`userId`) DESC  -- Sắp xếp theo số lượt thích giảm dần
LIMIT 5;  -- Lấy 5 người dùng có lượt thích nhiều nhất
-- Truy vấn này tìm ra 2 nhà hàng có số lượt like nhiều nhất.
SELECT `restaurants`.`resId`, `resName`, `restaurants`.`image`, `restaurants`.`desc`, 
COUNT(`restaurants`.`resId`) AS `lượt thích`
FROM `restaurants`
INNER JOIN `like_res` ON restaurants.resId = like_res.resId  -- Liên kết bảng restaurants với bảng like_res
GROUP BY restaurants.resId  -- Nhóm kết quả theo resId
ORDER BY COUNT(`restaurants`.`resId`) DESC  -- Sắp xếp theo số lượt thích giảm dần
LIMIT 2;  -- Lấy 2 nhà hàng có lượt like nhiều nhất
-- Truy vấn này tìm ra người dùng đã đặt hàng nhiều nhất.
SELECT `users`.`userId`, `fullName`, `email`, COUNT(`users`.`userId`) AS `lần đặt hàng`
FROM `users`
INNER JOIN `orders` ON users.userId = orders.userId  -- Liên kết bảng users với bảng orders
GROUP BY users.userId  -- Nhóm kết quả theo userId
ORDER BY COUNT(`users`.`userId`) DESC  -- Sắp xếp theo số lần đặt hàng giảm dần
LIMIT 1;  -- Lấy người dùng đã đặt hàng nhiều nhất
-- Truy vấn này tìm ra người dùng không thực hiện bất kỳ hành động nào (like, đặt hàng, đánh giá).
SELECT u.*
FROM users u 
LEFT JOIN orders ON users.userId = orders.userId  -- Liên kết với bảng orders để kiểm tra đơn hàng
LEFT JOIN like_res ON users.userId = like_res.userId  -- Liên kết với bảng like_res để kiểm tra lượt thích
LEFT JOIN rate_res ON users.userId = rate_res.userId  -- Liên kết với bảng rate_res để kiểm tra đánh giá
WHERE orders.userId IS NULL AND like_res.userId IS NULL AND rate_res.userId IS NULL;  -- Chỉ lấy những người không có hành động nào
