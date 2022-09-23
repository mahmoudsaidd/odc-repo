-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2022 at 05:14 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `odc`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Course_ID` int(11) NOT NULL,
  `course_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Course_ID`, `course_name`) VALUES
(1, 'Backend');

-- --------------------------------------------------------

--
-- Table structure for table `government`
--

CREATE TABLE `government` (
  `Gov_ID` int(11) NOT NULL,
  `gov_name` varchar(200) NOT NULL,
  `Insturactor` varchar(200) NOT NULL,
  `Course_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `government`
--

INSERT INTO `government` (`Gov_ID`, `gov_name`, `Insturactor`, `Course_ID`) VALUES
(1, 'Alexandria', 'Mohamed Amr', 1),
(2, 'Cairo', 'Amr Mohamed', 1),
(3, 'Aswan', 'Hisham Medhat', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Student_ID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Phone` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Birth_Date` date NOT NULL,
  `Faculty` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `admin` int(11) NOT NULL DEFAULT 0,
  `Gov_ID` int(11) NOT NULL,
  `Course_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_ID`, `Name`, `Phone`, `Email`, `Birth_Date`, `Faculty`, `password`, `admin`, `Gov_ID`, `Course_ID`) VALUES
(4, 'Rowida', '01001238123', 'rowida@gmail.com', '2002-12-30', 'FOE', 'rowida', 0, 3, 1),
(5, 'Nouran', '01224840515', 'nouran@gmail.com', '2002-10-10', 'Math', 'nouran', 0, 3, 1),
(6, 'Mahmoud', '01224842345', 'mahmoud@gmail.com', '2001-10-10', 'CS', 'mahmoud', 0, 2, 1),
(8, 'Sara', '0110115878', 'sara@gmail.com', '2002-01-01', 'Commerce', 'sara', 0, 1, 1),
(9, 'Hisham', '01208205900', 'hisham@gmail.com', '2001-11-30', 'CS', 'hisham', 1, 1, 1),
(10, 'Mostafa', '01015666004', 'mostafa@gmail.com', '2002-11-30', 'CS', 'mostafa', 0, 1, 1),
(12, 'Ahmed', '01012312312', 'ahmed@gmail.com', '1995-05-05', 'BIS', 'ahmed', 0, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_ID`);

--
-- Indexes for table `government`
--
ALTER TABLE `government`
  ADD PRIMARY KEY (`Gov_ID`),
  ADD KEY `Course_ID` (`Course_ID`) USING BTREE;

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_ID`),
  ADD KEY `Gov_ID` (`Gov_ID`) USING BTREE,
  ADD KEY `Course_ID` (`Course_ID`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `government`
--
ALTER TABLE `government`
  MODIFY `Gov_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `Student_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `government`
--
ALTER TABLE `government`
  ADD CONSTRAINT `government_ibfk_1` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Gov_ID`) REFERENCES `government` (`Gov_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
