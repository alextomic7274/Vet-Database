-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 14, 2023 at 04:15 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `GalwayVet`
--

-- --------------------------------------------------------

--
-- Table structure for table `ANIMAL`
--

CREATE TABLE `ANIMAL` (
  `animalID` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `species` varchar(50) DEFAULT NULL,
  `breed` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `ownerID` int(11) DEFAULT NULL,
  `foodID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ANIMAL`
--

INSERT INTO `ANIMAL` (`animalID`, `name`, `age`, `species`, `breed`, `type`, `ownerID`, `foodID`) VALUES
(1, 'Betsy', 2, 'cow', NULL, 'farm', 5, NULL),
(2, 'Daisy', 1, 'cow', NULL, 'farm', 5, NULL),
(3, 'Tilly', 3, 'horse', NULL, 'farm', 5, NULL),
(4, 'Clover', 2, 'goat', NULL, 'farm', 2, NULL),
(5, 'Charlie', 7, 'dog', 'German Sheperd', 'pet', 3, 2),
(6, 'Paco', 8, 'dog', 'Labrador', 'pet', 1, NULL),
(8, 'Mika', 3, 'cat', NULL, 'pet', 4, 3),
(9, 'Mike', 6, 'dog', 'Pug', 'pet', 3, NULL),
(10, 'Jim', 4, 'dog', 'Chihuahua', 'pet', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `APPOINTMENT`
--

CREATE TABLE `APPOINTMENT` (
  `appointmentID` int(11) NOT NULL,
  `appointmentDate` date NOT NULL,
  `appointmentTime` time NOT NULL,
  `animalID` int(11) NOT NULL,
  `appointmentType` varchar(100) NOT NULL,
  `appointmentNotes` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `APPOINTMENT`
--

INSERT INTO `APPOINTMENT` (`appointmentID`, `appointmentDate`, `appointmentTime`, `animalID`, `appointmentType`, `appointmentNotes`) VALUES
(1, '2022-01-01', '09:00:00', 5, 'Check up', 'Fever'),
(2, '2022-01-02', '13:00:00', 1, 'Check up', 'lethargy'),
(3, '2022-01-02', '10:00:00', 3, 'Routine', 'Infection not resolved'),
(4, '2022-01-03', '11:30:00', 2, 'Surgery', 'Leg fracture repair, need to rebook follow up appointment'),
(5, '2022-01-04', '10:45:00', 8, 'Check up', 'Limping, panting, frequent crying');

-- --------------------------------------------------------

--
-- Table structure for table `ATTENDANCE`
--

CREATE TABLE `ATTENDANCE` (
  `attendanceID` int(11) NOT NULL,
  `staffID` int(11) NOT NULL,
  `appointmentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ATTENDANCE`
--

INSERT INTO `ATTENDANCE` (`attendanceID`, `staffID`, `appointmentID`) VALUES
(1, 1, 1),
(2, 3, 1),
(3, 2, 2),
(4, 2, 3),
(5, 4, 3),
(6, 1, 4),
(7, 2, 4),
(8, 3, 4),
(9, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `BILLING`
--

CREATE TABLE `BILLING` (
  `invoiceID` int(11) NOT NULL,
  `date` date NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `paymentStatus` varchar(50) NOT NULL,
  `paymentType` varchar(50) DEFAULT NULL,
  `appointmentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `BILLING`
--

INSERT INTO `BILLING` (`invoiceID`, `date`, `balance`, `paymentStatus`, `paymentType`, `appointmentID`) VALUES
(101, '2022-01-02', '80.00', 'PAID', 'Card', 1),
(102, '2022-01-01', '120.00', 'UNPAID', NULL, 2),
(103, '2022-01-02', '150.00', 'PAID', 'Cash', 3),
(104, '2022-01-03', '600.00', 'PAID', 'Card', 4),
(105, '2022-01-04', '100.00', 'PAID', 'Card', 5);

-- --------------------------------------------------------

--
-- Table structure for table `DIAGNOSIS`
--

CREATE TABLE `DIAGNOSIS` (
  `diagnosisID` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `animalID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DIAGNOSIS`
--

INSERT INTO `DIAGNOSIS` (`diagnosisID`, `description`, `animalID`) VALUES
(1, 'Urinary tract infection', 5),
(2, 'Carpal tunnel syndrome', 8),
(3, 'Hypertension', 1),
(4, 'Urinary tract infection, reccurrent', 3),
(5, 'Fractured leg', 2),
(6, 'Hypertension', 5);

-- --------------------------------------------------------

--
-- Table structure for table `FOOD`
--

CREATE TABLE `FOOD` (
  `foodID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `species` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `FOOD`
--

INSERT INTO `FOOD` (`foodID`, `name`, `species`) VALUES
(1, 'dogPlus', 'dog'),
(2, 'Furry Feast', 'dog'),
(3, 'Whiskas', 'cat'),
(4, 'Equine Eats', 'horse');

-- --------------------------------------------------------

--
-- Table structure for table `INSTALLMENT`
--

CREATE TABLE `INSTALLMENT` (
  `installmentID` int(11) NOT NULL,
  `planID` int(11) DEFAULT NULL,
  `installmentNumber` int(11) DEFAULT NULL,
  `dueDate` date DEFAULT NULL,
  `datePaid` date DEFAULT NULL,
  `status` enum('PENDING','PAID','OVERDUE') DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `INSTALLMENT`
--

INSERT INTO `INSTALLMENT` (`installmentID`, `planID`, `installmentNumber`, `dueDate`, `datePaid`, `status`, `amount`) VALUES
(3, 1, 1, '2023-01-15', NULL, 'PENDING', '500.00'),
(4, 1, 2, '2023-01-28', NULL, 'PENDING', '500.00');

-- --------------------------------------------------------

--
-- Table structure for table `MEDICATION`
--

CREATE TABLE `MEDICATION` (
  `medicationID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `administrationRoute` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `MEDICATION`
--

INSERT INTO `MEDICATION` (`medicationID`, `name`, `description`, `administrationRoute`) VALUES
(21, 'Amoxicillin', 'An antibiotic used to treat bacterial infections.\r\nAdministered route: Oral pill or liquid form.', 'Oral pill or liquid form.'),
(22, 'Prednisone', 'A steroid used to treat inflammation and autoimmune disorders.', 'Oral pill form.'),
(23, 'Tramadol', 'A pain reliever used to treat moderate to severe pain in pets.', 'Oral pill form.'),
(24, 'Phenobarbital', 'A medication used to control seizures in dogs and cats.', 'Oral pill form.'),
(25, 'Metronidazole', 'An antibiotic used to treat certain bacterial and parasitic infections.', 'Oral pill or liquid form.'),
(26, 'Furosemide', 'A diuretic medication used to treat congestive heart failure and other conditions that cause fluid retention.', 'Oral pill form or injection.'),
(27, 'Enalapril', 'An ACE inhibitor medication used to treat high blood pressure and heart failure in dogs and cats.', 'Oral pill form.'),
(28, 'Cephalexin', 'An antibiotic used to treat bacterial infections in dogs and cats.', 'Oral pill or liquid form.'),
(29, 'Diphenhydramine', 'An antihistamine medication used to treat allergies and itching in pets.', 'Oral pill form or injection.'),
(30, 'Meloxicam', 'A nonsteroidal anti-inflammatory drug (NSAID) used to treat pain and inflammation in dogs and cats.', 'Oral pill form or injection.');

-- --------------------------------------------------------

--
-- Table structure for table `OWNER`
--

CREATE TABLE `OWNER` (
  `ownerID` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `OWNER`
--

INSERT INTO `OWNER` (`ownerID`, `firstName`, `lastName`, `address`, `phone`) VALUES
(1, 'John', 'O Shea', '48 wainsfort road, Galway', 875436789),
(2, 'Sarah', 'Bradley', '44 st kevins road, Galway', 853458765),
(3, 'Jake', 'Smith', '55 the orchards, Galway', 212348734),
(4, 'Shane', 'Hurley', '12 tallaght road, Galway', 862638912),
(5, 'Sean', 'Higgins', '20 clondalkin road, Galway', 855836745);

-- --------------------------------------------------------

--
-- Table structure for table `PAYMENT_PLAN`
--

CREATE TABLE `PAYMENT_PLAN` (
  `planID` int(11) NOT NULL,
  `invoiceID` int(11) DEFAULT NULL,
  `totalInstallments` int(11) DEFAULT NULL,
  `due_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PAYMENT_PLAN`
--

INSERT INTO `PAYMENT_PLAN` (`planID`, `invoiceID`, `totalInstallments`, `due_date`) VALUES
(1, 102, 2, '2022-01-15');

-- --------------------------------------------------------

--
-- Table structure for table `PRESCRIPTION`
--

CREATE TABLE `PRESCRIPTION` (
  `prescriptionID` int(11) NOT NULL,
  `date` date NOT NULL,
  `animalID` int(11) NOT NULL,
  `staffID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PRESCRIPTION`
--

INSERT INTO `PRESCRIPTION` (`prescriptionID`, `date`, `animalID`, `staffID`) VALUES
(1000, '2022-01-01', 5, 1),
(1001, '2022-01-02', 1, 2),
(1002, '2022-01-02', 3, 2),
(1003, '2022-01-03', 2, 1),
(1004, '2022-01-04', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `PRESCRIPTION_MEDICATION`
--

CREATE TABLE `PRESCRIPTION_MEDICATION` (
  `presMedID` int(11) NOT NULL,
  `prescriptionID` int(11) NOT NULL,
  `medicationID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PRESCRIPTION_MEDICATION`
--

INSERT INTO `PRESCRIPTION_MEDICATION` (`presMedID`, `prescriptionID`, `medicationID`) VALUES
(1, 1000, 21),
(2, 1000, 27),
(3, 1001, 27),
(4, 1002, 21),
(5, 1003, 23),
(6, 1004, 30);

-- --------------------------------------------------------

--
-- Table structure for table `STAFF`
--

CREATE TABLE `STAFF` (
  `staffID` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `role` varchar(20) NOT NULL,
  `phone` int(15) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `STAFF`
--

INSERT INTO `STAFF` (`staffID`, `firstName`, `lastName`, `role`, `phone`, `salary`) VALUES
(1, 'Joe', 'O\' Donnell', 'Surgeon', 872648754, '75000.00'),
(2, 'Edgar', 'F. Codd', 'Surgeon', 852348756, '65000.00'),
(3, 'Grace', 'Hopper', 'Nurse', 892347567, '50000.00'),
(4, 'Bill', 'Gates', 'Nurse', 851239000, '45000.00'),
(5, 'Roisin', 'Fitzpatrick', 'Receptionist', 213450934, '30000.00'),
(6, 'Ada', 'Lovelace', 'Surgeon', 873642356, '68000.00'),
(7, 'Alan', 'Turing', 'Nurse', 859871264, '45000.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ANIMAL`
--
ALTER TABLE `ANIMAL`
  ADD PRIMARY KEY (`animalID`),
  ADD KEY `ownerID` (`ownerID`),
  ADD KEY `foodID` (`foodID`);

--
-- Indexes for table `APPOINTMENT`
--
ALTER TABLE `APPOINTMENT`
  ADD PRIMARY KEY (`appointmentID`),
  ADD KEY `animalID` (`animalID`);

--
-- Indexes for table `ATTENDANCE`
--
ALTER TABLE `ATTENDANCE`
  ADD PRIMARY KEY (`attendanceID`),
  ADD KEY `staffID` (`staffID`),
  ADD KEY `appointmentID` (`appointmentID`);

--
-- Indexes for table `BILLING`
--
ALTER TABLE `BILLING`
  ADD PRIMARY KEY (`invoiceID`),
  ADD KEY `FK_appointment` (`appointmentID`);

--
-- Indexes for table `DIAGNOSIS`
--
ALTER TABLE `DIAGNOSIS`
  ADD PRIMARY KEY (`diagnosisID`),
  ADD KEY `animalID` (`animalID`);

--
-- Indexes for table `FOOD`
--
ALTER TABLE `FOOD`
  ADD PRIMARY KEY (`foodID`);

--
-- Indexes for table `INSTALLMENT`
--
ALTER TABLE `INSTALLMENT`
  ADD PRIMARY KEY (`installmentID`),
  ADD KEY `planID` (`planID`);

--
-- Indexes for table `MEDICATION`
--
ALTER TABLE `MEDICATION`
  ADD PRIMARY KEY (`medicationID`);

--
-- Indexes for table `OWNER`
--
ALTER TABLE `OWNER`
  ADD PRIMARY KEY (`ownerID`);

--
-- Indexes for table `PAYMENT_PLAN`
--
ALTER TABLE `PAYMENT_PLAN`
  ADD PRIMARY KEY (`planID`),
  ADD KEY `invoiceID` (`invoiceID`);

--
-- Indexes for table `PRESCRIPTION`
--
ALTER TABLE `PRESCRIPTION`
  ADD PRIMARY KEY (`prescriptionID`),
  ADD KEY `animalID` (`animalID`),
  ADD KEY `staffID` (`staffID`);

--
-- Indexes for table `PRESCRIPTION_MEDICATION`
--
ALTER TABLE `PRESCRIPTION_MEDICATION`
  ADD PRIMARY KEY (`presMedID`),
  ADD KEY `prescriptionID` (`prescriptionID`),
  ADD KEY `medicationID` (`medicationID`);

--
-- Indexes for table `STAFF`
--
ALTER TABLE `STAFF`
  ADD PRIMARY KEY (`staffID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ANIMAL`
--
ALTER TABLE `ANIMAL`
  MODIFY `animalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `APPOINTMENT`
--
ALTER TABLE `APPOINTMENT`
  MODIFY `appointmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ATTENDANCE`
--
ALTER TABLE `ATTENDANCE`
  MODIFY `attendanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `BILLING`
--
ALTER TABLE `BILLING`
  MODIFY `invoiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `DIAGNOSIS`
--
ALTER TABLE `DIAGNOSIS`
  MODIFY `diagnosisID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `FOOD`
--
ALTER TABLE `FOOD`
  MODIFY `foodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `INSTALLMENT`
--
ALTER TABLE `INSTALLMENT`
  MODIFY `installmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `MEDICATION`
--
ALTER TABLE `MEDICATION`
  MODIFY `medicationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `OWNER`
--
ALTER TABLE `OWNER`
  MODIFY `ownerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `PAYMENT_PLAN`
--
ALTER TABLE `PAYMENT_PLAN`
  MODIFY `planID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `PRESCRIPTION`
--
ALTER TABLE `PRESCRIPTION`
  MODIFY `prescriptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;

--
-- AUTO_INCREMENT for table `PRESCRIPTION_MEDICATION`
--
ALTER TABLE `PRESCRIPTION_MEDICATION`
  MODIFY `presMedID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `STAFF`
--
ALTER TABLE `STAFF`
  MODIFY `staffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ANIMAL`
--
ALTER TABLE `ANIMAL`
  ADD CONSTRAINT `ANIMAL_ibfk_1` FOREIGN KEY (`ownerID`) REFERENCES `OWNER` (`ownerID`),
  ADD CONSTRAINT `ANIMAL_ibfk_3` FOREIGN KEY (`foodID`) REFERENCES `FOOD` (`foodID`);

--
-- Constraints for table `APPOINTMENT`
--
ALTER TABLE `APPOINTMENT`
  ADD CONSTRAINT `APPOINTMENT_ibfk_1` FOREIGN KEY (`animalID`) REFERENCES `ANIMAL` (`animalID`);

--
-- Constraints for table `ATTENDANCE`
--
ALTER TABLE `ATTENDANCE`
  ADD CONSTRAINT `ATTENDANCE_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `STAFF` (`staffID`),
  ADD CONSTRAINT `ATTENDANCE_ibfk_2` FOREIGN KEY (`appointmentID`) REFERENCES `APPOINTMENT` (`appointmentID`);

--
-- Constraints for table `BILLING`
--
ALTER TABLE `BILLING`
  ADD CONSTRAINT `FK_appointment` FOREIGN KEY (`appointmentID`) REFERENCES `APPOINTMENT` (`appointmentID`);

--
-- Constraints for table `DIAGNOSIS`
--
ALTER TABLE `DIAGNOSIS`
  ADD CONSTRAINT `DIAGNOSIS_ibfk_1` FOREIGN KEY (`animalID`) REFERENCES `ANIMAL` (`animalID`);

--
-- Constraints for table `INSTALLMENT`
--
ALTER TABLE `INSTALLMENT`
  ADD CONSTRAINT `INSTALLMENT_ibfk_1` FOREIGN KEY (`planID`) REFERENCES `PAYMENT_PLAN` (`planID`);

--
-- Constraints for table `PAYMENT_PLAN`
--
ALTER TABLE `PAYMENT_PLAN`
  ADD CONSTRAINT `PAYMENT_PLAN_ibfk_1` FOREIGN KEY (`invoiceID`) REFERENCES `BILLING` (`invoiceID`);

--
-- Constraints for table `PRESCRIPTION`
--
ALTER TABLE `PRESCRIPTION`
  ADD CONSTRAINT `PRESCRIPTION_ibfk_1` FOREIGN KEY (`animalID`) REFERENCES `ANIMAL` (`animalID`),
  ADD CONSTRAINT `PRESCRIPTION_ibfk_2` FOREIGN KEY (`staffID`) REFERENCES `STAFF` (`staffID`);

--
-- Constraints for table `PRESCRIPTION_MEDICATION`
--
ALTER TABLE `PRESCRIPTION_MEDICATION`
  ADD CONSTRAINT `PRESCRIPTION_MEDICATION_ibfk_1` FOREIGN KEY (`prescriptionID`) REFERENCES `PRESCRIPTION` (`prescriptionID`),
  ADD CONSTRAINT `PRESCRIPTION_MEDICATION_ibfk_2` FOREIGN KEY (`medicationID`) REFERENCES `MEDICATION` (`medicationID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
