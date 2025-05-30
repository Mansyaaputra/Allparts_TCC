-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Bulan Mei 2025 pada 10.25
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `allparts`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `quantity`, `total_price`, `created_at`, `status`) VALUES
(6, 13, 4, 1, 50000.00, '2025-05-26 19:54:23', 'checked_out'),
(12, 19, 5, 1, 99999999.99, '2025-05-30 08:24:11', 'checked_out');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `stock`, `image_url`, `description`, `category`) VALUES
(4, 'Baju ', 500.00, 1, '', 'ini baju', 'aksesoris'),
(5, 'love', 99999999.99, 3, '/uploads/1748255689263.jpeg', 'mantep', 'health'),
(11, 'Bagas', 500.00, 1, '/uploads/1748288992160.jpeg', 'LC, lelaki penghibur', 'beauty'),
(12, 'Oli', 45000.00, 15, '/uploads/1748582817104.jpg', 'Oli samping', 'sparepart');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('customer','admin') DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`) VALUES
(10, 'eru25', '$2b$10$r/u06bR/5Ni7IdnFDF33NeLUxKkyFq4dBnZFCI.MsPPxDYjQ6lc6C', 'bagas123@gmail.com', 'admin'),
(12, 'udin', '$2b$10$8.kOrhcyz.30fYPuUpuLT.LhPeZmVc8uARV/fdxLWuwgNLY.aZZ0e', 'udin@gmail.com', 'customer'),
(13, 'windy', '$2b$10$eQcB9VJTWo0lY8gGsECmoeu7Y0alzy9c5meR0l1lSEXfolw.XSdIq', 'windynapitupulu3108@gmail.com', 'customer'),
(15, 'admin', '$2b$10$jIs4OdNgtb/wDsz.n59XBuik/1sB5yJapgsJSqxbl6yoWNrPMmb0K', 'admin@gmail.com', 'admin'),
(16, 'udin1', '$2b$10$UWBizcoY/x0gssyuXL//Ou4WaebJ3JOJanZlKnzaJ9aGSM7J6/5AO', 'udin@gmail.com', 'customer'),
(17, 'duta', '$2b$10$2sLU6ObMVDgeCyONl4/ll.2MsqVs/6iyfPDd3o5WsRf.pZJDJEAkG', 'duta@gmail.com', 'customer'),
(18, 'epul', '$2b$10$9KL9VhNcreoZdpQyuwVtIeeBvRX6htYtxmR7RJ9UxTxPo6bFu0EpW', 'epul@gmail.com', 'customer'),
(19, 'auliy', '$2b$10$azZk6cdHcESazeGEGjHtHuoYuZcVme25aiGdFRtY0xmB9qVc2AvDO', 'auliy@gmail.com', 'customer'),
(20, 'mansya', '$2b$10$LMOsHQ4bPQTCrrtwZrO9duX4jSZXqqiFF5ygQuENORKYad9imkDLu', 'mansya@gmail.com', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
