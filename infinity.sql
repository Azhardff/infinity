-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Des 2023 pada 18.47
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infinity`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `nama`, `email`, `password`, `foto`) VALUES
('azhar', 'Azhar Daffa Imanudin', 'azhardff345@gmail.com', '1', 'indira.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bayar_transfer`
--

CREATE TABLE `bayar_transfer` (
  `id_book` varchar(10) NOT NULL,
  `rek_kirim` varchar(30) NOT NULL,
  `rek_tujuan` varchar(30) NOT NULL,
  `status` varchar(50) NOT NULL,
  `bukti_bayar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bayar_transfer`
--

INSERT INTO `bayar_transfer` (`id_book`, `rek_kirim`, `rek_tujuan`, `status`, `bukti_bayar`) VALUES
('KB00000001', '010020931847834', 'bri', 'Selesai', 'auth-providers.png'),
('KB00000005', '1111111111111111', 'bca', 'Selesai', ''),
('KB00000006', '1111111111111111', 'bca', 'Selesai', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `harga`
--

CREATE TABLE `harga` (
  `id_spklu` varchar(5) NOT NULL,
  `hari` varchar(20) NOT NULL,
  `jam` varchar(15) NOT NULL,
  `harga` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `username_member` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk` varchar(1) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `ver_code` varchar(255) NOT NULL,
  `lupa_pass` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`username_member`, `nama`, `tgl_lahir`, `jk`, `email`, `password`, `foto`, `ver_code`, `lupa_pass`) VALUES
('azhar123', 'Azhar Daffa Imanudin', '2003-12-08', 'L', 'member@gmail.com', '12345', 'indira.jpg', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `operator`
--

CREATE TABLE `operator` (
  `username` varchar(50) NOT NULL,
  `nama_opt` varchar(100) NOT NULL,
  `nama_spklu` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `alamat_spklu` varchar(250) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `ver_code` varchar(255) NOT NULL,
  `lupa_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `operator`
--

INSERT INTO `operator` (`username`, `nama_opt`, `nama_spklu`, `email`, `password`, `alamat`, `alamat_spklu`, `kota`, `foto`, `ver_code`, `lupa_code`) VALUES
('Azhardff', 'Azhar Daffa Imanudin', 'SPKLU INFINITY Purwokerto', 'azhardff345@gmail.com', '12345', 'Jalan HR. Bunyamin No.106', 'Jalan HR. Bunyamin No.106', 'Purwokerto', 'indira.jpg', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `spklu`
--

CREATE TABLE `spklu` (
  `id_spklu` varchar(5) NOT NULL,
  `jenis_konektor` varchar(20) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `harga` int(20) NOT NULL,
  `no_spklu` varchar(5) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `spklu`
--

INSERT INTO `spklu` (`id_spklu`, `jenis_konektor`, `foto`, `harga`, `no_spklu`, `username`) VALUES
('IF001', 'Mennekes', 'pwt1-4.jpg', 25000, '1', 'Azhardff'),
('IF002', 'Tesla', 'pwt1-4.jpg', 25000, '2', 'Azhardff'),
('IF003', 'GB/T', 'pwt1-4.jpg', 25000, '3', 'Azhardff'),
('IF004', 'J1772', 'pwt1-4.jpg', 25000, '4', 'Azhardff');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_book` varchar(10) NOT NULL,
  `username_member` varchar(30) NOT NULL,
  `id_spklu` varchar(5) NOT NULL,
  `tgl_book` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL,
  `tgl_main` date NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_berakhir` time NOT NULL,
  `jenis_bayar` varchar(10) NOT NULL,
  `total_harga` int(10) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`username_member`);

--
-- Indeks untuk tabel `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `spklu`
--
ALTER TABLE `spklu`
  ADD PRIMARY KEY (`id_spklu`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_book`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
