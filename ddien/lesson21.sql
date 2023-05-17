-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 27, 2020 at 05:50 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `image_library`
--

DROP TABLE IF EXISTS `image_library`;
CREATE TABLE IF NOT EXISTS `image_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image_library`
--

INSERT INTO `image_library` (`id`, `product_id`, `path`, `created_time`, `last_updated`) VALUES
(12, 20, 'uploads/21-04-2020/nike-air-max-270-x-supreme-red-do-nam-nu_(1).jpg', 1587486207, 1587486207),
(13, 20, 'uploads/21-04-2020/nike-air-max-270-x-supreme-red-do-nam-nu-1(1).jpg', 1587486375, 1587486375),
(14, 20, 'uploads/21-04-2020/nike-air-max-270-x-supreme-red-do-nam-nu-2(1).jpg', 1587486375, 1587486375),
(15, 20, 'uploads/21-04-2020/nike-air-max-270-x-supreme-red-do-nam-nu-4(1).jpg', 1587486375, 1587486375),
(16, 20, 'uploads/21-04-2020/nike-air-max-270-x-supreme-red-do-nam-nu-5(1).jpg', 1587486375, 1587486375),
(17, 20, 'uploads/21-04-2020/nike-air-max-270-x-supreme-red-do-nam-nu-3(1).jpg', 1587486397, 1587486397);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `link` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `parent_id`, `name`, `link`, `position`, `created_time`, `last_updated`) VALUES
(4, 0, 'Level 1', 'home2.php', 0, 1555232698, 1555232698),
(5, 4, 'Level 2', 'product.php', 1, 1555232976, 1555232976),
(6, 5, 'Level 3', 'product.php', 0, 1555232976, 1555232976),
(7, 6, 'Level 4', 'home.php', 0, 1555232976, 1555232976),
(8, 4, 'Level 2.2', 'product.php', 2, 1555232976, 1555232976),
(9, 8, 'Level 3.2', 'product.php', 1, 1555427808, 1555427808),
(10, 7, 'Level 5', 'home.php', 0, 1555427808, 1555427808),
(20, 17, 'Level 7', '#', 1, 1555542591, 1555542591),
(21, 16, 'Level 2.2.2', 'home2.php', 1, 1555232698, 1555232698),
(17, 10, 'Level 6', '#', 1, 1555542591, 1555542591),
(16, 0, 'Level 1.2', 'home2.php', 1, 1555232698, 1555232698);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  `note` text NOT NULL,
  `total` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `name`, `phone`, `address`, `note`, `total`, `created_time`, `last_updated`) VALUES
(29, 'Andn', '0654654615', 'Ha Noi', 'Ghi chu', 8290000, 1587872426, 1587872426);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_time`, `last_updated`) VALUES
(19, 29, 2, 1, 540000, 1587872426, 1587872426),
(20, 29, 18, 3, 1450000, 1587872426, 1587872426),
(21, 29, 20, 4, 850000, 1587872426, 1587872426);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `content` text NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `content`, `created_time`, `last_updated`) VALUES
(2, 'GiÃ y bÃ³ng Ä‘Ã¡ 1', 'uploads/06-03-2019/shoes-1.jpg', 540000, 'GiÃ y bÃ³ng Ä‘Ã¡ 1 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(3, 'GiÃ y bÃ³ng Ä‘Ã¡ 2', 'uploads/06-03-2019/shoes-2.jpg', 1500000, 'GiÃ y bÃ³ng Ä‘Ã¡ 2 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(4, 'GiÃ y bÃ³ng Ä‘Ã¡ 3', 'uploads/06-03-2019/shoes-3.jpg', 780000, 'GiÃ y bÃ³ng Ä‘Ã¡ 3 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(5, 'GiÃ y bÃ³ng Ä‘Ã¡ 4', 'uploads/06-03-2019/shoes-4.jpg', 657000, 'GiÃ y bÃ³ng Ä‘Ã¡ 4 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(6, 'GiÃ y bÃ³ng Ä‘Ã¡ 5', 'uploads/06-03-2019/shoes-5.jpg', 684000, 'GiÃ y bÃ³ng Ä‘Ã¡ 5 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(7, 'GiÃ y bÃ³ng Ä‘Ã¡ 6', 'uploads/06-03-2019/shoes-6.jpg', 580000, 'GiÃ y bÃ³ng Ä‘Ã¡ 6 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(8, 'GiÃ y bÃ³ng Ä‘Ã¡ 7', 'uploads/06-03-2019/shoes-7.jpg', 1320000, 'GiÃ y bÃ³ng Ä‘Ã¡ 7 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(9, 'GiÃ y bÃ³ng Ä‘Ã¡ 8', 'uploads/06-03-2019/shoes-8.jpg', 1450000, 'GiÃ y bÃ³ng Ä‘Ã¡ 8 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(10, 'GiÃ y thá»ƒ thao', 'uploads/06-03-2019/shoes-9.jpg', 1000000, '<p>Gi&agrave;y b&oacute;ng Ä‘&aacute; 9 s&acirc;n cá» nh&acirc;n táº¡o</p>\r\n', 1552615987, 1554822153),
(11, 'GiÃ y bÃ³ng Ä‘Ã¡ 1', 'uploads/06-03-2019/shoes-1.jpg', 540000, 'GiÃ y bÃ³ng Ä‘Ã¡ 1 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(12, 'GiÃ y bÃ³ng Ä‘Ã¡ 2', 'uploads/06-03-2019/shoes-2.jpg', 1500000, 'GiÃ y bÃ³ng Ä‘Ã¡ 2 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(13, 'GiÃ y bÃ³ng Ä‘Ã¡ 3', 'uploads/06-03-2019/shoes-3.jpg', 780000, 'GiÃ y bÃ³ng Ä‘Ã¡ 3 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(14, 'GiÃ y bÃ³ng Ä‘Ã¡ 4', 'uploads/06-03-2019/shoes-4.jpg', 657000, 'GiÃ y bÃ³ng Ä‘Ã¡ 4 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(15, 'GiÃ y bÃ³ng Ä‘Ã¡ 5', 'uploads/06-03-2019/shoes-5.jpg', 684000, 'GiÃ y bÃ³ng Ä‘Ã¡ 5 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(16, 'GiÃ y bÃ³ng Ä‘Ã¡ 6', 'uploads/06-03-2019/shoes-6.jpg', 580000, 'GiÃ y bÃ³ng Ä‘Ã¡ 6 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(17, 'GiÃ y bÃ³ng Ä‘Ã¡ 7', 'uploads/06-03-2019/shoes-7.jpg', 1320000, 'GiÃ y bÃ³ng Ä‘Ã¡ 7 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(18, 'GiÃ y bÃ³ng Ä‘Ã¡ 8', 'uploads/06-03-2019/shoes-8.jpg', 1450000, 'GiÃ y bÃ³ng Ä‘Ã¡ 8 sÃ¢n cá» nhÃ¢n táº¡o', 1552615987, 1552615987),
(20, 'Nike air max 270 X supreme Â red', 'uploads/21-04-2020/nike-air-max-270-x-supreme-red-do-nam-nu-3(1).jpg', 850000, '<p><span style=\"color:rgba(0, 0, 0, 0.8); font-family:roboto,helvetica neue,helvetica,arial,æ–‡æ³‰é©›æ­£é»‘,wenquanyi zen hei,hiragino sans gb,å„·é»‘ pro,lihei pro,heiti tc,å¾®è»Ÿæ­£é»‘é«”,microsoft jhenghei ui,microsoft jhenghei,sans-serif; font-size:14px\">#NIKE #Original #shoes #sneakers #airmax270 ã€100% originalã€‘ ã€Ready stockã€‘ </span></p>\r\n\r\n<p><span style=\"color:rgba(0, 0, 0, 0.8); font-family:roboto,helvetica neue,helvetica,arial,æ–‡æ³‰é©›æ­£é»‘,wenquanyi zen hei,hiragino sans gb,å„·é»‘ pro,lihei pro,heiti tc,å¾®è»Ÿæ­£é»‘é«”,microsoft jhenghei ui,microsoft jhenghei,sans-serif; font-size:14px\">ã€Do not know choose size, please contact customer service, 24 hours for your serviceã€‘</span></p>\r\n\r\n<p><span style=\"color:rgba(0, 0, 0, 0.8); font-family:roboto,helvetica neue,helvetica,arial,æ–‡æ³‰é©›æ­£é»‘,wenquanyi zen hei,hiragino sans gb,å„·é»‘ pro,lihei pro,heiti tc,å¾®è»Ÿæ­£é»‘é«”,microsoft jhenghei ui,microsoft jhenghei,sans-serif; font-size:14px\">Please read the following related instructions before purchasing. </span></p>\r\n\r\n<p><span style=\"color:rgba(0, 0, 0, 0.8); font-family:roboto,helvetica neue,helvetica,arial,æ–‡æ³‰é©›æ­£é»‘,wenquanyi zen hei,hiragino sans gb,å„·é»‘ pro,lihei pro,heiti tc,å¾®è»Ÿæ­£é»‘é«”,microsoft jhenghei ui,microsoft jhenghei,sans-serif; font-size:14px\">1. Once you have purchased the product, the stock will be shipped within 24 hours. </span></p>\r\n\r\n<p><span style=\"color:rgba(0, 0, 0, 0.8); font-family:roboto,helvetica neue,helvetica,arial,æ–‡æ³‰é©›æ­£é»‘,wenquanyi zen hei,hiragino sans gb,å„·é»‘ pro,lihei pro,heiti tc,å¾®è»Ÿæ­£é»‘é«”,microsoft jhenghei ui,microsoft jhenghei,sans-serif; font-size:14px\">2. Once you have purchased your product, we will ship it within 48 hours. ã€shipping timeã€‘ Delivery Time: 7 days delivery Busy: Delivered 7-10 days. Special day (holiday): 7-15 days When you accept the above suggestions, you can order in my store, thank you for your presence, like, and pay attention to this store, I will give you a small gift, I wish you a happy shopping! #nikeshoes #menshoes #sportshoes #sneakesnike #womenshoes</span></p>\r\n', 1587485911, 1587486397);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `birthday` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `fullname`, `password`, `birthday`, `created_time`, `last_updated`) VALUES
(1, 'admin', 'Andn', '25d55ad283aa400af464c76d713c07ad', 123, 123, 1553185530);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `image_library`
--
ALTER TABLE `image_library`
  ADD CONSTRAINT `image_library_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
