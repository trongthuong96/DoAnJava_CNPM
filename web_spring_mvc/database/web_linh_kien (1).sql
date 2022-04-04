-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 04, 2022 at 12:35 AM
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
  `fullName` varchar(60) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `phoneNumber` varchar(10) DEFAULT NULL,
  `hide` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `email`, `password`, `fullName`, `address`, `birthday`, `phoneNumber`, `hide`) VALUES
(1, 'dotrongthuong8@gmail.com', '123', 'Đỗ Trọng Thưởng', 'Hóc Môn', '1996-11-21 09:15:56', '0355001184', 0);

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
  `productId` int NOT NULL,
  `accountId` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int NOT NULL,
  `accountId` int NOT NULL,
  `dateAdded` datetime NOT NULL,
  `dateDelivery` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `invoicedetail`
--

CREATE TABLE `invoicedetail` (
  `invoiceId` int NOT NULL,
  `productId` int NOT NULL,
  `quantity` int NOT NULL,
  `price` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`id`, `name`) VALUES
(5, 'Acer'),
(7, 'Amd'),
(2, 'Asus'),
(3, 'Dell'),
(10, 'Gigabyte'),
(4, 'Hp'),
(6, 'Intel'),
(13, 'Kingston'),
(8, 'Lenovo'),
(9, 'LG'),
(11, 'Microsoft'),
(12, 'MSI'),
(1, 'Samsung');

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
(3, 1, 'Giỏ hàng', NULL),
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
(1, 'Màn hình Laptop 14 inch', 2, 1, 1000000, 20, '2022-03-24 21:42:11', 'manhinh.jpg', 'Kích thước: 14 inch. Độ phân giải: 1366x768', NULL, '5 tháng', 1919000, 0, 0),
(2, 'Ram Laptop Kingston (KVR26S19S6/8 / KVR26S19S8/8) 8GB (1x8GB) DDR4 2666MHz', 1, 13, 500000, 2, '2022-03-24 21:55:01', 'RAM.jpg', 'Dòng Ram dành cho máy tính xách tay. Loại DDR4. Dung lượng 8Gb. Bus 2666Mhz', NULL, '36 tháng', 1049000, 0, 0),
(3, 'Ram Laptop Kingston (KVR32S22S8/16) 16GB (1x16GB) DDR4 3200Mhz', 1, 13, 600000, 2, '2022-03-24 21:55:01', 'RAM.jpg', 'Dòng Ram dành cho máy tính xách tay. Loại DDR4. Dung lượng 16Gb. Bus 3200Mhz', NULL, '36 tháng', 1999000, 0, 0),
(4, 'Sạc Laptop Dell 19V-4.74A 90W Chân kim to củ hình chữ nhật', 6, 3, 100000, 12, '2022-03-24 21:55:01', 'sac.jpg', NULL, NULL, '6 tháng', 299000, 0, 0),
(5, 'Adapter HP 18.5V - 3.5A (đầu đạn)', 6, 4, 100000, 10, '2022-03-31 02:16:48', 'sac.jpg', 'Adapter HP 18.5V - 3.5A (đầu đạn) - Adapter dùng cho máy tính xách tay HP - Compaq', 0, '6 tháng', 280000, 1, 1),
(6, 'Adapter HP 18.5V - 4.9A - 90W (chân kim)', 6, 4, 150000, 10, '2022-03-31 02:16:48', 'sac.jpg', 'Adapter HP 18.5V - 4.9A - 90W (chân kim)', 0, '6 tháng', 300000, 1, 1),
(7, 'Màn hình máy tính Acer R241YB (UM.QR1SS.B01) 23.8\"FHD IPS 75Hz', 2, 5, 2000000, 12, '2022-03-31 02:23:52', 'manhinh.jpg', 'Loại màn hình: Màn hình phẳng\r\nTỉ lệ: 16:9\r\nKích thước: 23.8 inch\r\nTấm nền: IPS', 0, '36 Tháng', 3999000, 1, 1),
(8, 'Màn hình LED Acer K202HQL - 19.5 inch LED (UM.IW3SS.009 )', 2, 5, 1000000, 12, '2022-03-31 02:23:52', 'manhinh.jpg', '* Kích thước: 19.5\" Wide Screen\r\n* Kiểu màn hình: LED\r\n* Độ phân giải: 1600 X 900; Độ sáng: 200 cd/m2.\r\n* Màu sắc hiển thị: 16.7M; Thời gian đáp ứng: 5 ms', 0, '36 tháng', 2590000, 1, 1);

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`productId`,`accountId`),
  ADD KEY `accountId` (`accountId`);

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
  ADD PRIMARY KEY (`invoiceId`,`productId`),
  ADD KEY `productId` (`productId`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoicedetail`
--
ALTER TABLE `invoicedetail`
  ADD CONSTRAINT `invoicedetail_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `invoicedetail_ibfk_2` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`);

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
