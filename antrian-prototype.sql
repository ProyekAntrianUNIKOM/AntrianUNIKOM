-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2016 at 10:16 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `antrian`
--

-- --------------------------------------------------------

--
-- Table structure for table `antrian`
--

CREATE TABLE `antrian` (
  `id_antrian` int(11) NOT NULL,
  `no_antrian` varchar(10) NOT NULL,
  `no_rfid` varchar(80) NOT NULL,
  `no_loket` int(11) NOT NULL,
  `tanggal_antrian` date NOT NULL,
  `waktu_antrian` time NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `antrian`
--

INSERT INTO `antrian` (`id_antrian`, `no_antrian`, `no_rfid`, `no_loket`, `tanggal_antrian`, `waktu_antrian`, `status`) VALUES
(1, '001', '123', 1, '2016-08-25', '23:38:05', 0),
(2, '002', '123', 1, '2016-08-25', '23:48:07', 0),
(3, '003', '123', 1, '2016-08-25', '23:48:09', 0),
(4, '004', '123', 1, '2016-08-25', '23:48:11', 0),
(5, '005', '123', 1, '2016-08-25', '23:48:12', 0),
(6, '006', '123', 1, '2016-08-25', '23:48:13', 0),
(7, '007', '123', 1, '2016-08-25', '23:48:14', 0),
(8, '008', '123', 1, '2016-08-25', '23:48:15', 0),
(9, '009', '123', 1, '2016-08-25', '23:48:16', 0),
(10, '010', '123', 1, '2016-08-25', '23:48:17', 0),
(11, '011', '123', 1, '2016-08-25', '23:48:18', 0),
(12, '012', '123', 1, '2016-08-25', '23:48:19', 0),
(13, '013', '123', 1, '2016-08-25', '23:48:20', 0),
(14, '014', '123', 1, '2016-08-25', '23:48:21', 0),
(15, '015', '123', 1, '2016-08-25', '23:48:23', 0),
(16, '016', '123', 1, '2016-08-25', '23:48:26', 0),
(17, '017', '123', 1, '2016-08-25', '23:48:32', 0),
(18, '001', '123', 1, '2016-08-26', '06:40:03', 0),
(19, '002', '123', 1, '2016-08-26', '06:40:40', 0),
(20, '003', '123', 1, '2016-08-26', '06:40:43', 0),
(21, '004', '123', 1, '2016-08-26', '06:40:53', 0),
(22, '005', '123', 1, '2016-08-26', '06:41:13', 0),
(23, '006', '123', 1, '2016-08-26', '06:42:08', 0),
(24, '007', '123', 1, '2016-08-26', '06:42:29', 0),
(25, '008', '123', 1, '2016-08-26', '06:44:23', 0),
(26, '009', '123', 1, '2016-08-26', '06:44:27', 0),
(27, '010', '123', 1, '2016-08-26', '06:48:35', 0),
(28, '011', '123', 1, '2016-08-26', '06:50:01', 0),
(29, '012', '123', 1, '2016-08-26', '07:51:33', 0),
(30, '013', '123', 2, '2016-08-26', '07:51:41', 0),
(31, '014', '123', 2, '2016-08-26', '08:28:26', 0);

-- --------------------------------------------------------

--
-- Table structure for table `antrian_terlayani`
--

CREATE TABLE `antrian_terlayani` (
  `id` int(11) NOT NULL,
  `id_antrian` int(11) NOT NULL,
  `operator` int(11) NOT NULL,
  `tanggal_pelayanan` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loket`
--

CREATE TABLE `loket` (
  `no_loket` int(11) NOT NULL,
  `id_pelayanan` int(11) NOT NULL,
  `nama_loket` varchar(60) NOT NULL,
  `operator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loket`
--

INSERT INTO `loket` (`no_loket`, `id_pelayanan`, `nama_loket`, `operator`) VALUES
(0, 1, 'Aktif Kembali Kuliah', 1),
(1, 1, 'Pindah Jurusan', 1),
(2, 1, 'Cuti Akademik', 1),
(3, 1, 'Pengunduran Diri', 1),
(5, 1, 'Tidak Aktif Kuliah', 1),
(6, 2, 'Registrasi Ulang', 1),
(7, 2, 'Autodebt', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `no_rfid` varchar(80) NOT NULL,
  `nim` varchar(10) NOT NULL,
  `nama` varchar(80) NOT NULL,
  `alamat` text NOT NULL,
  `jurusan` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`no_rfid`, `nim`, `nama`, `alamat`, `jurusan`) VALUES
('123', '10115246', 'Ramdhan Rizki', 'Bandung', 'Teknik Informatika');

-- --------------------------------------------------------

--
-- Table structure for table `pelayanan`
--

CREATE TABLE `pelayanan` (
  `id_pelayanan` int(11) NOT NULL,
  `nama_pelayanan` varchar(80) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelayanan`
--

INSERT INTO `pelayanan` (`id_pelayanan`, `nama_pelayanan`, `keterangan`) VALUES
(1, 'Akademik', 'Pelayanan Akademik UNIKOM'),
(2, 'Administrasi', 'Pelayanan Administrasi Unikom');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `alamat` text NOT NULL,
  `telpon` varchar(13) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` enum('admin','operator') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `alamat`, `telpon`, `username`, `password`, `level`) VALUES
(1, 'Operator1', 'Bandung', '082314223', 'operator1', '11d8c28a64490a987612f2332502467f', 'operator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `antrian`
--
ALTER TABLE `antrian`
  ADD PRIMARY KEY (`id_antrian`),
  ADD KEY `no_rfid` (`no_rfid`),
  ADD KEY `no_loket` (`no_loket`);

--
-- Indexes for table `antrian_terlayani`
--
ALTER TABLE `antrian_terlayani`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_antrian` (`id_antrian`),
  ADD KEY `operator` (`operator`);

--
-- Indexes for table `loket`
--
ALTER TABLE `loket`
  ADD PRIMARY KEY (`no_loket`),
  ADD KEY `id_pelayanan` (`id_pelayanan`),
  ADD KEY `operator` (`operator`),
  ADD KEY `id_pelayanan_2` (`id_pelayanan`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`no_rfid`);

--
-- Indexes for table `pelayanan`
--
ALTER TABLE `pelayanan`
  ADD PRIMARY KEY (`id_pelayanan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `antrian`
--
ALTER TABLE `antrian`
  MODIFY `id_antrian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `antrian_terlayani`
--
ALTER TABLE `antrian_terlayani`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pelayanan`
--
ALTER TABLE `pelayanan`
  MODIFY `id_pelayanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `antrian`
--
ALTER TABLE `antrian`
  ADD CONSTRAINT `antrian_ibfk_1` FOREIGN KEY (`no_rfid`) REFERENCES `mahasiswa` (`no_rfid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antrian_ibfk_2` FOREIGN KEY (`no_loket`) REFERENCES `loket` (`no_loket`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `antrian_terlayani`
--
ALTER TABLE `antrian_terlayani`
  ADD CONSTRAINT `antrian_terlayani_ibfk_1` FOREIGN KEY (`id_antrian`) REFERENCES `antrian` (`id_antrian`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antrian_terlayani_ibfk_2` FOREIGN KEY (`operator`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `loket`
--
ALTER TABLE `loket`
  ADD CONSTRAINT `loket_ibfk_1` FOREIGN KEY (`id_pelayanan`) REFERENCES `pelayanan` (`id_pelayanan`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
