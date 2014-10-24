-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2014 at 04:34 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `servicing_our_autos`
--
CREATE DATABASE IF NOT EXISTS `servicing_our_autos` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `servicing_our_autos`;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
`customerID` int(6) NOT NULL,
  `name` varchar(128) NOT NULL,
  `address` varchar(256) NOT NULL,
  `email` varchar(128) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `insuranceCover` int(3) NOT NULL DEFAULT '0' COMMENT 'As a percentage (0-100)'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerID`, `name`, `address`, `email`, `phone`, `insuranceCover`) VALUES
(1, 'Bob Jones', '48 Accent Ct, Sydney, 4002', 'bob@gmail.com', '0411112266', 0),
(2, 'Amy Adams', '99 Coolac Pl, Petrie, 4502', 'amy123@yahoo.com', '0411445599', 100),
(3, 'Jerry Smith', '123 Anzac Rd, Griffith, 4560', 'supercoolemail@microsoft.com', '0788889996', 35),
(4, 'Jacob Creek', 'Unit 5, 188 Creek St, No where, 6455', 'j_son321@gmail.com', '0458976377', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
`jobID` int(6) NOT NULL,
  `customerID` int(6) NOT NULL,
  `vehicleID` int(6) NOT NULL,
  `workID` int(6) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalCost` double DEFAULT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
CREATE TABLE IF NOT EXISTS `parts` (
`partID` int(6) NOT NULL,
  `name` varchar(128) NOT NULL,
  `price` double NOT NULL,
  `instock` tinyint(1) NOT NULL DEFAULT '1',
  `waittime` varchar(2) NOT NULL DEFAULT '0' COMMENT 'in days'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`partID`, `name`, `price`, `instock`, `waittime`) VALUES
(1, 'RH Front Door', 155, 1, '2'),
(2, 'RH Rear Door', 120, 1, '2'),
(3, 'LH Front Door', 155, 1, '4'),
(4, 'LH Rear Door', 120, 1, '1'),
(5, 'Rear Bumper', 182.55, 1, '6'),
(6, 'Front Bumper', 202, 1, '2'),
(7, 'Windscreen', 342, 0, '2'),
(8, 'Bootlid', 240.8, 1, '10'),
(9, 'Engine Mount Set', 198, 1, '4'),
(10, 'Lower Control Arm Bushings', 89.7, 1, '3'),
(11, 'Brake Pad Set', 400, 1, '1'),
(12, 'Steering Rack Boots', 35, 0, '4'),
(13, 'Steering Rack', 865, 1, '6'),
(14, 'Throwout Bearing Kit', 94, 1, '6'),
(15, 'Water Pump', 321, 1, '9'),
(16, 'Head Gasket Kit', 246, 1, '16'),
(17, 'Intake Manifold', 260.99, 1, '4'),
(18, 'Air Filter', 39.45, 1, '5'),
(19, 'Fuel Filter', 66.82, 1, '1'),
(20, 'MAP Sensor', 77.6, 1, '9'),
(21, 'CV Boot Kit', 135, 1, '3'),
(22, 'Muffler', 195, 1, '2');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
`vehicleID` int(6) NOT NULL,
  `make` varchar(128) NOT NULL,
  `model` varchar(128) NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`vehicleID`, `make`, `model`, `year`) VALUES
(1, 'Toyota', '86', 2012),
(2, 'Toyota', 'Camry', 1996),
(3, 'Holden', 'Commodore', 2002),
(4, 'Mazda', '323', 1986),
(5, 'Mazda', '6', 2009),
(6, 'Mazda', 'Tribute', 2002),
(7, 'Mazda', 'Tribute', 2003),
(8, 'Mazda', 'Tribute', 2008),
(9, 'Subaru', 'WRX', 2001),
(10, 'Subaru', 'WRX', 2002),
(11, 'Subaru', 'Liberty', 1993),
(12, 'Honda', 'Accord', 2000),
(13, 'Nissan', 'Pathfinder', 1999),
(14, 'Toyota', 'Landcruiser', 1986),
(15, 'Toyota', 'Landcruiser', 2005);

-- --------------------------------------------------------

--
-- Table structure for table `worktypes`
--

DROP TABLE IF EXISTS `worktypes`;
CREATE TABLE IF NOT EXISTS `worktypes` (
`workID` int(6) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `price` double NOT NULL,
  `partsNeeded` varchar(128) DEFAULT NULL COMMENT 'Comma separated integers'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `worktypes`
--

INSERT INTO `worktypes` (`workID`, `name`, `description`, `price`, `partsNeeded`) VALUES
(1, 'Minor Service', 'Oil change, Brake Pads, General Driveline Inspection, Air/Fuel Filter Change', 288, '11,18,19'),
(2, 'Major Service', 'Minor Service + Engine Mounts, Steering Rack Boots, LCA Bushings, Wheel Alignment', 674.4, '11,18,19,9,10,12'),
(3, 'Rear End Collision Repair', 'Inclues driveline inspection, does not include paint', 1890, '2,4,5,22'),
(4, 'Replace CV Boots', NULL, 144, '21'),
(5, 'Replace Windscreen', 'Privacy glass used only if included from factory', 120, '7'),
(6, 'Wheel Alignment', '4 Wheel Alignment + Tyre Rotate & Balance', 80, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
 ADD PRIMARY KEY (`customerID`), ADD KEY `insuranceType` (`insuranceCover`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
 ADD PRIMARY KEY (`jobID`), ADD KEY `customerID` (`customerID`), ADD KEY `carID` (`vehicleID`), ADD KEY `workID` (`workID`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
 ADD PRIMARY KEY (`partID`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
 ADD PRIMARY KEY (`vehicleID`);

--
-- Indexes for table `worktypes`
--
ALTER TABLE `worktypes`
 ADD PRIMARY KEY (`workID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
MODIFY `customerID` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
MODIFY `jobID` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `parts`
--
ALTER TABLE `parts`
MODIFY `partID` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
MODIFY `vehicleID` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `worktypes`
--
ALTER TABLE `worktypes`
MODIFY `workID` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
ADD CONSTRAINT `customer_fk_constraint` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`),
ADD CONSTRAINT `vehicle_fk_constraint` FOREIGN KEY (`vehicleID`) REFERENCES `vehicles` (`vehicleID`),
ADD CONSTRAINT `worktype_fk_constraint` FOREIGN KEY (`workID`) REFERENCES `worktypes` (`workID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
