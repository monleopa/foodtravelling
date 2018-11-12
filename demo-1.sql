-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 11, 2018 lúc 07:39 AM
-- Phiên bản máy phục vụ: 10.1.36-MariaDB
-- Phiên bản PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `demo`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `category_id` int(10) NOT NULL,
  `category_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'name1'),
(2, 'name1'),
(3, 'name1'),
(4, 'name2'),
(5, 'name3'),
(6, 'name4');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(50) NOT NULL,
  `comment_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comment_post_id` int(50) NOT NULL,
  `comment_user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comment_user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_content`, `comment_post_id`, `comment_user_id`, `comment_user_name`) VALUES
(1, 'hello', 23, '1', 'ducanh'),
(2, 'hm', 23, '1', 'ducanh'),
(3, 'helllo hihi', 23, '1', 'ducanh'),
(6, 'Dep qua nhi', 33, '1', 'ducanh'),
(7, 'Hihi', 33, '31', 'hongnhung');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post`
--

CREATE TABLE `post` (
  `post_id` int(50) NOT NULL,
  `post_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `post_location` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_filename` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_category` int(5) NOT NULL,
  `user_id` int(50) NOT NULL,
  `user_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post`
--

INSERT INTO `post` (`post_id`, `post_name`, `post_location`, `post_filename`, `post_content`, `post_image`, `post_category`, `user_id`, `user_name`) VALUES
(23, 'Phở Bò', 'Nam Định', 'recipe3315-635754951948774481.jpg', 'Rất ngon nhé', 'C:\\Users\\User\\Documents\\NetBeansProjects\\Example\\web\\PostImages\\recipe3315-635754951948774481.jpg', 1, 1, 'ducanh'),
(24, 'Bánh Cuốn', 'Số 1 - Quang Trung - Hà Nội', '127_cr_5100540b7e113.jpg', 'Bánh rất ngon, giá lại hạ giẻ. Ăn nóng hổi.', 'C:\\Users\\User\\Documents\\NetBeansProjects\\Example\\web\\PostImages\\127_cr_5100540b7e113.jpg', 1, 2, 'baphuong'),
(26, 'Cốm Làng Vòng', 'Sô 20 - làng Vòng - Hà Nội', 'com-lang-vong.JPG', 'Hihi', 'C:\\Users\\User\\Documents\\NetBeansProjects\\Example\\web\\PostImages\\com-lang-vong.JPG', 1, 1, 'ducanh'),
(29, 'Bai bien Hai Tien', 'Sam Son', 'download.jpg', 'Beautifull', 'C:\\Users\\User\\Documents\\NetBeansProjects\\Example\\web\\PostImages\\download.jpg', 2, 30, 'duonglinhtrang'),
(30, 'Vinpearl land', 'Nha Trang', 'vinpearl-land-nha-trang-ticket-4-pm.jpg', 'Lien he 0971366898 de co duoc khach san dep va giai hop ly nhat.', 'C:\\Users\\User\\Documents\\NetBeansProjects\\Example\\web\\PostImages\\vinpearl-land-nha-trang-ticket-4-pm.jpg', 2, 2, 'baphuong'),
(31, 'Tam Dao', 'Vinh Phuc', 'du-lich-tam-dao-4-400x400.jpg', 'So Beautifull !', 'C:\\Users\\User\\Documents\\NetBeansProjects\\Example\\web\\PostImages\\du-lich-tam-dao-4-400x400.jpg', 2, 29, 'philinhlinh'),
(32, 'Banh Xeo', '91 Be Van Dan - Ha Dong - Ha Noi', 'photo.jpg', 'Very Good', 'C:\\Users\\User\\Documents\\NetBeansProjects\\Example\\web\\PostImages\\photo.jpg', 1, 31, 'hongnhung'),
(33, 'Hội An', 'Phố cổ Hội An - Quảng Nam', 'hoi-an-600x600.jpg', 'So So So Beautifull !', 'C:\\Users\\User\\Documents\\NetBeansProjects\\Example\\web\\PostImages\\hoi-an-600x600.jpg', 2, 31, 'hongnhung');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(40) NOT NULL,
  `user_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_password`, `email`, `admin`) VALUES
(1, 'ducanh', '81dc9bdb52d04dc20036dbd8313ed055', 'ducanh7897@gmail.com', 1),
(2, 'baphuong', '81dc9bdb52d04dc20036dbd8313ed055', 'baphuong@gmail.com', 2),
(3, 'Cong Son', '81dc9bdb52d04dc20036dbd8313ed055', 'congson@gmail.com', 1),
(29, 'philinhlinh', '81dc9bdb52d04dc20036dbd8313ed055', 'philinh@gmail.com', 2),
(30, 'duonglinhtrang', '81dc9bdb52d04dc20036dbd8313ed055', 'tranglinh@gmail.com', 2),
(31, 'hongnhung', '81dc9bdb52d04dc20036dbd8313ed055', 'hongnhung@gmail.com', 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Chỉ mục cho bảng `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
