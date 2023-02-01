-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2023 at 05:52 AM
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

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `craft_id`, `uid`, `qty`) VALUES
(56, '190', '3', '1');

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
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `name`, `event_date`, `event_time`, `description`) VALUES
(29, 'Childrens Day', '14/2/2023', '10.am', 'This evennt is conducted by on behalf of childrens day, that day we have on stage and of stage performances, kids will be singing songs, and dance and speech. all are invited to our program.'),
(30, 'Annual Da', '12/2/2023', '10.am', 'All are welcome\n');

-- --------------------------------------------------------

--
-- Table structure for table `food_donation`
--

CREATE TABLE `food_donation` (
  `id` int(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `donor` varchar(255) NOT NULL,
  `food` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_donation`
--

INSERT INTO `food_donation` (`id`, `date`, `donor`, `food`) VALUES
(5, '12/3/2023', 'Deepika', 'Break fast'),
(6, '12/3/2023', 'Deepika', 'vgvb'),
(7, '12/3/2023', ' gchc', 'breakfast'),
(8, '2023-07-27', 'sanvi umesh', 'Lunch');

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
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `ac_no` varchar(255) NOT NULL,
  `total_amt` varchar(255) NOT NULL,
  `craft_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `name`, `bank`, `ac_no`, `total_amt`, `craft_id`) VALUES
(4, 'deepika', 'hdfc', '2323454546', '200', '190,200');

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
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

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
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `food_donation`
--
ALTER TABLE `food_donation`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
