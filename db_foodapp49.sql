-----TẠO DỮ LIỆU-----
-- Đổ dữ liệu cho bảng users
INSERT INTO `users` (fullName, email, password) VALUES
('Nguyễn Văn A', 'vana@example.com', '123456'),
('Trần Thị B', 'thib@example.com', 'abcdef'),
('Lê Văn C', 'vanc@example.com', 'password'),
('Phạm Thị D', 'thid@example.com', 'qwerty'),
('Hoàng Văn E', 'vane@example.com', '123abc'),
('Ngô Thị F', 'thif@example.com', 'pass123'),
('Đỗ Văn G', 'vang@example.com', '111111'),
('Trịnh Thị H', 'thih@example.com', 'abc123'),
('Phan Văn I', 'vani@example.com', '654321'),
('Bùi Thị J', 'thij@example.com', 'aaaaaa'),
('Mai Thị K', 'thik@example.com', '112233'),
('Đặng Văn L', 'vanl@example.com', 'abcdef123'),
('Hà Thị M', 'thim@example.com', 'pass456'),
('Võ Văn N', 'vann@example.com', '999999'),
('Cao Thị O', 'thio@example.com', 'password1'),
('Hoàng Văn P', 'vanp@example.com', 'password5');

-- Đổ dữ liệu cho bảng restaurants
INSERT INTO `restaurants` (resName, image, `desc`) VALUES
('Nhà hàng Gió Biển', 'gio_bien.jpg', 'Hải sản tươi sống'),
('Ẩm thực Hà Nội', 'am_thuc_hn.jpg', 'Đặc sản miền Bắc'),
('Nhà hàng Chay Sen', 'sen_chay.jpg', 'Ẩm thực chay thanh đạm'),
('Nhà hàng Sài Gòn Xưa', 'sg_xua.jpg', 'Phong vị Sài Gòn thập niên 80'),
('BBQ Hàn Quốc', 'bbq_korea.jpg', 'Thịt nướng và món Hàn đặc trưng'),
('Pizza Ý 365', 'pizza_365.jpg', 'Pizza nướng lò chuẩn Ý'),
('Nhà hàng Nhật Sakura', 'sakura.jpg', 'Sushi, sashimi và ramen truyền thống'),
('Gà Rán Texas', 'texas.jpg', 'Đồ ăn nhanh phong cách Mỹ'),
('Bún Đậu Mẹt', 'bun_dau.jpg', 'Bún đậu mắm tôm truyền thống'),
('Dimsum Hồng Kông', 'dimsum.jpg', 'Dimsum chuẩn vị Quảng Đông'),
('Ẩm thực Huế Xưa', 'hue_xua.jpg', 'Món ăn cung đình Huế'),
('Cháo Ếch Singapore', 'chao_ech.jpg', 'Cháo ếch cay nồng đặc trưng'),
('Burger Ngon', 'burger.jpg', 'Burger theo phong cách Mỹ');

-- Đổ dữ liệu cho bảng food_types
INSERT INTO `food_types` (typeName) VALUES
('Món chính'),
('Tráng miệng'),
('Đồ uống'),
('Món khai vị'),
('Món chay');

-- Đổ dữ liệu cho bảng foods
INSERT INTO `foods` (foodName, image, price, `desc`, typeId) VALUES
('Phở bò', 'pho_bo.jpg', 45000, 'Phở bò truyền thống', 1),
('Cơm tấm', 'com_tam.jpg', 40000, 'Cơm tấm sườn bì chả', 1),
('Bánh flan', 'banh_flan.jpg', 20000, 'Món tráng miệng ngọt ngào', 2),
('Trà đào', 'tra_dao.jpg', 25000, 'Trà đào mát lạnh', 3),
('Gỏi cuốn', 'goi_cuon.jpg', 15000, 'Gỏi cuốn tôm thịt', 4),
('Bún chay', 'bun_chay.jpg', 30000, 'Món chay thanh đạm', 5),
('Cà phê sữa đá', 'cafe_sua.jpg', 22000, 'Cà phê đậm đà', 3),
('Pizza bò', 'pizza_bo.jpg', 90000, 'Pizza bò phô mai', 1),
('Sushi cá hồi', 'sushi.jpg', 80000, 'Sushi cá hồi tươi', 1),
('Mì ramen', 'ramen.jpg', 70000, 'Mì ramen Nhật Bản', 1),
('Chè thái', 'che_thai.jpg', 25000, 'Chè trái cây ngọt mát', 2),
('Bún bò Huế', 'bun_bo_hue.jpg', 50000, 'Bún bò vị Huế đậm đà', 1),
('Kem dừa', 'kem_dua.jpg', 25000, 'Kem lạnh thơm mát trong trái dừa', 2),
('Nước cam', 'nuoc_cam.jpg', 20000, 'Nước cam nguyên chất', 3),
('Chả giò', 'cha_gio.jpg', 15000, 'Chả giò chiên giòn', 4),
('Mì xào chay', 'mi_xao_chay.jpg', 30000, 'Mì xào rau củ', 5);

-- Đổ dữ liệu cho bảng sub_foods
INSERT INTO `sub_foods` (subName, subPrice, foodId) VALUES
('Thêm bò viên', 10000, 1),
('Thêm rau', 5000, 1),
('Trứng ốp la', 7000, 2),
('Thêm đá', 2000, 4),
('Đậu hũ chiên', 5000, 6),
('Thạch trái cây', 6000, 3),
('Tương ớt đặc biệt', 3000, 8),
('Wasabi Nhật', 4000, 9),
('Trứng luộc', 5000, 10),
('Thêm sữa', 2000, 7),
('Thêm chả', 7000, 11),
('Thêm rau thơm', 3000, 12),
('Đường ít', 0, 13),
('Thêm nước chấm', 2000, 14),
('Đậu phụ non', 6000, 15);

-- Đổ dữ liệu cho bảng orders
INSERT INTO `orders` (userId, foodId, amount, code, arrSubId) VALUES
(1, 1, 2, 'ORD001', '1,2'),
(2, 3, 1, 'ORD002', '6'),
(3, 4, 3, 'ORD003', '4'),
(4, 2, 1, 'ORD004', '3'),
(5, 6, 2, 'ORD005', '5'),
(6, 7, 1, 'ORD006', '10'),
(7, 8, 1, 'ORD007', '7'),
(8, 9, 2, 'ORD008', '8'),
(9, 10, 1, 'ORD009', '9'),
(10, 11, 2, 'ORD010', ''),
(11, 12, 1, 'ORD011', '11,12'),
(12, 13, 2, 'ORD012', '13'),
(13, 14, 1, 'ORD013', '14'),
(14, 15, 1, 'ORD014', '15'),
(15, 16, 2, 'ORD015', '');

-- Đổ dữ liệu cho bảng like_res
INSERT INTO `like_res` (userId, resId) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 1), (9, 3), (10, 8),
(11, 9), (12, 10), (13, 11), (14, 12), (15, 13),
(1, 2), (2, 3), (3, 1), (4, 6), (5, 7),
(6, 5), (7, 2), (8, 4), (9, 6), (10, 5),
(11, 1), (12, 3), (13, 2), (14, 7), (15, 6),
(1, 3), (2, 4), (3, 5), (4, 1), (5, 2),
(6, 3), (7, 8), (8, 5), (9, 7), (10, 2),
(11, 6), (12, 9), (13, 10), (14, 11), (15, 12),
(1, 4), (2, 6), (3, 8), (4, 9), (5, 10), (3,6);


-- Đổ dữ liệu cho bảng rate_res
INSERT INTO `rate_res` (userId, resId, amount) VALUES
(1, 1, 5), (2, 2, 4), (3, 3, 3), (4, 4, 5), (5, 5, 4),
(6, 6, 5), (7, 7, 4), (8, 1, 3), (9, 3, 2), (10, 8, 5),
(11, 9, 4), (12, 10, 5), (13, 11, 3), (14, 12, 4), (15, 13, 5),
(1, 2, 4), (2, 3, 5), (3, 1, 3), (4, 5, 2), (5, 6, 5),
(6, 7, 4), (7, 4, 3), (8, 6, 5), (9, 2, 4), (10, 1, 3),
(11, 5, 2), (12, 7, 5), (13, 6, 4), (14, 3, 3), (15, 4, 5);