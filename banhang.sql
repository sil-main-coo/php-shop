-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 20, 2020 lúc 09:51 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `banhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth` date NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identity_card` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `fullname`, `sex`, `birth`, `phone`, `identity_card`, `address`, `username`, `access`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Trần Đình Toàn', 'nam', '1999-01-26', '0981143700', '184378350', 'hà tĩnh-cẩm xuyên-cẩm Thịnh', 'toantran', '1', '$2y$10$7D6l8Fo2fSq6RfX1Zufw3.HgYUaBIfIpt7RpspMd3bQmYde15d0xu', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stastus` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `stastus`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_orders`
--

CREATE TABLE `bill_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bill_orders`
--

INSERT INTO `bill_orders` (`id`, `order_id`, `bill_id`, `created_at`, `updated_at`) VALUES
(1, 6, 1, NULL, NULL),
(2, 7, 1, NULL, NULL),
(3, 8, 2, NULL, NULL),
(4, 9, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `product_id`, `count`, `amount`, `created_at`, `updated_at`) VALUES
(48, 6, 'Dell XPS 13 7390', 2, '70000000.00', '2020-09-09 16:53:57', NULL),
(49, 6, 'DELL - XPS 9500', 1, '15000000.00', '2020-09-09 16:54:08', NULL),
(52, 1, 'Dell Vostro 5470', 1, '1000000.00', '2020-09-13 11:39:46', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth` date NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `fullname`, `sex`, `birth`, `phone`, `email`, `address`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Trần Đình Toàn', 'nam', '1999-01-26', '0981143700', 'toantran26106@gmail.com', 'hà tĩnh-cẩm xuyên-cẩm Thịnh', 'toantran', '$2y$10$gVdZ5GNIvkcPfbR.nfgPSO9Tv/a94V/m1H4s9L.BTYJXj/Xq5QdlC', NULL, NULL),
(2, 'Trần Đình Diên', 'nam', '2007-07-20', '0981143721', 'legiang@gmail.com', 'hà tĩnh-cẩm xuyên-cẩm Thịnh', 'dien', '$2y$10$EHSpzfdLyX8Lsg1F24Z.l.5hkmeuaGevHlGupn4ozv3vQXBy9NUd.', NULL, NULL),
(3, 'Lê Văn Toàn', 'nam', '1999-02-20', '0981143744', 'toanle@gmail.com', 'hà tĩnh-cẩm xuyên-cẩm Thịnh', 'letoan', '$2y$10$9mngbx2.HqU6EoJwYwt.WOrDC3ZsMFDS5ELqmNsOYKMk7evGIzjvy', NULL, NULL),
(4, 'trương việt hoàng', 'nam', '1999-08-17', '0963852741', 'hoang@gmail.com', 'hà tĩnh-cẩm xuyên-cẩm Thịnh', 'hoang', '$2y$10$fI4KjBsvQLfvHdaPcxqfDeBX0exi1lt/.pJ6bZfUzocyZekLR55hi', NULL, NULL),
(5, 'Phạm Đình Đạt', 'nam', '1999-02-11', '0987654123', 'dat@gmail.com', 'Thái Bình', 'datco', '$2y$10$nLv58Msf/S1E257ZOxOk4uZFqqrzf203Ur6KJYz5ij8d6AtvYGqtu', NULL, NULL),
(6, 'Trần Đình Toàn', 'nam', '1999-01-26', '0981143713', 'huytan0508@gmail.com', 'hà tĩnh-cẩm xuyên-cẩm Thịnh', 'toantran123', '$2y$10$m8k/fsb/TiptG0dEWI5pde9FgfD/xhqp7TsbjjgfRN4ie4yMkwPEe', NULL, NULL),
(7, 'Trần Đình Toàn', 'nam', '1999-12-20', '0981143000', 'toantranit999@gmail.com', 'hà tĩnh-cẩm xuyên-cẩm Thịnh', 'toantran1111', '$2y$10$jks5X0aRpfzFEKd1RqqMDucTQncG80vm.fUISYMYcBO40NI6rsZIi', NULL, NULL),
(8, 'Trần Đình Toàn', 'nam', '1999-12-20', '0981140000', 'toantranit1999@gmail.com', 'hà tĩnh-cẩm xuyên-cẩm Thịnh', 'dien123', '$2y$10$JX7IzhP9Qb/iDbsButsxKOmJgPaGmGtIAZ39m/TJBvg0w0max9rqa', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(76, '2014_10_12_000000_create_users_table', 1),
(77, '2019_08_19_000000_create_failed_jobs_table', 1),
(78, '2020_07_13_125741_create_admins_table', 1),
(79, '2020_07_13_125835_create_customers_table', 1),
(80, '2020_07_15_074633_create_type_products_table', 1),
(81, '2020_07_28_015417_create_products_table', 1),
(82, '2020_07_28_021204_create_transactions_table', 1),
(83, '2020_07_28_021240_create_carts_table', 1),
(84, '2020_07_28_021332_create_orders_table', 1),
(85, '2020_08_14_081220_create_bills_table', 2),
(86, '2020_08_14_081244_create_bill_orders_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `stastus` tinyint(4) NOT NULL DEFAULT 0,
  `customer_fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(15,2) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `product_id`, `customer_id`, `stastus`, `customer_fullname`, `customer_email`, `customer_phone`, `address`, `count`, `amount`, `message`, `created_at`, `updated_at`) VALUES
(6, 'asus_fx555', 6, 0, 'Trần đình toàn', 'toantranit99@gmail.com', '0981143700', 'hà tĩnh-cẩm xuyên-cẩm Thịnh', 2, '40000000.00', 'k', '2020-08-16 01:53:03', NULL),
(7, 'Dell XPS 13 7390', 6, 0, 'Trần đình toàn', 'toantranit99@gmail.com', '0981143700', 'hà tĩnh-cẩm xuyên-cẩm Thịnh', 1, '35000000.00', 'k', '2020-08-16 01:53:03', NULL),
(8, 'Dell Vostro 5470', 1, 0, 'Trần đình toàn', 'toantranit99@gmail.com', '0981143700', 'hà tĩnh-cẩm xuyên-cẩm Thịnh', 1, '1000000.00', '111', '2020-09-13 03:03:51', NULL),
(9, 'Dell XPS 13 7390', 1, 0, 'Trần đình toàn', 'toantranit99@gmail.com', '0981143700', 'hà tĩnh-cẩm xuyên-cẩm Thịnh', 1, '35000000.00', '111', '2020-09-13 03:03:51', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_product_id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `discount` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `img_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `type_product_id`, `category`, `description`, `price`, `discount`, `quantity`, `img_link`, `views`, `created_at`, `updated_at`) VALUES
('asus_fx555', 'asus_fx555', 1, 'laptop', 'RAM 8G. core i7', '22000000.00', 20000000, 8, 'asus_fx555.png', 0, '2020-08-15 16:07:10', NULL),
('DELL - XPS 9500', 'Laptop DELL XPS 15 9500', 2, 'laptop', 'Máy tính giá rẻ chất lượng', '18000000.00', 15000000, 6, 'DELL - XPS 9500.png', 0, '2020-08-16 01:08:07', NULL),
('Dell Vostro 5470', 'Laptop Dell Vostro 5470', 2, 'laptop', 'Laptop dell', '12000000.00', 1000000, 2, 'Dell Vostro 5470.png', 0, '2020-08-16 01:11:32', NULL),
('Dell XPS 13 7390', 'Laptop Dell XPS 13 7390', 2, 'laptop', 'Laptop cấu hình mạnh', '38000000.00', 35000000, 15, 'Dell XPS 13 7390.png', 0, '2020-08-16 01:09:56', NULL),
('dell-xps-953', 'DELL  XPS953', 2, 'laptop', 'cấu hình cao', '23000000.00', 0, 8, 'dell-xps-953.png', 0, '2020-08-16 01:05:32', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stastus` tinyint(4) NOT NULL DEFAULT 0,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `customer_fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_type_product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name_type_product`, `created_at`, `updated_at`) VALUES
(1, 'ASUS', NULL, NULL),
(2, 'DELL', NULL, NULL),
(3, 'HP', NULL, NULL),
(4, 'LG', NULL, NULL),
(5, 'OPPO', NULL, NULL),
(6, 'APPLE', NULL, NULL),
(7, 'XIAOMI', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_phone_unique` (`phone`),
  ADD UNIQUE KEY `admins_identity_card_unique` (`identity_card`);

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bill_orders`
--
ALTER TABLE `bill_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_orders_order_id_foreign` (`order_id`),
  ADD KEY `bill_orders_bill_id_foreign` (`bill_id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_customer_id_foreign` (`customer_id`),
  ADD KEY `carts_product_id_unique` (`product_id`) USING BTREE;

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_username_unique` (`username`),
  ADD UNIQUE KEY `customers_phone_unique` (`phone`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_product_id_unique` (`product_id`) USING BTREE;

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_type_product_id_foreign` (`type_product_id`);

--
-- Chỉ mục cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `bill_orders`
--
ALTER TABLE `bill_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill_orders`
--
ALTER TABLE `bill_orders`
  ADD CONSTRAINT `bill_orders_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`),
  ADD CONSTRAINT `bill_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_type_product_id_foreign` FOREIGN KEY (`type_product_id`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
