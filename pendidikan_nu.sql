-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 15, 2024 at 08:13 PM
-- Server version: 10.3.39-MariaDB-cll-lve
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rahk7943_pendidikan_nu`
--

-- --------------------------------------------------------

--
-- Table structure for table `akses`
--

CREATE TABLE `akses` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `email` varchar(205) NOT NULL,
  `akses` varchar(205) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akses`
--

INSERT INTO `akses` (`id`, `id_user`, `email`, `akses`) VALUES
(1, 2, 'deky@gmail.com', 'browseSiswa'),
(2, 2, 'deky@gmail.com', 'addSiswa'),
(3, 2, 'deky@gmail.com', 'manajemenUser'),
(7, 2, 'deky@gmail.com', 'settingBerita');

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL,
  `tanggal_berita` date DEFAULT NULL,
  `judul_berita` varchar(50) DEFAULT NULL,
  `isi_berita` varchar(2000) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `nama_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id_berita`, `tanggal_berita`, `judul_berita`, `isi_berita`, `kategori`, `nama_file`) VALUES
(45, '2023-12-09', 'Pelantikan Pengurus PCNU Kota Batam', 'Alhamdulillah pada hari Sabtu, 24 juni 2023 telah dilaksanakan pelantikan Pengurus PCNU Kota Batam di Aula PIH Batam Center.\r\nAcara pelantikan dihadiri Wakil Skejen PBNU KH Sulaiman Tanjung, Walikota Batam H.Muhammad Rudi, Wakil Gubernur Provinsi Kepri Hj Marlin Agustina, Ketua PWNU Kepri Dr H Mahbub Daryanto, Para Kyai, Ulama Tokoh NU di Kota Batam.\r\nPada acara tersebut juga dilaksanakan launching program pelatihan untuk generasi muda yang bekerjasama dengan Politeknik Negeri Batam, IA ITB, IKA ITS, IKA UNDIP, juga dilaksanakan MoU dengan perusahaan yang akan menerima SDM yang sudah dilatih.\r\nPCNU Batam juga menyerahkan secara simbolis hewan qurban berupa 12 ekor sapi kepada pengurus MWCNU di setiap kecamatan di Kota Batam.\r\nDalam sambutannya Walikota Batam menyampaikan agar NU terus berperan dalam menjaga tingkat toleransi dan kerukunan umat beragama di Kota Batam yang saat ini sudah sangat baik dan mendapat peringkat tertinggi di Provinsi Kepri.', 'Kegiatan', 'public/file/berita/pelantikan.jpeg'),
(46, '2023-12-09', 'Peringatan Hari Santri dan Maulid', 'PCNU Kota Batam beserta seluruh Banom mengadakan serangkaian kegiatan peringatan hari Santri dan Maulid Nabi Muhammad SAW.\r\nIstighosah dan Pengajian Umum telah diselenggarakan pada hari Ahad, 22 Oktober 2023 Pukul 19.30 s.d Selesai bertempat di Masjid An Nahdlah NU Center Kepri Batam Center.\r\nTausiyah disampaikan oleh KH Masyhuri Malik. Ketua PBNU. Alhamdulillah acara berjalan dengan lancar, semoga membawa keberkahan.', 'Kegiatan', 'public/file/berita/istighosah.jpeg'),
(47, '2023-12-09', 'Pelaksanaan Pelatihan Fitter Angkatan ke 2', 'Ketua PBNU (KH Masyhuri Malik) mengunjungi Pelatihan Fitter utk Industri Galangan Kapal Batch ke-2 di Politeknik Negeri Batam. Diikuti 30 peserta dari Banser dan Pagar Nusa. Ini merupakan Program LPNU -PCNU Batam bekerjasama dgn IA ITB, IA ITS, IA Undip dan Politeknik Negeri Batam.\r\nMohon doa nya semoga diberikan lancar dan membawa manfaat.', 'Kegiatan', 'public/file/berita/fitter.jpeg'),
(48, '2023-12-09', 'PDPKPNU Angkatan ke 2 PCNU Batam', 'KH Masyhuri Malik, instruktur pusat PBNU secara resmi menutup PD-PKPNU angkatan ke-ll PCNU Batam. Penutupan PD-PKPNU dirangkai dengan prosesi baiat yang dilaksanakan di halaman utama Pondok Pesantren Al Ustmaniyah, Sagulung, Batam.\r\nSetelah mengikuti semua rangkaian kegiatan kaderisasi dasa (PD-PKPNU) angkatan ke-ll PCNU Batam, keseluruhan peserta yang berjumlah 131 orang itu telah di-bai\'t dan dinyatakan lulus PD-PKPNU.\r\n\r\nSelengkapnya:\r\nhttps://kepri.nu.or.id/daerah/kh-masyhuri-malik-tutup-pd-pkpnu-angkatan-ke-ll-batam-MQQNA?fbclid=IwAR3Co63NU4nWbWunVPnPvTwNe8Oplo15L_rHnSoZEefkvboWo-E0oTEud9U', 'Kegiatan', 'public/file/berita/pdpkp.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `landing_page`
--

CREATE TABLE `landing_page` (
  `id` int(11) NOT NULL,
  `id_berita` int(11) DEFAULT NULL,
  `jenis` varchar(225) DEFAULT NULL,
  `seri` int(11) DEFAULT NULL,
  `tanggal_berita` date DEFAULT NULL,
  `judul_berita` varchar(50) DEFAULT NULL,
  `isi_berita` varchar(2000) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `url_gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `landing_page`
--

INSERT INTO `landing_page` (`id`, `id_berita`, `jenis`, `seri`, `tanggal_berita`, `judul_berita`, `isi_berita`, `kategori`, `url_gambar`) VALUES
(47, 45, 'highlight', 1, '2023-12-09', 'Pelantikan Pengurus PCNU Kota Batam', NULL, NULL, 'public/file/berita/pelantikan.jpeg'),
(48, 48, 'highlight', 2, '2023-12-09', 'PDPKPNU Angkatan ke 2 PCNU Batam', NULL, NULL, 'public/file/berita/pdpkp.jpeg'),
(49, 46, 'highlight', 3, '2023-12-09', 'Peringatan Hari Santri dan Maulid', NULL, NULL, 'public/file/berita/istighosah.jpeg'),
(59, 47, 'carousel', NULL, '2023-12-09', 'Pelaksanaan Pelatihan Fitter Angkatan ke 2', NULL, NULL, 'public/file/berita/fitter.jpeg'),
(60, 48, 'carousel', NULL, '2023-12-09', 'PDPKPNU Angkatan ke 2 PCNU Batam', NULL, NULL, 'public/file/berita/pdpkp.jpeg'),
(61, 46, 'carousel', NULL, '2023-12-09', 'Peringatan Hari Santri dan Maulid', NULL, NULL, 'public/file/berita/istighosah.jpeg'),
(62, 45, 'carousel', NULL, '2023-12-09', 'Pelantikan Pengurus PCNU Kota Batam', NULL, NULL, 'public/file/berita/pelantikan.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `lembaga`
--

CREATE TABLE `lembaga` (
  `id_lembaga` int(11) NOT NULL,
  `nama_lembaga` varchar(255) DEFAULT NULL,
  `jenjang` varchar(255) DEFAULT NULL,
  `jenis_lembaga` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nama_pimpinan` varchar(255) DEFAULT NULL,
  `jenis_kerjasama` varchar(255) DEFAULT NULL,
  `no_kontak` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `RT` varchar(20) DEFAULT NULL,
  `RW` varchar(20) DEFAULT NULL,
  `kecamatan` varchar(200) DEFAULT NULL,
  `kelurahan` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lembaga`
--

INSERT INTO `lembaga` (`id_lembaga`, `nama_lembaga`, `jenjang`, `jenis_lembaga`, `alamat`, `nama_pimpinan`, `jenis_kerjasama`, `no_kontak`, `email`, `website`, `RT`, `RW`, `kecamatan`, `kelurahan`) VALUES
(5, 'Yayasan Al Jamilun', 'TPQ dan Pondok Tahfiz', 'TPQ dan Pondok Tahfiz', 'Bengkong Kolam Mas', 'Ust Zamhari', 'Pendidikan dan Materi Aswaja', NULL, NULL, NULL, NULL, NULL, 'Bengkong', 'Sadai'),
(6, 'SMK Ma\'arif NU Batam', 'SMK', 'Sekolah Formal', 'Jl Raya Marina City Depan Perum Kotamas Marina', 'Nopvia Kristiningrum', 'Kurikulum Aswaja', NULL, NULL, 'smkmaarifnubatam.sch.id', NULL, NULL, 'Sekupang', 'Tanjung Riau'),
(7, 'Yayasan Baitul Qur\'an Batam', 'Pondok Pesantren', 'Pondok Pesantren', 'Tanjung Buntung, Bengkong, Batam City, Riau Islands 29444', 'Muhammad Zaenuddin', 'Pendidikan dan Kurikulum Ponpes', NULL, NULL, NULL, '02', '01', 'Bengkong', 'Tanjung Buntung'),
(8, 'PP Raden Syahid Bengkong', 'Pondok Pesantren', 'Pondok Pesantren', 'Kavling Harapan Jaya', 'MUHAMMAD SOLEH', 'Materi Aswaja Ponpes', NULL, NULL, NULL, '02', '013', 'Bengkong', 'Sadai'),
(9, 'TPQ AL ANSHOR BENGKONG', 'TPQ', 'TPQ', 'Bengkong Jaya', 'Ahmad Badroni', 'Materi Aswaja dan Metode TPQ', NULL, NULL, NULL, '02', '007', 'Bengkong', 'Bengkong Laut'),
(10, 'MIS AL MUHAJIRIN BATU MERAH', 'Madrasah Ibtidaiyah', 'Madrasah Ibtidaiyah', 'Jl. Bawal No.35A', NULL, 'Materi Aswaja', NULL, NULL, NULL, '02', '007', 'Batu Ampar', 'Batu Merah'),
(11, 'TPQ HASYIM ASYARI BENGKONG', 'TPQ', 'TPQ', 'Jl Bengkong Laut', 'Sudarto', 'Materi Aswaja', NULL, NULL, NULL, NULL, NULL, 'Bengkong', 'Bengkong Laut'),
(12, 'YAYASAN MAMIQ NUH', 'TPQ dan RTQ', 'TPQ dan RTQ', 'PERUMAHAN BRB 2 BLOK I NO. 8', 'Ibnu Mamiq, M.Pd', 'Materi Aswaja', NULL, NULL, NULL, '4', '25', 'Sagulung', 'Sungai Langkai');

-- --------------------------------------------------------

--
-- Table structure for table `list_akses`
--

CREATE TABLE `list_akses` (
  `id` int(11) NOT NULL,
  `nama_akses` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `list_akses`
--

INSERT INTO `list_akses` (`id`, `nama_akses`) VALUES
(1, 'browseSiswa'),
(2, 'manajemenUser'),
(3, 'addSiswa'),
(4, 'settingBerita');

-- --------------------------------------------------------

--
-- Table structure for table `pengurus`
--

CREATE TABLE `pengurus` (
  `NIK` varchar(25) NOT NULL,
  `nama_pengurus` varchar(200) DEFAULT NULL,
  `alamat_pengurus` varchar(500) DEFAULT NULL,
  `organisasi` varchar(200) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `no_hp` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `RW` varchar(20) DEFAULT NULL,
  `RT` varchar(20) DEFAULT NULL,
  `kecamatan` varchar(200) DEFAULT NULL,
  `kelurahan` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengurus`
--

INSERT INTO `pengurus` (`NIK`, `nama_pengurus`, `alamat_pengurus`, `organisasi`, `jabatan`, `no_hp`, `email`, `RW`, `RT`, `kecamatan`, `kelurahan`) VALUES
('1205156812720004', 'Heva Susilawaty', 'Perum Taman Harapan Indah,RT2/Rw17,Fresia 1,no 15', 'MWCNU Sekupang', 'Pengurus unit UP ZISNU MWCNU Sekupang', '+6283184871400', '', '17', '2', 'Sekupang', 'Sungai Harapan'),
('1308075203980001', 'Rezy Widya Fatma', 'Jl. Marina( depan perum kota mas)', 'Utusan SMK Ma\'arif NU batam ', 'Pendamping santri putri pondok', '+6285311724873', '', '-', '-', 'Sekupang', 'Tanjung Riau'),
('1308172112950001', 'Akhir', 'Jalan marina raya/perumahan marina, RT 02/RW 22 Blok K. no 1', 'Banom', 'Wakil ketua 3', '+6287722043153', '', '22', '2', 'Sekupang', 'Tanjung Riau'),
('1404070605700001', 'Abdul jalil', 'Bengkong Indah Swadebi N 54', 'PCNU Kota Batam', 'Anggota', '+6285265918222', '', '-', '-', 'Bengkong', 'Sadai'),
('1404082404020001', 'Wahyu Cahyono. P', 'Perum.Phoenix Garden Blok J/15, RT 006, RW 018', 'Ranting', 'Anggota', '+6287791550777', '', '18', '6', 'Sagulung', 'Sungai Langkai'),
('1404130701760001', 'LAMSAR', 'Komp.pengairan Rt 001/012', 'IPNU', 'Anggota', '+6281366471760', '', '12', '1', 'Sekupang', 'Tanjung Riau'),
('1404132704000002', 'JUPRIANSYAH', 'Belian blok B3 no.08', 'Banom', 'Ketua 3 bidang keagamaan', '+6282181929461', '', '-', '-', 'Batam Kota', 'Belian'),
('1410041811910001', 'Muhammad Khairul Basyar', 'Jl Dapur 12 Perum Kapling Mandiri Blok B No 11', 'Kader NU', 'Kader NU', '+6285334325717', '', '-', '-', 'Sagulung', 'Sungai Pelunggut'),
('1472022404010001', 'Rivan Apriadi', 'Perumahan Fantasy Residence Blok B3. No. 5', 'IPNU', 'Ketua PAC IPNU SAGULUNG', '+6282181000630', '', '-', '-', 'Sekupang', 'Tanjung Riau'),
('1504071408900001', 'SAMURI', 'Perum,taman Kartini raya thp 2 blok B no 12 B ', 'MWCNU sekupang', 'Ranting NU', '+6282386095205', '', '-', '-', 'Sekupang', 'Sungai Harapan'),
('1506022412910003', 'Abdul Hafiz', 'Rhestu No 18 A RT 001 RW 010', 'PERGUNU BENGKONG', 'Anggota', '+6282388312722', '', '10', '1', 'Nongsa', 'Batu Besar'),
('1506023012890001', 'Abdul Majid', 'Perumahan Pondok Asri Indah M12A ', 'MWC NU Bengkong', 'Wakil Sekertaris MWC', '+6282268023030', '', '-', '-', 'Batam Kota', 'Sungai Panas'),
('1608122408890004', 'ABDUL AZIZ', 'PANDAWA MANDIRI BLOK F NO.18 RT.01 RW.10', 'Ranting', 'Anggota', '+6281371066942', '', '10', '1', 'Sagulung', 'Sungai Binti'),
('1801180509970002', 'Rahmat suryadi', 'Perumahan batu aji Riau bertuah tahap 1 blok i no 28 ', 'Majlis Royyed batam', 'Anggota', '+62895629489856', '', '-', '-', 'Sagulung', 'Sungai Langkai'),
('1803200504830002', 'Fatoni', 'Perum Angkasa Marina Blok I No 3', 'PCNU Kota Batam', 'Kader Nu', '+6281314753876', '', '-', '-', 'Sekupang', 'Tanjung Riau'),
('1812042806890002', 'Muhammad Saifudin', 'Kampung Cunting Tanjung Uncang', 'MWC NU', 'Wakil Syuriyah MWC Batu aji', '+6285266884431', '', '-', '-', 'Batu Aji', 'Tanjung Uncang'),
('1906022301830001', 'Dony Saputra', 'Greenland Housing E2 14', '', '', '+6288279096197', '', '-', '-', 'Batam Kota', 'Teluk Tering'),
('2101071904840001', 'NUR  KHALIM, S.Pd.', 'Perum Griya Permata Blok C No 84 RT. 11/RW. 09', 'MWCNU', 'A\'wan', '+6285272546000', '', '9', '11', 'Sagulung', 'Sungai Langkai'),
('2171010302870001', 'Mirwan Akbar', 'Geranting RT 11 RW 005 jalan masjid No 1', 'MWCNU', 'Anggota', '+6282170159193', '', '5', '11', 'Belakang Padang', 'Pulau Terung'),
('2171011608749002', 'ROSO PRASETYO WIBOWO', 'Kp. Jawa RT.03/RW.03 Kel. Sekanak Raya', 'PCNU Kota Batam', 'SEKRETARIS', '+6281266632012', '', '3', '3', 'Belakang Padang', 'Sekanak Raya'),
('2171012007680001', 'NUR KOLIQ', 'Rt 001 Rw 004  ', 'MWCNU BELAKANG PADANG', 'Anggota', '+6285763530081', '', '4', '1', 'Belakang Padang', 'Tanjung Sari'),
('2171012012770003', 'Moh Zaini', 'Gajah Mada/Perumahan Tiban Ayu RT. 1, RW. 14 Blok M3 No. 22', 'PCNU ', 'Anggota LPNU ', '+628127036965', '', '14', '1', 'Sekupang', 'Tiban Lama'),
('2171012107789001', 'Habib Soleh', 'Kampung Baru RT 03 / RW 005', 'PCNU Kota Batam', 'Wakil tanfidziyah', '+6281372776095', '', '5', '3', 'Belakang Padang', 'Tanjung Sari'),
('2171012407750001', 'MUHAMMAD ROHMAN', 'JALAN HANG LEKIU NO.2 RT/RW:002/005 KAMPUNG BARU ', 'PCNU Kota Batam', 'Wakil Katib', '+628127798971', '', '5', '2', 'Belakang Padang', 'Tanjung Sari'),
('2171013101929001', 'Arham', 'Taman Mediterania Extention BLK HH 3A No. 23', 'RMI PCNU BATAM', 'Anggota', '+6282389076901', '', '-', '-', 'Batam Kota', 'Baloi Permai'),
('2171014604779001', 'Siti Aminah', 'Kp Baru RT 02/05', 'Banom', 'Ketua PAC MN ', '+6281364030552', '', '5', '2', 'Belakang Padang', 'Tanjung Sari'),
('2171020210669001', 'Zaenal Abidin', 'Rt.02/RW.01', 'Tanfidzia', 'Ketua', '+6282387261146', '', '2', '1', 'Batu Ampar', 'Tanjung Sengkuang'),
('2171020608769005', 'Musapak', 'Tanjung Sengkuang Blok E RT 05 RW XI 	', 'MWCNU Batu Ampar', 'Katib', '+6285668141448', '', '11', '5', 'Batu Ampar', 'Tanjung Sengkuang'),
('2171021309610001', 'Suparyo', 'Kampung Seraya RT 006 RW 001', 'MWC NU Batu Ampar', 'Syuro', '+6285760615998', '', '1', '6', 'Batu Ampar', 'Kampung Seraya'),
('2171021310720002', 'Sadiman', 'Nagoya garden blok f no 62 RT 03/RW 01 ', 'MWCNU', 'Wakil bendahara MWC NU batu ampar ', '+6282170373655', '', '1', '3', 'Batu Ampar', 'Kampung Seraya'),
('2171021510809006', 'SANTOSO', 'Gang jambu no 73 RT 01 RW 01 ', 'MWCNU BATU AMPAR ', 'A\'WAN ', '+6282170792923', '', '1', '1', 'Batu Ampar', 'Tanjung Sengkuang'),
('2171021712720001', 'Joko waluyo', 'Jl.komplek Esqarada,RT.03,RW.12,Blok F No.94', 'MWCNU', 'Bendahara', '+6281266316469', '', '12', '3', 'Batu Ampar', 'Tanjung Sengkuang'),
('2171022907789002', 'BAIS FATHONI', 'Kavling Pasir Mantang blok C1 no 5 RT 04 RW 01 ', 'MWC NU kecamatan Batu Ampar ', 'Wakil Rois Syuriyyah', '+6281266448376', '', '1', '4', 'Batu Ampar', 'Tanjung Sengkuang'),
('2171023105710001', 'Imam Riswandi', 'Jln. Brigjen Katamso Perumahan Pluto RT 01/RW 005 blok B 7 no. 2', 'MWCNU', 'Sekertaris PRNU Tanjung Uncang', '+6282389443681', '', '5', '1', 'Batu Aji', 'Tanjung Uncang'),
('2171023112680006', 'Syamsul Huda', 'Kampung Seraya RT 004 RW 008', 'MWC Batu Ampar', 'Bendahara', '+6285363835255', '', '8', '4', 'Batu Ampar', 'Kampung Seraya'),
('2171024610709004', 'Suriati', 'Kom Orchid Center B 16', 'Muslimat NU Batu Ampar', 'Ketua', '+6281268311958', '', '-', '-', 'Batu Ampar', 'Sungai Jodoh'),
('2171025208750001', 'FATIMATUZ ZAHRO', 'Pantai Gading Blok F2 No.17-18 ', 'Pergunu ', 'Wakil Ketua', '+6281270214148', '', '-', '-', 'Bengkong', 'Tanjung Buntung'),
('2171025907770001', 'Suciati', 'Kav. Sagulung Jaya Blok C No : 10 RT 03 RW 02', 'Ranting', 'Seksi Bidang dakwah', '+6285717184553', '', '2', '3', 'Sagulung', 'Sungai Lekop'),
('2171026411760001', 'Rosmini', 'KOMP. MCP. BLOK B RT 001 RW 015', 'PERGUNU', 'Anggota', '+6282286638141', '', '15', '1', 'Batu Ampar', 'Tanjung Sengkuang'),
('2171030102700005', 'Bima Sakti', 'Tiban lama Gang Duku no 97', 'PCNU Kota Batam', 'Anggota', '+6285265745206', '', '-', '-', 'Sekupang', 'Tiban Lama'),
('2171030605990010', 'Dhyka Ridho Firmansyah', 'kartini 3 blok d 14 rt 001 rw 003', 'MWCNU', 'jamaah', '+6289602411366', '', '3', '1', 'Sekupang', 'Sungai Harapan'),
('2171030909829015', 'Nasrulloh', 'Griya kpn blok i1 No.22 RT.02 RW.041', 'PCNU Kota Batam', 'Sekertaris', '+6281371346015', '', '41', '2', 'Batam Kota', 'Belian'),
('2171031402829012', 'Joko Surono', 'Perum Aviari Garden II Blok H/12 B RT.003 RW.025', 'Ranting', 'Katib', '+6282389833974', '', '25', '3', 'Sagulung', 'Sungai Langkai'),
('2171031405810009', 'JIANTO', 'Sungai harapan Pondok pratiwi rt04 rw16 blok gg no 9', 'MWCNU', 'Bendahara', '+6285248970188', '', '16', '4', 'Sekupang', 'Sungai Harapan'),
('2171031504790009', 'Abdul Hakim', 'Villa alam lestari, thp 2 Blok FF 12 B ', 'anggota', 'anggota', '+62811777187', '', '-', '-', 'Sekupang', 'Tiban Baru'),
('2171031605770009', 'Mochamad misbahul Huda', 'Tiban Koperasi Blok S No: 34 A', 'Ranting', 'Ketua', '+628126132662', '', '-', '-', 'Sekupang', 'Tiban Baru'),
('2171031712879009', 'Akhmad Subkhi', 'Jl. Tiban Mentarau KSB Blok J.18 RT.007/RW.10', 'RMI PCNU BATAM', 'Sekertaris', '+6282174679404', '', '10', '7', 'Sekupang', 'Patam Lestari'),
('2171031812850003', 'Agus yusup', 'Kavling patam Madani ', 'Banom', 'Humas luar negeri ', '+6282172313485', '', '-', '-', 'Sekupang', 'Patam Lestari'),
('2171032202049009', 'Muhammad Amirul farhan', 'Perumahan tiban point blok B2 No 11', 'Banom', 'Ketua DKC CBP kota Batam', '+6285761117611', '', '-', '-', 'Sekupang', 'Tiban Indah'),
('2171033001729004', 'M. Asrori', 'Perum. Tiban Bukit Asri D.14, RT O1 RW X', 'MWC NU Kec. Sekupang', 'Ketua Tanfidziyah', '+6281536015567', '', '10', '1', 'Sekupang', 'Tiban Baru'),
('2171033108759007', 'Muhammad Ridwan', 'Komp. Perumahan Tiban Koperasi Blok K-22, RT. 05 / RW. 06', 'Sekretaris', 'Sekretaris', '+6285264103811', '', '6', '5', 'Sekupang', 'Tiban Baru'),
('2171035010649006', 'MARWIYAH HASIBUAN', 'Perumahan Masyeba permai blok G no 6 RT 02 RW 06', 'MWCNU KEC.SEKUPANG', 'Pembina muslimat Sekupang ', '+6281270576410', '', '6', '2', 'Sekupang', 'Patam Lestari'),
('2171035304779005', 'Aslinda', 'Tiban 1  RT2 RW13  Blok AA no 48', 'MWCNU KOTA BATAM', 'Anggota', '+6288707439880', '', '13', '2', 'Sekupang', 'Patam Lestari'),
('2171035307809013', 'SUSANTI', 'Pondok pratiwi 3 rt04 rw 16 blok gg no9', 'MWCNU SEKUPANG', 'Bendahara', '+6285248970188', '', '16', '4', 'Sekupang', 'Sungai Harapan'),
('2171036003049006', 'Fanny Adinda Putri', 'Perum.Tiban Riau Bertuah Blok I No 6 Rt 02 RW 09 ', 'PC Ippnu Kota batam', 'SEKRETARIS', '+6281363642096', '', '9', '2', 'Sekupang', 'Patam Lestari'),
('2171036804769009', 'MIFTAHUSSA\'ADAH', 'Perum  Tiban Bukit Asri Blok D. 14, RT 01 RW. X', 'MWC NU', 'Anggota', '+6285765322058', '', '10', '1', 'Sekupang', 'Tiban Baru'),
('2171040912759003', 'M YASIN', 'SEI LEKOP BLOG B9 NO 17 RT 05 RW 07', 'RANTING NU', 'MUTASYAR', '+6288272136982', '', '7', '5', 'Sagulung', 'Sungai Lekop'),
('2171041103720001', 'Moh rusdi safii', 'Kampung tengah rt005rw010', 'Pcnu', 'A\'wan', '+6281372274141', '', '10', '5', 'Nongsa', 'Batu Besar'),
('2171042502680001', 'Drs. Fariq bin suhadi Kertosono', 'Kp panglong Rt03/RW XI. ', 'Pergunu', 'Anggota', '+6281364686425', '', '11', '3', 'Nongsa', 'Batu Besar'),
('2171044111809005', 'Nopvia Kristiningrum, S.Pd', 'Citra Mas Indah L 36 ', 'SMK Ma\'arif NU Batam', 'Kepala Sekolah ', '+6281216354574', '', '-', '-', 'Nongsa', 'Batu Besar'),
('2171060806749011', 'AHMAD RIYADI', 'Kampung pelita 7', 'Suriyah', 'Suriyah', '+6281364510866', '', '-', '-', 'Lubuk Baja', 'Kampung Pelita'),
('2171060902720002', 'ALIF MUBAROK', 'Komplek Politeknik, RT 02 RW 11 Kel.Teluk Tering, Kec.Batam Kota, BATAM', ' Ranting', 'Ketua', '+6285265421288', '', '11', '2', 'Batam Kota', 'Teluk Tering'),
('2171061004709005', 'Suluchi', 'Blok 6 jln Dahlia No.02 A', 'MWCNU', 'Ketua', '+6285264025659', '', '-', '-', 'Lubuk Baja', 'Batu Selicin'),
('2171061212680002', 'Ahmad fauzan', 'Perumahan cipta asri blok. L. No.41 RT 8/12', 'PCNU Kota Batam', 'Non struktural', '+6282169102165', '', '12', '8', 'Sagulung', 'Tembesi'),
('2171063105719003', 'Adib Masykuri', 'Pelita VII blok D 01 rt001 rw002', 'PCNU Kota Batam', 'Katib Syuriyah ', '+6285264121165', '', '2', '1', 'Lubuk Baja', 'Kampung Pelita'),
('2171065203819001', 'Reni rosandi', 'Perum Persero view bertuah BLK e no 5 ', 'Muslimat NU ', 'anggota', '+6282171491703', '', '-', '-', 'Sekupang', 'Patam Lestari'),
('2171065608839003', 'Nuraini', 'Perumahan glory tanjung riau B 11 no 10', 'PCNU Kota Batam', 'Dewan pendidik ', '+6289623417133', '', '-', '-', 'Sekupang', 'Tanjung Riau'),
('2171066307770002', 'Yuli Tri Rahayu', 'bengkong indah 1 blok G no 73 kecamatan bengkong kota batam', 'muslimat', 'di bidang sosial', '+6283195975622', '', '-', '-', 'Bengkong', 'Bengkong Indah'),
('2171070305550001', 'Daim khoiri', 'Perum bida ayu blok D 6 no 11', 'Mangsang', 'Syuriyah', '+6285761338871', '', '-', '-', 'Sei Beduk', 'Mangsang'),
('2171070510769005', 'MAROKHIMIN SH.', 'Buana mas l blok silver no 29\nKuning, Batuaji, Kota Batam', 'LBH NU Kepri', 'Ketua', '+6281277009008', '', '-', '-', 'Batu Aji', 'Kibing'),
('2171070604800003', 'ADI NUGRAHA', 'PONDOK GRAHA BLOK N NO. 21 RT04 RW04', 'ANGGOTA', 'A\'WAN MWCNU SEI BEDUK', '+628192214445', '', '4', '4', 'Sei Beduk', 'Duriangkang'),
('2171070606739007', 'Khudhory', 'Kavling pancur baru blok  a 68', 'A\'wan', 'Ketua A\'wan mwcnu', '+6281372199275', '', '-', '-', 'Sei Beduk', 'Duriangkang'),
('2171070707719004', 'Mahfud Sidik', 'Sei Pancur Blok H 13 RT02 RW01', 'PCNU Kota Batam', 'A\'wan', '+628117770036', '', '1', '2', 'Sei Beduk', 'Tanjung Piayu'),
('2171070802749002', 'Suratna', 'Puri agung 3 blok A2 no 4', 'MWC ', 'Bendahara ', '+6281901000801', '', '-', '-', 'Sei Beduk', 'Mangsang'),
('2171070911809003', 'Muslichun', 'Perum Pluto blok B2 no 07 ', 'Ranting tg uncang ', 'Ketua', '+6285264482435', '', '-', '-', 'Batu Aji', 'Tanjung Uncang'),
('2171071008769004', 'Sukatmanto', 'Perumahan gmp blok n nomor 16 rt01 rw02', 'Mwcnu', 'Ketua tanfizdiyah', '+6281991006567', '', '2', '1', 'Sei Beduk', 'Duriangkang'),
('2171071008789005', 'Muhammad Abdul Hafidz Mustofa', 'Kampung Mangsang RT 004 RW 003', 'Ranting Sei Beduk Mangsang', 'Ketua', '+62811693690', '', '3', '4', 'Sei Beduk', 'Mangsang'),
('2171071009799003', 'Joko Suyoto', 'Perumahan Bida Ayu Blok L No. 141', 'Sekretaris MWCNU', 'Sekretaris', '+62895370767381', '', '-', '-', 'Sei Beduk', 'Mangsang'),
('2171071111739008', 'Ahmad Rofi\'i', 'Bida Ayu Blok E No 65', 'MWC NU Sei Beduk', 'Wakil Sekretaris', '+6282172727474', '', '-', '-', 'Sei Beduk', 'Mangsang'),
('2171071202789003', 'Muchammad Yusuf Maulana', 'Rusunawa Muka Kuning 2 Blok C2.1.12', 'Ranting', 'Tanfidh', '+6281234123440', '', '-', '-', 'Sei Beduk', 'Muka Kuning'),
('2171071211739003', 'MARYONO', 'Bukit Ayu Lestari Blok B No. 5', 'Wakil Ketua Syuriah Mangsang', 'Wakil ketua', '+628127747712', '', '-', '-', 'Sei Beduk', 'Mangsang'),
('2171071504789001', 'Faizin', 'Bida Ayu Blok S 127', 'MWC NU Sei Beduk', 'Wakil Tanfidz', '+62895385103776', '', '-', '-', 'Sei Beduk', 'Mangsang'),
('2171071708799006', 'Muslami\'an', 'Semangka 2/Mangsang Permai Rt 003 Are 002 Blok G no 68 ', 'MWCNU Sei Beduk', 'Wakil Sekretaris 2', '+6286894098365', '', '2', '3', 'Sei Beduk', 'Mangsang'),
('2171072001759004', 'MUHLIS', 'Perum GMP Blok O No 165, RT 002, RW 002', 'Tanfidz Ranting', 'Ketua', '+6282172734458', '', '2', '2', 'Sei Beduk', 'Duriangkang'),
('2171072001860002', 'Bahrudin', 'Griya Batu Aji Asri THP THP 5 blok H2 15 RT 03 RW 17 ', 'Ranting', 'Bendahara ', '+6281329630602', '', '17', '3', 'Sagulung', 'Sungai Langkai'),
('2171072006740001', 'Malik Siswanto', 'Tanjung Piayu RT 1 RW 6', 'Ranting Tanjung Piayu', 'Anggota', '+6281364680164', '', '6', '1', 'Sei Beduk', 'Tanjung Piayu'),
('2171072011779004', 'Luqman Rifa\'i', 'Perumahan GMP Blok K 72 RT 03 RW 1 ', 'PWNU Kepri ', 'Wakil Rois Syuriah ', '+6281270808124', '', '1', '3', 'Sei Beduk', 'Duriangkang'),
('2171072406739004', 'Nur Aziz', 'Bida ayu blok s ruli samping no. 11', 'Rois', 'Mwc', '+621270781747', '', '-', '-', 'Sei Beduk', 'Mangsang'),
('2171072407840005', 'AHMAD ARIFIN', 'Perum Buana Vista Indah 3 ,Blok. B No.58 , Belian , Batam Kota ', 'PW LDNU', 'Sekretaris ', '+6281364602030', '', '-', '-', 'Batam Kota', 'Belian'),
('2171072512729001', 'Muhammad Abdul Kahfi', 'Rusunawa Pemko Blok B1.2.2', 'Ranting', 'Wakil Ketua', '+6281268912781', '', '-', '-', 'Sei Beduk', 'Muka Kuning'),
('2171072803779002', 'Ma\'muri', 'Perumahan Puri Agung 1, Blok E17', 'Syuriah', 'Katib', '+628127052498', '', '-', '-', 'Sei Beduk', 'Mangsang'),
('2171072808789004', 'Jumani', 'Mangsang permai blok N 62\n', 'A\'wan ', 'Wakil ketua ', '+6281364738809', '', '-', '-', 'Sei Beduk', 'Mangsang'),
('2171073012799006', 'Suparwi', 'Permata asri 2 blok PG 12 rt 06 rw 02 ', 'Pwnu kepri', 'Wakil khatib', '+6285763158605', '', '2', '6', 'Sei Beduk', 'Duriangkang'),
('2171073107860009', 'Tria Gunawan', 'Perum puriagung 4 thap 2 cluster B 16', 'Banom', 'Anggota', '+6281277811721', '', '-', '-', 'Sei Beduk', 'Mangsang'),
('2171074305739002', 'Suhartini', 'Bida ayu blok S 77 RT .03 RW 15', 'Fatayat NU', 'Wakil Sekretaris', '+6281277741271', '', '15', '3', 'Sei Beduk', 'Mangsang'),
('2171074507759004', 'ISTIQOMAH', 'BIDA AYU BLOK D3 NOMER 4\nRT 01  RW 07\nKEL.MANGSANG\nKEC.SUNGAI BEDUK', ' MUSLIMAT', 'ANGGOTA', '+6285977826197', '', '7', '1', 'Sei Beduk', 'Mangsang'),
('2171074711759007', 'Tri Susanti', 'Perumahan Puri Agung 2A Blok D.15', 'PC Muslimat NU Kota Batam', 'Bendahara II', '+628117006036', '', '-', '-', 'Sei Beduk', 'Mangsang'),
('2171075308769006', 'MURYANTI', 'Perum GMP Blok O No 165. RT 002, RW 002', 'MWC Muslimat NU', 'Anggota', '+6281275311149', '', '2', '2', 'Sei Beduk', 'Duriangkang'),
('2171075311730001', 'Faridawati Handayani', 'Perum GMP Blok H. 148 rt06 rw01 \n', 'Pac Fatayat ', 'Ketua', '+62895629472619', '', '1', '6', 'Sei Beduk', 'Duriangkang'),
('2171075704689002', 'Esty Subekhi Suprihatin', 'Kavling sei pancur blok H. 20 RT 02/01', 'Banom', 'Sekretaris', '+628127792004', '', '1', '2', 'Sei Beduk', 'Tanjung Piayu'),
('2171075901720001', 'Kalisom', 'Pondok Graha blok L 12 rt02 rw 04 Kel Duriabgkang,Kec Sei Beduk', 'Ketua PAC Muslimat NU Sei Beduk', 'Anggota', '+6281372688775', '', '4', '2', 'Sei Beduk', 'Duriangkang'),
('2171081011909004', 'Mulyadi', 'Pulau Petong RT 002 RW 003 Kelurahan Pulau Abang, Kecamatan Galang', 'MWCNU GALANG', 'SEKRETARIS', '+6282386152402', '', '3', '2', 'Galang', 'Pulau Abang'),
('2171082104850001', 'Aprizal', 'Kampung cate', 'MWCNU', 'Ketua Tanfidz', '+6281270573256', '', '-', '-', 'Galang', 'Rempang Cate'),
('2171090210789004', 'ALI MANSUR', 'KOMP YKB BLK C 20. RT 01 RW 11 ', 'PCNU Kota Batam', 'anggota Tanfizd', '+6281277491560', '', '11', '1', 'Bengkong', 'Bengkong Laut'),
('2171090305810001', 'Riki syolihin', 'Bengkong permai blok b no 15', 'PCNU kota batam', 'Sekretaris tanfidziyah', '+6281364102009', '', '-', '-', 'Bengkong', 'Bengkong Laut'),
('2171090311849004', 'Mujiburrahman', 'Perumahan Bandara Mas Blok D5 No 08 ', 'MWC NU Batam Kota ', 'Wakil Ketua Tanfidziah ', '+6281372601112', '', '-', '-', 'Batam Kota', 'Belian'),
('2171090604819009', 'TURHAMUN', 'Batu merah RT 12/RW 03 ', 'Bendahara ranting ', 'Bendahara 1', '+6281363904410', '', '3', '12', 'Batu Ampar', 'Batu Merah'),
('2171090608839004', 'Umar faruq salimun', 'Perum pondok pelangi 3 blok g1 no 20', 'Bendahara', 'Wakil ', '+6281977680528', '', '-', '-', 'Sekupang', 'Tiban Indah'),
('2171090706779002', 'Adi suryono', 'Perum villa sugiraya blok c no 9 ', 'Mcw nu', 'Bendahara umum', '+6282173563429', '', '-', '-', 'Batam Kota', 'Belian'),
('2171090710809005', 'Budiyono', 'Tiban berlian blok k no 20', 'PAC GP Ansor sekupang', 'Ketua', '+6282283004003', '', '-', '-', 'Sekupang', 'Tiban Indah'),
('2171090802769006', 'Imam choirudin', 'Bengkong asrama RT 01/RW10 Blok F5 No2', 'MWCNU', 'Sekretaris', '+6281372483031', '', '10', '1', 'Bengkong', 'Tanjung Buntung'),
('2171090902680001', 'Darto', 'Baloi Harapan2 Bengkong indah', 'Ketua mwc', '', '+6281364214542', '', '-', '-', 'Bengkong', 'Bengkong Indah'),
('2171091008730001', 'M imam Sofyan santun', 'Bengkong kolam RT 05 RW 03 Sadai Bengkong ', 'Pengurus ', 'Wakil sekretaris ', '+6281382549949', '', '3', '5', 'Bengkong', 'Sadai'),
('2171091103759004', 'Ahmad riyanto', 'Bengkong sadai blok m no 5', 'PW RMI NU', 'Ketua', '+6281270698785', '', '-', '-', 'Bengkong', 'Sadai'),
('2171091202040002', 'Wemfi triadi', 'Bengkong telaga indah,RT03,RW18,blok j no 14', 'Banom', 'Wakil sekretaris', '+6282172666434', '', '18', '3', 'Bengkong', 'Sadai'),
('2171091202759005', 'Abdul Basir', 'Baloi kebun ', 'Ketua Ranting NU Taman Baloi ', 'Ketua Ranting NU Taman Baloi ', '+6282284171028', '', '-', '-', 'Batam Kota', 'Taman Baloi'),
('2171091509830002', 'Ahmad Muzakki', 'Baloi Harapan 2 Blok A No.25 RT/RW :001/003', 'Katib Syuriah Ranting Bengkong Indah', 'Katib', '+62830', '', '3', '1', 'Bengkong', 'Bengkong Indah'),
('2171091812690001', 'Moh.Fudi Samsul Patoni', 'BENGKONG KOLAM RT 01 RW 03 ', 'Anggota Syuriah ', 'Anggota Syuriah ', '+6281364180294', '', '3', '1', 'Bengkong', 'Sadai'),
('2171092011729001', 'Muhith', 'Perumahan Puri Agung 4 Blok ino 7', 'PCNU Kota Batam', 'Wakil Sekretaris Syuriah', '+6281270101972', '', '-', '-', 'Sei Beduk', 'Mangsang'),
('2171092505740002', 'M Choirul Anwar', 'Griya Batu Aji Asri Blok M No 5', 'Ranting Sungai Langkai', 'Mustasyar', '+628127741635', '', '-', '-', 'Sagulung', 'Sungai Langkai'),
('2171092511929007', 'Masrur Ainun Nadjih', 'Bengkong Sadai Blok H No.03, Bengkong Sadai, Batam', 'MWCNU Bengkong', 'Sekretaris Ranting Sadai', '+6282179326183', '', '-', '-', 'Bengkong', 'Sadai'),
('2171092704759002', 'JAMIL', 'Kampung Tua Bengkong Sadai Blok L No 12 RT 01 RW 10 ', 'PCNU Kota Batam', 'Wakil Sekretaris PC NU BATAM', '+628127041497', '', '10', '1', 'Bengkong', 'Sadai'),
('2171092903699003', 'A. MUSTAFA. SPd.I', 'Bengkong Sadai Blok N1 no 2 RT 03 RW 10 ', 'Khatib ', 'Wakil ', '+6281372246622', '', '10', '3', 'Bengkong', 'Sadai'),
('2171094811849005', 'UMI KHOLILA', 'Bengkong indah 3 blok B no 15', 'Maarif bengkong', 'Anggota', '+6285264328629', '', '-', '-', 'Bengkong', 'Sadai'),
('2171095007759003', 'Nur Alimah, S.Pd.I', 'Jl. Tiban Mentarau KSB, Blok.i, no. 150', 'Pergunu', 'Anggota', '+6281266085830', '', '-', '-', 'Sekupang', 'Patam Lestari'),
('2171095207730002', 'Nur aeni', 'Baloi Harapan 2, Bengkong Indah,RT.04/RW.03 Bengkong Indah', 'Muslimat NU', 'Ketua PAC ', '+6282268751034', '', '3', '4', 'Bengkong', 'Bengkong Indah'),
('2171100205789007', 'KHOIRURROZIKIN', 'perum bida asri 2 rt 03 rw 017 blok f3/17', 'wakil sekretaris mwcnu batam kota', '', '+6282163031899', '', '17', '3', 'Batam Kota', 'Belian'),
('2171100409729006', 'JAMZURI', 'Jl Masjid Baitul Amal Perumahan Taman Marchelia RT 002, RT 009 Blok Masjid', 'PCNU Kota Batam', 'Wakil Katib Syuriyyah', '+6281277517999', '', '9', '2', 'Batam Kota', 'Taman Baloi'),
('2171100409750001', 'Nur haryanto', 'Legenda Malaka Blok J 5 No 21,Rt06RW04,Baloi Permai,Batam Kota,Kota Batam,Kepulauan Riau', 'Wakil Ketua Tanfidiyah ', 'Wakil ketua', '+628117722995', '', '4', '6', 'Batam Kota', 'Baloi Permai'),
('2171100507839003', 'Ahmad Junaidi', 'Komp Hupseng Blok D No 1', 'PCNU Kota Batam', 'Wakil Rais', '+6285235330004', '', '-', '-', 'Batam Kota', 'Teluk Tering'),
('2171100508709009', 'Muhammad tahir', 'Clara lestari no 24 rt 01 RW11', 'Ranting nu tingkat kelurahan', 'wakil', '+6281370098306', '', '11', '1', 'Batam Kota', 'Teluk Tering'),
('2171100909889007', 'DEDE JAMALUDIN', 'Baloi kolam, Rt.001/Rw.016', 'Ranting Sei. Panas', 'Sekretaris', '+6281320219998', '', '16', '1', 'Batam Kota', 'Sungai Panas'),
('2171101001839005', 'CARTIM', 'PERUMAHAN AVIARI GARDEN 2 BLOK B NO 16 RT.003 RW.025', 'Ranting', 'Anggota', '+6282169081988', '', '25', '3', 'Sagulung', 'Sungai Langkai'),
('2171101007819013', 'Ngadiono', 'Bida ayu blok U no 04', 'MWCNU Seibeduk', 'Sekretaris 4', '+6281363114622', '', '-', '-', 'Sei Beduk', 'Mangsang'),
('2171101206840006', 'Witoyo Saifudin', 'Perumahan Gesya Eternal Marina RT 002 RW 008 Blok A22/36', 'PCNU Kota Batam', 'Sekretaris LDNU Kota Batam ', '+6282231843785', '', '8', '2', 'Sekupang', 'Tanjung Riau'),
('2171101306859009', 'Mulyadi', 'MASJID NURUL FALLAH RT.004 RW.18', 'RANTING SUNGAI LANGKAI', 'ROIS Suriyah', '+6281371011749', '', '18', '4', 'Sagulung', 'Sungai Langkai'),
('2171101505749009', 'Abdul Mu\'in', 'Bengkong nusantara 4 blok A no 14', 'MWC NU', 'Wakil ketua', '+6281364538885', '', '-', '-', 'Bengkong', 'Sadai'),
('2171101705700001', 'ACHMAD RIDHO AMIR', 'JL. M. Taher Komplek CITRA BATAM', 'PCNU Kota Batam', 'Rais Syuriah ', '+6281286057050', '', '-', '-', 'Batam Kota', 'Teluk Tering'),
('2171102101789001', 'M. Romli', 'Bida Asri 2 Blok H1 No 7 RT 03 RW 17', 'MWCNU', 'Ketua', '+6281364640308', '', '17', '3', 'Batam Kota', 'Belian'),
('2171102707839006', 'Ali Yusuf', 'Bida Asri 2 Blok E4 No 5', 'MWCNU Batam kota', 'Wakil bendahara', '+6281364766863', '', '-', '-', 'Batam Kota', 'Belian'),
('2171106110739005', 'HERLINA', 'Taman Batuaji Indah II, PJB2 Blok Y14 RT10 RW07 ', 'PC Muslimat NU Kota Batam ', 'Bendahara', '+628136471400', '', '7', '10', 'Sagulung', 'Sagulung Kota'),
('2171106303679001', 'Munawarotun Nasichah', 'Kavling Senjulung jln.nangka no.15 RT.001 RW.009', 'PC Muslimat NU Kota batam', 'Ketua', '+6285668759647', '', '9', '1', 'Nongsa', 'Kabil'),
('2171110107659014', 'Bambang Yulianto', 'Griya Permata A 264', 'Banom Banser', 'Satkorwil', '+6285376590999', '', '-', '-', 'Sagulung', 'Sungai Langkai'),
('2171110305829010', 'Citra Chris Farmiardi', 'Perum Cipta Asri 2 Blok Nira No 11', 'Ranting Tembesi', 'Ketua Tanfidz', '+628153770520', '', '-', '-', 'Sagulung', 'Tembesi'),
('2171110310790001', 'RAMADIAN FIRDAUS', 'GRAHA NUSA BATAM BLOK J1/05,RT02RW21', 'Ranting', 'Anggota', '+628127789188', '', '21', '2', 'Sagulung', 'Sungai Langkai'),
('2171110505749008', 'Heru Supriyanto', 'Griya Batu Aji Asri blok O no. 16 RT. 004 - RW. 016', 'MWC NU kec. Sagulung', 'Wakil Ketua Tanfidziyah', '+6281276207400', '', '16', '4', 'Sagulung', 'Sungai Langkai'),
('2171110508709009', 'Muhammad Tahir', 'Clara lestari no 24 rt01 RW11', 'Wakil ketua ranting kelurahan', 'Wakil', '+6281270098206', '', '11', '1', 'Batam Kota', 'Teluk Tering'),
('2171110704759012', 'Khoirul Bashori', 'Kavling Sagulung Baru blok B2/34 RT 02 RW 08 kelurahan Sei binti ', 'MWC', 'Wakil Sekretaris ', '+6285264812076', '', '8', '2', 'Sagulung', 'Sungai Binti'),
('2171110705750002', 'Ahmad Syarifuddin', 'KAVLING BUKIT MELATI BLOK D NO. 139 RT 002 RW 006', 'Ranting', 'Bendahara', '+6281364217067', '', '6', '2', 'Sagulung', 'Sungai Pelunggut'),
('2171110707789017', 'Hariyanto', 'Kav bukit Kamboja blok w no 57 RT/RW 005/003 ', 'Bendahara', 'Bendahara ', '+6281358180108', '', '3', '5', 'Sagulung', 'Sungai Pelunggut'),
('2171110708540002', 'USMAN HADI', 'KAV .SUMBER MULIA BLOK D6 NO.12', 'RANTING SUNGAI LANGKAI', 'MUTHASAR', '+6281275020666', '', '-', '-', 'Sagulung', 'Sungai Langkai'),
('2171110810829005', 'Debi Asmara', 'Kav Shangrila Blok C No 16 RT 08 RW 06 Kel Sei Lekop Kec Sagulung', 'SMK Ma\'arif NU Kota Batam ', 'Ketua BKK', '+628117774060', '', '6', '8', 'Sagulung', 'Sungai Lekop'),
('2171111001760002', 'MOHAMAD FATKUR ROHMAN', 'SAGULUNG BERSERI BLOK D NO.18 RT.001/RW.006', 'Ranting', 'Ketua', '+6281364693897', '', '6', '1', 'Sagulung', 'Sungai Lekop'),
('2171111210709009', 'TAUHID', 'Sagulung sumber mulia C6/91', 'Wakil syuriah', 'Wakil', '+6287718323879', '', '-', '-', 'Sagulung', 'Sungai Langkai'),
('2171111301809005', 'Abdul Aziz', 'Taman Cipta Asri 2 blok Gaharu 146 Rt.1 Rw.21', 'RMI', 'Anggota', '+6281364195504', '', '21', '1', 'Sagulung', 'Tembesi'),
('2171111404740001', 'Suratno', 'Kavling Flamboyan RT.03 RW 014  blok H no 102 ', 'RANTING SEI PELUNGGUT', 'WAKIL KETUA TANFIDZIAH RANTING SEI PELUNGGUT', '+6281266450272', '', '14', '3', 'Sagulung', 'Sungai Pelunggut'),
('2171111408690003', 'Agus Sahrir', 'Griya Permata Blok C Nomor 98 RT 10 RW 9 Kelurahan Sungai Langkai Kecamatan Sagulung', 'MWCNU', 'Ketua', '+62811774210', '', '9', '10', 'Sagulung', 'Sungai Langkai'),
('2171111409839005', 'M. As\'adul bari', 'Griya batu aji asri blok p no 10 rt 04 rw 16', 'PCNU Kota Batam', 'Ketua LDNU', '+6281335855565', '', '16', '4', 'Sagulung', 'Sungai Langkai'),
('2171111505799013', 'MARNO DADIONO', 'KAVLING FLAMBOYAN BLOK B 34 RT 01 RW 02 ', 'RANTING NU SUNGAI PELUNGGUT', 'SEKRETARIS', '+6281372157249', '', '2', '1', 'Sagulung', 'Sungai Pelunggut'),
('2171111509779005', 'NURUDIN', 'Griya Sagulung Permai Blok E No. 29 RT 005 RW 001', 'PWNU Provinsi Kepulauan Riau', 'Wakil Katib Syuriyah', '+6281364551696', '', '1', '5', 'Sagulung', 'Sagulung Kota'),
('2171111511779006', 'Yana Agni Maulana', 'Kav sei lekop blok D No. 39-40 rt 2 Rw. 11', 'MWCNU', 'Ketua 2 ', '+6281277586413', '', '11', '2', 'Sagulung', 'Sungai Lekop'),
('2171111702650001', 'Pitoyo', 'Kav.sei.lekop blok b no 93 RT 05 /Rw 10', 'RANTING SUNGAI LEKOP', 'Wakil ketua', '+6281372661349', '', '10', '5', 'Sagulung', 'Sungai Lekop'),
('2171111707669004', 'Zainal Arifin', 'Zainal Arifin ', 'Ketua ', 'Ketua tanfid', '+6281270171108', '', '-', '-', 'Sagulung', 'Sungai Langkai'),
('2171111710750001', 'AHMAD GUNARYO', 'Kav.Bukit Seroja Blok B1 No.365 Rt.003 Rw. 016', 'Ranting', 'Khatib', '+6285973051113', '', '16', '3', 'Sagulung', 'Sungai Pelunggut'),
('2171111711749002', 'H. Adamrin, S.Ag,. MH.', 'Buana Bukit Permata blk mutiara no.219 RT. 01 RW. 17', 'PWNU Kepri', 'Wkl. Sekretaris', '+6281364788374', '', '17', '1', 'Sagulung', 'Tembesi'),
('2171111809819005', 'AKHMAD BISRI', 'TAMAN CIPTA ASRI TAHAP 1 RT.02 RW.12 BLOK H NO.25', 'RANTING NU TEMBESI', 'SEKRETARIS', '+6281275293928', '', '12', '2', 'Sagulung', 'Tembesi'),
('2171112006790001', 'Tri Maryono', 'Kav.Bukit Melati blok G2 no 55 RT 04 RW 05', 'Ranting', 'Katib', '+6281364558575', '', '5', '4', 'Sagulung', 'Sungai Pelunggut'),
('2171112106819006', 'Dedy supriyadi', 'kavling pandawa mandiri', 'Ranting', 'Anggota', '+6282169081988', '', '-', '-', 'Sagulung', 'Sungai Binti'),
('2171112112699004', 'ALI MUBAIDAH', 'PHOENIX GARDEN BLOK D 7 SUNGAI LANGKAI', 'IDAROH SYU\'BIYAH JATMAN BATAM', 'MUDIR / KETUA', '+628217329993508217329993', '', '-', '-', 'Sagulung', 'Sungai Langkai'),
('2171112304709004', 'Syaichu Abdul Malik', 'Perum Sentosa Perdana Blok N 27 003/020', 'PCNU Kota Batam', 'Anggota LP Ma\'arif', '+6281336455560', '', '20', '3', 'Sagulung', 'Tembesi'),
('2171112309029001', 'Amanda Riski', 'Perumahan Marina Green Blok L N0.17', 'SMK Ma\'arif NU Kota Batam', 'Staff TU', '+6289512483818', '', '-', '-', 'Batu Aji', 'Tanjung Uncang'),
('2171112405680002', 'Abdul Rahim', 'KAV.SAGULUNG BARU NLOK B2 NO.42 RT.002 RW.008', 'RANTING SUNGAI BINTI', 'ANGGOTA', '+6281371066942', '', '8', '2', 'Sagulung', 'Sungai Binti'),
('2171112411799001', 'Lasudin Abdul hakim', 'Kavling kamboja blok N no 112', 'Ranting', 'Wakil Katib', '+6281536815914', '', '-', '-', 'Sagulung', 'Sungai Pelunggut'),
('2171112503810001', 'Ziauddin Allaqva', 'Kavling saguba blok k no 62-63 rt02 rw04', 'MWCNU SAGULUNG', 'Bendahara', '+6281225486600', '', '4', '2', 'Sagulung', 'Sungai Binti'),
('2171112504660002', 'Ali Suyuti', 'Kav Kamboja RT 005 RW 013 blok L no4', 'Ranti NU sungai pelunggut ', 'Rois Syuriah ', '+6281277502900', '', '13', '5', 'Sagulung', 'Sungai Pelunggut'),
('2171112904859008', 'DWI PRAMUDI', 'Perum cipta asri 2 Blok pinus no 28 Kel tembesi,', 'Muhtasyar, ranting ', 'Ketua ', '+6285264401320', '', '-', '-', 'Sagulung', 'Tembesi'),
('2171112905799003', 'Firdaus', 'Perum graha nusa batam blok N no.9', 'Lakpesdam Batam', 'Anggota', '+6285761354979', '', '-', '-', 'Sagulung', 'Sungai Langkai'),
('2171113004829005', 'Hamsi', 'Kav Bukit Kamboja HH no 75', 'PCNU Kota Batam', 'PCNU Kota Batam', '+6281270457407', '', '-', '-', 'Sagulung', 'Sungai Pelunggut'),
('2171114503831001', 'Siti ulfatun liulin nuha', 'Tembesi lestari rt 001 rw 013', 'Banom', 'Anggota', '+6285331429440', '', '13', '1', 'Sagulung', 'Tembesi'),
('2171114710819012', 'Ida Hariani', 'Perum Graha Nusa Batam, Blok: Q / No.: 12A', 'RANTING SUNGAI LANGKAI', 'Anggota muslimat NU', '+6282390327282', '', '-', '-', 'Sagulung', 'Sungai Langkai'),
('2171114910900002', 'Mardalena', 'Perum buana simpang barelang.  bukit permata blok Jade no 83 RT 7 Rw17 ', 'Banom', 'Sekjen', '+6282268130297', '', '17', '7', 'Sagulung', 'Tembesi'),
('2171115007720005', 'Hj. Aidah', 'Buana bukit permata blok mutiara  no 219', 'Ranting muslimat NU tembesi', 'Wakil Ketua', '+6281277211775', '', '-', '-', 'Sagulung', 'Tembesi'),
('2171116404059003', 'AZIZAH', 'Kavling Sagulung Baru RT 03 RW 03 Blok E Nomor 23', 'Banom', 'Ketua PC IPPNU KOTA BATAM', '+6281295844622', '', '3', '3', 'Sagulung', 'Sungai Binti'),
('2171116702759001', 'Nur Yaqin', 'Eden Park blok M No.4', 'Anggota', 'Anggota', '+6282134914423', '', '-', '-', 'Batam Kota', 'Taman Baloi'),
('2171120101750002', 'MUSTHOFAL ACHYAR AM', 'Perum. Gmp. I Blok K/03', 'Pcnu', 'Wakil katib syuriyah', '+6281270752005', '', '-', '-', 'Batu Ampar', 'Tanjung Sengkuang'),
('2171120202699004', 'Ahmad M Muttaqin.', 'Perum. Merlion Square Blok E no 21 RT/RW 01/20', 'Ketua Tanfidziyah MWCNU Batu Aji', 'Ketua', '+6281270260149', '', '20', '1', 'Batu Aji', 'Tanjung Uncang'),
('2171120301700001', 'Nur Rochim', 'Perum taman lestari blok b8 no. 5', 'Ketua Ranting', 'Ketua', '+6285233339093', '', '-', '-', 'Batu Aji', 'Kibing'),
('2171120609769007', 'Akhmad Solikan', 'PERUM GRIYAH BATU AJI ASRI THP II BLOK F1 NO 2 RT.008 RW 016', 'Ranting', 'AWAN', '+6285365782928', '', '16', '8', 'Sagulung', 'Sungai Langkai'),
('2171121005719005', 'Muhammad Sulhan', 'Teman cipta asri thp2 blok nira 91Rt002Rw021Rw021 ', 'RANTING NU', 'ROIS SURIAH ', '+628117011190', '', '21', '2', 'Sagulung', 'Tembesi'),
('2171121006680002', 'SUJAYA', 'PERUM AVIARI GARDEN I BLOK N1 N0.12 RT.002/RW.025', 'RANTING SUNGAI LANGKAI', 'Katib', '+6281365193735', '', '25', '2', 'Sagulung', 'Sungai Langkai'),
('2171121507670001', 'Suroto', 'Perum mk indah II blok N no 10', 'MWCNU', 'Anggota', '+6281276901584', '', '-', '-', 'Batu Aji', 'Buliang'),
('2171122508669005', 'ROZIQIN', 'MKI Indah blok AG 09 RT/RW 002/004 Kel.Buliang Kec.Batu Aji', 'Tanfidziah, suryah dan mustasyar', 'Mustasyar', '+628566502848', '', '4', '2', 'Batu Aji', 'Buliang'),
('2171122708689002', 'Imam Mascub', 'MKP II Jl. Pulau Seruan No. 01', 'Syuriah', 'Syuriah', '+6285264443935', '', '-', '-', 'Batu Aji', 'Buliang'),
('2171124805779003', 'Murni Umriyati', 'Perum buana bukit permata blok delima 12A, rt 04 rw 17', 'Banom', 'Sekjend', '+6281365378717', '', '17', '4', 'Sagulung', 'Tembesi'),
('2171125010720001', 'Endah suryaningsih', 'Perum mk indah II blok N no 10', 'MWCNU', 'Anggota', '+6285831668045', '', '-', '-', 'Batu Aji', 'Buliang'),
('2172042904760004', 'Bambang Maryono', 'Perum kenangan jaya 3 Rt/rw 005/009', 'PWNU Kepri', 'Katib Syuriah ', '+6281364095899', '', '9', '5', 'Tanjung Pinang Timur', 'Batu IX'),
('2177114812719002', 'Sugiyarti', 'Sagulung sumber mulia d6 no 5 ', 'Banom', 'Ketua Fatayat NU ', '+6281366003843', '', '-', '-', 'Sagulung', 'Sungai Langkai'),
('3216111402000001', 'Fikri Fahar T', 'Ruko Mega Legenda 2 Blok D2 No.10', 'PC IPNU Kota Batam', 'Bendahara', '+6283877305434', '', '-', '-', 'Batam Kota', 'Baloi Permai'),
('3275036009890020', 'Mimi Jamilah', 'perum marina green Blok K/36 Rt.03/18', 'MWCNU', 'Anggota muslimat NU', '+6285761709778', '', '18', '3', 'Batu Aji', 'Tanjung Uncang'),
('3278082703990006', 'Rizky Saeful Millah', 'Jl. Nuri 6 no 21-23', 'PC IPNU Kota Batam', 'Ketua PC IPNU Kota Batam', '+6281261380050', '', '-', '-', 'Batam Kota', 'Belian'),
('3301220710040001', 'Hanafi Nesta Libra Alestama', 'perum tiban bukit asri blok s 01 rt 002 rw 010', 'PC IPNU', 'wakil ketua 2', '+62895619508066', '', '10', '2', 'Sekupang', 'Tiban Baru'),
('3303187112750002', 'Siti solikhah', 'Ibu Rumah Tangga', 'Banom', 'Wakil ketua', '+6285668527055', '', '-', '-', 'Sekupang', 'Sungai Harapan'),
('3307040605840010', 'Tartib,S.Pd', 'MKP II Jl.Pulau Benua no.127', 'Sekretaris ', 'Sekretaris ', '+6281927152848', '', '-', '-', 'Batu Aji', 'Buliang'),
('3318201505850007', 'Siswanto Bagaspati', 'Kampung Bukit Aladin Rt2Rw3 Sambau', 'Ranting', 'Anggota', '+6285959875156', '', '3', '2', 'Nongsa', 'Sambau'),
('3318202303830002', 'MIFTAKHUL HUDA', 'Perum muka kuning indah II blok L no.3', 'PCNU  kota Batam (LTM NU)', 'Ketua', '+6281326766215', '', '-', '-', 'Batu Aji', 'Buliang'),
('3320042508840003', 'Mujtahid', 'Perum Piayu Residence B 42', 'PCNU Kota Batam', 'Anggota', '+6285292923222', '', '-', '-', 'Sei Beduk', 'Tanjung Piayu'),
('3320161502850002', 'MUH. MUKHLIS', 'Sagulung Berseri Blok C No. 33 RT. 001/006', 'MWC NU SAGULUNG', 'Sekertaris', '+6281378876321', '', '6', '1', 'Sagulung', 'Sungai Lekop'),
('3321012105950001', 'Muhammad Fa\'is Nasrulloh', 'Pancur Tower 2 RT 003/RW 011', 'Ranting', '-', '+6288238766032', '', '11', '3', 'Sei Beduk', 'Duriangkang'),
('3321032606870001', 'Karsidi', 'Tembesi Lestari rt 03 rw 13', 'LDNU ( IDNU )', 'Pengaderan pemuda', '+6285799836842', '', '13', '3', 'Sagulung', 'Tembesi'),
('3321140203910001', 'MOCH RIZA AZIZI AMINUDDIN', 'Kampung Pom Bensin RT/RW 002/007 ', 'MWCNU Batu Aji', 'Wakil Bendahara', '+6282391006687', '', '7', '2', 'Batu Aji', 'Bukit Tempayan'),
('3324121311830001', 'Malik Ghozali', 'Kampung Tua Cunting Tanjung Uncang Batu Aji', 'LDNU Kota Batam', 'Seksi Dakwah', '+6282306409503', '', '-', '-', 'Batu Aji', 'Tanjung Uncang'),
('3404086303770003', 'Ambar Astuti', 'Perumahan Gmp blok n no.16 rt01 rw02 ', 'MWCNU', 'Istri ketua tanfizdiah mwcnu sei beduk', '+6285648987858', '', '2', '1', 'Sei Beduk', 'Duriangkang'),
('3510021605850002', 'NUR ABDILLAH HASAN', 'Wisma Imam Masjid Mukhtarul Arifin - Perum. Taman Cipta Asri RW.12 - Tembesi - Sagulung - Kota Batam - KEPRI', 'NU Ranting Tembesi - Sagulung - Kota Batam', 'Katib Syuriah Ranting NU Kelurahan Tembesi', '+6282330432623', '', '12', '-', 'Bangorejo', 'Sambirejo'),
('3510091005850011', 'Ahmad Mujib Zain', 'Perum Bida center 2, blok C no 9. Rt 02 RW 17', 'PCNU Kota Batam', 'Wakil Katib Syuriah', '+6285336664004', '', '17', '2', 'Batam Kota', 'Belian'),
('3517080303970003', 'Mokhammad Syaifuddin Zuhri', 'Perum kotamas no c12a no. 19', 'SMK Ma\'arif NU', 'Bendahara', '+6285159993843', '', '-', '-', 'Sekupang', 'Tanjung Riau'),
('3518052212870002', 'BUDIANTO', 'Griya batu aji asri thp 5 blok D2 no 15 rt 01 rw 17', 'Belum ada', 'Belum ada', '+6285852191217', '', '17', '1', 'Sagulung', 'Sungai Langkai'),
('3523041510680003', 'Masrukan', 'Perum Rhabayu Asri Blok RA4 no 9', 'MWC Sei Beduk', 'Suriyah Ranting Piayu', '+6281536720026', '', '-', '-', 'Sei Beduk', 'Tanjung Piayu'),
('3523051707840003', 'AHMAD ROHMATULLAH', 'Perum Odessa Blok C:15 No:9', 'Sekertaris', 'Sekertaris ranting', '+6281350058384', '', '-', '-', 'Batam Kota', 'Belian'),
('3523182005730002', 'A.JUNAEDI', 'PERUM PONDOK PRATIWI 3 BLOK B4 NO13 RT-006 RW-016', 'MWCNU KECAMATAN SEKUPANG', 'WAKIL TANFIDIYAH', '+6287779987768', '', '16', '6', 'Sekupang', 'Sungai Harapan'),
('3526131410810001', 'ZAINORI', 'Tembesi Tower Rt 02 Rw 16', 'Katib', 'Wakil', '+6282333999532', '', '16', '2', 'Sagulung', 'Tembesi'),
('3578061609770010', 'Dwi suryo putro', 'Graha nusa batam. Blok N1. No 14. RT 04. Rw 21.m', 'PCNU Kota Batam', 'Bendahara', '+6281277769990', '', '21', '4', 'Sagulung', 'Sungai Langkai'),
('3603010112770005', 'Musmulyadi', 'Taman sentosa imdah Blok B 17  RT 05 RW 01 Kel. Sungai Panas, Kec. Batam Kota', 'Bengkong', 'Anggota', '+6281315280832', '', '1', '5', 'Batam Kota', 'Sungai Panas'),
('8156762664200043', 'Dukhroini Ali', 'Jl. Angrek Dalam Baloi Persero RT02 RW01 No. 51 C', 'PCNU Kota Batam', 'Wakil Sekretatis Tanfidiyah', '+6282389783170', '', '1', '2', 'Lubuk Baja', 'Baloi Indah');

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
(222, 'App\\Models\\User', 1, 'token', '674d1e56838e93c364002aebb5423376f8829de5c8778d33bc8fb436aaa36f53', '[\"*\"]', '2023-12-21 19:07:12', NULL, '2023-12-21 19:01:54', '2023-12-21 19:07:12'),
(246, 'App\\Models\\User', 2, 'token', '973c972e2040ad6a034dda97527cf4adbed64028ec4de43ea7d7190f20415148', '[\"*\"]', NULL, NULL, '2024-02-11 07:41:42', '2024-02-11 07:41:42'),
(247, 'App\\Models\\User', 2, 'token', '9c9a7c66c74868b8442fa4379b19c907ea4ca0164e8bf60265a9839d9a340ece', '[\"*\"]', '2024-02-11 07:45:28', NULL, '2024-02-11 07:43:55', '2024-02-11 07:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `ref_kecamatan`
--

CREATE TABLE `ref_kecamatan` (
  `id_kecamatan` int(11) NOT NULL,
  `nama_kecamatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ref_kecamatan`
--

INSERT INTO `ref_kecamatan` (`id_kecamatan`, `nama_kecamatan`) VALUES
(1, 'Belakang Padang'),
(2, 'Bulang'),
(3, 'Sungai Beduk'),
(4, 'Sagulung'),
(5, 'Nongsa'),
(6, 'Batam Kota'),
(7, 'Sekupang'),
(8, 'Batu Aji'),
(9, 'Lubuk Baja'),
(10, 'Batu Ampar'),
(11, 'Bengkong'),
(12, 'Galang');

-- --------------------------------------------------------

--
-- Table structure for table `ref_kelurahan`
--

CREATE TABLE `ref_kelurahan` (
  `id_kelurahan` int(11) NOT NULL,
  `id_kecamatan` int(11) DEFAULT NULL,
  `nama_kelurahan` varchar(255) DEFAULT NULL,
  `kode_pos` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ref_kelurahan`
--

INSERT INTO `ref_kelurahan` (`id_kelurahan`, `id_kecamatan`, `nama_kelurahan`, `kode_pos`) VALUES
(1, 1, 'Pulau Terong', '29416'),
(2, 1, 'Sekanak Raya', '29416'),
(3, 1, 'Tanjung Sari', '29416'),
(4, 1, 'Pecong', '29414'),
(5, 1, 'Pemping', '29412'),
(6, 1, 'Kasu', '29413'),
(7, 2, 'Pulau Setokok', '29476'),
(8, 2, 'Batu Legong', '29474'),
(9, 2, 'Temoyong', '29475'),
(10, 2, 'Pulau Buluh', '29472'),
(11, 2, 'Pantai Gelam', '29473'),
(12, 2, 'Bulang Lintang', '29471'),
(13, 12, 'Pulau Abang', '29487'),
(14, 12, 'Sijantung', '29485'),
(15, 12, 'Karas (Pulau Karas)', '29486'),
(16, 12, 'Subang Mas', '29483'),
(17, 12, 'Galang Baru (Pulau)', '29484'),
(18, 12, 'Rempang Cate', '29482'),
(19, 12, 'Air Raja', '29483'),
(20, 12, 'Sembulang (Pulau Rempang)', '29481'),
(21, 3, 'Mangsang', '29437'),
(22, 3, 'Tanjung Piayu', '29437'),
(23, 3, 'Duriangkang', '29437'),
(24, 3, 'Muka Kuning', '29433'),
(25, 4, 'Tembesi', '29439'),
(26, 4, 'Sungai Langkai', '29439'),
(27, 4, 'Sungai Lekop', '29439'),
(28, 4, 'Sungai Pelunggut', '29439'),
(29, 4, 'Sagulung Kota', '29439'),
(30, 4, 'Sungai Binti', '29439'),
(31, 5, 'Ngenang', '29468'),
(32, 5, 'Batu Besar', '29466'),
(33, 5, 'Kabil', '29467'),
(34, 5, 'Sambau', '29465'),
(35, 6, 'Belian', '29464'),
(36, 6, 'Teluk Tering', '29461'),
(37, 6, 'Sungai Panas', '29433'),
(38, 6, 'Sukajadi', '29432'),
(39, 6, 'Taman Baloi', '29432'),
(40, 6, 'Baloi Permai', '29431'),
(41, 7, 'Sungai Harapan', '29428'),
(42, 7, 'Tanjung Pinggir', '29428'),
(43, 7, 'Tiban Indah', '29426'),
(44, 7, 'Patam Lestari', '29427'),
(45, 7, 'Tiban Lama', '29425'),
(46, 7, 'Tiban Baru', '29426'),
(47, 7, 'Tanjung Riau', '29425'),
(48, 8, 'Buliang', '29438'),
(49, 8, 'Bukit Tempayan', '29438'),
(50, 8, 'Kibing', '29422'),
(51, 8, 'Tanjung Uncang', '29424'),
(52, 9, 'Tanjung uma', '29445'),
(53, 9, 'Kampung Pelita', '29443'),
(54, 9, 'Lubuk Baja Kota', '29444'),
(55, 9, 'Batu Selicin', '29441'),
(56, 9, 'Baloi Indah', '29432'),
(57, 10, 'Tanjung Sengkuang', '29453'),
(58, 10, 'Kampung Seraya', '29454'),
(59, 10, 'Sungai Jodoh', '29453'),
(60, 10, 'Batu Merah', '29452'),
(61, 11, 'Bengkong Indah', '29458'),
(62, 11, 'Bengkong Laut', '29458'),
(63, 11, 'Tanjung Buntung', '29432'),
(64, 11, 'Sadai', '29432');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `akses` varchar(20) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `akses`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'deky', 'deky@gmail.com', 'admin', NULL, '$2y$10$IVgsFKNlUADRPuBuV2KGsOYtf/6YPta7C0HEbd2xJC6RGZwSnrwXu', NULL, NULL, NULL),
(7, 'hosting', 'hosting@email.com', 'user', NULL, '$2y$10$EUSasWdVL8PcQLUF1RM9red30md0unk8MOhrNxTshJxcktL3Lntae', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akses`
--
ALTER TABLE `akses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `landing_page`
--
ALTER TABLE `landing_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lembaga`
--
ALTER TABLE `lembaga`
  ADD PRIMARY KEY (`id_lembaga`);

--
-- Indexes for table `list_akses`
--
ALTER TABLE `list_akses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengurus`
--
ALTER TABLE `pengurus`
  ADD PRIMARY KEY (`NIK`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `ref_kecamatan`
--
ALTER TABLE `ref_kecamatan`
  ADD PRIMARY KEY (`id_kecamatan`);

--
-- Indexes for table `ref_kelurahan`
--
ALTER TABLE `ref_kelurahan`
  ADD PRIMARY KEY (`id_kelurahan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akses`
--
ALTER TABLE `akses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `landing_page`
--
ALTER TABLE `landing_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `lembaga`
--
ALTER TABLE `lembaga`
  MODIFY `id_lembaga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `list_akses`
--
ALTER TABLE `list_akses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
