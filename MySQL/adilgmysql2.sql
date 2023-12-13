-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 15, 2023 at 11:27 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adilgmysql`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `Category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `Category_name`) VALUES
(1, 'cat1'),
(2, 'cat2'),
(3, 'cat3');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `orders_idoders` int(10) UNSIGNED ZEROFILL NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `orders_idoders`, `first_name`, `last_name`) VALUES
(1, 0000000011, 'Chuck', 'Norris'),
(2, 0000000022, 'Charlize', 'Theron'),
(3, 0000000033, 'Ryan', 'Gosling');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `quantity`, `date`, `name`, `first_name`, `last_name`) VALUES
(1, 1, '2023-09-15', 'A1', 'Chuck', 'Norris'),
(2, 2, '2023-09-15', 'B3', 'Chuck', 'Norris'),
(3, 1, '2023-09-14', 'F1', 'Chuck', 'Norris'),
(4, 2, '2023-09-15', 'E2', 'Chuck', 'Norris'),
(5, 1, '2023-09-12', 'A1', 'Charlize', 'Theron'),
(6, 1, '2023-09-12', 'E2', 'Charlize', 'Theron'),
(7, 2, '2023-09-12', 'B3', 'Charlize', 'Theron'),
(8, 1, '2023-09-12', 'F1', 'Charlize', 'Theron'),
(9, 1, '2023-09-15', 'A1', 'Charlize', 'Theron'),
(10, 1, '2023-09-15', 'F3', 'Charlize', 'Theron');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `orders_id` int(11) NOT NULL,
  `product_id` varchar(45) NOT NULL,
  `quantity` int(11) NOT NULL,
  `date` date NOT NULL,
  `total` float NOT NULL,
  `name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `weight` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `order_products_orders_id` int(11) NOT NULL,
  `order_products_product_id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `description` varchar(300) NOT NULL,
  `price` double UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL,
  `available` tinyint(1) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `order_products_orders_id`, `order_products_product_id`, `name`, `quantity`, `description`, `price`, `weight`, `available`, `category`) VALUES
(1, 1001, '1002', 'A1', 10, '', 2800, 50, 1, 'cat1'),
(2, 1002, '1003', 'A2', 10, 'Grimoire de trolls', 100, 1, 1, 'cat1'),
(3, 1003, '1004', 'B1', 1, '', 10, 0.5, 1, 'cat1'),
(4, 1004, '1005', 'B2', 1, '', 10, 0.5, 1, 'cat1'),
(5, 1005, '1006', 'C1', 1, '', 10, 0.5, 1, 'cat1'),
(6, 1006, '1007', 'C2', 1, '', 10, 0.5, 1, 'cat1'),
(7, 1007, '1008', 'D1', 0, '', 13, 0.5, 1, 'cat2'),
(8, 1008, '1009', 'D2', 0, '', 13, 0.5, 1, 'cat2'),
(9, 1009, '1010', 'E1', 2, '', 50, 1.2, 1, 'cat2'),
(10, 1010, '1011', 'E2', 2, '', 50, 1.2, 1, 'cat2'),
(11, 1011, '1012', 'F1', 5, '', 500, 1.2, 1, 'cat3'),
(12, 1012, '1013', 'F2', 5, '', 500, 1.2, 1, 'cat3'),
(13, 1013, '1014', 'F3', 5, '', 500, 1.2, 1, 'cat3');

-- --------------------------------------------------------

--
-- Table structure for table `timestamps`
--

CREATE TABLE `timestamps` (
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`orders_id`,`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
