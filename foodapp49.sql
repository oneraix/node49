--Tạo cơ sở dữ liệu
CREATE DATABASE `food_app_node49`

--Chọn cơ sở dữ liệu
USE `food_app_node49`

-----TẠO BẢNG-----

--Tạo bảng users
CREATE TABLE `users`(
	userId INT PRIMARY KEY AUTO_INCREMENT,
	fullName VARCHAR (255),
	email VARCHAR (255),
	password VARCHAR (255)
)

--Tạo bảng restaurants
CREATE TABLE `restaurants`(
	resId INT PRIMARY KEY AUTO_INCREMENT,
	resName VARCHAR (255),
	image VARCHAR (255),
	`desc` VARCHAR (255)
)

--Tạo bảng food_types
CREATE TABLE `food_types`(
	typeId INT PRIMARY KEY AUTO_INCREMENT,
	typeName VARCHAR (255)
)

--Tạo bảng foods
CREATE TABLE `foods`(
	foodId INT PRIMARY KEY AUTO_INCREMENT,
	foodName VARCHAR (255),
	image VARCHAR (255),
	price FLOAT,
	`desc` VARCHAR (255),
	typeId INT,
	FOREIGN KEY (typeId) REFERENCES `food_types` (typeId)
)

--Tạo bảng sub_foods
CREATE TABLE `sub_foods`(
	subId INT PRIMARY KEY AUTO_INCREMENT,
	subName VARCHAR (255),
	subPrice float,
	foodId INT,
	FOREIGN KEY (foodId) REFERENCES `foods` (foodId)
)

--Tạo bảng orders
CREATE TABLE `orders`(
	userId INT,
	foodId INT,
	amount INT,
	code VARCHAR (255),
	arrSubId VARCHAR (255),
	FOREIGN KEY (userId) REFERENCES `users` (userId),
	FOREIGN KEY (foodId) REFERENCES `foods` (foodId)
)

--Tạo bảng like_res
CREATE TABLE `like_res`(
	userId INT,
	resId INT,
	dateLike DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (userId) REFERENCES `users` (userId),
	FOREIGN KEY (resId) REFERENCES `restaurants` (resId)
)

--Tạo bảng rate_res
CREATE TABLE `rate_res`(
	userId INT,
	resId INT,
	amount INT,
	dateRate DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (userId) REFERENCES `users` (userId),
	FOREIGN KEY (resId) REFERENCES `restaurants`(resId)
)

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
FROM users u
LEFT JOIN orders o ON u.userId = o.userId
LEFT JOIN like_res l ON u.userId = l.userId
LEFT JOIN rate_res r ON u.userId = r.userId
WHERE o.userId IS NULL AND l.userId IS NULL AND r.userId IS NULL;

