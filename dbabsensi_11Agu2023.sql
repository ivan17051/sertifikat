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


-- Dumping database structure for dbabsensi
CREATE DATABASE IF NOT EXISTS `dbabsensi` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `dbabsensi`;

-- Dumping structure for table dbabsensi.absensi
CREATE TABLE IF NOT EXISTS `absensi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) DEFAULT NULL,
  `idunitkerja` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam_msk` varchar(15) DEFAULT NULL,
  `jam_plg` varchar(15) DEFAULT NULL,
  `geotag_msk` varchar(150) DEFAULT NULL,
  `geotag_plg` varchar(150) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1 COMMENT '0: blm isi ; 1: isi absen msk ; 2: isi absen plg ; 3: verif',
  `doc` timestamp NULL DEFAULT current_timestamp(),
  `dom` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_absensi_muser` (`iduser`),
  KEY `FK_absensi_munitkerja` (`idunitkerja`),
  CONSTRAINT `FK_absensi_munitkerja` FOREIGN KEY (`idunitkerja`) REFERENCES `munitkerja` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_absensi_muser` FOREIGN KEY (`iduser`) REFERENCES `muser` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dbabsensi.absensi: ~3 rows (approximately)
INSERT INTO `absensi` (`id`, `iduser`, `idunitkerja`, `tanggal`, `jam_msk`, `jam_plg`, `geotag_msk`, `geotag_plg`, `status`, `doc`, `dom`) VALUES
	(1, 2, 1, '2023-08-09', '07:06:00', NULL, NULL, NULL, 1, '2023-08-09 04:07:05', '2023-08-10 02:37:47');
INSERT INTO `absensi` (`id`, `iduser`, `idunitkerja`, `tanggal`, `jam_msk`, `jam_plg`, `geotag_msk`, `geotag_plg`, `status`, `doc`, `dom`) VALUES
	(2, 2, 43, '2023-08-10', '12:12:00', '15:00:00', 'http://localhost/absensi/storage/app/photos/10082023_2_msk.jpeg', 'http://localhost/absensi/storage/app/photos/10082023_2_plg.jpeg', 3, '2023-08-10 02:27:16', '2023-08-11 06:05:05');
INSERT INTO `absensi` (`id`, `iduser`, `idunitkerja`, `tanggal`, `jam_msk`, `jam_plg`, `geotag_msk`, `geotag_plg`, `status`, `doc`, `dom`) VALUES
	(5, 2, 43, '2023-08-11', '07:30:00', '13:03:00', 'http://172.21.1.69/absensi/storage/app/photos/11082023_2_msk.jpeg', 'http://172.21.1.69/absensi/storage/app/photos/11082023_2_plg.jpeg', 3, '2023-08-11 05:48:25', '2023-08-11 06:13:46');

-- Dumping structure for table dbabsensi.munitkerja
CREATE TABLE IF NOT EXISTS `munitkerja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) DEFAULT '0',
  `nama` varchar(100) DEFAULT NULL,
  `nama_alias` varchar(50) DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL,
  `doc` timestamp NULL DEFAULT current_timestamp(),
  `dom` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idc` tinyint(4) DEFAULT NULL,
  `idm` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=985 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dbabsensi.munitkerja: ~970 rows (approximately)
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(1, NULL, 'Dinas Kesehatan Kota Surabaya', 'DKK', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(2, NULL, 'Bagian Sekretariat', 'SEKRETARIAT', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(3, NULL, 'Sub. Bag. Penyusunan Program', 'SUNGRAM', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(4, NULL, 'Sub. Bag. Tata Usaha', 'TU', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(5, NULL, 'UNIT PEGAWAIAN', 'UP', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(6, NULL, 'Sub. Bag. Keuangan dan Perlengkapan', 'KEUANGAN', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(7, NULL, 'INFORMASI TEKNOLOGI', 'IT', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(8, NULL, 'SISTEM INFORMASI KESEHATAN', 'SIK', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(9, NULL, 'PERIJINAN', 'PERIJINAN', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(10, NULL, 'KONSULTAN', 'KONSULTAN', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(11, NULL, 'GUDANG', 'GUDANG', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(12, NULL, 'PERPUSTAKAAN', 'PERPUSTAKAAN', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(13, NULL, 'SEKPRO', 'SEKPRO', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(14, NULL, 'AMBULAN', 'AMBULAN', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(15, NULL, 'KEAMANAN', 'KEAMANAN', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(16, NULL, 'SEKRETARIS DINAS', 'SEKRETARIS DINAS', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(17, NULL, 'Bidang Pelayanan Kesehatan', 'YANKES', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(18, NULL, 'Seksi Pelayanan Kesehatan Dasar', 'YANKESDAS', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(19, NULL, 'Seksi Pelayanan Kesehatan Khusus', 'YANKESKHUSUS', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(20, NULL, 'Seksi Pelayanan Kesehatan Rujukan', 'YANKESRUJUKAN', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(21, NULL, 'Bidang Pengembangan SDM Kesehatan', 'PSDMK', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(22, NULL, 'Seksi Perencanaan dan Pendayagunaan SDM Kesehatan', 'PSDMPERENCANAAN', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(23, NULL, 'Seksi Pendidikan dan Pelatihan SDM Kesehatan', 'PSDMPENDIDIKAN', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(24, NULL, 'Seksi Registrasi dan Akreditasi SDM Kesehatan', 'PSDMREGISTRASI', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(25, NULL, 'Bidang Jaminan Dan Sarana Kesehatan', 'JAMSARKES', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(26, NULL, 'Seksi Jaminan Kesehatan', 'JAMKESMAS', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(27, NULL, 'Seksi Kefarmasian', 'FARMASI', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(28, NULL, 'Seksi Sarana dan Peralatan Kesehatan', 'SARALKES', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(29, NULL, 'Gudang Farmasi Kesehatan Daerah Kota Surabaya', 'GFK', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(30, NULL, 'Bidang Pengendalian Masalah Kesehatan', 'PMK', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(31, NULL, 'Seksi Pengendalian dan Pemberantasan Penyakit', 'P2P', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(32, NULL, 'Seksi Wabah dan Bencana', 'WABEN', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(33, NULL, 'Seksi Kesehatan Lingkungan', 'KESLING', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(34, NULL, 'IMUNISASI', 'IMUNISASI', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(35, NULL, 'PONDOK ASI', 'PONDOK ASI', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(37, NULL, 'Laboratorium Kesehatan Daerah Kota Surabaya', 'LAB DKK', 'Jl. Pucang Jajar No. 31', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(38, '1', 'Puskesmas Tanjungsari', 'TANJUNGSARI', 'Jl. Tanjungsari No. 116', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(39, '2', 'Puskesmas Simomulyo', 'SIMOMULYO', 'Jl. Gumuk Bogo VI/1', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(40, '3', 'Puskesmas Manukan Kulon', 'MANUKANKULON', 'Jl. Manukan Dalam I/18', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(41, '4', 'Puskesmas Balongsari', 'BALONGSARI', 'Jl. Balongsari Tama No. 1', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(42, '5', 'Puskesmas Asemrowo', 'ASEMROWO', 'Jl. Asemrowo Raya No. 8', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(43, '6', 'Puskesmas Sememi', 'SEMEMI', 'Jl. Kedung Sememi', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(44, '7', 'Puskesmas Benowo', 'BENOWO', 'Jl. Raya Benowo', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(45, '8', 'Puskesmas Jeruk', 'JERUK', 'Jl. Raya Menganti Jeruk No. 277A', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(46, '9', 'Puskesmas Lidah Kulon', 'LIDAHKULON', 'Jl. Raya Menganti Lidah Kulon No. 5', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(47, '10', 'Puskesmas Lontar', 'LONTAR', 'Jl. Raya Lontar No. 26', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(48, '11', 'Puskesmas Peneleh', 'PENELEH', 'Jl. Makam Peneleh No. 35', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(49, '12', 'Puskesmas Ketabang', 'KETABANG', 'Jl. Taman Surya No. 1', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(50, '13', 'Puskesmas Kedungdoro', 'KEDUNGDORO', 'Jl. Kaliasin Gg. Pompa No. 79-81', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(51, '14', 'Puskesmas Dr. Soetomo', 'DRSOETOMO', 'Jl. Kupang Segunting II/32', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(52, '15', 'Puskesmas Tembok Dukuh', 'TEMBOKDUKUH', 'Jl. Kalibutuh No. 26', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(53, '16', 'Puskesmas Gundih', 'GUNDIH', 'Jl. Margodadi No. 36-38', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(54, '17', 'Puskesmas Tambakrejo', 'TAMBAKREJO', 'Jl. Ngaglik No. 87', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(55, '18', 'Puskesmas Simolawang', 'SIMOLAWANG', 'Jl. Simolawang II Barat No. 45', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(56, '19', 'Puskesmas Perak Timur', 'PERAKTIMUR', 'Jl. Jakarta No. 9', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(57, '20', 'Puskesmas Pegirian', 'PEGIRIAN', 'Jl. Karang Tembok No. 39', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(58, '21', 'Puskesmas Sidotopo', 'SIDOTOPO', 'Jl. Sombo Gg. II/2', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(59, '22', 'Puskesmas Wonokusumo', 'WONOKUSUMO', 'Jl. Wonokusumo Tengah No. 55', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(60, '23', 'Puskesmas Krembangan Selatan', 'KREMBANGANSELATAN', 'Jl. Pesapen Selatan No. 70', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(61, '24', 'Puskesmas Dupak', 'DUPAK', 'Jl. Dupak Bangunrejo Gg. Poliklinik No. 6', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(62, '25', 'Puskesmas Kenjeran', 'KENJERAN', 'Jl. Tambak Deres No. 2', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(63, '26', 'Puskesmas Tanah Kali Kedinding', 'TAKAL', 'Jl. Kedung Cowek No. 226', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(64, '27', 'Puskesmas Sidotopo Wetan', 'SIDOTOPOWETAN', 'Jl. Randu No. 102', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(65, '28', 'Puskesmas Rangkah', 'RANGKAH', 'Jl. Rangkah VII/94', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(66, '29', 'Puskesmas Pacar Keling', 'PACARKELING', 'Jl. Jolotundo Baru III/16', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(67, '30', 'Puskesmas Gading', 'GADING', 'Jl. Kapas Lor Gg. I/1', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(68, '31', 'Puskesmas Pucangsewu', 'PUCANGSEWU', 'Jl. Pucang Anom Timur No. 72', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(69, '32', 'Puskesmas Mojo', 'MOJO', 'Jl. Mojo Klanggru Wetan II/11', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(70, '33', 'Puskesmas Kalirungkut', 'KALIRUNGKUT', 'Jl. Rungkut Puskesmas No. 1', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(71, '34', 'Puskesmas Medokan Ayu', 'MEDOKANAYU', 'Jl. Medokan Asri Utara IV/31', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(72, '35', 'Puskesmas Tenggilis', 'TENGGILIS', 'Jl. Rungkut Mejoyo Selatan P-IV/31', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(73, '36', 'Puskesmas Gunung Anyar', 'GUNUNGANYAR', 'Jl. Gunung Anyar Timur No. 70', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(74, '37', 'Puskesmas Menur', 'MENUR', 'Jl. Manyar Rejo I/35', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(75, '38', 'Puskesmas Klampis Ngasem', 'KLAMPISNGASEM', 'Jl. Arif Rahman Hakim No. 99B', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(76, '39', 'Puskesmas Mulyorejo', 'MULYOREJO', 'Jl. Mulyorejo Utara Belakang No. 201', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(77, '40', 'Puskesmas Sawahan', 'SAWAHAN', 'Jl. Arjuno No. 119', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(78, '41', 'Puskesmas Putat Jaya', 'PUTATJAYA', 'Jl. Kupang Gunung Raya V/16', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(79, '42', 'Puskesmas Banyu Urip', 'BANYUURIP', 'Jl. Banyu Urip Kidul VI/8', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(80, '43', 'Puskesmas Pakis', 'PAKIS', 'Jl. Makam Kembang Kuning No.6', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(81, '44', 'Puskesmas Jagir', 'JAGIR', 'Jl. Bendul Merisi No. 1', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(82, '45', 'Puskesmas Wonokromo', 'WONOKROMO', 'Jl. Karang Rejo VI/4', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(83, '46', 'Puskesmas Ngagel Rejo', 'NGAGELREJO', 'Jl. Ngagel Dadi III/17', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(84, '47', 'Puskesmas Kedurus', 'KEDURUS', 'Jl. Raya Mastrip No. 46', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(85, '48', 'Puskesmas Dukuh Kupang', 'DUKUHKUPANG', 'Jl. Dukuh Kupang Raya XXV/48', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(86, '49', 'Puskesmas Wiyung', 'WIYUNG', 'Jl. Menganti Wiyung Gg. Pasar No. 20', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(87, '50', 'Puskesmas Gayungan', 'GAYUNGAN', 'Jl. Gayungan Barat No. 134', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(88, '51', 'Puskesmas Jemursari', 'JEMURSARI', 'Jl. Jemursari Selatan IV/5', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(89, '52', 'Puskesmas Sidosermo', 'SIDOSERMO', 'Jl. Sidosermo Gg. Damri No. 51', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(90, '53', 'Puskesmas Kebonsari', 'KEBONSARI', 'Jl. Kebonsari Manunggal No. 30-32 ', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(91, NULL, 'Pustu Sonokawijenan', NULL, 'Jl. Kupang Jaya No. 2', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(92, NULL, 'Pustu Putat Gede', NULL, 'Jl. Putat Gede Barat Gang No. 4 C', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(93, NULL, 'Pustu Simohilir ', NULL, 'Jl. Simohilir X', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(94, NULL, 'Pustu Banjarsugihan', NULL, 'Jl. Manukan Lor', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(95, NULL, 'Pustu Buntaran', NULL, 'Jl. Buntaran 179', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(96, NULL, 'Pustu Tambak Langon', NULL, 'Jl. Raya  Tambak Langon', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(97, NULL, 'Pustu Kandangan', NULL, 'Jl. Raya kandangan', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(98, NULL, 'Pustu Romo Kalisari', NULL, 'Jl. Romo Kalisari', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(99, NULL, 'Pustu Pakal', NULL, 'Jl. Raya Pakal AMD', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(100, NULL, 'Pustu Sumber Rejo', NULL, 'Jl. Sumber Rejo', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(101, NULL, 'Pustu Tambakdono', NULL, 'Jl. Jawar No 3', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(102, NULL, 'Pustu Babat Jerawat', NULL, 'Jl. Pondok Benowo Indah SS-TT No 1', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(103, '54', 'Puskesmas Bangkingan', 'BANGKINGAN', 'Jl. Raya Bangkingan Karang Ploso', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(104, '55', 'Puskesmas Made', 'MADE', 'Jl. Raya Made', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(105, NULL, 'Pustu Kapasari', NULL, 'Jl. Kapasari IV 15', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(106, NULL, 'Pustu Embong Kaliasin', NULL, 'Jl. Pandegiling I/ 50', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(107, NULL, 'Pustu Keputran', NULL, 'Jl. Dinoyo Alun-alun II', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(108, NULL, 'Pustu Asem Jajar', NULL, 'Jl. Asem Jajar X/ 21', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(109, NULL, 'Pustu Gembong', NULL, 'Jl. Gembong VII/ 6', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(110, NULL, 'Pustu Granting', NULL, 'Jl. Granting Baru IV / 18 ', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(111, NULL, 'Pustu Sidoyoso', NULL, 'Jl. Sidoyoso II / 21', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(112, NULL, 'Pustu Kebondalem', NULL, 'Jl. Kebon Dalem VII/ 29', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(113, NULL, 'Pustu Sidodadi', NULL, 'Jl. Sidi kapasan I/ 78', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(114, NULL, 'Pustu Nyamplungan', NULL, 'Jl. Kalimas Hilir III RW 02', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(115, NULL, 'Pustu Bongkaran', NULL, 'Jl. Semur Kalimir RW 06', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(116, NULL, 'Pustu Krembangan Baru', NULL, 'Jl. Krembangan Baru 39', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(117, '56', 'Puskesmas Moro Krembangan ', 'MOROKREMBANGAN', 'Jl. Tambak Asih XIII /7', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(118, NULL, 'Pustu Tanah Kali Kedinding', NULL, 'Jl. Tanah Merah Utara gg V', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(119, NULL, 'Pustu Kedung Cowek ', NULL, 'Jl. Cumpat No 2', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(120, NULL, 'Pustu Bulak', NULL, 'Jl. Kyai Tambak Deres', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(121, '57', 'Puskesmas Tambak Wedi', 'TAMBAKWEDI', 'Jl. Tambak Wedi', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(122, '58', 'Puskesmas Bulak Banteng', 'BULAKBANTENG', 'Jl. Bulak Banteng 27', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(123, NULL, 'Pustu Karang Empat', NULL, 'Jl. Karang Empat Besar 56', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(124, NULL, 'Pustu Barata Jaya ', NULL, 'Jl. Bratang  Binangun III / 7', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(125, NULL, 'Pustu Gubeng  Klingsingan', NULL, 'Jl. Gubeng Klingsingan IV/ 25', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(126, NULL, 'Pustu Rungkut Kidul', NULL, 'Jl. Rungkut Asri Barat', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(127, NULL, 'Pustu Penjaringan Sari', NULL, 'Jl. Wisma Panjaringan Sari Blok X No 17', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(128, NULL, 'Pustu Medokan Ayu', NULL, 'Jl. Medokan Ayu Utara ', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(129, NULL, 'Pustu Kendangsari', NULL, 'JL. Kendangsari YKP 2', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(130, NULL, 'Pustu Kutisari', NULL, 'Jl. Kutisari Selatan Balai Rw 3', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(131, NULL, 'Pustu Rungkut Menanggal', NULL, 'Jl. Raya  Rungkut Barata', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(132, NULL, 'Pustu Semolowaru', NULL, 'Jl. Semolowaru Tengah 160 A', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(133, NULL, 'Pustu Medokan  Semampir', NULL, 'Jl. Medokan semampir Blok K', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(134, NULL, 'Pustu Gebang Putih', NULL, 'Jl. Gebang Putih No 64', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(135, '59', 'Puskesmas Keputih', 'KEPUTIH', 'Jl. Keputih Tegal', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(136, NULL, 'Pustu Sutorejo', NULL, 'Jl. Labansari', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(137, NULL, 'Pustu Wisma Permai', NULL, 'Jl. Wisma Permai', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(138, '60', 'Puskesmas Kalijudan', 'KALIJUDAN', 'Jl. Kalijudan', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(139, NULL, 'Pustu Petemon', NULL, 'Jl. Bukit Barisan 14', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(140, NULL, 'Pustu Putat Jaya', NULL, 'Jl. Kupang Gunung Barat  IV/25', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(141, NULL, 'Pustu Simokantrungan', NULL, 'Jl. Simokatrungan Kidul RW 1', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(142, NULL, 'Pustu Sawunggaling', NULL, 'Jl. Brawijaya No 1', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(143, NULL, 'Pustu Kebraon', NULL, 'Jl. Kebraon Praja 1', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(144, NULL, 'Pustu Warugunung', NULL, 'Jl. Raya Waru Gunung 1', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(145, NULL, 'Pustu Gunungsari', NULL, 'Jl. Kencanasari Timur No 11', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(146, NULL, 'Pustu Pradah Kali Kendal', NULL, 'Jl. HR Mohammmad no 165', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(147, NULL, 'Pustu Babatan', NULL, 'Jl. Raya Babatan', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(148, '61', 'Puskesmas Balas Klumprik', 'BALASKLUMPRIK', 'Jl. Raya Balas Klumprik', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(149, NULL, 'Pustu Ketintang', NULL, 'Jl. Prof. Supomo SH No 1', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(150, NULL, 'Pustu Dukuh Menanggal', NULL, 'Komplek kelurahan Dukuh Menanggal', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(151, '62', 'Puskesmas Siwalankerto', 'SIWALANKERTO', 'Jl. Siwalankerto No. 134', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(152, NULL, 'Pustu Bendul Merisi', NULL, 'Jl. Bendul Merisi Utara AURI 51', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(153, NULL, 'Pustu Margorejo', NULL, 'Jl. Margorejo Komplek Apol no 4', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(154, NULL, 'Pustu Pagesangan', NULL, 'Jl. Raya Pagesangan Timur No 7', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(155, NULL, 'Pustu Jambangan', NULL, 'Jl. Jambangan sawah No 3', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(156, NULL, 'Pustu Karah', NULL, 'Jl. Bibis Karah No 1', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(157, NULL, 'WEBSITE', 'WEBSITE', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(158, NULL, 'KEBERSIHAN', 'KEBERSIHAN', 'Jl. Jemursari No. 197', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(159, NULL, 'POSKESKEL SONOKWIJENAN', 'SONOKWIJENAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(160, NULL, 'POSKESKEL PUTAT GEDE', 'PUTAT GEDE', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(161, NULL, 'POSKESKEL TANJUNGSARI', 'TANJUNGSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(162, NULL, 'POSKESKEL SUKOMANUNGGAL', 'SUKOMANUNGGAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(163, NULL, 'POSKESKEL SIMOMULYO', 'SIMOMULYO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(164, NULL, 'POSKESKEL BANJAR SUGIHAN', 'BANJAR SUGIHAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(165, NULL, 'POSKESKEL MANUKAN KULON', 'MANUKAN KULON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(166, NULL, 'POSKESKEL MANUKAN WETAN', 'MANUKAN WETAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(167, NULL, 'POSKESKEL BUNTARAN', 'BUNTARAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(168, NULL, 'POSKESKEL GADEL', 'GADEL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(169, NULL, 'POSKESKEL TANDES LOR', 'TANDES LOR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(170, NULL, 'POSKESKEL TUBANAN', 'TUBANAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(171, NULL, 'POSKESKEL BIBIS', 'BIBIS', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(172, NULL, 'POSKESKEL KARANGPOH', 'KARANGPOH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(173, NULL, 'POSKESKEL BALONGSARI', 'BALONGSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(174, NULL, 'POSKESKEL GEDANGASIN', 'GEDANGASIN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(175, NULL, 'POSKESKEL TADES KIDUL', 'TADES KIDUL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(176, NULL, 'POSKESKEL GREGES', 'GREGES', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(177, NULL, 'POSKESKEL TAMBAK LANGON', 'TAMBAK LANGON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(178, NULL, 'POSKESKEL ASEMROWO', 'ASEMROWO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(179, NULL, 'POSKESKEL GENTING', 'GENTING', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(180, NULL, 'POSKESKEL KALIANAK', 'KALIANAK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(181, NULL, 'POSKESKEL KANDANGAN', 'KANDANGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(182, NULL, 'POSKESKEL TAMBAKOSO WILANGON', 'TAMBAKOSO WILANGON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(183, NULL, 'POSKESKEL SEMEMI', 'SEMEMI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(184, NULL, 'POSKESKEL ROMOKALISARI', 'ROMOKALISARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(185, NULL, 'POSKESKEL KLAKAH REJO', 'KLAKAH REJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(186, NULL, 'POSKESKEL BENOWO', 'BENOWO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(187, NULL, 'POSKESKEL TAMBAKDONO', 'TAMBAKDONO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(188, NULL, 'POSKESKEL PAKAL', 'PAKAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(189, NULL, 'POSKESKEL BABAT JERAWAT', 'BABAT JERAWAT', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(190, NULL, 'POSKESKEL SOMBEREJO', 'SOMBEREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(191, NULL, 'POSKESKEL JERUK', 'JERUK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(192, NULL, 'POSKESKEL LAKARSANTRI', 'LAKARSANTRI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(193, NULL, 'POSKESKEL LIDAH KULON', 'LIDAH KULON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(194, NULL, 'POSKESKEL LIDAH WETAN', 'LIDAH WETAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(195, NULL, 'POSKESKEL SAMBIKEREP', 'SAMBIKEREP', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(196, NULL, 'POSKESKEL LONTAR', 'LONTAR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(197, NULL, 'POSKESKEL GENTENG', 'GENTENG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(198, NULL, 'POSKESKEL KAPASARI', 'KAPASARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(199, NULL, 'POSKESKEL PENELEH', 'PENELEH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(200, NULL, 'POSKESKEL KETABANG', 'KETABANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(201, NULL, 'POSKESKEL EMBONG KALIASIN', 'EMBONG KALIASIN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(202, NULL, 'POSKESKEL KEDUNGDORO', 'KEDUNGDORO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(203, NULL, 'POSKESKEL TEGALSARI', 'TEGALSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(204, NULL, 'POSKESKEL DR. SUTOMO', 'DR. SUTOMO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(205, NULL, 'POSKESKEL WONOREJO', 'WONOREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(206, NULL, 'POSKESKEL KEPUTRAN', 'KEPUTRAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(207, NULL, 'POSKESKEL ALON ALON CONTONG', 'ALON ALON CONTONG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(208, NULL, 'POSKESKEL TEMBOK DUKUH', 'TEMBOK DUKUH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(209, NULL, 'POSKESKEL JEPARA', 'JEPARA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(210, NULL, 'POSKESKEL GUNDIH', 'GUNDIH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(211, NULL, 'POSKESKEL BUBUTAN', 'BUBUTAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(212, NULL, 'POSKESKEL KAPASAN', 'KAPASAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(213, NULL, 'POSKESKEL TAMBAKREJO', 'TAMBAKREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(214, NULL, 'POSKESKEL SIMOKERTO', 'SIMOKERTO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(215, NULL, 'POSKESKEL SIDODADI', 'SIDODADI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(216, NULL, 'POSKESKEL SIMOLAWANG', 'SIMOLAWANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(217, NULL, 'POSKESKEL NYAMPLUNGAN', 'NYAMPLUNGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(218, NULL, 'POSKESKEL BONGKARAN', 'BONGKARAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(219, NULL, 'POSKESKEL KREMBANGAN UTARA', 'KREMBANGAN UTARA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(220, NULL, 'POSKESKEL PERAK TIMUR', 'PERAK TIMUR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(221, NULL, 'POSKESKEL PERAK UTARA', 'PERAK UTARA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(222, NULL, 'POSKESKEL PEGIRIAN', 'PEGIRIAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(223, NULL, 'POSKESKEL UJUNG', 'UJUNG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(224, NULL, 'POSKESKEL AMPEL', 'AMPEL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(225, NULL, 'POSKESKEL SIDOTOPO', 'SIDOTOPO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(226, NULL, 'POSKESKEL WONOKUSUMO', 'WONOKUSUMO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(227, NULL, 'POSKESKEL PERAK BARAT', 'PERAK BARAT', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(228, NULL, 'POSKESKEL KEMAYORAN', 'KEMAYORAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(229, NULL, 'POSKESKEL KREMBANGAN SELATAN', 'KREMBANGAN SELATAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(230, NULL, 'POSKESKEL DUPAK', 'DUPAK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(231, NULL, 'POSKESKEL MOROKREMBANGAN', 'MOROKREMBANGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(232, NULL, 'POSKESKEL KENJERAN', 'KENJERAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(233, NULL, 'POSKESKEL KOMPLEK KENJERAN', 'KOMPLEK KENJERAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(234, NULL, 'POSKESKEL BULAK', 'BULAK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(235, NULL, 'POSKESKEL SUKOLILO', 'SUKOLILO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(236, NULL, 'POSKESKEL KEDUNG COWEK', 'KEDUNG COWEK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(237, NULL, 'POSKESKEL TANAH KALI KEDINDING', 'TANAH KALI KEDINDING', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(238, NULL, 'POSKESKEL BULAK BANTENG', 'BULAK BANTENG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(239, NULL, 'POSKESKEL TAMBAK WEDI', 'TAMBAK WEDI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(240, NULL, 'POSKESKEL SIDOTOPO WETAN', 'SIDOTOPO WETAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(241, NULL, 'POSKESKEL RANGKAH', 'RANGKAH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(242, NULL, 'POSKESKEL TAMBAKSARI', 'TAMBAKSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(243, NULL, 'POSKESKEL PLOSO', 'PLOSO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(244, NULL, 'POSKESKEL PACAR KEMBANG', 'PACAR KEMBANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(245, NULL, 'POSKESKEL PACAR KELING', 'PACAR KELING', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(246, NULL, 'POSKESKEL GADING', 'GADING', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(247, NULL, 'POSKESKEL AIRLANGGA', 'AIRLANGGA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(248, NULL, 'POSKESKEL KERTAJAYA', 'KERTAJAYA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(249, NULL, 'POSKESKEL PUCANG SEWU', 'PUCANG SEWU', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(250, NULL, 'POSKESKEL GUBENG', 'GUBENG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(251, NULL, 'POSKESKEL MOJO', 'MOJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(252, NULL, 'POSKESKEL BARATAJAYA', 'BARATAJAYA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(253, NULL, 'POSKESKEL RUNGKUT KIDUL', 'RUNGKUT KIDUL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(254, NULL, 'POSKESKEL KEDUNG BARUK', 'KEDUNG BARUK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(255, NULL, 'POSKESKEL KALI RUNGKUT', 'KALI RUNGKUT', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(256, NULL, 'POSKESKEL MEDOKAN AYU', 'MEDOKAN AYU', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(257, NULL, 'POSKESKEL WONOREJO', 'WONOREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(258, NULL, 'POSKESKEL PENJARINGANSARI', 'PENJARINGANSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(259, NULL, 'POSKESKEL PRAPEN', 'PRAPEN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(260, NULL, 'POSKESKEL KUTISARI', 'KUTISARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(261, NULL, 'POSKESKEL KENDANGSARI', 'KENDANGSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(262, NULL, 'POSKESKEL TENGGILIS', 'TENGGILIS', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(263, NULL, 'POSKESKEL PANJANG JIWO', 'PANJANG JIWO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(264, NULL, 'POSKESKEL RUNGKUT MENANGGAL', 'RUNGKUT MENANGGAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(265, NULL, 'POSKESKEL RUNGKUT TENGAH', 'RUNGKUT TENGAH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(266, NULL, 'POSKESKEL GUNUNG ANYAR', 'GUNUNG ANYAR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(267, NULL, 'POSKESKEL GUNUNG ANYAR TAMBAK', 'GUNUNG ANYAR TAMBAK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(268, NULL, 'POSKESKEL KLAMPIS NGASEM', 'KLAMPIS NGASEM', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(269, NULL, 'POSKESKEL SEMOLOWARU', 'SEMOLOWARU', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(270, NULL, 'POSKESKEL NGINDEN JANGKUNGAN', 'NGINDEN JANGKUNGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(271, NULL, 'POSKESKEL MENUR PUMPUNGAN', 'MENUR PUMPUNGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(272, NULL, 'POSKESKEL GEBANG PUTIH', 'GEBANG PUTIH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(273, NULL, 'POSKESKEL KALIJUDAN', 'KALIJUDAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(274, NULL, 'POSKESKEL SUTOREJO', 'SUTOREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(275, NULL, 'POSKESKEL KALISARI', 'KALISARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(276, NULL, 'POSKESKEL KEJAWAN PUTIH TAMBAK', 'KEJAWAN PUTIH TAMBAK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(277, NULL, 'POSKESKEL MANYAR SABRANGAN', 'MANYAR SABRANGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(278, NULL, 'POSKESKEL MULYOREJO', 'MULYOREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(279, NULL, 'POSKESKEL PETEMON', 'PETEMON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(280, NULL, 'POSKESKEL SAWAHAN', 'SAWAHAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(281, NULL, 'POSKESKEL PUTAT JAYA', 'PUTAT JAYA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(282, NULL, 'POSKESKEL BANYU URIP', 'BANYU URIP', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(283, NULL, 'POSKESKEL KUPANG KRAJAN', 'KUPANG KRAJAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(284, NULL, 'POSKESKEL PAKIS', 'PAKIS', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(285, NULL, 'POSKESKEL DARMO', 'DARMO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(286, NULL, 'POSKESKEL SAWUNGGALING', 'SAWUNGGALING', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(287, NULL, 'POSKESKEL JAGIR', 'JAGIR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(288, NULL, 'POSKESKEL WONOKROMO', 'WONOKROMO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(289, NULL, 'POSKESKEL NGAGEL', 'NGAGEL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(290, NULL, 'POSKESKEL NGAGELREJO', 'NGAGELREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(291, NULL, 'POSKESKEL KEDURUS', 'KEDURUS', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(292, NULL, 'POSKESKEL KARANGPILANG', 'KARANGPILANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(293, NULL, 'POSKESKEL KEBRAON', 'KEBRAON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(294, NULL, 'POSKESKEL WARUGUNUNG', 'WARUGUNUNG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(295, NULL, 'POSKESKEL DUKUH PAKIS', 'DUKUH PAKIS', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(296, NULL, 'POSKESKEL PRADAH KALI KENDAL', 'PRADAH KALI KENDAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(297, NULL, 'POSKESKEL DUKUH KUPANG', 'DUKUH KUPANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(298, NULL, 'POSKESKEL GUNUNGSARI', 'GUNUNGSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(299, NULL, 'POSKESKEL JAJAR TUNGGAL', 'JAJAR TUNGGAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(300, NULL, 'POSKESKEL WIYUNG', 'WIYUNG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(301, NULL, 'POSKESKEL BABATAN', 'BABATAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(302, NULL, 'POSKESKEL GAYUNGAN', 'GAYUNGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(303, NULL, 'POSKESKEL MENANGGAL', 'MENANGGAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(304, NULL, 'POSKESKEL DUKUH MENANGGAL', 'DUKUH MENANGGAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(305, NULL, 'POSKESKEL KETINTANG', 'KETINTANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(306, NULL, 'POSKESKEL JEMUR WONOSARI', 'JEMUR WONOSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(307, NULL, 'POSKESKEL SIDOSERMO', 'SIDOSERMO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(308, NULL, 'POSKESKEL BENDUL MERISI', 'BENDUL MERISI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(309, NULL, 'POSKESKEL MARGOREJO', 'MARGOREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(310, NULL, 'POSKESKEL JAMBANGAN', 'JAMBANGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(311, NULL, 'POSKESKEL PAGESANGAN', 'PAGESANGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(312, NULL, 'POSKESKEL KEBONSARI', 'KEBONSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(313, NULL, 'POSKESKEL KARAH', 'KARAH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(314, NULL, 'POSKESKEL SUMUR WELUT', 'SUMUR WELUT', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(315, NULL, 'POSKESKEL BANGKINGAN', 'BANGKINGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(316, NULL, 'POSKESKEL MADE', 'MADE', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(317, NULL, 'POSKESKEL BRINGIN', 'BRINGIN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(318, NULL, 'POSKESKEL KEPUTIH', 'KEPUTIH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(319, NULL, 'POSKESKEL MEDOKAN SEMAMPIR', 'MEDOKAN SEMAMPIR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(320, NULL, 'POSKESKEL BALAS KLUMPRIK', 'BALAS KLUMPRIK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(321, NULL, 'POSKESKEL SIWALANKERTO', 'SIWALANKERTO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(322, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(323, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(324, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(325, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(326, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(327, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(328, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(329, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(330, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(331, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(332, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(333, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(334, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(335, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(336, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(337, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(338, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(339, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(340, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(341, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(342, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(343, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(344, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(345, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(346, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(347, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(348, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(349, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(350, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(351, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(352, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(353, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(354, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(355, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(356, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(357, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(358, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(359, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(360, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(361, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(362, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(363, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(364, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(365, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(366, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(367, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(368, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(369, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(370, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(371, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(372, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(373, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(374, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(375, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(376, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(377, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(378, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(379, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(380, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(381, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(382, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(383, NULL, 'PUSLING1', 'PUSLING1', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(384, NULL, 'POSYANDU BALITA WARUGUNUNG', 'POSYANDU BALITA WARUGUNUNG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(385, NULL, 'POSYANDU BALITA KARANGPILANG', 'POSYANDU BALITA KARANGPILANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(386, NULL, 'POSYANDU BALITA KEBRAON', 'POSYANDU BALITA KEBRAON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(387, NULL, 'POSYANDU BALITA KEDURUS', 'POSYANDU BALITA KEDURUS', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(388, NULL, 'POSYANDU BALITA PAGESANGAN', 'POSYANDU BALITA PAGESANGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(389, NULL, 'POSYANDU BALITA KEBONSARI', 'POSYANDU BALITA KEBONSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(390, NULL, 'POSYANDU BALITA JAMBANGAN', 'POSYANDU BALITA JAMBANGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(391, NULL, 'POSYANDU BALITA KARAH', 'POSYANDU BALITA KARAH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(392, NULL, 'POSYANDU BALITA DUKUH MENANGGAL', 'POSYANDU BALITA DUKUH MENANGGAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(393, NULL, 'POSYANDU BALITA MENANGGAL', 'POSYANDU BALITA MENANGGAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(394, NULL, 'POSYANDU BALITA GAYUNGAN', 'POSYANDU BALITA GAYUNGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(395, NULL, 'POSYANDU BALITA KETINTANG', 'POSYANDU BALITA KETINTANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(396, NULL, 'POSYANDU BALITA SIWALANKERTO', 'POSYANDU BALITA SIWALANKERTO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(397, NULL, 'POSYANDU BALITA JEMUR WONOSARI', 'POSYANDU BALITA JEMUR WONOSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(398, NULL, 'POSYANDU BALITA MARGOREJO', 'POSYANDU BALITA MARGOREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(399, NULL, 'POSYANDU BALITA BENDUL MERISI', 'POSYANDU BALITA BENDUL MERISI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(400, NULL, 'POSYANDU BALITA SIDOSERMO', 'POSYANDU BALITA SIDOSERMO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(401, NULL, 'POSYANDU BALITA KUTISARI', 'POSYANDU BALITA KUTISARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(402, NULL, 'POSYANDU BALITA KENDANGSARI', 'POSYANDU BALITA KENDANGSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(403, NULL, 'POSYANDU BALITA TENGGILIS', 'POSYANDU BALITA TENGGILIS', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(404, NULL, 'POSYANDU BALITA PRAPEN', 'POSYANDU BALITA PRAPEN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(405, NULL, 'POSYANDU BALITA PANJANG JIWO', 'POSYANDU BALITA PANJANG JIWO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(406, NULL, 'POSYANDU BALITA RUNGKUT MENANGGAL', 'POSYANDU BALITA RUNGKUT MENANGGAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(407, NULL, 'POSYANDU BALITA RUNGKUT TENGAH', 'POSYANDU BALITA RUNGKUT TENGAH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(408, NULL, 'POSYANDU BALITA GUNUNG ANYAR', 'POSYANDU BALITA GUNUNG ANYAR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(409, NULL, 'POSYANDU BALITA GUNUNG ANYAR TAMBAK', 'POSYANDU BALITA GUNUNG ANYAR TAMBAK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(410, NULL, 'POSYANDU BALITA RUNGKUT KIDUL', 'POSYANDU BALITA RUNGKUT KIDUL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(411, NULL, 'POSYANDU BALITA MEDOKAN AYU', 'POSYANDU BALITA MEDOKAN AYU', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(412, NULL, 'POSYANDU BALITA WONOREJO', 'POSYANDU BALITA WONOREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(413, NULL, 'POSYANDU BALITA PENJARINGANSARI', 'POSYANDU BALITA PENJARINGANSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(414, NULL, 'POSYANDU BALITA KEDUNG BARUK', 'POSYANDU BALITA KEDUNG BARUK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(415, NULL, 'POSYANDU BALITA KALI RUNGKUT', 'POSYANDU BALITA KALI RUNGKUT', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(416, NULL, 'POSYANDU BALITA NGINDEN JANGKUNGAN', 'POSYANDU BALITA NGINDEN JANGKUNGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(417, NULL, 'POSYANDU BALITA SEMOLOWARU', 'POSYANDU BALITA SEMOLOWARU', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(418, NULL, 'POSYANDU BALITA MEDOKAN SEMAMPIR', 'POSYANDU BALITA MEDOKAN SEMAMPIR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(419, NULL, 'POSYANDU BALITA KEPUTIH', 'POSYANDU BALITA KEPUTIH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(420, NULL, 'POSYANDU BALITA GEBANG PUTIH', 'POSYANDU BALITA GEBANG PUTIH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(421, NULL, 'POSYANDU BALITA KLAMPIS NGASEM', 'POSYANDU BALITA KLAMPIS NGASEM', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(422, NULL, 'POSYANDU BALITA MENUR PUMPUNGAN', 'POSYANDU BALITA MENUR PUMPUNGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(423, NULL, 'POSYANDU BALITA MANYAR SABRANGAN', 'POSYANDU BALITA MANYAR SABRANGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(424, NULL, 'POSYANDU BALITA MULYOREJO', 'POSYANDU BALITA MULYOREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(425, NULL, 'POSYANDU BALITA KEJAWAN PUTIH TAMBAK', 'POSYANDU BALITA KEJAWAN PUTIH TAMBAK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(426, NULL, 'POSYANDU BALITA KALISARI', 'POSYANDU BALITA KALISARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(427, NULL, 'POSYANDU BALITA SUTOREJO', 'POSYANDU BALITA SUTOREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(428, NULL, 'POSYANDU BALITA KALIJUDAN', 'POSYANDU BALITA KALIJUDAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(429, NULL, 'POSYANDU BALITA BARATAJAYA', 'POSYANDU BALITA BARATAJAYA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(430, NULL, 'POSYANDU BALITA PUCANG SEWU', 'POSYANDU BALITA PUCANG SEWU', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(431, NULL, 'POSYANDU BALITA KERTAJAYA', 'POSYANDU BALITA KERTAJAYA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(432, NULL, 'POSYANDU BALITA GUBENG', 'POSYANDU BALITA GUBENG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(433, NULL, 'POSYANDU BALITA AIRLANGGA', 'POSYANDU BALITA AIRLANGGA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(434, NULL, 'POSYANDU BALITA MOJO', 'POSYANDU BALITA MOJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(435, NULL, 'POSYANDU BALITA SAWUNGGALING', 'POSYANDU BALITA SAWUNGGALING', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(436, NULL, 'POSYANDU BALITA WONOKROMO', 'POSYANDU BALITA WONOKROMO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(437, NULL, 'POSYANDU BALITA JAGIR', 'POSYANDU BALITA JAGIR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(438, NULL, 'POSYANDU BALITA NGAGELREJO', 'POSYANDU BALITA NGAGELREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(439, NULL, 'POSYANDU BALITA NGAGEL', 'POSYANDU BALITA NGAGEL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(440, NULL, 'POSYANDU BALITA DARMO', 'POSYANDU BALITA DARMO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(441, NULL, 'POSYANDU BALITA GUNUNGSARI', 'POSYANDU BALITA GUNUNGSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(442, NULL, 'POSYANDU BALITA DUKUH PAKIS', 'POSYANDU BALITA DUKUH PAKIS', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(443, NULL, 'POSYANDU BALITA PRADAH KALI KENDAL', 'POSYANDU BALITA PRADAH KALI KENDAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(444, NULL, 'POSYANDU BALITA DUKUH KUPANG', 'POSYANDU BALITA DUKUH KUPANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(445, NULL, 'POSYANDU BALITA BALAS KLUMPRIK', 'POSYANDU BALITA BALAS KLUMPRIK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(446, NULL, 'POSYANDU BALITA BABATAN', 'POSYANDU BALITA BABATAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(447, NULL, 'POSYANDU BALITA WIYUNG', 'POSYANDU BALITA WIYUNG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(448, NULL, 'POSYANDU BALITA JAJAR TUNGGAL', 'POSYANDU BALITA JAJAR TUNGGAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(449, NULL, 'POSYANDU BALITA BANGKINGAN', 'POSYANDU BALITA BANGKINGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(450, NULL, 'POSYANDU BALITA SUMUR WELUT', 'POSYANDU BALITA SUMUR WELUT', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(451, NULL, 'POSYANDU BALITA LIDAH WETAN', 'POSYANDU BALITA LIDAH WETAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(452, NULL, 'POSYANDU BALITA LIDAH KULON', 'POSYANDU BALITA LIDAH KULON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(453, NULL, 'POSYANDU BALITA JERUK', 'POSYANDU BALITA JERUK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(454, NULL, 'POSYANDU BALITA LAKARSANTRI', 'POSYANDU BALITA LAKARSANTRI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(455, NULL, 'POSYANDU BALITA MADE', 'POSYANDU BALITA MADE', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(456, NULL, 'POSYANDU BALITA BRINGIN', 'POSYANDU BALITA BRINGIN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(457, NULL, 'POSYANDU BALITA SAMBIKEREP', 'POSYANDU BALITA SAMBIKEREP', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(458, NULL, 'POSYANDU BALITA LONTAR', 'POSYANDU BALITA LONTAR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(459, NULL, 'POSYANDU BALITA GADEL', 'POSYANDU BALITA GADEL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(460, NULL, 'POSYANDU BALITA TUBANAN', 'POSYANDU BALITA TUBANAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(461, NULL, 'POSYANDU BALITA TANDES LOR', 'POSYANDU BALITA TANDES LOR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(462, NULL, 'POSYANDU BALITA TADES KIDUL', 'POSYANDU BALITA TADES KIDUL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(463, NULL, 'POSYANDU BALITA GEDANGASIN', 'POSYANDU BALITA GEDANGASIN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(464, NULL, 'POSYANDU BALITA KARANGPOH', 'POSYANDU BALITA KARANGPOH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(465, NULL, 'POSYANDU BALITA BALONGSARI', 'POSYANDU BALITA BALONGSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(466, NULL, 'POSYANDU BALITA BIBIS', 'POSYANDU BALITA BIBIS', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(467, NULL, 'POSYANDU BALITA MANUKAN WETAN', 'POSYANDU BALITA MANUKAN WETAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(468, NULL, 'POSYANDU BALITA MANUKAN KULON', 'POSYANDU BALITA MANUKAN KULON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(469, NULL, 'POSYANDU BALITA BANJAR SUGIHAN', 'POSYANDU BALITA BANJAR SUGIHAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(470, NULL, 'POSYANDU BALITA BUNTARAN', 'POSYANDU BALITA BUNTARAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(471, NULL, 'POSYANDU BALITA PUTAT GEDE', 'POSYANDU BALITA PUTAT GEDE', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(472, NULL, 'POSYANDU BALITA SONOKWIJENAN', 'POSYANDU BALITA SONOKWIJENAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(473, NULL, 'POSYANDU BALITA SIMOMULYO', 'POSYANDU BALITA SIMOMULYO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(474, NULL, 'POSYANDU BALITA SUKOMANUNGGAL', 'POSYANDU BALITA SUKOMANUNGGAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(475, NULL, 'POSYANDU BALITA TANJUNGSARI', 'POSYANDU BALITA TANJUNGSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(476, NULL, 'POSYANDU BALITA PAKIS', 'POSYANDU BALITA PAKIS', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(477, NULL, 'POSYANDU BALITA PUTAT JAYA', 'POSYANDU BALITA PUTAT JAYA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(478, NULL, 'POSYANDU BALITA BANYU URIP', 'POSYANDU BALITA BANYU URIP', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(479, NULL, 'POSYANDU BALITA KUPANG KRAJAN', 'POSYANDU BALITA KUPANG KRAJAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(480, NULL, 'POSYANDU BALITA PETEMON', 'POSYANDU BALITA PETEMON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(481, NULL, 'POSYANDU BALITA SAWAHAN', 'POSYANDU BALITA SAWAHAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(482, NULL, 'POSYANDU BALITA KEPUTRAN', 'POSYANDU BALITA KEPUTRAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(483, NULL, 'POSYANDU BALITA DR. SUTOMO', 'POSYANDU BALITA DR. SUTOMO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(484, NULL, 'POSYANDU BALITA TEGALSARI', 'POSYANDU BALITA TEGALSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(485, NULL, 'POSYANDU BALITA WONOREJO', 'POSYANDU BALITA WONOREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(486, NULL, 'POSYANDU BALITA KEDUNGDORO', 'POSYANDU BALITA KEDUNGDORO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(487, NULL, 'POSYANDU BALITA EMBONG KALIASIN', 'POSYANDU BALITA EMBONG KALIASIN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(488, NULL, 'POSYANDU BALITA KETABANG', 'POSYANDU BALITA KETABANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(489, NULL, 'POSYANDU BALITA GENTENG', 'POSYANDU BALITA GENTENG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(490, NULL, 'POSYANDU BALITA PENELEH', 'POSYANDU BALITA PENELEH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(491, NULL, 'POSYANDU BALITA KAPASARI', 'POSYANDU BALITA KAPASARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(492, NULL, 'POSYANDU BALITA PACAR KELING', 'POSYANDU BALITA PACAR KELING', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(493, NULL, 'POSYANDU BALITA PACAR KEMBANG', 'POSYANDU BALITA PACAR KEMBANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(494, NULL, 'POSYANDU BALITA PLOSO', 'POSYANDU BALITA PLOSO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(495, NULL, 'POSYANDU BALITA TAMBAKSARI', 'POSYANDU BALITA TAMBAKSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(496, NULL, 'POSYANDU BALITA RANGKAH', 'POSYANDU BALITA RANGKAH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(497, NULL, 'POSYANDU BALITA GADING', 'POSYANDU BALITA GADING', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(498, NULL, 'POSYANDU BALITA TANAH KALI KEDINDING', 'POSYANDU BALITA TANAH KALI KEDINDING', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(499, NULL, 'POSYANDU BALITA SIDOTOPO WETAN', 'POSYANDU BALITA SIDOTOPO WETAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(500, NULL, 'POSYANDU BALITA BULAK BANTENG', 'POSYANDU BALITA BULAK BANTENG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(501, NULL, 'POSYANDU BALITA TAMBAK WEDI', 'POSYANDU BALITA TAMBAK WEDI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(502, NULL, 'POSYANDU BALITA SUKOLILO', 'POSYANDU BALITA SUKOLILO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(503, NULL, 'POSYANDU BALITA KOMPLEK KENJERAN', 'POSYANDU BALITA KOMPLEK KENJERAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(504, NULL, 'POSYANDU BALITA KENJERAN', 'POSYANDU BALITA KENJERAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(505, NULL, 'POSYANDU BALITA BULAK', 'POSYANDU BALITA BULAK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(506, NULL, 'POSYANDU BALITA KEDUNG COWEK', 'POSYANDU BALITA KEDUNG COWEK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(507, NULL, 'POSYANDU BALITA KAPASAN', 'POSYANDU BALITA KAPASAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(508, NULL, 'POSYANDU BALITA TAMBAKREJO', 'POSYANDU BALITA TAMBAKREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(509, NULL, 'POSYANDU BALITA SIMOKERTO', 'POSYANDU BALITA SIMOKERTO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(510, NULL, 'POSYANDU BALITA SIDODADI', 'POSYANDU BALITA SIDODADI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(511, NULL, 'POSYANDU BALITA SIMOLAWANG', 'POSYANDU BALITA SIMOLAWANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(512, NULL, 'POSYANDU BALITA AMPEL', 'POSYANDU BALITA AMPEL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(513, NULL, 'POSYANDU BALITA SIDOTOPO', 'POSYANDU BALITA SIDOTOPO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(514, NULL, 'POSYANDU BALITA PEGIRIAN', 'POSYANDU BALITA PEGIRIAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(515, NULL, 'POSYANDU BALITA WONOKUSUMO', 'POSYANDU BALITA WONOKUSUMO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(516, NULL, 'POSYANDU BALITA UJUNG', 'POSYANDU BALITA UJUNG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(517, NULL, 'POSYANDU BALITA BONGKARAN', 'POSYANDU BALITA BONGKARAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(518, NULL, 'POSYANDU BALITA NYAMPLUNGAN', 'POSYANDU BALITA NYAMPLUNGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(519, NULL, 'POSYANDU BALITA KREMBANGAN UTARA', 'POSYANDU BALITA KREMBANGAN UTARA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(520, NULL, 'POSYANDU BALITA PERAK TIMUR', 'POSYANDU BALITA PERAK TIMUR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(521, NULL, 'POSYANDU BALITA PERAK UTARA', 'POSYANDU BALITA PERAK UTARA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(522, NULL, 'POSYANDU BALITA TEMBOK DUKUH', 'POSYANDU BALITA TEMBOK DUKUH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(523, NULL, 'POSYANDU BALITA BUBUTAN', 'POSYANDU BALITA BUBUTAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(524, NULL, 'POSYANDU BALITA ALON ALON CONTONG', 'POSYANDU BALITA ALON ALON CONTONG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(525, NULL, 'POSYANDU BALITA GUNDIH', 'POSYANDU BALITA GUNDIH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(526, NULL, 'POSYANDU BALITA JEPARA', 'POSYANDU BALITA JEPARA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(527, NULL, 'POSYANDU BALITA DUPAK', 'POSYANDU BALITA DUPAK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(528, NULL, 'POSYANDU BALITA MOROKREMBANGAN', 'POSYANDU BALITA MOROKREMBANGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(529, NULL, 'POSYANDU BALITA PERAK BARAT', 'POSYANDU BALITA PERAK BARAT', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(530, NULL, 'POSYANDU BALITA KEMAYORAN', 'POSYANDU BALITA KEMAYORAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(531, NULL, 'POSYANDU BALITA KREMBANGAN SELATAN', 'POSYANDU BALITA KREMBANGAN SELATAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(532, NULL, 'POSYANDU BALITA TAMBAK LANGON', 'POSYANDU BALITA TAMBAK LANGON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(533, NULL, 'POSYANDU BALITA GREGES', 'POSYANDU BALITA GREGES', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(534, NULL, 'POSYANDU BALITA ASEMROWO', 'POSYANDU BALITA ASEMROWO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(535, NULL, 'POSYANDU BALITA GENTING', 'POSYANDU BALITA GENTING', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(536, NULL, 'POSYANDU BALITA KALIANAK', 'POSYANDU BALITA KALIANAK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(537, NULL, 'POSYANDU BALITA SEMEMI', 'POSYANDU BALITA SEMEMI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(538, NULL, 'POSYANDU BALITA KLAKAH REJO', 'POSYANDU BALITA KLAKAH REJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(539, NULL, 'POSYANDU BALITA KANDANGAN', 'POSYANDU BALITA KANDANGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(540, NULL, 'POSYANDU BALITA TAMBAKOSO WILANGON', 'POSYANDU BALITA TAMBAKOSO WILANGON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(541, NULL, 'POSYANDU BALITA ROMOKALISARI', 'POSYANDU BALITA ROMOKALISARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(542, NULL, 'POSYANDU BALITA BABAT JERAWAT', 'POSYANDU BALITA BABAT JERAWAT', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(543, NULL, 'POSYANDU BALITA PAKAL', 'POSYANDU BALITA PAKAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(544, NULL, 'POSYANDU BALITA BENOWO', 'POSYANDU BALITA BENOWO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(545, NULL, 'POSYANDU BALITA SOMBEREJO', 'POSYANDU BALITA SOMBEREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(546, NULL, 'POSYANDU BALITA TAMBAKDONO', 'POSYANDU BALITA TAMBAKDONO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(547, NULL, 'POSYANDU LANSIA WARUGUNUNG', 'POSYANDU LANSIA POSYANDU LANSIA WARUGUNUNG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(548, NULL, 'POSYANDU LANSIA KARANGPILANG', 'POSYANDU LANSIA POSYANDU LANSIA KARANGPILANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(549, NULL, 'POSYANDU LANSIA KEBRAON', 'POSYANDU LANSIA POSYANDU LANSIA KEBRAON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(550, NULL, 'POSYANDU LANSIA KEDURUS', 'POSYANDU LANSIA POSYANDU LANSIA KEDURUS', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(551, NULL, 'POSYANDU LANSIA PAGESANGAN', 'POSYANDU LANSIA POSYANDU LANSIA PAGESANGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(552, NULL, 'POSYANDU LANSIA KEBONSARI', 'POSYANDU LANSIA POSYANDU LANSIA KEBONSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(553, NULL, 'POSYANDU LANSIA JAMBANGAN', 'POSYANDU LANSIA POSYANDU LANSIA JAMBANGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(554, NULL, 'POSYANDU LANSIA KARAH', 'POSYANDU LANSIA POSYANDU LANSIA KARAH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(555, NULL, 'POSYANDU LANSIA DUKUH MENANGGAL', 'POSYANDU LANSIA POSYANDU LANSIA DUKUH MENANGGAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(556, NULL, 'POSYANDU LANSIA MENANGGAL', 'POSYANDU LANSIA POSYANDU LANSIA MENANGGAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(557, NULL, 'POSYANDU LANSIA GAYUNGAN', 'POSYANDU LANSIA POSYANDU LANSIA GAYUNGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(558, NULL, 'POSYANDU LANSIA KETINTANG', 'POSYANDU LANSIA POSYANDU LANSIA KETINTANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(559, NULL, 'POSYANDU LANSIA SIWALANKERTO', 'POSYANDU LANSIA POSYANDU LANSIA SIWALANKERTO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(560, NULL, 'POSYANDU LANSIA JEMUR WONOSARI', 'POSYANDU LANSIA POSYANDU LANSIA JEMUR WONOSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(561, NULL, 'POSYANDU LANSIA MARGOREJO', 'POSYANDU LANSIA POSYANDU LANSIA MARGOREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(562, NULL, 'POSYANDU LANSIA BENDUL MERISI', 'POSYANDU LANSIA POSYANDU LANSIA BENDUL MERISI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(563, NULL, 'POSYANDU LANSIA SIDOSERMO', 'POSYANDU LANSIA POSYANDU LANSIA SIDOSERMO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(564, NULL, 'POSYANDU LANSIA KUTISARI', 'POSYANDU LANSIA POSYANDU LANSIA KUTISARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(565, NULL, 'POSYANDU LANSIA KENDANGSARI', 'POSYANDU LANSIA POSYANDU LANSIA KENDANGSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(566, NULL, 'POSYANDU LANSIA TENGGILIS', 'POSYANDU LANSIA POSYANDU LANSIA TENGGILIS', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(567, NULL, 'POSYANDU LANSIA PRAPEN', 'POSYANDU LANSIA POSYANDU LANSIA PRAPEN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(568, NULL, 'POSYANDU LANSIA PANJANG JIWO', 'POSYANDU LANSIA POSYANDU LANSIA PANJANG JIWO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(569, NULL, 'POSYANDU LANSIA RUNGKUT MENANGGAL', 'POSYANDU LANSIA POSYANDU LANSIA RUNGKUT MENANGGAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(570, NULL, 'POSYANDU LANSIA RUNGKUT TENGAH', 'POSYANDU LANSIA POSYANDU LANSIA RUNGKUT TENGAH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(571, NULL, 'POSYANDU LANSIA GUNUNG ANYAR', 'POSYANDU LANSIA POSYANDU LANSIA GUNUNG ANYAR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(572, NULL, 'POSYANDU LANSIA GUNUNG ANYAR TAMBAK', 'POSYANDU LANSIA POSYANDU LANSIA GUNUNG ANYAR TAMBA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(573, NULL, 'POSYANDU LANSIA RUNGKUT KIDUL', 'POSYANDU LANSIA POSYANDU LANSIA RUNGKUT KIDUL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(574, NULL, 'POSYANDU LANSIA MEDOKAN AYU', 'POSYANDU LANSIA POSYANDU LANSIA MEDOKAN AYU', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(575, NULL, 'POSYANDU LANSIA WONOREJO', 'POSYANDU LANSIA POSYANDU LANSIA WONOREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(576, NULL, 'POSYANDU LANSIA PENJARINGANSARI', 'POSYANDU LANSIA POSYANDU LANSIA PENJARINGANSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(577, NULL, 'POSYANDU LANSIA KEDUNG BARUK', 'POSYANDU LANSIA POSYANDU LANSIA KEDUNG BARUK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(578, NULL, 'POSYANDU LANSIA KALI RUNGKUT', 'POSYANDU LANSIA POSYANDU LANSIA KALI RUNGKUT', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(579, NULL, 'POSYANDU LANSIA NGINDEN JANGKUNGAN', 'POSYANDU LANSIA POSYANDU LANSIA NGINDEN JANGKUNGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(580, NULL, 'POSYANDU LANSIA SEMOLOWARU', 'POSYANDU LANSIA POSYANDU LANSIA SEMOLOWARU', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(581, NULL, 'POSYANDU LANSIA MEDOKAN SEMAMPIR', 'POSYANDU LANSIA POSYANDU LANSIA MEDOKAN SEMAMPIR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(582, NULL, 'POSYANDU LANSIA KEPUTIH', 'POSYANDU LANSIA POSYANDU LANSIA KEPUTIH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(583, NULL, 'POSYANDU LANSIA GEBANG PUTIH', 'POSYANDU LANSIA POSYANDU LANSIA GEBANG PUTIH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(584, NULL, 'POSYANDU LANSIA KLAMPIS NGASEM', 'POSYANDU LANSIA POSYANDU LANSIA KLAMPIS NGASEM', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(585, NULL, 'POSYANDU LANSIA MENUR PUMPUNGAN', 'POSYANDU LANSIA POSYANDU LANSIA MENUR PUMPUNGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(586, NULL, 'POSYANDU LANSIA MANYAR SABRANGAN', 'POSYANDU LANSIA POSYANDU LANSIA MANYAR SABRANGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(587, NULL, 'POSYANDU LANSIA MULYOREJO', 'POSYANDU LANSIA POSYANDU LANSIA MULYOREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(588, NULL, 'POSYANDU LANSIA KEJAWAN PUTIH TAMBAK', 'POSYANDU LANSIA POSYANDU LANSIA KEJAWAN PUTIH TAMB', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(589, NULL, 'POSYANDU LANSIA KALISARI', 'POSYANDU LANSIA POSYANDU LANSIA KALISARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(590, NULL, 'POSYANDU LANSIA SUTOREJO', 'POSYANDU LANSIA POSYANDU LANSIA SUTOREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(591, NULL, 'POSYANDU LANSIA KALIJUDAN', 'POSYANDU LANSIA POSYANDU LANSIA KALIJUDAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(592, NULL, 'POSYANDU LANSIA BARATAJAYA', 'POSYANDU LANSIA POSYANDU LANSIA BARATAJAYA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(593, NULL, 'POSYANDU LANSIA PUCANG SEWU', 'POSYANDU LANSIA POSYANDU LANSIA PUCANG SEWU', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(594, NULL, 'POSYANDU LANSIA KERTAJAYA', 'POSYANDU LANSIA POSYANDU LANSIA KERTAJAYA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(595, NULL, 'POSYANDU LANSIA GUBENG', 'POSYANDU LANSIA POSYANDU LANSIA GUBENG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(596, NULL, 'POSYANDU LANSIA AIRLANGGA', 'POSYANDU LANSIA POSYANDU LANSIA AIRLANGGA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(597, NULL, 'POSYANDU LANSIA MOJO', 'POSYANDU LANSIA POSYANDU LANSIA MOJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(598, NULL, 'POSYANDU LANSIA SAWUNGGALING', 'POSYANDU LANSIA POSYANDU LANSIA SAWUNGGALING', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(599, NULL, 'POSYANDU LANSIA WONOKROMO', 'POSYANDU LANSIA POSYANDU LANSIA WONOKROMO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(600, NULL, 'POSYANDU LANSIA JAGIR', 'POSYANDU LANSIA POSYANDU LANSIA JAGIR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(601, NULL, 'POSYANDU LANSIA NGAGELREJO', 'POSYANDU LANSIA POSYANDU LANSIA NGAGELREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(602, NULL, 'POSYANDU LANSIA NGAGEL', 'POSYANDU LANSIA POSYANDU LANSIA NGAGEL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(603, NULL, 'POSYANDU LANSIA DARMO', 'POSYANDU LANSIA POSYANDU LANSIA DARMO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(604, NULL, 'POSYANDU LANSIA GUNUNGSARI', 'POSYANDU LANSIA POSYANDU LANSIA GUNUNGSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(605, NULL, 'POSYANDU LANSIA DUKUH PAKIS', 'POSYANDU LANSIA POSYANDU LANSIA DUKUH PAKIS', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(606, NULL, 'POSYANDU LANSIA PRADAH KALI KENDAL', 'POSYANDU LANSIA POSYANDU LANSIA PRADAH KALI KENDAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(607, NULL, 'POSYANDU LANSIA DUKUH KUPANG', 'POSYANDU LANSIA POSYANDU LANSIA DUKUH KUPANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(608, NULL, 'POSYANDU LANSIA BALAS KLUMPRIK', 'POSYANDU LANSIA POSYANDU LANSIA BALAS KLUMPRIK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(609, NULL, 'POSYANDU LANSIA BABATAN', 'POSYANDU LANSIA POSYANDU LANSIA BABATAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(610, NULL, 'POSYANDU LANSIA WIYUNG', 'POSYANDU LANSIA POSYANDU LANSIA WIYUNG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(611, NULL, 'POSYANDU LANSIA JAJAR TUNGGAL', 'POSYANDU LANSIA POSYANDU LANSIA JAJAR TUNGGAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(612, NULL, 'POSYANDU LANSIA BANGKINGAN', 'POSYANDU LANSIA POSYANDU LANSIA BANGKINGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(613, NULL, 'POSYANDU LANSIA SUMUR WELUT', 'POSYANDU LANSIA POSYANDU LANSIA SUMUR WELUT', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(614, NULL, 'POSYANDU LANSIA LIDAH WETAN', 'POSYANDU LANSIA POSYANDU LANSIA LIDAH WETAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(615, NULL, 'POSYANDU LANSIA LIDAH KULON', 'POSYANDU LANSIA POSYANDU LANSIA LIDAH KULON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(616, NULL, 'POSYANDU LANSIA JERUK', 'POSYANDU LANSIA POSYANDU LANSIA JERUK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(617, NULL, 'POSYANDU LANSIA LAKARSANTRI', 'POSYANDU LANSIA POSYANDU LANSIA LAKARSANTRI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(618, NULL, 'POSYANDU LANSIA MADE', 'POSYANDU LANSIA POSYANDU LANSIA MADE', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(619, NULL, 'POSYANDU LANSIA BRINGIN', 'POSYANDU LANSIA POSYANDU LANSIA BRINGIN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(620, NULL, 'POSYANDU LANSIA SAMBIKEREP', 'POSYANDU LANSIA POSYANDU LANSIA SAMBIKEREP', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(621, NULL, 'POSYANDU LANSIA LONTAR', 'POSYANDU LANSIA POSYANDU LANSIA LONTAR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(622, NULL, 'POSYANDU LANSIA GADEL', 'POSYANDU LANSIA POSYANDU LANSIA GADEL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(623, NULL, 'POSYANDU LANSIA TUBANAN', 'POSYANDU LANSIA POSYANDU LANSIA TUBANAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(624, NULL, 'POSYANDU LANSIA TANDES LOR', 'POSYANDU LANSIA POSYANDU LANSIA TANDES LOR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(625, NULL, 'POSYANDU LANSIA TADES KIDUL', 'POSYANDU LANSIA POSYANDU LANSIA TADES KIDUL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(626, NULL, 'POSYANDU LANSIA GEDANGASIN', 'POSYANDU LANSIA POSYANDU LANSIA GEDANGASIN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(627, NULL, 'POSYANDU LANSIA KARANGPOH', 'POSYANDU LANSIA POSYANDU LANSIA KARANGPOH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(628, NULL, 'POSYANDU LANSIA BALONGSARI', 'POSYANDU LANSIA POSYANDU LANSIA BALONGSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(629, NULL, 'POSYANDU LANSIA BIBIS', 'POSYANDU LANSIA POSYANDU LANSIA BIBIS', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(630, NULL, 'POSYANDU LANSIA MANUKAN WETAN', 'POSYANDU LANSIA POSYANDU LANSIA MANUKAN WETAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(631, NULL, 'POSYANDU LANSIA MANUKAN KULON', 'POSYANDU LANSIA POSYANDU LANSIA MANUKAN KULON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(632, NULL, 'POSYANDU LANSIA BANJAR SUGIHAN', 'POSYANDU LANSIA POSYANDU LANSIA BANJAR SUGIHAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(633, NULL, 'POSYANDU LANSIA BUNTARAN', 'POSYANDU LANSIA POSYANDU LANSIA BUNTARAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(634, NULL, 'POSYANDU LANSIA PUTAT GEDE', 'POSYANDU LANSIA POSYANDU LANSIA PUTAT GEDE', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(635, NULL, 'POSYANDU LANSIA SONOKWIJENAN', 'POSYANDU LANSIA POSYANDU LANSIA SONOKWIJENAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(636, NULL, 'POSYANDU LANSIA SIMOMULYO', 'POSYANDU LANSIA POSYANDU LANSIA SIMOMULYO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(637, NULL, 'POSYANDU LANSIA SUKOMANUNGGAL', 'POSYANDU LANSIA POSYANDU LANSIA SUKOMANUNGGAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(638, NULL, 'POSYANDU LANSIA TANJUNGSARI', 'POSYANDU LANSIA POSYANDU LANSIA TANJUNGSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(639, NULL, 'POSYANDU LANSIA PAKIS', 'POSYANDU LANSIA POSYANDU LANSIA PAKIS', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(640, NULL, 'POSYANDU LANSIA PUTAT JAYA', 'POSYANDU LANSIA POSYANDU LANSIA PUTAT JAYA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(641, NULL, 'POSYANDU LANSIA BANYU URIP', 'POSYANDU LANSIA POSYANDU LANSIA BANYU URIP', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(642, NULL, 'POSYANDU LANSIA KUPANG KRAJAN', 'POSYANDU LANSIA POSYANDU LANSIA KUPANG KRAJAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(643, NULL, 'POSYANDU LANSIA PETEMON', 'POSYANDU LANSIA POSYANDU LANSIA PETEMON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(644, NULL, 'POSYANDU LANSIA SAWAHAN', 'POSYANDU LANSIA POSYANDU LANSIA SAWAHAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(645, NULL, 'POSYANDU LANSIA KEPUTRAN', 'POSYANDU LANSIA POSYANDU LANSIA KEPUTRAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(646, NULL, 'POSYANDU LANSIA DR. SUTOMO', 'POSYANDU LANSIA POSYANDU LANSIA DR. SUTOMO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(647, NULL, 'POSYANDU LANSIA TEGALSARI', 'POSYANDU LANSIA POSYANDU LANSIA TEGALSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(648, NULL, 'POSYANDU LANSIA WONOREJO', 'POSYANDU LANSIA POSYANDU LANSIA WONOREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(649, NULL, 'POSYANDU LANSIA KEDUNGDORO', 'POSYANDU LANSIA POSYANDU LANSIA KEDUNGDORO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(650, NULL, 'POSYANDU LANSIA EMBONG KALIASIN', 'POSYANDU LANSIA POSYANDU LANSIA EMBONG KALIASIN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(651, NULL, 'POSYANDU LANSIA KETABANG', 'POSYANDU LANSIA POSYANDU LANSIA KETABANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(652, NULL, 'POSYANDU LANSIA GENTENG', 'POSYANDU LANSIA POSYANDU LANSIA GENTENG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(653, NULL, 'POSYANDU LANSIA PENELEH', 'POSYANDU LANSIA POSYANDU LANSIA PENELEH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(654, NULL, 'POSYANDU LANSIA KAPASARI', 'POSYANDU LANSIA POSYANDU LANSIA KAPASARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(655, NULL, 'POSYANDU LANSIA PACAR KELING', 'POSYANDU LANSIA POSYANDU LANSIA PACAR KELING', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(656, NULL, 'POSYANDU LANSIA PACAR KEMBANG', 'POSYANDU LANSIA POSYANDU LANSIA PACAR KEMBANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(657, NULL, 'POSYANDU LANSIA PLOSO', 'POSYANDU LANSIA POSYANDU LANSIA PLOSO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(658, NULL, 'POSYANDU LANSIA TAMBAKSARI', 'POSYANDU LANSIA POSYANDU LANSIA TAMBAKSARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(659, NULL, 'POSYANDU LANSIA RANGKAH', 'POSYANDU LANSIA POSYANDU LANSIA RANGKAH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(660, NULL, 'POSYANDU LANSIA GADING', 'POSYANDU LANSIA POSYANDU LANSIA GADING', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(661, NULL, 'POSYANDU LANSIA TANAH KALI KEDINDING', 'POSYANDU LANSIA POSYANDU LANSIA TANAH KALI KEDINDI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(662, NULL, 'POSYANDU LANSIA SIDOTOPO WETAN', 'POSYANDU LANSIA POSYANDU LANSIA SIDOTOPO WETAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(663, NULL, 'POSYANDU LANSIA BULAK BANTENG', 'POSYANDU LANSIA POSYANDU LANSIA BULAK BANTENG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(664, NULL, 'POSYANDU LANSIA TAMBAK WEDI', 'POSYANDU LANSIA POSYANDU LANSIA TAMBAK WEDI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(665, NULL, 'POSYANDU LANSIA SUKOLILO', 'POSYANDU LANSIA POSYANDU LANSIA SUKOLILO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(666, NULL, 'POSYANDU LANSIA KOMPLEK KENJERAN', 'POSYANDU LANSIA POSYANDU LANSIA KOMPLEK KENJERAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(667, NULL, 'POSYANDU LANSIA KENJERAN', 'POSYANDU LANSIA POSYANDU LANSIA KENJERAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(668, NULL, 'POSYANDU LANSIA BULAK', 'POSYANDU LANSIA POSYANDU LANSIA BULAK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(669, NULL, 'POSYANDU LANSIA KEDUNG COWEK', 'POSYANDU LANSIA POSYANDU LANSIA KEDUNG COWEK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(670, NULL, 'POSYANDU LANSIA KAPASAN', 'POSYANDU LANSIA POSYANDU LANSIA KAPASAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(671, NULL, 'POSYANDU LANSIA TAMBAKREJO', 'POSYANDU LANSIA POSYANDU LANSIA TAMBAKREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(672, NULL, 'POSYANDU LANSIA SIMOKERTO', 'POSYANDU LANSIA POSYANDU LANSIA SIMOKERTO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(673, NULL, 'POSYANDU LANSIA SIDODADI', 'POSYANDU LANSIA POSYANDU LANSIA SIDODADI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(674, NULL, 'POSYANDU LANSIA SIMOLAWANG', 'POSYANDU LANSIA POSYANDU LANSIA SIMOLAWANG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(675, NULL, 'POSYANDU LANSIA AMPEL', 'POSYANDU LANSIA POSYANDU LANSIA AMPEL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(676, NULL, 'POSYANDU LANSIA SIDOTOPO', 'POSYANDU LANSIA POSYANDU LANSIA SIDOTOPO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(677, NULL, 'POSYANDU LANSIA PEGIRIAN', 'POSYANDU LANSIA POSYANDU LANSIA PEGIRIAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(678, NULL, 'POSYANDU LANSIA WONOKUSUMO', 'POSYANDU LANSIA POSYANDU LANSIA WONOKUSUMO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(679, NULL, 'POSYANDU LANSIA UJUNG', 'POSYANDU LANSIA POSYANDU LANSIA UJUNG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(680, NULL, 'POSYANDU LANSIA BONGKARAN', 'POSYANDU LANSIA POSYANDU LANSIA BONGKARAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(681, NULL, 'POSYANDU LANSIA NYAMPLUNGAN', 'POSYANDU LANSIA POSYANDU LANSIA NYAMPLUNGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(682, NULL, 'POSYANDU LANSIA KREMBANGAN UTARA', 'POSYANDU LANSIA POSYANDU LANSIA KREMBANGAN UTARA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(683, NULL, 'POSYANDU LANSIA PERAK TIMUR', 'POSYANDU LANSIA POSYANDU LANSIA PERAK TIMUR', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(684, NULL, 'POSYANDU LANSIA PERAK UTARA', 'POSYANDU LANSIA POSYANDU LANSIA PERAK UTARA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(685, NULL, 'POSYANDU LANSIA TEMBOK DUKUH', 'POSYANDU LANSIA POSYANDU LANSIA TEMBOK DUKUH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(686, NULL, 'POSYANDU LANSIA BUBUTAN', 'POSYANDU LANSIA POSYANDU LANSIA BUBUTAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(687, NULL, 'POSYANDU LANSIA ALON ALON CONTONG', 'POSYANDU LANSIA POSYANDU LANSIA ALON ALON CONTONG', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(688, NULL, 'POSYANDU LANSIA GUNDIH', 'POSYANDU LANSIA POSYANDU LANSIA GUNDIH', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(689, NULL, 'POSYANDU LANSIA JEPARA', 'POSYANDU LANSIA POSYANDU LANSIA JEPARA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(690, NULL, 'POSYANDU LANSIA DUPAK', 'POSYANDU LANSIA POSYANDU LANSIA DUPAK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(691, NULL, 'POSYANDU LANSIA MOROKREMBANGAN', 'POSYANDU LANSIA POSYANDU LANSIA MOROKREMBANGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(692, NULL, 'POSYANDU LANSIA PERAK BARAT', 'POSYANDU LANSIA POSYANDU LANSIA PERAK BARAT', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(693, NULL, 'POSYANDU LANSIA KEMAYORAN', 'POSYANDU LANSIA POSYANDU LANSIA KEMAYORAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(694, NULL, 'POSYANDU LANSIA KREMBANGAN SELATAN', 'POSYANDU LANSIA POSYANDU LANSIA KREMBANGAN SELATAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(695, NULL, 'POSYANDU LANSIA TAMBAK LANGON', 'POSYANDU LANSIA POSYANDU LANSIA TAMBAK LANGON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(696, NULL, 'POSYANDU LANSIA GREGES', 'POSYANDU LANSIA POSYANDU LANSIA GREGES', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(697, NULL, 'POSYANDU LANSIA ASEMROWO', 'POSYANDU LANSIA POSYANDU LANSIA ASEMROWO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(698, NULL, 'POSYANDU LANSIA GENTING', 'POSYANDU LANSIA POSYANDU LANSIA GENTING', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(699, NULL, 'POSYANDU LANSIA KALIANAK', 'POSYANDU LANSIA POSYANDU LANSIA KALIANAK', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(700, NULL, 'POSYANDU LANSIA SEMEMI', 'POSYANDU LANSIA POSYANDU LANSIA SEMEMI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(701, NULL, 'POSYANDU LANSIA KLAKAH REJO', 'POSYANDU LANSIA POSYANDU LANSIA KLAKAH REJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(702, NULL, 'POSYANDU LANSIA KANDANGAN', 'POSYANDU LANSIA POSYANDU LANSIA KANDANGAN', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(703, NULL, 'POSYANDU LANSIA TAMBAKOSO WILANGON', 'POSYANDU LANSIA POSYANDU LANSIA TAMBAKOSO WILANGON', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(704, NULL, 'POSYANDU LANSIA ROMOKALISARI', 'POSYANDU LANSIA POSYANDU LANSIA ROMOKALISARI', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(705, NULL, 'POSYANDU LANSIA BABAT JERAWAT', 'POSYANDU LANSIA POSYANDU LANSIA BABAT JERAWAT', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(706, NULL, 'POSYANDU LANSIA PAKAL', 'POSYANDU LANSIA POSYANDU LANSIA PAKAL', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(707, NULL, 'POSYANDU LANSIA BENOWO', 'POSYANDU LANSIA POSYANDU LANSIA BENOWO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(708, NULL, 'POSYANDU LANSIA SOMBEREJO', 'POSYANDU LANSIA POSYANDU LANSIA SOMBEREJO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(709, NULL, 'POSYANDU LANSIA TAMBAKDONO', 'POSYANDU LANSIA POSYANDU LANSIA TAMBAKDONO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(710, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(711, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(712, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(713, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(714, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(715, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(716, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(717, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(718, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(719, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(720, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(721, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(722, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(723, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(724, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(725, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(726, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(727, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(728, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(729, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(730, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(731, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(732, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(733, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(734, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(735, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(736, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(737, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(738, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(739, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(740, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(741, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(742, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(743, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(744, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(745, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(746, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(747, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(748, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(749, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(750, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(751, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(752, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(753, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(754, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(755, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(756, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(757, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(758, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(759, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(760, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(761, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(762, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(763, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(764, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(765, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(766, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(767, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(768, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(769, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(770, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(771, NULL, 'PUSLING2', 'PUSLING2', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(772, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(773, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(774, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(775, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(776, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(777, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(778, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(779, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(780, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(781, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(782, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(783, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(784, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(785, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(786, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(787, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(788, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(789, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(790, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(791, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(792, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(793, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(794, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(795, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(796, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(797, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(798, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(799, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(800, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(801, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(802, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(803, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(804, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(805, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(806, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(807, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(808, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(809, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(810, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(811, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(812, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(813, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(814, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(815, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(816, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(817, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(818, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(819, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(820, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(821, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(822, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(823, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(824, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(825, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(826, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(827, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(828, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(829, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(830, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(831, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(832, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(833, NULL, 'PUSLING3', 'PUSLING3', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(844, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(845, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(846, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(847, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(848, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(849, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(850, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(851, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(852, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(853, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(854, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(855, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(856, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(857, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(858, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(859, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(860, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(861, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(862, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(863, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(864, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(865, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(866, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(867, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(868, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(869, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(870, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(871, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(872, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(873, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(874, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(875, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(876, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(877, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(878, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(879, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(880, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(881, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(882, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(883, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(884, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(885, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(886, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(887, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(888, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(889, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(890, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(891, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(892, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(893, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(894, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(895, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(896, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(897, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(898, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(899, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(900, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(901, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(902, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(903, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(904, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(905, NULL, 'PUSLING4', 'PUSLING4', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(906, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(907, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(908, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(909, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(910, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(911, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(912, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(913, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(914, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(915, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(916, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(917, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(918, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(919, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(920, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(921, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(922, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(923, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(924, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(925, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(926, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(927, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(928, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(929, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(930, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(931, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(932, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(933, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(934, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(935, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(936, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(937, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(938, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(939, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(940, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(941, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(942, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(943, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(944, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(945, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(946, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(947, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(948, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(949, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(950, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(951, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(952, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(953, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(954, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(955, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(956, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(957, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(958, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(959, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(960, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(961, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(962, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(963, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(964, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(965, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(966, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(967, NULL, 'PUSLING5', 'PUSLING5', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(968, NULL, 'POSKESKEL SIMOMULYO BARU', 'POSKESKEL SIMOMULYO BARU', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(969, NULL, 'POSYANDU BALITA SIMOMULYO BARU', 'POSYANDU BALITA SIMOMULYO BARU', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(970, NULL, 'POSYANDU LANSIA SIMOMULYO BARU', 'POSYANDU LANSIA SIMOMULYO BARU', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(971, NULL, 'POSKESKEL TANDES', 'POSKESKEL TANDES', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(972, NULL, 'POSYANDU BALITA TANDES', 'POSYANDU BALITA TANDES', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(973, NULL, 'POSYANDU LANSIA TANDES', 'POSYANDU LANSIA TANDES', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(974, NULL, 'POSKESKEL KAPAS MADYA', 'POSKESKEL KAPAS MADYA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(975, NULL, 'POSYANDU BALITA KAPAS MADYA', 'POSYANDU BALITA MADYA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(976, NULL, 'POSYANDU LANSIA KAPAS MADYA', 'POSYANDU LANSIA MADYA', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(977, NULL, 'POSKESKEL DUKUH SETRO', 'POSKESKEL DUKUH SETRO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(978, NULL, 'POSYANDU BALITA DUKUH SETRO', 'POSYANDU BALITA DUKUH SETRO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(979, NULL, 'POSYANDU LANSIA DUKUH SETRO', 'POSYANDU LANSIA DUKUH SETRO', NULL, '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(980, NULL, 'Pustu Wonokusumo', NULL, 'Jl. Tenggumung Wetan Gg. Apel', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);
INSERT INTO `munitkerja` (`id`, `kode`, `nama`, `nama_alias`, `alamat`, `doc`, `dom`, `idc`, `idm`) VALUES
	(984, '63', 'Puskesmas Sawah Pulo', 'SAWAHPULO', 'Jl. Sawah Pulo Lapangan No. 2', '2022-01-09 18:59:20', '2022-01-09 18:59:20', 0, 0);

-- Dumping structure for table dbabsensi.muser
CREATE TABLE IF NOT EXISTS `muser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idunitkerja` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT 1,
  `doc` timestamp NULL DEFAULT current_timestamp(),
  `dom` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FK_muser_munitkerja` (`idunitkerja`),
  CONSTRAINT `FK_muser_munitkerja` FOREIGN KEY (`idunitkerja`) REFERENCES `munitkerja` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table dbabsensi.muser: ~427 rows (approximately)
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(1, 1, 'admin', 'Admin', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', 'OYhfQyK5l1yl4TC49zQzBwnL3M9BpwWkn5MBw2qY2OTkzPdlOb4xT4wpX1yy', 'admin', 1, '2023-08-09 01:40:18', '2023-08-11 07:57:54');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(2, 1, 'user1', 'Prasetyo', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', 'Sg1SpXEkK9753Wh2xaYfim46YgiqXr65A1ZGxds4pabkxinehzkNVDVsB6ax', 'user', 1, '2023-08-09 03:52:07', '2023-08-11 05:50:30');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(3, NULL, 'berlianda_ramadhanti', 'Berlianda Ramadhanti', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(4, NULL, 'satria_dwi', 'Satria Dwi Nugraha', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(5, NULL, 'asril_aspawi', 'Asril Aspawi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(6, NULL, 'lailatul_ghonimah', 'Lailatul Ghonimah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(7, NULL, 'irwansah_', 'Irwansah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(8, NULL, 'muhammad_misbakhul', 'Muhammad Misbakhul Arzaq', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(9, NULL, 'khoirotun_nisya', 'Khoirotun Nisya', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(10, NULL, 'mulazi_ibna', 'Mulazi Ibna', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(11, NULL, 'muhammad_zikry', 'Muhammad Zikry Afdholi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(12, NULL, 'nur_aisyah', 'Nur Aisyah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(13, NULL, 'puja_puteri', 'Puja Puteri Chantika', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(14, NULL, 'ferdiansyah_putra', 'Ferdiansyah Putra', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(15, NULL, 'agus_nur', 'Agus Nur Wahyuda', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', '5wzGqKycFkHiHrNlIPsD4EaqTAJE8FXJFeFX4pJUpyNAuYXybOvvRXJfDkO9', 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:51:44');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(16, NULL, 'alfi_nursakina', 'Alfi Nursakina Rahmah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(17, NULL, 'ade_noor', 'Ade Noor Rahmah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(18, NULL, 'maria_ulfa', 'Maria Ulfa', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(19, NULL, 'wafiq_indana', 'Wafiq Indana Zulva', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(20, NULL, 'regita_wida', 'Regita Wida Threnisa', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(21, NULL, 'andri_kurnia', 'Andri Kurnia', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(22, NULL, 'devina_ramadhanty', 'Devina Ramadhanty Wirakusuma', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(23, NULL, 'nur_rizkyana', 'Nur Rizkyana Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(24, NULL, 'nanda_zahrotul', 'Nanda Zahrotul Maulidah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(25, NULL, 'angelita_rifsy', 'Angelita Rifsy Nurzalfa', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(26, NULL, 'ikrima_dwi', 'Ikrima Dwi Anjani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(27, NULL, 'chaira_husna', 'Chaira Husna', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(28, NULL, 'rosalia_nindy', 'Rosalia Nindy Prastika Sari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(29, NULL, 'shofa_zahrotun', 'Shofa Zahrotun Naiim', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(30, NULL, 'amelia_syahfina', 'Amelia Syahfina Lubis', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(31, NULL, 'yunus_diel', 'Yunus Diel Zebua', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(32, NULL, 'syifa_nur', 'Syifa Nur Safira', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(33, NULL, 'rizka_nazma', 'Rizka Nazma Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(34, NULL, 'khairani_afifah', 'Khairani Afifah Pohan', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(35, NULL, 'nur_fikrah', 'Nur Fikrah Sri Indah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(36, NULL, 'esya_nafisah', 'Esya Nafisah Kusumadewi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(37, NULL, 'rachvita_febiana', 'Rachvita Febiana Ansar', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(38, NULL, 'dyah_septiani', 'Dyah Septiani Dewi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(39, NULL, 'three_novi', 'Three Novi Nansorina', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(40, NULL, 'richie_al', 'Richie Al Safitri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(41, NULL, 'dhela_puja', 'Dhela Puja Irawati', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(42, NULL, 'bella_', 'Bella', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(43, NULL, 'arlyn_febrina', 'Arlyn Febrina Salsabila', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(44, NULL, 'amira_rifda', 'Amira Rifda Shabira', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(45, NULL, 'dyah_ayu', 'Dyah Ayu Novita Prameswari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(46, NULL, 'awanda_putra', 'Awanda Putra Pratama', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(47, NULL, 'shiesil_rizqia', 'Shiesil Rizqia Amadia', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(48, NULL, 'agnes_apriani', 'Agnes Apriani Hutabarat', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(49, NULL, 'talitha_indira', 'Talitha Indira Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(50, NULL, 'dwiyatno_junaidi', 'Dwiyatno Junaidi Usman', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(51, NULL, 'jovasco_allenfaza', 'Jovasco Allenfaza', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(52, NULL, 'farah_nur', 'Farah Nur Fitri Hidayati', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(53, NULL, 'raisya_ridha', 'Raisya Ridha Rahma', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(54, NULL, 'adhiatma_adji', 'Adhiatma Adji', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(55, NULL, 'isna_nur', 'Isna Nur Aeni', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(56, NULL, 'alfi_nurillah', 'Alfi Nurillah Putri Muhammad', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(57, NULL, 'putri_dwinita', 'Putri Dwinita Haryono', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(58, NULL, 'gilang_irhamna', 'Gilang Irhamna', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(59, NULL, 'akmala_firdaus', 'Akmala Firdaus', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(60, NULL, 'natasya_elly', 'Natasya Elly Syaulia', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(61, NULL, 'azmi_burhan', 'Azmi Burhan Fadholi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(62, NULL, 'tirsa_padallingan', 'Tirsa Padallingan', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(63, NULL, 'eirin_zahara', 'Eirin Zahara', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(64, NULL, 'badriyah_putri', 'Badriyah Putri Jannah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(65, NULL, 'cindy_puspita', 'Cindy Puspita Sari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(66, NULL, 'naurah_febrima', 'Naurah Febrima', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(67, NULL, 'ananda_shafa', 'Ananda Shafa Nabila', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(68, NULL, 'adeline_alya', 'Adeline Alya Ramadhani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(69, NULL, 'salwa_isna', 'Salwa Isna Barlian', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(70, NULL, 'athiyah_nasywa', 'Athiyah Nasywa Tsabitah Putri Ramadhani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(71, NULL, 'karina_asirohana', 'Karina Asirohana Berutu', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(72, NULL, 'nur_aini', 'Nur Aini', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(73, NULL, 'novi_dwi', 'Novi Dwi Ariyani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(74, NULL, 'aufa_luthfiha', 'Aufa Luthfiha Amelia Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(75, NULL, 'aditia_wahyu', 'Aditia Wahyu Ashari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(76, NULL, 'm_gilang', 'M. Gilang Ramadhan', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(77, NULL, 'aulia_hasna', 'Aulia Hasna Afifah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(78, NULL, 'marisa_br', 'Marisa Br Manik', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(79, NULL, 'lena_lubis', 'Lena Lubis', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(80, NULL, 'muhamad_amar', 'Muhamad Amar', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(81, NULL, 'steffanie_zoya', 'Steffanie Zoya Banjarnahor', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(82, NULL, 'maulana_sidiq', 'Maulana Sidiq', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(83, NULL, 'ummu_humairoh', 'Ummu Humairoh', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(84, NULL, 'farhan_rizky', 'Farhan Rizky Ar Rasyid', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(85, NULL, 'azzhara_agustin', 'Azzhara Agustin Sri Ramadhani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(86, NULL, 'nadhilah_maisarah', 'Nadhilah Maisarah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(87, NULL, 'anggit_salis', 'Anggit Salis Media Utami', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(88, NULL, 'lucia_leony', 'Lucia Leony Fitriandini', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(89, NULL, 'muhammad_zuvisco', 'Muhammad Zuvisco Sauqi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(90, NULL, 'muhfiyatul_ummu', 'Muhfiyatul Ummu', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(91, NULL, 'saskia_nadhira', 'Saskia Nadhira Ayudani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(92, NULL, 'rahel_christina', 'Rahel Christina', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(93, NULL, 'asti_amanatillah', 'Asti Amanatillah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(94, NULL, 'rizka_kusuma', 'Rizka Kusuma Wardahni', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(95, NULL, 'athiyyah_yuan', 'Athiyyah Yuan Sabina', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(96, NULL, 'tarisah_nur', 'Tarisah Nur Ahlina', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(97, NULL, 'firnadila_prawidiastri', 'Firnadila Prawidiastri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(98, NULL, 'olivia_farhana', 'Olivia Farhana Bahanan', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(99, NULL, 'muhammad_rafli', 'Muhammad Rafli Siregar', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(100, NULL, 'donny_ardyan', 'Donny Ardyan', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(101, NULL, 'tania_nur', 'Tania Nur Laili Maharani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(102, NULL, 'sefina_febri', 'Sefina Febri Adisti', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(103, NULL, 'idham_yusuf', 'Idham Yusuf Baihaqi Mursyid', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(104, NULL, 'ryan_warjito', 'Ryan Warjito', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(105, NULL, 'naufalsyah_falah', 'Naufalsyah Falah Muhammad', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(106, NULL, 'siti_humaira', 'Siti Humaira Ahmad', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(107, NULL, 'neila_rizqi', 'Neila Rizqi Fahmiyah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(108, NULL, 'ni_komang', 'Ni Komang Sri Kartini', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(109, NULL, 'feny_amelia', 'Feny Amelia', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(110, NULL, 'yudha_eka', 'Yudha Eka Pratama', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(111, NULL, 'gustiani_', 'Gustiani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(112, NULL, 'thesyen_naftalin', 'Thesyen Naftalin Wue Djo', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(113, NULL, 'cecilia_amanda', 'Cecilia Amanda', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(114, NULL, 'michelle_kathleen', 'Michelle Kathleen Caroline Ruitan', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(115, NULL, 'christina_anastacia', 'Christina Anastacia Hariadi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(116, NULL, 'indri_prabaswari', 'Indri Prabaswari Pramesti Purnama', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(117, NULL, 'alvira_dhiyaulhaq', 'Alvira Dhiyaulhaq', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(118, NULL, 'nur_rahma', 'Nur Rahma Febriani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(119, NULL, 'risa_aulia', 'Risa Aulia Divanda Rahmadani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(120, NULL, 'desta_vanetta', 'Desta Vanetta Sari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(121, NULL, 'muhammad_ariq', 'Muhammad Ariq Hotip', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(122, NULL, 'risa_amalia', 'Risa Amalia Firdaus', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(123, NULL, 'alfian_ihza', 'Alfian Ihza Mahendra', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(124, NULL, 'reza_azis', 'Reza Azis Fahrezi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(125, NULL, 'arya_kusuma', 'Arya Kusuma Dani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(126, NULL, 'zuhrohtan_anglian', 'Zuhrohtan Anglian Nisaa', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(127, NULL, 'zahwa_aurellia', 'Zahwa Aurellia Syafilah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(128, NULL, 'wulan_maulida', 'Wulan Maulida', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(129, NULL, 'al_ghefarick', 'Al Ghefarick Azzardi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(130, NULL, 'widya_maharani', 'Widya Maharani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(131, NULL, 'zharina_', 'Zharina', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(132, NULL, 'diva_radana', 'Diva Radana Sirait', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(133, NULL, 'nathasa_novia', 'Nathasa Novia Galuh Yolanda', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(134, NULL, 'ni_kadek', 'Ni Kadek Rizka Arcilla Widana', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(135, NULL, 'erze_vazela', 'Erze Vazela', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(136, NULL, 'moch_dava', 'Moch. Dava Asmani Sava', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(137, NULL, 'rion_arianto', 'Rion Arianto Priyono', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(138, NULL, 'sania_nikita', 'Sania Nikita Napitu', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(139, NULL, 'dimas_lelono', 'Dimas Lelono', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(140, NULL, 'diawayu_puja', 'Diawayu Puja Lestari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(141, NULL, 'puji_ibaidah', 'Puji Ibaidah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(142, NULL, 'nuril_adh-har', 'Nuril Adh-Har', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(143, NULL, 'widyantara_ahmad', 'Widyantara Ahmad Redondo', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(144, NULL, 'mezaluna_prabasanti', 'Mezaluna Prabasanti', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(145, NULL, 'hana_sophia', 'Hana Sophia Athallah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(146, NULL, 'tegar_pribadi', 'Tegar Pribadi Hariyanto', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(147, NULL, 'sindi_fatmawati', 'Sindi Fatmawati', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(148, NULL, 'fara_anjani', 'Fara Anjani Cahya', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(149, NULL, 'azizah_yuniarfika', 'Azizah Yuniarfika', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(150, NULL, 'tito_omar', 'Tito Omar Wanda', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(151, NULL, 'khanza_khaldya', 'Khanza Khaldya Malik', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(152, NULL, 'shalma_khoirun', 'Shalma Khoirun Nisa', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(153, NULL, 'dhiyaul_kamalia', 'Dhiyaul Kamalia Fahlefi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(154, NULL, 'muhammad_thoriq', 'Muhammad Thoriq Haidar Rantaka', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(155, NULL, 'siti_khoirun', 'Siti Khoirun Nisa', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(156, NULL, 'dinis_choirunnikmah', 'Dinis Choirunnikmah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(157, NULL, 'nida_rindy', 'Nida Rindy Pramaysella', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(158, NULL, 'lailatul_rohmawati', 'Lailatul Rohmawati', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(159, NULL, 'siti_mufadlilah', 'Siti Mufadlilah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(160, NULL, 'vina_alviana', 'Vina Alviana', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(161, NULL, 'jihan_melinda', 'Jihan Melinda', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(162, NULL, 'tita_febryani', 'Tita Febryani Budi Adhillah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(163, NULL, 'wahidah_', 'Wahidah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(164, NULL, 'dewi_nursanti', 'Dewi Nursanti', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(165, NULL, 'sitana_salwa', 'Sitana Salwa Zulaicha', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(166, NULL, 'osbert_mario', 'Osbert Mario Valentino Nainggolan', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(167, NULL, 'jorequita_natasha', 'Jorequita Natasha Sembiring', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(168, NULL, 'dinda_aulia', 'Dinda Aulia Hasna', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(169, NULL, 'ariya_sanjaya', 'Ariya Sanjaya', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(170, NULL, 'jessyca_noviolita', 'Jessyca Noviolita Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(171, NULL, 'ragil_kuning', 'Ragil Kuning Arum Puspitasari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(172, NULL, 'riffa_rihaddatul', 'Riffa Rihaddatul Aisy', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(173, NULL, 'rizki_dwi', 'Rizki Dwi Amalia', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(174, NULL, 'breliana_regina', 'Breliana Regina Putri Affandi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(175, NULL, 'megananda_wiyono', 'Megananda Wiyono Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(176, NULL, 'mutiara_amelia', 'Mutiara Amelia', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(177, NULL, 'dea_indah', 'Dea Indah Febrianti', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(178, NULL, 'umi_rizqiah', 'Umi Rizqiah Hasanah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(179, NULL, 'ratna_sari', 'Ratna Sari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(180, NULL, 'wahyu_illahi', 'Wahyu Illahi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(181, NULL, 'siti_nur', 'Siti Nur Hidayatul Umma', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(182, NULL, 'bilqis_aribatu', 'Bilqis Aribatu Adlwa', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(183, NULL, 'aprilia_purwandari', 'Aprilia Purwandari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:42', '2023-08-11 06:50:42');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(184, NULL, 'abdul_rohman', 'Abdul Rohman', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(185, NULL, 'nazirah_adelyah', 'Nazirah Adelyah Nuur Zaindien', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(186, NULL, 'kharisma_sinandhi', 'Kharisma Sinandhi Rayhan', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(187, NULL, 'putri_madania', 'Putri Madania Islami', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(188, NULL, 'yesi_mariska', 'Yesi Mariska', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(189, NULL, 'chintya_amaria', 'Chintya Amaria Kournikova', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(190, NULL, 'marcellindo_brilliant', 'Marcellindo Brilliant Sukmawardhana', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(191, NULL, 'novia_fajrin', 'Novia Fajrin Firdaus', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(192, NULL, 'rachma_tiara', 'Rachma Tiara Damayanti', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(193, NULL, 'layyina_sari', 'Layyina Sari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(194, NULL, 'nike_aprilia', 'Nike Aprilia Putri Hamidah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(195, NULL, 'mutiara_putri', 'Mutiara Putri Nur Soefi`I', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(196, NULL, 'vivi_dwi', 'Vivi Dwi Aviliani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(197, NULL, 'teo_arya', 'Teo Arya Pradana', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(198, NULL, 'rahmad_fajrin', 'Rahmad Fajrin Alvianto', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(199, NULL, 'miftakhul_fadhilah', 'Miftakhul Fadhilah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(200, NULL, 'muhammad_hanif', 'Muhammad Hanif Mirza Dzamir', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(201, NULL, 'ageng_tri', 'Ageng Tri Wicaksani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(202, NULL, 'aldino_ega', 'Aldino Ega Liandra', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(203, NULL, 'wirna_sofi', 'Wirna Sofi Arini', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(204, NULL, 'nur_maulidyah', 'Nur Maulidyah Azizah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(205, NULL, 'syafira_faradiba', 'Syafira Faradiba Herlambang', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(206, NULL, 'bustanul_farid', 'Bustanul Farid', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(207, NULL, 'kharisma_pramesti', 'Kharisma Pramesti Al`Afsi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:50:43', '2023-08-11 06:50:43');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(208, NULL, 'arina_mana', 'Arina Mana Sukana', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(209, NULL, 'nabila_sulistyaning', 'Nabila Sulistyaning Budi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(210, NULL, 'nuril_laili', 'Nuril Laili', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(211, NULL, 'nuril_mufidah', 'Nuril Mufidah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(212, NULL, 'galuh_rahmadini', 'Galuh Rahmadini', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(213, NULL, 'dwi_lia', 'Dwi Lia Handayani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(214, NULL, 'nabilla_anggra', 'Nabilla Anggra Puspita Sari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(215, NULL, 'muhammad_sulaiman', 'Muhammad Sulaiman', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(216, NULL, 'amelia_putri', 'Amelia Putri Eflynia', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(217, NULL, 'ramadaniati_', 'Ramadaniati', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(218, NULL, 'iva_yolanda', 'Iva Yolanda Margaretha Gultom', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(219, NULL, 'dhea_abigail', 'Dhea Abigail Yohana Munthe', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(220, NULL, 'yogi_simanjuntak', 'Yogi Simanjuntak', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(221, NULL, 'hafifa_adilla', 'Hafifa Adilla Putri Rangga Dewi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(222, NULL, 'melki_daniel', 'Melki Daniel Simbolon', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(223, NULL, 'refitha_nurul', 'Refitha Nurul Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(224, NULL, 'assyfa_mauliza', 'Assyfa Mauliza', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(225, NULL, 'ruth_nadya', 'Ruth Nadya Simanjuntak', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:55:23', '2023-08-11 06:55:23');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(227, NULL, 'masri_f', 'Masri F. Gufron', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(228, NULL, 'nur_indah', 'Nur Indah Sari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(229, NULL, 'miftahul_jannah', 'Miftahul Jannah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(230, NULL, 'meila_fayza', 'Meila Fayza', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(231, NULL, 'husna_intan', 'Husna Intan Fadila', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(232, NULL, 'intan_maisura', 'Intan Maisura', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(233, NULL, 'cut_putri', 'Cut Putri Mulianda', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(234, NULL, 'qanitah_dara', 'Qanitah Dara', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(235, NULL, 'muhammad_ridha', 'Muhammad Ridha', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(236, NULL, 'kiki_kamisna', 'Kiki Kamisna', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(237, NULL, 'yuwida_witami', 'Yuwida Witami', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(238, NULL, 'azmi_', 'Azmi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(239, NULL, 'habib_maulana', 'Habib Maulana', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(240, NULL, 'dian_muliani', 'Dian Muliani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(241, NULL, 'mauliza_', 'Mauliza', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(242, NULL, 'anesthasia_sinaga', 'Anesthasia Sinaga', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(243, NULL, 'mai_sarah', 'Mai Sarah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(244, NULL, 'lathifa_rifda', 'Lathifa Rifda Nuha', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(245, NULL, 'siti_wahyuni', 'Siti Wahyuni', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(246, NULL, 'riski_hanafi', 'Riski Hanafi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(247, NULL, 'nuniah_ashari', 'Nuniah Ashari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(248, NULL, 'dina_silmi', 'Dina Silmi Lathifah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(249, NULL, 'kartini_', 'Kartini', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(250, NULL, 'sidratul_muntaha', 'Sidratul Muntaha', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(251, NULL, 'cecylia_eva', 'Cecylia Eva L. Pangaribuan', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(252, NULL, 'shinta_aulia', 'Shinta Aulia Irvania', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(253, NULL, 'maharani_', 'Maharani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(254, NULL, 'durotul_chasanah', 'Durotul Chasanah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(255, NULL, 'septia_verda', 'Septia Verda Intan Sari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(256, NULL, 'andreas_soffyan', 'Andreas Soffyan Simanjuntak', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(257, NULL, 'charry_vanesse', 'Charry Vanesse Simatupang', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(258, NULL, 'laila_septania', 'Laila Septania Rafi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(259, NULL, 'aliah_ambarwati', 'Aliah Ambarwati', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(260, NULL, 'hanun_afifah', 'Hanun Afifah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(261, NULL, 'syarah_yulistia', 'Syarah Yulistia', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(262, NULL, 'eva_yuliani', 'Eva Yuliani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(263, NULL, 'ema_erliza', 'Ema Erliza', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(264, NULL, 'vivi_novita', 'Vivi Novita Sari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(265, NULL, 'karien_reginawati', 'Karien Reginawati Rakhman', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(266, NULL, 'ernita_sitorus', 'Ernita Sitorus', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(267, NULL, 'renita_mahardhika', 'Renita Mahardhika Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(268, NULL, 'akbar_maulana', 'Akbar Maulana Wahid Hamdani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(269, NULL, 'dian_sari', 'Dian Sari Harefa', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(270, NULL, 'azzahra_apriliani', 'Azzahra Apriliani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(271, NULL, 'hesti_nursastiana', 'Hesti Nursastiana', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(272, NULL, 'destyna_fitrillah', 'Destyna Fitrillah Yusril', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(273, NULL, 'endang_margaretta', 'Endang Margaretta', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(274, NULL, 'annisah_rivina', 'Annisah Rivina Mardiyyah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(275, NULL, 'eriza_delfiani', 'Eriza Delfiani Siregar', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(276, NULL, 'iin_setiana', 'Iin Setiana', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(277, NULL, 'aithine_irianitha', 'Aithine Irianitha Abdillah Alief', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(278, NULL, 'yuana_wira', 'Yuana Wira Dwi Satya Ilham Putra', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(279, NULL, 'adelia_agustin', 'Adelia Agustin Br Sembiring Meliala', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(280, NULL, 'salsabila_oktoviani', 'Salsabila Oktoviani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(281, NULL, 'rina_ayu', 'Rina Ayu Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(282, NULL, 'melati_noormaulidya', 'Melati Noormaulidya Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(283, NULL, 'dhea_rara', 'Dhea Rara Wahyudi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(284, NULL, 'ratna_mulia', 'Ratna Mulia Wati', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(285, NULL, 'umma_rotur', 'Umma Rotur Rokhmah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(286, NULL, 'evi_rohmatul', 'Evi Rohmatul Laili', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(287, NULL, 'fidya_almira', 'Fidya Almira Naila Yusuf', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(288, NULL, 'andini_gusti', 'Andini Gusti Dyah Priatini', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(289, NULL, 'farha_annisa', 'Farha Annisa Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(290, NULL, 'aisyah_putri', 'Aisyah Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(291, NULL, 'jheni_anggeriani', 'Jheni Anggeriani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(292, NULL, 'laela_agrista', 'Laela Agrista Devilia', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(293, NULL, 'ardania_yulian', 'Ardania Yulian Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(294, NULL, 'maraa_refina', 'Mar`Aa Refina Robbah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(295, NULL, 'rosita_ambar', 'Rosita Ambar Wati', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(296, NULL, 'renanda_dwi', 'Renanda Dwi Palupi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(297, NULL, 'dea_andini', 'Dea Andini', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(298, NULL, 'ikin_asikin', 'Ikin Asikin', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(299, NULL, 'grace_yosephin', 'Grace Yosephin Panggabean', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(300, NULL, 'auni_fadhilla', 'Auni Fadhilla Ramadhana', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(301, NULL, 'widya_saharani', 'Widya Saharani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(302, NULL, 'destiana_fitri', 'Destiana Fitri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(303, NULL, 'alfi_hamduna', 'Alfi Hamduna', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(304, NULL, 'sindi_rahmawati', 'Sindi Rahmawati', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(305, NULL, 'utami_pradana', 'Utami Pradana Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(306, NULL, 'putri_amelia', 'Putri Amelia Surasta', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(307, NULL, 'vinka_ananda', 'Vinka Ananda Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(308, NULL, 'happy_arini', 'Happy Arini Zulfatul Ulya', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(309, NULL, 'almirah_nareswari', 'Almirah Nareswari Rahayu', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(310, NULL, 'aulia_rachma', 'Aulia Rachma Safa Nugraha', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(311, NULL, 'shilvia_raihan', 'Shilvia Raihan', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(312, NULL, 'asni_nurani', 'Asni Nurani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(313, NULL, 'cintana_rosa', 'Cintana Rosa Aulia', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(314, NULL, 'yenni_widya', 'Yenni Widya Alfianita', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(315, NULL, 'zaitun_', 'Zaitun', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(316, NULL, 'muhammad_daffa', 'Muhammad Daffa Al Hafiz', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(317, NULL, 'melysa_afrina', 'Melysa Afrina Naibaho', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(318, NULL, 'afina_wisesa', 'Afina Wisesa', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(319, NULL, 'audrey_louissia', 'Audrey Louissia Herman', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(320, NULL, 'ifa_ayu', 'Ifa Ayu Hamimah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(321, NULL, 'dya_astrid', 'Dya Astrid Hidayah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(322, NULL, 'lorenza_arinda', 'Lorenza Arinda Saputri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(323, NULL, 'mirza_ludita', 'Mirza Ludita', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(324, NULL, 'karisma_nur', 'Karisma Nur Hidayati', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(325, NULL, 'wadisya_', 'Wadisya', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(326, NULL, 'dian_denisa', 'Dian Denisa Anjelina', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(327, NULL, 'fatiya_rizka', 'Fatiya Rizka Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(328, NULL, 'asti_alya', 'Asti Alya Rahmahdia', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(329, NULL, 'rahma_biantitapratiwi', 'Rahma Biantitapratiwi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(330, NULL, 'yopiana_christin', 'Yopiana Christin Septwen Siahaan', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(331, NULL, 'chabibah_ilmiyah', 'Chabibah Ilmiyah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(332, NULL, 'briza_tris', 'Briza Tris Mawarni', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(333, NULL, 'naomi_simare-mare', 'Naomi Simare-Mare', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(334, NULL, 'emy_lianty', 'Emy Lianty Sagala', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(335, NULL, 'adinda_ragil', 'Adinda Ragil Yuniar', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(336, NULL, 'novi_triswahyuni', 'Novi Triswahyuni', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(337, NULL, 'emirta_dwi', 'Emirta Dwi Arisandi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(338, NULL, 'rohana_trivosa', 'Rohana Trivosa Siallagan', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(339, NULL, 'ica_rahmi', 'Ica Rahmi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(340, NULL, 'alisa_qothrun', 'Alisa Qothrun Nada Mu`Asyaroh', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(341, NULL, 'kristina_siringo', 'Kristina Siringo Ringo', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(342, NULL, 'maulya_disti', 'Maulya Disti Misbach', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(343, NULL, 'alya_esya', 'Alya Esya Nanda', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(344, NULL, 'novela_dwi', 'Novela Dwi Cahyani Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(345, NULL, 'abi_harianto', 'Abi Harianto', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(346, NULL, 'haliza_amalina', 'Haliza Amalina', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(347, NULL, 'shafira_putri', 'Shafira Putri Yufa', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(348, NULL, 'ana_vida', 'Ana Vida Nur Rochma', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(349, NULL, 'febyona_jolest', 'Febyona Jolest Puteri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(350, NULL, 'martha_claudia', 'Martha Claudia Purba', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(351, NULL, 'aulia_arum', 'Aulia Arum Hapsari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(352, NULL, 'lidya_ayu', 'Lidya Ayu Sukamawandira', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(353, NULL, 'elviza_qurata', 'Elviza Qurata Ayuni', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(354, NULL, 'alika_imani', 'Alika Imani Nabila', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(355, NULL, 'hapriyani_ilmada', 'Hapriyani Ilmada', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(356, NULL, 'miftahul_huda', 'Miftahul Huda', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(357, NULL, 'putra_rizki', 'Putra Rizki Aulia', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(358, NULL, 'nitha_esifayona', 'Nitha Esifayona Br Pelawi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(359, NULL, 'riana_afrida', 'Riana Afrida Putri Ompusunggu', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', 'chT4Wl48uQeMKXtWRGYOEg9MJiIsUlVeQK9r86aIu5KX68h81ALnr18f7LE3', 'user', 1, '2023-08-11 06:58:36', '2023-08-11 07:01:13');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(360, NULL, 'elvaretta_mutiara', 'Elvaretta Mutiara Pribadi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(361, NULL, 'syafira_septika', 'Syafira Septika Nur Aisyah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(362, NULL, 'mira_rahmawati', 'Mira Rahmawati Samana', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(363, NULL, 'nurmila_kurnia', 'Nurmila Kurnia', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(364, NULL, 'varadytha_indah', 'Varadytha Indah Sari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(365, NULL, 'ulva_vianiola', 'Ulva Vianiola Malau', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(366, NULL, 'yunindah_pradita', 'Yunindah Pradita Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(367, NULL, 'viranika_maudi', 'Viranika Maudi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(368, NULL, 'septianindi_', 'Septianindi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(369, NULL, 'nila_maharani', 'Nila Maharani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(370, NULL, 'lidia_novianti', 'Lidia Novianti', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:36', '2023-08-11 06:58:36');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(371, NULL, 'atikah_wulandari', 'Atikah Wulandari. H', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(372, NULL, 'niken_ayu', 'Niken Ayu Fitriani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(373, NULL, 'ulfatul_khalawiyah', 'Ulfatul Khalawiyah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(374, NULL, 'masruroh_ainul', 'Masruroh Ainul Aziz', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(375, NULL, 'dea_amanda', 'Dea Amanda', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(376, NULL, 'dhea_ayu', 'Dhea Ayu Pradita', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(377, NULL, 'nur_arofatin', 'Nur Arofatin', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(378, NULL, 'david_felix', 'David Felix Timothy Samosir', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(379, NULL, 'faadhilah_nurvitasari', 'Faadhilah Nurvitasari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(380, NULL, 'nila_vega', 'Nila Vega Tiana', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(381, NULL, 'sintia_abdilla', 'Sintia Abdilla', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(382, NULL, 'rosita_gita', 'Rosita Gita Cahyani', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(383, NULL, 'elfania_novita', 'Elfania Novita Sari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(384, NULL, 'gita_oktavana', 'Gita Oktavana', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(385, NULL, 'athiya_khansa', 'Athiya Khansa Hanifah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(386, NULL, 'monalisa_', 'Monalisa', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(387, NULL, 'fania_fajar', 'Fania Fajar Priambadi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(388, NULL, 'livi_gloria', 'Livi Gloria Utami Salindeho', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(389, NULL, 'dea_davita', 'Dea Davita Hutagaol', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(390, NULL, 'sonia_desti', 'Sonia Desti', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(391, NULL, 'chinta_tsalzabilla', 'Chinta Tsalzabilla Fervina Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(392, NULL, 'mochamad_iqbal', 'Mochamad Iqbal Juliansyah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(393, NULL, 'faizzatul_salsabila', 'Faizzatul Salsabila Maghfiroh', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(394, NULL, 'levina_amelia', 'Levina Amelia', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(395, NULL, 'nida_zairina', 'Nida Zairina', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(396, NULL, 'laksita_carmelian', 'Laksita Carmelian', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(397, NULL, 'syntia_purnama', 'Syntia Purnama Aulia', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(398, NULL, 'cucu_putri', 'Cucu Putri Solehah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(399, NULL, 'adelia_purwita', 'Adelia Purwita Sari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(400, NULL, 'della_eka', 'Della Eka Ratnasari', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(401, NULL, 'maslena_harefa', 'Maslena Harefa', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(402, NULL, 'cut_nur', 'Cut Nur Azizah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(403, NULL, 'farah_fatimah', 'Farah Fatimah Wirda Siregar', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(404, NULL, 'marvina_saputri', 'Marvina Saputri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(405, NULL, 'tabitha_novelita', 'Tabitha Novelita Hutabarat', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(406, NULL, 'anggi_faradiba', 'Anggi Faradiba Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(407, NULL, 'zafira_tria', 'Zafira Tria Hasanah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(408, NULL, 'annisa_mufi', 'Annisa` Mufi Aktul Hasanah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(409, NULL, 'miranda_silvia', 'Miranda Silvia Sitohang', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(410, NULL, 'cut_geubrina', 'Cut Geubrina Risky', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(411, NULL, 'yusriana_', 'Yusriana', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(412, NULL, 'yemima_stephanie', 'Yemima Stephanie Jernita Siregar', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(413, NULL, 'ulfi_faidatul', 'Ulfi Faidatul Ulya', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(414, NULL, 'tri_nugrah', 'Tri Nugrah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(415, NULL, 'adella_afrita', 'Adella Afrita', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(416, NULL, 'ika_sartiwi', 'Ika Sartiwi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(417, NULL, 'reski_dengsi', 'Reski Dengsi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(418, NULL, 'melinda_oktavia', 'Melinda Oktavia', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(419, NULL, 'nur_evie', 'Nur Evie Oktaviya', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(420, NULL, 'putri_devita', 'Putri Devita Rahma', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(421, NULL, 'nadwa_nurul', 'Nadwa Nurul Khotimah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(422, NULL, 'fitrotun_nisaiyah', 'Fitrotun Nisa`Iyah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(423, NULL, 'linda_arum', 'Linda Arum Pertiwi', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(424, NULL, 'annisa_muharrizky', 'Annisa Muharrizky Alyati', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(425, NULL, 'megi_melati', 'Megi Melati Dwi Putri', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(426, NULL, 'siti_nuriyatul', 'Siti Nuriyatul Qodriyah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(427, NULL, 'nadia_nur', 'Nadia Nur Sadiyah', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');
INSERT INTO `muser` (`id`, `idunitkerja`, `username`, `nama`, `password`, `token`, `role`, `isactive`, `doc`, `dom`) VALUES
	(428, NULL, 'indah_perdana', 'Indah Perdana Putri Samosir', '$2y$10$9PAUT0fuC8XiNpHo0fZ0f.DcZQtxqHAk8UU5gWedHIbmufu0sR2fS', NULL, 'user', 1, '2023-08-11 06:58:58', '2023-08-11 06:58:58');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
