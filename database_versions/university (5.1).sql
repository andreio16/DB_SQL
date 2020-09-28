-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 19 Oct 2018 la 19:09
-- Versiune server: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university`
--

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `IDCourse` int(11) NOT NULL AUTO_INCREMENT,
  `IDSpec` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `TeachingYear` year(4) DEFAULT NULL,
  `Semester` tinyint(4) DEFAULT NULL,
  `Professor` varchar(50) DEFAULT NULL,
  `Credits` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`IDCourse`),
  KEY `IDSpec` (`IDSpec`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `course`
--

INSERT INTO `course` (`IDCourse`, `IDSpec`, `Name`, `TeachingYear`, `Semester`, `Professor`, `Credits`) VALUES
(111, 11, 'Advanced computer graphics', 2003, 1, 'Rodica Baciu', 5),
(112, 12, 'Politics', 2004, 2, 'Vlad Maricescu', 2),
(113, 13, 'History', 2001, 1, 'Ioan Cuza', 5),
(114, 14, 'Play and play', 2007, 2, 'Dan Balan', 5),
(115, 15, 'Romance', 2018, 2, 'Mihai Eminem', 4);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `faculty`
--

DROP TABLE IF EXISTS `faculty`;
CREATE TABLE IF NOT EXISTS `faculty` (
  `IDFac` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `YearFounded` year(4) DEFAULT NULL,
  `Dean` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDFac`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `faculty`
--

INSERT INTO `faculty` (`IDFac`, `Name`, `YearFounded`, `Dean`, `Address`) VALUES
(1, 'Faculty of Engineering', 1976, 'Liviu Rosca', 'str. Emil Cioran, nr. 4, Sibiu, 55025, Romania'),
(2, 'Faculty of Law', 1976, 'Radu Radulescu', 'str. Mihai Viteazu, nr. 7, Cluj, 558987, România'),
(3, 'Faculty of Science', 1976, 'Blac Ion', 'str. Gogoasa, nr. 9, Timisoara, 963725, România'),
(4, 'Faculty of Art', 1976, 'Popa Vasile', 'str. Stefan St, nr. 4, Galati, 559925, România'),
(5, 'Faculty of Letters', 1976, 'Luiza Fulger', 'str. El Elisabeta, nr. 4, Sibiu, 569735, România');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
  `IDGrade` int(11) NOT NULL AUTO_INCREMENT,
  `IDStud` int(11) DEFAULT NULL,
  `IDCourse` int(11) DEFAULT NULL,
  `Grade` int(11) DEFAULT NULL,
  `Examdate` date DEFAULT NULL,
  PRIMARY KEY (`IDGrade`),
  KEY `IDCourse` (`IDCourse`),
  KEY `IDStud` (`IDStud`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `grade`
--

INSERT INTO `grade` (`IDGrade`, `IDStud`, `IDCourse`, `Grade`, `Examdate`) VALUES
(1, 5, 115, 10, '2018-10-19'),
(2, 9, 112, 9, '2018-10-01'),
(3, 8, 111, 7, '2018-10-30'),
(4, 6, 113, 5, '2018-10-15'),
(5, 7, 114, 10, '2018-10-06');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `specialty`
--

DROP TABLE IF EXISTS `specialty`;
CREATE TABLE IF NOT EXISTS `specialty` (
  `IDSpec` int(11) NOT NULL AUTO_INCREMENT,
  `IDFac` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDSpec`),
  KEY `IDFac` (`IDFac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `specialty`
--

INSERT INTO `specialty` (`IDSpec`, `IDFac`, `Name`) VALUES
(11, 1, 'Computer Science'),
(12, 3, 'Management'),
(13, 2, 'Department of Private Law'),
(14, 4, 'Theater'),
(15, 5, 'Poetry');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `studdata`
--

DROP TABLE IF EXISTS `studdata`;
CREATE TABLE IF NOT EXISTS `studdata` (
  `IDStud` int(11) NOT NULL AUTO_INCREMENT,
  `CNP` varchar(13) DEFAULT NULL,
  `FirstName` varchar(30) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `Father` varchar(50) DEFAULT NULL,
  `Mother` varchar(50) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Nationality` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDStud`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `studdata`
--

INSERT INTO `studdata` (`IDStud`, `CNP`, `FirstName`, `LastName`, `Father`, `Mother`, `Address`, `Nationality`) VALUES
(5, '1967859632145', 'David', 'Bacaraie', 'Marian Bacaraie', 'Andreea Baltag', 'str. Ceasca nr.88', 'Romana'),
(6, '2945936159863', 'Ionela', 'Petrescu', 'Paul Petrescu', 'Crina Coran', 'str. Aleescu nr.22', 'Romana'),
(7, '2960874985263', 'Dana ', 'Cosbuc', 'Dragos Cosbuc', 'Camelia Poarta', 'str. Hermann nr.65', 'Romana'),
(8, '1980816896475', 'Alexandru', 'Hagi', 'Ioan Constantin Hagi', 'Veronica Nae', 'str. Ion Eliade nr.99', 'Romana'),
(9, '1970916657891', 'Andi', 'Moisescu', 'Vasi Moisescu', 'Elena Troia', 'str. Victoriei nr.1A ap.17', 'Romana');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `IDFac` int(11) DEFAULT NULL,
  `IDSpec` int(11) DEFAULT NULL,
  `CurrentYear` year(4) DEFAULT NULL,
  `StudyGroup` varchar(10) DEFAULT NULL,
  `Semester` tinyint(4) DEFAULT NULL,
  `Scholarship` varchar(3) DEFAULT NULL,
  `IDStud` int(11) DEFAULT NULL,
  KEY `IDStud` (`IDStud`),
  KEY `IDFac` (`IDFac`),
  KEY `IDSpec` (`IDSpec`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `student`
--

INSERT INTO `student` (`IDFac`, `IDSpec`, `CurrentYear`, `StudyGroup`, `Semester`, `Scholarship`, `IDStud`) VALUES
(1, 11, 2018, 'TI', 2, 'Yes', 5),
(2, 12, 2017, 'ROD', 1, 'No', 9),
(3, 13, 2016, 'DPA', 1, 'No', 8),
(4, 14, 2018, 'LAN', 1, 'No', 6),
(5, 15, 2018, 'DNA', 2, 'No', 7);

--
-- Restrictii pentru tabele sterse
--

--
-- Restrictii pentru tabele `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`IDSpec`) REFERENCES `specialty` (`IDSpec`);

--
-- Restrictii pentru tabele `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`IDCourse`) REFERENCES `course` (`IDCourse`),
  ADD CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`IDStud`) REFERENCES `studdata` (`IDStud`);

--
-- Restrictii pentru tabele `specialty`
--
ALTER TABLE `specialty`
  ADD CONSTRAINT `specialty_ibfk_1` FOREIGN KEY (`IDFac`) REFERENCES `faculty` (`IDFac`);

--
-- Restrictii pentru tabele `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`IDStud`) REFERENCES `studdata` (`IDStud`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`IDFac`) REFERENCES `faculty` (`IDFac`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`IDSpec`) REFERENCES `specialty` (`IDSpec`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
