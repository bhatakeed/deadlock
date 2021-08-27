-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2021 at 06:22 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure` ()  BEGIN
declare continue handler for sqlwarning,sqlexception
begin
show errors;
rollback;
end;

start transaction;
SELECT bal INTO @bal FROM test.test ORDER BY id DESC LIMIT 1 LOCK IN SHARE MODE;
INSERT INTO test.test(bal,et)VALUE(@bal+1,1);
commit;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE `balance` (
  `id` int(1) NOT NULL,
  `bal` int(111) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balance`
--

INSERT INTO `balance` (`id`, `bal`, `dt`) VALUES
(1, 10, '2021-08-26 16:38:10'),
(2, 11, '2021-08-26 16:38:19'),
(3, 12, '2021-08-26 16:38:19'),
(4, 13, '2021-08-26 16:38:19'),
(6, 14, '2021-08-26 16:38:19'),
(8, 15, '2021-08-26 16:38:19'),
(9, 16, '2021-08-26 16:38:19'),
(10, 17, '2021-08-26 16:58:46'),
(13, 18, '2021-08-26 16:58:46'),
(14, 19, '2021-08-26 16:58:46'),
(15, 20, '2021-08-26 16:58:46'),
(17, 21, '2021-08-26 16:58:46'),
(21, 22, '2021-08-26 16:59:12'),
(22, 23, '2021-08-26 16:59:12'),
(23, 24, '2021-08-26 16:59:12'),
(24, 24, '2021-08-26 16:59:12'),
(25, 25, '2021-08-26 16:59:12'),
(26, 25, '2021-08-26 16:59:12'),
(27, 25, '2021-08-26 16:59:12'),
(28, 25, '2021-08-26 16:59:12'),
(29, 25, '2021-08-26 16:59:12'),
(30, 25, '2021-08-26 16:59:12'),
(31, 26, '2021-08-26 16:59:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balance`
--
ALTER TABLE `balance`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `balance`
--
ALTER TABLE `balance`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
