-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th12 05, 2024 lúc 01:35 PM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fruitshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int NOT NULL,
  `iduser` bigint UNSIGNED NOT NULL,
  `day` date NOT NULL,
  `total` double NOT NULL,
  `giam` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetail`
--

CREATE TABLE `billdetail` (
  `idbill` int NOT NULL,
  `idpro` int NOT NULL,
  `soluong` int DEFAULT NULL,
  `thanhtien` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `iduser` bigint UNSIGNED NOT NULL,
  `idpv` int NOT NULL,
  `soluong` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`iduser`, `idpv`, `soluong`, `created_at`, `updated_at`) VALUES
(1, 31, 1, '2024-11-25 07:25:19', '2024-11-25 07:25:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `ten` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_id` int DEFAULT NULL,
  `mota` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `ten`, `parent_id`, `mota`, `created_at`, `updated_at`) VALUES
(1, 'Dâu', NULL, 'Per Kg', '2024-11-19 16:00:00', '2024-11-19 16:00:00'),
(2, 'Nho', NULL, 'Per Kg', '2024-11-19 16:02:32', '2024-11-19 16:02:32'),
(3, 'Chanh', NULL, 'Per Kg', '2024-11-19 16:02:58', '2024-11-19 16:02:58'),
(4, 'Kiwi', NULL, 'Per Kg', '2024-11-19 16:02:58', '2024-11-19 16:02:58'),
(5, 'Táo', NULL, 'Per Kg', '2024-11-19 16:02:58', '2024-11-19 16:02:58'),
(31, 'Chanh vàng', 3, 'Chanh vàng', '2024-11-23 12:29:39', '2024-11-23 12:29:39'),
(32, 'Chanh tươi', 3, 'Chanh tươi', '2024-11-23 12:30:42', '2024-11-23 12:30:42'),
(51, 'Táo xanh', 5, 'Táo xanh', '2024-11-23 12:30:42', '2024-11-23 12:30:42'),
(52, 'Táo đỏ', 5, 'Táo đỏ', '2024-11-23 12:30:42', '2024-11-23 12:30:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

CREATE TABLE `menus` (
  `id` int NOT NULL,
  `ten` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idCha` int DEFAULT NULL,
  `idCat` int DEFAULT NULL,
  `mota` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `anhien` tinyint(1) DEFAULT '1',
  `thutu` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `ten`, `slug`, `idCha`, `idCat`, `mota`, `anhien`, `thutu`, `created_at`, `updated_at`) VALUES
(1, 'Dâu', 'strawberry', NULL, 1, 'strawberry', 1, 0, '2024-11-19 16:03:47', '2024-11-19 16:03:47'),
(2, 'Nho', 'grapes', NULL, 2, 'grapes', 1, 0, '2024-11-19 16:05:20', '2024-11-19 16:05:20'),
(3, 'Chanh', 'lemon', NULL, 3, 'lemon', 1, 0, '2024-11-19 16:05:20', '2024-11-19 16:05:20'),
(4, 'Kiwi', 'kiwi', NULL, 4, 'kiwi', 1, 0, '2024-11-19 16:05:20', '2024-11-19 16:05:20'),
(5, 'Táo', 'apple', NULL, 5, 'apple', 1, 0, '2024-11-19 16:05:20', '2024-11-19 16:05:20'),
(31, 'Chanh vàng', 'lemon', 3, 3, 'lemon', 1, 0, '2024-11-19 16:11:49', '2024-11-19 16:11:49'),
(32, 'Chanh tươi', 'lime', 3, 3, 'lime', 1, 0, '2024-11-20 13:21:21', '2024-11-20 13:21:21'),
(51, 'Táo xanh', 'green-apple', 5, 5, 'green-apple', 1, 0, '2024-11-19 16:17:26', '2024-11-19 16:17:26'),
(52, 'Táo đỏ', 'apple', 5, 5, 'apple', 1, 0, '2024-11-20 13:21:45', '2024-11-20 13:21:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `mota` text COLLATE utf8mb4_general_ci NOT NULL,
  `loai` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `idCat` int NOT NULL,
  `chitiet` text COLLATE utf8mb4_general_ci NOT NULL,
  `thutu` int NOT NULL,
  `anhien` bit(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `mota`, `loai`, `idCat`, `chitiet`, `thutu`, `anhien`, `created_at`, `updated_at`) VALUES
(1, 'Dâu tây', 'strawberry', 'Dâu tây', 'strawberry', 1, 'chi tiết', 0, b'1', '2024-11-20 13:24:28', '2024-11-20 13:24:28'),
(2, 'Nho', 'grapes', 'Nho', 'grape', 2, 'chi tiết', 0, b'1', '2024-11-20 13:27:44', '2024-11-20 13:27:44'),
(4, 'Kiwi', 'kiwi', 'Kiwi', 'kiwi', 4, 'chi tiết', 0, b'1', '2024-11-20 13:32:39', '2024-11-20 13:32:39'),
(31, 'Chanh vàng', 'lemon', 'Chanh vàng', 'lemon', 3, 'chi tiết', 0, b'1', '2024-11-20 13:29:28', '2024-11-20 13:29:28'),
(32, 'Chanh tươi', 'lime', 'Chanh tươi', 'lemon', 3, 'chi tiết', 0, b'1', '2024-11-20 13:31:55', '2024-11-20 13:31:55'),
(33, 'sscw', 'scwe', 'sce', 'lemon', 3, 'dcec', 0, b'1', '2024-11-20 16:36:15', '2024-11-20 16:36:15'),
(51, 'Táo xanh', 'green-apple', 'Táo xanh', 'apple', 5, 'chi tiết', 0, b'1', '2024-11-19 17:36:01', '2024-11-19 17:36:01'),
(52, 'Táo đỏ', 'red-apple', 'Táo đỏ', 'apple', 5, 'chi tiết', 0, b'1', '2024-11-20 12:25:59', '2024-11-20 12:25:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int NOT NULL,
  `idPro` int NOT NULL,
  `gia` decimal(10,0) NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tonkho` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mau` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_variants`
--

INSERT INTO `product_variants` (`id`, `idPro`, `gia`, `images`, `tonkho`, `created_at`, `updated_at`, `mau`) VALUES
(1, 1, 85000, '/img/products/product-img-1.jpg', 5, '2024-11-20 13:25:57', '2024-11-20 13:25:57', 'do'),
(2, 2, 70000, '/img/products/product-img-2.jpg', 12, '2024-11-20 13:34:32', '2024-11-20 13:34:32', 'tím'),
(4, 4, 50000, '/img/products/product-img-4.jpg', 28, '2024-11-20 14:13:50', '2024-11-20 14:13:50', 'xanh'),
(31, 31, 35000, '/img/products/product-img-3.jpg', 20, '2024-11-20 13:36:53', '2024-11-20 13:36:53', 'vang'),
(32, 32, 30000, '/img/products/product-img-3-2.jpg', 17, '2024-11-20 13:37:16', '2024-11-20 13:37:16', 'xanh'),
(33, 33, 45000, '/img/products/product-img-6.jpg', 15, '2024-11-20 16:36:54', '2024-11-20 16:36:54', 'dscd'),
(51, 51, 45000, '/img/products/product-img-5.jpg', 15, '2024-11-20 12:27:42', '2024-11-20 12:27:42', 'xanh'),
(52, 52, 50000, '/img/products/product-img-5-2.jpg', 10, '2024-11-20 12:28:24', '2024-11-20 12:28:24', 'do');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `fullName`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin@itc.edu.vn', NULL, '123abc', 'admin', NULL, '2024-11-21 14:50:26', '2024-11-21 14:50:26'),
(2, 'user1', 'xyz', 'user1@itc.edu.vn', NULL, '456xyz', NULL, NULL, '2024-11-21 14:51:12', '2024-11-21 14:51:12');

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `vw_cart`
-- (See below for the actual view)
--
CREATE TABLE `vw_cart` (
`created_at` timestamp
,`gia` decimal(10,0)
,`idpv` int
,`iduser` bigint unsigned
,`images` varchar(255)
,`name` varchar(100)
,`soluong` int
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `vw_fruit`
-- (See below for the actual view)
--
CREATE TABLE `vw_fruit` (
`anhien` bit(1)
,`chitiet` text
,`created_at` timestamp
,`gia` decimal(10,0)
,`id` int
,`idCat` int
,`idv` int
,`images` varchar(255)
,`loai` varchar(50)
,`mau` varchar(255)
,`mota` text
,`name` varchar(100)
,`slug` varchar(100)
,`thutu` int
,`tonkho` int
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Cấu trúc cho view `vw_cart`
--
DROP TABLE IF EXISTS `vw_cart`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_cart`  AS SELECT `c`.`iduser` AS `iduser`, `c`.`idpv` AS `idpv`, `f`.`name` AS `name`, `c`.`soluong` AS `soluong`, `c`.`created_at` AS `created_at`, `c`.`updated_at` AS `updated_at`, `f`.`images` AS `images`, `f`.`gia` AS `gia` FROM (`cart` `c` join `vw_fruit` `f`) WHERE (`c`.`idpv` = `f`.`idv`) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `vw_fruit`
--
DROP TABLE IF EXISTS `vw_fruit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_fruit`  AS SELECT `p`.`id` AS `id`, `p`.`name` AS `name`, `p`.`slug` AS `slug`, `p`.`mota` AS `mota`, `p`.`loai` AS `loai`, `p`.`idCat` AS `idCat`, `p`.`chitiet` AS `chitiet`, `p`.`thutu` AS `thutu`, `p`.`anhien` AS `anhien`, `p`.`created_at` AS `created_at`, `p`.`updated_at` AS `updated_at`, `v`.`id` AS `idv`, `v`.`mau` AS `mau`, `v`.`gia` AS `gia`, `v`.`images` AS `images`, `v`.`tonkho` AS `tonkho` FROM (`products` `p` join `product_variants` `v`) WHERE (`p`.`id` = `v`.`idPro`) ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iduser` (`iduser`);

--
-- Chỉ mục cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`idbill`,`idpro`),
  ADD KEY `idpro` (`idpro`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`iduser`,`idpv`),
  ADD KEY `idpro` (`idpv`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCat` (`idCat`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCat` (`idCat`);

--
-- Chỉ mục cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPro` (`idPro`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  ADD CONSTRAINT `billdetail_ibfk_1` FOREIGN KEY (`idbill`) REFERENCES `bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `billdetail_ibfk_2` FOREIGN KEY (`idpro`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`idpv`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`idCat`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`idCat`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_ibfk_1` FOREIGN KEY (`idPro`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
