-- CSDL


-- Tạo database
CREATE DATABASE db_demo123
CREATE DATABASE IF NOT EXISTS db_demo123

-- Xoá database
DROP DATABASE db_demo123
DROP DATABASE IF EXISTS db_demo123

-- Chọn database
USE db_demo

-- TABLE

-- Tạo table
CREATE TABLE IF NOT EXISTS `users` (
	`id` INT,
	`fullName` VARCHAR(255),
	`email` VARCHAR(255),
	`isActive` BOOLEAN
)

-- Xoá table
DROP TABLE `users`

--Thêm cột khi đã có table
ALTER TABLE `users`
ADD `password` VARCHAR(255)

-- Chỉnh sửa cột sau khi đã có table
ALTER TABLE `users`
MODIFY COLUMN `isActive` BOOLEAN DEFAULT 1


-- Thêm thuộc tính khoá, tự tăng cho id
ALTER TABLE `users`
MODIFY COLUMN `id` INT PRIMARY KEY AUTO_INCREMENT


--Xoá tất cả dữ liệu trong một bảng
TRUNCATE TABLE `users`


-- Ràng buộc
-- NOT NULL: cột không được NULL, bắt buộc phải có dữ liệu
CREATE TABLE `not_null`(
	id INT NOT NULL
)

-- UNIQUE: duy nhất, dữ liệu ở cột đó không được trùng nhau
CREATE TABLE `unique` (
	id INT NOT NULL UNIQUE
)

-- PRIMARY KEY: kết hợp của NOT NULL và UNIQUE
-- AUTO_INCREMENT: tăng số tự động, tránh bị trùng lặp 
CREATE TABLE `primary_key` (
	id INT PRIMARY KEY AUTO_INCREMENT
)

INSERT INTO `users` (`id`, `email`, `fullName`, `password`) VALUES 
(1, "vominhhieu@gmail.com", "Vo Minh Hieu 1", "minhhieu"),
(2, "vominhhieu@gmail.com", "Vo Minh Hieu 2", "minhhieu"),
(3, "vominhhieu@gmail.com", "Vo Minh Hieu 3", "minhhieu"),
(4, "vominhhieu@gmail.com", "Vo Minh Hieu 4", "minhhieu"),
(5, "vominhhieu@gmail.com", "Vo Minh Hieu 5", "minhhieu")


CREATE TABLE `foods`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`foodName` VARCHAR(255),
	`decription` VARCHAR(255)
)


INSERT INTO `foods`(`id`, `foodName`, `decription`) VALUES
(1, "Bánh bao", "làm từ bao"),
(2, "Bánh bò", "làm từ bò"),
(3, "Bánh trứng", "không làm từ trứng"),
(4, "Mỳ cay", "làm từ bà bán mì"),
(5, "Bò sốt hàu", "bò bò bò bò bò")


CREATE TABLE `orders`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`userId` INT,
	`foodId` INT,
	FOREIGN KEY (userId) REFERENCES `users` (id),
	FOREIGN KEY (foodId) REFERENCES `foods` (id)
)


INSERT INTO `orders` (`userId`, `foodId`) VALUES
(1,2),
(3,2),
(4,5),
(1,4),
(3,1),
(1,2),
(2,3)



----------- QUERY ------------

SELECT * FROM `orders` WHERE `id` = 3

--INNER JOIN
SELECT *
FROM `orders`
INNER JOIN `users` ON `orders`.userId = `users`.id

--LEFT JOIN: lấy table bên trái làm chuẩn
--Trả về tất cả các  record từ bảng bên trái ngay cả khi bảng bên phải không có record khớp.
SELECT *
FROM `orders`
LEFT JOIN `users` ON `orders`.userId = `users`.id

--CROSS JOIN
SELECT *
FROM `users`
CROSS JOIN `orders`


--Ví dụ tìm người đã đặt hàng nhiều nhất
SELECT `userId`, `users`.`id`, `fullName`, `email`, `isActive`, `password`, COUNT(userId) AS `ĐẾM`
FROM `orders`
INNER JOIN `users` ON `users`.id = `orders`.userId
GROUP BY `orders`.userId
ORDER BY COUNT(userId) DESC
LIMIT 1

