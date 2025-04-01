-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2025 at 05:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paysync`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_id` varchar(10) NOT NULL,
  `NIC` varchar(20) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `District_id` varchar(5) DEFAULT NULL,
  `Created_By` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_tele`
--

CREATE TABLE `admin_tele` (
  `Admin_id` varchar(10) NOT NULL,
  `Tele_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `approved_loan`
--

CREATE TABLE `approved_loan` (
  `A_Id` int(11) NOT NULL,
  `Loan_id` int(11) DEFAULT NULL,
  `Paid_amount` decimal(10,2) NOT NULL,
  `Receipt` varchar(255) DEFAULT NULL,
  `Approved_date` date NOT NULL,
  `Status` enum('Active','Closed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `Client_id` varchar(15) NOT NULL,
  `NIC` varchar(20) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `ID_photo` varchar(255) DEFAULT NULL,
  `Created_By` varchar(15) DEFAULT NULL,
  `Registration_status` enum('Pending','Approved','Rejected') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_tele`
--

CREATE TABLE `client_tele` (
  `Client_id` varchar(15) NOT NULL,
  `Tele_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `district_id` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `region_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guarantors`
--

CREATE TABLE `guarantors` (
  `Guarantor_id` int(11) NOT NULL,
  `Client_id` varchar(15) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `NIC` varchar(20) NOT NULL,
  `Document` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `installment`
--

CREATE TABLE `installment` (
  `Installment_id` int(11) NOT NULL,
  `Client_id` varchar(15) DEFAULT NULL,
  `Payment_id` int(11) DEFAULT NULL,
  `Due_date` date NOT NULL,
  `Late_fee` decimal(10,2) DEFAULT NULL,
  `Paid_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_application`
--

CREATE TABLE `loan_application` (
  `Loan_id` int(11) NOT NULL,
  `Product_details` text NOT NULL,
  `Tele_number` varchar(20) DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Time_period` int(11) NOT NULL,
  `Monthly_installment` decimal(10,2) NOT NULL,
  `Verified_by` varchar(15) DEFAULT NULL,
  `Approved_date` date DEFAULT NULL,
  `Status` enum('Approved','Pending','Rejected') NOT NULL,
  `Applied_by` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_id` int(11) NOT NULL,
  `Loan_id` int(11) DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Monthly_installment` decimal(10,2) NOT NULL,
  `Paid_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_slips`
--

CREATE TABLE `payment_slips` (
  `Payment_id` int(11) DEFAULT NULL,
  `slip_id` int(11) NOT NULL,
  `Slip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_id` int(11) NOT NULL,
  `Loan_id` int(11) DEFAULT NULL,
  `Product_details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `region_id` varchar(10) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rejected_loan`
--

CREATE TABLE `rejected_loan` (
  `R_id` int(11) NOT NULL,
  `Loan_id` int(11) DEFAULT NULL,
  `Rejected_date` date NOT NULL,
  `Reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_id` varchar(15) NOT NULL,
  `NIC` varchar(20) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `Created_by` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_region`
--

CREATE TABLE `staff_region` (
  `Staff_id` varchar(15) NOT NULL,
  `Region_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_tele`
--

CREATE TABLE `staff_tele` (
  `Staff_id` varchar(15) NOT NULL,
  `Tele_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_id`),
  ADD UNIQUE KEY `NIC` (`NIC`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD KEY `District_id` (`District_id`),
  ADD KEY `Created_By` (`Created_By`);

--
-- Indexes for table `admin_tele`
--
ALTER TABLE `admin_tele`
  ADD PRIMARY KEY (`Admin_id`,`Tele_number`);

--
-- Indexes for table `approved_loan`
--
ALTER TABLE `approved_loan`
  ADD PRIMARY KEY (`A_Id`),
  ADD KEY `Loan_id` (`Loan_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Client_id`),
  ADD UNIQUE KEY `NIC` (`NIC`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD KEY `Created_By` (`Created_By`);

--
-- Indexes for table `client_tele`
--
ALTER TABLE `client_tele`
  ADD PRIMARY KEY (`Client_id`,`Tele_number`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`district_id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indexes for table `guarantors`
--
ALTER TABLE `guarantors`
  ADD PRIMARY KEY (`Guarantor_id`),
  ADD UNIQUE KEY `NIC` (`NIC`),
  ADD KEY `Client_id` (`Client_id`);

--
-- Indexes for table `installment`
--
ALTER TABLE `installment`
  ADD PRIMARY KEY (`Installment_id`),
  ADD KEY `Client_id` (`Client_id`),
  ADD KEY `Payment_id` (`Payment_id`);

--
-- Indexes for table `loan_application`
--
ALTER TABLE `loan_application`
  ADD PRIMARY KEY (`Loan_id`),
  ADD KEY `Verified_by` (`Verified_by`),
  ADD KEY `Applied_by` (`Applied_by`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_id`),
  ADD KEY `Loan_id` (`Loan_id`);

--
-- Indexes for table `payment_slips`
--
ALTER TABLE `payment_slips`
  ADD PRIMARY KEY (`slip_id`),
  ADD KEY `Payment_id` (`Payment_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_id`),
  ADD KEY `Loan_id` (`Loan_id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`);

--
-- Indexes for table `rejected_loan`
--
ALTER TABLE `rejected_loan`
  ADD PRIMARY KEY (`R_id`),
  ADD KEY `Loan_id` (`Loan_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_id`),
  ADD UNIQUE KEY `NIC` (`NIC`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD KEY `Created_by` (`Created_by`);

--
-- Indexes for table `staff_region`
--
ALTER TABLE `staff_region`
  ADD PRIMARY KEY (`Staff_id`,`Region_id`),
  ADD KEY `Region_id` (`Region_id`);

--
-- Indexes for table `staff_tele`
--
ALTER TABLE `staff_tele`
  ADD PRIMARY KEY (`Staff_id`,`Tele_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `approved_loan`
--
ALTER TABLE `approved_loan`
  MODIFY `A_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guarantors`
--
ALTER TABLE `guarantors`
  MODIFY `Guarantor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `installment`
--
ALTER TABLE `installment`
  MODIFY `Installment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_application`
--
ALTER TABLE `loan_application`
  MODIFY `Loan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_slips`
--
ALTER TABLE `payment_slips`
  MODIFY `slip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rejected_loan`
--
ALTER TABLE `rejected_loan`
  MODIFY `R_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`District_id`) REFERENCES `district` (`district_id`),
  ADD CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`Created_By`) REFERENCES `admin` (`Admin_id`);

--
-- Constraints for table `admin_tele`
--
ALTER TABLE `admin_tele`
  ADD CONSTRAINT `admin_tele_ibfk_1` FOREIGN KEY (`Admin_id`) REFERENCES `admin` (`Admin_id`);

--
-- Constraints for table `approved_loan`
--
ALTER TABLE `approved_loan`
  ADD CONSTRAINT `approved_loan_ibfk_1` FOREIGN KEY (`Loan_id`) REFERENCES `loan_application` (`Loan_id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`Created_By`) REFERENCES `staff` (`Staff_id`);

--
-- Constraints for table `client_tele`
--
ALTER TABLE `client_tele`
  ADD CONSTRAINT `client_tele_ibfk_1` FOREIGN KEY (`Client_id`) REFERENCES `client` (`Client_id`);

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `district_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `guarantors`
--
ALTER TABLE `guarantors`
  ADD CONSTRAINT `guarantors_ibfk_1` FOREIGN KEY (`Client_id`) REFERENCES `client` (`Client_id`);

--
-- Constraints for table `installment`
--
ALTER TABLE `installment`
  ADD CONSTRAINT `installment_ibfk_1` FOREIGN KEY (`Client_id`) REFERENCES `client` (`Client_id`),
  ADD CONSTRAINT `installment_ibfk_2` FOREIGN KEY (`Payment_id`) REFERENCES `payment` (`Payment_id`);

--
-- Constraints for table `loan_application`
--
ALTER TABLE `loan_application`
  ADD CONSTRAINT `loan_application_ibfk_1` FOREIGN KEY (`Verified_by`) REFERENCES `staff` (`Staff_id`),
  ADD CONSTRAINT `loan_application_ibfk_2` FOREIGN KEY (`Applied_by`) REFERENCES `client` (`Client_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Loan_id`) REFERENCES `approved_loan` (`Loan_id`);

--
-- Constraints for table `payment_slips`
--
ALTER TABLE `payment_slips`
  ADD CONSTRAINT `payment_slips_ibfk_1` FOREIGN KEY (`Payment_id`) REFERENCES `payment` (`Payment_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Loan_id`) REFERENCES `loan_application` (`Loan_id`);

--
-- Constraints for table `rejected_loan`
--
ALTER TABLE `rejected_loan`
  ADD CONSTRAINT `rejected_loan_ibfk_1` FOREIGN KEY (`Loan_id`) REFERENCES `loan_application` (`Loan_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Created_by`) REFERENCES `admin` (`Admin_id`);

--
-- Constraints for table `staff_region`
--
ALTER TABLE `staff_region`
  ADD CONSTRAINT `staff_region_ibfk_1` FOREIGN KEY (`Staff_id`) REFERENCES `staff` (`Staff_id`),
  ADD CONSTRAINT `staff_region_ibfk_2` FOREIGN KEY (`Region_id`) REFERENCES `region` (`region_id`);

--
-- Constraints for table `staff_tele`
--
ALTER TABLE `staff_tele`
  ADD CONSTRAINT `staff_tele_ibfk_1` FOREIGN KEY (`Staff_id`) REFERENCES `staff` (`Staff_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
