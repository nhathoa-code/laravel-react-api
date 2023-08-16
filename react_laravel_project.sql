-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 16, 2023 lúc 07:24 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `react_laravel_project`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `address`
--

CREATE TABLE `address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(64) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `city` varchar(100) NOT NULL,
  `district` varchar(50) NOT NULL,
  `village` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `is_defaulted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `address`
--

INSERT INTO `address` (`id`, `user_id`, `full_name`, `phone_number`, `city`, `district`, `village`, `address`, `is_defaulted`) VALUES
(32, 1, 'Corona', '0943111222', 'Thành phố Hồ Chí Minh', 'Quận Bình Tân', 'Phường Bình Trị Đông', '123 Liên khu 5-10-12', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `username`, `name`, `password`, `picture`, `remember_token`) VALUES
(1, 'nhathoa', 'Nhật Hòa', '$2a$12$TI7YXSOtjdHAKxhGHY/x3Oe2ICReANRnuA8mIXkoc2dqsiXoBBBwa', NULL, 'g7LAiQ6Jwg1S8UYlh4D8637KvEn7znjRXflCXrzSH13DnkI9Y4hISpOCZcea'),
(20, 'author', 'author', '$2y$10$c2tHT/Bc0u5Wj1LDV3Ofh.oO9TcqHmEdi2UKigFU/MmpQXS6D5J5W', NULL, 'Zv6Dm1KWrOz6HgvyXgW1k8v0neNldZ59bRH9J5Vl9PUdB6PLHDBlW6u1Xpmz'),
(21, 'manager', 'manager', '$2y$10$/jr4T6Hdh0vy/vXesjxvk.XLgubyRIdAlBs/t6Osq5T2uc1u/QhMG', NULL, 'eLrvd2tRSY6dFBpRrNYwvOQg4XQvjiLZ3I3sciM1TeNENDMlrgpGMpCLb8LB'),
(22, 'manager_author', 'manager_author', '$2y$10$M80lxsXUlRfSpqs3Xa/aFunM1SJolBQP9nyktMUmrNbcuHYZE/S6C', NULL, 'GujZQKz10L6wTrgCB7ugNhls5CXBTPONYqChVDpAbz3nU7LDRqUgXEiY1iop'),
(23, 'guest', 'Guest', '$2y$10$BObnuA7xTzMCeCuzSunKDOwbDmiyqFE6mW/HQ05txBB7rLgMTO0A6', NULL, 'SAzQWDvBXjvyGzcuNtX9uzoIVnZZEhh2o93ASYJTOVOuUpXYsnlBbW0Oty15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins_roles`
--

CREATE TABLE `admins_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins_roles`
--

INSERT INTO `admins_roles` (`id`, `admin_id`, `role_id`) VALUES
(1, 1, 2),
(26, 20, 4),
(27, 21, 3),
(28, 22, 3),
(29, 22, 4),
(30, 23, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_description` varchar(100) NOT NULL,
  `link_to` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `image`, `short_description`, `link_to`) VALUES
(3, 'images/banners/pcciWO0z1P6fhhWttzaLZxtEzfyrC1bIuNWVi4M9.jpg', 'TECNO SPARK 10 Pro\r\nGiá chỉ từ 3.540.000đ', '/abc'),
(4, 'images/banners/3Hrkemz2msy1VLDbLILVuYyqlbEam7HULj3kj3Uj.jpg', 'Garmin Forerunner 265 | 265S - Chính hãng', 'abc/123'),
(5, 'images/banners/J5OvnuW0DUrHyzYiFN2nvbk93ZGDOte2GbzAcZqz.png', 'iPhone 14 Pro Max VN/A\r\nGiá chỉ từ 25.490.000đ', '/abc'),
(6, 'images/banners/CQaGiuwGHDNOsp626FPIC9tly3eRupbQZoTJo5n9.png', 'Smart TV Coocaa\r\nGiải trí rực rỡ - Giá rẻ hết cỡ', '/abc'),
(7, 'images/banners/m0HN1MUJqQKYglrhHqn6BJUZIMEbQAZNOlEyUATB.png', 'Laptop giá rẽ hết cỡ\r\nChào hè rực rỡ', '/abc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `category_id`, `name`, `image`) VALUES
(5, 2, 'Apple (MacBook)', 'images/brands/2/jSI3k58EtiH7zI4FywkZJA3sb3NqjuZBOugEsIqm.png'),
(6, 2, 'Hp', 'images/brands/2/8koBBUQEL0myVmMSu1ZosyiruKauqllPO2xabvw4.png'),
(7, 2, 'Dell', 'images/brands/2/VDTc2IOSAUZGqjJQS2HT1OZRlSfhR7VNOEzcj6o3.png'),
(8, 1, 'Apple', 'images/brands/1/oPVbtBH1QbILoVzFP2qniABw4mm5RONraQDAKZ8E.png'),
(9, 1, 'Samsung', 'images/brands/1/RJ1Qvg83ci0JomZIVx3w3LHYgqw1ZZ8HNHdwQywF.png'),
(10, 1, 'Xiaomi', 'images/brands/1/A7X2EKlkPdnEA6A7izeGA773bQO0NO5VgIOcmglI.png'),
(11, 1, 'Oppo', 'images/brands/1/lGnDSnVALU1kwLYfdfEgmsynWdr4o7f3hmKt1CkM.png'),
(12, 1, 'Realme', 'images/brands/1/Ta8huQN5xJaVVSpdV72b72sp42JRhy8rYCPKaOTN.png'),
(13, 1, 'Nokia', 'images/brands/1/xDjspjHDyEhudoQWjJWg3fBcv8JfmVpn2lyh0dwY.png'),
(14, 1, 'Vivo', 'images/brands/1/NfsqrWnjLTFJJf8F9NABJ1QD9raE4fFpADvfWStt.png'),
(15, 2, 'Asus', 'images/brands/2/3NoaTIbyFf5YkFS6wDRgZYAMXZ8re3NxoM62K11e.png'),
(16, 2, 'Lenovo', 'images/brands/2/lDJjEVYXDRdZXYFP2zDs2cTyVXU3CQoWnZJ5bbqe.png'),
(17, 2, 'Acer', 'images/brands/2/R1PMOeVVOwrtS4l0pMqIiOWpHS1nFv4CkAoaMpmO.png'),
(18, 2, 'Microsoft (Surface)', 'images/brands/2/IqkMBXlOGWjHEME6CL2rxEapse9XoS6yPxSf2dmD.png'),
(19, 2, 'MSI', 'images/brands/2/lrNtCcrppPYqMHgkJFC7hsx7RAH35J6zJ8fnv5Du.png'),
(20, 10, 'iPad', 'images/brands/10/JaFqroe4oBoqi7x82J2NMoiT5uPTapr4Y2C8b02E.jpg'),
(21, 10, 'Samsung', 'images/brands/10/njzduPfo4ccKT8PtW6DQcQrUheFroT57gBnnbCt3.png'),
(22, 10, 'Xiaomi', 'images/brands/10/JAHKdIHYjqrJcTlUfQ3tTgdv4MiJduHOJ2S6prWV.png'),
(23, 10, 'Huawei', 'images/brands/10/xBcNeUWSvJMVNqzIwTFMpJta1mY1Pmhb40olNTvL.png'),
(24, 10, 'Lenovo', 'images/brands/10/CEz4SvNBrAkuyzHfz0bQtvuUdMEyKno5op7MbkDB.png'),
(25, 10, 'Oppo', 'images/brands/10/Zp9tAzYhNkhijfAx1VFbNOVteTsPXJArwPAWBhPM.png'),
(26, 10, 'Nokia', 'images/brands/10/etcv75uzopGEEfYBXTNpSkf5LRt3m1w3ZrpWaxok.png'),
(27, 10, 'Kindle', 'images/brands/10/fNolsuL9UGoVOQdOTqhWwHSGw9ar3rbMVC4rOGcs.png'),
(28, 23, 'Samsung', 'images/brands/23/bVrTvXuZi1HgFDVyI4GbTY4VoSEXXgFKZpHxDdqa.png'),
(29, 23, 'Xiaomi', 'images/brands/23/PslMPNhALfEx6xfk1zwJAyeD3CZDgj89ZNi2UQKo.png'),
(30, 23, 'Toshiba', 'images/brands/23/OvnFFdZvADWgO2fRqWog4nvJUmh9iABoeEkxdFVY.png'),
(31, 23, 'LG', 'images/brands/23/WFjAVpvPYOfKoPLPqImmZMQ5YjpxJjdIhdimUPbG.png'),
(32, 23, 'Coocaa', 'images/brands/23/UoGQPOogqYI4rJUxuYwtoHJ6wgqPiTnwbSfMeIut.png'),
(33, 23, 'Sony', 'images/brands/23/gBdTHskeO3tJ7biKAxJNgLnlkU73H8WQarU6J7vB.png'),
(34, 23, 'Casper', 'images/brands/23/9uK5cev5vVSgUvaGCBt7YLg2rPxleQgh26bs0yEC.png'),
(35, 36, 'MacPro', 'images/brands/36/Wz4nHxqJr5HilbFZXis4FU71NgLNdfYgHsTicsTT.png'),
(36, 36, 'iMac', 'images/brands/36/LofIMu960VyLsy93fUL0ZQXOv8AN8MzBlgrCVwYb.png'),
(37, 36, 'Lenovo', 'images/brands/36/ON6cEyLym2KJOpgFskZ79lqDAI2i0sKavytsQe7z.png'),
(38, 36, 'MacMini', 'images/brands/36/KqJAwIAssryQymO6TsJPiRtkKz0GJ3sifat94cwj.png'),
(39, 36, 'HP', 'images/brands/36/bwi1l7ndB8dInpTLm2nIKJntIi3lpKlahsz5Ce38.png'),
(40, 36, 'Asus', 'images/brands/36/4qsJq4YihZVzZTVdCXzY5y08pOZfcNWn2voYPbr1.png'),
(41, 36, 'EPower', 'images/brands/36/vUwrTlp9AF4ny8NlQbfvr0dw6b4JPqlh4Eb9EDxD.png'),
(42, 38, 'Asus', 'images/brands/38/vdmB7dv2SnVJ5sXXFUpUe8FHIFRf1kp48KEva1FG.png'),
(43, 38, 'LG', 'images/brands/38/eGuYZeAHiq3pdoXjKrSFxCaZOi5k11oNfxL0oAb1.png'),
(44, 38, 'Samsung', 'images/brands/38/DclEp5lymnK8pjggwT4Tzs1MOXHLpH9FwqcML6pD.png'),
(45, 38, 'Xiaomi', 'images/brands/38/hude5THMYJh7ZghELbokh6JzQ22BP7Kv7rPBXV0c.png'),
(46, 38, 'Dell', 'images/brands/38/ZdUxueoCOBUHRz3b1CZKp3c7krftpPA2nx48XgKN.png'),
(47, 38, 'AOC', 'images/brands/38/1msr8anWRucbpFnIwXYGxdNTzTvx9ztxQayoUUCy.png'),
(48, 38, 'GIGABYTE', 'images/brands/38/Zt0VqK5MFx3SUG2Y6waeKEo4TSZhfWdDZi0eYSGQ.png'),
(49, 38, 'Acer', 'images/brands/38/gvPxWkKz4A8kcJT1g9CidHM12tRSiQr6p37SZows.png'),
(50, 38, 'Philips', 'images/brands/38/t0Hbn2lijnR3TiRQMLTIpjj0XxN8fjsawvmtdiiZ.png'),
(51, 38, 'HP', 'images/brands/38/pebInK2UL2CZ6G264E9l5U2LZZhyI0RJvttCBss3.png'),
(52, 38, 'Huawei', 'images/brands/38/C7qfTjbNwJNHNDsS4R2b58ShLvDtv1ybt7QNYpkv.png'),
(53, 38, 'ViewSonic', 'images/brands/38/NK876pNyMQ0fOb1AVE0dKfMDaa2pYPVKGXdEzw88.png'),
(54, 38, 'Lenovo', 'images/brands/38/CfTkEqbzFru8mUYtlEDTJA3TIFfLUDlRnIpkWwDb.png'),
(55, 38, 'HKC', 'images/brands/38/YOU8Xsqvot1GmdV6CJvrkRkIsO9BXJDiCgxQ6ACS.png'),
(56, 38, 'MSI', 'images/brands/38/EZYSGWPDtmUGiqZyRIl274HDCEH4oHSdaCTFUzzZ.png'),
(57, 18, 'Apple', 'images/brands/18/djtM86XK3FSU4QThv1tbVVJg9Tmcd5VC24LunX6l.png'),
(58, 18, 'Samsung', 'images/brands/18/VZUjmBFnQ3Apfe9W0ALmTS8ZDHuDwNr3ftTqvRS8.png'),
(59, 18, 'Anker', 'images/brands/18/gvRLrPOwR53dattYeoq3zMv5st5JlBY2Pt2lfybH.png'),
(60, 18, 'Energizer', 'images/brands/18/o7bvt8yg1aIyhy0CGvYfViFkW4BeaK6QReK42tH0.png'),
(61, 18, 'Aukey', 'images/brands/18/9xGVUWGFFDbGaEwIqr9ALw6kAwpQmziVzaXUuRza.png'),
(62, 18, 'Baseus', 'images/brands/18/mUymo62gT32urc2UKZNDBG3cgBueK1njLdaY36UF.png'),
(63, 18, 'Xiaomi', 'images/brands/18/UkLBRiFSuKz5bY7cQUjJF2JZfJDFTS9OlZJdidVt.png'),
(64, 18, 'Mophie', 'images/brands/18/Hl8OTVwWLDpJ5LqYr8lLaxfoTxNNy7xNQzNLh17o.png'),
(65, 18, 'Belkin', 'images/brands/18/4QX0upzKcUqdmIFqcqXnD9mJbu7JByCKajk0w7QR.png'),
(66, 18, 'Otter', 'images/brands/18/1uEreld3At2Xl1TQddmiLlP1L8auxYO2ufAgqqOO.png'),
(67, 18, 'Mazer', 'images/brands/18/abybTORimuHZrPBeWDxpCaoF1hP3hQebkhi6Gms5.png'),
(68, 18, 'Golf', 'images/brands/18/XVXL7SDm3jRAbvrwtHYZ8TbceHAfU7LpI71T6vsl.png'),
(69, 18, 'Innostyle', 'images/brands/18/B44gnHCYqVQHu1WM6OYrPpAPB1x2nuZ34aAc1r7X.png'),
(70, 18, 'iWalk', 'images/brands/18/CINiJ3Mv2XFag75CILLjwVaJVZVpV15ZtBzaOJX4.png'),
(71, 18, 'Enshai', 'images/brands/18/8Y8sUw4ZFeO3kvGYuTxsss6PHnoVqhgs6OOHQ0s3.png'),
(72, 18, 'Hyper', 'images/brands/18/KvGXnainyCQ3gIq99XTX6ll2stogk2xhC1HLkCXJ.png'),
(73, 18, 'Pisen', 'images/brands/18/88pUTNlPlPzr2B9lb8plxonKMk0zZxSf7ERKK8Qg.png'),
(74, 43, 'Asus', 'images/brands/43/JBL4Ftye4YURc0kn7WxxV5OeSvSbzT4g1bEiUXcb.png'),
(75, 43, 'Gigabyte', 'images/brands/43/mng25eBqNVY6joS0au7jXEciMZhPqkLmWLerRAFG.png'),
(76, 43, 'Msi', 'images/brands/43/dJdHVVQ3DRnmtrjtUJOySJoClscWA2xpXxrpc8Eo.png'),
(77, 43, 'ASrock', 'images/brands/43/udhFfOI7z63ZPHiTzWuY7pbGFRHxp4oBJ7DwNig6.png'),
(78, 45, 'Kingston', 'images/brands/45/ykSCyTdAHCqPhcDxPM0jRYsiVrUMhu5SbymRE8zp.png'),
(79, 45, 'Kingmax', 'images/brands/45/XqwXoeXCDnEVJmXFC73cTH9BsY8NpXzA2DI8hYKp.png'),
(80, 45, 'Gigabyte', 'images/brands/45/I5JihoPEwuNeYW9Cbe6jBhzcXMsppSuo4GNzmuXY.png'),
(81, 45, 'Samsung', 'images/brands/45/aBT5XigpD4adsVDPKDNYaRf0onxgNY4RihtPjZEU.png'),
(82, 45, 'Lexar', 'images/brands/45/cyBT9O34ZAFJhORgH8yEmRNY69SYvFfpzzqGOBdC.png'),
(83, 46, 'Kingston', 'images/brands/46/w4TK3HGw91pLrcP7gzW8tEGETY92EfRqwxMyhlZY.png'),
(84, 46, 'Kingmax', 'images/brands/46/y5qoFTbmSoKBsZbXuu2GQywyheMHvQkz5i6zs83U.png'),
(85, 46, 'Gigabyte', 'images/brands/46/gRERw2Y4BEmA7eO1wndN1i3cH3L9xj7I3WnEZSUQ.png'),
(86, 46, 'Lexar', 'images/brands/46/Xt8dPnY3ewExo9v6YWqTu1eWEgYTyTL3527tKfUI.png'),
(87, 46, 'Samsung', 'images/brands/46/ybAdkeP9CC7t66LRGxeWVv6p4a85tiH9x6dD1AJM.png'),
(88, 46, 'Adata', 'images/brands/46/iDwtWZM4xDtksxsociKGnrq1IlVFUmrFHSJONhLE.png'),
(89, 46, 'Transcend', 'images/brands/46/DeQxiMYqA5zp8cVgwjFpKRY63oarKBcmln2aahGU.png'),
(90, 47, 'Asus', 'images/brands/47/cWI1nO5t7Q2gLKetR9MuIj1cZnmdmsqPYi9qEYBz.png'),
(91, 47, 'Gigabyte', 'images/brands/47/A7AE0I3Q0WdzN0eotiwE4ISrDNBFlb3ZD3ydKQGw.png'),
(92, 47, 'MSI', 'images/brands/47/9OoVfcEyKPsjlYp1tjjL5bwABU8jX06oa9Xdptqq.png'),
(93, 47, 'Nvidia', 'images/brands/47/bfYgqBPl9ChEGWwZ35U6WTz1mLwrGOmQHjgS08LD.png'),
(94, 48, 'Corsair', 'images/brands/48/0vSHdI545tRklzUKYFnwX2hEIhWbY6lcnFPE46S6.png'),
(95, 48, 'Deepcool', 'images/brands/48/IyMcEDk5K2tXkzK66tGrkiJ7ZC8A9eeRU8C5biZ7.png'),
(96, 48, 'Gigabyte', 'images/brands/48/CjbwPmnjND9uWhSc7uGBNVK7gq1JvPIuaVfcboHy.png'),
(97, 48, 'MSI', 'images/brands/48/3uQEQbXPB6qRpN5VLHFECHK45bTM0K6suoSt2aw8.png'),
(98, 49, 'Asus', 'images/brands/49/aqwb7rZu3xvmDpuvuZMEcXgXhS435OazoXLkq0mN.png'),
(99, 49, 'Deepcool', 'images/brands/49/cKoudejESG7AtW6Phy765rkpCy4lJufd5EQgxG3e.png'),
(100, 49, 'Xigmatek', 'images/brands/49/7IMVgo3iKtq7RpI8MERA6MvQV3Pn8hN7x4gAG3Ed.png'),
(101, 50, 'Deepcool', 'images/brands/50/DClEuI6iTj7piuNZymxKGX3PBBc9vMjBnya99iwZ.png'),
(102, 50, 'Xigmatek', 'images/brands/50/3roWQy5LKpfsSD0tEIPW0QOzV8ISwvMsM4iJhOaC.png'),
(103, 32, 'Apple', 'images/brands/32/GAPFV59QQxcyDX90QWaJizceEprEBVJQvPo6w8EW.jpg'),
(104, 32, 'Logitech', 'images/brands/32/nom714KPmx4FkgwA768bAmDUezRKOpfIWf94ExdS.jpg'),
(105, 32, 'Havit', 'images/brands/32/1z2BHYdhX2mhEfp8rNwGjWaLDRXXwMEW9cYhekEJ.jpg'),
(106, 32, 'Asus', 'images/brands/32/5jfj3dqItvkhUZdtj4MwHu27PbPrahMgwYNxXH2J.jpg'),
(107, 32, 'Lenovo', 'images/brands/32/KrZIzgNO9WYRJN3RCFdE7YlO6HmI4Hy746YHdAPM.jpg'),
(108, 32, 'Zadez', 'images/brands/32/9FGqb3kYyvgrVxSwsMfiL2jZ99suJ16Y9L4sZEme.jpg'),
(109, 32, 'Elecom', 'images/brands/32/6vv6NSDaDnDvX1xIjUWX077VP5eS3OjFif3Y5LtQ.jpg'),
(110, 32, 'microsoft', 'images/brands/32/Tz9YAW0WGbEOrOZl9ncYGCcIdjKvkaloE2rawUaP.jpg'),
(111, 32, 'Razer', 'images/brands/32/x5qXsLykaQFCyMaBGApRe1mdjveObStUotBycLz2.jpg'),
(112, 32, 'Dareu', 'images/brands/32/p6LgpOoCxGpOcycmvuvYGXqkL3gxpw2MQGhDdAnJ.jpg'),
(113, 32, 'Rapoo', 'images/brands/32/PnhipCJqcragZldgnI7ZRrrvK8fvsvTB9pppDrR1.jpg'),
(114, 30, 'Apple', 'images/brands/30/f6rCD5rZryV3Bmi5IDmrdSNtbxzigPtRcIJwvDsD.jpg'),
(115, 30, 'Logitech', 'images/brands/30/Uj9a1kOYFqqP6hUYlpkbVXUDhsA2RR3wMZtj8cQW.jpg'),
(116, 30, 'Microsoft', 'images/brands/30/wf6JAeo9dF92O6RiJWZKqWLWWoAJbWqytbUUanAZ.jpg'),
(117, 30, 'Dareu', 'images/brands/30/ZqkK09sorb2Q5TZ4Lfkx9nxqDmVBs40qfgLkQxq5.jpg'),
(118, 30, 'Asus', 'images/brands/30/UCzGegKksTmwZG1IDKJwEsPiBuDDgWJ4EnenS5Y3.jpg'),
(119, 30, 'Rapoo', 'images/brands/30/uqCU3Etontpcej9d72MHsQr0trBcnjd783949XcB.jpg'),
(120, 30, 'Zadez', 'images/brands/30/yKTrzu0PPMYLR8Ab7gGhtPZs2f2PwMo4RMa5T0c1.jpg'),
(121, 30, 'Razer', 'images/brands/30/GXLCJhlsQ7LyyI0SY4t7OnGHH5J2APQFssPPRj4l.jpg'),
(122, 30, 'Havit', 'images/brands/30/6DkjzNuv4MIZcNzc8uWwfgTUhEXJWLDkva6CaGxi.jpg'),
(123, 85, 'Apple', 'images/brands/85/9QCSqGmvu0zRvHtO0BkpHUkBdHzXtMf5By3KixIC.webp'),
(124, 85, 'Samsung', 'images/brands/85/lM4Fuw53ZMCW1Wequhne5t9KeWs1EBgeo5HOwPSu.webp'),
(125, 85, 'Xiaomi', 'images/brands/85/DRtPuBkEiOv4PApm54sNu0S1WkC8832RmClqXVhr.webp'),
(126, 85, 'Huawei', 'images/brands/85/eohzADX1SAIo0ygnrv60REmQq6Ur0L2LmOX6Y1nO.webp'),
(127, 85, 'Coros', 'images/brands/85/0kyQratNdBTxw07T5jVHIKglFs7unSnkWwC6vqjB.webp'),
(128, 85, 'Asus', 'images/brands/85/6xcsAuM1qR8QjWlXCiY4fcBHqV5G1zZvw5XcnKKe.webp'),
(129, 85, 'Garmin', 'images/brands/85/F64LX5TWXW8d8watzSz7kCxltNpkgFrGyC5Pa2tK.webp'),
(130, 85, 'Amazfit', 'images/brands/85/MQo3Wy3hGNvYXo0WJYn7dWWiTwt54DFhUICDoLdx.webp'),
(131, 85, 'Kieslect', 'images/brands/85/iwJpXk8of08M3lmgYSEwVXc4ysNsygF4zRaOnxuW.webp'),
(132, 85, 'Soundpeats', 'images/brands/85/CqrjtjiT2gJnUAN7yL1Zw9DSBJOhUstl2xeu1i07.webp'),
(133, 85, 'Oppo', 'images/brands/85/0Xe9FmVNsmuqnjdTMTYmRXjU1cilEZkeY14K9BJF.webp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `icon` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `icon`, `image`) VALUES
(1, 'ĐIỆN THOẠI', 'dien-thoai', 0, '<svg fill=\"#000000\" width=\"40px\" height=\"40px\" viewBox=\"0 0 32 32\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M20.629 5h-9.257a1.6 1.6 0 0 0-1.601 1.603V25.4a1.6 1.6 0 0 0 1.601 1.601h9.257c.883 0 1.6-.718 1.6-1.601V6.603c0-.885-.717-1.603-1.6-1.603zm-6.247 1.023h3.302v.768h-3.302v-.768zm1.619 19.395a1.024 1.024 0 0 1-1.023-1.021 1.023 1.023 0 0 1 2.044 0c-.001.494-.46 1.021-1.021 1.021zm5.028-3.501H10.971V7.704h10.058v14.213z\"/></svg>', ''),
(2, 'LAPTOP', 'laptop', 0, '<svg version=\"1.1\" id=\"_x32_\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"  width=\"40px\" height=\"40px\" viewBox=\"0 0 512 512\"  xml:space=\"preserve\"> <style type=\"text/css\"> <![CDATA[ 	.st0{fill:#000000;} ]]> </style> <g> 	<path class=\"st0\" d=\"M62.953,387.594h392.078c13.188,0,23.984-10.797,23.984-23.969V109.406c0-13.188-10.797-23.969-23.984-23.969 		H62.953c-13.203,0-23.984,10.781-23.984,23.969v254.219C38.969,376.797,49.75,387.594,62.953,387.594z M70.156,116.594h377.688 		v239.813H70.156V116.594z\"/> <path class=\"st0\" d=\"M0,401.375v6c0,10.547,8.625,19.188,19.188,19.188h473.625c10.563,0,19.188-8.641,19.188-19.188v-6H0z\"/> </g> </svg>', ''),
(10, 'MÁY TÍNH BẢNG', 'may-tinh-bang', 0, '<svg fill=\"#000000\" width=\"40px\" height=\"40px\" viewBox=\"0 0 32 32\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\"> <title>tablet</title> <path d=\"M23.001 4h-15c-1.105 0-2.001 0.896-2.001 2v20c0 1.104 0.896 2 2.001 2h15c1.104 0 1.999-0.896 1.999-2v-20c0-1.104-0.895-2-1.999-2zM15.5 27c-0.552 0-0.999-0.447-0.999-1s0.447-1 0.999-1c0.553 0 1.001 0.447 1.001 1s-0.448 1-1.001 1zM22.991 23.938h-15.026v-17.912h15.026v17.912z\"></path> </svg>', ''),
(16, 'PHỤ KIỆN', 'phu-kien', 0, '<svg class=\"svg_pk\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"1.1\" id=\"Layer_1\" x=\"0px\" y=\"0px\" viewBox=\"0 0 21.6 21.6\" style=\"enable-background:new 0 0 21.6 21.6;\" xml:space=\"preserve\"> <style type=\"text/css\"> .st0{fill:#000;stroke:#000;stroke-linecap:round;stroke-linejoin:round;} .st1{fill:#000;} .st2{fill:transparent;stroke:#000;stroke-width:0.8;stroke-linecap:round;stroke-linejoin:round;} </style> <g id=\"Layer_2_1_\"> <g id=\"Layer_1-2\"> <path style=\"fill:transparent\" class=\"st0\" d=\"M6.5,6.2V15c0,1,0.8,1.9,1.9,1.9c0,0,0,0,0,0h4.8c1,0,1.9-0.8,1.9-1.9v0V6.2c0-0.2-0.2-0.4-0.4-0.4l0,0H6.9    C6.7,5.8,6.5,6,6.5,6.2L6.5,6.2z\"/> 		<path class=\"st1\" d=\"M9.6,21.6H12v-4.8H9.6V21.6z\"/> 		<path class=\"st2\" d=\"M8.2,1.2v4.6h5.3V1.2c0-0.4-0.3-0.8-0.8-0.8H9C8.5,0.4,8.2,0.7,8.2,1.2z\"/> 		<path class=\"st1\" d=\"M9.5,3.2C9.4,3.2,9.4,3.1,9.4,3V1.5c0-0.1,0.1-0.2,0.2-0.2c0.1,0,0.2,0.1,0.2,0.2V3C9.7,3.1,9.6,3.2,9.5,3.2z    \"/> 		<path class=\"st1\" d=\"M10.4,3.2c-0.1,0-0.2-0.1-0.2-0.2c0,0,0,0,0,0V1.5c0-0.1,0.1-0.2,0.2-0.2l0,0c0.1,0,0.2,0.1,0.2,0.2V3    C10.6,3.1,10.5,3.2,10.4,3.2z\"/> 		<path class=\"st1\" d=\"M11.2,3.2C11.1,3.2,11,3.1,11,3c0,0,0,0,0,0V1.5c0-0.1,0.1-0.2,0.2-0.2c0.1,0,0.2,0.1,0.2,0.2l0,0V3    C11.4,3.1,11.3,3.2,11.2,3.2z\"/> <path class=\"st1\" d=\"M12.1,3.2c-0.1,0-0.2-0.1-0.2-0.2V1.5c0-0.1,0.1-0.2,0.2-0.2s0.2,0.1,0.2,0.2V3C12.3,3.1,12.2,3.2,12.1,3.2z\"/> </g> </g> </svg>', ''),
(17, 'Phụ kiện Apple', 'phu-kien-apple', 16, NULL, 'images/category/FnlxoA7vpMJmvxj0rGRSKvFRekuHOwoGm74ZFprj.png'),
(18, 'Sạc dự phòng', 'sac-du-phong', 16, NULL, 'images/category/gEaPAem0RdxHkyMcPTx3FydXEGizwLV4ZPv3ZjVE.png'),
(23, 'Tivi', 'tivi', 0, '<svg id=\"svg_tivi\" fill=\"#000000\" height=\"40px\" width=\"40px\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 0 50 50\" xml:space=\"preserve\"> <g id=\"Layer_1\"> 	<path d=\"M1,38h23v3H12v2h26v-2H26v-3h23V8H1V38z M3,10h44v26H3V10z\"/> </g> </svg>', ''),
(24, 'PC & LINH KIỆN', 'pc-&-linh-kien', 0, '<svg height=\"40px\" width=\"40px\" version=\"1.1\" id=\"Capa_1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"  	 viewBox=\"0 0 34.418 34.418\" xml:space=\"preserve\"> <g> 	<path style=\"fill:#000;\" d=\"M32.335,11.606h-6.533v-1.009h6.533V11.606z M32.335,12.264h-6.533v1.011h6.533V12.264z 		 M32.331,7.687h-6.523V9.91h6.523V7.687z M34.418,5.297v23.827c-0.001,0.357-0.292,0.648-0.65,0.648h-9.397 		c-0.359,0-0.649-0.291-0.649-0.649V5.297c0-0.358,0.29-0.65,0.649-0.65h9.397C34.127,4.647,34.418,4.939,34.418,5.297z 		 M33.119,5.944h-8.1v22.53h8.1V5.944z M32.335,13.932h-6.533v1.008h6.533V13.932z M31.272,21.45c0,1.162-0.939,2.099-2.097,2.099 		c-1.16,0-2.099-0.938-2.099-2.099c0-1.158,0.94-2.098,2.099-2.098C30.333,19.352,31.272,20.293,31.272,21.45z M30.515,21.45 		c0-0.739-0.6-1.341-1.341-1.341c-0.742,0-1.342,0.601-1.342,1.341s0.6,1.34,1.342,1.34C29.915,22.79,30.515,22.19,30.515,21.45z 		 M21.937,9.218v13.505c0,0.814-0.655,1.473-1.461,1.473H13.18c0,0-0.414,2.948,2.212,2.948v1.475H13.18H8.758H6.546v-1.473 		c2.529,0,2.212-2.948,2.212-2.948H1.465C0.656,24.198,0,23.539,0,22.725V9.218c0-0.814,0.656-1.47,1.465-1.47h19.01 		C21.282,7.748,21.937,8.404,21.937,9.218z M12.332,22.394c0-0.698-0.566-1.263-1.264-1.263c-0.699,0-1.266,0.565-1.266,1.263 		s0.566,1.265,1.266,1.265C11.767,23.659,12.332,23.092,12.332,22.394z M20.371,9.311H1.568v11.387H20.37h0.001 		C20.371,20.698,20.371,9.311,20.371,9.311z M11.081,21.603c-0.434,0-0.785,0.352-0.785,0.785s0.352,0.785,0.785,0.785 		s0.785-0.352,0.785-0.785S11.515,21.603,11.081,21.603z\"/> </g> </svg>', ''),
(25, 'GIA DỤNG', 'gia-dung', 0, '<svg id=\"svg_smarthome\" fill=\"#000000\" height=\"40px\" width=\"40px\" version=\"1.1\" id=\"Layer_1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" \n	 viewBox=\"0 0 512 512\" xml:space=\"preserve\">\n<g>\n	<g>\n		<path d=\"M494.348,55.028H17.652C7.742,55.028,0,62.66,0,72.57v342.422c0,9.91,7.742,18.055,17.652,18.055h20.516\n			c-0.689,2.393-1.084,3.895-1.084,6.036c0,9.911,8.034,17.889,17.944,17.889h53.832c9.91,0,17.944-7.978,17.944-17.889\n			c0-2.143-0.395-3.644-1.084-6.036h260.56c-0.689,2.393-1.084,3.895-1.084,6.036c0,9.91,8.034,17.889,17.944,17.889h53.832\n			c9.91,0,17.944-7.978,17.944-17.889c0-2.143-0.395-3.644-1.084-6.036h20.516c9.91,0,17.652-8.145,17.652-18.055V72.57\n			C512,62.66,504.258,55.028,494.348,55.028z M476.112,397.159H35.888V90.916h440.224V397.159z\"/>\n	</g>\n</g>\n<g>\n	<g>\n		<path d=\"M445.009,327.776h-29.907c-9.91,0-17.944,8.034-17.944,17.944c0,9.91,8.034,17.944,17.944,17.944h29.907\n			c9.91,0,17.944-8.034,17.944-17.944C462.953,335.81,454.919,327.776,445.009,327.776z\"/>\n	</g>\n</g>\n<g>\n	<g>\n		<path d=\"M358.878,123.215H81.346c-9.91,0-17.944,8.034-17.944,17.944V345.72c0,9.91,8.034,17.944,17.944,17.944h277.533\n			c9.91,0,17.944-8.034,17.944-17.944V141.159C376.822,131.249,368.788,123.215,358.878,123.215z M340.935,327.776H99.29V159.103\n			h241.645V327.776z\"/>\n	</g>\n</g>\n<g>\n	<g>\n		<circle cx=\"430.056\" cy=\"253.225\" r=\"19.906\"/>\n	</g>\n</g>\n<g>\n	<g>\n		<circle cx=\"430.056\" cy=\"193.125\" r=\"19.907\"/>\n	</g>\n</g>\n</svg>', ''),
(28, 'Tai nghe', 'tai-nghe', 16, NULL, 'images/category/653DAwDAgA5SVFdhs7oAKJxoBDSIVpArvYeVgE2X.png'),
(29, 'Loa', 'loa', 16, NULL, 'images/category/vSV8xVy241nWm0L2u8FP6GlGUFJpX7jWt4PYlm32.png'),
(30, 'Bàn phím', 'ban-phim', 16, NULL, 'images/category/im1H30Zh91tDLL2yinvCjYnFQvNSap8SzMspfNf6.png'),
(31, 'Cáp - sạc', 'cap-sac', 16, NULL, 'images/category/8QC1Y401OBX7WVjt73td8qtnXoJtxCIIEAXJNGfn.png'),
(32, 'Chuột', 'chuot', 16, NULL, 'images/category/QZ3ThxKRMOoGd6U3J6hAtfkhsaxuAUUYqpGol7nP.png'),
(33, 'Thẻ nhớ', 'the-nho', 16, NULL, 'images/category/ArLAFIeIFSASeg2GyFfFOaSbBXFe6lMmNXXsUuFu.png'),
(34, 'Bao da - ốp lưng', 'bao-da-op-lung', 16, NULL, 'images/category/OXEw5Y5Mgda7hypNAJx96ptDKU2nLvFl8jTzBl3Q.png'),
(36, 'Máy tính để bàn', 'may-tinh-de-ban', 24, NULL, NULL),
(37, 'Linh kiện', 'linh-kien', 24, NULL, NULL),
(38, 'Màn hình', 'man-hinh', 24, NULL, NULL),
(43, 'Mainboard', 'mainboard', 37, NULL, 'images/category/Re8GIjbI7Oit7DlEye3RL5JImQpcRjmERx49LxLY.png'),
(44, 'Cpu', 'cpu', 37, NULL, 'images/category/w6PJQVrupfWFpkwvR68ffojRwDtAvoFlK2PsQqQE.png'),
(45, 'Ram', 'ram', 37, NULL, 'images/category/QEhKaSR4YoanJGELTb0BC2HoIHMa1PqR9vWKvUpC.png'),
(46, 'Ổ cứng', 'o-cung', 37, NULL, 'images/category/RbhDMehl23rzEJiEiaFUMOVtleiHqkbdvnJya3pP.png'),
(47, 'Card màn hình', 'card-man-hinh', 37, NULL, 'images/category/15fhf31JvxnKEBFyaSrFGFgiGuOjkjYGX2d8nFzp.png'),
(48, 'Nguồn máy tính', 'nguon-may-tinh', 37, NULL, 'images/category/B0wZ5ExP3yaj3KwllGEV6UNLeIJKKGzRLeSWtEkj.png'),
(49, 'Tản nhiệt', 'tan-nhiet', 37, NULL, 'images/category/byAj0qtdnwIDCRTvCH11mUBP0pReY4IMVqyrfb4t.png'),
(50, 'Case máy tính', 'case-may-tinh', 37, NULL, 'images/category/GsQb6l9NQrJl5xZoA7GCR5HoX1ZevfzIcXzmBgqc.png'),
(54, 'Ổ cứng', 'o-cung', 16, NULL, 'images/category/FitsmwVJq2qquin5PzifE23DvOjAlfL9NecrfZVJ.png'),
(55, 'Usb', 'usb', 16, NULL, 'images/category/vCyoKOqVzqabIeNH7yiynlqbf7MYRf2YHmdLZTzH.png'),
(56, 'Thiết bị mạng', 'thiet-bi-mang', 16, NULL, 'images/category/B94eL1jsbov3b1Cai7BCPABmmMNR4w8MMmpliI8D.png'),
(57, 'Balo - Túi sách', 'balo-tui-sach', 16, NULL, 'images/category/l2edbxO22Dv5xj7SfoSldRV3Y0StpbSEnXILYZ89.png'),
(58, 'Dán màn hình', 'dan-man-hinh', 16, NULL, 'images/category/PSE9x6GitRCW5pUi50fXLHGCDBPMMuToFssxDpaL.png'),
(59, 'Camera', 'camera', 16, NULL, 'images/category/v9eIZZKdkfL7dccMm9yYSXM7mT0aB6ZYPuFPEHpc.png'),
(60, 'Phụ kiện laptop', 'phu-kien-laptop', 16, NULL, 'images/category/0yusuraK19QOE3sZMkIjUuFufqHMlm5bdW0UHnVW.png'),
(61, 'Quạt điều hòa', 'quat-dieu-hoa', 25, NULL, 'images/category/sP8VuCiU5wkZ3gxF7I0WsbQUtnxINWJuGCDAzmAi.png'),
(62, 'Máy lọc nước', 'may-loc-nuoc', 25, NULL, 'images/category/jB2ap912awLYgDzrUtZtqgq0hFfw7uekegBpGd4h.png'),
(63, 'Robot hút bụi', 'robot-hut-bui', 25, NULL, 'images/category/NH7kbts8WTptqxLrnjBOHLywQtU1eCdLxBT7szhF.png'),
(64, 'Cây nước nóng lạnh', 'cay-nuoc-nong-lanh', 25, NULL, 'images/category/SvLCMEMTpp4J6odhXZNkxRkr5UQu29pySQr6Jrtk.png'),
(65, 'Máy lọc không khí', 'may-loc-khong-khi', 25, NULL, 'images/category/v3fFqd75OXPFujv9llQ47y6IuOZy5B59fNNZ6UA6.png'),
(66, 'Bàn ủi', 'ban-ui', 25, NULL, 'images/category/qePyuSFci5hUSSPtqtuUt2nrSzuhtZMCEisM0leh.png'),
(67, 'Máy hút ẩm', 'may-hut-am', 25, NULL, 'images/category/NIRpU7XUmwBaGB0IShsnhi7cFoDY9as0CXEOqJJC.png'),
(68, 'Ổ cắm điện', 'cam-dien', 25, NULL, 'images/category/GydUc2ul8paFONh5RfCXqE3Chy4VmrkMdMaAAPYP.png'),
(69, 'Nồi chiên không dầu', 'noi-chien-khong-dau', 25, NULL, 'images/category/YWNP0fVz0R3tM9z9Cp7wpcjRjLXHuJ9mkegqXidR.png'),
(70, 'Nồi cơm điện', 'noi-com-dien', 25, NULL, 'images/category/YBwtjkSA35xmZe9zvvcO0NKScqY2RTK6NsiyV6Kr.png'),
(71, 'Máy sây sinh tố', 'may-say-sinh-to', 25, NULL, 'images/category/LjAB7dt7ZQ8WqJH8BfbBMRVIq6hQrdjOZW8Uyavj.png'),
(72, 'Nồi', 'noi', 25, NULL, 'images/category/6ofqEb06oBm7KPkLz3oPBsJBVBERyctHaBvyLwna.png'),
(73, 'Chảo chống dính', 'chao-chong-dinh', 25, NULL, 'images/category/BJhevzZqvwRiaEQR8EnBkPi6unk6VjmJFq9RGLzc.png'),
(74, 'Bình đun nước', 'binh-dun-nuoc', 25, NULL, 'images/category/Dy2U3HsGyX7c2zkggbu6Cx5dEPi9Jj2y7IYeshUj.png'),
(75, 'Máy ép trái cây', 'may-ep-trai-cay', 25, NULL, 'images/category/7iSgNdYcVXwyV6UqLQyDCeLxCwSSUB9BLK3TbWWd.png'),
(76, 'Bếp điện từ', 'bep-dien-tu', 25, NULL, 'images/category/TY9Q5MbRCkCYPN6iRmyu59C5L6mZF4z5FFMSAE3z.png'),
(77, 'Nồi lẩu điện', 'noi-lau-dien', 25, NULL, 'images/category/PNaNqnZbESYa5sAmvXAUbOV0RESHI60Pbl4a5nhy.png'),
(78, 'Máy rửa chén', 'may-rua-chen', 25, NULL, 'images/category/Hc0ZtoOwbiwlEmfJoSGqfKJzvEDVgONT5xmNvs6N.png'),
(79, 'Nồi áp suất', 'noi-ap-suat', 25, NULL, 'images/category/DqxgZkFdfqRPkGheoUba2kBPMP3ULYRBZ1KD29Kv.png'),
(80, 'Máy xây thịt', 'may-xay-thit', 25, NULL, 'images/category/zCUJXDUZ2oqY6oSjxuMGcDl1n2wB9YaypfkSV0Nq.png'),
(81, 'Bếp nướng điện', 'bep-nuong-dien', 25, NULL, 'images/category/7VeR21XLlnMXQ6F0ujAmGuWqKzFYn46Aj4TsSB0I.png'),
(82, 'Lò vi sóng', 'lo-vi-song', 25, NULL, 'images/category/5108EtuwddWpzyytJot6uwcvlWSu1v18NVolxyfQ.png'),
(83, 'Lò nướng', 'lo-nuong', 25, NULL, 'images/category/dnuCXpD2DHBDuHnxyNqK6Zf3TFeJIPan3QGtIGCb.jpg'),
(84, 'Bếp ga', 'bep-ga', 25, NULL, 'images/category/VFZWCAPzocahuo42zELsmvh0MLcx1VLqvxXedP1I.png'),
(85, 'ĐỒNG HỒ', 'dong-ho', 0, '<svg id=\"smartwatch\" width=\"40px\" height=\"40px\" viewBox=\"0 0 24 24\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n<path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M9.25 2C8.55964 2 8 2.55964 8 3.25V6.17071C6.83481 6.58254 6 7.69378 6 9V15C6 16.3062 6.83481 17.4175 8 17.8293V20.75C8 21.4404 8.55964 22 9.25 22H14.75C15.4404 22 16 21.4404 16 20.75V17.8293C17.1652 17.4175 18 16.3062 18 15V9C18 7.69378 17.1652 6.58254 16 6.17071V3.25C16 2.55964 15.4404 2 14.75 2H9.25ZM9 8C8.44772 8 8 8.44772 8 9V15C8 15.5523 8.44772 16 9 16H15C15.5523 16 16 15.5523 16 15V9C16 8.44772 15.5523 8 15 8H9Z\" fill=\"#000000\"/>\n</svg>', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_attributes`
--

CREATE TABLE `category_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `show/hide` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category_attributes`
--

INSERT INTO `category_attributes` (`id`, `category_id`, `name`, `show/hide`) VALUES
(2, 2, 'Mức giá', '1'),
(4, 2, 'Màn hình', '0'),
(5, 1, 'Mức giá', '1'),
(7, 1, 'Tính năng đặc biệt', '0'),
(8, 1, 'Hiệu năng và pin', '0'),
(9, 1, 'Màn hình', '0'),
(10, 1, 'Camera', '0'),
(11, 1, 'Dung lượng ram', '0'),
(12, 2, 'Cpu', '0'),
(13, 2, 'Ram', '0'),
(14, 2, 'Card đồ họa', '0'),
(15, 10, 'Mức giá', '1'),
(16, 23, 'Mức giá', '1'),
(17, 23, 'Độ phân giải', '0'),
(18, 23, 'Kích thước màn hình', '0'),
(19, 1, 'Chip xử lý', '0'),
(20, 2, 'Ổ cứng', '0'),
(21, 2, 'Tính năng đặc biệt', '0'),
(22, 2, 'Nhu cầu', '0'),
(23, 10, 'Bộ nhớ trong', '0'),
(24, 10, 'Màn hình', '0'),
(25, 10, 'Tính năng đặc biệt', '0'),
(26, 10, 'Chipset', '0'),
(27, 10, 'Nhu cầu sử dụng', '0'),
(28, 10, 'Hệ điều hành', '0'),
(29, 23, 'Loại tivi', '0'),
(30, 23, 'Tần số quét', '0'),
(31, 23, 'Tiện ích nổi bật', '0'),
(32, 23, 'Cổng kết nối', '0'),
(33, 36, 'Nhu cầu', '0'),
(34, 36, 'Mức giá', '0'),
(35, 36, 'CPU', '0'),
(36, 36, 'Ram', '0'),
(37, 36, 'Ổ cứng', '0'),
(38, 36, 'Card đồ họa', '0'),
(39, 38, 'Nhu cầu', '0'),
(40, 38, 'Mức giá', '0'),
(41, 38, 'Kiểu màn hình', '0'),
(42, 38, 'Kích thước màn hình', '0'),
(43, 38, 'Tần số quét', '0'),
(44, 38, 'Độ phân giải', '0'),
(45, 38, 'Tấm nền', '0'),
(46, 18, 'Mức giá', '0'),
(47, 18, 'Dung lượng pin', '0'),
(48, 18, 'Số cổng sạc', '0'),
(49, 18, 'Tính năng', '0'),
(50, 18, 'Cổng vào', '0'),
(51, 18, 'Cổng ra', '0'),
(52, 18, 'Công suất sạc', '0'),
(54, 43, 'Loại chipset', '0'),
(55, 43, 'Mức giá', '0'),
(56, 43, 'Socket', '0'),
(57, 43, 'Số khe cắm ram', '0'),
(58, 43, 'Kiểu ram', '0'),
(59, 44, 'Hãng sản xuất', '0'),
(60, 44, 'Mức giá', '0'),
(61, 44, 'Dòng CPU', '0'),
(62, 44, 'Thế hệ CPU', '0'),
(63, 44, 'Socket', '0'),
(64, 44, 'Số nhân', '0'),
(65, 45, 'Mức giá', '0'),
(66, 45, 'Loại ram', '0'),
(67, 45, 'Dung lượng', '0'),
(68, 45, 'Bus', '0'),
(69, 46, 'Mức giá', '0'),
(70, 46, 'Dung lượng', '0'),
(71, 46, 'Loại ổ cứng', '0'),
(72, 46, 'Tốc độ đọc', '0'),
(73, 47, 'Mức giá', '0'),
(74, 47, 'Dung lượng', '0'),
(75, 47, 'Kiểu bộ nhớ', '0'),
(76, 47, 'GPU', '0'),
(77, 48, 'Mức giá', '0'),
(78, 48, 'Công suất', '0'),
(79, 48, 'Tiêu chuẩn nguồn', '0'),
(80, 49, 'Mức giá', '0'),
(81, 49, 'Loại tản nhiệt', '0'),
(82, 49, 'Số lượng quạt', '0'),
(83, 49, 'Loại đèn LED', '0'),
(85, 50, 'Mức giá', '0'),
(86, 50, 'Loại case', '0'),
(87, 32, 'Mức giá', '0'),
(89, 32, 'Tương thích', '0'),
(90, 32, 'Kết nối', '0'),
(91, 32, 'Tiện ích', '0'),
(92, 30, 'Mức giá', '0'),
(93, 30, 'Tương thích', '0'),
(94, 30, 'Loại', '0'),
(95, 85, 'Nhu cầu', '1'),
(96, 85, 'Mức giá', '0'),
(97, 85, 'Kích cỡ mặt đồng hồ', '0'),
(98, 85, 'Tính năng sức khỏe', '0'),
(99, 85, 'Chất liệu viền', '0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_attribute_values`
--

CREATE TABLE `category_attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category_attribute_values`
--

INSERT INTO `category_attribute_values` (`id`, `category_attribute_id`, `value`) VALUES
(6, 2, 'Dưới 10 triệu'),
(7, 2, 'Từ 10 - 15 triệu'),
(8, 2, 'Từ 15 - 20  triệu'),
(9, 2, 'Từ 20 - 25 triệu'),
(10, 2, 'Trên 25 triệu'),
(13, 4, 'Khoảng 13 inch'),
(14, 4, 'Khoảng 14 inch'),
(15, 4, 'Trên 15 inch'),
(23, 5, 'Dưới 2 triệu'),
(24, 5, 'Từ 2 - 4 triệu'),
(25, 5, 'Từ 4 - 7 triệu'),
(26, 5, 'Từ 7 - 13 triệu'),
(27, 5, 'Trên 13 triệu'),
(28, 7, 'Bảo mật vân tay'),
(29, 7, 'Nhận diện khuôn mặt'),
(30, 7, 'Sạc nhanh'),
(31, 8, 'Dưới 3000 mah'),
(32, 8, 'Từ 3000 - 4000 mah'),
(33, 8, 'Từ 4000 - 5000 mah'),
(34, 8, 'Trên 5000 mah'),
(36, 9, 'Dưới 5 inch'),
(37, 9, 'Dưới 6 inch - Tràn viền'),
(38, 9, 'Trên 6 inch'),
(39, 9, 'Màn hình gập'),
(40, 10, 'Quay phim Slow Motion'),
(41, 10, 'Ai camera'),
(42, 10, 'Hiệu ứng làm đẹp'),
(43, 11, 'Dưới 4 GB'),
(44, 11, '4GB - 6GB'),
(45, 11, '8GB - 12GB'),
(46, 11, '12GB trở lên'),
(50, 12, 'Intel celeron'),
(51, 12, 'Intel pentium'),
(52, 12, 'Intel core i3'),
(53, 12, 'Intel core i5'),
(54, 12, 'Intel core i7'),
(55, 13, '4gb'),
(56, 13, '8gb'),
(57, 13, '16gb'),
(58, 13, '32gb'),
(59, 14, 'NVIDIA GeForce Series'),
(60, 14, 'AMD Radeon Series'),
(61, 15, 'Dưới 3 triệu'),
(62, 15, 'Từ 3 - 8 triệu'),
(63, 15, 'Từ 8 - 15 triệu'),
(64, 15, 'Trên 15 triệu'),
(65, 16, 'Từ 5 - 10 triệu'),
(66, 16, 'Từ 10 - 15 triệu'),
(67, 16, 'Từ 15 triệu - 20 triệu'),
(68, 16, 'Từ 20 triệu - 25 triệu'),
(69, 16, 'Từ 25 triệu - 30 triệu'),
(70, 17, 'HD'),
(71, 17, 'FullHD'),
(72, 17, '4K'),
(73, 18, '32 inch'),
(74, 18, '43 inch'),
(75, 18, '50 inch'),
(76, 18, '55 inch'),
(77, 18, '58 inch'),
(78, 18, '60 inch'),
(79, 18, '65 inch'),
(80, 18, '70 inch'),
(81, 7, 'Chống nước và bụi'),
(82, 7, 'Hỗ trợ 5G'),
(83, 7, 'Sạc không dây'),
(84, 8, 'Chơi game - Dung lượng lớn'),
(85, 10, 'Zoom quang học'),
(86, 10, 'Chống rung ios'),
(87, 10, 'Chụp macro'),
(88, 10, 'Chụp gốc rộng'),
(90, 19, 'Snapdragon'),
(91, 19, 'Mediatek Dimensity'),
(92, 19, 'Mediatek Helio'),
(93, 19, 'Exynos'),
(94, 19, 'Apple A'),
(95, 12, 'Amd ryzen 3'),
(96, 12, 'Amd ryzen 5'),
(97, 12, 'Amd ryzen 7'),
(98, 12, 'Amd ryzen 9'),
(99, 14, 'Card Onboard'),
(100, 20, 'Ssd 1 tb'),
(101, 20, 'Ssd 512 gb'),
(102, 20, 'Ssd 256 gb'),
(103, 20, 'Ssd 128 gb'),
(104, 21, 'Hỗ trợ công nghệ Optane'),
(105, 21, 'Bảo mật vân tay'),
(106, 21, 'Màn hình cảm ứng'),
(107, 21, 'Mở khóa vân tay'),
(108, 21, 'Công nghệ Intel Gaming'),
(109, 21, 'Sử dụng tấm nền IPS'),
(110, 22, 'Gaming'),
(111, 22, 'Sinh viên - Văn phòng'),
(112, 22, 'Thiết kế đồ họa'),
(113, 22, 'Mỏng nhẹ'),
(114, 22, 'Doanh nhân'),
(115, 23, 'Dưới 64 gb'),
(116, 23, 'Từ 64 gb - 256 gb'),
(117, 23, 'Trên 256 gb'),
(118, 24, 'Khoảng 7 - 8 inch'),
(119, 24, 'Khoảng 10 - 11 inch'),
(120, 24, 'Khoảng 12 inch trở lên'),
(121, 25, 'Hỗ trợ 4G/5G - Nghe gọi'),
(122, 25, 'Hỗ trợ bút cảm ứng'),
(123, 25, 'Cảm biến vân tay'),
(124, 25, 'Nhận diện khuôn mặt'),
(125, 25, 'Sạc nhanh'),
(126, 26, 'Apple A-series'),
(127, 26, 'Snapdragon'),
(128, 26, 'Apple M1'),
(129, 26, 'Apple M2'),
(130, 27, 'Học tập - văn phòng'),
(131, 27, 'Giải trí'),
(132, 27, 'Đồ họa - sáng tạo'),
(133, 27, 'Chơi game'),
(134, 28, 'iPadOS'),
(135, 28, 'Android'),
(136, 28, 'HarmonyOS'),
(137, 29, 'Smart tivi'),
(138, 29, 'Android tivi'),
(139, 29, 'Tivi Led'),
(140, 29, 'Tivi QLed'),
(141, 30, '50Hz'),
(142, 30, '60Hz'),
(143, 30, '100Hz'),
(144, 30, '120Hz'),
(145, 31, 'Tìm kiếm bằng giọng nói'),
(146, 31, 'Tích hợp trợ lý ảo Google Assistant'),
(147, 31, 'Điều khiển qua ứng dụng'),
(148, 31, 'Chơi game trên tivi'),
(149, 31, 'Kết nối điện thoại với tivi'),
(150, 32, 'HDMI'),
(151, 32, 'Display Port'),
(152, 32, 'Thunderbolt'),
(153, 32, 'USB'),
(154, 33, 'PC Gaming'),
(155, 33, 'PC Văn phòng'),
(156, 33, 'PC đồ họa'),
(157, 34, 'Dưới 10 triệu'),
(158, 34, 'Từ 10 - 15 triệu'),
(159, 34, 'Từ 15 - 10 triệu'),
(160, 34, 'Từ 20 - 30 triệu'),
(161, 34, 'Từ 30 - 40 triệu'),
(162, 34, 'Trên 40 triệu'),
(163, 35, 'Apple M1'),
(164, 35, 'Celeron/Pentium'),
(165, 35, 'Intel Core i3'),
(166, 35, 'Intel Core i5'),
(167, 35, 'AMD Ryzen 3'),
(168, 35, 'AMD Ryzen 5'),
(169, 35, 'AMD Ryzen 7'),
(170, 36, '4 GB'),
(171, 36, '8 GB'),
(172, 36, '16 GB'),
(173, 36, '32 GB'),
(174, 37, 'SSD 128 GB'),
(175, 37, 'SSD 240 GB'),
(176, 37, 'SSD 256 GB'),
(177, 37, 'SSD 512 GB'),
(178, 38, 'Nvidia geforce'),
(179, 38, 'AMD Radeon'),
(180, 38, 'Card onboard'),
(181, 39, 'Gaming'),
(182, 39, 'Văn phòng'),
(183, 39, 'Đồ họa'),
(184, 40, 'Dưới 3 triệu'),
(185, 40, 'Từ 3 - 5 triệu'),
(186, 40, 'Từ 3 - 7 triệu'),
(187, 40, 'Từ 7 - 10 triệu'),
(188, 40, 'Trên 10 triệu'),
(189, 41, 'Màn hình phẳng'),
(190, 41, 'Màn hình cong'),
(191, 42, 'Dưới 21 inch'),
(192, 42, 'Khoàng 24 inch'),
(193, 42, 'Khoảng 27 inch'),
(194, 42, 'Khoảng 32 inch'),
(195, 42, 'Khoảng 34 inch trở lên'),
(196, 43, '60Hz'),
(197, 43, '75Hz'),
(198, 43, '100Hz'),
(199, 43, '144Hz'),
(200, 43, '165Hz'),
(201, 43, '170Hz'),
(202, 43, '240Hz'),
(203, 44, 'Full HD'),
(204, 44, 'HD'),
(205, 44, '2K'),
(206, 44, '4K'),
(207, 44, '5K'),
(208, 45, 'IPS'),
(209, 45, 'WVA'),
(210, 45, 'VA'),
(211, 45, 'TN'),
(212, 45, 'LCD'),
(213, 45, 'OLED'),
(214, 46, 'Dưới 500K'),
(215, 46, 'Từ 500k - 1 triệu'),
(216, 46, 'Từ 1 - 2 triệu'),
(217, 46, 'Từ 2 - 3 triệu'),
(218, 46, 'Từ 3 triệu trở lên'),
(219, 47, 'Dưới 10.000 mAh'),
(220, 47, '10.000 mAh'),
(221, 47, '15.000 mAh'),
(222, 47, 'Từ 20.000 mAh trở lên'),
(223, 48, '1 cổng sạc'),
(224, 48, '2 cổng sạc'),
(225, 48, '3 cổng sạc'),
(226, 48, 'Trển 3 cổng sạc'),
(227, 49, 'Sạc nhanh'),
(228, 49, 'Chống cháy nổ'),
(229, 49, 'Cố chip thông minh'),
(230, 49, 'Sạc không dây'),
(231, 49, 'Sạc MagSafe'),
(232, 49, 'Hiện thông số sạc'),
(233, 49, 'Sạc được cho laptop'),
(234, 50, 'Type-C'),
(235, 50, 'Micro USB'),
(236, 50, 'Lightning'),
(237, 51, 'Type-C'),
(238, 51, 'USB-A'),
(239, 52, 'Từ 10 - 30W'),
(240, 52, 'Từ 31 - 60W'),
(241, 52, 'Trên 60W'),
(242, 54, 'Intel'),
(243, 54, 'ADM'),
(244, 55, 'Dưới 2 triệu'),
(245, 55, '2 đến 3 triệu'),
(246, 55, '3 đến 5 triệu'),
(247, 55, '5 đến 8 triệu'),
(248, 55, '8 đến 12 triệu'),
(249, 55, '12 đến 15 triệu'),
(250, 55, 'Trên 15 triệu'),
(251, 56, 'LGA 1700'),
(252, 56, 'LGA 1200'),
(253, 56, 'AM4'),
(254, 56, 'AM5'),
(255, 57, '2 khe'),
(256, 57, '4 khe'),
(257, 57, '8 khe'),
(258, 58, 'DDR4'),
(259, 58, 'DDR5'),
(260, 59, 'Intel'),
(261, 59, 'ADM'),
(262, 60, 'Dưới 2 triệu'),
(263, 60, '2 đến 4 triệu'),
(264, 60, '4 đến 8 triệu'),
(265, 60, 'Trên 8 triệu'),
(266, 61, 'Intel core i3'),
(267, 61, 'Intel core i5'),
(268, 61, 'Intel core i7'),
(269, 61, 'Intel core i9'),
(270, 61, 'AMD Ryzen 3'),
(271, 61, 'AMD Ryzen 5'),
(272, 61, 'AMD Ryzen 7'),
(273, 61, 'AMD Ryzen 9'),
(274, 62, 'Intel thế hệ 10'),
(275, 62, 'Intel thế hệ 11'),
(276, 62, 'Intel thế hệ 12'),
(277, 62, 'Intel thế hệ 13'),
(278, 62, 'AMD Ryzen thế hệ thứ 3'),
(279, 62, 'AMD Ryzen thế hệ thứ 4'),
(280, 62, 'AMD Ryzen thế hệ thứ 5'),
(281, 62, 'AMD Ryzen thế hệ thứ 7'),
(282, 63, 'LGA 1200'),
(283, 63, 'LGA 1700'),
(284, 63, 'AMD AM4'),
(285, 64, '2'),
(286, 64, '4'),
(287, 64, '6'),
(288, 64, '8'),
(289, 64, '10'),
(290, 64, '12'),
(291, 64, '14'),
(292, 64, '16'),
(293, 64, '24'),
(294, 64, '32'),
(295, 64, '64'),
(296, 65, 'Dưới 2 triệu'),
(297, 65, '2 đến 4 triệu'),
(298, 65, '4 đến 8 triệu'),
(299, 65, 'Trên 8 triệu'),
(300, 66, 'DDR4'),
(301, 66, 'DDR5'),
(302, 67, '4GB'),
(303, 67, '8GB'),
(304, 67, '32GB'),
(305, 67, '64GB'),
(306, 68, 'DDR4 2400Mhz'),
(307, 68, 'DDR4 2666Mhz'),
(308, 68, 'DDR4 3000Mhz'),
(309, 68, 'DDR4 3200Mhz'),
(310, 68, 'DDR4 3600Mhz'),
(311, 68, 'DDR4 3800Mhz'),
(312, 69, 'Dưới 1 triệu'),
(313, 69, 'Từ 1 - 2 triệu'),
(314, 69, 'Từ 2 - 3 triệu'),
(315, 69, 'Từ 3 - 4 triệu'),
(316, 69, 'Trên 4 triệu'),
(317, 70, '120 GB'),
(318, 70, '128 GB'),
(319, 70, '240 GB'),
(320, 70, '250 GB'),
(321, 70, '256 GB'),
(322, 70, '480 GB'),
(323, 70, '500 GB'),
(324, 70, '512 GB'),
(325, 70, '1TB'),
(326, 70, '2 TB'),
(327, 70, '4 TB'),
(328, 71, 'SSD'),
(329, 71, 'HDD'),
(330, 72, '500 - 1000 MB/s'),
(331, 72, '1000 - 3000 MB/s'),
(332, 72, 'Dưới 300 MB/s'),
(333, 73, 'Dưới 5 triệu'),
(334, 73, 'Từ 5 đến 8 triệu'),
(335, 73, 'Từ 8 đến 12 triệu'),
(336, 73, 'Từ 12 đến 17 triệu'),
(337, 73, 'Từ 17 đến 23 triệu'),
(338, 73, 'Trên 23 triệu'),
(339, 74, '2 GB'),
(340, 74, '4 GB'),
(341, 74, '6 GB'),
(342, 74, '8 GB'),
(343, 74, '12 GB'),
(344, 74, '16 GB'),
(345, 75, 'GDDR6'),
(346, 75, 'GDDR5'),
(347, 75, 'GDDR4'),
(348, 75, 'GDDR6X'),
(349, 75, 'GDDR3'),
(350, 76, 'GT 710'),
(351, 76, 'GT 730'),
(352, 76, 'GT 1030'),
(353, 76, 'GTX 1650'),
(354, 76, 'GTX 1660 Super'),
(355, 76, 'GTX 1660 Ti'),
(356, 76, 'RTX 2060'),
(357, 77, 'Dưới 500 ngàn'),
(358, 77, 'Từ 500 - 1 triệu'),
(359, 77, 'Từ 1 - 2 triệu'),
(360, 77, 'Từ 2 đến 4 triệu'),
(361, 77, 'Trên 4 triệu'),
(362, 78, '400W - 550W'),
(363, 78, '550W - 650W'),
(364, 78, '650W - 800W'),
(365, 78, '800W - 1000W'),
(366, 78, 'Trên 1000W'),
(367, 79, '80 Plus Bronze'),
(368, 79, '80 Plus Gold'),
(369, 79, '80 Plus White'),
(370, 79, '80 Plus Silver'),
(371, 79, '80 Plus Platinum'),
(372, 79, '80 Plus Titanium'),
(373, 80, 'Dưới 1 triệu'),
(374, 80, 'Từ 1 - 2 triệu'),
(375, 80, 'Từ 2 - 4 triệu'),
(376, 80, 'Trên 4 triệu'),
(377, 81, 'Tản nhiệt nước'),
(378, 81, 'Tản nhiệt khí'),
(379, 82, '1 quạt'),
(380, 82, '2 quạt'),
(381, 82, '3 quạt'),
(382, 83, 'LED ARGB'),
(383, 83, 'LED RGB'),
(384, 85, 'Dưới 1 triệu'),
(385, 85, 'Từ 1 - 2 triệu'),
(386, 85, 'Từ 2 - 3 triệu'),
(387, 85, 'Trên 3 triệu'),
(388, 86, 'ATX Full Tower'),
(389, 86, 'ATX Mid Tower'),
(390, 87, 'Dưới 500 ngàn'),
(391, 87, 'Từ 500 - 1 triệu'),
(392, 87, 'Trên 1 triệu'),
(393, 89, 'MacOS'),
(394, 89, 'Window'),
(395, 89, 'Linux'),
(396, 90, 'Dây USB'),
(397, 90, 'Bluetooth'),
(398, 90, 'USB Receiver'),
(399, 90, 'Lightspeed'),
(400, 90, 'Dây USB to Type-C'),
(401, 91, 'Kết nối đa thiết bị'),
(402, 91, 'Click không nghe tiếng'),
(403, 91, 'Dùng pin sạc'),
(404, 92, 'Dưới 500 ngàn'),
(405, 92, 'Từ 500 - 1 triệu'),
(406, 92, 'Từ 1 - 2 triệu'),
(407, 92, 'Trên 2 triệu'),
(408, 93, 'Laptop/PC'),
(409, 93, 'Tablet'),
(410, 94, 'Có dây'),
(411, 94, 'Không dây'),
(412, 94, 'Cơ'),
(413, 95, 'Tập luyện thể thao'),
(414, 95, 'Chống nước'),
(415, 95, 'Nghe gọi'),
(416, 95, 'Đo huyết áp'),
(417, 95, 'Vòng đeo tay thông minh'),
(418, 95, 'Đồng hồ định vị trẻ em'),
(419, 96, 'Dưới 3 triệu'),
(420, 96, 'Từ 3 - 5 triệu'),
(421, 96, 'Từ 5 - 8 triệu'),
(422, 96, 'Từ 8 - 10 triệu'),
(423, 96, 'Trên 10 triệu'),
(424, 97, 'Cho nữ (<41mm)'),
(425, 97, 'Cho nam (42 - 47mm)'),
(426, 98, 'Đo nồng độ oxy trong máu (SpO2)'),
(427, 98, 'Đo huyết áp'),
(428, 98, 'Hỗ trợ bơi lội'),
(429, 98, 'Phát hiện té ngã'),
(430, 99, 'Nhôm'),
(431, 99, 'Thép'),
(432, 99, 'Nhựa'),
(433, 99, 'Polymer'),
(434, 99, 'Titanium');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `commenter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`commenter`)),
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reply_to` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `product_id`, `commenter`, `content`, `created_at`, `reply_to`) VALUES
(157, 23, '{\"Gender\":\"Boy\",\"Name\":\"Corona\",\"Phone\":\"0941333444\",\"Email\":\"test@gmail.com\"}', 'Cho hỏi sản phẩm này có giảm giá không vậy ?', '2023-06-04 15:19:48', NULL),
(158, 23, '{\"QTV\":true,\"Name\":\"Qu\\u1ea3n tr\\u1ecb vi\\u00ean\"}', '@Corona Dạ có ạ', '2023-06-04 15:19:48', 157),
(159, 23, '{\"Gender\":\"Boy\",\"Name\":\"Corona\",\"Phone\":\"0941333444\",\"Email\":\"test@gmail.com\"}', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2023-08-01 15:49:27', NULL),
(160, 23, '{\"QTV\":true,\"Name\":\"Qu\\u1ea3n tr\\u1ecb vi\\u00ean\"}', '@Corona ok...', '2023-08-01 15:58:13', 159);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments_to_reply`
--

CREATE TABLE `comments_to_reply` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `commenter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`commenter`)),
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reply_to` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `coupon_type` enum('free_ship','coupon') NOT NULL,
  `type` enum('percent','fixed') NOT NULL,
  `maximum_discount` int(10) UNSIGNED DEFAULT NULL,
  `amount` bigint(20) UNSIGNED NOT NULL,
  `minimum_spend` bigint(20) UNSIGNED NOT NULL,
  `limit_per_coupon` int(10) UNSIGNED NOT NULL,
  `used` int(11) NOT NULL DEFAULT 0,
  `limit_per_user` int(10) UNSIGNED NOT NULL,
  `applied_products` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`applied_products`)),
  `users` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `description`, `start`, `end`, `coupon_type`, `type`, `maximum_discount`, `amount`, `minimum_spend`, `limit_per_coupon`, `used`, `limit_per_user`, `applied_products`, `users`) VALUES
(1, 'ABC', 'abc', '2023-06-06', '2023-08-13', 'coupon', 'fixed', NULL, 100000, 300000, 20, 3, 1, NULL, '[1]'),
(2, 'ABCDEF', 'abc', '2023-06-06', '2023-07-14', 'coupon', 'percent', 1000000, 15, 200000, 20, 2, 1, NULL, '[]'),
(3, 'DqdEan', 'abc...', '2023-06-06', '2023-07-18', 'coupon', 'fixed', NULL, 500000, 5000000, 10, 3, 1, NULL, '[]'),
(4, 'FS123', 'free ship', '2023-06-09', '2023-08-09', 'free_ship', 'fixed', NULL, 10000, 100000, 10, 4, 1, NULL, '[1]');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flash_sale`
--

CREATE TABLE `flash_sale` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `discounted_price` bigint(20) UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flash_sale`
--

INSERT INTO `flash_sale` (`id`, `product_id`, `discounted_price`, `start_time`, `end_time`) VALUES
(11, 19, 1000000, '2023-07-22 00:00:00', '2023-08-07 22:30:00'),
(12, 8, 1000000, '2023-07-22 00:00:00', '2023-08-07 22:30:00'),
(13, 9, 1000000, '2023-07-22 00:00:00', '2023-08-07 22:30:00'),
(14, 13, 2000000, '2023-07-22 00:00:00', '2023-08-07 22:30:00'),
(15, 15, 1000000, '2023-07-22 00:00:00', '2023-08-07 22:30:00'),
(16, 16, 2500000, '2023-07-22 00:00:00', '2023-08-07 22:30:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `groups_products_link`
--

CREATE TABLE `groups_products_link` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `version_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `groups_products_link`
--

INSERT INTO `groups_products_link` (`id`, `product_id`, `group_id`, `version_name`) VALUES
(1, 19, 1, '128GB'),
(2, 28, 9, '64GB'),
(3, 8, 1, '64GB');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inventory`
--

CREATE TABLE `inventory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `color_id`, `quantity`) VALUES
(35, 9, NULL, 1),
(36, 10, 11, 100),
(37, 10, 12, 100),
(38, 11, 13, 100),
(39, 11, 14, 100),
(40, 11, 15, 100),
(41, 13, 32, 100),
(42, 15, 17, 100),
(43, 16, 18, 100),
(44, 17, 19, 100),
(45, 17, 20, 100),
(46, 17, 21, 100),
(47, 18, 22, 100),
(48, 18, 23, 100),
(49, 19, 24, 97),
(50, 20, 26, 100),
(51, 20, 27, 100),
(52, 21, 29, 100),
(53, 22, 30, 100),
(54, 23, 38, 100),
(55, 23, 39, 100),
(56, 24, NULL, 100),
(57, 25, NULL, 100),
(58, 26, NULL, 100),
(59, 27, 35, 98),
(60, 27, 36, 100),
(61, 28, 37, 100),
(62, 29, NULL, 100),
(63, 30, NULL, 100),
(64, 31, NULL, 100),
(65, 32, NULL, 100),
(66, 33, NULL, 100),
(67, 34, NULL, 100),
(68, 35, NULL, 100),
(69, 36, NULL, 100),
(70, 37, NULL, 100),
(71, 38, NULL, 100),
(72, 39, NULL, 100),
(73, 40, NULL, 300),
(77, 8, 51, 2),
(78, 8, 52, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(61, 'default', '{\"uuid\":\"34e5167a-bc38-4496-82c2-fedd7235d4b3\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:17;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1686150258, 1686150258),
(62, 'default', '{\"uuid\":\"a16d3701-0524-4dc3-9939-bb16756401b9\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:18;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1686150260, 1686150260),
(63, 'default', '{\"uuid\":\"c840a2bd-38b7-4cac-bdeb-1b25af367c2c\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:19;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1686217973, 1686217973),
(64, 'default', '{\"uuid\":\"679acc4d-df48-44a7-8eec-bd7c13ed6a3d\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:20;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1686322190, 1686322190),
(65, 'default', '{\"uuid\":\"914da755-ecff-405e-8fac-ce634fc8ef98\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:21;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1686903547, 1686903547),
(66, 'default', '{\"uuid\":\"929df572-006c-49d4-a3cf-8799e2d9de39\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:22;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1686903912, 1686903912),
(67, 'default', '{\"uuid\":\"bc25b4a5-2056-4953-bc8a-8f826165f51b\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:23;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1686904155, 1686904155),
(68, 'default', '{\"uuid\":\"03b84642-8294-478d-911a-f3c08e8e80fb\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:24;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1686904265, 1686904265),
(69, 'default', '{\"uuid\":\"cb57fe7f-9896-4913-9759-6bd1cc0d5dc5\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:25;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1686904566, 1686904566),
(70, 'default', '{\"uuid\":\"3939eb9f-b683-471a-bba2-7dc3bac04db0\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:26;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1686905036, 1686905036),
(71, 'default', '{\"uuid\":\"315d582b-4485-4e21-a339-5f764baa1d02\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:27;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1687600423, 1687600423),
(72, 'default', '{\"uuid\":\"b55bced9-ddd5-40c1-93b3-676a2f76f3d9\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:28;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1687600451, 1687600451),
(73, 'default', '{\"uuid\":\"bd4e660a-32b7-49cd-922c-dcf01d128821\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:29;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1687600498, 1687600498),
(74, 'default', '{\"uuid\":\"8fa8c807-dcea-4c91-b657-2896c48d227b\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:30;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1687600567, 1687600567),
(75, 'default', '{\"uuid\":\"a7343c60-2038-40f9-bed7-ecb26cdc1552\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:31;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1687618486, 1687618486),
(76, 'default', '{\"uuid\":\"1a269653-ae26-4981-9c4d-4ca272d4cd8c\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:32;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1687785701, 1687785701),
(77, 'default', '{\"uuid\":\"995c661c-0e5e-4c56-8feb-14d8746a97de\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:33;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1688652400, 1688652400),
(78, 'default', '{\"uuid\":\"0be17b4b-4bff-40aa-95fc-4d872c44cbcb\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";N;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";N;s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1688809610, 1688809610),
(79, 'default', '{\"uuid\":\"5fe3bc58-df68-4b61-a520-b7af224d43f4\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:34;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1688809724, 1688809724),
(80, 'default', '{\"uuid\":\"f0ae286a-216f-41f9-b230-75dc6a6c2627\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:35;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1688810848, 1688810848),
(81, 'default', '{\"uuid\":\"a79a5f13-8b04-46c2-9830-83e21b9ad6b2\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:36;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1688814488, 1688814488),
(82, 'default', '{\"uuid\":\"9ebcdfeb-df26-4fa6-9c73-0a98c8baed0d\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:37;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1688819204, 1688819204),
(83, 'default', '{\"uuid\":\"fbdadd51-6f87-44b6-b73b-90ba42b44971\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:41;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1689436324, 1689436324),
(84, 'default', '{\"uuid\":\"f35c4b19-b89e-40a8-beb9-4f140daf801e\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:42;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1689469589, 1689469589),
(85, 'default', '{\"uuid\":\"c6d5aec0-4941-40ed-bb38-fb352ceff850\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:43;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1689938299, 1689938299),
(86, 'default', '{\"uuid\":\"bd529902-d028-4ae8-8e02-bdce1df1c149\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:44;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1689938365, 1689938365),
(87, 'default', '{\"uuid\":\"54a0eb0b-ba96-4240-af96-d4b3a88416c0\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:45;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1689947310, 1689947310),
(88, 'default', '{\"uuid\":\"352736a8-cec3-478a-92e9-4dc959efa441\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:46;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1689947690, 1689947690),
(89, 'default', '{\"uuid\":\"84b68e72-39de-4414-9f1f-e347fd037f52\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:47;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1690011055, 1690011055),
(90, 'default', '{\"uuid\":\"19a8be76-8829-4d11-9c2d-39691d8233b6\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:48;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1690011317, 1690011317),
(91, 'default', '{\"uuid\":\"9c93c5a9-be45-4a5a-8f12-77a279c0a109\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:49;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1690011528, 1690011528),
(92, 'default', '{\"uuid\":\"c44935a3-f5a7-4eea-86b8-23a05256d93c\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:50;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1690011562, 1690011562),
(93, 'default', '{\"uuid\":\"47ea9974-f632-4fbf-b398-3abb42ebad33\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:51;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1690011585, 1690011585),
(94, 'default', '{\"uuid\":\"021f5e5e-0f33-4091-a58f-bfcc25c74b06\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:52;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1690011646, 1690011646),
(95, 'default', '{\"uuid\":\"dac782a4-0983-4d98-b112-a06621a2e397\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:53;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1690011857, 1690011857),
(96, 'default', '{\"uuid\":\"13683e8f-8f1b-47c2-a570-768457cee203\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:54;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1690012506, 1690012506),
(97, 'default', '{\"uuid\":\"cefbd37b-5efc-47ca-83e4-eba9a190cde3\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:55;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1690027797, 1690027797),
(98, 'default', '{\"uuid\":\"54f2a7c4-86d3-497c-adb6-065febb0f8cd\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:56;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1690728277, 1690728277),
(99, 'default', '{\"uuid\":\"59dec09c-9a69-44bd-9b2d-bff454a2ff36\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:57;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1690814705, 1690814705),
(100, 'default', '{\"uuid\":\"9f5cc759-7248-4d01-9ec6-008fa480d437\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:58;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1690817839, 1690817839),
(101, 'default', '{\"uuid\":\"0cd6eca8-e01f-4406-acc6-e3a69253bbf1\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:59;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1690895283, 1690895283),
(102, 'default', '{\"uuid\":\"11c0a5f9-565c-48f0-a8c5-f41d08e4541c\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:60;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1691064096, 1691064096),
(103, 'default', '{\"uuid\":\"2d239f85-e21e-430e-af6f-375a3e654092\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:61;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1691065277, 1691065277);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(104, 'default', '{\"uuid\":\"ee98696f-865a-4b8e-b222-484f3e8d60e8\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:62;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1691070309, 1691070309),
(105, 'default', '{\"uuid\":\"248c2ac8-5570-4643-86ca-4d656af5a750\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:63;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1691139163, 1691139163),
(106, 'default', '{\"uuid\":\"1d8ab6a4-4903-4ea9-bfef-e473bd0c78c0\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:64;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1691243848, 1691243848),
(107, 'default', '{\"uuid\":\"cb18d600-15e5-49ef-ae69-6641d2158412\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:65;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1691244608, 1691244608),
(108, 'default', '{\"uuid\":\"de7d4f47-cea8-439f-ab14-58eccd824752\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:66;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1691244916, 1691244916),
(109, 'default', '{\"uuid\":\"c81b9e77-f119-4b4e-a069-27098555f3c6\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:67;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1691248988, 1691248988),
(110, 'default', '{\"uuid\":\"6f993894-a9c2-4707-bda7-281a93ae5c2a\",\"displayName\":\"App\\\\Events\\\\OrderPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\OrderPlaced\\\":1:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:68;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1692064777, 1692064777);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2023_03_08_091311_create_categories_table', 1),
(6, '2023_03_08_091421_create_products_table', 1),
(7, '2023_03_08_091509_create_product_attributes_table', 1),
(8, '2023_03_08_091510_create_product_attribute_values_table', 1),
(9, '2023_03_08_091651_create_category_attributes_table', 1),
(10, '2023_03_08_092832_create_category_attribute_values_table', 1),
(11, '2023_03_10_132518_create_product_categories_table', 1),
(12, '2023_03_10_141609_create_product_category_attribute_values_table', 1),
(13, '2023_03_13_080006_create_product_colors_table', 1),
(16, '2023_03_30_135724_create_shopping_cart_table', 1),
(17, '2023_04_05_021659_create_orders_table', 1),
(18, '2023_04_05_022326_create_order_details_table', 1),
(19, '2023_04_21_230841_create_address_table', 1),
(20, '2023_04_25_154656_create_notification_table', 1),
(21, '2023_04_25_213047_create_jobs_table', 1),
(22, '2023_04_27_215514_create_order_tracker_table', 1),
(23, '2023_05_05_081316_create_reviews_table', 1),
(24, '2023_05_05_081334_create_comments_table', 1),
(25, '2023_05_10_163527_create_profiles_table', 1),
(26, '2023_05_11_173950_create_brands_table', 1),
(27, '2023_05_12_152114_create_products_brands_table', 1),
(28, '2023_05_18_194501_create_banners_table', 2),
(29, '2023_05_19_201914_create_admins_table', 3),
(30, '2023_05_19_201930_create_roles_table', 3),
(31, '2023_05_19_202022_create_admins_roles_table', 3),
(32, '2023_05_19_203252_create_post_categories_table', 3),
(33, '2023_05_19_203302_create_posts_table', 3),
(34, '2023_05_27_121452_create_suggestion_table', 4),
(38, '2023_05_31_172858_create_comments_to_reply_table', 5),
(39, '2023_06_04_073928_create_reviews_to_prove_table', 6),
(41, '2023_06_05_184653_create_coupons_table', 7),
(44, '2023_06_20_162701_create_product_group_categories_table', 8),
(45, '2023_06_20_162717_create_product_group_brands_table', 8),
(46, '2023_03_18_150536_create_products_group_table', 9),
(47, '2023_03_18_150654_create_groups_products_link_table', 9),
(49, '2019_12_14_000001_create_personal_access_tokens_table', 10),
(50, '2023_07_20_161005_create_flash_sale_table', 11),
(53, '2023_07_26_205858_create_inventory_table', 12);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notification`
--

CREATE TABLE `notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('read','unread') NOT NULL DEFAULT 'unread',
  `action_title` varchar(50) DEFAULT NULL,
  `action_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `buyer_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`buyer_info`)),
  `note` text DEFAULT NULL,
  `pttt` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `admin_status` tinyint(4) NOT NULL,
  `shipping_fee` bigint(20) NOT NULL,
  `coupons` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`coupons`)),
  `subtotal` bigint(20) NOT NULL,
  `amount_pay` bigint(20) NOT NULL,
  `paid_status` varchar(100) NOT NULL,
  `repay_link` text DEFAULT NULL,
  `canceled_by` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `user_id`, `buyer_info`, `note`, `pttt`, `status`, `admin_status`, `shipping_fee`, `coupons`, `subtotal`, `amount_pay`, `paid_status`, `repay_link`, `canceled_by`) VALUES
(66, '2023-08-05 14:15:16', '2023-08-05 14:57:47', 1, '{\"id\":32,\"user_id\":1,\"full_name\":\"Corona\",\"phone_number\":\"0943111222\",\"city\":\"Thành phố Hồ Chí Minh\",\"district\":\"Quận Bình Tân\",\"village\":\"Phường Bình Trị Đông\",\"address\":\"123 Liên khu 5-10-12\",\"is_defaulted\":\"1\"}', NULL, 'cod', 7, 7, 20000, NULL, 35290001, 35310001, 'Chưa thanh toán', NULL, '0'),
(67, '2023-08-05 15:23:07', '2023-08-05 15:23:38', 1, '{\"id\":32,\"user_id\":1,\"full_name\":\"Corona\",\"phone_number\":\"0943111222\",\"city\":\"Thành phố Hồ Chí Minh\",\"district\":\"Quận Bình Tân\",\"village\":\"Phường Bình Trị Đông\",\"address\":\"123 Liên khu 5-10-12\",\"is_defaulted\":\"1\"}', NULL, 'cod', 7, 7, 20000, NULL, 13490001, 13510001, 'Chưa thanh toán', NULL, '0'),
(68, '2023-08-15 01:59:31', '2023-08-15 01:59:39', 1, '{\"id\":32,\"user_id\":1,\"full_name\":\"Corona\",\"phone_number\":\"0943111222\",\"city\":\"Thành phố Hồ Chí Minh\",\"district\":\"Quận Bình Tân\",\"village\":\"Phường Bình Trị Đông\",\"address\":\"123 Liên khu 5-10-12\",\"is_defaulted\":\"1\"}', NULL, 'cod', 1, 1, 20000, NULL, 8690000, 8710000, 'Chưa thanh toán', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` bigint(20) UNSIGNED NOT NULL,
  `discounted_price` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` text NOT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `discounted_price`, `quantity`, `image`, `color_id`, `version`, `created_at`) VALUES
(58, 66, 8, 10900000, 0, 1, 'images/orders/66/TLqH2jDUIY5SbaSeS7ukdcucVdkioAzVIo2NBJ63.jpg', 51, '64GB', '2023-08-05 14:15:17'),
(59, 66, 8, 10900000, 0, 1, 'images/orders/66/fqBGNRhqpBqMjsk7AMEAfRYxTzenRRritaJv7j4F.jpg', 52, '64GB', '2023-08-05 14:15:17'),
(60, 66, 9, 13490001, 0, 1, 'images/orders/66/zg1vS7ehZ4WffP4Ife90mNuSzfx3WkB5PLJVpORt.jpg', NULL, NULL, '2023-08-05 15:03:54'),
(61, 67, 9, 13490001, 0, 1, 'images/orders/67/zg1vS7ehZ4WffP4Ife90mNuSzfx3WkB5PLJVpORt.jpg', NULL, NULL, '2023-08-05 15:23:09'),
(62, 68, 27, 8990000, 300000, 1, 'images/orders/68/ns2gVUPjXnqZnrYRqHPUS4o2vbWddcosHX9mvapE.jpg', 35, NULL, '2023-08-15 01:59:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_tracker`
--

CREATE TABLE `order_tracker` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_tracker`
--

INSERT INTO `order_tracker` (`id`, `order_id`, `message`, `created_at`) VALUES
(170, 66, 'Đơn hàng đã được đặt thành công', '2023-08-05 14:15:16'),
(171, 66, 'Đơn hàng đã bị hủy', '2023-08-05 14:55:01'),
(172, 66, 'Đơn hàng đã bị hủy', '2023-08-05 14:57:47'),
(173, 67, 'Đơn hàng đã được đặt thành công', '2023-08-05 15:23:09'),
(174, 67, 'Đơn hàng đã bị hủy', '2023-08-05 15:23:38'),
(175, 68, 'Đơn hàng đã được đặt thành công', '2023-08-15 01:59:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(22, 'App\\Models\\User', 1, 'authToken', 'c4e55ce0c1a376ac0ebfce08c957b29920a89211f3e1b3e9d57387aff056cdcf', '[\"*\"]', '2023-08-06 09:37:26', NULL, '2023-08-03 01:08:27', '2023-08-06 09:37:26'),
(35, 'App\\Models\\User', 1, 'authToken', '81b006d25334b1445dd3f57a1ba3c06e23bbcb783185883ca5a2d7a81da8fcc5', '[\"*\"]', '2023-08-16 02:34:29', NULL, '2023-08-15 01:56:33', '2023-08-16 02:34:29'),
(37, 'App\\Models\\Admin', 23, 'authToken', '7e55a42c5ad2f77a758fa5d99ec8386f7dbaff7f9e4e6889d72c2c40ace19b7d', '[\"*\"]', '2023-08-16 03:43:29', NULL, '2023-08-16 03:40:33', '2023-08-16 03:43:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `content` longtext NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `post_category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `post_thumbnail` varchar(255) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`images`)),
  `view` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `description`, `content`, `author_id`, `product_id`, `post_category_id`, `created_at`, `updated_at`, `post_thumbnail`, `images`, `view`) VALUES
(8, 'Tại sao điện thoại OPPO tự phóng to màn hình? Khắc phục thế nào?', 'dien-thoai-oppo-tu-phong-to-man-hinh', 'Điện thoại OPPO tự phóng to màn hình làm gián đoạn trải nghiệm và khiến bạn cảm thấy vô cùng khó chịu. Tham khảo bài viết dưới đây của FPT Shop để biết cách khắc phục tình trạng này.', '<h2>Nguyên nhân điện thoại tự phóng to màn hình</h2><p>Điện thoại OPPO của bạn tự phóng to màn hình có thể do một trong những nguyên nhân sau:&nbsp;</p><ul><li>Chế độ tự phóng to, thu nhỏ trên điện thoại OPPO đang được mở: Trong quá trình thiết lập các cài đặt, bạn đã vô tình bật chế độ tự thu phóng màn hình trên điện thoại OPPO. Điều này dẫn tới tình trạng khi bạn chạm vào màn hình thì nó sẽ tự phóng to.&nbsp;</li></ul><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159082/Originals/dien-thoai-oppo-tu-phong-to-man-hinh-1.jpg\" alt=\"Tại sao điện thoại OPPO tự phóng to màn hình (Ảnh 1)\"></figure><ul><li>Chế độ dùng một tay trên thiết bị đang được bật: Khi bạn bật chế độ này sẽ khiến điện thoại thường xuyên bị phóng to màn hình.&nbsp;</li><li>Phần mềm trong máy đang bị xung đột nhau: Xung đột phần mềm là tình trạng 2 hoặc nhiều ứng dụng không thể chạy cùng lúc trên thiết bị. Nó gây ra rất nhiều lỗi khi sử dụng smartphone trong đó có lỗi OPPO tự phóng to màn hình.</li></ul><p><i>Xem thêm</i>: <a href=\"http://localhost:3000/tin-tuc\">Cách khắc phục tình trạng điện thoại OPPO bị lỗi ColorOS Recovery đơn giản vậy sao?</a></p><h2><strong>Cách khắc phục điện thoại OPPO tự phóng to màn hình</strong></h2><h3><strong>1. Tắt chế độ thu phóng màn hình</strong></h3><p>Nếu nguyên nhân là do chế độ thu phóng màn hình đang được bật thì bạn hãy tắt nó đi theo hướng dẫn sau:&nbsp;</p><p><strong>Bước 1</strong>: Vào mục <i><strong>Cài đặt</strong></i> trên OPPO &gt; Chọn mục<i><strong> Cài đặt bổ sung</strong></i>.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159082/Originals/dien-thoai-oppo-tu-phong-to-man-hinh-2.jpg\" alt=\"Tại sao điện thoại OPPO tự phóng to màn hình (Ảnh 2)\"></figure><p><strong>Bước 2</strong>: Chọn <i><strong>Khả năng truy cập</strong></i> &gt; Chọn mục <i><strong>Thao tác thu phóng</strong></i> &gt; Gạt nút sang trái để tắt chế độ thu phóng màn hình.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159082/Originals/dien-thoai-oppo-tu-phong-to-man-hinh-3.jpg\" alt=\"Tại sao điện thoại OPPO tự phóng to màn hình (Ảnh 3)\"></figure><h3><strong>2. Tắt chế độ thao tác một tay</strong></h3><p>Nếu nguyên nhân không phải do chế độ thu phóng màn hình thì hãy kiểm tra xem chế độ thao tác một tay đang ở trạng thái bật hay tắt. Nếu đang bật, hãy tắt nó đi theo hướng dẫn sau:</p><p><strong>Bước 1</strong>: Truy cập mục <i><strong>Cài đặt </strong></i>trên điện thoại &gt; Chọn mục <i><strong>Cử chỉ &amp; Chuyển động</strong></i>.</p><p><strong>Bước 2</strong>: Chọn <i><strong>Cử chỉ bật màn hình</strong></i> &gt; Tại mục <i><strong>Thao tác một tay</strong></i>, bạn gạt sang trái để tắt chế độ này đi.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159082/Originals/dien-thoai-oppo-tu-phong-to-man-hinh-4.jpg\" alt=\"Tại sao điện thoại OPPO tự phóng to màn hình (Ảnh 4)\"></figure><h3><strong>3. Khởi động lại máy</strong></h3><p>Nếu như sau khi đã kiểm tra 2 chế độ bên trên nhưng tình trạng màn hình OPPO tự phóng to vẫn chưa được khắc phục thì có thể các phần mềm trong máy đang xuất hiện xung đột. Lúc này, giải pháp dễ dàng nhất là hãy thử khởi động lại điện thoại OPPO.&nbsp;</p><p>Với những dòng điện thoại được thiết kế pin rời thì bạn chỉ cần tháo pin ra sau đó lắp vào là máy sẽ được khởi động lại. Với những điện thoại OPPO có pin tích hợp bên trong không thể tháo ra thì bạn sẽ sử dụng các phím bấm cứng.&nbsp;</p><p>Tùy thuộc vào phiên bản hệ điều hành mà người dùng có thể sử dụng tổ hợp phím: <i><strong>Nguồn + Tăng âm lượng </strong></i>hoặc <i><strong>Nguồn + Giảm âm lượng</strong></i>.&nbsp;</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159082/Originals/dien-thoai-oppo-tu-phong-to-man-hinh-5.jpg\" alt=\"Tại sao điện thoại OPPO tự phóng to màn hình (Ảnh 5)\"></figure><p><i>Xem thêm</i>: <a href=\"http://localhost:3000/tin-tuc\">Quên mật khẩu điện thoại OPPO phải làm sao để mở được máy?</a></p><h3><strong>4. Khôi phục cài đặt gốc</strong></h3><p><a href=\"https://fptshop.com.vn/tin-tuc/thu-thuat/cach-reset-oppo-156707\">Khôi phục cài đặt gốc</a> là việc bạn đưa máy về chế độ nhà sản xuất, nghĩa là tình trạng ban đầu như khi chưa có sự tác động của người dùng. Điều này cũng đồng nghĩa rằng mọi dữ liệu và cài đặt hiện có trên máy sẽ bị xóa hết. Do đó, cần suy nghĩ kỹ trước khi tiến hành và sao lưu những dữ liệu quan trọng nếu cần. Cách này chỉ nên thực hiện khi những giải pháp bên trên đều không có tác dụng.&nbsp;</p><ul><li><strong>Khôi phục cài đặt gốc từ phần Cài đặt</strong>:</li></ul><p><strong>Bước 1</strong>: Truy cập mục<i><strong> Cài đặt</strong></i> &gt; Chọn <i><strong>Cài đặt bổ sung</strong></i>.</p><p><strong>Bước 2</strong>: Chọn <i><strong>Sao lưu và đặt lại</strong></i> &gt; <i><strong>Đặt lại về cài đặt gốc</strong></i>.</p><p><strong>Bước 3</strong>: Chọn<i><strong> Xóa toàn bộ dữ liệu</strong></i> &gt; <i><strong>Xóa dữ liệu </strong></i>để xác nhận.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159082/Originals/dien-thoai-oppo-tu-phong-to-man-hinh-6.jpg\" alt=\"Tại sao điện thoại OPPO tự phóng to màn hình (Ảnh 6)\"></figure><ul><li><strong>Khôi phục cài đặt gốc bằng Hard reset (sử dụng phím cứng)</strong>:</li></ul><p><strong>Bước 1</strong>: Ấn giữ <i><strong>nút Nguồn </strong></i>để tắt nguồn điện thoại.</p><p><strong>Bước 2</strong>: Ấn giữ đồng thời <i><strong>nút Nguồn</strong></i> và<i><strong> nút Giảm âm lượng</strong></i> &gt; Chọn ngôn ngữ Tiếng Anh (English) hoặc 1 trong 2 ngôn ngữ tiếng Trung còn lại, miễn sao bạn có thể hiểu.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159082/Originals/dien-thoai-oppo-tu-phong-to-man-hinh-7.jpg\" alt=\"Tại sao điện thoại OPPO tự phóng to màn hình (Ảnh 7)\"></figure><p><strong>Bước 3</strong>: Chọn <i><strong>Wipe data</strong></i> &gt; Chọn <i><strong>Wipe all data and removable application </strong></i>để xóa tất cả dữ liệu &gt; <i><strong>OK</strong></i>.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159082/Originals/dien-thoai-oppo-tu-phong-to-man-hinh-8.jpg\" alt=\"Tại sao điện thoại OPPO tự phóng to màn hình (Ảnh 8)\"></figure><p><strong>Bước 4</strong>: Nhấn <i><strong>Reboot </strong></i>để khởi động lại điện thoại.</p><p>Bài viết đã chỉ ra nguyên nhân và hướng dẫn các cách khắc phục tình trạng điện thoại OPPO tự phóng to màn hình. Hy vọng những chia sẻ này sẽ có ích với bạn.</p>', 1, NULL, 1, '2023-07-05 10:37:07', '2023-07-16 10:58:03', 'images/post_thumbnails/WsqEyteKGzW70SdJCzsdJgLZ7RFY8fjFMfJHAidO.jpg', '[]', 11),
(10, 'Mách bạn cách khóa ví QR Zalo để đảm bảo độ bảo mật và dễ dàng sử dụng khi cần', 'mach-ban-cach-khoa-vi-qr-zalo', 'Ví QR Zalo ra đời mang đến cho người dùng những trải nghiệm cực tiện lợi. Bạn có thể lưu trữ các loại thẻ của mình nhưng bạn nên cần khóa ví này để đảm bảo an toàn khi không cần sử dụng.', '<p>Việc thanh toán trực tuyến hay xuất trình giấy tờ khi di chuyển hiện đã có thể lưu thông tin ngay trên ví QR Zalo. Tại đây, bạn chỉ cần quét QR thông tin cần lưu để tiện sử dụng. Tuy nhiên, vì mọi thông tin của bạn đều được lưu tại đây nên việc tăng cường bảo mật cho ví QR Zalo là điều cần thiết. Tham khảo ngay cách khóa ví QR Zalo khi không sử dụng ở bài hướng dẫn dưới đây.&nbsp;</p><h2><strong>Cách khóa ví QR Zalo để đảm bảo bảo mật</strong></h2><p><strong>Bước 1:</strong> Bạn truy cập vào ứng dụng Zalo trên điện thoại, sau đó chọn mục <i><strong>Cá nhân </strong></i>ở thanh công cụ bên dưới. Tiếp đến, chọn mục <i><strong>Ví QR</strong></i>.&nbsp;</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159542/Originals/khoa-vi-qr-zalo-1.jpg\" alt=\"Cách khóa ví QR Zalo để đảm bảo bảo mật 1\"></figure><p><strong>Bước 2:</strong> Lúc này Zalo sẽ chuyển sang mục Mini App của Ví QR, những thẻ mà bạn đã thêm vào đó sẽ hiện ra. Bạn chọn mục <i><strong>Cài đặt </strong></i>ở góc dưới bên phải và bật tính năng <i><strong>Khóa ví QR bằng mã PIN </strong></i>lên.&nbsp;</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159542/Originals/khoa-vi-qr-zalo-2.jpg\" alt=\"Cách khóa ví QR Zalo để đảm bảo bảo mật 2\"></figure><p><strong>Bước 3:</strong> Tiến hành <i><strong>nhập mã PIN có 4 chữ số </strong></i>và hãy ghi nhớ <a href=\"https://fptshop.com.vn/tin-tuc/danh-gia/ma-pin-tren-thiet-bi-di-dong-la-gi-132382\">mã PIN</a> này để sau này có thể dùng nó để mở khóa. Sau khi thiết lập hoàn tất, bạn cũng nên bật lên mục <i><strong>Xác thực vân tay hoặc khuôn mặt </strong></i>để khóa ví và mở khóa nhanh hơn.&nbsp;</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159542/Originals/khoa-vi-qr-zalo-3.jpg\" alt=\"Cách khóa ví QR Zalo để đảm bảo bảo mật 3\"></figure><p>Như vậy chỉ với 3 bước cực đơn giản trên đây, bạn đã có thể khóa ví QR Zalo của mình một cách dễ dàng. Hy vọng bạn sẽ có những trải nghiệm thú vị và an toàn, FPT Shop chúc bạn thực hiện thành công.</p>', 1, NULL, 1, '2023-07-06 13:29:59', '2023-07-09 09:04:57', 'images/post_thumbnails/kkLxEabQHuOVZhw0pbYMYqOlNmb0aW8IG4whHZAi.webp', '[]', 5),
(11, 'Chặn nội dung nhạy cảm trên iOS 17, các phụ huynh cần xem ngay', 'chan-noi-dung-nhay-cam-tren-ios-17', 'Trong bài này, các bạn hãy cùng FPTShop tìm hiểu cách sử dụng tính năng cảnh báo nội dung nhạy cảm mới trên iOS 17, được thiết kế để tăng cường bảo vệ người dùng.', '<p>Với mỗi một bản cập nhật iOS mới, Apple luôn có xu hướng tăng cường tính năng bảo mật và trên iOS 17 cũng không ngoại lệ. Dựa trên tính năng Communications Safety (An toàn liên lạc) được giới thiệu trên iOS 16, Apple hiện đã mở rộng tính năng bảo vệ này trên toàn bộ hệ thống.</p><p>Sensitive Content Warnings (Cảnh báo nội dung nhạy cảm) là một bổ sung mới trong công cụ bảo vệ người dùng, tính năng này sẽ giúp ngăn người dùng xem các hình ảnh nhạy cảm khỏa thân không mong muốn.&nbsp;Hơn nữa, tất cả quá trình xử lý dữ liệu diễn ra trên thiết bị, có nghĩa là dữ liệu không bao giờ rời khỏi điện thoại của bạn. Điều này cũng đồng bộ với cách tiếp cận dựa trên quyền riêng tư của Apple.</p><h2><strong>Sensitive Content Warning là gì?</strong></h2><p>Sensitive Content Warning (Cảnh báo nội dung nhạy cảm) là phần mở rộng của tính năng bảo mật Communications Safety (An toàn liên lạc) được thiết kế để giúp ngăn chặn người dùng xem các nội dung nhạy cảm, bao gồm ảnh khoả thân trong hình ảnh và video trên iPhone của người dùng.&nbsp;Theo đó khi bạn nhận được nội dung nhạy cảm thông qua một trong các ứng dụng được hỗ trợ, nội dung đó sẽ được xử lý cục bộ để kiểm tra nội dung khi tính năng này được bật.</p><p>Thực tế tính năng Communications Safety (An toàn liên lạc) đã được giới thiệu trên iOS 16, giúp trẻ em chia sẻ dữ liệu media gồm video hoặc hình ảnh một cách an toàn, đồng thời cũng ngăn trẻ em xem những hình ảnh không mong muốn trên iMessage.&nbsp;</p><p>Nhưng với bản cập nhật iOS 17, phạm vi bảo vệ người dùng khỏi những nội dung nhạy cảm đã được mở rộng sang các ứng dụng khác gồm AirDrop, FaceTime, Messages, Photo Picker và thậm chí cả Contact Posters.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159131/Originals/Sensitive-content-warning-on-iphone-in-ios-17-8.jpg\" alt=\"Chặn nội dung nhạy cảm trên iOS 17, các phụ huynh cần xem ngay (1)\"></figure><p>Khi tính năng Sensitive Content Warning (Cảnh báo nội dung nhạy cảm) được kích hoạt trên iPhone chạy iOS 17, nếu thấy nội dung nhạy cảm thì ngay lập tức nội dung đó sẽ bị làm mờ hoặc ẩn đi và lần sau khi bạn cố truy cập vào nội dung đó, bạn sẽ nhận được cảnh báo. Trang cảnh báo sẽ trông giống như trang được hiển thị ở trên, đồng thời bạn cũng sẽ được cung cấp ba lựa chọn gồm:</p><ul><li><i><strong>Không phải bây giờ (Not Now)</strong></i>: Thao tác này sẽ giữ nội dung nhạy cảm bị ẩn cho đến lần tiếp theo bạn đồng ý xem nội dung đó.</li><li><strong>Cách để nhận trợ giúp (Ways to Get Help)</strong>: Tùy chọn này sẽ chuyển hướng đến các tài nguyên và liên kết mà bạn có thể sử dụng để nhận trợ giúp nếu hình ảnh và video nhạy cảm đã được chia sẻ với bạn trái với sự đồng ý của bạn.</li><li><i><strong>Tôi chắc chắn (I’m Sure)</strong></i>: Tùy chọn này cho phép iOS sự cần thiết để nội dung nhạy cảm là hình ảnh hoặc video có thể dễ dàng hiển thị với bạn.</li></ul><p>Theo Apple, ngoài các ứng dụng của hãng hỗ trợ Sensitive Content Warning, tính năng bảo mật này cũng sẽ hỗ trợ các ứng dụng bên thứ ba khác truy cập và tích hợp tính năng này. Điều đó sẽ cho phép người dùng cảm thấy an toàn không chỉ trên các ứng dụng của Apple khi họ sử dụng mà còn trên mọi ứng dụng/nền tảng mà họ đang sử dụng.</p><p>Tại thời điểm viết bài này, Apple chỉ đề cập rằng tính năng bảo mật Sensitive Content Warning sẽ làm mờ ảnh khoả thân mà không có đề cập đến nội dung máu me. Tuy nhiên, điều đó cũng sẽ bị kiểm duyệt khi hệ điều hành được phát hành chính thức vào mùa thu năm nay.</p><h2><strong>Cách bật Sensitive Content Warning trên iOS 17</strong></h2><p>Sau khi đã hiểu rõ về tính năng Sensitive Content Warning, dưới đây sẽ là cách bạn có thể bật và sử dụng tính năng này trên iPhone của mình để không chỉ bảo vệ trẻ nhỏ khi sử dụng iPhone.</p><p>Lưu ý: Đây là một tính năng mới được giới thiệu trên iOS 17. Vì vậy, nếu bạn chưa cập nhật iPhone của mình lên phiên bản mới nhất thì truy cập ứng dụng <i><strong>Cài đặt (Settings) &gt; Cài đặt chung (General) &gt; Cập nhật phần mềm (Software Update)</strong></i>.</p><p>Dưới đây là chi tiết các bước để bật tính năng Sensitive Content Warning trên iOS 17&nbsp;</p><p><strong>Bước 1: </strong>Trước tiên, hãy truy cập ứng dụng <i><strong>Cài đặt (Settings) </strong></i>từ màn hình chính hoặc thư viện ứng dụng.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159131/Originals/Sensitive-content-warning-on-iphone-in-ios-17-1.jpg\" alt=\"Chặn nội dung nhạy cảm trên iOS 17, các phụ huynh cần xem ngay (2)\"></figure><p><strong>Bước 2: </strong>Tiếp theo, nhấn tùy chọn <i><strong>Quyền riêng tư &amp; Bảo mật (Privacy &amp; Security)</strong></i> để tiếp tục.</p><p><strong>Bước 3: </strong>Di chuyển xuống phía dưới và nhấn chọn mục <i><strong>Cảnh báo nội dung nhạy cảm (Sensitive Content Warning)</strong></i>.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159131/Originals/Sensitive-content-warning-on-iphone-in-ios-17-2.jpg\" alt=\"Chặn nội dung nhạy cảm trên iOS 17, các phụ huynh cần xem ngay (3)\"></figure><p><strong>Bước 4: </strong>Sang màn hình mới, bạn chỉ cần chạm vào nút bật/tắt ở phía bên phải của tùy chọn <i><strong>Cảnh báo nội dung nhạy cảm (Sensitive Content Warning)</strong></i>. Khi được bật, nút này sẽ hiển thị màu xanh.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159131/Originals/Sensitive-content-warning-on-iphone-in-ios-17-4.jpg\" alt=\"Chặn nội dung nhạy cảm trên iOS 17, các phụ huynh cần xem ngay (4)\"></figure><p>Sau khi bật tính năng này, các ứng dụng hiện hỗ trợ tính năng này sẽ được liệt kê trên màn hình. Bạn có thể chuyển đổi chúng thành bật (màu xanh) hoặc tắt (màu xám) theo ý muốn. Bạn cũng có thể gửi ẩn danh dữ liệu và phân tích tùy chọn tới Apple để giúp họ cải thiện tính năng này bằng cách nhấp vào nút bên phải mục <i><strong>Cải thiện cảnh báo nội dung nhạy cảm (Improve Sensitive Content Warning)</strong></i>.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159131/Originals/Sensitive-content-warning-on-iphone-in-ios-17-4.jpg\" alt=\"Chặn nội dung nhạy cảm trên iOS 17, các phụ huynh cần xem ngay (5)\"></figure><p>Sau khi bạn đã bật tính năng <i>Cảnh báo nội dung nhạy cảm (Sensitive Content Warning)</i>, tất cả hình ảnh/video khiêu dâm gửi cho bạn sẽ bị làm mờ. Hơn nữa, vì tính năng này xử lý hoàn toàn mọi thứ trên thiết bị nên người gửi không cần phải sử dụng iOS 17.&nbsp;Dưới đây là ví dụ về cách một tin nhắn chứa hình ảnh nhạy cảm/khiêu dâm sẽ xuất hiện trong ứng dụng tin nhắn.&nbsp;</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159131/Originals/Sensitive-content-warning-on-iphone-in-ios-17-5.jpg\" alt=\"Chặn nội dung nhạy cảm trên iOS 17, các phụ huynh cần xem ngay (6)\"></figure><p>Nếu bạn muốn chặn liên hệ này hoặc nhận trợ giúp, hãy nhấn vào biểu tượng dấu chấm than ở góc trên bên phải, sau đó nhấn vào hành động bạn muốn thực hiện. Nếu chọn <i><strong>Chặn số liên lạc (Block Contact)</strong></i>, họ sẽ không thể nhắn tin/gọi điện cho bạn được.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159131/Originals/Sensitive-content-warning-on-iphone-in-ios-17-6.jpg\" alt=\"Chặn nội dung nhạy cảm trên iOS 17, các phụ huynh cần xem ngay (7)\"></figure><p>Trong trường hợp bạn cần sử dụng hình ảnh này, hãy nhấn vào nút<i><strong> Hiển thị (Show)</strong></i> ở phía dưới để đồng ý xem nội dung đó.&nbsp;</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159131/Originals/Sensitive-content-warning-on-iphone-in-ios-17-7.jpg\" alt=\"Chặn nội dung nhạy cảm trên iOS 17, các phụ huynh cần xem ngay (8)\"></figure><p>Điện thoại ngày nay đã trở thành thiết bị chính để chia sẻ nội dung. Và những bức ảnh khiêu dâm không mong muốn đã và đang gây rất nhiều phiền toái cho người dùng, đặc biệt có ảnh hưởng xấu tới trẻ em. Vì vậy việc Apple tăng cường chức năng bảo mật với tính năng Sensitive Content Warning trên iOS 17 là rất cần thiết.&nbsp;</p><p>Trên đây FPT Shop vừa cùng các bạn làm quen với tính năng Sensitive Content Warning mới trên iOS 17 và cách bạn có thể sử dụng tính năng này để bảo vệ chính mình cũng như trẻ nhỏ.&nbsp;</p>', 1, NULL, 1, '2023-07-06 13:34:08', '2023-07-07 09:37:57', 'images/post_thumbnails/bzciYl4GZy4AAf2d88b2TQnR3WmZajMb8033vXTb.webp', '[]', 5),
(12, 'Cách khắc phục hiệu quả tình trạng không đăng nhập được tài khoản TikTok cực dễ', 'cach-khac-phuc-khong-dang-nhap-duoc-tiktok', 'Nếu bạn là một người dùng TikTok và đặc biệt là một TikToker có sức ảnh hưởng thì lỗi không đăng nhập được tài khoản của mình vào ứng dụng là điều không thì chập nhận được. Bạn đã thử nhiều cách nhưng vẫn chưa khắc phục được lỗi này thì hãy thử tham khảo 4 cách mà FPT Shop chia sẻ dưới đây nhé.', '<p>Bạn đang gặp phải tình trạng không đăng nhập được tài khoản của mình trên <a href=\"https://fptshop.com.vn/tin-tuc/danh-gia/tiktok-la-gi-day-la-nhung-thong-tin-ban-can-biet-138681\">TikTok</a> và bạn đang cảm thấy khó chịu. Đừng quá lo lắng, bài viết bên dưới FPTShop sẽ chia sẻ bạn cách khắc phục tình trạng này siêu nhanh và đơn giản, cùng theo dõi nhé!&nbsp;</p><h2><strong>Cách khắc phục lỗi đăng nhập trên TikTok</strong></h2><h2><strong>Cập nhật ứng dụng TikTok</strong></h2><p>Một trong những nguyên nhân phổ biến gây ra tình trạng lỗi trên TikTok đó là quá lâu rồi bạn chưa cập nhật ứng dụng lên phiên bản mới. Chính vì vậy mà bạn nên kiểm tra và cập nhật lên phiên bản mới nhất để tránh được các tình trạng lỗi vặt nhé.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159539/Originals/loi-dang-nhap-tiktok-3.jpg\" alt=\"Cách khắc phục lỗi đăng nhập trên TikTok 1\"></figure><h3><strong>Đăng nhập bằng một tài khoản khác</strong></h3><p>Ứng dụng TikTok hỗ trợ người dùng đăng nhập vào hệ thống bằng nhiều hình thức khác nhau như: Facebook, Google, Twitter,...Bạn hãy thử đăng nhập bằng một hình thức khác xem sao nhé.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159539/Originals/loi-dang-nhap-tiktok-2.jpg\" alt=\"Cách khắc phục lỗi đăng nhập trên TikTok 2\"></figure><h3><strong>Kiểm tra đường truyền mạng</strong></h3><p>Nếu bạn thử 2 cách trên mà vẫn chưa được thì rất có thể do đường truyền mạng mà bạn đang sử dụng có vấn đề. Bạn có thể kiểm tra bằng cách tắt wifi và đổi sang dữ liệu di động hoặc ngược lại để kiểm tra nhé.</p><h3><strong>Khởi động lại thiết bị</strong></h3><p>Một trong những cách đơn giản nhưng mang lại hiệu quả cao đó là khởi động lại thiết bị. Việc khởi động lại điện thoại giúp cải thiện tốc độ xử lý của hệ điều hành, khắc phục một số lỗi thông thường ở ứng dụng điện thoại.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159539/Originals/loi-dang-nhap-tiktok-1.jpg\" alt=\"Cách khắc phục lỗi đăng nhập trên TikTok 3\"></figure><p>Trên đây là 4 cách đơn giản để khắc phục lỗi không đăng nhập được TikTok mà ai cũng có thể thực hiện được. Hãy lưu lại và thực hiện thử nhé, chúc các bạn thực hiện thành công!</p>', 1, NULL, 1, '2023-07-06 13:54:47', '2023-07-15 16:05:28', 'images/post_thumbnails/6OkGe5EXYEgep3QdJKheOZZVjxF6BjW8IAGvRg5E.webp', '[]', 5),
(13, 'Chia sẻ cách chuyển văn bản thành giọng nói trên iPhone vô cùng đơn giản mà không cần dùng app', 'chia-se-cach-chuyen-van-ban-thanh-giong-noi-tren-iphone', 'Đôi lúc việc chuyển đổi văn bản thành giọng nói vô cùng cần thiết trong đời sống hằng ngày, công việc hay học tập của bạn. Vì vậy đừng bỏ lỡ bài viết dưới đây nhé, FPT Shop sẽ chia sẻ bạn cách chuyển đổi văn bản thành giọng nói trên iPhone mà ai cũng có thể thực hiện được.', '<p>Do nhu cầu của người dùng tăng cao nên hiện nay có rất nhiều ứng dụng ra đời nhằm phục vụ người dùng chuyển đổi văn bản thành giọng nói. Tuy nhiên nhiều người dùng vẫn chưa biết một trong những cách đơn giản có thể chuyển đổi mà trực tiếp ngay trên chiếc iPhone mà không cần tải thêm app nào. Cùng theo dõi bài viết bên dưới để biết cách thực hiện nhé!</p><h2><strong>Cách chuyển văn bản thành giọng nói trên iPhone</strong></h2><p><strong>Bước 1: </strong>Bạn nhấn chọn vào đường link Phím tắt Turn Text To Audio &gt; Nhấn chọn <i><strong>Thêm phím tắt</strong></i>. Lúc này bạn có thể sử dụng phím tắt Turn Text To Audio bất cứ khi nào có nhu cầu.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159511/Originals/chuyen-van-ban-thanh-giong-noi-iphone-1.jpeg\" alt=\"Cách chuyển văn bản thành giọng nói trên iPhone 1\"></figure><p><strong>Bước 2: </strong>Nhấn chọn vào <i><strong>phím tắt Turn Text To Audio</strong></i> vừa được thêm &gt; Bạn <i><strong>nhập văn bản</strong></i> ở phía ô trên cùng &gt; Nhấn <i><strong>Xong</strong></i>. Đợi giây lát hệ thống sẽ tự động chuyển đổi và trả kết quả cho bạn. Bấm để nghe thử nhé.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/uploads/images/tin-tuc/159511/Originals/chuyen-van-ban-thanh-giong-noi-iphone-2.jpeg\" alt=\"Cách chuyển văn bản thành giọng nói trên iPhone 2\"></figure><p>Trên đây là 2 bước cực đơn giản giúp bạn có thể chuyển đổi từ văn bản thành giọng nói vô cùng thú vị. Hãy lưu lại và thực hiện khi cần thiết nhé. Chúc các bạn thành công!</p>', 1, NULL, 1, '2023-07-06 14:00:21', '2023-07-16 01:32:36', 'images/post_thumbnails/er1cOvsrsVpN82rCsANTPJ0I4ZIbcN0Ls3HQzLHY.webp', '[]', 14);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_categories`
--

INSERT INTO `post_categories` (`id`, `name`, `slug`) VALUES
(1, 'Thủ thuật', 'thu-thuat'),
(3, 'Đánh giá', 'danh-gia'),
(4, 'Khám phá', 'kham-pha'),
(5, 'Game', 'game');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `price` bigint(20) UNSIGNED NOT NULL,
  `discounted_price` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` longtext NOT NULL DEFAULT '',
  `description_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`description_images`)),
  `specification` longtext NOT NULL DEFAULT '',
  `dir` varchar(255) NOT NULL,
  `home_display` tinyint(1) NOT NULL DEFAULT 0,
  `sold` int(11) NOT NULL DEFAULT 0,
  `search_click` int(11) NOT NULL DEFAULT 0,
  `view` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `price`, `discounted_price`, `image`, `description`, `description_images`, `specification`, `dir`, `home_display`, `sold`, `search_click`, `view`) VALUES
(8, 'iPhone 11 64GB', 'iPhone-11-64GB', 10900000, 0, 'images/products/1680194093/iPpXMYzX5AvoUn2avvK64hO6YYHvnWObadeI7zKx.jpg', '<h2>Ưu điểm nổi trội của iPhone 11 so với smartphone khác</h2>', '[]', '[{\"id\":\"0d440796-5fb0-38d8-9fdd-51ada176b713\",\"title\":\"Màn hình\",\"technical_infos\":[{\"id\":\"d30df4ea-4c26-bfe9-03f8-ea154652f217\",\"technical_info\":\"Kích thước màn hình\",\"technical_content\":\"6.1 inches\"},{\"id\":\"3e8869f2-5c52-102b-ef73-0b273d975230\",\"technical_info\":\"Công nghệ màn hình\",\"technical_content\":\"IPS LCD\"}]},{\"id\":\"5b2012a2-7b88-f5c9-0666-a7d19b1180b6\",\"title\":\"Camera sau\",\"technical_infos\":[{\"id\":\"a19cb80d-8a26-d935-258a-0426ae9149eb\",\"technical_info\":\"Camera sau\",\"technical_content\":\"Camera kép 12MP:\\n- Camera góc rộng: ƒ/1.8 aperture\\n- Camera siêu rộng: ƒ/2.4 aperture\"},{\"id\":\"7121e683-cdf3-e0a1-ef55-bee33da0cfd9\",\"technical_info\":\"Tính năng camera\",\"technical_content\":\"Retina Flash\\nNhãn dán (AR Stickers)\\nBan đêm (Night Mode)\\nChạm lấy nét\\nGóc rộng (Wide)\\nGóc siêu rộng (Ultrawide) HDR Nhận diện khuôn mặt\\nQuay chậm (Slow Motion)\\nToàn cảnh (Panorama)\\nTrôi nhanh thời gian (Time L\"}]},{\"id\":\"477dbb56-604d-9844-875b-46ee61b398b0\",\"title\":\"Vi xử lý & đồ họa\",\"technical_infos\":[{\"id\":\"9c5bb5c3-f315-80ae-62ca-fefbca55492e\",\"technical_info\":\"Chipset\",\"technical_content\":\"A13 Bionic\"},{\"id\":\"3627429c-3baa-cc1d-f372-4b0f7f32d2b8\",\"technical_info\":\"Loại CPU\",\"technical_content\":\"Hexa-core\"}]}]', '1680194093', 1, 2, 4, 117),
(9, 'Laptop Dell Inspiron 3511 5829BLK', 'laptop-dell-inspiron-3511-5829blk', 13490001, 0, 'images/products/1680194776/zg1vS7ehZ4WffP4Ife90mNuSzfx3WkB5PLJVpORt.jpg', '<p>abc</p>', '[]', '[]', '1680194776', 1, 0, 0, 8),
(10, 'OPPO Reno8 T 5G 128GB', 'oppo-reno8-t-5g-128gb', 9990000, 1000000, 'images/products/1680510068/k1R2v0CLcOzXF1McMuuKlKY4LVAXWIFoFg23xXrw.jpg', '<p>abc</p>', '[]', '[]', '1680510068', 1, 0, 1, 2),
(11, 'Samsung Galaxy S23 Ultra 5G 256GB', 'samsung-galaxy-s23-ultra-5g-256gb', 24990000, 0, 'images/products/1680516110/VGeRXrAdHLbQ7V6msvp0nmqXhvJqyeDQFtxHeLqq.jpg', '<p>abc</p>', '[]', '[]', '1680516110', 1, 0, 0, 4),
(13, 'Laptop Asus Gaming Rog Strix G15 G513IH HN015W', 'laptop-asus-gaming-rog-strix-g15-g513ih-hn015w', 23990000, 2000000, 'images/products/1680941385/2dH7agECc4ALbVzoqVJWhHDpEux3sbLGIcifQslF.png', '<h2><strong>Laptop Asus gaming Rog Strix G15 G513IH-HN015W - Cấu hình mạnh mẽ chiến game</strong></h2><p>Asus ROG Strix G15 G513IH-HN015TW là chiếc laptop có cấu hình mạnh mẽ, đáp ứng được hầu hết các tựa game trên thị trường hiện nay. Ngay cả khi hoạt động trong nhiều giờ liền máy vẫn khá mát mẻ do có hệ thống tản nhiệt cao cấp. Nếu bạn là một game thủ hay người dùng muốn tìm máy có cấu hình cao thì đừng bỏ qua chiếc laptop Asus chất lượng này.</p><h3><strong>Thiết kế mạnh mẽ</strong></h3><p><a href=\"https://cellphones.com.vn/laptop/asus/gaming.html\"><strong>Asus ROG</strong></a> Strix G15 G513IH-HN015TW có ngoại hình vô cùng mạnh mẽ với màu sắc trang nhã. Khung máy có kích thước nhỏ hơn đến 7% so với thế hệ trước giúp bạn có thể chơi bất cứ tựa game nào mà bạn muốn.</p><figure class=\"image\"><img src=\"https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/LAPTOP-ASUS-GAMING-ROG-STRIX-G15-1.jpg\" alt=\"Thiết kế mạnh mẽ\"></figure><p>Những đường cắt hay biểu tượng trên máy cũng được thiết kế tinh tế. Dù đặt ở bất cứ vị trí nào máy cũng cực kỳ thu hút và ấn tượng. Hệ thống đèn chiếu sáng mặt đáy cùng hệ thống Aura Sync nổi bật từ logo kim loại của ROG càng khiến Asus ROG Strix G15 thu hút hơn.</p><h3><strong>Đèn LED RGB tỏa sáng rực rỡ</strong></h3><p>Hệ thống đèn LED nhiều màu sắc&nbsp;của <a href=\"https://cellphones.com.vn/laptop/do-hoa.html\"><strong>laptop đồ họa giá rẻ</strong></a> vừa có khả năng tăng cường độ bảo mật đèn LED vừa tạo nên hiệu ứng ánh sáng nổi bật tại mắt đáy. Mặt lưng được làm bằng chất liệu nhôm cứng cáp cho cảm giác khung máy trở nên bóng bẩy hơn. Phần chiếu nghỉ tay được phủ bằng soft-touch cho cảm giác khá dễ chịu và thoải mái.&nbsp;</p><figure class=\"image\"><img src=\"https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/LAPTOP-ASUS-GAMING-ROG-STRIX-G15-2.jpg\" alt=\"Đèn LED RGB tỏa sáng rực rỡ\"></figure><h3><strong>Hệ thống tản nhiệt tốt</strong></h3><p>Asus ROG Strix G15 G513IH-HN015TW có hệ thống tản nhiệt siêu khủng. Với keo tản nhiệt kim loại lỏng trên CPU máy sở hữu khả năng làm mát vô cùng tuyệt vời. So với phương pháp làm mát truyền thống thì phương pháp này có tính vượt trội hơn nhiều lần.</p><h3><strong>hiến game siêu mượt</strong></h3><p>Khả năng chiến game của Asus ROG Strix G15 G513IH-HN015TW được đánh giá rất xuất sắc. Với màn hình FHD 144Hz cùng Adaptive-Sync giúp loại bỏ hiện tượng xé viền. Không chỉ vậy, nhà sản xuất luôn chú trọng đến trải nghiệm cho người dùng khi thiết kế viền chỉ mỏng 4,5mm ở 3 cạnh. Bạn hoàn toàn tập trung vào những trận chiến mà không bị bất cứ yếu tố nào làm phân tâm.</p><h2><strong>Mua ngay laptop Asus ROG Strix G15 G513IH-HN015TW chính hãng tại CellphoneS</strong></h2><p>Với thiết kế đẹp mắt, hiệu năng mạnh mẽ, hệ thống tản nhiệt siêu khủng... laptop Asus ROG Strix G15 G513IH-HN015TW là một trong những chiếc laptop gaming mà game thủ nào cũng mong muốn sở hữu. Nếu bạn đang quan tâm đến mẫu laptop này hãy đến ngay CellphoneS để trải nghiệm và mua được hàng chính hãng cùng hàng ngàn ưu đãi hấp dẫn khác.&nbsp;</p>', '[]', '[{\"id\":\"a064ac3b-9698-ab99-433c-8bb5af92d2ca\",\"title\":\"Vi xử lý & đồ họa\",\"technical_infos\":[{\"id\":\"4e8a4edf-ef53-18f2-a090-393c67bdf1d2\",\"technical_info\":\"Loại card đồ họa\",\"technical_content\":\"Geforce GTX 1650 4GB\"},{\"id\":\"1ce85886-2252-e960-c2b8-d7a400aefd06\",\"technical_info\":\"Loại CPU\",\"technical_content\":\"AMD Ryzen 7 4800H\"}]},{\"id\":\"b4d7b160-2c53-d158-0131-97bb4ad5d7ad\",\"title\":\"RAM & Ổ cứng\",\"technical_infos\":[{\"id\":\"49e8871a-2e6c-99bc-80c3-784b3aff4081\",\"technical_info\":\"Dung lượng RAM\",\"technical_content\":\"\\n8GB\"},{\"id\":\"dbe3c425-a40d-9300-cbc4-90f5458d55f1\",\"technical_info\":\"Loại RAM\",\"technical_content\":\"DDR4 8GB (1 x 8GB) 3200MHz, up to 32GB\"},{\"id\":\"0163f9d3-98c8-4268-67e0-1323f997f8ac\",\"technical_info\":\"Số khe ram\",\"technical_content\":\"\\n2 khe\"},{\"id\":\"a6342560-27bf-3c2c-e883-eb2f1ccc6a3c\",\"technical_info\":\"Ổ cứng\",\"technical_content\":\"512GB SSD NVMe M.2 PCIe Gen 3 x 4\"}]},{\"id\":\"4f38f97f-6be7-87fc-21d3-30376185eebb\",\"title\":\"Màn hình\",\"technical_infos\":[{\"id\":\"eb07445a-efd1-e6ac-731d-2f1653d516be\",\"technical_info\":\"Màn hình cảm ứng\",\"technical_content\":\"Không\"},{\"id\":\"500276d5-cd92-4493-16fb-842510f40a07\",\"technical_info\":\"Chất liệu tấm nền\",\"technical_content\":\"Tấm nền IPS\"}]}]', '1680941385', 1, 0, 0, 2),
(15, 'Laptop ASUS Gaming TUF FX506LHB-HN188W', 'laptop-asus-gaming-tuf-fx506lhb-hn188w', 20990000, 1000000, 'images/products/1680943221/k0Q3FLvyRNrwAZmmHsH8CaF8FYek7zGtvlBvYX0k.jpg', '<h2><strong>Laptop ASUS TUF Gaming F15 FX506LHB-HN188W - Tuyệt phẩm gaming đồ họa nặng</strong></h2><p>Với những tựa game \"bom tấn\" gay cấn và hấp dẫn hiện nay, game thủ sẽ cần đến <a href=\"https://cellphones.com.vn/laptop/asus/gaming.html\"><strong>laptop ASUS TUF Gaming</strong></a> F15 FX506LHB-HN188W chứa đựng CPU Intel thế hệ 10 cùng đồ họa GeForce GTX để có được trải nghiệm gaming tối ưu ở thiết lập đồ họa cao.</p><h3><strong>Thiết kế nổi trội, màn hình 144 Hz</strong></h3><p>Laptop ASUS TUF Gaming F15 FX506LHB-HN188W hấp dẫn các game thủ nhờ ngoại hình nổi trội và tông màu đen ấn tượng. Chiếc máy được chế tác với lớp vỏ cứng cáp và gia cố cho độ bền chuẩn quân đội, sẵn sàng đồng hành cùng game thủ cho những ván đấu. Bàn phím trên laptop ASUS TUF Gaming F15 FX506LHB-HN188W mang chuẩn full-size với dãy NumPad tiện lợi.</p><figure class=\"image\"><img src=\"https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/laptop-asus-tuf-gaming-15-fx506lhb-hn188w-den-1.png\" alt=\"Laptop ASUS TUF Gaming F15 FX506LHB-HN188W - Tuyệt phẩm gaming đồ họa nặng\"></figure><p>Laptop ASUS TUF Gaming F15 FX506LHB-HN188W là dòng <a href=\"https://cellphones.com.vn/laptop/do-hoa.html\"><strong>laptop làm đồ họa</strong></a> mang đến hình ảnh mượt nét với màn hình 15.6 inch độ phân giải Full HD (1920x1080). Tần số quét lên đến 144 Hz đảm bảo chuyển động mượt mà trên màn hình của máy. Công nghệ Adaptive Sync cũng giúp đồng bộ tần số quét với hiệu năng GPU để giảm giật lag và xé hình, đảm bảo trải nghiệm đắm chìm vào thế giới game.</p><h3><strong>Hiệu năng chuyên gaming với Intel Gen 10 và GeForce GTX</strong></h3><p>Laptop ASUS TUF Gaming F15 FX506LHB-HN188W được chế tác cho trải nghiệm \"phá đảo\" trò chơi một cách thoải mái. Sức mạnh của máy đến từ bộ đôi CPU Intel Core i5 thế hệ 10 dòng H và GPU NVIDIA GeForce GTX series đáp ứng được hàng loạt trò chơi thế giới mở phiêu lưu hấp dẫn. Bộ nhớ RAM 8 GB và dung lượng ổ cứng SSD 512 GB giúp cho laptop ASUS TUF Gaming F15 FX506LHB-HN188W phục vụ tốt không chỉ giải trí, mà còn cả công việc và học tập.</p><figure class=\"image\"><img src=\"https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/laptop-asus-tuf-gaming-15-fx506lhb-hn188w-den-2.png\" alt=\"Hiệu năng chuyên gaming với Intel Gen 10 và GeForce GTX\"></figure><p>Ngoài ra, bên trong ASUS TUF Gaming F15 FX506LHB-HN188W còn chứa đựng hệ thống tản nhiệt hiệu năng cao, giúp phần cứng vận hành tối đa công suất mà vẫn giữ được độ bền. Âm thanh trên&nbsp;<a href=\"https://cellphones.com.vn/laptop/gaming.html\"><strong>laptop gaming giá rẻ</strong></a>&nbsp;này được cường hóa với hệ thống Smart Amplifier và chuẩn âm DTS cao cấp. Chiếc máy cũng tích hợp hệ điều hành Windows 11 giúp giữ laptop tiếp cận với những tính năng từ Windows.</p><h2><strong>Mua laptop ASUS TUF Gaming F15 FX506LHB-HN188W chính hãng giá hấp dẫn tại hệ thống CellphoneS</strong></h2><p>Cơ hội sở hữu laptop chuẩn gaming ASUS TUF Gaming F15 FX506LHB-HN188W Đen chính hãng với giá hấp dẫn đã đến với bạn. Chỉ cần đến cửa hàng CellphoneS gần bạn nhất để trải nghiệm, tham khảo và sở hữu ngay. Ngoài ra khi đến CellphoneS, đội ngũ nhân viên chuyên nghiệp và thân thiện sẽ giúp bạn chọn ra được sản phẩm công nghệ phù hợp với nhu cầu hiện tại. Đến CellphoneS và mua sắm ngay nhé!</p>', '[]', '[{\"id\":\"a8691d4b-f8d3-4e0e-b19f-2c43b5eb649e\",\"title\":\"Vi xử lý & đồ họa\",\"technical_infos\":[{\"id\":\"08be4fce-5ce7-ee82-cc85-7c1176329b02\",\"technical_info\":\"Loại card đồ họa\",\"technical_content\":\"NVIDIA® GeForce® GTX 1650\"},{\"id\":\"abfcc5a3-a75a-f37a-9e44-388a8e217adb\",\"technical_info\":\"Loại CPU\",\"technical_content\":\"Intel Core i5-10300H\"}]},{\"id\":\"72902685-485f-2e6a-a292-2934add2dbbe\",\"title\":\"RAM & Ổ cứng\",\"technical_infos\":[{\"id\":\"12706ba1-0378-7118-5a9b-fb80cdc0235c\",\"technical_info\":\"RAM & Ổ cứng\",\"technical_content\":\"8GB\"},{\"id\":\"a487d479-959b-f74c-8808-25fa8c66b579\",\"technical_info\":\"Loại RAM\",\"technical_content\":\"DDR4 2933MHz\"},{\"id\":\"f7dc77bf-eb4c-df0f-e4fe-444484692e56\",\"technical_info\":\"Số khe ram\",\"technical_content\":\"2 khe cắm tối đa 32GB\"},{\"id\":\"afc6dfbc-81a4-0a84-56ec-4ac65840df65\",\"technical_info\":\"Ổ cứng\",\"technical_content\":\"\\n512GB M.2 NVMe PCIe 3.0 SSD\"}]}]', '1680943221', 1, 0, 0, 9),
(16, 'Laptop Lenovo Ideapad Gaming 3 15ARH7', 'laptop-lenovo-ideapad-gaming-3-15arh7', 27490000, 2500000, 'images/products/1680944323/9RitcPjGaTj2gOeHe9wqRTepCVhRSDvpoTKv0f43.webp', '<h2>Laptop Lenovo Ideapad Gaming 3 15ARH7 - Laptop cho trải nghiệm chiến game ấn tượng</h2><p>Laptop Lenovo Ideapad Gaming 3 15ARH7 rất được ưa chuộng bởi cộng đồng game thủ khi được trang bị bởi nhiều thông số kỹ thuật ấn tượng. Dòng <a href=\"https://cellphones.com.vn/laptop/lenovo/ideapad.html\"><strong>laptop Lenovo ideapad</strong></a> mang đến trải nghiệm chiến game mượt mà với hình ảnh chất lượng cao, cũng như viên pin đủ lớn để thoải mái sử dụng trong thời gian dài.</p><h3><strong>Khả năng xử lý đa dạng các tác vụ ấn tượng</strong></h3><p>Laptop được vận hành bởi con chip hiện đại và mạnh mẽ nhất của AMD Ryzen 7 6800H với cấu trúc 8 nhân và 16 luồng, đạt mức xung nhịp đến 4.7GHz. Ngoài ra sản phẩm còn được hỗ trợ bởi card đồ họa NVIDIA GeForce RTX 3050 cho khả năng xử lý game mượt mà, cũng như những khung hình đẹp mắt, hấp dẫn.</p><figure class=\"image\"><img src=\"https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/Lenovo/Ideapad/Lenovo-Ideapad-Gaming-3-15ARH7-2.jpg\" alt=\"Laptop Lenovo Ideapad Gaming 3 15ARH7\"></figure><p>Bên cạnh đó là sự trang bị loại RAM DDR5 với mức dung lượng 8GB cho khả năng đa nhiệm nhiều tác vụ cùng lúc. Hơn nữa là ổ cứng SSD M.2 PCIe với dung lượng 512GB sẽ rút gọn thời gian khởi động máy, cũng như cho khả năng tải xuống nhiều ứng dụng, trò chơi.</p><h3><strong>Trải nghiệm chơi game thoải mái với dung lượng pin lớn</strong></h3><p>Đây là <a href=\"https://cellphones.com.vn/laptop/gaming.html\"><strong>laptop gaming</strong></a> có viên pin tích hợp với dung lượng đạt 60Wh, cho thời gian sử dụng lên đến nhiều giờ. Đặc biệt hơn bạn không cần phải lo lắng khi trải nghiệm chiến game bị gián đoạn vì laptop hết pin.</p><figure class=\"image\"><img src=\"https://cdn2.cellphones.com.vn/x,webp,q100/media/wysiwyg/laptop/Lenovo/Ideapad/Lenovo-Ideapad-Gaming-3-15ARH7-1.jpg\" alt=\"Laptop Lenovo Ideapad Gaming 3 15ARH7\"></figure><h2>Mua ngay laptop Lenovo Ideapad Gaming 3 15ARH7 chính hãng tại CellphoneS</h2><p>Chọn mua ngay laptop Lenovo Ideapad Gaming 3 15ARH7 chính hãng tại Hệ thống bán lẻ công nghệ CellphoneS để được thoải mái chiến game với nhiều trải nghiệm tuyệt vời nhé. Khi chọn CellphoneS để mua laptop, bạn sẽ được ưu đãi với mức giá phải chăng cùng chế độ bảo hành lâu dài.</p>', '[]', '[{\"id\":\"bd7de7cb-dae6-413a-f2d4-59095b0e8501\",\"title\":\"Vi xử lý & đồ họa\",\"technical_infos\":[{\"id\":\"ebc1335f-3468-e3bc-a059-56508c7a92cb\",\"technical_info\":\"Loại card đồ họa\",\"technical_content\":\"NVIDIA GeForce RTX 3050 4GB GDDR6, Boost Clock 1500MHz, TGP 85W\"},{\"id\":\"93299d1f-a201-d9c3-8c4f-460cdfe3b59f\",\"technical_info\":\"Loại CPU\",\"technical_content\":\"AMD Ryzen 7 6800H\"}]},{\"id\":\"1002901d-a099-45bb-5da1-17f064b755d3\",\"title\":\"RAM & Ổ cứng\",\"technical_infos\":[{\"id\":\"a585736f-5674-1704-2f3b-2d5e8758fd10\",\"technical_info\":\"Dung lượng RAM\",\"technical_content\":\"8GB\"},{\"id\":\"01faa27f-cfd2-491a-4311-94a4c5df13c3\",\"technical_info\":\"Loại RAM\",\"technical_content\":\"DDR5-4800\"},{\"id\":\"942835ec-d120-6ed2-65f0-4a367e96e39f\",\"technical_info\":\"Số khe ram\",\"technical_content\":\"2 khe\"},{\"id\":\"a323177d-d45a-eff1-22f0-d8450455c28d\",\"technical_info\":\"Ổ cứng\",\"technical_content\":\"512GB SSD\"}]},{\"id\":\"de66b935-c07b-0467-1471-c21e2a2a6697\",\"title\":\"Màn hình\",\"technical_infos\":[{\"id\":\"1e7e76be-7408-9c05-3998-b3496d5ab482\",\"technical_info\":\"Công nghệ màn hình\",\"technical_content\":\"IPS 250nits Anti-glare, 120Hz, 45% NTSC, Free-Sync, DC dimmer\"},{\"id\":\"099c1c0e-d1d1-e20a-062c-5ca429886aa9\",\"technical_info\":\"Độ phân giải màn hình\",\"technical_content\":\"1920 x 1080 pixels (FullHD)\"}]}]', '1680944323', 1, 5, 2, 28),
(17, 'Xiaomi Redmi Note 11 Pro', 'xiaomi-redmi-note-11-pro', 7490000, 1200000, 'images/products/1680946003/gemf3efUDWN4Dwsap2o0L3948JhFWUFFvp6cAVLn.jpg', '<p><strong>Xiaomi Redmi Note 11 Pro là một trong những chiếc điện thoại mới nhất thuộc </strong><a href=\"https://fptshop.com.vn/dien-thoai/xiaomi-redmi-note-11-4g\"><strong>Redmi Note 11</strong></a><strong> series ra mắt gần đây. Điện thoại được trang bị những thông số ấn tượng nhưng vẫn được bán ra ở phân khúc tầm trung. Với những camera chất lượng lên đến 108MP, màn hình 120Hz và sạc nhanh 67W, đây là chiếc điện thoại hoàn hảo cho bạn khi cần.&nbsp;</strong></p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/redmi-note-11-pro-1.png\" alt=\"Redmi Note 11 Pro (1)\"></figure><h3><strong>Chi tiết bức ảnh đặt lên hàng đầu</strong></h3><p>Với camera chính 108MP, bức ảnh được chụp từ Xiaomi Redmi Note 11 Pro sẽ ghi lại 108 triệu chi tiết ở chế độ 108MP, mang lại độ rõ nét như pha lê ngay cả khi phóng to nhiều lần. Bên cạnh đó với camera góc siêu rộng, camera đo độ sâu và camera macro, bạn sẽ có thêm nhiều góc nhìn cho những bức ảnh của bạn từ góc rộng đến cận cạnh, từ đó có thể sáng tạo một cách dễ dàng hơn.&nbsp;</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/redmi-note-11-pro-2.jpg\" alt=\"Redmi Note 11 Pro (2)\"></figure><h3><strong>Chụp đêm trở nên dễ dàng và tuyệt đẹp&nbsp;</strong></h3><p>Cùng với ba công nghệ cao cấp, máy ảnh của Xiaomi Redmi Note 11 Pro hoạt động vào ban đêm giống như trong ánh sáng ban ngày. Camera chính sử dụng cảm biến Samsung HM2 với kích thước cảm biến lên đến 1/1.52\" cùng ISO gốc kép và công nghệ ghép pixel 9 trong 1 sẽ cho bạn những bức ảnh có độ rõ nét và ánh sáng cực ấn tượng.&nbsp;</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/redmi-note-11-pro-3.jpg\" alt=\"Redmi Note 11 Pro (3)\"></figure><h3><strong>Trải nghiệm màn hình ở tầm cao mới</strong></h3><p><a href=\"https://fptshop.com.vn/dien-thoai/xiaomi\">Xiaomi</a> đã mang đến cho Redmi Note 11 series nhiều thông số màn hình vượt trội trong phân khúc và màn hình AMOLED 6.67 inch trên Xiaomi Redmi Note 11 Pro, chất lượng hiển thị là vô cùng ấn tượng. Màn hình này có gam màu rộng DCI-P3 và chế độ SGS bảo vệ cho đôi mắt của bạn. Hơn hết, tần số quét 120Hz đem đến hình ảnh động mượt mà dù cho bạn đang chơi game hay cuộn, lướt nội dung.&nbsp;</p>', '[]', '[{\"id\":\"594065b8-9975-5003-7d9f-36aa1905110a\",\"title\":\"Bộ xử lý\",\"technical_infos\":[{\"id\":\"f560287c-14b8-e8e8-0d17-2558325fb16d\",\"technical_info\":\"Phiên bản CPU\",\"technical_content\":\"MediaTek Helio G96\"},{\"id\":\"5c9608d5-1454-3251-e448-2fb2d2941b7f\",\"technical_info\":\"Loại CPU\",\"technical_content\":\"Octa-Core\"},{\"id\":\"e896fd68-e6c9-3a71-96c8-00424db32a52\",\"technical_info\":\"Số nhân\",\"technical_content\":\"8\"},{\"id\":\"a2921f48-f178-2219-4237-0b3d4e26f2ef\",\"technical_info\":\"Tốc độ tối đa\",\"technical_content\":\"2.05 GHz\"}]},{\"id\":\"15c45ec6-e5eb-ab57-0072-25c4da406234\",\"title\":\"RAM\",\"technical_infos\":[{\"id\":\"32b3d97d-b2ec-eb70-1e1d-f6dee64eb66d\",\"technical_info\":\"RAM\",\"technical_content\":\"8 GB\"}]},{\"id\":\"3cf97bd5-66a1-1e54-9968-a186f6590144\",\"title\":\"Màn hình\",\"technical_infos\":[{\"id\":\"cf54ee90-6b42-379d-0cda-9070ffdcf312\",\"technical_info\":\"Kích thước màn hình\",\"technical_content\":\"6.67 inch\"},{\"id\":\"f9467eef-4cd7-be10-df09-133f35fd65d8\",\"technical_info\":\"Loại cảm ứng\",\"technical_content\":\"Điện dung đa điểm\"},{\"id\":\"b6dcb0f1-c172-d633-2aa8-af13ca61a4f1\",\"technical_info\":\"Công nghệ màn hình\",\"technical_content\":\"AMOLED\"}]},{\"id\":\"51cd5872-8f81-1f8f-b870-5b0eaf98cfff\",\"title\":\"Đồ họa\",\"technical_infos\":[{\"id\":\"272ea193-29ea-5b69-9b22-0be01a7ff65d\",\"technical_info\":\"GPU\",\"technical_content\":\"Mali-G57 MC2\"}]}]', '1680946003', 1, 3, 0, 3),
(18, 'Xiaomi 13 Lite 8GB-128GB', 'xiaomi-13-lite-8gb-128gb', 10690000, 1000000, 'images/products/1680946943/10RwQNNjkzM0mg561OOyOOSxzhMQXewAm5JMiZA3.jpg', '<h2>Đặc điểm nổi bật của Xiaomi 13 Lite</h2><p><strong>Sở hữu một con chip mới mạnh mẽ, hệ thống camera kép ở mặt trước, màn hình sống động hay đơn giản hơn là thiết kế mỏng nhẹ ấn tượng, </strong><a href=\"https://fptshop.com.vn/dien-thoai/xiaomi-13-lite\"><strong>Xiaomi 13 Lite</strong></a><strong> nhanh chóng chiếm trọn lòng tin người dùng. Với mức giá cực hấp dẫn khi đến tay người dùng, Xiaomi 13 Lite đáng đến từng xu bỏ ra và hứa hẹn sẽ mang về thành công cho thương hiệu đến từ quốc gia tỷ dân.&nbsp;</strong></p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/ThienNDDD/xiaomi-13-lite.jpg\" alt=\"Xiaomi 13 Lite\"></figure><h3><strong>Sức mạnh đến từ Snapdragon 7 Gen 1</strong></h3><p>Ra mắt với bộ xử lý mới <a href=\"https://fptshop.com.vn/tin-tuc/danh-gia/tim-hieu-snapdragon-7-gen-1-146162\">Snapdragon 7 Gen 1</a> mới nhất, Xiaomi 13 Lite khuấy đảo thị trường cận cao cấp với sức mạnh hiệu năng đáng kinh ngạc. Với bốn lõi có xung nhịp 2.4GHz và bốn lõi có xung nhịp 1.8GHz kết hợp với GPU Adreno 644, chúng sẽ vận hành mọi thứ trơn tru, kể cả việc chơi những tựa game nặng một cách mượt mà. Con chip này đem đến cải tiến hiệu suất GPU 20% và các thuật toán AI nâng cao cũng tăng đến 30% so với thế hệ trước.&nbsp;</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/ThienNDDD/xiaomi-13-lite-1(1).jpg\" alt=\"Xiaomi 13 Lite 1\"></figure><h3><strong>Mang đến thiết kế cong nhẹ, siêu mỏng</strong></h3><p>Với khung viền kim loại mỏng và cong cạnh 3D, Xiaomi 13 Lite mang đến một thiết kế mỏng nhẹ với hiệu suất vượt trội. Với độ mỏng chỉ 7.23mm và chỉ nặng 121g, dù sử dụng trong thời gian dài để chơi game hay lướt web, điện thoại vẫn luôn vừa vặn hoàn hảo trong tay bạn.&nbsp;</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/ThienNDDD/xiaomi-13-lite-2(1).jpg\" alt=\"Xiaomi 13 Lite 2\"></figure><h3><strong>3 phiên bản màu cá tính, mạnh mẽ</strong></h3><p>Xiaomi 13 Lite mang đến cho bạn ba lựa chọn màu cực bắt mắt với mỗi màu là một phong cách riêng để bạn có thể lựa chọn theo mong muốn của mình. Màu Đen sẽ là lựa chọn lý tưởng cho phái mạnh, Xanh thể hiện sự tươi mới phù hợp với giới trẻ hay Hồng cá tính sẽ phù hợp với “hội chị em”.&nbsp;</p>', '[]', '[{\"id\":\"f5e9f953-0d3e-6438-f93b-663aa5308089\",\"title\":\"Thiết kế & Trọng lượng\",\"technical_infos\":[{\"id\":\"609b0562-42f0-d640-e6e2-b351ef8ce56e\",\"technical_info\":\" Kích thước\",\"technical_content\":\"159.2 x 72.7 x 7.23 mm\"},{\"id\":\"9a1db0e7-b617-ce6f-27ec-87fc86fc9841\",\"technical_info\":\"Trọng lượng sản phẩm\",\"technical_content\":\"171 g\"},{\"id\":\"e3055512-f8be-98f5-6a01-53a70c268e2e\",\"technical_info\":\"Chất liệu\",\"technical_content\":\"Khung máy: Nhôm\\nMặt lưng máy: Kính\"}]},{\"id\":\"d433b1ec-6090-0bd2-e95f-5543acb47ed0\",\"title\":\"Bộ xử lý\",\"technical_infos\":[{\"id\":\"ef18ae6c-e0de-13c5-6d30-7346409aec70\",\"technical_info\":\" Phiên bản CPU\",\"technical_content\":\"Snapdragon 7 Gen 1\"},{\"id\":\"6db42fd6-da16-7963-8874-ec89ae6342b5\",\"technical_info\":\"Số nhân\",\"technical_content\":\"8\"},{\"id\":\"1a279a41-4721-e8ef-9415-0384823d1661\",\"technical_info\":\"Tốc độ tối đa\",\"technical_content\":\"2.40 GHz\"}]},{\"id\":\"6deeebec-18f7-b30e-77d5-cbe602412147\",\"title\":\"RAM\",\"technical_infos\":[{\"id\":\"092227da-a468-0954-0a5f-3ed3bbebd6ef\",\"technical_info\":\" RAM\",\"technical_content\":\"8 GB\"},{\"id\":\"eaf4e22c-a00b-aff9-1e7c-5d4061d36c30\",\"technical_info\":\"RAM Type\",\"technical_content\":\"LPDDR4X\"}]}]', '1680946943', 1, 0, 0, 1),
(19, 'iPhone 11 128 GB', 'iPhone-11-128-GB', 13000000, 1000000, 'images/products/1682955322/arwe9wQQy6zkpleNLMwmK8Qws5rREPfTG11RDaSw.jpg', '<figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iphone-11-1.jpg\" alt=\"Điện thoại iPhone 11 chính hãng\"></figure>', '[]', '[]', '1682955322', 1, 4, 0, 31),
(20, 'OPPO A17', 'oppo-a17', 3990000, 0, 'images/products/1683903188/wbnwS1QHisjJsQ8FfuEtmqXHZkH0xLpFgauSMhCe.png', '<p>…</p>', '[]', '[{\"id\":\"6a49543b-121d-d2e5-9f04-219d11d7ad84\",\"title\":\"\",\"technical_infos\":[]}]', '1683903188', 1, 0, 0, 3),
(21, 'Samsung Galaxy S23 Ultra 12GB 512GB', 'samsung-galaxy-s23-ultra-12gb-512gb', 30000000, 1200000, 'images/products/1685018701/XzzO31yTYSB3OJhJDckCg50zQ1rgmoQhlAOf5idv.png', '<p>abc</p>', '[]', '[]', '1685018701', 1, 0, 0, 6),
(22, 'Samsung Galaxy S23 Ultra 12GB 1TB', 'samsung-galaxy-s23-ultra-12gb-1tb', 44900000, 5300000, 'images/products/1685019025/Y2IJfvXQa2SDuMzsrYKDuthRjo7Jh4csjg9CqvKy.png', '<p>abc</p>', '[]', '[]', '1685019025', 1, 0, 0, 8),
(23, 'iPad 10.2 2021 WiFi 64GB', 'iPad-10.2-2021-WiFi-64GB', 6990000, 0, 'images/products/1685106962/atJvWiWegfyXWG3P6n8a1MYLzsCvohs1xMs0s5Ak.png', '<p>abc…</p>', '[]', '[{\"id\":\"e423acf1-66a8-21bc-f4c0-3e751e33545f\",\"title\":\"Màn hình\",\"technical_infos\":[{\"id\":\"30432b6e-a426-2673-5f01-97ce23b27cb0\",\"technical_info\":\"Kích thước màn hình\",\"technical_content\":\"10.2 inches\"},{\"id\":\"cdfc467d-958f-86ea-c5aa-d85b77277f70\",\"technical_info\":\"Công nghệ màn hình\",\"technical_content\":\"Liquid Retina\"},{\"id\":\"d8772cfc-8f45-7037-c6a3-3ad7a24393c2\",\"technical_info\":\"Tính năng màn hình\",\"technical_content\":\"Tấm nền IPS, công nghệ True Tone, 500 nits\"}]},{\"id\":\"addd885c-1354-e547-a767-ca1f2bbf8996\",\"title\":\"Giao tiếp & kết nối\",\"technical_infos\":[{\"id\":\"b6c3818d-8783-cb47-3524-a9a2620cf0fe\",\"technical_info\":\"Hệ điều hành\",\"technical_content\":\"iOS\"},{\"id\":\"06b3e765-80c6-e9a5-89cd-bf7d9f45c0b4\",\"technical_info\":\"Wi-Fi\",\"technical_content\":\"Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot\"},{\"id\":\"35db52e0-64d7-fe92-d934-d16d56a7badf\",\"technical_info\":\"Jack tai nghe 3.5\",\"technical_content\":\"Có\"},{\"id\":\"1729907b-c0b8-8c5a-ea61-f7bde9bd72c1\",\"technical_info\":\"Công nghệ NFC\",\"technical_content\":\"Không\"},{\"id\":\"e24fd411-8226-29d7-e02a-90726f36a6c6\",\"technical_info\":\"Bluetooth\",\"technical_content\":\"4.2, A2DP, EDR, LE\"}]}]', '1685106962', 1, 0, 0, 19),
(24, 'Sạc nhanh 20W Apple MHJE3ZA | Chính hãng Apple Việt Nam', 'Sạc-nhanh-20W-Apple-MHJE3ZA-|-Chính-hãng-Apple-Việt-Nam', 890000, 370000, 'images/products/1685197309/GB12sPR1MI65VUZQq6EgjjUrbR6UD6HtcVAcK9y4.jpg', '<p>abc…</p>', '[]', '[]', '1685197309', 1, 0, 0, 1),
(25, 'Tai nghe Apple EarPods Lightning (MMTN2) Chính hãng Apple Việt Nam', 'Tai-nghe-Apple-EarPods-Lightning-(MMTN2)-Chính-hãng-Apple-Việt-Nam', 790000, 200000, 'images/products/1685353951/WcAknOUSFwDL2EYRvhoo3ZJVoYoUBHK647wsqdmh.webp', '<p>abc…</p>', '[]', '[]', '1685353951', 1, 0, 0, 2),
(26, 'Cáp Type C - Lightning Apple MM0A3FE/A 1m', 'Cáp-Type-C---Lightning-Apple-MM0A3FE | A-1m', 590000, 100000, 'images/products/1685354851/U4dmz8HKtOWAAMVq1uqWEyLsUctzhbsLZrreWuV4.webp', '<p>abc…</p>', '[]', '[]', '1685354851', 1, 0, 0, 2),
(27, 'Vivo V27e 8GB 256GB', 'Vivo-V27e-8GB-256GB', 8990000, 300000, 'images/products/1687018100/CY3k0EHrATz4CLlqDmrY13GY6PIeRBmLB1bPBt2F.png', '<h2><strong>Vivo V27e</strong></h2><figure class=\"image\"><img src=\"http://localhost:8000/images/description_images/CrS9QNUss7HtvvaZzkMe3NPy60fcBPxlOVpcd2hD.jpg\"></figure>', '[\"images\\/description_images\\/CrS9QNUss7HtvvaZzkMe3NPy60fcBPxlOVpcd2hD.jpg\"]', '[{\"id\":\"f1c0d292-7a72-44f5-4151-208bfe14794c\",\"title\":\"Màn hình\",\"technical_infos\":[{\"id\":\"a1f8832e-1624-4f78-2ad9-8411d26983a5\",\"technical_info\":\"Công nghệ màn hình\",\"technical_content\":\"AMOLED\"},{\"id\":\"9154dc48-6095-c872-d1d8-e91c878b8375\",\"technical_info\":\"Độ phân giải\",\"technical_content\":\"Full HD+ (1080 x 2400 Pixels)\"},{\"id\":\"3b58dacc-83b8-70dd-3394-3006ec851543\",\"technical_info\":\"Màn hình rộng\",\"technical_content\":\"6.62\\\" - Tần số quét 120 Hz\"},{\"id\":\"73473735-e574-f268-4aa8-224fa81538f6\",\"technical_info\":\"Độ sáng tối đa\",\"technical_content\":\"1300 nits\"},{\"id\":\"c2f839ed-31d0-fd9a-cdfa-8d7e9fe6fa93\",\"technical_info\":\"Mặt kính cảm ứng\",\"technical_content\":\"Kính cường lực Schott Xensation UP\"},{\"id\":\"8e1ad03f-7c32-a55e-d848-982f11af728c\",\"technical_info\":\"def\",\"technical_content\":\"def\"}]}]', '1687018100', 1, 1, 0, 15),
(28, 'Điện thoại Nokia C21 Plus 64GB', 'ien-thoai-nokia-c21-plus-64gb', 3190000, 1100000, 'images/products/1687614076/PpMQYiCFhbR8TlLp8EjXX4zJaBVHu4HvU8sMaH8d.jpg', '<h3>Tiếp nối sự thành công của những sản phẩm gần đây tại thị trường Việt Nam, lần này hãng Nokia đã mang đến mẫu điện thoại Nokia C21 Plus - sở hữu trong mình viên pin mang lại thời gian trải nghiệm lâu dài và sử dụng an tâm hơn với 2 năm cập nhật bảo mật.</h3><h3>Trải nghiệm không gián đoạn</h3><p>C21 Plus mang trong mình viên pin có dung lượng 5050 mAh, bạn có thể sử dụng liên tục xuyên suốt cả ngày. Đi kèm với đó là chuẩn sạc Micro USB 10 W cơ bản, với công suất này thì bạn có thể sạc máy trong thời gian nghỉ ngơi để hạn chế thời gian chờ đợi.</p><figure class=\"image\"><img src=\"http://localhost:8000/images/description_images/TWuz40JuywE11gPMjUFqTENBnflUnzQ052ysfC7n.jpg\"></figure><p>Mình đã dùng Nokia C21 Plus với các tác vụ thông thường như: Mạng xã hội, làm việc qua Google Sheet, nghe gọi thì máy đáp ứng khoảng 10 tiếng. Hãng Nokia khẳng định với viên pin trên bạn có thể sử dụng từ 2 đến 3 ngày chỉ với một lần sạc với các tác vụ nghe gọi, nhắn tin thông thường.</p><p>Tuy&nbsp;điện thoại Nokia C21 Plus 64GB&nbsp;là một chiếc điện thoại giá rẻ nhưng máy lại được trang bị khả năng kháng nước IP52, điều này giúp chiếc điện thoại trở nên bền bỉ cũng như cho bạn an tâm hơn trong quá trình sử dụng.</p><p>Nokia C21 Plus có một màn hình kích thước 6.5 inch, trang bị tấm nền TFT LCD kèm với độ phân giải HD+, đây là một chiếc màn hình có thông số khá cơ bản, hình ảnh hiển thị trên máy có độ nổi khối, không bị rỗ nhiều khi so với các đối thủ trong tầm giá, phù hợp với các nhu cầu cơ bản của đại đa số người dùng hiện nay.</p><figure class=\"image\"><img src=\"http://localhost:8000/images/description_images/Sw2fznH4S75XWTLXZS1E5Cvguct4y2CPfWDY1ZUF.jpg\"></figure><h3>Vẻ đẹp từ sự tinh tế</h3><p>Nokia vẫn sử dụng cùng một ngôn ngữ thiết kế cho các sản phẩm ra mắt gần đây. C21+ sử dụng khung viền hợp kim nhôm cùng mặt lưng làm từ nhựa. Máy sở hữu kiểu thiết kế dạng vân, tạo cho mình một cảm giác cầm vào rất thích cũng như hạn chế bám dấu vân tay và mồ hôi tay trong quá trình sử dụng. Đồng thời sự chắc chắn mà máy mang lại cũng là yếu tố kiên quyết làm nên sức hấp dẫn của những chiếc điện thoại Nokia.</p><figure class=\"image\"><img src=\"http://localhost:8000/images/description_images/3nLCmmdQMWAbSoG18LQKyt4KcYsQ8wdVLqnjzlFE.jpg\"></figure><p>Cụm camera sau của máy đặt ở bên trái của mặt lưng, chứa các cảm biến và được thiết kế theo hình chữ nhật, bo cong 4 góc đây là thiết kế đặc trưng của điện thoại Nokia trong thời gian gần đây.</p><figure class=\"image\"><img src=\"http://localhost:8000/images/description_images/Y5AHHhRueYZVkGB4vwpBIrc9q5Mqbcf4hCmROGXc.jpg\"></figure><p>C21+ là chiếc&nbsp;điện thoại có cảm biến vân tay&nbsp;đặt ở mặt lưng, khi mình sử dụng thì tốc độ mở khóa khá nhanh và thao tác rất dễ chỉ với một cú chạm, do máy có màn hình khá lớn nên những bạn có bàn tay nhỏ cần phải đưa tay lên cao một tí để chạm đúng vùng cảm biến.</p><figure class=\"image\"><img src=\"http://localhost:8000/images/description_images/KDJ3IRd7Mn7r1J6Oxax0K1KupeuSwrec9gKRGCLH.jpg\"></figure><h3>Hiệu năng ổn định, bảo mật 2 năm</h3><p>Điện thoại&nbsp;trang bị bộ vi xử lý SC9863A 8 lõi với tốc độ xung nhịp tối đa 1.6 GHz, đi cùng RAM 3 GB và bộ nhớ trong 64 GB, có một khe cắm thẻ nhớ MicroSD cho người dùng nâng cấp dung lượng bộ nhớ tối đa 256 GB.</p><figure class=\"image\"><img src=\"http://localhost:8000/images/description_images/EV5zuiAdkMRBg9iU4Nq9WBHAi96JtBmu1Mn07uCF.jpg\"></figure><p>Nokia C21 Plus được cài đặt hệ điều hành Android 11 phiên bản Go, đem đến một giao diện thân thiện, dễ dàng thao tác và rất phù hợp với các bậc phụ huynh cũng như với ai mới tiếp cận với điện thoại thông minh.</p><p>Nhà sản xuất đến từ Phần Lan cam kết sẽ nâng cấp bảo mật trong vòng 2 năm để tối ưu hiệu năng, đồng thời tăng khả năng bảo vệ thông tin người dùng.</p><h3>Camera lấy nét tự động</h3><p>Tuy không tập trung nhiều vào hệ thống chụp ảnh nhưng bộ đôi camera sau của máy có thông số cảm biến chính 13 MP và độ phân giải 2 MP cho cảm biến đo chiều sâu, máy cho ra những bức ảnh rất ổn. Bạn sẽ cảm thấy hài lòng khi dùng Nokia C21 Plus để chụp ảnh.</p><p>Mình đã chụp trong môi trường đầy đủ sáng bức ảnh mà mình nhận có độ chi tiết khá tốt, hình ảnh hài hòa, màu sắc khá chân thực khi so với thực tế, nhưng trong quá trình chụp bạn nên giữ cứng tay để tránh làm ảnh bị mờ hoặc nhòe do rung tay.</p><figure class=\"image\"><img src=\"http://localhost:8000/images/description_images/rl38TI25OPl3UopXGkWWfN5wBJtCzomh40P0UE29.jpg\"></figure><p>Camera trước với độ phân giải 5 MP sẽ phù hợp cho việc học, họp online và dùng để mở khóa khuôn mặt, máy cũng hỗ trợ tính năng làm đẹp giúp loại bỏ những khuyết điểm nhỏ trên khuôn mặt để bạn tự tin hơn khi giao tiếp online hay selfie.</p><p>Với những điểm nổi bật kể trên Nokia C21 Plus quả là một lựa chọn hoàn hảo trong phân khúc điện thoại giá rẻ khi mang trong mình một viên pin khủng, hệ điều hàn</p>', '[\"images\\/description_images\\/TWuz40JuywE11gPMjUFqTENBnflUnzQ052ysfC7n.jpg\",\"images\\/description_images\\/Sw2fznH4S75XWTLXZS1E5Cvguct4y2CPfWDY1ZUF.jpg\",\"images\\/description_images\\/3nLCmmdQMWAbSoG18LQKyt4KcYsQ8wdVLqnjzlFE.jpg\",\"images\\/description_images\\/Y5AHHhRueYZVkGB4vwpBIrc9q5Mqbcf4hCmROGXc.jpg\",\"images\\/description_images\\/KDJ3IRd7Mn7r1J6Oxax0K1KupeuSwrec9gKRGCLH.jpg\",\"images\\/description_images\\/EV5zuiAdkMRBg9iU4Nq9WBHAi96JtBmu1Mn07uCF.jpg\",\"images\\/description_images\\/rl38TI25OPl3UopXGkWWfN5wBJtCzomh40P0UE29.jpg\"]', '[{\"id\":\"1bdba759-ab60-bc79-2ec7-af3a6ee1ee3e\",\"title\":\"Màn hình\",\"technical_infos\":[{\"id\":\"e0a5b142-626b-2902-3bb0-1adc44a5530c\",\"technical_info\":\"Công nghệ màn hình\",\"technical_content\":\"TFT LCD\"},{\"id\":\"84ef3fd3-4816-a9cb-3f39-8906e9fb23b5\",\"technical_info\":\"Độ phân giải\",\"technical_content\":\"HD+ (720 x 1600 Pixels)\"},{\"id\":\"af6b89be-1333-c84c-cae4-05a376a4cebb\",\"technical_info\":\"Màn hình rộng\",\"technical_content\":\"6.5\\\" - Tần số quét 60 Hz\"},{\"id\":\"cbbdce4d-f6d1-003e-7bae-af3e5e70f7eb\",\"technical_info\":\"Độ sáng tối đa\",\"technical_content\":\"400 nits\"},{\"id\":\"ac7f8061-66e1-1ce9-b510-3eb7e5f0b5f3\",\"technical_info\":\"Mặt kính cảm ứng\",\"technical_content\":\"Mặt kính cong 2.5D\"},{\"id\":\"24bfd5b5-9107-271a-76a2-b83f06321289\",\"technical_info\":\"abc\",\"technical_content\":\"abc\"}]},{\"id\":\"4ebe2681-4dad-2405-5c6c-0461db7f4307\",\"title\":\"Camera sau\",\"technical_infos\":[{\"id\":\"3089c30e-d781-60fa-9fa9-ef8407a18fc8\",\"technical_info\":\"Độ phân giải\",\"technical_content\":\"Chính 13 MP & Phụ 2 MP\"},{\"id\":\"3645ca8a-4ca7-ce59-9178-8119a47de613\",\"technical_info\":\"Quay phim\",\"technical_content\":\"FullHD 1080p@30fps\"},{\"id\":\"64a0b75e-b21a-d989-e143-2059be7c2d17\",\"technical_info\":\"Đèn Flash\",\"technical_content\":\"Có\"},{\"id\":\"a5184f2f-8d8b-6ad7-d586-ff61c6fb735c\",\"technical_info\":\"Tính năng\",\"technical_content\":\"HDR\\nLàm đẹp\\nToàn cảnh (Panorama)\\nXóa phông\\nZoom kỹ thuật số\"}]}]', '1687614076', 1, 9, 0, 16),
(29, 'Chuột không dây Logitech B175', 'chuot-khong-day-logitech-b175', 200000, 31000, 'images/products/1688138102/OzPOVrlGMi0UwgeMC23UrNwKc9pPQdAlLta5HLNL.webp', '<h2><strong>Chuột không dây Logitech B175</strong></h2>', '[]', '[]', '1688138102', 0, 0, 0, 2),
(30, 'Mainboard Asus ROG Strix B560-F Gaming wifi ( LGA 1200 - ATX Form Factor - DDR4 )', 'mainboard-asus-rog-strix-b560-f-gaming-wifi-lga-1200-atx-form-factor-ddr4', 4599000, 0, 'images/products/1688141351/PM7SmqWmhJHcga9ZTIlfnmSyBMaO3kUEK05HoYPl.webp', '<h2>Đánh giá chi tiết Mainboard Asus ROG Strix B560-F Gaming wifi ( LGA 1200 - ATX Form Factor - DDR4 )</h2><p><strong>Mainboard Asus ROG Strix B560-F Gaming WiFi mang tới cho người dùng những tính năng hàng đầu như hỗ trợ chip Intel thế hệ 11, PCIe 4.0, 8+2 tụ nguồn kết hợp, công nghệ khử ồn thông minh AI hai chiều, WiFi 6 (802.11ax), ba khe cắm M.2 với tản nhiệt, cổng USB Type-C, SATA và LED RGB Aura Sync.</strong></p><h3><strong>Thiết kế đậm chất ROG</strong></h3><figure class=\"image\"><img src=\"https://fptshop.com.vn/Uploads/images/2015/VuTT29/Asus%20ROG%20Strix%20B560-F%20Gaming%20wifi%201.jpg\" alt=\"Mainboard Asus ROG Strix B560-F Gaming wifi (ảnh 1)\"></figure><p>Asus ROG Strix B560-F Gaming WiFi mang tới một thiết kế đặc trưng không thể nhầm lẫn của dòng ROG nổi tiếng. Mọi chi tiết trên bo mạch chủ đều được hoàn thiện vô cùng tinh xảo và cao cấp. Đặc biệt, Asus còn sử dụng tông màu đen huyền thoại kết hợp với dàn VRM siêu khủng và logo ROG tích hợp đèn LED Aura tuyệt đẹp để giúp các game thủ có thể xây dựng được một dàn PC ấn tượng trong mọi không gian sử dụng.</p><h3><strong>Mang lại hiệu năng đỉnh cao</strong></h3><figure class=\"image\"><img src=\"https://fptshop.com.vn/Uploads/images/2015/VuTT29/Asus%20ROG%20Strix%20B560-F%20Gaming%20wifi%202.jpg\" alt=\"Mainboard Asus ROG Strix B560-F Gaming wifi (ảnh 2)\"></figure><p>Mainboard Asus ROG Strix B560-F Gaming WiFi sẽ cung cấp cho các game thủ một hiệu năng đỉnh cao nhờ vào những công nghệ tối tân tích hợp. Với socket Intel LGA 1200, bo mạch chủ này có thể tương thích hoàn hảo cho các bộ vi xử lý IntelCore thế hệ 11, Intel Core thế hệ 10, Pentium Gold và Celeron. Kết hợp với công nghệ PCIe 4.0, 4 khe cắm RAM DDR4 và ba khe cắm M.2 với tản nhiệt, ROG Strix B560-F sẽ giúp việc xây dựng một hệ thống PC chơi game hàng đầu trở nên đơn giản hơn bao giờ hết.</p><h3><strong>Làm mát hiệu quả</strong></h3><figure class=\"image\"><img src=\"https://fptshop.com.vn/Uploads/images/2015/VuTT29/Asus%20ROG%20Strix%20B560-F%20Gaming%20wifi%203.jpg\" alt=\"Mainboard Asus ROG Strix B560-F Gaming wifi (ảnh 3)\"></figure><p>Bo mạch chủ Asus ROG Strix B560-F Gaming WiFi mang đến giải pháp làm mát hoàn hảo cho những hệ thống hiệu năng cao. Đặc biệt, thiết kế của mainboard có các tụ nguồn kết hợp với đầu cắm nguồn ProCool, cuộn cảm hợp kim chất lượng cao và tụ điện bền bỉ giúp hỗ trợ bộ vi xử lý đa nhân hoạt động ở nhiệt độ an toàn. Ngoài ra, sản phẩm còn có cặp đầu gắn quạt chuyên dụng, sẵn sàng để bạn trang bị thêm bộ tản nhiệt khí/chất lỏng cho CPU tùy theo ý muốn. Người dùng cũng có thể dễ dàng tuỳ chỉnh tốc độ quạt của hệ thống ngay trong BIOS.<br>&nbsp;</p>', '[]', '[]', '1688141351', 0, 0, 0, 3),
(31, 'CPU Intel Core i3-10100F + Quạt', 'cpu-intel-core-i3-10100f-quat', 1990000, 0, 'images/products/1688175417/xCWN6JV3qNpGfd6TYPYC11v8AYpPihmQWEAQN1Tr.png', '<h2>CPU Intel Core i3-10100F</h2>', '[]', '[]', '1688175417', 0, 0, 0, 0),
(32, 'RAM Kingston Fury 8 GB-DDR4-2666 MHz (KF426C16BB/8)', 'ram-kingston-fury-8-gb-ddr4-2666-mhz-kf426c16bb-8', 799000, 0, 'images/products/1688175665/oxuT9ip71g6fFvykdfvZWWCflDIuQuq1F8l7oWy6.png', '<h2>RAM Kingston Fury 8 GB-DDR4-2666 MHz</h2>', '[]', '[]', '1688175665', 0, 0, 0, 1),
(33, 'Ổ Cứng Gigabyte GP-GSTFS31240GNTD 240GB (Sata 3)', 'cung-gigabyte-gp-gstfs31240gntd-240gb-sata-3', 799000, 0, 'images/products/1688176297/AtFb82dAXZpoHkXOOCj3mTpy3cXaUJGHHuw0vztx.png', '<p><strong>Nếu bạn chưa bao giờ sử dụng ổ cứng SSD trước đây, ổ cứng SSD Gigabyte 240GB sẽ là sản phẩm tuyệt vời với thiết kế siêu mỏng, siêu di động, hiệu suất làm việc cao và giá thành phải chăng.</strong></p><h3><strong>Tiết kiệm thời gian</strong></h3><figure class=\"image\"><img src=\"https://fptshop.com.vn/Uploads/images/2015/VuTT29/%E1%BB%94%20C%E1%BB%A9ng%20Gigabyte%20GP-GSTFS31240GNTD%20240GB%20(Sata%203)%201.png\" alt=\"Ổ Cứng SSD Gigabyte 240GB (Ảnh 1)\"></figure><p>Ổ cứng SSD Gigabyte 240GB có thể đạt được tốc độ đọc ghi tuần tự lần lượt lên tới 500MB/s và 420MB/s, tương ứng. Điều đó đảm bảo một trải nghiệm nhanh hơn về mọi mặt so với ổ cứng HDD truyền thống. Bạn có thể sử dụng Gigabyte 240GB để làm nơi chứa hệ điều hành hoặc lưu trữ dữ liệu cá nhân tuỳ thích. Cho dù bạn sử dụng ổ SSD này cho mục đích gì, nó cũng sẽ giúp bạn tiết kiệm đáng kể thời gian sử dụng máy tính. Việc khởi động, truy cập ứng dụng hay sao chép dữ liệu không còn mất nhiều thời gian như lúc sử dụng ổ cứng HDD nữa.</p><h3><strong>Siêu di động và bền bỉ</strong></h3><figure class=\"image\"><img src=\"https://fptshop.com.vn/Uploads/images/2015/VuTT29/%E1%BB%94%20C%E1%BB%A9ng%20Gigabyte%20GP-GSTFS31240GNTD%20240GB%20(Sata%203)%202.png\" alt=\"Ổ Cứng SSD Gigabyte 240GB (Ảnh 2)\"></figure><p>SSD Gigabyte 240GB có yếu tố hình thức chuẩn SSD 2,5 inch nên bạn có thể sử dụng nó cho rất nhiều mục đích khác nhau. Từ việc lắp vào laptop, máy tính để bàn cho đến thiết bị lưu trữ di động, ổ cứng SSD này đều có thể hoàn thành tốt mọi nhiệm vụ. Ngoài ra, sản phẩm của Gigabyte còn nổi bật với trọng lượng nhẹ, khả năng chống sốc tuyệt vời và kích thước siêu nhỏ gọn. Với việc sử dụng chip nhớ, dữ liệu của người dùng sẽ luôn được bảo vệ an toàn trước các tình huống va đập. Nhờ sử dụng các vật liệu bền bỉ, Gigabyte 240GB SATA 2,5 inch có khả năng chống va đập tốt hơn nhiều lần so với các ổ cứng truyền thống.</p>', '[]', '[]', '1688176297', 0, 0, 0, 0),
(34, 'Card đồ hoạ Asus ROG-STRIX-RTX3050-O8G-GAMING - 8GB GDDR6 - 128 bit', 'card-do-hoa-asus-rog-strix-rtx3050-o8g-gaming-8gb-gddr6-128-bit', 10990000, 0, 'images/products/1688177241/l5poHxHtz4CAQ3xfsdydvo8g39XSiYPj8GIE1i4M.png', '<p><strong>Card đồ họa Asus ROG Strix GeForce RTX 3050 OC Edition 8GB GDDR6 không chỉ sở hữu thiết kế nâng cấp mà còn được nâng cấp giải pháp tản nhiệt để mang lại hiệu suất chơi game hàng đầu cho các game thủ.</strong></p><h3><strong>Thiết kế cải tiến</strong></h3><figure class=\"image\"><img src=\"https://fptshop.com.vn/Uploads/images/2015/VuTT29/01-Asus-ROG-STRIX-RTX3050-O8G-GAMING-01.jpg\" alt=\"Asus ROG Strix GeForce RTX 3050 OC Edition 8GB GDDR6 (Ảnh 1)\"></figure><p>Khi nhìn vào ngoại thất của Asus ROG Strix GeForce RTX 3050 OC Edition 8GB GDDR6, bạn sẽ thấy có rất nhiều cải tiến về thiết kế như một lỗ thông hơi rộng ở mặt sau, PCB ngắn hơn một chút, giá đỡ I/O được làm từ thép không gỉ và công tắc Dual BIOS được đặt thuận tiện. Tất cả không chỉ giúp card đồ họa trở nên chắc chắn và cao cấp hơn mà còn cho phép người dùng dễ dàng chọn nhanh giữa các chế độ làm việc. Hơn nữa, VGA&nbsp;Asus còn có logo ROG với đèn nền RGB tùy chỉnh để thêm phần tinh tế. Bên cạnh&nbsp;những thay đổi về thiết kế nói trên, ROG Strix GeForce RTX 3050 OC Edition còn có mặt trước mới với các điểm nhấn bằng kim loại phản ánh những nét thẩm mỹ đặc trưng cho các sản phẩm dòng ROG Strix. Các điểm nhấn này được phối màu sắc hoàn hảo để đảm bảo bạn có thể xây dựng các hệ thống ấn tượng.</p><h3><strong>Kiến ​​trúc NVIDIA Ampere</strong></h3><figure class=\"image\"><img src=\"https://fptshop.com.vn/Uploads/images/2015/VuTT29/01-Asus-ROG-STRIX-RTX3050-O8G-GAMING-02.jpg\" alt=\"Asus ROG Strix GeForce RTX 3050 OC Edition 8GB GDDR6 (Ảnh 2)\"></figure><p>Bên cạnh thiết kế mới với nhiều kim loại hơn bao quanh, Asus ROG Strix GeForce RTX 3050 OC Edition 8GB GDDR6 còn có những bổ sung mới mẻ nằm sâu bên trong để giúp các game thủ thỏa mãn trải nghiệm chơi game đỉnh cao. Đáng chú ý nhất chính là bộ xử lý mới được xây dựng trên kiến trúc Ampere tiên tiến của NVIDIA mang lại thông lượng FP32 gấp 32 lần và cải thiện hiệu suất năng lượng. Trong khi đó, các lõi RT thế hệ thứ 2 và Tensor thế hệ thứ 3 xuất hiện để đảm bảo hiệu suất dò tia ấn tượng và hiệu suất trò chơi tăng đáng kể. Ngoài ra, card đồ họa cũng có các thuật toán AI nâng cao như DLSS giúp nâng cao hơn nữa khả năng AI trong các tựa game mới nhất.</p>', '[]', '[]', '1688177241', 0, 0, 1, 1),
(35, 'Nguồn máy tính Deepcool DN650', 'nguon-may-tinh-deepcool-dn650', 1190000, 0, 'images/products/1688179782/P9v9cK8ucAxKe7ywNo4N8Q6H8q3xuD5cNVDXpxel.png', '<p><strong>Deepcool DN650 là một </strong><a href=\"https://fptshop.com.vn/linh-kien/nguon-may-tinh\"><strong>bộ nguồn máy tính giá rẻ</strong></a><strong> chất lượng. Sản phẩm được trang bị rất nhiều công nghệ an toàn và tính năng hấp dẫn so với các đối thủ trong tầm giá, đặc biệt là chứng nhận hiệu suất cao 80 PLUS.</strong></p><h3><strong>Chứng nhận hiệu suất cao</strong></h3><figure class=\"image\"><img src=\"https://fptshop.com.vn/Uploads/images/2015/VuTT29/Ngu%E1%BB%93n%20m%C3%A1y%20t%C3%ADnh%20Deepcool%20DN650%201.png\" alt=\"Nguồn Deepcool DN650 650W 80 Plus White (Ảnh 1)\"></figure><p>Khi mua bất kỳ một bộ nguồn máy tính nào, bạn không nên chỉ quan tâm tới tổng công suất cũng như giá thành. Hãy tìm kiếm các bộ nguồn đủ công suất và có chứng nhận hiệu suất hoạt động cao. Với những PSU như vậy, máy tính của bạn sẽ được đảm bảo đầy đủ nguồn điện trong khi lượng điện năng hao phí trong quá trình chuyển đổi sẽ ít đi. Trong phân khúc giá rẻ, Deepcool DN650 là một bộ nguồn khá chất lượng. Sản phẩm này được chứng nhận 80 PLUS® 230V EU với hiệu suất hoạt động lên tới 85%, giúp chuyển đổi nguồn điện hiệu quả và tiết kiệm chi phí hoá đơn điện hàng tháng.</p><h3><strong>Quạt 120mm hiệu quả cao</strong></h3><figure class=\"image\"><img src=\"https://fptshop.com.vn/Uploads/images/2015/VuTT29/Ngu%E1%BB%93n%20m%C3%A1y%20t%C3%ADnh%20Deepcool%20DN650%202.png\" alt=\"Nguồn Deepcool DN650 650W 80 Plus White (Ảnh 2)\"></figure><p>Một trong những vấn đề thường phát sinh trên các bộ nguồn giá rẻ chính là độ ồn. Khi vận hành ở mức tải cao, chúng có thể tạo tiếng ồn lớn, gây ảnh hưởng tới trải nghiệm làm việc hoặc chơi game của bạn. Trong trường hợp quạt có hiệu quả làm mát kém, nguồn có thể bị nóng quá mức và gây ra hiện tượng sập nguồn trên máy tính. Để đảm bảo hiệu quả làm mát và độ ồn thấp nhất, Deepcool đã sử dụng quạt làm mát 120mm và vòng bi độ ồn thấp trên PSU của họ. Nhờ đó, nguồn Deepcool này&nbsp;có thể vận hành hết công suất với nhiệt độ ổn định và đảm bảo sự yên tĩnh cho người dùng.</p>', '[]', '[]', '1688179782', 0, 0, 0, 0),
(36, 'Tản nhiệt khí Xigmatek AIR KILLER S ARCTIC', 'tan-nhiet-khi-xigmatek-air-killer-s-arctic', 599000, 100000, 'images/products/1688201552/UOQsQ9Yaf5FyNjFwxKuDnQFC1YPldBQuxYInHjwK.png', '<p><strong>Nếu bạn đang có ý định xây dựng một dàn PC cá tính, tản nhiệt khí Xigmatek Air Killer S Arctic sẽ là một thành phần không thể thiếu để làm mát CPU của bạn. Không chỉ có tông màu trắng đẹp mắt, sản phẩm có khả năng làm mát ấn tượng.</strong></p><h3><strong>Nổi bật trong mọi không gian</strong></h3><figure class=\"image\"><img src=\"https://fptshop.com.vn/Uploads/images/2015/VuTT29/Xigmatek%20AIR%20KILLER%20S%20ARCTIC%201.jpg\" alt=\"Xigmatek Air Killer S Arctic (Ảnh 1)\"></figure><p>Cho dù bạn không phải là một game thủ, Xigmatek Air Killer S Arctic vẫn sẽ gây ấn tượng mạnh với bạn ngay từ cái nhìn đầu tiên. Từ hệ thống quạt làm mát cho đến cụm tản nhiệt và cụm ống đồng, tất cả đều sử dụng cùng tông màu trắng chủ đạo, đảm bảo thu hút mọi ánh nhìn và giúp dàn PC của bạn trở nên nổi bật hơn bao giờ hết. Bên cạnh đó, bộ tản nhiệt khí này còn có quạt làm mát gắn LED X22C Rainbow tuyệt đẹp giúp tăng thêm tính thẩm mỹ cho hệ thống mỗi khi bạn nhấn nút khởi động.</p><h3><strong>Tương thích tối đa</strong></h3><figure class=\"image\"><img src=\"https://fptshop.com.vn/Uploads/images/2015/VuTT29/Xigmatek%20AIR%20KILLER%20S%20ARCTIC%202.jpg\" alt=\"Xigmatek Air Killer S Arctic (Ảnh 2)\"></figure><p>Với kích thước chỉ 128x76x160mm, tản nhiệt khí Xigmatek Air Killer S Arctic có thể vừa vặn bên trong hầu hết các vỏ case Mid Tower phổ biến nhất hiện nay. Đáng chú ý, sản phẩm này còn được thiết kế để tương thích hoàn hảo với các socket mới nhất trên các bo mạch chủ AMD hoặc Intel bao gồm cả chip Intel thế hệ 12 mới nhất. Nhờ đó, người dùng có thể dễ dàng xây dựng các dàn PC theo ý thích và khả năng tài chính.</p>', '[]', '[]', '1688201552', 0, 0, 0, 1),
(37, 'Tản nhiệt nước Xigmatek Aurora 360 ARGB', 'tan-nhiet-nuoc-xigmatek-aurora-360-argb', 2399000, 0, 'images/products/1688202108/Azr7kIVIBiRktXyEuTVIXop15u8FAoPtL26BYI23.png', '<p><strong>Bộ tản nhiệt nước AIO Xigmatek Aurora 360 sẽ là một giải pháp làm mát toàn diện cho những CPU khủng. Bên cạnh đó, hệ thống LED RGB tích hợp đảm bảo sản phẩm sẽ giúp hệ thống của bạn trở nên lung linh hơn nhiều.</strong></p><h3><strong>Hiệu quả làm mát ấn tượng</strong></h3><figure class=\"image\"><img src=\"https://fptshop.com.vn/Uploads/images/2015/VuTT29/04-Xigmatek-Aurora-360-ARGB-01.jpg\" alt=\"Xigmatek Aurora 360 ARGB (Ảnh 1)\"></figure><p>So với các tản nhiệt khí thông thường,&nbsp;Xigmatek Aurora 360 có hiệu quả làm mát mạnh mẽ hơn nhiều nhờ vào sự xuất hiện của dàn tản nhiệt với mật độ cánh nhôm dày đặc kết hợp cùng hệ thống chất lỏng tuần hoàn qua CPU và 3 quạt làm mát 120mm. Chính vì vậy, bộ sản phẩm này sẽ phù hợp để \"hạ nhiệt\" cho các CPU hàng đầu với nhiều nhân xử lý được ép xung. Kết hợp với những cải tiến mới nhất của Xigmatek và các thành phần cao cấp nhất, Aurora 360 sẽ mang lại trải nghiệm hiệu suất tối đa cho các hệ thống PC chuyên phục vụ các game thủ và người dùng chuyên nghiệp.</p><h3><strong>Toả sáng cùng LED ARGB</strong></h3><figure class=\"image\"><img src=\"https://fptshop.com.vn/Uploads/images/2015/VuTT29/04-Xigmatek-Aurora-360-ARGB-02.jpg\" alt=\"Xigmatek Aurora 360 ARGB (Ảnh 2)\"></figure><p>Không chỉ giúp CPU của bạn luôn mát mẻ trong mọi mức tải, bộ tản nhiệt nước AIO Xigmatek Aurora 360 còn giúp cho chiếc case của bạn trở nên lung linh hơn nhiều khi có sự xuất hiện của hệ thống LED ARGB trên cả block CPU và các quạt làm mát. Dải đèn LED này có thể tự động chiếu sáng với hiệu ứng cầu vồng tuyệt đẹp hoặc đồng bộ/tuỳ chỉnh trên các bo mạch chủ hỗ trợ.</p>', '[]', '[]', '1688202108', 0, 0, 0, 0);
INSERT INTO `products` (`id`, `name`, `slug`, `price`, `discounted_price`, `image`, `description`, `description_images`, `specification`, `dir`, `home_display`, `sold`, `search_click`, `view`) VALUES
(38, 'Vỏ Case Xigmatek NYM 2F', 'vo-case-xigmatek-nym-2f', 699000, 0, 'images/products/1688203124/Dpy21q9aANy7SSTFYEimZ0JlQyrioT9xkLYhg57A.png', '<p><strong>Xigmatek NYM 2F nổi bật với kích thước vô cùng nhỏ gọn. Tuy nhiên, chiếc thùng máy này vẫn có không gian khá rộng rãi bên trong để giúp bạn có thể xây dựng dễ dàng các dàn PC chất lượng.</strong></p><h3><strong>Cuốn hút trong từng chi tiết</strong></h3><figure class=\"image\"><img src=\"https://fptshop.com.vn/Uploads/images/2015/VuTT29/06-Xigmatek-NYM-2F-01.jpg\" alt=\"Vỏ Case Xigmatek NYM 2F (Ảnh 1)\"></figure><p>Xigmatek NYM 2F nổi bật với sự kết hợp giữa khung thép sơn màu đen và hai mặt kính cường lực sang trọng. Hơn thế nữa, vỏ case này sở hữu một mặt trước vô cùng ấn tượng với các hoạ tiết hoa văn đan xen nhau, cho phép đèn LED ARGB phía sau có thể phát huy hết vẻ đẹp mỗi khi bạn nhấn nút nguồn. Ngoài ra, thùng máy còn có các đường nét thiết kế vô cùng tinh xảo và kích thước nhỏ gọn, đảm bảo tối ưu tính thẩm mỹ và không gian làm việc của bạn.</p><h3><strong>Tích hợp sẵn 2 quạt ARGB tuyệt đẹp</strong></h3><figure class=\"image\"><img src=\"https://fptshop.com.vn/Uploads/images/2015/VuTT29/06-Xigmatek-NYM-2F-02.jpg\" alt=\"Vỏ Case Xigmatek NYM 2F (Ảnh 2)\"></figure><p>Ngay sau mặt trước của Xigmatek NYM 2F, nhà sản xuất đã gắn sẵn hai quạt làm mát ARGB tuyệt đẹp nhằm giúp bạn có thể tiết kiệm tối đa chi phí build PC. Mỗi khi bạn khởi động nguồn, các quạt ARGB này không chỉ giúp cải thiện luồng không khí bên trong thùng máy mà còn lan toả hiệu ứng ánh sáng tuyệt đẹp ra khắp không gian bên trong. Nhờ đó, bạn sẽ có thêm cảm hứng để làm việc và chơi game đạt hiệu quả cao hơn.</p><h3><strong>Hai vách kính cường lực sang trọng</strong></h3><figure class=\"image\"><img src=\"https://fptshop.com.vn/Uploads/images/2015/VuTT29/06-Xigmatek-NYM-2F-03.jpg\" alt=\"Vỏ Case Xigmatek NYM 2F (Ảnh 3)\"></figure><p>Thông thường, bạn sẽ chỉ tìm thấy một vách kính cường lực trên các vỏ case có mức giá tương đương với Xigmatek NYM 2F. Tuy nhiên, thùng máy này lại có đến 2 vách kính cường lực nằm ở phía trước và cạnh bên trái. Với thiết kế trong suốt, những vách kính này sẽ giúp bạn có thể tận hưởng toàn bộ những thành quả build PC của mình một cách dễ dàng. Thùng máy của bạn sẽ càng thu hút hơn nếu như bạn có thêm nhiều linh kiện tích hợp LED RGB bên trong hệ thống.</p>', '[]', '[]', '1688203124', 0, 0, 0, 0),
(39, 'Màn hình MSI Pro MP223 22 inch', 'man-hinh-msi-pro-mp223-22-inch', 2490000, 600000, 'images/products/1688204597/KilyA1birUS3szamFHmNtbatStpfon5QVhZQcihv.png', '<p><strong>Mang vẻ đẹp hiện đại và chuyên nghiệp, màn hình MSI PRO MP243 là giải pháp tuyệt vời trên bàn làm việc của bạn. Sản phẩm cung cấp tần số quét cao cùng nhiều chức năng bảo vệ mắt hiệu quả. Tấm nền IPS và bộ tùy chỉnh hiển thị sẽ đáp ứng tốt nhu cầu của nhiều ngành nghề khác nhau như lập trình, thiết kế, quản lý số liệu...</strong></p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/DuyLe/Android/Samsung/man-hinh-msi-pro-mp243-23-8-inch-1.jpg\" alt=\"Màn hình MSI PRO MP243 (Ảnh 1)\"></figure><h3><strong>Giảm gánh nặng cho mắt khi làm việc</strong></h3><p>Để đảm bảo năng suất và chỉ tiêu công việc, những người làm văn phòng thường phải tập trung cao độ vào nội dung trên màn hình, lâu dần dẫn tới hiện tượng mỏi mắt và suy giảm thị lực. MSI PRO MP243 sẽ giúp bạn hạn chế nỗi lo này bằng cơ chế chống nháy Anti-Flicker và tiết giảm ánh sáng xanh gây hại.</p><p>Trong khi đó, tần số quét 75Hz đặc biệt hữu dụng khi diễn đạt thao tác cuộn lướt để duyệt bảng biểu, số liệu và văn bản được mượt mà hơn, giảm thiểu gánh nặng cho đôi mắt trong quá trình tập trung cao độ.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/DuyLe/Android/Samsung/man-hinh-msi-pro-mp243-23-8-inch-2.jpg\" alt=\"Màn hình MSI PRO MP243 (Ảnh 2)\"></figure><h3><strong>Độ phân giải Full HD, hiển thị 16.7 triệu màu</strong></h3><p>MSI PRO MP243<strong> </strong>sẽ mở ra trước mắt bạn góc quan sát ấn tượng rộng 23.8 inch với độ phân giải Full HD (1.080 x 1.920 pixels). Tấm nền IPS được căn chỉnh kỹ lưỡng từ nhà máy để đảm bảo diễn đạt tốt tới 16.7 triệu gam màu. Về cả màu sắc và độ sáng, sản phẩm này đều mang tới góc trải nghiệm thực sự chất lượng.</p><p>Đừng quên tận dụng chiếc màn hình chất lượng cao này để xem phim và thưởng thức các nội dung giải trí ngoài giờ làm việc. Độ tương phản 1.000.000:1 và tần số quét 75Hz của thiết bị chắc chắn không thua kém các dòng sản phẩm gaming đặc thù.</p><figure class=\"image\"><img src=\"https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/DuyLe/Android/Samsung/man-hinh-msi-pro-mp243-23-8-inch-3.jpg\" alt=\"Màn hình MSI PRO MP243 (Ảnh 3)\"></figure><h3><strong>Thiết kế tối giản, ghép đôi, treo tường dễ dàng</strong></h3><p>Hướng tới đối tượng người dùng đòi hỏi cao ở tính cơ động của màn hình làm việc, MSI PRO MP243 gây ấn tượng với cấu trúc viền bao quanh cực mỏng. Điều này sẽ giúp bạn dễ dàng ghép đôi hai màn hình lại để mở rộng không gian quan sát khi làm việc. Đây là yếu tố rất được những người làm thiết kế và đồ họa quan tâm.</p><p>Ngoài ra, nếu bạn muốn giải phóng bàn làm việc khỏi chiếc màn hình 23.8 inch, MSI PRO MP243 cũng cung cấp giải pháp treo linh hoạt qua hệ thống ngàm VESA ở mặt sau, dễ dàng tháo lắp và hết sức cơ động.</p>', '[]', '[]', '1688204597', 0, 0, 0, 2),
(40, 'Bàn phím có dây Logitech K120', 'ban-phim-co-day-logitech-k120', 190000, 20000, 'images/products/1688205371/1CZDUr7LlEhUmHI92p9htxnF2PyUBm3sqFeYvtLC.png', '<h2>Bàn phím có dây LOGITECH K120</h2>', '[]', '[]', '1688205371', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_brands`
--

CREATE TABLE `products_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products_brands`
--

INSERT INTO `products_brands` (`id`, `category_id`, `product_id`, `brand_id`) VALUES
(6, 1, 20, 11),
(7, 1, 19, 8),
(8, 1, 18, 10),
(9, 1, 17, 10),
(11, 2, 15, 15),
(13, 1, 11, 9),
(14, 1, 10, 11),
(15, 2, 9, 7),
(16, 1, 8, 8),
(17, 2, 13, 15),
(18, 2, 16, 16),
(19, 1, 21, 9),
(20, 1, 22, 9),
(21, 10, 23, 20),
(23, 1, 27, 14),
(24, 1, 28, 13),
(25, 32, 29, 104),
(26, 43, 30, 74),
(27, 45, 32, 78),
(28, 46, 33, 85),
(29, 47, 34, 90),
(30, 48, 35, 95),
(31, 49, 36, 100),
(32, 49, 37, 100),
(33, 50, 38, 102),
(34, 38, 39, 56),
(35, 30, 40, 115);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_groups`
--

CREATE TABLE `products_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products_groups`
--

INSERT INTO `products_groups` (`id`, `category_id`, `brand_id`, `name`) VALUES
(1, 1, 8, 'Iphone 11'),
(2, 1, 9, 'Samsung Galaxy S23 Ultra 5G'),
(3, 1, 8, 'Iphone 12'),
(9, 1, 13, 'Nokia C21 Plus');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category_id`) VALUES
(29, 20, 1),
(30, 19, 1),
(31, 18, 1),
(32, 17, 1),
(33, 16, 2),
(34, 15, 2),
(35, 13, 2),
(36, 11, 1),
(37, 10, 1),
(38, 9, 2),
(39, 8, 1),
(40, 21, 1),
(41, 22, 1),
(42, 23, 10),
(43, 24, 16),
(44, 24, 17),
(46, 25, 16),
(47, 25, 17),
(49, 26, 16),
(50, 26, 17),
(56, 27, 1),
(57, 28, 1),
(58, 29, 16),
(59, 29, 32),
(60, 30, 24),
(61, 30, 37),
(62, 30, 43),
(63, 31, 24),
(64, 31, 37),
(65, 31, 44),
(66, 32, 24),
(67, 32, 37),
(68, 32, 45),
(69, 33, 24),
(70, 33, 37),
(71, 33, 46),
(72, 34, 24),
(73, 34, 37),
(74, 34, 47),
(75, 35, 24),
(76, 35, 37),
(77, 35, 48),
(78, 36, 24),
(79, 36, 37),
(80, 36, 49),
(81, 37, 24),
(82, 37, 37),
(83, 37, 49),
(84, 38, 24),
(85, 38, 37),
(86, 38, 50),
(87, 39, 24),
(88, 39, 38),
(89, 40, 16),
(90, 40, 30);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_category_attribute_values`
--

CREATE TABLE `product_category_attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `category_attribute_value_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_category_attribute_values`
--

INSERT INTO `product_category_attribute_values` (`id`, `product_id`, `category_id`, `category_attribute_value_id`) VALUES
(89, 18, 1, 27),
(90, 18, 1, 28),
(91, 18, 1, 29),
(92, 18, 1, 30),
(93, 18, 1, 33),
(94, 18, 1, 37),
(95, 18, 1, 40),
(96, 17, 1, 26),
(97, 17, 1, 30),
(98, 17, 1, 34),
(99, 17, 1, 38),
(100, 17, 1, 41),
(101, 16, 2, 8),
(102, 16, 2, 14),
(103, 16, 2, 54),
(104, 16, 2, 57),
(105, 16, 2, 60),
(106, 15, 2, 8),
(107, 15, 2, 14),
(108, 15, 2, 53),
(109, 15, 2, 57),
(110, 13, 2, 8),
(111, 13, 2, 15),
(112, 13, 2, 53),
(113, 13, 2, 56),
(114, 13, 2, 59),
(115, 11, 1, 23),
(116, 10, 1, 26),
(117, 10, 1, 28),
(118, 10, 1, 33),
(119, 10, 1, 36),
(120, 10, 1, 41),
(121, 9, 2, 7),
(122, 9, 2, 15),
(123, 9, 2, 52),
(124, 9, 2, 56),
(125, 9, 2, 60),
(136, 28, 1, 24),
(137, 28, 1, 28),
(138, 28, 1, 32),
(139, 28, 1, 38),
(140, 28, 1, 40),
(141, 28, 1, 88),
(142, 28, 1, 44),
(143, 28, 1, 90),
(144, 29, 32, 390),
(145, 29, 32, 394),
(146, 29, 32, 397),
(147, 29, 32, 401),
(148, 30, 43, 243),
(149, 30, 43, 246),
(150, 30, 43, 253),
(151, 30, 43, 256),
(152, 30, 43, 258),
(153, 31, 44, 260),
(154, 31, 44, 262),
(155, 31, 44, 266),
(156, 31, 44, 275),
(157, 31, 44, 283),
(158, 31, 44, 286),
(159, 32, 45, 296),
(160, 32, 45, 300),
(161, 32, 45, 303),
(162, 32, 45, 308),
(163, 33, 46, 312),
(164, 33, 46, 319),
(165, 33, 46, 328),
(166, 33, 46, 330),
(167, 34, 47, 335),
(168, 34, 47, 342),
(169, 34, 47, 345),
(170, 34, 47, 351),
(171, 35, 48, 359),
(172, 35, 48, 363),
(173, 35, 48, 368),
(174, 36, 49, 373),
(175, 36, 49, 378),
(176, 36, 49, 379),
(177, 36, 49, 382),
(178, 37, 49, 375),
(179, 37, 49, 377),
(180, 37, 49, 380),
(181, 37, 49, 383),
(182, 38, 50, 384),
(183, 38, 50, 388),
(184, 39, 38, 181),
(185, 39, 38, 182),
(186, 39, 38, 184),
(187, 39, 38, 189),
(188, 39, 38, 192),
(189, 39, 38, 198),
(190, 39, 38, 203),
(191, 39, 38, 210),
(192, 39, 38, 211),
(193, 40, 30, 404),
(194, 40, 30, 408),
(195, 40, 30, 410),
(196, 19, 1, 26),
(197, 19, 1, 29),
(198, 19, 1, 30),
(199, 19, 1, 81),
(200, 19, 1, 33),
(201, 19, 1, 38),
(202, 19, 1, 40),
(203, 19, 1, 42),
(204, 19, 1, 86),
(205, 19, 1, 44),
(206, 19, 1, 94),
(207, 8, 1, 26),
(208, 8, 1, 29),
(209, 8, 1, 30),
(210, 8, 1, 81),
(211, 8, 1, 33),
(212, 8, 1, 38),
(213, 8, 1, 40),
(214, 8, 1, 86),
(215, 8, 1, 88),
(216, 8, 1, 44),
(217, 8, 1, 94),
(218, 23, 10, 63),
(219, 23, 10, 116),
(220, 23, 10, 119),
(221, 23, 10, 123),
(222, 23, 10, 124),
(223, 23, 10, 125),
(224, 23, 10, 126),
(225, 23, 10, 130),
(226, 23, 10, 131),
(227, 23, 10, 133),
(228, 23, 10, 134);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_colors`
--

CREATE TABLE `product_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color` text NOT NULL,
  `color_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_colors`
--

INSERT INTO `product_colors` (`id`, `product_id`, `color`, `color_name`) VALUES
(11, 10, 'images/products/1680510068/XYxeN9uOg5rlT4h9eXx57T2T19i8pRnwrTqeJDlT.jpg', 'Đen'),
(12, 10, 'images/products/1680510068/qmi4DfLkqYi8hN3mhzg1iO4tJl5R6kgcKuLabaaa.jpg', 'Vàng'),
(13, 11, 'images/products/1680516110/H0oOVuXI8wmYQxoFTXfq0iM1YvcXnVclLgQ3RwPe.jpg', 'Đen'),
(14, 11, 'images/products/1680516110/7OkuAHRqGWuLEkLvuYoEiH7zNxhzhGnv3QeVyBWQ.jpg', 'Kem'),
(15, 11, 'images/products/1680516110/5dOVMOgcYUTsfDygI92Rf9TpSNQFAK4xAzr8igFu.png', 'Tím'),
(17, 15, 'images/products/1680943221/nuo7utk4gGClEJyGDLkg3G5CDEbunk77FtBlCn31.jpg', 'Đen'),
(18, 16, 'images/products/1680944323/KxxrB3lM3hcm79uQBur9B9NZcDOXiRiCzpbGY0P3.webp', 'Trắng'),
(19, 17, 'images/products/1680946003/XEq1GUuMyHa6cSO7Ygnvy300PxbePekdJtpskWVC.jpg', 'Xanh dương'),
(20, 17, 'images/products/1680946003/wTtRbM7bKTGhJE4TOAKvBSagcPpzJImqPLDCPyoe.jpg', 'Trắng'),
(21, 17, 'images/products/1680946003/LyjmkMyNw8L0OpExzFWaA4RO2sJZSb5Qw8ZCdkE0.jpg', 'Xám'),
(22, 18, 'images/products/1680946943/jQnXrrCoEBZU4MlBTcovUDbenP8pbGHN7sGF5ZQx.png', 'Xanh dương'),
(23, 18, 'images/products/1680946943/5wPRryDoVJNkSJ3EmtiM8TQnieaUJqH9g3c7xQyz.png', 'Đen'),
(24, 19, 'images/products/1682955322/kdvJhrbe3cyC6gCPvO0skdLDzCFzn65lh7xTRYNm.jpg', 'Trắng'),
(26, 20, 'images/products/1683903188/QZTsjXcyevNTQHEKTfTBQFaCytzkkhYZ3YTRSgh3.jpg', 'Xanh'),
(27, 20, 'images/products/1683903188/G8hf1l43uNX3AylSLZSW4b6f0ysN3Dw5CWerCykk.png', 'Đen'),
(29, 21, 'images/products/1685018701/gEJL2bZiPFgm75UGINFXvm5u25egPoeR1K1AGCHM.png', 'Kem'),
(30, 22, 'images/products/1685019025/LRu9iCzzoJRWNriTdL2SFV8KaKprhneMGMa4fnE1.png', 'Đen'),
(32, 13, 'images/products/1680941385/dycqsdGLlQskGGQq30BZ2lFtG2KuUfeRuYxTN8Mc.png', 'Đen'),
(35, 27, 'images/products/1687018100/ns2gVUPjXnqZnrYRqHPUS4o2vbWddcosHX9mvapE.jpg', 'Đen'),
(36, 27, 'images/products/1687018100/Bde0kiO9dD1qpg18LpU0ESyIxc9zWme0gDExClgs.png', 'Tím'),
(37, 28, 'images/products/1687614076/XEiaKUgWVSKRj2846NTDhFEpV1HhAF24fJ6MU8vO.jpg', 'Xám'),
(38, 23, 'images/products/1685106962/bjdMyeCahU9LpSi1laN2KlGcPndlPf8O2znHNBfI.jpg', 'Xám'),
(39, 23, 'images/products/1685106962/KOoBJY2MYoImOrF5HAtB1tqK5YbbUVdSeQdDKoUK.png', 'Trắng'),
(51, 8, 'images/products/1680194093/TLqH2jDUIY5SbaSeS7ukdcucVdkioAzVIo2NBJ63.jpg', 'Đen'),
(52, 8, 'images/products/1680194093/fqBGNRhqpBqMjsk7AMEAfRYxTzenRRritaJv7j4F.jpg', 'Trắng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `nickname`, `name`, `email`, `phone`, `gender`, `birthday`) VALUES
(1, 1, 'Corona', 'hoa nhat', 'nhathoa510@gmail.com', NULL, 'Boy', '1996-01-01'),
(2, 2, NULL, 'hoa nhat', 'nhathoa525@gmail.com', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `star` tinyint(4) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `star`, `content`, `created_at`) VALUES
(21, 1, 23, 5, 'Sản phẩm tốt', '2023-06-06 12:12:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews_to_prove`
--

CREATE TABLE `reviews_to_prove` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `star` tinyint(4) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(2, 'Administrator', 'Administrator có quyền truy cập vào tất cả các chức năng quản trị của hệ thống và bao gồm thêm, sửa và xóa thành viên quản trị khác.'),
(3, 'Manager', 'Manager có quyền truy cập vào hệ thống quản trị gồm:quản trị danh mục, nhóm sản phẩm, sản phẩm, đơn hàng...'),
(4, 'Author', 'Author có quyền truy cập vào hệ thống quản trị gồm: thêm, sửa bài viết trên hệ thống website và có quyền xóa bài viết mà mình tạo ra.'),
(8, 'Guest', 'guest');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` text NOT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `shopping_cart`
--

INSERT INTO `shopping_cart` (`id`, `user_id`, `product_id`, `quantity`, `image`, `color_id`, `version`) VALUES
(244, 2, 27, 1, 'images/shopping_cart/2/ns2gVUPjXnqZnrYRqHPUS4o2vbWddcosHX9mvapE.jpg', 35, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suggestion`
--

CREATE TABLE `suggestion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `suggestion_product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `suggestion`
--

INSERT INTO `suggestion` (`id`, `product_id`, `suggestion_product_id`) VALUES
(2, 8, 24),
(3, 8, 25),
(4, 8, 26);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `login_key` varchar(255) NOT NULL,
  `social_id` varchar(255) DEFAULT NULL,
  `driver` enum('google','facebook') NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `login_key`, `social_id`, `driver`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'nhathoa510@gmail.com', '102781831247658316556', 'google', 'wjKnSaWJRwgKwIA9x3G89MhwusukJI750h9k04uJZPr7vsNgIJDjhZgfgHfP', '2023-05-24 01:56:46', '2023-05-24 01:56:46'),
(2, 'nhathoa525@gmail.com', '106942908069303286263', 'google', NULL, '2023-07-15 13:34:37', '2023-07-15 13:34:37');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `admins_roles`
--
ALTER TABLE `admins_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admins_roles_admin_id_foreign` (`admin_id`),
  ADD KEY `admins_roles_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_attributes`
--
ALTER TABLE `category_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_attributes_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `category_attribute_values`
--
ALTER TABLE `category_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_attribute_values_category_attribute_id_foreign` (`category_attribute_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `comments_to_reply`
--
ALTER TABLE `comments_to_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_to_reply_product_id_foreign` (`product_id`),
  ADD KEY `comments_to_reply_comment_id_foreign` (`comment_id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `flash_sale`
--
ALTER TABLE `flash_sale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flash_sale_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `groups_products_link`
--
ALTER TABLE `groups_products_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_products_link_product_id_foreign` (`product_id`),
  ADD KEY `groups_products_link_group_id_foreign` (`group_id`);

--
-- Chỉ mục cho bảng `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_product_id_foreign` (`product_id`),
  ADD KEY `inventory_color_id_foreign` (`color_id`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`),
  ADD KEY `order_details_color_id_foreign` (`color_id`);

--
-- Chỉ mục cho bảng `order_tracker`
--
ALTER TABLE `order_tracker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_tracker_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_author_id_foreign` (`author_id`),
  ADD KEY `posts_post_category_id_foreign` (`post_category_id`);

--
-- Chỉ mục cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);
ALTER TABLE `products` ADD FULLTEXT KEY `name` (`name`);

--
-- Chỉ mục cho bảng `products_brands`
--
ALTER TABLE `products_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brands_category_id_foreign` (`category_id`),
  ADD KEY `products_brands_product_id_foreign` (`product_id`),
  ADD KEY `products_brands_brand_id_foreign` (`brand_id`);

--
-- Chỉ mục cho bảng `products_groups`
--
ALTER TABLE `products_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_groups_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_product_id_foreign` (`product_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `product_category_attribute_values`
--
ALTER TABLE `product_category_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_attribute_values_product_id_foreign` (`product_id`),
  ADD KEY `product_category_attribute_values_category_id_foreign` (`category_id`),
  ADD KEY `foreign_key_name` (`category_attribute_value_id`);

--
-- Chỉ mục cho bảng `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_colors_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `reviews_to_prove`
--
ALTER TABLE `reviews_to_prove`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_to_prove_user_id_foreign` (`user_id`),
  ADD KEY `reviews_to_prove_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shopping_cart_user_id_foreign` (`user_id`),
  ADD KEY `shopping_cart_product_id_foreign` (`product_id`),
  ADD KEY `shopping_cart_color_id_foreign` (`color_id`);

--
-- Chỉ mục cho bảng `suggestion`
--
ALTER TABLE `suggestion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suggestion_product_id_foreign` (`product_id`),
  ADD KEY `suggestion_suggestion_product_id_foreign` (`suggestion_product_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_login_key_unique` (`login_key`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `address`
--
ALTER TABLE `address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `admins_roles`
--
ALTER TABLE `admins_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT cho bảng `category_attributes`
--
ALTER TABLE `category_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT cho bảng `category_attribute_values`
--
ALTER TABLE `category_attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=435;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT cho bảng `comments_to_reply`
--
ALTER TABLE `comments_to_reply`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `flash_sale`
--
ALTER TABLE `flash_sale`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `groups_products_link`
--
ALTER TABLE `groups_products_link`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `notification`
--
ALTER TABLE `notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `order_tracker`
--
ALTER TABLE `order_tracker`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `products_brands`
--
ALTER TABLE `products_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `products_groups`
--
ALTER TABLE `products_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT cho bảng `product_category_attribute_values`
--
ALTER TABLE `product_category_attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT cho bảng `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `reviews_to_prove`
--
ALTER TABLE `reviews_to_prove`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT cho bảng `suggestion`
--
ALTER TABLE `suggestion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `admins_roles`
--
ALTER TABLE `admins_roles`
  ADD CONSTRAINT `admins_roles_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admins_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `category_attributes`
--
ALTER TABLE `category_attributes`
  ADD CONSTRAINT `category_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `category_attribute_values`
--
ALTER TABLE `category_attribute_values`
  ADD CONSTRAINT `category_attribute_values_category_attribute_id_foreign` FOREIGN KEY (`category_attribute_id`) REFERENCES `category_attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `comments_to_reply`
--
ALTER TABLE `comments_to_reply`
  ADD CONSTRAINT `comments_to_reply_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_to_reply_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `flash_sale`
--
ALTER TABLE `flash_sale`
  ADD CONSTRAINT `flash_sale_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `groups_products_link`
--
ALTER TABLE `groups_products_link`
  ADD CONSTRAINT `groups_products_link_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `products_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `groups_products_link_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `product_colors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `product_colors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order_tracker`
--
ALTER TABLE `order_tracker`
  ADD CONSTRAINT `order_tracker_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_post_category_id_foreign` FOREIGN KEY (`post_category_id`) REFERENCES `post_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `products_brands`
--
ALTER TABLE `products_brands`
  ADD CONSTRAINT `products_brands_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_brands_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_brands_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `products_groups`
--
ALTER TABLE `products_groups`
  ADD CONSTRAINT `products_groups_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `product_category_attribute_values`
--
ALTER TABLE `product_category_attribute_values`
  ADD CONSTRAINT `foreign_key_name` FOREIGN KEY (`category_attribute_value_id`) REFERENCES `category_attribute_values` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_category_attribute_values_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_category_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `product_colors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `reviews_to_prove`
--
ALTER TABLE `reviews_to_prove`
  ADD CONSTRAINT `reviews_to_prove_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_to_prove_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `shopping_cart_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `product_colors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shopping_cart_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shopping_cart_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `suggestion`
--
ALTER TABLE `suggestion`
  ADD CONSTRAINT `suggestion_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `suggestion_suggestion_product_id_foreign` FOREIGN KEY (`suggestion_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
