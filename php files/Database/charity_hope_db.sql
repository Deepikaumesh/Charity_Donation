-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2023 at 07:30 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `charity_hope_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(255) NOT NULL,
  `craft_id` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `craft`
--

CREATE TABLE `craft` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `craft_id` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `craft`
--

INSERT INTO `craft` (`id`, `name`, `craft_id`, `price`, `description`, `image`) VALUES
(12, ' Flower Basket ', '190', '50', 'This flower basket is very beautiful, created by our kids.', 'http://192.168.29.64/MySampleApp/Charity_Hope/image_uploaded/image_picker8947974011031284894.jpg'),
(13, ' Baby doll ', '200', '100', 'fhcihojoj', 'http://192.168.29.64/MySampleApp/Charity_Hope/image_uploaded/image_picker967237069671997413.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `account` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`id`, `name`, `place`, `phone`, `amount`, `bank`, `account`) VALUES
(1, 'john', 'kannur', '9898090909', '10000', 'hdfc', '123456799'),
(2, 'fdfd', 'dcc', 'fv', 'vfcv', 'ujujn', 'nhnhgb'),
(3, 'uvuv', '838368686', '386850', 'uh cg g ', 'h b h', 'bchvy'),
(4, 'fdfd', 'dcc', 'fv', 'vfcv', 'ujujn', 'nhnhgb'),
(5, 'yrhr', 'ed heh', '5949', 'svsb', 'vsb', 'b sd nf');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `event_date` varchar(255) NOT NULL,
  `event_time` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `name`, `event_date`, `event_time`, `description`, `uid`) VALUES
(43, 'B Hv', '90686', 'hchc', 'h b mnlnjvgdb bdydy\n\n', '4'),
(44, 'Uguffy', '3538', 'cvg', ' c\n', 'admin'),
(45, 'Ieh', '29986', 'sbbh', 'vdhxhdu\n', 'admin'),
(46, 'Vg', '2023-02-17', 'gg', 'vv\n', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `food_donation`
--

CREATE TABLE `food_donation` (
  `id` int(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `donor` varchar(255) NOT NULL,
  `food` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_donation`
--

INSERT INTO `food_donation` (`id`, `date`, `donor`, `food`, `uid`) VALUES
(8, '2023-07-27', 'sanvi umesh', 'Lunch', '3'),
(12, '2023-02-23', 'gg', 'Vgh', '3'),
(13, '2023-02-09', 'ggh', 'Vvgg', '4');

-- --------------------------------------------------------

--
-- Table structure for table `gust`
--

CREATE TABLE `gust` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gust`
--

INSERT INTO `gust` (`id`, `username`, `email`, `phone`, `password`) VALUES
(1, 'gust', 'gust@gmail.com', '9638527415', 'gg');

-- --------------------------------------------------------

--
-- Table structure for table `hope_admin_registration`
--

CREATE TABLE `hope_admin_registration` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hope_admin_registration`
--

INSERT INTO `hope_admin_registration` (`id`, `username`, `email`, `phone`, `password`) VALUES
(65, 'admin', 'gbhn', 'gg', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `hope_user_registration`
--

CREATE TABLE `hope_user_registration` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hope_user_registration`
--

INSERT INTO `hope_user_registration` (`id`, `username`, `email`, `phone`, `password`) VALUES
(3, 'user', 'cfc@gmail.com', '9874561239', 'user'),
(4, 'user2', 'user2@gmail.com', '989809098', 'user2');

-- --------------------------------------------------------

--
-- Table structure for table `order_items_tb`
--

CREATE TABLE `order_items_tb` (
  `id` int(255) NOT NULL,
  `craft_id` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_tb`
--

CREATE TABLE `order_tb` (
  `order_id` int(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `order_date` varchar(255) NOT NULL,
  `total_amt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_tb`
--

INSERT INTO `order_tb` (`order_id`, `uid`, `order_date`, `total_amt`) VALUES
(1, '3', '16/02/2023', '150.0'),
(2, '3', '16/02/2023', '20'),
(3, '3', '16/02/2023', '20'),
(4, '3', '16/02/2023', '20');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `ac_no` varchar(255) NOT NULL,
  `total_amt` varchar(255) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `name`, `phone`, `bank`, `ac_no`, `total_amt`, `order_id`, `uid`) VALUES
(6, 'deepika', '9090', 'hdfc', '123', '20', '2', '3'),
(7, 'deepika', '9090', 'hdfc', '123', '20', '3', '3'),
(8, 'deepika', '9090', 'hdfc', '123', '20', '4', '3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft`
--
ALTER TABLE `craft`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_donation`
--
ALTER TABLE `food_donation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gust`
--
ALTER TABLE `gust`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hope_admin_registration`
--
ALTER TABLE `hope_admin_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hope_user_registration`
--
ALTER TABLE `hope_user_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items_tb`
--
ALTER TABLE `order_items_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_tb`
--
ALTER TABLE `order_tb`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `craft`
--
ALTER TABLE `craft`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `donation`
--
ALTER TABLE `donation`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `food_donation`
--
ALTER TABLE `food_donation`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `gust`
--
ALTER TABLE `gust`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hope_admin_registration`
--
ALTER TABLE `hope_admin_registration`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `hope_user_registration`
--
ALTER TABLE `hope_user_registration`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_items_tb`
--
ALTER TABLE `order_items_tb`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_tb`
--
ALTER TABLE `order_tb`
  MODIFY `order_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
