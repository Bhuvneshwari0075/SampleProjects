-- phpMyAdmin SQL Dump
-- version 5.2.0-rc1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2024 at 06:29 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `javaprojecttables`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` int(11) NOT NULL,
  `description` varchar(80) NOT NULL,
  `productTitle` varchar(15) NOT NULL,
  `image` varchar(200) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `description`, `productTitle`, `image`, `price`) VALUES
(1, 'very good shoe', 'Nike Shoe', 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D', 85),
(2, 'very nice balloons', 'Balloons', 'https://img.freepik.com/premium-photo/3d-render-black-balloons-black-background_161488-965.jpg', 10),
(3, 'Beauty products', 'Renee Lipsticks', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwxUaYkfNbM0lg6wsPzIeoPaTq5tIupKADKQ&usqp=CAU', 40),
(4, 'Smart watches corner', 'Smart watches', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZUl9ehBEwPmEKBPc8n3NIeLi2vYLcjAzwaA&usqp=CAU', 35),
(5, 'Gym wrist bands', 'Wrist Bands', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP5Qi6DfNuNQrXbnPZFxCKMVSNe_ItufY7vA&usqp=CAU', 10),
(6, 'Diwali gifts', 'Echo Spot', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPG_ppC3ao2KaC3utbD4lFcog1ZcnqiearhA&usqp=CAU', 60),
(7, 'Comfy chair', 'Chair and Table', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRN36ADS8_XrEQgkdImR5JPqFfNEnsf0MQOTg&usqp=CAU', 200),
(8, 'Garden accessories', 'Succulent Plant', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQX0zb1Okl85yaTPKsKWgPiMpAzWeTJh7vBUg&usqp=CAU', 30),
(9, 'Apps & Games', 'Netflix', 'https://i.pcmag.com/imagery/reviews/05cItXL96l4LE9n02WfDR0h-5.fit_scale.size_760x427.v1582751026.png', 7),
(10, 'Tesla Model S', 'Tesla', 'https://stimg.cardekho.com/images/carexteriorimages/930x620/Tesla/Model-S/5252/1611840999494/front-left-side-47.jpg', 94990);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `productId_fkk` (`productId`),
  ADD KEY `userId_fkkk` (`userId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD KEY `userId_fk` (`userId`),
  ADD KEY `productId_fk` (`productId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `productId_fkk` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`),
  ADD CONSTRAINT `userId_fkkk` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `productId_fk` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`),
  ADD CONSTRAINT `userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
