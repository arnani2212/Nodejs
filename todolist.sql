-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2021 at 12:28 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todolist`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `code`, `username`, `password`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'qyhKOmi3', 'clerk', 'PaSSWoRD', '2021-04-21 07:54:14', '2021-04-21 12:28:15', '2021-04-21 23:51:56'),
(2, 'UkJCK0M7', 'new2', '$2b$10$4gSB6WGSVmWWBaHqJ7T9VOuoOasN0gjDjOW3st9/UH0WFv8g0MTkW', '2021-04-22 00:23:23', '2021-04-22 00:23:23', NULL),
(5, 'sloVG36L', 'new3', '$2b$10$.mSrtQz09PgpXMYhHbQWPuAhznN.9bOl6bi.HEIcZz0Bm8cdHoFL.', '2021-04-22 00:25:46', '2021-04-22 00:25:46', NULL),
(6, '5pomRA9Q', 'new4', '$2b$10$SRsFHR/JQRKL1Hxw0Ri4vezOIXf.cqEAVS00XbM9.qRZyWER1iJbK', '2021-04-22 08:29:36', '2021-04-22 08:29:36', NULL),
(7, '4qadUGaL', 'arnani', '$2b$10$Bmlq4tc0CxsYc1fjS7wYaeEgcRtep1A.bVagEmLRqi1jQwB.XTgSG', '2021-04-22 08:33:13', '2021-04-22 08:33:13', NULL),
(8, 'jJnOd3ze', 'mami', '$2b$10$f4k0iPcwYikKdeNQMUMII.loF4TXq4uVdMCKwtu7Wm.Pc5FqEQLXK', '2021-04-22 08:34:46', '2021-04-22 08:34:46', NULL),
(9, 'zuHSXXWB', 'nani', '$2b$10$geCDWyYxt1DbzMlb0/uwjOXKcdA4YBkaYUruS3qXLUbp7TsSz3xAa', '2021-04-22 08:37:22', '2021-04-22 08:37:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20210421074825-create_accounts_table.js'),
('20210422090612-create_tasks_table.js'),
('20210422091336-create_tasks_table.js');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) NOT NULL,
  `account_code` varchar(255) NOT NULL,
  `task` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `createdAt` datetime NOT NULL,
  `completedAt` datetime DEFAULT NULL,
  `updatedAt` date NOT NULL,
  `deletedAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `account_code`, `task`, `status`, `createdAt`, `completedAt`, `updatedAt`, `deletedAt`) VALUES
(1, '4qadUGaL', 'loving', 'pending', '2021-04-23 00:13:14', NULL, '2021-04-22', '2021-04-22'),
(3, '4qadUGaL', 'walking', 'pending', '2021-04-22 17:34:51', NULL, '2021-04-23', '0000-00-00'),
(4, '4qadUGaL', 'surfing', 'pending', '2021-04-22 17:36:18', NULL, '2021-04-22', '2021-04-23'),
(5, '4qadUGaL', 'loving', 'pending', '2021-04-22 17:39:27', NULL, '2021-04-22', '2021-04-22'),
(6, '4qadUGaL', 'surfing', 'pending', '2021-04-22 17:39:38', NULL, '2021-04-22', '0000-00-00'),
(7, '4qadUGaL', 'surfing', 'pending', '2021-04-22 17:40:33', NULL, '2021-04-22', '0000-00-00'),
(8, '4qadUGaL', 'afawf', 'pending', '2021-04-22 17:49:38', NULL, '2021-04-22', '0000-00-00'),
(9, '4qadUGaL', 'playing', 'pending', '2021-04-23 09:56:18', NULL, '2021-04-23', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
