-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2014 at 06:20 AM
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
  `Name` varchar(128) NOT NULL,
  `Address` varchar(256) NOT NULL,
  `email` varchar(128) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `insuranceType` int(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerID`, `Name`, `Address`, `email`, `phone`, `insuranceType`) VALUES
(1, 'Bob Jones', '48 Accent Ct, Sydney, 4002', 'bob@gmail.com', '0411112266', 1),
(2, 'Amy Adams', '99 Coolac Pl, Petrie, 4502', 'amy123@yahoo.com', '0411445599', 2),
(3, 'Jerry Smith', '123 Anzac Rd, Griffith, 4560', 'supercoolemail@microsoft.com', '0788889996', 3),
(4, 'Jacob Creek', 'Unit 5, 188 Creek St, No where, 6455', 'j_son321@gmail.com', '0458976377', 2);

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
CREATE TABLE IF NOT EXISTS `insurance` (
  `insuranceID` int(6) NOT NULL,
  `description` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`insuranceID`, `description`) VALUES
(1, 'None'),
(2, 'Partial'),
(3, 'Full');

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
  `price` double NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`partID`, `name`, `price`) VALUES
(1, 'RH Front Door', 155),
(2, 'RH Rear Door', 120),
(3, 'LH Front Door', 155),
(4, 'LH Rear Door', 120),
(5, 'Rear Bumper', 182.55),
(6, 'Front Bumper', 202),
(7, 'Windscreen', 342),
(8, 'Bootlid', 240.8),
(9, 'Engine Mount Set', 198),
(10, 'Lower Control Arm Bushings', 89.7),
(11, 'Brake Pad Set', 400),
(12, 'Steering Rack Boots', 35),
(13, 'Steering Rack', 865),
(14, 'Throwout Bearing Kit', 94),
(15, 'Water Pump', 321),
(16, 'Head Gasket Kit', 246),
(17, 'Intake Manifold', 260.99),
(18, 'Air Filter', 39.45),
(19, 'Fuel Filter', 66.82),
(20, 'MAP Sensor', 77.6),
(21, 'CV Boot Kit', 135),
(22, 'Muffler', 195);

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
 ADD PRIMARY KEY (`customerID`), ADD KEY `insuranceType` (`insuranceType`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
 ADD PRIMARY KEY (`insuranceID`);

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
MODIFY `customerID` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
-- Constraints for table `customers`
--
ALTER TABLE `customers`
ADD CONSTRAINT `insurace_fk_constraint` FOREIGN KEY (`insuranceType`) REFERENCES `insurance` (`insuranceID`);

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
