-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 01, 2026 at 11:34 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_portofolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `pengalaman`
--

CREATE TABLE `pengalaman` (
  `id` int NOT NULL,
  `nama_pengalaman` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pengalaman`
--

INSERT INTO `pengalaman` (`id`, `nama_pengalaman`) VALUES
(1, 'Project Editing Video After Effect'),
(2, 'Project Editing Video Premier Pro'),
(3, 'Project Design & Photo Editing Photoshop');

-- --------------------------------------------------------

--
-- Table structure for table `profil`
--

CREATE TABLE `profil` (
  `id` int NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi_hero` text,
  `deskripsi_about` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `profil`
--

INSERT INTO `profil` (`id`, `nama`, `deskripsi_hero`, `deskripsi_about`) VALUES
(1, 'Rizqy', 'Saya adalah seorang creative editor yang memiliki ketertarikan besar pada dunia visual storytelling dan desain digital. Melalui video editing dan desain grafis, saya berusaha menyampaikan pesan yang kuat, emosional, dan profesional dalam setiap karya. Saya percaya bahwa visual yang baik bukan hanya tentang tampilan, tetapi tentang pengalaman yang dirasakan oleh audiens.', 'Saya mempelajari dan mengembangkan kemampuan editing serta desain secara konsisten melalui berbagai proyek personal maupun kolaborasi. Dunia kreatif memberikan ruang bagi saya untuk terus bereksperimen dengan konsep visual, transisi dinamis, komposisi warna, dan storytelling yang menarik.');

-- --------------------------------------------------------

--
-- Table structure for table `projek`
--

CREATE TABLE `projek` (
  `id` int NOT NULL,
  `video_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `projek`
--

INSERT INTO `projek` (`id`, `video_url`) VALUES
(1, 'assets/vid/1.mp4'),
(2, 'assets/vid/2.mp4'),
(3, 'assets/vid/3.mp4'),
(4, 'assets/vid/4.mp4'),
(5, 'assets/vid/5.mp4'),
(6, 'assets/vid/6.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `sertifikat`
--

CREATE TABLE `sertifikat` (
  `id` int NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `deskripsi` text,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sertifikat`
--

INSERT INTO `sertifikat` (`id`, `judul`, `deskripsi`, `gambar`) VALUES
(1, 'Premier Pro', 'Sertifikat pelatihan editing video cinematic menggunakan Premier Pro.', 'assets/img/pr.png'),
(2, 'After Effect', 'Sertifikat pelatihan editing motion graphics menggunakan After Effect.', 'assets/img/ae.png'),
(3, 'Photoshop', 'Sertifikat pelatihan graphics design menggunakan Photoshop.', 'assets/img/ps.png');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int NOT NULL,
  `nama_skill` varchar(100) DEFAULT NULL,
  `persentase` int DEFAULT NULL,
  `kelas_css` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `nama_skill`, `persentase`, `kelas_css`) VALUES
(1, 'After Effect', 90, 'skill-ae'),
(2, 'Premier Pro', 80, 'skill-pp'),
(3, 'Photoshop', 95, 'skill-ps');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pengalaman`
--
ALTER TABLE `pengalaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projek`
--
ALTER TABLE `projek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sertifikat`
--
ALTER TABLE `sertifikat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengalaman`
--
ALTER TABLE `pengalaman`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profil`
--
ALTER TABLE `profil`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `projek`
--
ALTER TABLE `projek`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sertifikat`
--
ALTER TABLE `sertifikat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
