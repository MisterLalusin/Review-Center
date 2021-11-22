-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 19, 2021 at 08:41 AM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbreviewcenter`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblquestions`
--

CREATE TABLE `tblquestions` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `question_text` varchar(255) NOT NULL,
  `question_img` varchar(255) DEFAULT NULL,
  `question_type` varchar(255) NOT NULL,
  `ans_a` varchar(255) DEFAULT '',
  `ans_b` varchar(255) DEFAULT '',
  `ans_c` varchar(255) DEFAULT '',
  `ans_d` varchar(255) DEFAULT '',
  `ans_a_img` varchar(255) DEFAULT NULL,
  `ans_b_img` varchar(255) DEFAULT NULL,
  `ans_c_img` varchar(255) DEFAULT NULL,
  `ans_d_img` varchar(255) DEFAULT NULL,
  `ans_correct` varchar(255) NOT NULL,
  `posted_by` varchar(255) NOT NULL,
  `deleted` varchar(255) DEFAULT 'false',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblquestions`
--
ALTER TABLE `tblquestions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblquestions`
--
ALTER TABLE `tblquestions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
