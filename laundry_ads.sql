-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 21, 2022 at 04:38 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry_ads`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id` char(255) NOT NULL,
  `tanggal` date NOT NULL,
  `kehadiran` varchar(255) NOT NULL,
  `ket` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`id`, `tanggal`, `kehadiran`, `ket`) VALUES
('K1', '2022-11-21', 'Hadir', ''),
('K4', '2022-11-21', 'Hadir', '');

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`username`, `password`, `id`) VALUES
('abimanyu', 'abimanyu123', 'K3'),
('alvin', 'alvin123', 'K6'),
('anugrah', 'anugrah123', 'K1'),
('dika', 'dika123', 'K5'),
('pras', 'pras123', 'K4'),
('stephen', 'stephen123', 'K2');

-- --------------------------------------------------------

--
-- Table structure for table `gaji`
--

CREATE TABLE `gaji` (
  `id` char(255) NOT NULL,
  `tanggal` date NOT NULL,
  `nominal` int(11) NOT NULL,
  `sudahditerima` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gaji`
--

INSERT INTO `gaji` (`id`, `tanggal`, `nominal`, `sudahditerima`) VALUES
('K1', '2022-11-21', 5000000, 1),
('K4', '2022-11-21', 3000000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_paket`
--

CREATE TABLE `jenis_paket` (
  `id_paket` char(255) NOT NULL,
  `nama_paket` varchar(255) NOT NULL,
  `estimasi` int(11) NOT NULL,
  `is_setrika` tinyint(1) NOT NULL,
  `harga_kiloan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` char(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `pinalti` int(11) NOT NULL,
  `gaji` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama`, `role`, `pinalti`, `gaji`) VALUES
('K1', 'Anugrah', 'Owner', 0, 5000000),
('K2', 'Stephen', 'Sekretaris', 0, 4000000),
('K3', 'Abimanyu', 'Bendahara', 0, 4000000),
('K4', 'Pras', 'Kasir', 0, 3000000),
('K5', 'Dika', 'Operator', 0, 3000000),
('K6', 'Alvin', 'Customer Service', 0, 3000000);

-- --------------------------------------------------------

--
-- Table structure for table `kerusakan`
--

CREATE TABLE `kerusakan` (
  `tanggal` date NOT NULL,
  `barang` varchar(255) NOT NULL,
  `ket` varchar(255) NOT NULL,
  `id` char(255) NOT NULL,
  `nominal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan`
--

CREATE TABLE `keuangan` (
  `tanggal` date NOT NULL,
  `pendapatan` int(11) NOT NULL,
  `pengeluaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `komplain`
--

CREATE TABLE `komplain` (
  `id` char(255) NOT NULL,
  `komplain` text NOT NULL,
  `nominal` int(11) DEFAULT NULL,
  `persetujuan` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mekanik`
--

CREATE TABLE `mekanik` (
  `id` char(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nohp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pendapatan`
--

CREATE TABLE `pendapatan` (
  `tanggal` date NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `nominal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `tanggal` date NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `nominal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` char(255) NOT NULL,
  `id_paket` char(255) NOT NULL,
  `nama_pemesan` varchar(255) NOT NULL,
  `nohp` varchar(255) NOT NULL,
  `berat` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `id_pesanan` char(255) NOT NULL,
  `waktu` datetime NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`,`tanggal`);

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`username`),
  ADD KEY `akun_id_foreign` (`id`);

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`id`,`tanggal`);

--
-- Indexes for table `jenis_paket`
--
ALTER TABLE `jenis_paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kerusakan`
--
ALTER TABLE `kerusakan`
  ADD KEY `kerusakan_id_foreign` (`id`),
  ADD KEY `kerusakan_tanggal_foreign` (`tanggal`);

--
-- Indexes for table `keuangan`
--
ALTER TABLE `keuangan`
  ADD PRIMARY KEY (`tanggal`);

--
-- Indexes for table `komplain`
--
ALTER TABLE `komplain`
  ADD KEY `komplain_id_foreign` (`id`);

--
-- Indexes for table `mekanik`
--
ALTER TABLE `mekanik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pendapatan`
--
ALTER TABLE `pendapatan`
  ADD KEY `pendapatan_tanggal_foreign` (`tanggal`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD KEY `pengeluaran_tanggal_foreign` (`tanggal`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `pesanan_id_paket_foreign` (`id_paket`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD KEY `progress_id_pesanan_foreign` (`id_pesanan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_id_foreign` FOREIGN KEY (`id`) REFERENCES `karyawan` (`id`);

--
-- Constraints for table `akun`
--
ALTER TABLE `akun`
  ADD CONSTRAINT `akun_id_foreign` FOREIGN KEY (`id`) REFERENCES `karyawan` (`id`);

--
-- Constraints for table `gaji`
--
ALTER TABLE `gaji`
  ADD CONSTRAINT `gaji_id_foreign` FOREIGN KEY (`id`) REFERENCES `karyawan` (`id`);

--
-- Constraints for table `kerusakan`
--
ALTER TABLE `kerusakan`
  ADD CONSTRAINT `kerusakan_id_foreign` FOREIGN KEY (`id`) REFERENCES `mekanik` (`id`),
  ADD CONSTRAINT `kerusakan_tanggal_foreign` FOREIGN KEY (`tanggal`) REFERENCES `keuangan` (`tanggal`);

--
-- Constraints for table `komplain`
--
ALTER TABLE `komplain`
  ADD CONSTRAINT `komplain_id_foreign` FOREIGN KEY (`id`) REFERENCES `pesanan` (`id_pesanan`);

--
-- Constraints for table `pendapatan`
--
ALTER TABLE `pendapatan`
  ADD CONSTRAINT `pendapatan_tanggal_foreign` FOREIGN KEY (`tanggal`) REFERENCES `keuangan` (`tanggal`);

--
-- Constraints for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD CONSTRAINT `pengeluaran_tanggal_foreign` FOREIGN KEY (`tanggal`) REFERENCES `keuangan` (`tanggal`);

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_id_paket_foreign` FOREIGN KEY (`id_paket`) REFERENCES `jenis_paket` (`id_paket`);

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `progress_id_pesanan_foreign` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
