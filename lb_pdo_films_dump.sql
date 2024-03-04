-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2024 at 09:23 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lb_pdo_films`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `ID_Actor` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`ID_Actor`, `name`) VALUES
(25, 'Amil Nasirov'),
(20, 'Bryan Cranston'),
(8, 'Bryce Dallas Howard'),
(19, 'Carey Mulligan'),
(10, 'Chris Evans'),
(11, 'Chris Hemsworth'),
(4, 'Chris Pratt'),
(14, 'Christopher Mintz-Plasse'),
(23, 'Daria Plakhtiy'),
(12, 'Jonah Hill'),
(7, 'Jordana Brewster'),
(15, 'Kenneth Branagh'),
(13, 'Michael Cera'),
(22, 'Oleksiy Hnatkovskyi'),
(6, 'Paul Walker'),
(16, 'Penelope Cruz'),
(24, 'Ramil Nasirov'),
(9, 'Robert John Downey Jr'),
(18, 'Ryan Gosling'),
(1, 'Sam Worthington'),
(21, 'Sergiy Strelnikov'),
(3, 'Sigourney Weaver'),
(5, 'Vin Diesel'),
(17, 'Willem Dafoe'),
(2, 'Zoe Saldana');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `ID_FILM` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `country` varchar(255) NOT NULL,
  `FID_Quality` varchar(10) NOT NULL,
  `director` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`ID_FILM`, `name`, `date`, `country`, `FID_Quality`, `director`) VALUES
(1, 'Avatar', '2009-12-18', 'USA', 'FHD', 'James Cameron'),
(2, 'Guardians of the Galaxy', '2014-08-01', 'USA', 'FHD', 'James Gunn'),
(3, 'Fast & Furious', '2009-04-03', 'USA', 'FHD', 'Justin Lin'),
(4, 'Jurassic World', '2015-06-12', 'USA', 'FHD', 'Colin Trevorrow'),
(5, 'Avengers: Endgame', '2019-04-19', 'USA', 'FHD', 'Anthony & Joe Russo'),
(6, 'Superbad', '2007-10-18', 'USA', 'FHD', 'Greg Mottola'),
(7, 'Murder on the Orient Express', '2017-11-09', 'USA', 'FHD', 'Kenneth Branagh'),
(8, 'Drive', '2011-09-11', 'USA', 'FHD', 'Nicolas Winding Refn'),
(9, 'Dovbush', '2023-08-24', 'Ukraine', 'FHD', 'Oles Sanin'),
(10, 'Luxembourg, Luxembourg', '2023-04-13', 'Ukraine', 'FHD', 'Antonio Lukic');

-- --------------------------------------------------------

--
-- Table structure for table `film_actor`
--

CREATE TABLE `film_actor` (
  `FID_Film` int(11) NOT NULL,
  `FID_Actor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `film_actor`
--

INSERT INTO `film_actor` (`FID_Film`, `FID_Actor`) VALUES
(1, 3),
(1, 1),
(1, 2),
(3, 5),
(3, 6),
(3, 7),
(2, 4),
(2, 2),
(2, 5),
(4, 4),
(4, 8),
(5, 9),
(5, 10),
(5, 11),
(6, 12),
(6, 13),
(6, 14),
(7, 15),
(7, 16),
(7, 17),
(8, 18),
(8, 19),
(8, 20),
(9, 21),
(9, 22),
(9, 23),
(10, 24),
(10, 25);

-- --------------------------------------------------------

--
-- Table structure for table `film_genre`
--

CREATE TABLE `film_genre` (
  `FID_Film` int(11) NOT NULL,
  `FID_Genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `film_genre`
--

INSERT INTO `film_genre` (`FID_Film`, `FID_Genre`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 4),
(3, 1),
(3, 5),
(4, 1),
(4, 2),
(4, 6),
(5, 1),
(5, 3),
(6, 4),
(7, 7),
(8, 7),
(8, 5),
(9, 1),
(10, 4),
(10, 7);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `ID_Genre` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`ID_Genre`, `title`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(4, 'Comedy'),
(7, 'Drama'),
(3, 'Fantasy'),
(6, 'Sci-Fi'),
(5, 'Thriller');

-- --------------------------------------------------------

--
-- Table structure for table `quality`
--

CREATE TABLE `quality` (
  `ID_QUALITY` varchar(10) NOT NULL,
  `resolution` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `quality`
--

INSERT INTO `quality` (`ID_QUALITY`, `resolution`) VALUES
('FHD', '1920 x 1080'),
('HD', '1280 x 720'),
('SD', '720 x 480');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`ID_Actor`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`ID_FILM`),
  ADD KEY `FILM_fk0` (`FID_Quality`);

--
-- Indexes for table `film_actor`
--
ALTER TABLE `film_actor`
  ADD KEY `FILM_ACTOR_fk0` (`FID_Film`),
  ADD KEY `FILM_ACTOR_fk1` (`FID_Actor`);

--
-- Indexes for table `film_genre`
--
ALTER TABLE `film_genre`
  ADD KEY `FILM_GENRE_fk0` (`FID_Film`),
  ADD KEY `FILM_GENRE_fk1` (`FID_Genre`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`ID_Genre`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `quality`
--
ALTER TABLE `quality`
  ADD PRIMARY KEY (`ID_QUALITY`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actor`
--
ALTER TABLE `actor`
  MODIFY `ID_Actor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `ID_FILM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `ID_Genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `FILM_fk0` FOREIGN KEY (`FID_Quality`) REFERENCES `quality` (`ID_QUALITY`);

--
-- Constraints for table `film_actor`
--
ALTER TABLE `film_actor`
  ADD CONSTRAINT `FILM_ACTOR_fk0` FOREIGN KEY (`FID_Film`) REFERENCES `film` (`ID_FILM`),
  ADD CONSTRAINT `FILM_ACTOR_fk1` FOREIGN KEY (`FID_Actor`) REFERENCES `actor` (`ID_Actor`);

--
-- Constraints for table `film_genre`
--
ALTER TABLE `film_genre`
  ADD CONSTRAINT `FILM_GENRE_fk0` FOREIGN KEY (`FID_Film`) REFERENCES `film` (`ID_FILM`),
  ADD CONSTRAINT `FILM_GENRE_fk1` FOREIGN KEY (`FID_Genre`) REFERENCES `genre` (`ID_Genre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
