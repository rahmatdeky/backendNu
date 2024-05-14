-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2024 at 01:48 PM
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
-- Database: `pcnu_batam`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `deskripsi` mediumtext DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `view` bigint(20) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id`, `id_user`, `id_kategori`, `judul`, `deskripsi`, `gambar`, `created_at`, `updated_at`, `view`, `tanggal`) VALUES
(5, 14, 2, 'Pelantikan Pengurus PCNU Kota Batam', 'Alhamdulillah pada hari Sabtu, 24 juni 2023 telah dilaksanakan pelantikan Pengurus PCNU Kota Batam di Aula PIH Batam Center.\r\nAcara pelantikan dihadiri Wakil Skejen PBNU KH Sulaiman Tanjung, Walikota Batam H.Muhammad Rudi, Wakil Gubernur Provinsi Kepri Hj Marlin Agustina, Ketua PWNU Kepri Dr H Mahbub Daryanto, Para Kyai, Ulama Tokoh NU di Kota Batam.\r\nPada acara tersebut juga dilaksanakan launching program pelatihan untuk generasi muda yang bekerjasama dengan Politeknik Negeri Batam, IA ITB, IKA ITS, IKA UNDIP, juga dilaksanakan MoU dengan perusahaan yang akan menerima SDM yang sudah dilatih.\r\nPCNU Batam juga menyerahkan secara simbolis hewan qurban berupa 12 ekor sapi kepada pengurus MWCNU di setiap kecamatan di Kota Batam.\r\nDalam sambutannya Walikota Batam menyampaikan agar NU terus berperan dalam menjaga tingkat toleransi dan kerukunan umat beragama di Kota Batam yang saat ini sudah sangat baik dan mendapat peringkat tertinggi di Provinsi Kepri.', 'public/file/berita/pelantikan.jpeg', '2024-05-14 03:28:30', NULL, NULL, '2024-05-14'),
(6, 14, 2, 'Peringatan Hari Santri dan Maulid', 'PCNU Kota Batam beserta seluruh Banom mengadakan serangkaian kegiatan peringatan hari Santri dan Maulid Nabi Muhammad SAW.\r\nIstighosah dan Pengajian Umum telah diselenggarakan pada hari Ahad, 22 Oktober 2023 Pukul 19.30 s.d Selesai bertempat di Masjid An Nahdlah NU Center Kepri Batam Center.\r\nTausiyah disampaikan oleh KH Masyhuri Malik. Ketua PBNU. Alhamdulillah acara berjalan dengan lancar, semoga membawa keberkahan.', 'public/file/berita/istighosah.jpeg', '2024-05-14 03:28:58', NULL, NULL, '2024-05-14'),
(7, 14, 2, 'Pelaksanaan Pelatihan Fitter Angkatan ke 2', 'Ketua PBNU (KH Masyhuri Malik) mengunjungi Pelatihan Fitter utk Industri Galangan Kapal Batch ke-2 di Politeknik Negeri Batam. Diikuti 30 peserta dari Banser dan Pagar Nusa. Ini merupakan Program LPNU -PCNU Batam bekerjasama dgn IA ITB, IA ITS, IA Undip dan Politeknik Negeri Batam.\r\nMohon doa nya semoga diberikan lancar dan membawa manfaat.', 'public/file/berita/fitter.jpeg', '2024-05-14 03:29:23', NULL, NULL, '2024-05-14'),
(8, 14, 2, 'PDPKPNU Angkatan ke 2 PCNU Batam', 'KH Masyhuri Malik, instruktur pusat PBNU secara resmi menutup PD-PKPNU angkatan ke-ll PCNU Batam. Penutupan PD-PKPNU dirangkai dengan prosesi baiat yang dilaksanakan di halaman utama Pondok Pesantren Al Ustmaniyah, Sagulung, Batam.\r\nSetelah mengikuti semua rangkaian kegiatan kaderisasi dasa (PD-PKPNU) angkatan ke-ll PCNU Batam, keseluruhan peserta yang berjumlah 131 orang itu telah di-bai\'t dan dinyatakan lulus PD-PKPNU.\r\n\r\nSelengkapnya:\r\nhttps://kepri.nu.or.id/daerah/kh-masyhuri-malik-tutup-pd-pkpnu-angkatan-ke-ll-batam-MQQNA?fbclid=IwAR3Co63NU4nWbWunVPnPvTwNe8Oplo15L_rHnSoZEefkvboWo-E0oTEud9U', 'public/file/berita/pdpkp.jpeg', '2024-05-14 03:29:44', NULL, NULL, '2024-05-14');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(2, 'Kegiatan', '2024-05-10 08:25:29', NULL),
(3, 'Dakwah', '2024-05-10 08:31:36', NULL),
(4, 'Informasi', '2024-05-10 08:32:25', NULL),
(5, 'Pengumuman', '2024-05-10 08:36:45', '2024-05-10 09:39:28'),
(6, 'ini baru bener', '2024-05-10 08:36:50', '2024-05-10 09:39:42'),
(7, 'nah udah siip', '2024-05-10 08:36:54', '2024-05-10 09:39:52');

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `kode_kecamatan` int(11) NOT NULL,
  `kode_kemendagri` varchar(255) DEFAULT NULL,
  `nama_kecamatan` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`kode_kecamatan`, `kode_kemendagri`, `nama_kecamatan`, `created_at`, `updated_at`) VALUES
(1, '21.71.10', 'Batam Kota', '2024-05-13 06:24:31', '2024-05-13 08:29:10'),
(2, '21.71.12', 'Batu Aji', '2024-05-13 06:25:17', NULL),
(3, '21.71.02', 'Batu Ampar', '2024-05-13 06:43:41', NULL),
(4, '21.71.01', 'Belakang Padang', '2024-05-13 06:44:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kelurahan`
--

CREATE TABLE `kelurahan` (
  `kode_kelurahan` int(11) NOT NULL,
  `kode_kecamatan` int(11) DEFAULT NULL,
  `nama_kelurahan` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelurahan`
--

INSERT INTO `kelurahan` (`kode_kelurahan`, `kode_kecamatan`, `nama_kelurahan`, `created_at`, `updated_at`) VALUES
(1, 1, 'Baloi Permai', '2024-05-13 09:28:36', '2024-05-13 10:07:18'),
(2, 2, 'Tanjung Uncang', '2024-05-13 09:46:44', NULL),
(3, 3, 'Sungai Jodoh', '2024-05-13 09:47:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lembaga`
--

CREATE TABLE `lembaga` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_kelurahan` int(11) DEFAULT NULL,
  `kode_kecamatan` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `jenjang` varchar(255) DEFAULT NULL,
  `jenis_lembaga` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `no_kontak` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `organisasi`
--

CREATE TABLE `organisasi` (
  `kode_organisasi` int(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(10, 'App\\Models\\User', 13, 'token', 'f4c87ccc0730552ff8a996044fb815f9a22ef3ca81b8a5015e56f73e70be7c91', '[\"*\"]', '2024-05-06 07:19:25', NULL, '2024-05-03 01:45:08', '2024-05-06 07:19:25'),
(12, 'App\\Models\\User', 14, 'token', 'a06dcc720e4ebd2a656ffe6fe8eedd367300e46f6b422c4d74465100e3360794', '[\"*\"]', '2024-05-13 20:29:45', NULL, '2024-05-07 19:47:54', '2024-05-13 20:29:45'),
(13, 'App\\Models\\User', 1, 'token', 'be9ee4aadb5e5d7ca146b454a2a6bddf041bb926ec19453a441380b9568ad892', '[\"*\"]', '2024-05-13 02:37:02', NULL, '2024-05-13 02:36:02', '2024-05-13 02:37:02'),
(14, 'App\\Models\\User', 14, 'token', '79d006d29934c6e7506595955b0a4a451a6ee20beab11da16c5bf141aeafb361', '[\"*\"]', '2024-05-13 07:40:37', NULL, '2024-05-13 07:40:37', '2024-05-13 07:40:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `url_foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `url_foto`) VALUES
(1, 'Test User', 'test@example.com', '2024-04-26 00:24:37', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sygC72G40g', '2024-04-26 00:24:37', '2024-04-26 00:24:37', 'admin', NULL),
(14, 'deky', 'deky@gmail.com', NULL, '$2y$10$S7IOckeUtZN0pUqxsx1YNu6GUt7hHYm2igyFW0j0y0N1F1zc.xVb6', NULL, NULL, NULL, 'admin', 'public/file/foto/users/WIN_20240124_09_15_04_Pro.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `warga`
--

CREATE TABLE `warga` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nik` int(11) NOT NULL,
  `kode_kelurahan` int(11) NOT NULL,
  `kode_organisasi` int(11) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `no_hp` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`kode_kecamatan`);

--
-- Indexes for table `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD PRIMARY KEY (`kode_kelurahan`);

--
-- Indexes for table `lembaga`
--
ALTER TABLE `lembaga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organisasi`
--
ALTER TABLE `organisasi`
  ADD PRIMARY KEY (`kode_organisasi`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `warga`
--
ALTER TABLE `warga`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `kode_kecamatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kelurahan`
--
ALTER TABLE `kelurahan`
  MODIFY `kode_kelurahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lembaga`
--
ALTER TABLE `lembaga`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `organisasi`
--
ALTER TABLE `organisasi`
  MODIFY `kode_organisasi` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `warga`
--
ALTER TABLE `warga`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
