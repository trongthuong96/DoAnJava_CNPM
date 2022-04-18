-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 18, 2022 at 02:11 AM
-- Server version: 8.0.28
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_linh_kien`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `village` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `district` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `phoneNumber` varchar(10) DEFAULT NULL,
  `hide` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `email`, `password`, `firstName`, `lastName`, `address`, `village`, `district`, `city`, `birthday`, `phoneNumber`, `hide`) VALUES
(1, 'dotrongthuong8@gmail.com', '$2a$12$YHuhzps73MVGEeSDDKrVje5s1YnERjHK7XUQ0Gr6Dy7NO.4Umpc/G', 'Đỗ Trọng', 'Thưởng', 'Hóc Môn', 'Tân Thông Hội', 'Củ Chi', 'Hồ Chí Minh', '1996-11-21 09:15:56', '0355001184', 0),
(3, 'Thaicho@gmail.com', '$2a$12$YHuhzps73MVGEeSDDKrVje5s1YnERjHK7XUQ0Gr6Dy7NO.4Umpc/G', 'Tô Vĩnh', 'Thái', 'Số nhà 12 quốc lộ', 'Tân Thông Hội', 'củ chi', 'Hồ Chí Minh', NULL, '0911223322', 0),
(4, 'lienminh9697@gmail.com', '$2a$12$2d9YwQhBmAzDyAulfa/JiOCoAwFETnlzBGJ2VbRXF7GdLsqEzmjAC', 'Vo Danh', '', '123', '', '', '', NULL, NULL, 0),
(12, 'khongco@gmail.com', '$2a$12$XaFNT9eBmYAWU5LumDW7A.Lt1oJHIqFjUWM0YiGaRFLTV7X3IY/yS', '1027_Đỗ', 'Thưởng', 'null', 'null', 'null', 'null', NULL, NULL, 0),
(14, 'khongco2@gmail.com', '$2a$12$SfPYOKWU0OPacLtPSYfmF.1NUJVInb0Qz7SvxNFLEpBbAqNrwO3Zu', '', '', 'null', 'null', 'null', 'null', NULL, NULL, 0),
(15, 'thai@gmail.com', '$2a$12$dPIpE.mBHA5aURp38MgomuPsiqBDHvd2YjKZomIaUIkuaW37X2Hte', 'Tô', 'Thái', 'null', 'null', 'null', 'null', NULL, NULL, 0),
(19, 'Quang@gmail.com', '$2a$12$XmM5s1qMyhpCKflZflP48eOCS8MJXh4ExGgdJ6snrYqws0Cak44FK', 'Lê', 'Quang', '', '', '', '', NULL, NULL, 0),
(20, 'khang@gmail.com', '$2a$12$WIhvvK41HiCHnxum6iDd2O4a.ZkjmouWFsgrFGtMh9rgtVpLc79ni', 'Lê', 'Khang', NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `accountrole`
--

CREATE TABLE `accountrole` (
  `accountId` int NOT NULL,
  `roleId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `accountrole`
--

INSERT INTO `accountrole` (`accountId`, `roleId`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int NOT NULL,
  `capption` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `accountId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `capption`, `content`, `img`, `accountId`) VALUES
(2, 'Linh kiện điện tử', 'Giảm 10% khi mua món hàng đầu tiên', 'banner1.jpg', 1),
(3, 'Linh kiện điện tử', 'Giảm 10% khi mua món hàng đầu tiên', 'banner2.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartId` varchar(36) NOT NULL,
  `productId` int NOT NULL,
  `quantity` int NOT NULL,
  `totalPrice` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int NOT NULL,
  `accountId` int NOT NULL,
  `dateAdded` datetime NOT NULL,
  `dateDelivery` datetime NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `accountId`, `dateAdded`, `dateDelivery`, `status`) VALUES
(1, 3, '2022-04-16 19:21:46', '2022-04-23 19:21:46', 0),
(2, 3, '2022-04-16 19:37:39', '2022-04-23 19:37:39', 0),
(3, 3, '2022-04-16 19:40:11', '2022-04-23 19:40:11', 0),
(4, 3, '2022-04-16 19:50:00', '2022-04-23 19:50:00', 0),
(5, 3, '2022-04-16 19:59:34', '2022-04-23 19:59:34', 0),
(6, 3, '2022-04-16 20:08:28', '2022-04-23 20:08:28', 0),
(7, 3, '2022-04-16 20:40:18', '2022-04-23 20:40:18', 0),
(8, 3, '2022-04-16 20:55:46', '2022-04-23 20:55:46', 0),
(9, 3, '2022-04-16 20:58:05', '2022-04-23 20:58:05', 0),
(10, 3, '2022-04-17 07:07:36', '2022-04-24 07:07:36', 0),
(11, 1, '2022-04-18 08:33:45', '2022-04-25 08:33:45', 0),
(12, 1, '2022-04-18 08:59:51', '2022-04-25 08:59:51', 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoicedetail`
--

CREATE TABLE `invoicedetail` (
  `id` bigint NOT NULL,
  `invoiceId` int NOT NULL,
  `quantity` int NOT NULL,
  `price` bigint NOT NULL,
  `totalPrice` bigint NOT NULL,
  `productId` int NOT NULL,
  `productName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `invoicedetail`
--

INSERT INTO `invoicedetail` (`id`, `invoiceId`, `quantity`, `price`, `totalPrice`, `productId`, `productName`) VALUES
(1, 7, 3, 2000000, 6000000, 4, 'Màn hình Laptop 15.6 inch LED mỏng, Cáp nhỏ'),
(2, 7, 1, 400000, 400000, 9, 'Ram Laptop Kingston (KVR32S22S6/4) 4GB (1x4GB) DDR4 3200Mhz'),
(3, 8, 3, 2000000, 6000000, 4, 'Màn hình Laptop 15.6 inch LED mỏng, Cáp nhỏ'),
(4, 8, 1, 400000, 400000, 9, 'Ram Laptop Kingston (KVR32S22S6/4) 4GB (1x4GB) DDR4 3200Mhz'),
(5, 9, 1, 2300000, 2300000, 2, 'Màn hình Laptop 15.6 inch LED, mỏng hơn, tai trên dưới, 30-pin Full HD ips'),
(6, 9, 1, 400000, 400000, 9, 'Ram Laptop Kingston (KVR32S22S6/4) 4GB (1x4GB) DDR4 3200Mhz'),
(7, 9, 1, 1200000, 1200000, 10, 'Ram laptop CORSAIR (CMSX8GX4M1A2666C18) 8GB (1x8GB) DDR4 2666MHz'),
(8, 10, 1, 600000, 600000, 7, 'RAM LAPTOP KINGMAX (KM-SD4-2400-4GS) 4G (1X4GB) DDR4 2400MHZ'),
(9, 10, 1, 400000, 400000, 9, 'Ram Laptop Kingston (KVR32S22S6/4) 4GB (1x4GB) DDR4 3200Mhz'),
(10, 11, 1, 2000000, 2000000, 1, 'MÀN HÌNH LAPTOP 14 INCH LED MỎNG, CÁP NHỎ, 30-PIN'),
(11, 11, 3, 2300000, 6900000, 2, 'Màn hình Laptop 15.6 inch LED, mỏng hơn, tai trên dưới, 30-pin Full HD ips'),
(12, 11, 4, 2500000, 10000000, 5, 'Màn hình dành cho Laptop LED 15.6Inch (Mỏng-40C)'),
(13, 12, 5, 1919000, 9595000, 3, 'Màn hình Laptop 14 inch Samsung, LG, LED dày');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`id`, `name`, `logo`) VALUES
(1, 'Samsung', ''),
(2, 'Asus', ''),
(3, 'Dell', ''),
(4, 'Hp', ''),
(5, 'Acer', ''),
(6, 'Intel', ''),
(7, 'Amd', ''),
(8, 'Lenovo', ''),
(9, 'LG', ''),
(10, 'Gigabyte', ''),
(11, 'Microsoft', ''),
(12, 'MSI', ''),
(13, 'Kingston', '');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int NOT NULL,
  `accountId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `accountId`, `name`, `url`) VALUES
(1, 1, 'Trang chủ', '/'),
(2, 1, 'Sản phẩm', NULL),
(3, 1, 'Giỏ hàng', '/gio-hang'),
(4, 1, 'Liên hệ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `typeId` int NOT NULL,
  `manufacturerId` int NOT NULL,
  `priceImport` int NOT NULL,
  `quantity` int NOT NULL,
  `dateAdded` datetime NOT NULL,
  `image` varchar(255) NOT NULL,
  `decription` varchar(5000) DEFAULT NULL,
  `sale` int DEFAULT NULL,
  `warrantyPeriod` varchar(30) NOT NULL,
  `price` bigint NOT NULL,
  `newProduct` tinyint(1) NOT NULL DEFAULT '0',
  `hotProduct` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `typeId`, `manufacturerId`, `priceImport`, `quantity`, `dateAdded`, `image`, `decription`, `sale`, `warrantyPeriod`, `price`, `newProduct`, `hotProduct`) VALUES
(1, 'MÀN HÌNH LAPTOP 14 INCH LED MỎNG, CÁP NHỎ, 30-PIN', 2, 9, 1000000, 12, '2022-04-16 13:51:46', 'product-20220416135146250_50664_man_hinh_laptop_14_led_mong_cap_nho_30_pin.jpg', 'Kích thước: 14 inch\r\nĐộ phân giải: 1366x768', 0, '36 tháng', 2000000, 1, 1),
(2, 'Màn hình Laptop 15.6 inch LED, mỏng hơn, tai trên dưới, 30-pin Full HD ips', 2, 9, 1000000, 5, '2022-04-16 13:53:17', 'product-2022041613531750651_man_hinh_laptop_15_6_led.jpg', 'Kích thước: 15.6 inch\r\nĐộ phân giải: 1920x1080 (Full HD)', 0, '36 tháng', 2300000, 1, 1),
(3, 'Màn hình Laptop 14 inch Samsung, LG, LED dày', 2, 9, 1000000, 8, '2022-04-16 13:54:07', 'product-2022041613540750665_man_hinh_laptop_14_samsung_lg_led_day_1.jpg', 'Kích thước: 14 inch\r\nĐộ phân giải: 1366x768', 0, '36 tháng', 1919000, 1, 1),
(4, 'Màn hình Laptop 15.6 inch LED mỏng, Cáp nhỏ', 2, 8, 1000000, 5, '2022-04-16 13:55:47', 'product-2022041613554750655_m__n_h__nh_laptop_15_6_led_m___ng__c__p_nh____01.jpg', '.', 0, '36 tháng', 2000000, 1, 1),
(5, 'Màn hình dành cho Laptop LED 15.6Inch (Mỏng-40C)', 2, 5, 1000000, 7, '2022-04-16 14:00:31', 'product-2022041614003115993_0_man_hiinh_mtxt_led_11_6inch___001.jpg', 'Bảo hành: 6 tháng tại Phúc Anh', 0, '36 tháng', 2500000, 1, 1),
(6, 'Màn hình dành cho Laptop LED 12.5Inch (Mỏng)', 2, 9, 1000000, 5, '2022-04-16 14:02:04', 'product-2022041614020419448_71abwbqb2al__sl1400_.jpg', '☛ Giảm đến 368K cho học sinh, sinh viên\r\n☛ Giảm tới 500.000đ, 20% ram laptop kèm bộ quà tới 3.000.000đ khi mua Laptop Gaming\r\n☛ Giảm tới 20% khi mua linh kiện, phụ kiện kèm laptop\r\n☛ MUA DELL CỰC CHẤT - NHẬN QUÀ NGÂY NGẤT tặng TMH 300.000đ (Xem ngay)\r\n☛ Giảm ngay 300.000đ cho khách hàng có sinh nhật tháng 4 khi mua Laptop\r\n☛ Khuyến mại siêu HOT: PC siêu chất - Rinh Gấp Quà To\r\n☛ Ưu đãi giảm tới 600.000 VNĐ khi mua phần mềm Windows - Office - Diệt virut\r\n☛ Giảm tới 20% khi mua thiết bị văn phòng', 0, '36 tháng', 2300000, 1, 1),
(7, 'RAM LAPTOP KINGMAX (KM-SD4-2400-4GS) 4G (1X4GB) DDR4 2400MHZ', 1, 13, 300000, 12, '2022-04-16 14:04:13', 'product-2022041614041254836_ram_laptop_kingmax__km_sd4_2400_4gs__4g__1x4gb__ddr4_2400mhz.jpg', 'Loại Ram: DDR4\r\nDung lượng: 4GB\r\nBus: 2400Mhz', 0, '36 tháng', 600000, 1, 1),
(8, 'Ram Laptop Kingston (KVR16LS11/8WP) 8GB (1x8GB) DDR3 1600Mhz', 1, 13, 600000, 8, '2022-04-16 14:05:04', 'product-2022041614050458630_ram_laptop_kingston_kvr16ls11_8wp_8gb.jpg', 'Ram Laptop\r\nLoại DDR3\r\nDung lượng 8GB\r\nSố lượng: 1 thanh', 0, '36 tháng', 1500000, 1, 1),
(9, 'Ram Laptop Kingston (KVR32S22S6/4) 4GB (1x4GB) DDR4 3200Mhz', 1, 13, 70000, 5, '2022-04-16 14:05:51', 'product-2022041614055160807_ram_laptop_kingston_kvr32s22s6_4_4gb_1x4gb_ddr4_3200mhz.jpg', 'Thương hiệu: Kingston\r\nKiểu ram: DDR4,\r\nDung lượng: 4GB\r\nBus: 3200MHz', 0, '36 tháng', 400000, 1, 1),
(10, 'Ram laptop CORSAIR (CMSX8GX4M1A2666C18) 8GB (1x8GB) DDR4 2666MHz', 1, 10, 600000, 12, '2022-04-16 14:07:10', 'product-2022041614071046205_ram_laptop_corsair.jpg', 'Hãng: CORSAIR\r\nLoại RAM: SO-DIMM\r\nDung lượng: 8GB\r\nTần số truyền dữ liệu: 2666 MHz', 0, '36 tháng', 1200000, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `typeproduct`
--

CREATE TABLE `typeproduct` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `typeproduct`
--

INSERT INTO `typeproduct` (`id`, `name`) VALUES
(3, 'Bàn phím, chuột'),
(7, 'Linh, phụ kiện'),
(2, 'Màn hình'),
(4, 'Ổ Cứng'),
(5, 'Pin'),
(1, 'Ram'),
(6, 'Sạc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phoneNumber` (`phoneNumber`);

--
-- Indexes for table `accountrole`
--
ALTER TABLE `accountrole`
  ADD PRIMARY KEY (`accountId`,`roleId`),
  ADD KEY `roleId` (`roleId`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accountId` (`accountId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartId`,`productId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accountId` (`accountId`);

--
-- Indexes for table `invoicedetail`
--
ALTER TABLE `invoicedetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoiceId` (`invoiceId`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name` (`name`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accountId` (`accountId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `typeId` (`typeId`),
  ADD KEY `manufacturerId` (`manufacturerId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typeproduct`
--
ALTER TABLE `typeproduct`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `invoicedetail`
--
ALTER TABLE `invoicedetail`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `typeproduct`
--
ALTER TABLE `typeproduct`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accountrole`
--
ALTER TABLE `accountrole`
  ADD CONSTRAINT `accountrole_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `accountrole_ibfk_2` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `banner`
--
ALTER TABLE `banner`
  ADD CONSTRAINT `banner_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoicedetail`
--
ALTER TABLE `invoicedetail`
  ADD CONSTRAINT `invoicedetail_ibfk_1` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `typeproduct` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`manufacturerId`) REFERENCES `manufacturer` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
