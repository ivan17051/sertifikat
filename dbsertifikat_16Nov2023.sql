-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for dbsertifikat
CREATE DATABASE IF NOT EXISTS `dbsertifikat` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `dbsertifikat`;

-- Dumping structure for table dbsertifikat.macara
CREATE TABLE IF NOT EXISTS `macara` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(150) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT 'Peserta' COMMENT 'peserta, pembicara',
  `tgl_mulai` date DEFAULT NULL,
  `tgl_selesai` date DEFAULT NULL,
  `tempat` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT 0 COMMENT '0: draft; 1: msk transaksi',
  `doc` timestamp NULL DEFAULT current_timestamp(),
  `com` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- Dumping structure for table dbsertifikat.mpeserta
CREATE TABLE IF NOT EXISTS `mpeserta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik` varchar(16) DEFAULT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `tempatlahir` varchar(150) DEFAULT NULL,
  `tanggallahir` date DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `unitkerja` varchar(100) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `pasfoto` varchar(100) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT 1,
  `doc` timestamp NULL DEFAULT current_timestamp(),
  `dom` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- Dumping structure for table dbsertifikat.muser
CREATE TABLE IF NOT EXISTS `muser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `token` varchar(150) DEFAULT NULL,
  `role` varchar(150) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT 1,
  `doc` timestamp NULL DEFAULT current_timestamp(),
  `dom` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dbsertifikat.muser: ~0 rows (approximately)
INSERT INTO `muser` (`id`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(1, 'admin', 'Admin', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', '8fKQPKhXQAeczGStE6dxkP7Kvu881tS56HlJw52aKCe5Mf5cuMddmpPnpE8j', 'admin', 1, '2023-09-11 07:23:02', '2023-11-15 06:59:52');

-- Dumping structure for table dbsertifikat.transaksi
CREATE TABLE IF NOT EXISTS `transaksi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idacara` int(11) DEFAULT NULL,
  `iduser` varchar(200) DEFAULT NULL,
  `no_surat` varchar(100) DEFAULT NULL,
  `tgl_surat` date DEFAULT NULL,
  `jumpeserta` int(11) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `background2` varchar(100) DEFAULT NULL,
  `jns_sertif` tinyint(4) DEFAULT NULL COMMENT '1: layak higiene sanitasi makanan; 2: pelatihan tenaga kesehatan; 3: piagam penghargaan',
  `doc` timestamp NULL DEFAULT current_timestamp(),
  `dom` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK__macara` (`idacara`),
  CONSTRAINT `FK__macara` FOREIGN KEY (`idacara`) REFERENCES `macara` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
