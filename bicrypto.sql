-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 22, 2022 at 07:05 AM
-- Server version: 10.5.13-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bicrypto`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_status` tinyint(4) NOT NULL DEFAULT 0,
  `click_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_etc_categories`
--

CREATE TABLE `blog_etc_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL COMMENT 'user id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_etc_categories`
--

INSERT INTO `blog_etc_categories` (`id`, `category_name`, `slug`, `category_description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Crypto', 'crypto', 'Crypto Category', NULL, '2021-12-24 16:22:01', '2021-12-24 16:22:01');

-- --------------------------------------------------------

--
-- Table structure for table `blog_etc_comments`
--

CREATE TABLE `blog_etc_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `blog_etc_post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'if user was logged in',
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'if enabled in the config file',
  `author_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'if not logged in',
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the comment body',
  `approved` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_etc_posts`
--

CREATE TABLE `blog_etc_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'New blog post',
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `meta_desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_body` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_view_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'If not null, this should refer to a blade file in /views/',
  `posted_at` datetime DEFAULT NULL COMMENT 'Public posted at time, if this is in future then it wont appear yet',
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `image_large` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_etc_post_categories`
--

CREATE TABLE `blog_etc_post_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `blog_etc_post_id` int(10) UNSIGNED NOT NULL,
  `blog_etc_category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_etc_uploaded_photos`
--

CREATE TABLE `blog_etc_uploaded_photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `uploaded_images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unknown',
  `uploader_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crypto_currencies`
--

CREATE TABLE `crypto_currencies` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Disable : 0, Enable : 1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crypto_currencies`
--

INSERT INTO `crypto_currencies` (`id`, `name`, `image`, `symbol`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bitcoin', 'BTC.png', 'BTC', 1, '2021-12-18 20:22:34', '2021-12-18 20:22:34'),
(2, 'Ethereum', 'ETH.png', 'ETH', 1, '2021-12-18 20:22:34', '2022-01-14 17:15:48'),
(3, 'Binance Coin', 'BNB.png', 'BNB', 1, '2021-12-18 20:23:56', '2021-12-18 20:23:56'),
(4, 'Neo', 'NEO.png', 'NEO', 1, '2021-12-18 20:24:41', '2021-12-18 20:24:41'),
(5, 'Litecoin', 'LTC.png', 'LTC', 1, '2021-12-18 20:24:59', '2021-12-18 20:24:59'),
(6, 'Qtum', 'QTUM.png', 'QTUM', 1, '2021-12-18 20:25:18', '2021-12-18 20:25:18'),
(7, 'Cardano', 'ADA.png', 'ADA', 1, '2021-12-18 20:25:36', '2021-12-18 20:25:36'),
(8, 'XRP', 'XRP.png', 'XRP', 1, '2021-12-18 20:25:54', '2021-12-18 20:25:54'),
(9, 'EOS', 'EOS.png', 'EOS', 1, '2021-12-18 20:26:12', '2021-12-18 20:26:12'),
(10, 'TrueUSD', 'TUSD.png', 'TUSD', 1, '2021-12-18 20:26:30', '2021-12-18 20:26:30'),
(11, 'IOTA', 'IOTA.png', 'IOTA', 1, '2021-12-18 20:27:02', '2021-12-18 20:27:02'),
(12, 'Stellar', 'XLM.png', 'XLM', 1, '2021-12-18 20:27:21', '2021-12-18 20:27:21'),
(13, 'Ontology', 'ONT.png', 'ONT', 1, '2021-12-18 20:27:39', '2021-12-18 20:27:39'),
(14, 'TRON', 'TRX.png', 'TRX', 1, '2021-12-18 20:27:57', '2022-01-14 17:05:03'),
(15, 'Ethereum Classic', 'ETC.png', 'ETC', 1, '2021-12-18 20:28:15', '2021-12-18 20:28:15'),
(16, 'ICON', 'ICX.png', 'ICX', 1, '2021-12-18 20:28:48', '2021-12-18 20:28:48'),
(17, 'NULS', 'NULS.png', 'NULS', 1, '2021-12-18 20:30:06', '2021-12-18 20:30:06'),
(18, 'VeChain', 'VET.png', 'VET', 1, '2021-12-18 20:30:35', '2021-12-18 20:30:35'),
(19, 'Pax Dollar', 'PAX.png', 'PAX', 1, '2021-12-18 20:31:03', '2021-12-18 20:31:03'),
(20, 'USD Coin', 'USDC.png', 'USDC', 1, '2021-12-18 20:31:43', '2021-12-18 20:31:43'),
(21, 'Waves', 'WAVES.png', 'WAVES', 1, '2021-12-18 20:32:12', '2021-12-18 20:32:12'),
(22, 'BitTorrent', 'BTT.png', 'BTT', 1, '2021-12-18 20:32:26', '2021-12-18 20:32:26'),
(23, 'Ontology Gas', 'ONG.png', 'ONG', 1, '2021-12-18 20:33:45', '2021-12-18 20:33:45'),
(24, 'Holo', 'HOT.png', 'HOT', 1, '2021-12-18 20:33:59', '2021-12-18 20:33:59'),
(25, 'Zilliqa', 'ZIL.png', 'ZIL', 1, '2021-12-18 20:34:24', '2021-12-18 20:34:24'),
(26, '0x', 'ZRX.png', 'ZRX', 1, '2021-12-18 20:34:39', '2021-12-18 20:34:39'),
(27, 'Fetch.ai', 'FET.png', 'FET', 1, '2021-12-18 20:35:09', '2021-12-18 20:35:09'),
(28, 'Basic Attention Token', 'BAT.png', 'BAT', 1, '2021-12-18 20:35:26', '2021-12-18 20:35:26'),
(29, 'Monero', 'XMR.png', 'XMR', 1, '2021-12-18 20:35:51', '2021-12-18 20:35:51'),
(30, 'Zcash', 'ZEC.png', 'ZEC', 1, '2021-12-18 20:36:51', '2021-12-18 20:36:51'),
(31, 'IOST', 'IOST.png', 'IOST', 1, '2021-12-18 20:37:34', '2021-12-18 20:37:34'),
(32, 'Celer Network', 'CELR.png', 'CELR', 1, '2021-12-18 20:38:03', '2021-12-18 20:38:03'),
(33, 'Dash', 'DASH.png', 'DASH', 1, '2021-12-18 20:38:23', '2021-12-18 20:38:23'),
(34, 'Nano', 'NANO.png', 'NANO', 1, '2021-12-18 20:38:40', '2021-12-18 20:38:40'),
(35, 'OMG Network', 'OMG.png', 'OMG', 1, '2021-12-18 20:38:57', '2021-12-18 20:38:57'),
(36, 'THETA', 'THETA.png', 'THETA', 1, '2021-12-18 20:39:15', '2021-12-18 20:39:15'),
(37, 'Enjin Coin', 'ENJ.png', 'ENJ', 1, '2021-12-18 20:39:32', '2021-12-18 20:39:32'),
(38, 'Mithril', 'MITH.png', 'MITH', 1, '2021-12-18 20:39:49', '2021-12-18 20:39:49'),
(39, 'Polygon', 'MATIC.png', 'MATIC', 1, '2021-12-18 20:40:06', '2021-12-18 20:40:06'),
(40, 'Theta Fuel', 'TFUEL.png', 'TFUEL', 1, '2021-12-18 20:40:53', '2021-12-18 20:40:53'),
(41, 'Harmony', 'ONE.png', 'ONE', 1, '2021-12-18 21:03:20', '2021-12-18 21:03:20'),
(42, 'Fantom', 'FTM.png', 'FTM', 1, '2021-12-18 21:03:53', '2021-12-18 21:03:53'),
(43, 'Algorand', 'ALGO.png', 'ALGO', 1, '2021-12-18 21:04:14', '2021-12-18 21:04:14'),
(44, 'Gifto', 'GTO.png', 'GTO', 1, '2021-12-18 21:05:13', '2021-12-18 21:05:13'),
(45, 'Dogecoin', 'DOGE.png', 'DOGE', 1, '2021-12-18 21:06:21', '2021-12-18 21:06:21'),
(46, 'Dusk Network', 'DUSK.png', 'DUSK', 1, '2021-12-18 21:06:48', '2021-12-18 21:06:48'),
(47, 'Ankr', 'ANKR.png', 'ANKR', 1, '2021-12-18 21:07:23', '2021-12-18 21:07:23'),
(48, 'WINkLink', 'WIN.png', 'WIN', 1, '2021-12-18 21:07:51', '2021-12-18 21:07:51'),
(49, 'Contentos', 'COS.png', 'COS', 1, '2021-12-18 21:08:14', '2021-12-18 21:08:14'),
(50, 'Cocos-BCX', 'COCOS.png', 'COCOS', 1, '2021-12-18 21:09:31', '2021-12-18 21:09:31'),
(51, 'Metal', 'MTL.png', 'MTL', 1, '2021-12-18 21:09:55', '2021-12-18 21:09:55'),
(52, 'TomoChain', 'TOMO.png', 'TOMO', 1, '2021-12-18 21:10:15', '2021-12-18 21:10:15'),
(53, 'PERL.eco', 'PERL.png', 'PERL', 1, '2021-12-18 21:10:36', '2021-12-18 21:10:36'),
(54, 'Dent', 'DENT.png', 'DENT', 1, '2021-12-18 21:10:56', '2021-12-18 21:10:56'),
(55, 'Hifi Finance', 'MFT.png', 'MFT', 1, '2021-12-18 21:11:16', '2021-12-18 21:11:16'),
(56, 'Selfkey', 'KEY.png', 'KEY', 1, '2021-12-18 21:11:37', '2021-12-18 21:11:37'),
(57, 'Storm Token', 'STORM.png', 'STORM', 1, '2021-12-18 21:11:57', '2021-12-18 21:11:57'),
(58, 'Dock', 'DOCK.png', 'DOCK', 1, '2021-12-18 21:12:18', '2021-12-18 21:12:18'),
(59, 'Wanchain', 'WAN.png', 'WAN', 1, '2021-12-18 21:12:38', '2021-12-18 21:12:38'),
(60, 'FUNToken', 'FUN.png', 'FUN', 1, '2021-12-18 21:12:58', '2021-12-18 21:12:58'),
(61, 'Civic', 'CVC.png', 'CVC', 1, '2021-12-18 21:13:19', '2021-12-18 21:13:19'),
(62, 'Chiliz', 'CHZ.png', 'CHZ', 1, '2021-12-18 21:13:39', '2021-12-18 21:13:39'),
(63, 'Band Protocol', 'BAND.png', 'BAND', 1, '2021-12-18 21:13:59', '2021-12-18 21:13:59'),
(64, 'Beam', 'BEAM.png', 'BEAM', 1, '2021-12-18 21:15:03', '2021-12-18 21:15:03'),
(65, 'Tezos', 'XTZ.png', 'XTZ', 1, '2021-12-18 21:15:25', '2021-12-18 21:15:25'),
(66, 'Ren', 'REN.png', 'REN', 1, '2021-12-18 21:15:45', '2021-12-18 21:15:45'),
(67, 'Ravencoin', 'RVN.png', 'RVN', 1, '2021-12-18 21:16:05', '2021-12-18 21:16:05'),
(68, 'Hedera', 'HBAR.png', 'HBAR', 1, '2021-12-18 21:16:46', '2021-12-18 21:16:46'),
(69, 'NKN', 'NKN.png', 'NKN', 1, '2021-12-18 21:17:07', '2021-12-18 21:17:07'),
(70, 'Stacks', 'STX.png', 'STX', 1, '2021-12-18 21:17:27', '2021-12-18 21:17:27'),
(71, 'Kava', 'KAVA.png', 'KAVA', 1, '2021-12-18 21:18:01', '2021-12-18 21:18:01'),
(72, 'ARPA Chain', 'ARPA.png', 'ARPA', 1, '2021-12-18 21:18:22', '2021-12-18 21:18:22'),
(73, 'IoTeX', 'IOTX.png', 'IOTX', 1, '2021-12-18 21:18:42', '2021-12-18 21:18:42'),
(74, 'iExec RLC', 'RLC.png', 'RLC', 1, '2021-12-18 21:19:03', '2021-12-18 21:19:03'),
(75, 'Cortex', 'CTXC.png', 'CTXC', 1, '2021-12-18 21:19:43', '2021-12-18 21:19:43'),
(76, 'Bitcoin Cash', 'BCH.png', 'BCH', 1, '2021-12-18 21:20:04', '2021-12-18 21:20:04'),
(77, 'TROY', 'TROY', 'TROY', 1, '2021-12-18 21:20:24', '2021-12-18 21:20:24'),
(78, 'VITE', 'VITE.png', 'VITE', 1, '2021-12-18 21:20:45', '2021-12-18 21:20:45'),
(79, 'FTX Token', 'FTT.png', 'FTT', 1, '2021-12-18 21:21:05', '2021-12-18 21:21:05'),
(80, 'STASIS EURO', 'EUR.png', 'EUR', 1, '2021-12-18 21:22:27', '2021-12-18 21:22:27'),
(81, 'Origin Protocol', 'OGN.png', 'OGN', 1, '2021-12-18 21:22:47', '2021-12-18 21:22:47'),
(82, 'Drep [new]', 'DREP.png', 'DREP', 1, '2021-12-18 21:23:07', '2021-12-18 21:23:07'),
(83, 'TokenClub', 'TCT.png', 'TCT', 1, '2021-12-19 10:32:42', '2021-12-19 10:32:42'),
(84, 'WazirX', 'WRX.png', 'WRX', 1, '2021-12-19 10:33:02', '2021-12-19 10:33:02'),
(85, 'BitShares', 'BTS.png', 'BTS', 1, '2021-12-19 10:33:22', '2021-12-19 10:33:22'),
(86, 'Lisk', 'LSK.png', 'LSK', 1, '2021-12-19 10:33:43', '2021-12-19 10:33:43'),
(87, 'LTO Network', 'LTO.png', 'LTO', 1, '2021-12-19 10:37:09', '2021-12-19 10:37:09'),
(88, 'Aion', 'AION.png', 'AION', 1, '2021-12-19 10:37:51', '2021-12-19 10:37:51'),
(89, 'MBL', 'MBL.png', 'MBL', 1, '2021-12-19 10:38:11', '2021-12-19 10:38:11'),
(90, 'COTI', 'COTI.png', 'COTI', 1, '2021-12-19 10:38:32', '2021-12-19 10:38:32'),
(91, 'Standard Tokenization Protocol', 'STPT.png', 'STPT', 1, '2021-12-19 10:39:06', '2021-12-19 10:39:06'),
(92, 'Waltonchain', 'WTC.png', 'WTC', 1, '2021-12-19 10:40:11', '2021-12-19 10:40:11'),
(93, 'DATA', 'DATA.png', 'DATA', 1, '2021-12-19 10:40:57', '2021-12-19 10:40:57'),
(94, 'Solana', 'SOL.png', 'SOL', 1, '2021-12-19 10:41:55', '2021-12-19 10:41:55'),
(95, 'Cartesi', 'CTSI.png', 'CTSI', 1, '2021-12-19 10:42:35', '2021-12-19 10:42:35'),
(96, 'Hive', 'HIVE.png', 'HIVE', 1, '2021-12-19 10:42:56', '2021-12-19 10:42:56'),
(97, 'Chromia', '.png', 'CHR', 1, '2021-12-19 10:43:16', '2021-12-19 10:43:16'),
(98, 'Ardor', 'ARDR.png', 'ARDR', 1, '2021-12-19 10:44:07', '2021-12-19 10:44:07'),
(99, 'Measurable Data Token', 'MDT.png', 'MDT', 1, '2021-12-19 10:45:06', '2021-12-19 10:45:06'),
(100, 'StormX', 'STMX.png', 'STMX', 1, '2021-12-19 10:45:26', '2021-12-19 10:45:26'),
(101, 'Kyber Network Crystal v2', 'KNC.png', 'KNC', 1, '2021-12-19 10:45:47', '2021-12-19 10:45:47'),
(102, 'Augur', 'REP.png', 'REP', 1, '2021-12-19 10:46:07', '2021-12-19 10:46:07'),
(103, 'Loopring', 'LRC.png', 'LRC', 1, '2021-12-19 10:46:28', '2021-12-19 10:46:28'),
(104, 'pNetwork', 'PNT.png', 'PNT', 1, '2021-12-19 10:46:58', '2021-12-19 10:46:58'),
(105, 'Compound', 'COMP.png', 'COMP', 1, '2021-12-19 10:47:47', '2021-12-19 10:47:47'),
(106, 'Siacoin', 'SC.png', 'SC', 1, '2021-12-19 10:48:29', '2021-12-19 10:48:29'),
(107, 'Horizen', 'ZEN.png', 'ZEN', 1, '2021-12-19 10:48:49', '2021-12-19 10:48:49'),
(108, 'Synthetix', 'SNX.png', 'SNX', 1, '2021-12-19 10:49:09', '2021-12-19 10:49:09'),
(109, 'VeThor Token', 'VTHO.png', 'VTHO', 1, '2021-12-19 10:49:30', '2021-12-19 10:49:30'),
(110, 'DigiByte', 'DGB.png', 'DGB', 1, '2021-12-19 10:49:50', '2021-12-19 10:49:50'),
(111, 'Good Boy Points', 'GBP.png', 'GBP', 1, '2021-12-19 10:50:11', '2022-01-14 16:36:17'),
(112, 'Swipe', 'SXP.png', 'SXP', 1, '2021-12-19 10:50:31', '2021-12-19 10:50:31'),
(113, 'Decred', 'DCR.png', 'DCR', 1, '2021-12-19 10:51:12', '2021-12-19 10:51:12'),
(114, 'Storj', 'STORJ.png', 'STORJ', 1, '2021-12-19 10:51:32', '2021-12-19 10:51:32'),
(115, 'Decentraland', 'MANA.png', 'MANA', 1, '2021-12-19 10:52:24', '2021-12-19 10:52:24'),
(116, 'Audius', 'AUDIO.png', 'AUDIO', 1, '2021-12-19 10:52:44', '2021-12-19 10:52:44'),
(117, 'yearn.finance', 'YFI.png', 'YFI', 1, '2021-12-19 10:53:04', '2021-12-19 10:53:04'),
(118, 'Balancer', 'BAL.png', 'BAL', 1, '2021-12-19 10:53:25', '2021-12-19 10:53:25'),
(119, 'Bluzelle', 'BLZ.png', 'BLZ', 1, '2021-12-19 10:53:45', '2021-12-19 10:53:45'),
(120, 'IRISnet', 'IRIS.png', 'IRIS', 1, '2021-12-19 10:54:06', '2021-12-19 10:54:06'),
(121, 'Komodo', 'KMD.png', 'KMD', 1, '2021-12-19 10:54:26', '2021-12-19 10:54:26'),
(122, 'JUST', 'JST.png', 'JST', 1, '2021-12-19 10:55:07', '2021-12-19 10:55:07'),
(123, 'Serum', 'SRM.png', 'SRM', 1, '2021-12-19 10:55:27', '2021-12-19 10:55:27'),
(124, 'Aragon', 'ANT.png', 'ANT', 1, '2021-12-19 10:55:48', '2021-12-19 10:55:48'),
(125, 'Curve DAO Token', 'CRV.png', 'CRV', 1, '2021-12-19 10:56:20', '2021-12-19 10:56:20'),
(126, 'The Sandbox', 'SAND.png', 'SAND', 1, '2021-12-19 10:56:53', '2021-12-19 10:56:53'),
(127, 'Ocean Protocol', 'OCEAN.png', 'OCEAN', 1, '2021-12-19 10:57:21', '2021-12-19 10:57:21'),
(128, 'Numeraire', 'NMR.png', 'NMR', 1, '2021-12-19 10:57:44', '2021-12-19 10:57:44'),
(129, 'Polkadot', 'DOT.png', 'DOT', 1, '2021-12-19 10:58:04', '2021-12-19 10:58:04'),
(130, 'Reserve Rights', 'RSR.png', 'RSR', 1, '2021-12-19 10:58:55', '2021-12-19 10:58:55'),
(131, 'PAX Gold', 'PAXG.png', 'PAXG', 1, '2021-12-19 10:59:16', '2021-12-19 10:59:16'),
(132, 'Wrapped NXM', 'WNXM.png', 'WNXM', 1, '2021-12-19 10:59:53', '2021-12-19 10:59:53'),
(133, 'Tellor', 'TRB.png', 'TRB', 1, '2021-12-19 11:00:24', '2021-12-19 11:00:24'),
(134, 'SushiSwap', 'SUSHI.png', 'SUSHI', 1, '2021-12-19 11:01:30', '2021-12-19 11:01:30'),
(135, 'DFI.Money', 'YFII.png', 'YFII', 1, '2021-12-19 11:01:52', '2021-12-19 11:01:52'),
(136, 'Kusama', 'KSM.png', 'KSM', 1, '2021-12-19 11:02:12', '2021-12-19 11:02:12'),
(137, 'Elrond', 'EGLD.png', 'EGLD', 1, '2021-12-19 11:02:33', '2021-12-19 11:02:33'),
(138, 'DIA', 'DIA.png', 'DIA', 1, '2021-12-19 11:02:53', '2021-12-19 11:02:53'),
(139, 'THORChain', 'RUNE.png', 'RUNE', 1, '2021-12-19 11:03:13', '2021-12-19 11:03:13'),
(140, 'FIO Protocol', 'FIO.png', 'FIO', 1, '2021-12-19 11:03:44', '2021-12-19 11:03:44'),
(141, 'UMA', 'UMA.png', 'UMA', 1, '2021-12-19 11:04:05', '2021-12-19 11:04:05'),
(142, 'Bella Protocol', 'BEL.png', 'BEL', 1, '2021-12-19 11:04:45', '2021-12-19 11:04:45'),
(143, 'Wing Finance', 'WING.png', 'WING', 1, '2021-12-19 11:05:06', '2021-12-19 11:05:06'),
(144, 'Uniswap', 'UNI.png', 'UNI', 1, '2021-12-19 11:05:26', '2021-12-19 11:05:26'),
(145, 'New BitShares', 'NBS.png', 'NBS', 1, '2021-12-19 11:05:47', '2021-12-19 11:05:47'),
(146, 'Orchid', 'OXT.png', 'OXT', 1, '2021-12-19 11:06:07', '2021-12-19 11:06:07'),
(147, 'Sun (New)', 'SUN.png', 'SUN', 1, '2021-12-19 11:06:28', '2021-12-19 11:06:28'),
(148, 'Avalanche', 'AVAX.png', 'AVAX', 1, '2021-12-19 11:06:48', '2021-12-19 11:06:48'),
(149, 'Helium', 'HNT.png', 'HNT', 1, '2021-12-19 11:07:21', '2021-12-19 11:07:21'),
(150, 'Flamingo', 'FLM.png', 'FLM', 1, '2021-12-19 11:07:43', '2021-12-19 11:07:43'),
(151, 'Orion Protocol', 'ORN.png', 'ORN', 1, '2021-12-19 11:08:15', '2021-12-19 11:08:15'),
(152, 'Utrust', 'UTK.png', 'UTK', 1, '2021-12-19 11:08:36', '2021-12-19 11:08:36'),
(153, 'Venus', 'XVS.png', 'XVS', 1, '2021-12-19 11:08:56', '2021-12-19 11:08:56'),
(154, 'Alpha Finance Lab', 'ALPHA.png', 'ALPHA', 1, '2021-12-19 11:09:32', '2021-12-19 11:09:32'),
(155, 'Aave', 'AAVE.png', 'AAVE', 1, '2021-12-19 11:10:31', '2021-12-19 11:10:31'),
(156, 'NEAR Protocol', 'NEAR.png', 'NEAR', 1, '2021-12-19 11:11:06', '2021-12-19 11:11:06'),
(157, 'Filecoin', 'FIL.png', 'FIL', 1, '2021-12-19 11:11:26', '2021-12-19 11:11:26'),
(158, 'Injective Protocol', 'INJ.png', 'INJ', 1, '2021-12-19 11:12:00', '2021-12-19 11:12:00'),
(159, 'Akropolis', 'AKRO.png', 'AKRO', 1, '2021-12-19 11:13:01', '2021-12-19 11:13:01'),
(160, 'Axie Infinity', 'AXS.png', 'AXS', 1, '2021-12-19 11:13:37', '2021-12-19 11:13:37'),
(161, 'Kava Lend', 'HARD.png', 'HARD', 1, '2021-12-19 11:13:58', '2021-12-19 11:13:58'),
(162, 'district0x', 'DNT.png', 'DNT', 1, '2021-12-19 11:14:18', '2021-12-19 11:14:18'),
(163, 'Unifi Protocol DAO', 'UNFI.png', 'UNFI', 1, '2021-12-19 11:15:24', '2021-12-19 11:15:24'),
(164, 'Oasis Network', 'ROSE.png', 'ROSE', 1, '2021-12-19 11:15:47', '2021-12-19 11:15:47'),
(166, 'SKALE Network', 'SKL.png', 'SKL', 1, '2021-12-19 11:17:25', '2021-12-19 11:17:25'),
(167, 'sUSD', 'SUSD.png', 'SUSD', 1, '2021-12-19 11:17:47', '2021-12-19 11:17:47'),
(168, 'The Graph', 'GRT.png', 'GRT', 1, '2021-12-19 11:18:18', '2021-12-19 11:18:18'),
(169, 'Juventus Fan Token', 'JUV.png', 'JUV', 1, '2021-12-19 11:18:52', '2021-12-19 11:18:52'),
(170, 'Paris Saint-Germain Fan Token', 'PSG.png', 'PSG', 1, '2021-12-19 11:19:28', '2021-12-19 11:19:28'),
(171, '1inch Network', '1INCH.png', '1INCH', 1, '2021-12-19 11:20:27', '2021-12-19 11:20:27'),
(172, 'Reef', 'REEF.png', 'REEF', 1, '2021-12-19 11:20:48', '2021-12-19 11:20:48'),
(173, 'AS Roma Fan Token', 'ASR.png', 'ASR', 1, '2021-12-19 11:21:55', '2021-12-19 11:21:55'),
(174, 'Celo', 'CELO.png', 'CELO', 1, '2021-12-19 11:22:24', '2021-12-19 11:22:24'),
(175, 'RSK Infrastructure Framework', 'RIF.png', 'RIF', 1, '2021-12-19 11:23:05', '2021-12-19 11:23:05'),
(176, 'Bitcoin Standard Hashrate Token', 'BTCST.png', 'BTCST', 1, '2021-12-19 11:23:43', '2021-12-19 11:23:43'),
(177, 'TrueFi', 'TRU.png', 'TRU', 1, '2021-12-19 11:24:04', '2021-12-19 11:24:04'),
(178, 'Nervos Network', 'CKB.png', 'CKB', 1, '2021-12-19 11:24:38', '2021-12-19 11:24:38'),
(179, 'Trust Wallet Token', 'TWT.png', 'TWT', 1, '2021-12-19 11:25:19', '2021-12-19 11:25:19'),
(180, 'Firo', 'FIRO.png', 'FIRO', 1, '2021-12-19 11:25:57', '2021-12-19 11:25:57'),
(181, 'Litentry', 'LIT.png', 'LIT', 1, '2021-12-19 11:26:17', '2021-12-25 00:50:07'),
(182, 'SafePal', 'SFP.png', 'SFP', 1, '2021-12-19 11:26:38', '2021-12-19 11:26:38'),
(183, 'Actinium', 'ACM.png', 'ACM', 1, '2022-01-03 07:51:21', '2022-01-03 07:52:39'),
(184, 'Ambire AdEx', 'ADX.png', 'ADX', 1, '2022-01-03 07:52:10', '2022-01-03 07:52:10'),
(185, 'Adventure Gold', 'AGLD.png', 'AGLD', 1, '2022-01-03 07:53:04', '2022-01-03 07:53:04'),
(186, 'Alchemix', 'ALCX.png', 'ALCX', 1, '2022-01-03 07:53:51', '2022-01-03 07:53:51'),
(187, 'MyNeighborAlice', 'ALICE.png', 'ALICE', 1, '2022-01-03 07:54:23', '2022-01-03 07:54:23'),
(188, 'Alpaca Finance', 'ALPACA.png', 'ALPACA', 1, '2022-01-03 07:54:48', '2022-01-03 07:54:48'),
(189, 'HyperSpace', 'AMP.png', 'AMP', 1, '2022-01-03 07:55:13', '2022-01-03 07:55:13'),
(190, 'ANYONE', 'ANY.png', 'ANY', 1, '2022-01-03 07:55:38', '2022-01-03 07:55:38'),
(191, 'Arweave', 'AR.png', 'AR', 1, '2022-01-03 07:56:53', '2022-01-03 07:56:53'),
(192, 'Automata Network', 'ATA.png', 'ATA', 1, '2022-01-03 07:57:22', '2022-01-03 07:57:22'),
(193, 'ATMChain', 'ATM.png', 'ATM', 1, '2022-01-03 07:57:47', '2022-01-03 07:57:47'),
(194, 'Bounce Finance Governance Token', 'AUCTION.png', 'AUCTION', 1, '2022-01-03 07:58:17', '2022-01-03 07:58:17'),
(195, 'Cube', 'AUTO.png', 'AUTO', 1, '2022-01-03 08:00:32', '2022-01-03 08:00:32'),
(196, 'Travala.com', 'AVA.png', 'AVA', 1, '2022-01-03 08:00:57', '2022-01-03 08:00:57'),
(197, 'Badger DAO', 'BADGER.png', 'BADGER', 1, '2022-01-03 08:01:22', '2022-01-03 08:01:22'),
(198, 'BakeryToken', 'BAKE.png', 'BAKE', 1, '2022-01-03 08:01:46', '2022-01-03 08:01:46'),
(199, 'FC Barcelona Fan Token', 'BAR.png', 'BAR', 1, '2022-01-03 08:02:28', '2022-01-03 08:02:28'),
(200, 'Beta Finance', 'BETA.png', 'BETA', 1, '2022-01-03 08:02:54', '2022-01-03 08:02:54'),
(201, 'Biconomy', 'BICO.png', 'BICO', 1, '2022-01-03 08:03:19', '2022-01-03 08:03:19'),
(202, 'Bonded Finance', 'BOND.png', 'BOND', 1, '2022-01-03 08:03:44', '2022-01-03 08:03:44'),
(203, 'Bitcoin Gold', 'BTG.png', 'BTG', 1, '2022-01-03 08:04:08', '2022-01-03 08:04:08'),
(204, 'Burger Swap', 'BURGER.png', 'BURGER', 1, '2022-01-03 09:50:51', '2022-01-03 09:50:51'),
(205, 'Binance USD', 'BUSD.png', 'BUSD', 1, '2022-01-03 09:51:16', '2022-01-03 09:51:16'),
(206, 'Coin98', 'C98.png', 'C98', 1, '2022-01-03 09:51:41', '2022-01-03 09:51:41'),
(207, 'PancakeSwap', 'CAKE.png', 'CAKE', 1, '2022-01-03 09:52:05', '2022-01-03 09:52:05'),
(208, 'CRYPTOFOREX', 'CFX.png', 'CFX', 1, '2022-01-03 09:52:31', '2022-01-03 09:52:31'),
(209, 'ChessCoin', 'CHESS.png', 'CHESS', 1, '2022-01-03 09:52:55', '2022-01-03 09:52:55'),
(210, 'City Coin', 'CITY.png', 'CITY', 1, '2022-01-03 09:53:20', '2022-01-03 09:53:20'),
(211, 'Clover Finance', 'CLV.png', 'CLV', 1, '2022-01-03 09:53:45', '2022-01-03 09:53:45'),
(212, 'CertiK', 'CTK.png', 'CTK', 1, '2022-01-03 09:54:10', '2022-01-03 09:54:10'),
(213, 'PowerPool', 'CVP.png', 'CVP', 1, '2022-01-03 09:54:35', '2022-01-03 09:54:35'),
(214, 'Convex Finance', 'CVX.png', 'CVX', 1, '2022-01-03 09:54:59', '2022-01-03 09:54:59'),
(215, 'Mines of Dalarnia', 'DAR.png', 'DAR', 1, '2022-01-03 09:55:25', '2022-01-03 09:55:25'),
(216, 'DeroGold', 'DEGO.png', 'DEGO', 1, '2022-01-03 09:55:49', '2022-01-03 09:55:49'),
(217, 'DeXe', 'DEXE.png', 'DEXE', 1, '2022-01-03 09:56:14', '2022-01-03 09:56:14'),
(218, 'dForce', 'DF.png', 'DF', 1, '2022-01-03 09:56:39', '2022-01-03 09:56:39'),
(219, 'DODO', 'DODO.png', 'DODO', 1, '2022-01-03 09:57:04', '2022-01-03 09:57:04'),
(220, 'dYdX', 'DYDX.png', 'DYDX', 1, '2022-01-03 09:58:39', '2022-01-03 09:58:39'),
(221, 'aelf', 'ELF.png', 'ELF', 1, '2022-01-03 09:59:03', '2022-01-03 09:59:03'),
(222, 'Ethereum Name Service', 'ENS.png', 'ENS', 1, '2022-01-03 09:59:28', '2022-01-03 09:59:28'),
(223, 'Epanus', 'EPS.png', 'EPS', 1, '2022-01-03 09:59:53', '2022-01-03 09:59:53'),
(224, 'Ethernity Chain', 'ERN.png', 'ERN', 1, '2022-01-03 10:00:18', '2022-01-03 10:00:18'),
(225, 'Harvest Finance', 'FARM.png', 'FARM', 1, '2022-01-03 10:00:43', '2022-01-03 10:00:43'),
(226, 'Bonfida', 'FIDA.png', 'FIDA', 1, '2022-01-03 10:01:08', '2022-01-03 10:01:08'),
(227, 'Stafi', 'FIS.png', 'FIS', 1, '2022-01-03 10:01:32', '2022-01-03 10:01:32'),
(228, 'Flow', 'FLOW.png', 'FLOW', 1, '2022-01-03 10:01:57', '2022-01-03 10:01:57'),
(229, 'Flux', 'FLUX.png', 'FLUX', 1, '2022-01-03 10:02:22', '2022-01-03 10:02:22'),
(230, 'Ampleforth Governance Token', 'FORTH.png', 'FORTH', 1, '2022-01-03 10:02:47', '2022-01-03 10:02:47'),
(231, 'FORCE', 'FOR.png', 'FOR', 1, '2022-01-03 10:03:12', '2022-01-03 10:03:12'),
(232, 'Frontier', 'FRONT.png', 'FRONT', 1, '2022-01-03 10:03:37', '2022-01-03 10:03:37'),
(233, 'Frax Share', 'FXS.png', 'FXS', 1, '2022-01-03 10:04:01', '2022-01-03 10:04:01'),
(234, 'Gala', 'GALA.png', 'GALA', 1, '2022-01-03 10:04:27', '2022-01-03 10:04:27'),
(235, 'Aavegotchi', 'GHST.png', 'GHST', 1, '2022-01-03 10:04:51', '2022-01-03 10:04:51'),
(236, 'Gnosis', 'GNO.png', 'GNO', 1, '2022-01-03 10:05:16', '2022-01-03 10:05:16'),
(237, 'Game.com', 'GTC.png', 'GTC', 1, '2022-01-03 10:05:41', '2022-01-03 10:05:41'),
(238, 'Highstreet', 'HIGH.png', 'HIGH', 1, '2022-01-03 10:12:24', '2022-01-03 10:12:24'),
(239, 'Internet Computer', 'ICP.png', 'ICP', 1, '2022-01-03 10:12:49', '2022-01-03 10:12:49'),
(240, 'IDEX', 'IDEX.png', 'IDEX', 1, '2022-01-03 10:13:14', '2022-01-03 10:13:14'),
(241, 'Illuvium', 'ILV.png', 'ILV', 1, '2022-01-03 10:13:38', '2022-01-03 10:13:38'),
(242, 'JasmyCoin', 'JASMY.png', 'JASMY', 1, '2022-01-03 10:14:03', '2022-01-03 10:14:03'),
(243, 'JOE', 'JOE.png', 'JOE', 1, '2022-01-03 10:14:28', '2022-01-03 10:14:28'),
(244, 'Keep Network', 'KEEP.png', 'KEEP', 1, '2022-01-03 10:14:53', '2022-01-03 10:14:53'),
(245, 'Klaytn', 'KLAY.png', 'KLAY', 1, '2022-01-03 10:15:18', '2022-01-03 10:15:18'),
(246, 'Keep3rV1', 'KP3R.png', 'KP3R', 1, '2022-01-03 10:15:43', '2022-01-03 10:15:43'),
(247, 'S.S. Lazio Fan Token', 'LAZIO.png', 'LAZIO', 1, '2022-01-03 10:16:08', '2022-01-03 10:16:08'),
(248, 'LINA', 'LINA.png', 'LINA', 1, '2022-01-03 10:16:33', '2022-01-03 10:16:33'),
(249, 'Chainlink', 'LINK.png', 'LINK', 1, '2022-01-03 10:16:58', '2022-01-03 10:16:58'),
(250, 'Livepeer', 'LPT.png', 'LPT', 1, '2022-01-03 10:17:23', '2022-01-03 10:17:23'),
(251, 'Decentraland Mask Network', 'MANAMASK.png', 'MANAMASK', 1, '2022-01-03 10:19:16', '2022-01-03 10:19:16'),
(252, 'MOBOX', 'MBOX.png', 'MBOX', 1, '2022-01-03 10:19:40', '2022-01-03 10:19:40'),
(253, 'Merit Circle', 'MC.png', 'MC', 1, '2022-01-03 10:20:05', '2022-01-03 10:20:05'),
(254, 'Midex token', 'MDX.png', 'MDX', 1, '2022-01-03 10:20:31', '2022-01-03 10:20:31'),
(255, 'Mina', 'MINA.png', 'MINA', 1, '2022-01-03 10:20:55', '2022-01-03 10:20:55'),
(256, 'MIR COIN', 'MIR.png', 'MIR', 1, '2022-01-03 10:21:20', '2022-01-03 10:21:20'),
(257, 'Moonriver', 'MOVR.png', 'MOVR', 1, '2022-01-03 10:28:30', '2022-01-03 10:28:30'),
(258, 'NuCypher', 'NU.png', 'NU', 1, '2022-01-03 10:31:16', '2022-01-03 10:31:16'),
(259, 'OG Fan Token', 'OG.png', 'OG', 1, '2022-01-03 10:31:50', '2022-01-03 10:31:50'),
(260, 'MANTRA DAO', 'OM.png', 'OM', 1, '2022-01-03 10:32:15', '2022-01-03 10:32:15'),
(261, 'Ooki Protocol', 'OOKI.png', 'OOKI', 1, '2022-01-03 10:32:40', '2022-01-03 10:32:40'),
(262, 'ConstitutionDAO', 'PEOPLE.png', 'PEOPLE', 1, '2022-01-03 10:33:05', '2022-01-03 10:33:05'),
(263, 'Perpetual Protocol', 'PERP.png', 'PERP', 1, '2022-01-03 10:33:30', '2022-01-03 10:33:30'),
(264, 'Phala Network', 'PHA.png', 'PHA', 1, '2022-01-03 10:33:55', '2022-01-03 10:33:55'),
(265, 'Plair', 'PLA.png', 'PLA', 1, '2022-01-03 10:34:20', '2022-01-03 10:34:20'),
(266, 'Polkastarter', 'POLS.png', 'POLS', 1, '2022-01-03 10:35:02', '2022-01-03 10:35:02'),
(267, 'Polymath', 'POLY.png', 'POLY', 1, '2022-01-03 10:36:02', '2022-01-03 10:36:02'),
(268, 'Marlin', 'POND.png', 'POND', 1, '2022-01-03 10:36:27', '2022-01-03 10:36:27'),
(269, 'FC Porto Fan Token', 'PORTO.png', 'PORTO', 1, '2022-01-03 10:36:51', '2022-01-03 10:36:51'),
(270, 'Powerledger', 'POWR.png', 'POWR', 1, '2022-01-03 10:37:16', '2022-01-03 10:37:16'),
(271, 'Pundi X (New)', 'PUNDIX.png', 'PUNDIX', 1, '2022-01-03 10:37:41', '2022-01-03 10:37:41'),
(272, 'Vulcan Forged PYR', 'PYR.png', 'PYR', 1, '2022-01-03 10:38:06', '2022-01-03 10:38:06'),
(273, 'QiSwap', 'QI.png', 'QI', 1, '2022-01-03 10:38:31', '2022-01-03 10:38:31'),
(274, 'Quant', 'QNT.png', 'QNT', 1, '2022-01-03 10:38:56', '2022-01-03 10:38:56'),
(275, 'QuickSwap', 'QUICK.png', 'QUICK', 1, '2022-01-03 10:39:21', '2022-01-03 10:39:21'),
(276, 'Radicle', 'RAD.png', 'RAD', 1, '2022-01-03 10:39:46', '2022-01-03 10:39:46'),
(277, 'RAMP', 'RAMP.png', 'RAMP', 1, '2022-01-03 10:40:10', '2022-01-03 10:40:10'),
(278, 'Rare', 'RARE.png', 'RARE', 1, '2022-01-03 10:40:35', '2022-01-03 10:40:35'),
(279, 'Raydium', 'RAY.png', 'RAY', 1, '2022-01-03 10:41:00', '2022-01-03 10:41:00'),
(280, 'Request', 'REQ.png', 'REQ', 1, '2022-01-03 10:41:25', '2022-01-03 10:41:25'),
(281, 'Rari Governance Token', 'RGT.png', 'RGT', 1, '2022-01-03 10:41:50', '2022-01-03 10:41:50'),
(282, 'Render Token', 'RNDR.png', 'RNDR', 1, '2022-01-03 10:42:15', '2022-01-03 10:42:15'),
(283, 'Santos FC Fan Token', 'SANTOS.png', 'SANTOS', 1, '2022-01-03 10:44:11', '2022-01-03 10:44:11'),
(284, 'Shiba Inu', 'SHIB.png', 'SHIB', 1, '2022-01-03 10:44:36', '2022-01-03 10:44:36'),
(285, 'Smooth Love Potion', 'SLP.png', 'SLP', 1, '2022-01-03 10:45:07', '2022-01-03 10:45:07'),
(286, 'Spell Token', 'SPELL.png', 'SPELL', 1, '2022-01-03 10:45:32', '2022-01-03 10:45:32'),
(287, 'Stratis', 'STRAX.png', 'STRAX', 1, '2022-01-03 10:45:57', '2022-01-03 10:45:57'),
(288, 'SuperCoin', 'SUPER.png', 'SUPER', 1, '2022-01-03 10:46:22', '2022-01-03 10:46:22'),
(289, 'Syscoin', 'SYS.png', 'SYS', 1, '2022-01-03 10:46:47', '2022-01-03 10:46:47'),
(290, 'Toko Token', 'TKO.png', 'TKO', 1, '2022-01-03 10:47:12', '2022-01-03 10:47:12'),
(291, 'Alien Worlds', 'TLM.png', 'TLM', 1, '2022-01-03 10:47:37', '2022-01-03 10:47:37'),
(292, 'Tornado Cash', 'TORN.png', 'TORN', 1, '2022-01-03 10:48:02', '2022-01-03 10:48:02'),
(293, 'Tribe', 'TRIBE.png', 'TRIBE', 1, '2022-01-03 10:48:27', '2022-01-03 10:48:27'),
(294, 'Terra Virtua Kolect', 'TVK.png', 'TVK', 1, '2022-01-03 10:48:52', '2022-01-03 10:48:52'),
(295, 'TerraUSD', 'UST.png', 'UST', 1, '2022-01-03 10:53:05', '2022-01-03 10:53:05'),
(296, 'Voyager Token', 'VGX.png', 'VGX', 1, '2022-01-03 10:53:21', '2022-01-03 10:53:21'),
(297, 'VIDT Datalink', 'VIDT.png', 'VIDT', 1, '2022-01-03 10:54:05', '2022-01-03 10:54:05'),
(298, 'Voxies', 'VOXEL.png', 'VOXEL', 1, '2022-01-03 10:54:27', '2022-01-03 10:54:27'),
(299, 'WAX', 'WAXP.png', 'WAXP', 1, '2022-01-03 10:54:43', '2022-01-03 10:54:43'),
(300, 'eCash', 'XEC.png', 'XEC', 1, '2022-01-03 10:55:17', '2022-01-03 10:55:17'),
(301, 'Verge', 'XVG.png', 'XVG', 1, '2022-01-03 10:56:00', '2022-01-03 10:56:00'),
(302, 'Yield Guild Games', 'YGG.PNG', 'YGG', 1, '2022-01-03 10:56:20', '2022-01-03 16:40:37');

-- --------------------------------------------------------

--
-- Table structure for table `crypto_currency_prices`
--

CREATE TABLE `crypto_currency_prices` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `one_hour` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `price` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `seven_day` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `market_cap` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `twenty_four` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `volume24h` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `circulating` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crypto_currency_prices`
--

INSERT INTO `crypto_currency_prices` (`id`, `name`, `symbol`, `one_hour`, `price`, `seven_day`, `market_cap`, `twenty_four`, `volume24h`, `circulating`, `created_at`, `updated_at`) VALUES
(1, 'Bitcoin', 'BTC', -0.38355547, 42722.16766253, 1.66336917, 808813386690.53000000, -1.29173367, 19630609085.90000000, 18931937.00000000, '2021-12-28 03:50:11', '2022-01-17 08:15:10'),
(2, 'Ethereum', 'ETH', -0.62427317, 3269.39651297, 3.33868342, 389693549954.13000000, -1.97465643, 10996718672.92000000, 119194337.06150000, '2021-12-28 03:50:11', '2022-01-17 08:15:10'),
(3, 'BNB', 'BNB', -0.27070964, 484.74791560, 9.97195325, 80856508812.20500000, -2.56484767, 1923921497.78550000, 166801148.00000000, '2021-12-28 03:50:11', '2022-01-17 08:15:10'),
(4, 'Tether', 'USDT', -0.00704338, 1.00027018, 0.01198420, 78420751520.13300000, -0.02142299, 46364584742.16800000, 78399569300.66100000, '2021-12-28 03:50:11', '2022-01-17 08:15:10'),
(5, 'Solana', 'SOL', -0.06372604, 143.39146690, 0.41541551, 45027304801.27400000, -4.82601568, 1338597329.96190000, 314016627.16671000, '2021-12-28 03:50:11', '2022-01-17 08:15:10'),
(6, 'Cardano', 'ADA', 0.46602619, 1.52846524, 30.04262494, 51244320299.26400000, 11.23253011, 3399021930.92360000, 33526650730.35300000, '2021-12-28 03:50:11', '2022-01-17 08:15:10'),
(7, 'XRP', 'XRP', -0.40419804, 0.76449487, 1.59893181, 36438208735.73800000, -2.29374290, 1198912251.65710000, 47663117635.00000000, '2021-12-28 03:50:11', '2022-01-17 08:15:10'),
(8, 'USD Coin', 'USDC', 0.01672531, 1.00037061, 0.01733739, 45524500494.18400000, 0.03408666, 2576679282.50930000, 45507635110.33500000, '2021-12-28 03:50:11', '2022-01-17 08:15:10'),
(9, 'Terra', 'LUNA', -0.36803877, 83.35150374, 15.21708039, 29870523775.57400000, -2.54134308, 1402096695.22340000, 358368144.98589000, '2021-12-28 03:50:11', '2022-01-17 08:15:10'),
(10, 'Polkadot', 'DOT', -0.54663702, 26.63998915, 6.75510441, 26309102233.64800000, -6.14492320, 1416566675.40160000, 987579314.95709000, '2021-12-28 03:50:11', '2022-01-17 08:15:10');

-- --------------------------------------------------------

--
-- Table structure for table `crypto_pairs`
--

CREATE TABLE `crypto_pairs` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Disable : 0, Enable : 1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crypto_pairs`
--

INSERT INTO `crypto_pairs` (`id`, `name`, `image`, `symbol`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bitcoin', 'BTC.png', 'BTC', 1, '2021-12-18 20:22:34', '2021-12-18 20:22:34'),
(2, 'Tether', 'USDT.png', 'USDT', 1, '2021-12-18 20:26:30', '2021-12-18 20:26:30'),
(3, 'Binance USD', 'BUSD.png', 'BUSD', 1, '2022-01-03 09:51:16', '2022-01-03 09:51:16'),
(4, 'BNB', 'BNB.png', 'BNB', 1, '2021-12-18 20:22:34', '2022-01-14 17:15:48'),
(5, 'ETH', 'ETH.png', 'ETH', 1, '2021-12-18 20:22:34', '2022-01-14 17:15:48');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `method_code` int(10) UNSIGNED NOT NULL,
  `amount` decimal(18,8) NOT NULL,
  `method_currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` decimal(18,8) NOT NULL,
  `rate` decimal(18,8) NOT NULL,
  `final_amo` decimal(18,8) DEFAULT 0.00000000,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_amo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `try` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `admin_feedback` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `greeting` varchar(191) DEFAULT NULL,
  `message` text NOT NULL,
  `regards` varchar(191) DEFAULT NULL,
  `notify` smallint(6) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `slug`, `subject`, `greeting`, `message`, `regards`, `notify`, `created_at`, `updated_at`) VALUES
(5, 'Welcome Email', 'welcome-email', 'Welcome to [[site_name]]', 'Hi [[user_name]],', 'Thanks for joining our platform! \n\nAs a member of our platform, you can mange your account, purchase cryptocurrencies, trade, referrals etc. \n\nFind out more about in - [[site_url]]', 'true', 1, '2021-07-11 00:37:21', '2021-07-11 00:37:21'),
(6, 'Send Email to User', 'send-user-email', 'New Message - [[site_name]]', 'Hi [[user_name]], ', 'You recieved a message from [[site_name]]:\r\n\r\n[[subject]]\r\n\r\n[[message]]\r\n\r\n', 'true', 1, '2021-07-11 00:37:21', '2021-07-11 00:37:21'),
(16, 'Balance Add by Admin', 'balance-add-by-admin', 'Your Account has been Credited by Admin - [[site_name]]', 'Hello [[user_name]],', '[[amount]] [[currency]] has been added to your account .\r\n\r\nTransaction Number : [[trx]]\r\n\r\nYour Current Balance is : [[post_balance]]  [[currency]]\r\n\r\n', 'true', 0, '2021-07-11 00:37:21', '2021-12-27 22:12:31'),
(8, 'Unusual Login Email', 'users-unusual-login-email', 'Unusual Login Attempt on [[site_name]]!!!!', 'Hi [[user_name]], ', 'Someone tried to log in too many times in your [[site_name]] account.', 'true', 1, '2021-07-11 00:37:21', '2021-07-11 00:37:21'),
(9, 'Automated Deposit - Successful', 'automated-deposit-successful', 'Deposit Completed Successfully - [[site_name]]', 'Hi [[user_name]],', 'Your deposit of [[amount]] [[currency]] is via  [[method_name]] has been completed Successfully.\r\n\r\nDetails of your Deposit :\r\n\r\nAmount : [[amount]] [[currency]]\r\nCharge: [[charge]] [[currency]]\r\n\r\nConversion Rate : 1 [[currency]] = [[rate]] [[method_currency]]\r\nPayable : [[method_amount]] [[method_currency]]\r\nPaid via :  [[method_name]]\r\n\r\nTransaction Number : [[trx]]\r\n\r\nYour current Balance is [[post_balance]] [[currency]]\r\n\r\n', 'true', 0, '2021-07-11 00:37:21', '2021-12-27 22:11:22'),
(1, 'KYC Approved Email', 'kyc-approved-email', 'KYC Verified: Trade in [[site_name]]', 'Hello [[user_name]],', 'Thank you for submitting your verification request. \r\n\r\nWe are pleased to let you know that your identity (KYC) has been verified and you are granted to participate in our trading platform with your wallet.\r\n\r\nWe invite you to get back to your account dashboard and start trading.', 'true', 0, '2021-07-11 00:37:21', '2021-12-27 22:09:48'),
(2, 'KYC Rejected Email', 'kyc-rejected-email', 'KYC Application has been rejected - [[site_name]]', 'Hello [[user_name]],', 'Thank you for submitting your verification request. We\'re having difficulties verifying your identity. \n\nThe information you had submitted was unfortunately rejected for following reason: \n[[message]]\n\nDon\'t be upset! Still you want to verity your identity, please get back to your account and fill form with proper information and upload correct documents to complete your identity verification process.', 'true', 1, '2021-07-11 00:37:21', '2021-07-11 00:37:21'),
(3, 'KYC Missing Email', 'kyc-missing-email', 'Identity Verification: Action Required - [[site_name]]', 'Hello [[user_name]],', 'Thank you for submitting your verification request. We\'re having difficulties verifying your identity. \n\nThe information you had submitted was unfortunately rejected because of the following reason:\n[[message]]\n\nWe request to get back to your account in order to upload new documents and complete the identity verification.', 'true', 1, '2021-07-11 00:37:21', '2021-07-11 00:37:21'),
(4, 'KYC Submitted Email', 'kyc-submit-email', 'Document submitted for Identity Verification - [[site_name]]', 'Hello [[user_name]],', 'Thank you for submitting your verification request. We\'ve received your submitted document and other information for identity verification.\n\nWe\'ll review your information and if all is in order will approve your identity. If the information is incorrect or something missing, we will request this as soon as possible.', 'true', 1, '2021-07-11 00:37:21', '2021-07-11 00:37:21'),
(7, 'Support Ticket Reply', 'support-ticket-reply', 'Support Ticket Reply  - [[site_name]]', 'Hi [[user_name]],', 'A member from our support team has replied to the following ticket:\r\n\r\n[Ticket#[[ticket_id]]] [[ticket_subject]]\r\n\r\nClick here to reply:  [[link]]\r\n\r\n----------------------------------------------\r\n\r\nHere is the reply :\r\n\r\n[[reply]]\r\n\r\n', 'true', 0, '2021-07-11 00:37:21', '2021-12-27 22:10:16'),
(10, 'Manual Deposit - User Requested', 'manual-deposit-user-requested', 'Deposit Request Submitted Successfully - [[site_name]]', 'Hi [[user_name]],', 'Your deposit request of [[amount]] [[currency]] is via  [[method_name]] submitted successfully .\r\n\r\nDetails of your Deposit :\r\n\r\nAmount : [[amount]] [[currency]]\r\nCharge: [[charge]] [[currency]]\r\n\r\nConversion Rate : 1 [[currency]] = [[rate]] [[method_currency]]\r\nPayable : [[method_amount]] [[method_currency]]\r\nPay via :  [[method_name]]\r\n\r\nTransaction Number : [[trx]]\r\n\r\n', 'true', 0, '2021-07-11 00:37:21', '2021-12-27 22:11:12'),
(17, 'Balance Subtracted by Admin', 'balance-subtracted-by-admin', 'Your Account has been Debited by Admin - [[site_name]]', 'Hello [[user_name]],', '[[amount]] [[currency]] has been subtracted from your account .\r\n\r\nTransaction Number : [[trx]]\r\n\r\nYour Current Balance is : [[post_balance]]  [[currency]]\r\n\r\n', 'true', 1, '2021-07-11 00:37:21', '2021-12-27 22:11:54'),
(11, 'Manual Deposit - Admin Approved	', 'manual-deposit-admin-approved', 'Your Deposit is Approved', 'Hi [[user_name]],', 'Your deposit request of [[amount]] [[currency]] is via  [[method_name]] is Approved .\r\n\r\nDetails of your Deposit :\r\n\r\nAmount : [[amount]] [[currency]]\r\nCharge: [[charge]] [[currency]]\r\n\r\nConversion Rate : 1 [[currency]] = [[rate]] [[method_currency]]\r\nPayable : [[method_amount]] [[method_currency]]\r\nPaid via :  [[method_name]]\r\n\r\nTransaction Number : [[trx]]\r\n\r\nYour current Balance is [[post_balance]] [[currency]]\r\n\r\n', 'true', 1, '2021-07-11 00:37:21', '2021-07-11 00:37:21'),
(12, 'Manual Deposit - Admin Rejected', 'manual-deposit-admin-rejected', 'Your Deposit Request is Rejected - [[site_name]]', 'Hi [[user_name]],', 'Your deposit request of [[amount]] [[currency]] is via  [[method_name]] has been rejected.\r\n\r\nTransaction Number was : [[trx]]\r\n\r\nif you have any query, feel free to contact us.\r\n\r\n\r\n\r\n[[rejection_message]]\r\n\r\n', 'true', 1, '2021-07-11 00:37:21', '2021-12-27 22:12:18'),
(13, 'Withdraw - User Requested', 'withdraw-user-requested', 'Withdraw Request Submitted Successfully - [[site_name]]', 'Hi [[user_name]],', 'Your withdraw request of [[amount]] [[currency]]  via  [[method_name]] has been submitted Successfully.\r\n\r\nDetails of your withdraw:\r\n\r\nAmount : [[amount]] [[currency]]\r\nCharge: [[charge]] [[currency]]\r\n\r\nConversion Rate : 1 [[currency]] = [[rate]] [[method_currency]]\r\nYou will get: [[method_amount]] [[method_currency]]\r\nVia :  [[method_name]]\r\n\r\nTransaction Number : [[trx]]\r\n\r\nThis may take [[delay]] to process the payment.\r\n\r\n\r\nYour current Balance is [[post_balance]] [[currency]]\r\n\r\n', 'true', 0, '2021-07-11 00:37:21', '2021-12-27 22:11:38'),
(14, 'Withdraw - Admin Rejected', 'withdraw-admin-rejected', 'Withdraw Request has been Rejected and your money is refunded to your account - [[site_name]]', 'Hi [[user_name]],', 'Your withdraw request of [[amount]] [[currency]]  via  [[method_name]] has been Rejected.\r\n\r\nDetails of your withdraw:\r\n\r\nAmount : [[amount]] [[currency]]\r\nCharge: [[charge]] [[currency]]\r\n\r\nConversion Rate : 1 [[currency]] = [[rate]] [[method_currency]]\r\nYou should get: [[method_amount]] [[method_currency]]\r\nVia :  [[method_name]]\r\n\r\nTransaction Number : [[trx]]\r\n\r\n\r\n----\r\n\r\n[[amount]] [[currency]] has been refunded to your account and your current Balance is [[post_balance]] [[currency]]\r\n\r\n-----\r\n\r\nDetails of Rejection :\r\n[[admin_details]]\r\n\r\n', 'true', 1, '2021-07-11 00:37:21', '2021-12-27 22:12:10'),
(15, 'Withdraw - Admin Approved', 'withdraw-admin-approved', 'Withdraw Request has been Processed and your money is sent - [[site_name]]', 'Hi [[user_name]],', 'Your withdraw request of [[amount]] [[currency]]  via  [[method_name]] has been Processed Successfully.\r\n\r\nDetails of your withdraw:\r\n\r\nAmount : [[amount]] [[currency]]\r\nCharge: [[charge]] [[currency]]\r\n\r\nConversion Rate : 1 [[currency]] = [[rate]] [[method_currency]]\r\nYou will get: [[method_amount]] [[method_currency]]\r\nVia :  [[method_name]]\r\n\r\nTransaction Number : [[trx]]\r\n\r\n-----\r\n\r\nDetails of Processed Payment :\r\n[[admin_details]]', 'true', 1, '2021-07-11 00:37:21', '2022-01-02 12:57:10');

-- --------------------------------------------------------

--
-- Table structure for table `exchange_logs`
--

CREATE TABLE `exchange_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_from` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `price_was` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `type` tinyint(4) NOT NULL COMMENT 'Running : 0 Complete : 1',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Running : 0 Complete : 1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exchange_logs`
--

INSERT INTO `exchange_logs` (`id`, `user_id`, `from`, `to`, `amount_from`, `price_was`, `type`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'USDT', 'ETH', 1.00000000, 3100.16000000, 1, 1, '2022-01-19 16:56:02', '2022-01-19 16:56:02'),
(3, 1, 'USDT', 'BTC', 0.00100000, 41940.62000000, 1, 1, '2022-01-19 19:01:55', '2022-01-19 19:01:55'),
(4, 1, 'USDT', 'BTC', 0.00200000, 41939.74000000, 1, 1, '2022-01-19 19:02:07', '2022-01-19 19:02:07'),
(5, 1, 'BTC', 'USDT', 0.00100000, 41927.81000000, 2, 1, '2022-01-19 19:02:17', '2022-01-19 19:02:17'),
(6, 1, 'USDT', 'BTC', 0.00100000, 41926.63000000, 1, 1, '2022-01-19 19:02:30', '2022-01-19 19:02:30'),
(7, 1, 'USDT', 'DOGE', 1000.00000000, 0.16360000, 1, 1, '2022-01-19 19:02:53', '2022-01-19 19:02:53'),
(8, 1, 'USDT', 'ETH', 0.01000000, 3120.76000000, 1, 1, '2022-01-19 19:10:15', '2022-01-19 19:10:15'),
(9, 1, 'USDT', 'ETH', 0.30000000, 3121.98000000, 1, 1, '2022-01-19 19:10:28', '2022-01-19 19:10:28'),
(10, 1, 'ETH', 'USDT', 0.00300000, 3124.56000000, 2, 1, '2022-01-19 19:10:56', '2022-01-19 19:10:56'),
(11, 1, 'DOGE', 'USDT', 200.00000000, 0.16310000, 2, 1, '2022-01-19 19:45:36', '2022-01-19 19:45:36');

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` int(10) UNSIGNED NOT NULL,
  `act` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcode` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'object',
  `support` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_values` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `updated_at`, `created_at`) VALUES
(1, 'heading_section', '[\"Online Payments  \\u2014\",\"Pay Online\",\"Anywhere, anytime\",\"Besides its beautiful design. Bicrypto is an incredibly rich core framework for you to showcase your App.\",\"Know more\",\"Fast and Secure\",\"Commission free\"]', '2021-12-18 00:46:13', NULL),
(2, 'card_section', '[\"In-app\",\"Checkout\",\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro, recusandae tenetur!\",\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dignissimos eligendi esse, facilis fugit inventore iste itaque labore magni minima minus molestiae neque nesciunt nihil nobis nulla, quaerat quibusdam repellat sequi!\",\"Learn More\"]', '2021-12-17 20:28:54', NULL),
(3, 'gifts_section', '[\"Accumulate points\",\"when doing payments\",\"The More you Pay the More you Earn\",\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dignissimos eligendi esse, facilis fugit inventore iste itaque labore magni minima minus molestiae neque nesciunt nihil nobis nulla, quaerat quibusdam repellat sequi!\",\"Learn More\",\"Notification\",\"168.00\",\"In your favor for making payments\"]', '2021-12-17 20:28:54', NULL),
(4, 'security_section', '[\"Take a break\",\"You\'re all Safe\",\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus eius modi saepe voluptas.\",\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dignissimos eligendi esse, facilis fugit inventore iste itaque labore magni minima minus molestiae neque nesciunt nihil nobis nulla, quaerat quibusdam repellat sequi!\",\"Learn More\",\"You\'re Safe\",\"Just smile\",\"All transactions are protected with e2e encryption\"]', '2021-12-17 20:28:54', NULL),
(5, 'wallets_section', '[\"Smart\",\"Wallet\",\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro, recusandae tenetur!\",\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dignissimos eligendi esse, facilis fugit inventore iste itaque labore magni minima minus molestiae neque nesciunt nihil nobis nulla, quaerat quibusdam repellat sequi!\",\"Learn More\",\"Lose\",\"Win\"]', '2021-12-17 20:28:54', NULL),
(6, 'features_section', '[\"Powerful Features\",\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed do eiusmod tempor.\"]', '2021-12-17 20:28:54', NULL),
(7, 'partners_section', '[\"Trusted by 13,000+\",\"Business Leaders all Around the Globe\"]', '2021-12-17 20:28:54', NULL),
(8, 'testimonials_section', '[\"Our customers have something to say\",\"They are the best, our customer want to let you know how Bicrypto is helping them to achieve their goals and how simple is to use it\"]', '2021-12-17 20:02:57', NULL),
(9, 'try_section', '[\"Are you ready to try?\",\"Register for free NOW!\",\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam ducimus ea facilis illum laboriosam, provident quidem recusandae sequi velit vero. Aliquid commodi eos esse exercitationem itaque iure iusto molestiae nemo.\",\"Get $10,000 Free Practice\"]', '2021-12-17 20:02:57', NULL),
(10, 'footer_section', '[\"a carefully crafted and powerful HTML5 template, it\'s perfect to showcase your startup or software\",\"facebook\",\"twitter\",\"instagram\"]', '2021-12-17 20:02:57', NULL),
(11, 'heading_titles', '{\"preTitle\":\"preTitle\",\"Title\":\"Title\",\"Title2\":\"Title2\",\"subTitle\":\"subTitle\",\"Button\":\"Button\",\"cardTitle\":\"cardTitle\",\"cardText\":\"cardText\"}', NULL, NULL),
(12, 'card_titles', '{\"Title\":\"Title\",\"Title2\":\"Title2\",\"Text1\":\"Text1\",\"Text2\":\"Text2\",\"Button\":\"Button\"}', NULL, NULL),
(13, 'gifts_titles', '{\"Title\":\"Title\",\"Title2\":\"Title2\",\"Text1\":\"Text1\",\"Text2\":\"Text2\",\"Button\":\"Button\",\"cardTitle\":\"cardTitle\",\"cardPrice\":\"cardPrice\",\"cardText\":\"cardText\"}', NULL, NULL),
(14, 'security_titles', '{\"Title\":\"Title\",\"Title2\":\"Title2\",\"Text1\":\"Text1\",\"Text2\":\"Text2\",\"Button\":\"Button\",\"cardTitle\":\"cardTitle\",\"cardTitle2\":\"cardTitle2\",\"cardText\":\"cardText\"}', NULL, NULL),
(15, 'wallets_titles', '{\"Title\":\"Title\",\"Title2\":\"Title2\",\"Text1\":\"Text1\",\"Text2\":\"Text2\",\"Button\":\"Button\",\"Status1\":\"Status1\",\"Status2\":\"Status2\"}', NULL, NULL),
(16, 'features_titles', '{\"Title\":\"Title\",\"Title2\":\"Title2\"}', NULL, NULL),
(17, 'partners_titles', '{\"Title\":\"Title\",\"Title2\":\"Title2\"}', NULL, NULL),
(18, 'testimonials_titles', '{\"Title\":\"Title\",\"Title2\":\"Title2\"}', NULL, NULL),
(19, 'try_titles', '{\"Title\":\"Title\",\"Title2\":\"Title2\",\"Text1\":\"Text1\",\"Button\":\"Button\"}', NULL, NULL),
(20, 'footer_titles', '{\"Text\":\"Text\",\"Facebook\":\"Facebook\",\"Twitter\":\"Twitter\",\"Instagram\":\"Instagram\"}', NULL, NULL),
(92, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"admin\",\"blog\"],\"description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit\",\"social_title\":\"Website Name\",\"social_description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit\",\"image\":\"61daf61a56f2f1641739802.png\"}', '2022-01-09 14:50:02', '2021-12-18 14:48:45');

-- --------------------------------------------------------

--
-- Table structure for table `frontend_images`
--

CREATE TABLE `frontend_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img7` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontend_images`
--

INSERT INTO `frontend_images` (`id`, `data_keys`, `img1`, `img2`, `img3`, `img4`, `img5`, `img6`, `img7`, `updated_at`, `created_at`) VALUES
(1, 'home', 'bg.png', 'person.png', 'gift.png', 'secure.svg', 'security.png', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` int(11) DEFAULT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supported_currencies` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_form` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `code`, `alias`, `image`, `name`, `status`, `parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `input_form`, `created_at`, `updated_at`) VALUES
(1, 101, 'paypal', '61c665d2b46641640392146.png', 'Paypal', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-zlbi7986064@personal.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:29:06'),
(2, 102, 'perfect_money', '61c665efc38b81640392175.png', 'Perfect Money', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"6451561651551\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:29:35'),
(3, 103, 'stripe', '61c6659301aec1640392083.png', 'Stripe Hosted', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51HuxFUHyGzEKoTKAfIosswAQduMOGU4q4elcNr8OE6LoBZcp2MHKalOW835wjRiF6fxVTc7RmBgatKfAt1Qq0heb00rUaCOd2T\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51HuxFUHyGzEKoTKAueAuF9BrMDA5boMcpJLLt0vu4q3QdPX5isaGudKNe6OyVjZP1UugpYd6JA7i7TczRWsbutaP004YmBiSp5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:28:03'),
(4, 104, 'skrill', '61c6660713f001640392199.png', 'Skrill', 1, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:29:59'),
(5, 105, 'paytm', '61c6661b2de5f1640392219.png', 'PayTM', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"bKMfNxPPf_QdZppa\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:30:19'),
(6, 106, 'payeer', '61c666699c7581640392297.png', 'Payeer', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.payeer\"}}', NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:31:37'),
(7, 107, 'paystack', '61c6668a8ce481640392330.png', 'PayStack', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_3c9c87f51b13c15d99eb367ca6ebc52cc9eb1f33\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_2a3f97a146ab5694801f993b60fcb81cd7254f12\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.paystack\"}}\r\n', NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:32:10'),
(8, 108, 'voguepay', '61c666aa9432f1640392362.png', 'VoguePay', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"demo\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:32:42'),
(9, 109, 'flutterwave', '61c666c2d34741640392386.png', 'Flutterwave', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"demo_publisher_key\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"demo_secret_key\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"demo_encryption_key\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:33:06'),
(10, 110, 'razorpay', '61c666edcaf4e1640392429.png', 'RazorPay', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_test_kiOtejPbRZU90E\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"osRDebzEqbsE1kbyQJ4y0re7\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:33:49'),
(11, 111, 'stripe_js', '61c66708c838d1640392456.png', 'Stripe Storefront', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51HuxFUHyGzEKoTKAfIosswAQduMOGU4q4elcNr8OE6LoBZcp2MHKalOW835wjRiF6fxVTc7RmBgatKfAt1Qq0heb00rUaCOd2T\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51HuxFUHyGzEKoTKAueAuF9BrMDA5boMcpJLLt0vu4q3QdPX5isaGudKNe6OyVjZP1UugpYd6JA7i7TczRWsbutaP004YmBiSp5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:34:17'),
(12, 112, 'instamojo', '61c6672b97e0a1640392491.png', 'Instamojo', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_2241633c3bc44a3de84a3b33969\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"test_279f083f7bebefd35217feef22d\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:34:51'),
(13, 501, 'blockchain', '61c66749ad8111640392521.png', 'Blockchain', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"55529946-05ca-48ff-8710-f279d86b1cc5\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:35:21'),
(14, 502, 'blockio', '61c66790207ff1640392592.png', 'Block.io', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":false,\"value\":\"1658-8015-2e5e-9afb\"},\"api_pin\":{\"title\":\"API PIN\",\"global\":true,\"value\":\"covidvai2020\"}}', '{\"BTC\":\"BTC\",\"LTC\":\"LTC\",\"DOGE\":\"DOGE\"}', 1, '{\"cron\":{\"title\": \"Cron URL\",\"value\":\"ipn.blockio\"}}', NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:36:32'),
(15, 503, 'coinpayments', '61c667a7de1121640392615.png', 'CoinPayments', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"7638eebaf4061b7f7cdfceb14046318bbdabf7e2f64944773d6550bd59f70274\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"Cb6dee7af8Eb9E0D4123543E690dA3673294147A5Dc8e7a621B5d484a3803207\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"93a1e014c4ad60a7980b4a7239673cb4\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:36:55'),
(16, 504, 'coinpayments_fiat', '61c667bc45ab91640392636.png', 'CoinPayments Fiat', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"93a1e014c4ad60a7980b4a7239673cb4\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:37:16'),
(17, 505, 'coingate', '61c667d91b2721640392665.png', 'Coingate', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"Ba1VgPx6d437xLXGKCBkmwVCEw5kHzRJ6thbGo-N\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:37:45'),
(18, 506, 'coinbase_commerce', '61c66803a01d01640392707.png', 'Coinbase Commerce', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.coinbase_commerce\"}}', NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:38:27'),
(24, 113, 'paypal_sdk', '61c66817e8b081640392727.png', 'Paypal Express', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:38:47'),
(25, 114, 'stripe_v3', '61c6684075a361640392768.png', 'Stripe Checkout', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51HuxFUHyGzEKoTKAfIosswAQduMOGU4q4elcNr8OE6LoBZcp2MHKalOW835wjRiF6fxVTc7RmBgatKfAt1Qq0heb00rUaCOd2T\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51HuxFUHyGzEKoTKAueAuF9BrMDA5boMcpJLLt0vu4q3QdPX5isaGudKNe6OyVjZP1UugpYd6JA7i7TczRWsbutaP004YmBiSp5\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"w5555\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.stripe_v3\"}}', NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:39:28'),
(27, 115, 'mollie', '61c6685e07cf31640392798.png', 'Mollie', 1, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"admin@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2019-09-14 16:14:22', '2021-12-25 00:39:58'),
(30, 116, 'cashmaal', '61c6688089caf1640392832.png', 'Cashmaal', 1, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.cashmaal\"}}', NULL, NULL, NULL, '2021-12-25 00:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_code` int(11) DEFAULT NULL,
  `gateway_alias` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(18,8) NOT NULL,
  `max_amount` decimal(18,8) NOT NULL,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_parameter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `sitename` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `referal_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Off : 1 , On : 1',
  `cur_sym` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `profit` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `referral_bonus` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `practice_balance` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `sms_api` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(4) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `sys_version` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_cron_run` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coin_api_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coin_rate_api` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_fee` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `practice_wallet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `sitename`, `cur_text`, `referal_status`, `cur_sym`, `profit`, `referral_bonus`, `practice_balance`, `sms_api`, `sv`, `sn`, `force_ssl`, `registration`, `sys_version`, `last_cron_run`, `created_at`, `updated_at`, `coin_api_key`, `coin_rate_api`, `exchange_fee`, `practice_wallet`) VALUES
(1, 'Bicrypto', 'USD', 1, '$', 87.00000000, 3.00000000, 10001.00000000, '', 0, 0, 0, 1, NULL, '2022-01-22 07:05:03', NULL, '2022-01-22 07:05:03', 'd0f19511-e2d4-47ea-93c8-9fdecd7354ec', '314216e4e3e15c286e1e1752e1f98cb9f0ac9027c337062c0cb8bfa9898c2792', '4', 'USDT');

-- --------------------------------------------------------

--
-- Table structure for table `global_metas`
--

CREATE TABLE `global_metas` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `extra` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` int(10) UNSIGNED NOT NULL,
  `userId` int(11) NOT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `documentType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `document2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `document3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reviewedBy` int(11) NOT NULL DEFAULT 0,
  `reviewedAt` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(71, '2021_12_18_023122_create_admin_notifications_table', 0),
(74, '2021_12_18_023122_create_commissions_table', 0),
(75, '2021_12_18_023122_create_crypto_currencies_table', 0),
(77, '2021_12_18_023122_create_crypto_currency_prices_table', 0),
(78, '2021_12_18_023122_create_deposits_table', 0),
(79, '2021_12_18_023122_create_email_sms_templates_table', 0),
(81, '2021_12_18_023122_create_extensions_table', 0),
(82, '2021_12_18_023122_create_failed_jobs_table', 0),
(83, '2021_12_18_023122_create_frontend_images_table', 0),
(84, '2021_12_18_023122_create_frontends_table', 0),
(85, '2021_12_18_023122_create_game_logs_table', 0),
(86, '2021_12_18_023122_create_game_settings_table', 0),
(87, '2021_12_18_023122_create_gateway_currencies_table', 0),
(88, '2021_12_18_023122_create_gateways_table', 0),
(89, '2021_12_18_023122_create_general_settings_table', 0),
(90, '2021_12_18_023122_create_kyc_table', 0),
(93, '2021_12_18_023122_create_password_resets_table', 0),
(94, '2021_12_18_023122_create_personal_access_tokens_table', 0),
(95, '2021_12_18_023122_create_practice_logs_table', 0),
(96, '2021_12_18_023122_create_roles_table', 0),
(97, '2021_12_18_023122_create_rssfeeds_table', 0),
(98, '2021_12_18_023122_create_sessions_table', 0),
(99, '2021_12_18_023122_create_subscribers_table', 0),
(100, '2021_12_18_023122_create_support_attachments_table', 0),
(101, '2021_12_18_023122_create_support_messages_table', 0),
(102, '2021_12_18_023122_create_support_tickets_table', 0),
(103, '2021_12_18_023122_create_transactions_table', 0),
(104, '2021_12_18_023122_create_transactions_wallet_table', 0),
(105, '2021_12_18_023122_create_transfers_table', 0),
(106, '2021_12_18_023122_create_user_logins_table', 0),
(107, '2021_12_18_023122_create_users_table', 0),
(108, '2021_12_18_023122_create_wallets_table', 0),
(109, '2021_12_18_023122_create_watchlists_table', 0),
(110, '2021_12_18_023122_create_withdraw_methods_table', 0),
(111, '2021_12_18_023122_create_withdrawals_table', 0),
(112, '2021_12_18_023123_add_foreign_keys_to_transactions_wallet_table', 0),
(113, '2021_12_18_023123_add_foreign_keys_to_transfers_table', 0),
(116, '2018_05_28_224023_create_blog_etc_posts_table', 3),
(117, '2018_09_16_224023_add_author_and_url_blog_etc_posts_table', 3),
(118, '2018_09_26_085711_add_short_desc_textrea_to_blog_etc', 3),
(119, '2018_09_27_122627_create_blog_etc_uploaded_photos_table', 3),
(120, '2018_11_05_055256_create_kycs_table', 4),
(121, '2019_05_05_123232_create_referrals_table', 4),
(122, '2022_01_17_083119_create_general_settings_table', 0),
(127, '2022_01_17_084423_create_admin_notifications_table', 0),
(128, '2022_01_17_084423_create_blog_etc_categories_table', 0),
(129, '2022_01_17_084423_create_blog_etc_comments_table', 0),
(130, '2022_01_17_084423_create_blog_etc_post_categories_table', 0),
(131, '2022_01_17_084423_create_blog_etc_posts_table', 0),
(132, '2022_01_17_084423_create_blog_etc_uploaded_photos_table', 0),
(133, '2022_01_17_084423_create_commissions_table', 0),
(134, '2022_01_17_084423_create_crypto_currencies_table', 0),
(135, '2022_01_17_084423_create_crypto_currency_prices_table', 0),
(136, '2022_01_17_084423_create_crypto_pairs_table', 0),
(137, '2022_01_17_084423_create_deposits_table', 0),
(138, '2022_01_17_084423_create_email_templates_table', 0),
(139, '2022_01_17_084423_create_extensions_table', 0),
(140, '2022_01_17_084423_create_failed_jobs_table', 0),
(141, '2022_01_17_084423_create_frontend_images_table', 0),
(142, '2022_01_17_084423_create_frontends_table', 0),
(143, '2022_01_17_084423_create_gateway_currencies_table', 0),
(144, '2022_01_17_084423_create_gateways_table', 0),
(145, '2022_01_17_084423_create_general_settings_table', 0),
(146, '2022_01_17_084423_create_global_metas_table', 0),
(147, '2022_01_17_084423_create_kycs_table', 0),
(148, '2022_01_17_084423_create_password_resets_table', 0),
(149, '2022_01_17_084423_create_personal_access_tokens_table', 0),
(150, '2022_01_17_084423_create_practice_logs_table', 0),
(151, '2022_01_17_084423_create_referrals_table', 0),
(152, '2022_01_17_084423_create_roles_table', 0),
(153, '2022_01_17_084423_create_rssfeeds_table', 0),
(154, '2022_01_17_084423_create_sessions_table', 0),
(155, '2022_01_17_084423_create_settings_table', 0),
(156, '2022_01_17_084423_create_subscribers_table', 0),
(157, '2022_01_17_084423_create_support_attachments_table', 0),
(158, '2022_01_17_084423_create_support_messages_table', 0),
(159, '2022_01_17_084423_create_support_tickets_table', 0),
(160, '2022_01_17_084423_create_trade_logs_table', 0),
(161, '2022_01_17_084423_create_transactions_table', 0),
(162, '2022_01_17_084423_create_transactions_wallet_table', 0),
(163, '2022_01_17_084423_create_transfers_table', 0),
(164, '2022_01_17_084423_create_user_logins_table', 0),
(165, '2022_01_17_084423_create_users_table', 0),
(166, '2022_01_17_084423_create_wallets_table', 0),
(167, '2022_01_17_084423_create_watchlists_table', 0),
(168, '2022_01_17_084423_create_withdraw_methods_table', 0),
(169, '2022_01_17_084423_create_withdrawals_table', 0),
(170, '2022_01_17_084424_add_foreign_keys_to_blog_etc_comments_table', 0),
(171, '2022_01_17_084424_add_foreign_keys_to_blog_etc_post_categories_table', 0),
(172, '2022_01_17_084424_add_foreign_keys_to_transactions_wallet_table', 0),
(173, '2022_01_17_084424_add_foreign_keys_to_transfers_table', 0),
(175, '2022_01_17_083209_add_api_to_general_settings_table', 5),
(176, '2022_01_17_115915_create_users_table', 0),
(177, '2019_12_14_000001_create_personal_access_tokens_table', 6),
(178, '2022_01_18_165901_create_wallets_table', 7),
(179, '2022_01_18_173655_create_users_table', 0),
(180, '2022_01_18_183516_create_wallets_table', 0),
(181, '2022_01_18_194013_create_practice_logs_table', 0),
(182, '2022_01_18_194043_create_exchange_logs_table', 8),
(183, '2022_01_20_115437_create_wallets_table', 0),
(184, '2022_01_20_115503_create_exchange_logs_table', 0),
(185, '2022_01_20_122045_create_general_settings_table', 0),
(186, '2022_01_20_134553_create_settings_table', 0),
(187, '2022_01_20_160643_create_crypto_pairs_table', 0);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `practice_logs`
--

CREATE TABLE `practice_logs` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `coin_id` int(11) NOT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `price_was` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `duration` int(11) NOT NULL,
  `in_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `hilow` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Rise : 1 Fall : 2',
  `result` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'win : 1 lose : 2 Draw : 3',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Running : 0 Complete : 1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_bonus` int(11) DEFAULT NULL,
  `refer_by` int(11) DEFAULT NULL,
  `refer_bonus` int(11) DEFAULT NULL,
  `meta_data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', NULL, NULL),
(2, 'User', NULL, NULL),
(3, 'Demo', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rssfeeds`
--

CREATE TABLE `rssfeeds` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `date` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rssfeeds`
--

INSERT INTO `rssfeeds` (`id`, `name`, `url`, `date`) VALUES
(1, 'Cointelegraph', 'https://cointelegraph.com/feed', '555'),
(3, 'Bitcoin news', 'https://cointelegraph.com/rss', '555');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0tLFgWYEz8uZohkVTCB4Z4F9MKhh4gzZQUUFRGcY', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGdSUkJHZmlkbWczOWFaMXpuQXVwdFdDOWZ1dUZrM3k2b0xEU3kwYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834262),
('1APgxv4q57M5y8ijfuJNQX5BNvWvUmpkxSwpEzdc', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXhwd05RZ1AwOFBkZXdpYXQxMm55clBvRW8yRVNPUnNGNmV4RmNRaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833362),
('1FU0xVpdBtSZNrdyPm7xe2r0gUigGs5WifnFIDsa', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHlxVERlU21Nb2lpaG10TVd4Mlh2c3VhQnNsSEJJRVFIRmdOQkZEeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642829581),
('1Lr4szu05V8qWOt5oJRPnEuNR5qBHF3U41KI0mDV', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWg0TUtkV3lEb2hxb0Nqa2hobUFPOUpSUzlFemoxWjJrTHNlT2N2ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827721),
('2imNSVxK0OcM4oSHGCc9tNH9ikXVbV0Qdycj821A', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDQ1d3ZOTldSUVYwdlNYaXhQOTR5SXJZS25hN0pQeUE2VjhIeHhhRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831142),
('2SBJv7f0j24qVBEAuhRhbMxSCXlHb4vHOVtVwE6L', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicU1hT2VpUWU1ZmtLMnRNUmxIYk9CSWtTWjNzMlRFRUtzbUg0MWxtZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833242),
('2v9wUgqOmnCMI4GUxLd3KFsGl1cb0tCehqs2LuFy', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWpwdHpFbUhBRGRVYnBXZWszTUFtZUtydXRoMUJyWTBCbFlVN0Y3dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831321),
('3Lh20IJPOup9Wiy6fWPVOgyJz4jx8F7Mw2A8cBcq', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnRDVkwwRnhlYk01cnMzOUdJTXk1cWZQb0xMWjV1bm9yS1hGVmluWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834803),
('4B6JjOpaADNwm2RI9IER1pz7WFSGyQutpTxc5Ug7', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkFJdW05V2k5QUJVUTVZOFFlM2lRczdOODlBTlFVZjI1RWFzNU94USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828322),
('4FfvPYZ1T6FkTLTqSdd9AheZiqEIiitMIdWfuwy2', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTBEaU9udlFWNGJTMkF0eE53TU1MRzRRTVRoNzJPb1ZGRGpLY0Y3aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642832282),
('4USwtFByKMhN5KHpAngttIVavsjhs8aP9Y5vuCpn', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0xQVVNEYXlzOG02OEJrQWhtbGJ0QUhCZ3BGeHRvNUFQYlFXbWg0RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834622),
('5dcb8TIT6mwSNzl5ASR0zewDJhGHC6Y5H3UulBGY', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmtoUElMS0VXaFpTY1Z2NHRzRUVKYzNOeEVZaG5jR2wxTXU4R2hhUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831682),
('5upTBTFUgyy3WoUHo695dyicxRVr1a04mqcSKnfk', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2VUZEw1SFBtN2MwbERpWmU5Umh1c2VMZmZ2ZU1VSzl3UVdvRzhpSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642832461),
('6e09IfPgZPQ8G1fRLXze9dmLFs0MAqBA9YsJXRkQ', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnpZN1Q1MG5tYUJSN2ZJZ1d5ZGJOTlg5VTQ3bEgwVTBHMTE2V3VqUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642829281),
('6HOp5drXWkq0iBOlR1Xxxl095hszt11tUc6YGttt', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDh5VDBOZ1QzdHpEMU95ZW91Y1ByT3lEcHBQMUV1ZDUyQjJUczlVMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834022),
('79jOcN8lPBlaLXPDFJVL1RhTPzO0di3VnsewHqC8', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGRrdXMycTM3T1A0V3E4RHg0dTN2VW1RMUN2ZVMzZGFQVnNCSndjSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834142),
('7cRuYP6SjVuUjopiGXRfE2CFyyFzlVd0ARRmCgXc', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTHVSNkZKbm8yTmhYeHJScGU2aWN3ZzdaNGNKS0Qxb0xKYkcwaUswayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833482),
('7rac3pTa7HBybQRw4NA1hRdohSxnRtUmtFwkR6kz', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1prbXQ5MlhwSmh4eXVsS01iNkg1a3RMd2dHdGJMa0UyMTVVOE5vZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642829702),
('88ivmoZq1RyHOfi5nAL6TZhN1apBgHFExgM6VuB1', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHFoZXZkQ3ZSdUVuY2UxV053WXBLWmNRQnlPU0xVeXdOakVibXI0MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833062),
('8WHs9buxJiZNSrqzzWHSH9HgJ0nP1zqPh5ypmQKh', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWlkUU9oa0g1ekxhYVMwZzN4QjBWZ0lhdUJEY2FlQVcwYmhzRFR1MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833122),
('93AkvPUYCWIYUwE5euf8gAVn5OTsf3buWnP1kwxl', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFVEN09vRVRRR3ROMjJta0MwaU5TdFJ3T05UWEoweGZqT1htd2g1QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828203),
('9fvoqQTbVkJ3gLa3bEpk0w7VoVt8hPKvaSNv2KD7', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWtGMTRjSkJOZ0JveTZYNEJpdFV2OXJzNDBXSUF6cFJBZjlzVW5mQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831622),
('AaZ5NH1IapuwivvMwenfaJQWm7FZ1rukveKJByuu', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmFxendGVEJuMkNHOVhHTzdDUVBmQktTUEUzZnZwYklVOGZPVkJOcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827662),
('AGtnKGICV6sITEWc0X8qo04riCptTu7S9JeG0siI', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMG5iaHZzc2pwc1B4RFd4cDZJcW1ZZm9LN2ZhbkY4OWU0TVV6NXRVUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828561),
('AsstOwsVjicfKbkdNXAQOxNPTFKWaEQKo3v56V4p', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0JmNmlHSW0wczVPQ21OQ2lOUlZoTWFRdjJ6aWw4NDhzaTEwMHdUSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830482),
('aylXRyPT6C3etB6gBQCUpvWWHcgCfAh5163H1CCH', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNDNWaXI1M0dVcE11MmlRaWk4V2pHR3FjdTZzVGFWdkJGRDA4RXRuSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642829402),
('BI4QHHb8VrNiMgCHpP1WpVAYLyvrvTskACrtrkGX', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmh1Z3I1UVlDZkp6cjJYWDlUSFZVdHpzdmZvUlNKQjk2cUw3WWNsZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642829641),
('boS3oGXBkYLXEj90mOiBr9Gl5cN2gyehPl1QwICa', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDJZSUhaVzAzbTlKVlBkR095bmg1YkZGTjh5RUhMMFFoUGhoODROUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831081),
('boyUPmYQK7kuucwd7dHJxbovA5oQEFAPkr90GssY', 1, '116.107.59.22', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiN2ZtUlBza3ByV0QyaFZ4c082Q0szbG1UV1h4NFR2Z29tWlRMSWVqNiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI1OiJodHRwczovL3Rlc3Quc2FsZWNvZGUubmV0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJENLUEdMRi9jc3MuOUQxNWt5VFV0TS5ISDBnTENCVGFvTWhWODZkRkJZYklieVFjV1dmNTRHIjt9', 1642835095),
('Bw2yKrEvtNzrh9i3yX4rrkdxYzw4H5qkiYJwvMeX', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHVGYjJBa2NqR2JCZ3ZoSWdJUWJWSG5Bc1ZKWWp0aUliRFNxRTJubCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827961),
('C7lsRWC8SNbji1rztxHqT8yPon4aSixSgD0WiGuA', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUU5QazlqWXZEWW1JWTZJSzdub3dLa3VrV3FIRWtOMXpKTWhQeXJvaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830302),
('ccoxMtHojmnHwa2s0cU0S4Al6z8XWByfNvlEhzg7', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidjJPd2R1UVZBMVJiOEp6QmtYeFlaV2E5aE5jcEcxZHBkdjJtbWExWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642832402),
('cj7uy81Ol9WVscrhRNpiVhZfffqVUhyEAUvvVA8Z', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzdiemZpOGFmTGFFZmxoMzBGbjY4dlhHQ2U1SU11cU92dHJLcGNiTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642832762),
('CNBURpO9iOAUZUUO666gObHdTEIO562DiFlU1OhX', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlNPdnluazF5cU9seUMxeldTV2dESUlma2ZnOWxMU3R0MzQ3RFdjMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642832041),
('cUQvRb0EvIupSvjGBi4uWJITRwRpxsbcCihxgPDQ', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXpJMm9lY09CbGwzRXlBZXpLTDZXTEpncEhYM0I1SWhXV241Z05oZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831441),
('CzAttUQp758xNIoc2pSnDRgrJbb2zBjf0NIQlgTw', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzFVcUljRzl2a29Qa3NKcWdPcU5nRldvRmtzT28xZGlldDNOcnV4eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834922),
('dbVzf9fLnpTZIN0snHibht24AzDR8jSv3NEHEUib', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFNCTDhWMHFwWkZoZWp5cDlCZzJxOEc2V2V2RUZzWEZxYks0YnFMcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831742),
('DdBi3Y2L9ppRKKbB8UEcWwsGeMsm1F2rrhBX6Wud', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3BDeHpPd1FjU2hza2podVFKZE45WkZpaVA4R0NqWUJIU0V5dlJKUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642829041),
('dFUNr3xGzNR40XvyjlrSyYULAtKdqKsPcFJd239l', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXlhZEZWcU9WRjFueUpzUVROazFJb1lYbmltT3U5QmhPa0xoRGM2TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831382),
('DRpSHcwekugTfjCZjus3sC54bDjhzPa8NgFsv5fU', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHNmSzVmY0xnUjBtNkl6bm5RdkZ6azR4Q2FwUjMwNEZJYWhaV05RSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642832581),
('DSyNH9jzWbSknBPWQDD2BnNGoqUYkhM7HLDj6rMB', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlRhUlQ0RHdDOXVXRUdZSUYzajJad2pMcEtGUzk3czBWaXZNeHRFNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828441),
('DyQCkgSgfDBhSI72EPicoDZQsuhI5le4M7uNUj0c', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGM5M0E5Nm5YWDV5R29wVERNOGVOaTJ6SlZlUEdGeW14NDByYVRkcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828622),
('EBUWVZ0JJLFgbpkfa7NOmvmrAjMxiuEiGmO7IgOc', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFgzRWZ0UlNmT09DRHpBUTI4NnoxYWpZS1gxNlF6UmNlaTI4NzF5USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834741),
('EugGJhwCE30XRIA2Bp6ITOXU23DSNsUZhGwlSmvs', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTHYwTDRNWXJGNzBuY2p3M3B3c3dwcGtqZ2pHYW9kZHZQNU1JQXRuQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828021),
('F3d26tWPxHu4QNCKzColdI0VZyOZ4QOWK6DHs8bY', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibzhmUXdlVTZRZzJUV3NSdUxhTlZ1QklJQURxQnZVa0RuRmFtcDh0WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831203),
('FDQ3rdBpAkawhqTXXtTP7bXO96xB5iGte31TGswh', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1dFcEwzZEh2dXJBcXlObHF5Z2c1eERoMXZvdEpkNUduRGJ5eHhvayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828802),
('FK9YvJy9zaNZzr8sh8Lg0NaF3FqrSFpfVQCNEgVd', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1lUWWd4Z1RldzgxNFF6Zmc4cXlXaVc5U09xY0VyME9vWHF6RWxNOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830181),
('fmlYoMI4mhtFOOTAjrUGpnfPLy91mwYuc07RHApQ', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGNaRkw0cVF4N1ZwYTdWNmJVUnkwS1NKZkpON3cyeU10Z3hxckc5ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833902),
('FtenbzoQ2WtDa5pDTWUvxzAQDJSHmzu3X0BZ2pX8', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielR3MDZVMHVOUld1djNHZWFVWWtRZHB6czRLTEZGZm5MeW5OWVBFMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833181),
('g04AkIHs5215truRdbKhSwZDQlBIqa8Y0Wmy1xpF', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0FTREdocXNKeVlMZDJhYnluMkROcjhSbDBqaG1HZFNVcFRxMWpiciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831021),
('G8HBUy3wypm8FVUyMTt193vFNg8LO0ihjaJhb7rq', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2FkWGdvYXluckpNdzZ5TWtKTnVjd3ZDN3Fmc0hLTVFkOWdhY1NBRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827782),
('G98Nw7KngoIMP2XvU7vRVmwCERDmtdMv0rB5RFXo', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0VVTFQzbmFsdzZFNk1nOFRLTkNoeVc3R1JKdUM5RWFMdkZ1ak9mRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834202),
('g9MCw6NtwimEQ0vpI0tcAASH48PmuBmUAA669rZl', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWt5RVVxTTdqMktlbkpMamVDWlRqOW9pNlFmaExJUVBQUVFzM0JQVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834502),
('GtkAzUM0fBFNFdvE5oA2GtYEJvtSeTAQZTCSxgHH', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWp1dzgzeUcwWVNuS2F6Z01DZzdSWHRmUEhNeVNvaFA2Zm5KaURESCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827902),
('iLSZV7NfkOFtKxfzt6ta0C2wo4OXw2wT1nLGl2ez', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGdnSWRmazY4WHZwTzBJUlJScU9oMkY2djN4M3IwekpyMHZBc3dTRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834982),
('IMFxHCmZhZarYuhHagKyz9MYk6HMzEeABKxPhpa4', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQldzdks3SkdoenJ1Rm9qckZrMFZuU3Q2RWttVEJvM0k4aEtybDI4bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827241),
('ImSGOjfQc4t6PKkzJRl9axHd4EMiWDLbu6t91vMO', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmVMQ3BxWG1GaERlWFBzRTRaQUw1bXVmdjUyQzYwdkJCUGk3bzJ0NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642829102),
('iVxCbAztfIvE45SjE9beBuvrDYA5UqLF3iB7RZsx', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1VCd1Z1ZzZlQVlkOFpBT0tiY3ByR2dxZjFhWFR3c1JFMmc2MnZqQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642832942),
('ixJE1RKHZjeOjrzXRqV1xFaQgnblqdKsrL5j9Ys2', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMks1U21sbVc4M0lPQmlCY2FpN2I0aE45OGYzSU9ldXZWT2NoY1EzViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827002),
('JBTSEtl0N7tm0tBqj7fevepHhZnTUGIV6P6oSOg5', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0tPeHNqSGdjbTRoUGE0dG5USzVBRTJpWVJ2N0dFQWxSeG1VWkVNbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642829342),
('JGTKziaunQJd8Do45Ai4FFO2BawpLIfyUJmweFwl', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXhyakZFQ1NvVWVMS3NBN0oyS09Ud0RYbmZMOHVkc045UVNxQWI2eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642826703),
('js4wYjniOWmt8bSMdLqMFlObU3Q1y5T9zpvTjH7y', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTHZkSEh1bFV2RmQyRlNJZFc3em56a1pncXNJUGFuQUp4eGUzRjZIayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642835103),
('jVCXJSzVCaPIWa6D2XprCUyTGN964hYzWdOeIIEC', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUFlQURHN1NDOHdRTGtWTW90WnpuYWRXanNGd2poTlBEbWJ1ZDVxYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831503),
('JVYzGJ1XKoUrbjHPoyQG3lUN2pFHINz7vCRQS1mR', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWF5VktVbnU4WWZQSkY2SnBBSk5NMGFCMVFUT3JFMUlGU0hqNGM4ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830062),
('jz9plRV4yzNkNeou84ryJlpvPxItDMV9UEhyanwQ', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFBwdWdCYXZscGFDMDZ3ZTRJQ1lRTGppQUk1Skx5azFLMGpLVEt4UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642826881),
('k4NaZuRtVruFxAD4mtIf0UaGP3G6HGA3jp9uO39E', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXkycGFTanVyb2RINlhSMG5xWmhCS3FsbnZQT3FsVUpzRjNrVGM0cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833541),
('KOhEHPdoEOu1WDtSpsTuvV1lCJKJdSM4UmF6HwwZ', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEs3Z3BLZ2MzQWJNZVlHZFBaZFNIUXByR1hWRGwwMnozdGxjVXU0NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642832342),
('KSyug6QCUBHrcTFw3BLveIaIpmTYngM76Lxs3b2x', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianZ1ZkY1N3FPaU01eDZ2aThZY0tGQkxOc0ZvWndFdXZOZThWQm5TaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831262),
('KURi3xmPyT5l388nCZ4jC553E2GaVryLslVFlFNI', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXZVM0hva0FQQ3lZQ1U2T2Jqb0V2V25EMEpGS1Q4SkxXQjNJOWsxdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830002),
('l3LLoiO2mma6eEOeprRjjvaeRfrY2l2tXhIXk4vM', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEhZaFRpR1BlNTlXNEpwUFUycXRmQzZGOUlmOGVFdEcydUlHUjF1RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828381),
('LmivnsPOuZHEhpBDQ9iv8NuptGa4VgclxCRP6bRP', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3RjR2dFTUoyOVZUczN2V012b1JQMVJhbWFMQUVEd2RVcDNGNjVrQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642829942),
('LTssPHTUJGqLKO6U0mWGsY36uh1ripVTBMKo3bhA', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGMweVpjZWZOcFpQSVFsUG5LOTN4R0lZUXczWDRKeFE4VlZjbVRJdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827122),
('LULn5tuMXLKi2mh8G9hTQiyTxYdnW9mXdyCAc67p', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTdnd2ZERmx3OU16RWNSTnRZMXNDaUp6WjhYcTVOSkxnSnVHTkdtMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642829222),
('mjMdxTWuyuhquGUY1ln0t6781OhqSxZNtJkc7XeD', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1RGTXlINHhMWmpDUDZKOUZWS0FhU2p6a3FnTHlpWDh0SGxwaDJCUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642829462),
('mLQkLo33gYzJTOYMDuNAE2cXF2zku8wKHCACPcAN', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVNLUFd3dWhzcnhIdDAycXRpNmNodjFVMmRUcUdrdmVzenJkTGRVaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833302),
('mQ1pJoxWWOar8JadpKzfDRmaufFf2gkKU5m5y769', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2xuaWRLYTVLMTg1c2VWNWVoS3J2aVhDd3RqN0M3Z0l2N0d3MUxWZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834862),
('MqRm5nDODbG6FIBVnvUyzTKrl6F2skNHUOZscF5b', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialoxMG42TmNtVmFydmd5d2w2QzBiYUlROEc1NHR0dk1SMDhWZ05IdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830121),
('MSgxDynfplLS8fZukQIDFvVA1pkRM2R6MZ7x6Xka', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUJmYkI0eWtOM0FoQUk4ejBHME1jbGVRcXpJQ21zY1NoSDhiNWNFNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828861),
('N2smq9ZddhCsYeIZxQgrBL50TDJT1rbh9MtBNWR5', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWG5NT2hNMTRkcVg2RElXdkJrZDdpdUdIeEN1N0VJdmhndHJtTUFOViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830722),
('nNakkO3JExut3NfcBVUlLdNijFPACQxOIxPXuiaT', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTdaazFMOHNSQVpQZElpZEdXaUVQNDNjdmlFdkF4WnMxTG1lUjF2YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833661),
('NQK8wy5aYxs1kAOc6WNzRd7hQG5iKGry2Lpia2hW', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDl3MEJkTXFNQ3VhcGpBaGZwT25xdnozQlVRQXJsUk1PY1JoNmNISSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833961),
('nvIPTJd5g0OZCp4ixJu58wDItoXkImcWYATpQWxC', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialdmdmI5d1JGZEdUYVhETnQwaTl3YXRydm1GWGxUVXZHeWk3c2NPTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831561),
('ofOcyOJFPswApn0tdbJJ956WZCM46BgCDbDK6Xim', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTlTT29ua2xiMTBPQlRNME9La2QzaTNPNjd0b2puOGZpMXhReXg1ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642832522),
('ohXG4pLYwSw2ZWK8gTqzYAKFPBLqGRe4jkFvzmTZ', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3Bkc1JDbTlISjQzTkxObFloRGFIbW8yMWdXMkhaVGdoZE84dDVvbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831921),
('ooff3JwNQXkS12l5swxg4lcPtjrRE5o8Yds1Ccho', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWJLRHpvdnFOYTlzZzFNMGVrbXljRjlDQjJvU0xTN2lDREZlZkRHdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830603),
('oS13qIylyP2Ss4KdTlimxBOjVa8JBX8OgxdN2qxG', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWFYMDV0VW56TnVScVl1QnV0SWpidnIxS0xxSElRV0xXSmpnWVB3dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642826821),
('oYZT5U8MKWtSqCWTZlxC2YKIBw4gFZKtNPeRhMRF', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmc2QjVVb0d1cGN0cUpQQXRLZ3Q2cFp5U3VZMUJva1o3N3B3RTkwYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827302),
('OZGUuhAtsRd9tdOEhCuajbpLijbGCQj1Y3MYZJ86', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEpWb0NnSmNWVU1lNkVlZ2pQZkk5RG56Mk9tQWU5cUV0bUVYZldmcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642832641),
('P2nksrRUg13LMTvKe9FtbXJOnofxeHiCGPP4dgz6', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHphVE96VkxVWlFwYVAxWFBsTEI4cXZvOXM1Vmk4UGVRT2l1MVE0ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642829882),
('pb01XazE7Efx26QXwDrIZUONB7d4opIFo4vOMsZ2', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmtLbUtGbFBQcjRhNlRNNTBwNHVDdVkxS3ZVam5oQVFQaUE5dmpMSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642829822),
('pMcSiJt9hnNFJoyBqpTpicn5MPYdcRy8B5A3DzHH', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVhXNGQwaEVjWlRqZjJQdGdpWU1XMGIzZDY3WEJTcEV5MXBsVXVFYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828922),
('pnQz84PHGFq46huOJQfRYd9mZP3oGh3mMiEJ3ZBb', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGozcUhuSUExYmRuOGRSSW5tNG5GZE1ld0FIellRZnFJc3B4bWNTcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642829762),
('pRqLPAxErKus7nLPjWq8jZlxp9zR5RKPPKgQOYwB', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFExSkZ1TFJ2bkNORlBGa2ZDZEs3ZjdYZXJtczVxSGlKTWtxTUp5VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833722),
('Q1U3HBFUTBk40gpy0Hyo12nEKy5axwcnDaL384UA', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1gzZkhQakhnaVZRYUJqdlRTWjloaDdLbHc1Y2N2aGRITUFnNlZ2MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827362),
('qg2vZTFFrFNclhK3ZOiVYuBbHP6le3CO4DfZ8Nac', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2p1d2hLVFg4eklqZWVPV2tWUFNrSXg1MUt4alRMNzFGVUFhdEVORyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831861),
('qKxTqLOK8MgyoS3csu8s1cjBEsE6MPFvZK7T7VIK', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFRjRnI3ZFo1MWdVQzJDSWVyU3RTcXBOZUkyS0hoNThaVXpHR1VQZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830781),
('QSgO8HhqjCUvBVVw5idOOxbC2NuBT4Erdbve3kW1', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDJKWjJxeDVZTHNyZ3BFU1JLZW9MZ3pha25pWm50NlBLdTNRR3NLOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828262),
('Qx9yyqnOUH1DubPx4uToTZVqVft4Aj8LlCvo6ViQ', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRW5wRHBaOEtxYVBkc2RxaGJ5UDBZYVpCMTNQUjVHd2ZJUnl1c2h0NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828681),
('qxlKqebrMRKBYSs2TTHtMzqD7CW25fK5UAEd9PlP', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUsxWnFBYXNKSFUwcDdPWmtlbnFaRWFPbXd4R1lxSlNCd2t0SjN1YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830902),
('r1mg9zxaL325jz3FrPD56BO1ZEaDE0fppT9b9ltb', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzNZVkNtNDlXV0dTVkszV0taeGp0elVYa2JzeXZkSEVyV09CUGJGQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827062),
('rAT3qCLaTEPV9ZbsO7tpD9k9mEd6cBCNDXveupx0', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaThLejE5UkgyRTB2MU5uZzBMUWo2RnIySlFGeFQxU0tabXJsejBVbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828742),
('RbBI3BqxyTxhZz5L0QSsap3ohFvLikZwCGccfRCN', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGxQQWFNemUzYTlYSnJNWklaY0FaaE5yZUJBdldnMUhpelY5SjI0OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830542),
('rlANHMq98ovqLoD8Hr8f04UvapqcQUFGujNsEX6h', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiak0xTm1ScE8zM3ZtZkpGeUU0YmhYVjRoeDJtMDBsZkR6czJMc1RlZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642826762),
('rnzXoXfwmUdHZ4TO2lbjLRm4NMw6PVZnNMYiour8', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVndyV2h1ODFtQjF6dnFGUFBIaVVqd0pTRWJKcUJKM203cURveDVSaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642829162),
('rSuefj1tqUFB5ez0bOrYh7k18OT5v38huH7Bqfvl', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEE3UmJ2R01iWUhkQnFLOUZ1NDJzUFlIUFdSMWVhYmV4bnJJSUpYciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827181),
('RSVSmm3NP9if0sNQCdI1ui7ynx8qQabr9laTM1KR', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmQzb3NOaDdrbHB1MHloZklZbVRuQUJUc2EwTVRmalFmYlhDVTRIcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828142),
('RxnVsMMtfC7MnuZ06jMUZHvDElYloYVlHGvyo4pU', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlJLQjVOUnhtQ1U0bmJwd0VLWGU2alVBQUlZWVZ0QkQ2OUQ5VzVWZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830422),
('sDRmytak2mBSHA11kTUKa2WNIiuFsfehUzowqaTJ', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVVNSXpUWUdqcVNVUUNFZWtiYXBMWXQ5SFBJY0JFVGV0SjZpUFFzNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642832222),
('SH5BkAMLpIZbBIUXwHeTsuQBdmjrs9olkDa5hNxs', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnZlbXczTURYTjBoOW42djQ3cm1jbk9PT2NQcUhnY0RmRWx5QTNJaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642832881),
('sHdq4LZGav184ePkQVwVBM1josZhPbI02zapR5th', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGpnZGltZHRTZ2x2Q2FsazJscHUzRUN2N3E0ZFg3OU5Rbnk0cVRucCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830662),
('sOoZAOM7mGltxonyUaN2ekTJA2SxuZK4lF4Boiga', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFpnendvUTdNbVBJcWZSQmo5NTRzM3MyRGw3UVVNSUhuOUFrREtHZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828502),
('syg9BKPiBkYhKhHiLWA19OfcqPh188OrSoDKSjbX', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekhETzFXRkE3NFNVUnhwZFpxRGJkaUd2NmZNMWRiUmN3WXBzUFJHcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834321),
('t1OkaXjn50qEgqWwK4jyREalwrl5xGsDyIqy4QpF', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0lLVXlaSmdnNHJjUFhWZ2JuTXFRTHhva2hBZXc1RDBrVXFpU0liMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642826942),
('TnDnk19nMWHbYys2ViwZgtR8Un4KKkbY7NgwP20O', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjRpeWNQM2ZSVEgzUlpVVFJNRWlHbTNteWNHNGVYT1ZvanNrM1NSUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833601),
('tpzFCkoikB30GmApOvCvpBEt0kbOWYbGY3VRuQ7L', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDlmNFhaUVFpTjFUc3BseFJWN2xCVnZFNHp3WkpqWnNnNHJwbzJ6VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827603),
('U3k9ofrU23Ic4HP0HgWBbpW2TBvGR0pBTapQ0s1n', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEtmSGNlZWZrRXhtM0c2bTFvdHU4OXVFMHl2ZDV3V1VrS2dzM0JvViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830841),
('U7k1DIqPzZsbQpHmecnoxZIYUXWmcKKw5qfYyW0o', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXlzUmFuc1BIVjBHcHZicXdwbUsyWm5IUE0yS2lUOFJjOU1pajhCciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834441),
('UGcslXCaeyLlzAJ94MCM49k2T33n9UfdypblPY7c', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3lwYUFvZFBQc3FlVThMelVid29TbWZBSVZMYUlyTGd5Rk9ESFFPNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642832161),
('uwEeija8w6N8MyblgY7KvPV2KHRGcRzhrup8NasN', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZG5UakM4UkZEUWxzYXVKa2xNdTNmeHhrMXZaTkg4djlMS3BxaWlhdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831802),
('VKErf4sgHY2q3fgUtVCis8OjpkKnLJI2DHDoVqHO', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1gxVlFlZ0QxQXo5ejQ1ZkRnRlBZNU9hZ0RFeGU0OU9QVEM1WnFCeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834562),
('VKnui5725dm8jVRFIfKDIQv7aOAicAE4EGGxENCq', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGt3bDNOTjlUd0tza0xjT3R4bndXem82cXBuMWtqQVdrWFJORFJWQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830361),
('vObMFrlrl5wdd8lsnAJl6eSXhdtdOWBngn6esVVG', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEZ5OHRpNTV0T3RGZ25TV3R5enFDU1g5UVJRWUdEa0RPdFdWbzA5eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834681),
('vShXRH4gakRddEWOeRPEcKTZNZfxsBe66HS8dp4O', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1dENkE1TUFyUGFpSzFCSFE4Q0VYVTVxaENTeEd1bTM4blFzOGg2QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828081),
('WhU2A3iOnBIwn4BeWRrM52lnIV3PN8BC3BoHh54Y', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFJjd0FtcW9MZURWUkloVUtSNVUwbnNuTzB3YWJ6TXV0d3dTeWg1QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642832821),
('WQhtYjdhlTjqpdkyG29T4ZT4Xu3OE78hHjMAc0QY', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3E3Y1RjRGwzY2RLUTd4c2dEWkZFS3VHUWdPVnR2M09zY21GVFljRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827842),
('WqSxNZ6cz6HM5EecczjkjmvsM9a6kiSFR5hgbD8D', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1ZqdTJ4bHY1UU04dEJMdmhsMGNMWUVReG1DbFFzVjdpTGRNYkJQbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833002),
('x26y8LuPSfaeaT5OQClskiUxzWsDJrlvAQ1hvj86', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGpIQWttRFYxa085YWhFNEZ2UldsM3Y5YTl0TmhheUZscWlMRnFoRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830961),
('X8y4VRT3yrVy99NzLHlulABZNb96TQD0uDvNNjeo', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVRBT2xYdHF4dVdJU3Y3YjJBaTRSM3RwT3NPTnhoYmExMXNOeElnRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827481),
('xbRDEnbBgo7DHcbYjSUSoDVWxvqjZYnhyT2RUTc1', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUhYcTk2YWdYVmxQeU1hUDdGOWZUTVZKWUt2TlZBd3FpbU1QQlR4QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642832102),
('xdscBQFvx8ATUijODXGgbTPPOk4fs1V1KIJnDVyF', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFNmenhCNXRxNTJkR1Y3V2hlQW95R0ZvcUdYMDZFN0I2TmVkVUc1QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833421),
('XGBgvHuQBBkrD5aD7oCqqrpZQCDwjwVUbrlIzy7h', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFM4WDNiTXFlSThiWXpLZW9QRVlOVUNHZnBBWUdiR3J2cGpZdEZmNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642835042),
('XMrjLRrJFOzudWWkBpk2ThuL434rZNw49G0r5Asu', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2U4NTNYU1pGeGpyVGpSTXNHT05na3JkMjRTSTdsTVpSYndCYXR3ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834081),
('XOMBHn89VkdSmPrPa0T2vZyzL3PxLHAVWtHpdDB6', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0x2b3Z0QzFZQlNEbVEzTGlvb3RYcEllcUNqSWpqMTl6RkgwdmRmUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642828982),
('YdR67FnpdaoDo3yr3jbvsTm8AyBPd92LGOQJSCBT', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXJzYUg5VWZQUUtpT3NjeDhZRnlTT3k5bEw4dXdKSkNiYkNra0taTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827542),
('YhWHMnx2wra3DgsvhvW7iBXibUqXl9Ie2EdyRv3Y', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUtmYVdOenhUaElWdHZzemo5M014cmg1UVBSb3AxRzhWWXo0Q1FIciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833782),
('ykqg9jS8Olsr7OzJOgwOMZWNOTvMHy7NqjEn1I5c', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZno3TWdqRVhrc3NLSG5IckRGSGdpN2JqVmVJZDlZR1BROHNhd2hYeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642827422),
('ymC7rfwJq6WGg6fmV7nypWhHgdrAbcpVZhkRG00y', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3A5ZUhaYllrRTNqVVg0elFIWGExcGZKdnRpOWhJeDAwTVpXSm45YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642830242),
('YrESuDS8B2Fq6MHLaQVtINo0dDbbomWqmgbOVJE3', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHM1R2EwWnJRb3MyVnZFQ3UwNlppT3lYRFFqU3FyMkM1S0lzOTM5NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642832702),
('YUDofoxEgpEa31hHe9w38LTxm7ohigA8cUMbHTn2', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmJuRkx3UmhHNnl0MkhKbmpqT2g4RDM5cGVCVUZsTUJlMDNNU05HYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642829521),
('YuF1lIX1bVuOWDeqvMsErjDJud79AJkHCPbmJW55', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaExRNTI0ZThlTWFpbUFvdzJGbzZlYXNabFZMUUZBWGZMeVdMdTVoNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642831981),
('zjlGwQ1ClYybw5srBZc90QKi0Ul58FNEON4BrKyF', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3NDck9LVnVVYXNhR3JOOERRTUF6b1IzQlFrZjJnNzRaRVRYMkgyYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642833842);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ZQtDjZdONzV8VtSb11yljA2V878hqKD7ggoN5Ixd', NULL, '107.161.23.26', 'curl/7.29.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTm1ZcmpQb0E0U09oV05ld05qTkJ3dnY2azlBSFlGTkJsZ3owVmFGZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vdGVzdC5zYWxlY29kZS5uZXQvY3JvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1642834381);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `field`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'Bicrypto', '2021-07-10 23:37:13', '2022-01-11 16:53:31'),
(2, 'site_email', 'info@yourdomain.com', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(3, 'site_base_currency', 'USD', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(4, 'site_copyright', 'All Right Reserved.', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(5, 'site_support_address', '', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(6, 'site_support_phone', '', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(7, 'site_support_email', '', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(19, 'site_date_format', 'd M, Y', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(20, 'site_time_format', 'h:i A', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(21, 'site_timezone', 'UTC', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(48, 'site_mail_driver', 'mail', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(49, 'site_mail_host', 'smtp.gmail.com', '2021-07-10 23:37:14', '2021-12-27 07:15:32'),
(50, 'site_mail_port', '465', '2021-07-10 23:37:14', '2021-12-27 07:15:32'),
(51, 'site_mail_encryption', 'ssl', '2021-07-10 23:37:14', '2021-12-27 07:15:32'),
(52, 'site_mail_from_address', 'noreply@mashdiv.com', '2021-07-10 23:37:14', '2021-12-27 07:15:32'),
(53, 'site_mail_from_name', 'Mashdiv', '2021-07-10 23:37:14', '2021-12-27 07:15:32'),
(54, 'site_mail_username', 'salammashdiv@gmail.com', '2021-07-10 23:37:14', '2021-12-27 07:15:32'),
(55, 'site_mail_password', 'hzlrqfgmdgbvjxfu', '2021-07-10 23:37:14', '2021-12-27 07:15:32'),
(56, 'site_mail_footer', 'Best Regards\r\n[[site_name]]', '2021-07-10 23:37:14', '2021-12-27 06:41:02'),
(58, 'site_admin_management', '0', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(59, 'manage_access_default', '{\"level\":[\"none\"]}', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(60, 'kyc_opt_hide', '0', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(61, 'kyc_public', '1', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(62, 'kyc_before_email', '0', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(63, 'kyc_firstname', '{\"show\":1,\"req\":1}', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(64, 'kyc_lastname', '{\"show\":1,\"req\":1}', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(65, 'kyc_email', '{\"show\":1,\"req\":1}', '2021-07-10 23:37:15', '2021-07-10 23:37:15'),
(66, 'kyc_phone', '{\"show\":1,\"req\":0}', '2021-07-10 23:37:15', '2021-07-10 23:37:15'),
(67, 'kyc_dob', '{\"show\":1,\"req\":0}', '2021-07-10 23:37:15', '2021-07-10 23:37:15'),
(68, 'kyc_gender', '{\"show\":1,\"req\":1}', '2021-07-10 23:37:15', '2021-07-10 23:37:15'),
(69, 'kyc_country', '{\"show\":1,\"req\":1}', '2021-07-10 23:37:15', '2021-07-10 23:37:15'),
(70, 'kyc_state', '{\"show\":1,\"req\":1}', '2021-07-10 23:37:15', '2021-07-10 23:37:15'),
(71, 'kyc_city', '{\"show\":1,\"req\":1}', '2021-07-10 23:37:15', '2021-07-10 23:37:15'),
(72, 'kyc_zip', '{\"show\":1,\"req\":1}', '2021-07-10 23:37:15', '2021-07-10 23:37:15'),
(73, 'kyc_address1', '{\"show\":1,\"req\":1}', '2021-07-10 23:37:15', '2021-07-10 23:37:15'),
(74, 'kyc_address2', '{\"show\":1,\"req\":0}', '2021-07-10 23:37:15', '2021-07-10 23:37:15'),
(75, 'kyc_telegram', '{\"show\":1,\"req\":0}', '2021-07-10 23:37:15', '2021-07-10 23:37:15'),
(76, 'kyc_document_passport', '1', '2021-07-10 23:37:15', '2021-07-10 23:37:15'),
(77, 'kyc_document_nidcard', '1', '2021-07-10 23:37:15', '2021-07-10 23:37:15'),
(78, 'kyc_document_driving', '1', '2021-07-10 23:37:15', '2021-07-10 23:37:15'),
(9, 'profit', '87', '2021-07-10 23:37:14', '2021-07-10 23:37:14'),
(245, 'send_notification_to', NULL, '2021-12-27 06:41:02', '2021-12-27 06:41:02'),
(246, 'send_notification_mails', NULL, '2021-12-27 06:41:02', '2021-12-27 06:41:02'),
(247, 'dash_route', 'practice', '2022-01-20 14:03:41', '2022-01-20 14:03:41');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` int(11) UNSIGNED NOT NULL,
  `support_message_id` int(11) NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_attachments`
--

INSERT INTO `support_attachments` (`id`, `support_message_id`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 1, '61bba1ffce9b21639686655.png', '2021-12-16 20:30:55', '2021-12-16 20:30:55'),
(2, 2, '61bba200465311639686656.png', '2021-12-16 20:30:56', '2021-12-16 20:30:56');

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `supportticket_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(91) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trade_logs`
--

CREATE TABLE `trade_logs` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `coin_id` int(11) NOT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `price_was` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `duration` int(11) NOT NULL,
  `in_time` timestamp NULL DEFAULT current_timestamp(),
  `tradetype` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hilow` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Rise : 1 Fall: 2',
  `result` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'win : 1 lose : 2 Draw : 3',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Running : 0 Complete : 1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trade_logs`
--

INSERT INTO `trade_logs` (`id`, `user_id`, `coin_id`, `amount`, `price_was`, `duration`, `in_time`, `tradetype`, `hilow`, `result`, `status`, `created_at`, `updated_at`) VALUES
(62, 1, 1, 10.00000000, 41821.57000000, 10, '2022-01-20 05:32:42', '', 1, 1, 1, '2022-01-20 05:32:35', '2022-01-20 05:32:45'),
(63, 1, 1, 10.00000000, 41838.73000000, 10, '2022-01-20 05:33:07', '', 2, 1, 1, '2022-01-20 05:32:57', '2022-01-20 05:33:08');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `charge`, `post_balance`, `trx_type`, `trx`, `details`, `created_at`, `updated_at`) VALUES
(101, 1, 10.00000000, 0.00000000, 297.15000000, '-', 'QPMOKBAWGPYZ', 'Trade Bitcoin Low', '2022-01-13 16:03:36', '2022-01-13 16:03:36'),
(102, 2, 10.00000000, 0.00000000, 307.15000000, '+', '19AS1FNEJJ6N', 'Added Balance Via Admin', '2022-01-13 18:48:06', '2022-01-13 18:48:06'),
(103, 2, 10.00000000, 0.00000000, 317.15000000, '+', 'WB89NM3A4V9R', 'Added Balance Via Admin', '2022-01-13 18:49:07', '2022-01-13 18:49:07'),
(104, 2, 10.00000000, 0.00000000, 327.15000000, '+', '6RV9H6PDYBKU', 'Added Balance Via Admin', '2022-01-13 18:49:45', '2022-01-13 18:49:45'),
(105, 2, 10.00000000, 0.00000000, 337.15000000, '+', 'KKE4OF17DDV4', 'Added Balance Via Admin', '2022-01-13 18:53:00', '2022-01-13 18:53:00'),
(106, 2, 10.00000000, 0.00000000, 347.15000000, '+', 'V3HFRH37HED3', 'Added Balance Via Admin', '2022-01-13 18:54:51', '2022-01-13 18:54:51'),
(107, 2, 10.00000000, 0.00000000, 357.15000000, '+', 'MUUBDX87NGQX', 'Added Balance Via Admin', '2022-01-13 18:55:04', '2022-01-13 18:55:04'),
(108, 2, 10.00000000, 0.00000000, 347.15000000, '-', '123UGS6J6QDY', 'Trade Bitcoin Low', '2022-01-13 23:18:27', '2022-01-13 23:18:27'),
(109, 2, 18.70000000, 0.00000000, 365.85000000, '+', 'TQQKHA2Z6FWY', 'Trade Bitcoin WIN', '2022-01-13 23:18:39', '2022-01-13 23:18:39'),
(110, 2, 10.00000000, 0.00000000, 355.85000000, '-', 'A4NGPPVC9HFQ', 'Trade Bitcoin Low', '2022-01-13 23:51:20', '2022-01-13 23:51:20'),
(111, 2, 18.70000000, 0.00000000, 374.55000000, '+', '9452TD7519H3', 'Trade Bitcoin WIN', '2022-01-13 23:51:31', '2022-01-13 23:51:31'),
(112, 2, 10.00000000, 0.00000000, 364.55000000, '-', 'TRNDF161D3P5', 'Trade Bitcoin Low', '2022-01-14 03:45:29', '2022-01-14 03:45:29'),
(113, 2, 18.70000000, 0.00000000, 383.25000000, '+', 'AYBAU94PSRJ3', 'Trade Bitcoin WIN', '2022-01-14 03:45:40', '2022-01-14 03:45:40'),
(114, 2, 1.00000000, 0.00000000, 382.25000000, '-', 'K1PN32M31YRO', 'Trade Bitcoin Low', '2022-01-14 03:45:54', '2022-01-14 03:45:54'),
(115, 2, 10.00000000, 0.00000000, 372.25000000, '-', 'BOS4SOP8DQK1', 'Trade Bitcoin Low', '2022-01-14 03:47:30', '2022-01-14 03:47:30'),
(116, 2, 18.70000000, 0.00000000, 390.95000000, '+', 'MW6NTGKOTWZS', 'Trade Bitcoin WIN', '2022-01-14 03:47:41', '2022-01-14 03:47:41'),
(117, 2, 1.00000000, 0.00000000, 389.95000000, '-', 'JW14H6RGJEUG', 'Trade Bitcoin Low', '2022-01-14 03:47:50', '2022-01-14 03:47:50'),
(118, 2, 1.87000000, 0.00000000, 391.82000000, '+', 'VT157VCA8GY3', 'Trade Bitcoin WIN', '2022-01-14 03:48:01', '2022-01-14 03:48:01'),
(119, 2, 2.00000000, 0.00000000, 389.82000000, '-', 'S869D87Y5ZKM', 'Trade Bitcoin Low', '2022-01-14 03:48:07', '2022-01-14 03:48:07'),
(120, 2, 3.74000000, 0.00000000, 393.56000000, '+', 'W8JB44F52ZXU', 'Trade Bitcoin WIN', '2022-01-14 03:48:19', '2022-01-14 03:48:19'),
(121, 2, 10.00000000, 0.00000000, 383.56000000, '-', 'RTWY5SX3UUKZ', 'Trade Bitcoin Low', '2022-01-14 03:49:31', '2022-01-14 03:49:31'),
(122, 2, 18.70000000, 0.00000000, 402.26000000, '+', 'VWW3NGCVHSJ3', 'Trade Bitcoin WIN', '2022-01-14 03:49:42', '2022-01-14 03:49:42'),
(123, 2, 1.00000000, 0.00000000, 401.26000000, '-', 'VR13AO7DKDNG', 'Trade Bitcoin Low', '2022-01-14 03:49:47', '2022-01-14 03:49:47'),
(124, 2, 1.87000000, 0.00000000, 403.13000000, '+', '69QFCP2J6KNK', 'Trade Bitcoin WIN', '2022-01-14 03:49:58', '2022-01-14 03:49:58'),
(125, 2, 10.00000000, 0.00000000, 393.13000000, '-', 'CE93DYH95Y58', 'Trade Bitcoin Low', '2022-01-14 03:50:36', '2022-01-14 03:50:36'),
(126, 2, 1.00000000, 0.00000000, 392.13000000, '-', 'DCOWC1EU9HGH', 'Trade Bitcoin Low', '2022-01-14 03:50:55', '2022-01-14 03:50:55'),
(127, 2, 10.00000000, 0.00000000, 382.13000000, '-', 'NTUGFXSVQ51V', 'Trade Bitcoin Low', '2022-01-14 03:51:37', '2022-01-14 03:51:37'),
(128, 2, 1.00000000, 0.00000000, 381.13000000, '-', '988COHJQX4PW', 'Trade Bitcoin Low', '2022-01-14 03:51:57', '2022-01-14 03:51:57'),
(129, 2, 10.00000000, 0.00000000, 371.13000000, '-', 'AWE12SDR5MRG', 'Trade Bitcoin Low', '2022-01-14 03:52:37', '2022-01-14 03:52:37'),
(130, 2, 18.70000000, 0.00000000, 389.83000000, '+', 'QC4QBDVBFCFJ', 'Trade Bitcoin WIN', '2022-01-14 03:52:48', '2022-01-14 03:52:48'),
(131, 2, 1.00000000, 0.00000000, 388.83000000, '-', '9ZPBOR8VAFMJ', 'Trade Bitcoin Low', '2022-01-14 03:52:58', '2022-01-14 03:52:58'),
(132, 2, 10.00000000, 0.00000000, 378.83000000, '-', 'BTVJCX8E77PW', 'Trade Bitcoin Low', '2022-01-14 03:53:28', '2022-01-14 03:53:28'),
(133, 2, 10.00000000, 0.00000000, 368.83000000, '-', '7HP5G45E5HWW', 'Trade Bitcoin Low', '2022-01-14 03:57:10', '2022-01-14 03:57:10'),
(134, 2, 18.70000000, 0.00000000, 387.53000000, '+', '2YUNAEMHAPHH', 'Trade Bitcoin WIN', '2022-01-14 03:57:21', '2022-01-14 03:57:21'),
(135, 2, 1.00000000, 0.00000000, 386.53000000, '-', '7O7DF7W7RTB1', 'Trade Bitcoin Low', '2022-01-14 03:57:32', '2022-01-14 03:57:32'),
(136, 2, 10.00000000, 0.00000000, 366.53000000, '-', '2S3E6EXB19SY', 'Trade Bitcoin Low', '2022-01-14 04:11:18', '2022-01-14 04:11:18'),
(137, 2, 10.00000000, 0.00000000, 356.53000000, '-', 'MB3TUNMMFHB7', 'Trade Bitcoin Low', '2022-01-14 04:11:19', '2022-01-14 04:11:19'),
(138, 2, 10.00000000, 0.00000000, 346.53000000, '-', 'SD4ERTV8S8T1', 'Trade Bitcoin Low', '2022-01-14 04:13:53', '2022-01-14 04:13:53'),
(139, 2, 10.00000000, 0.00000000, 336.53000000, '-', 'P47EH6PMUHV2', 'Trade Bitcoin Low', '2022-01-14 04:13:53', '2022-01-14 04:13:53'),
(140, 2, 18.70000000, 0.00000000, 355.23000000, '+', '37PK4PP5OYKS', 'Trade Bitcoin WIN', '2022-01-14 04:14:04', '2022-01-14 04:14:04'),
(141, 2, 18.70000000, 0.00000000, 373.93000000, '+', '6N3M23CRFYZU', 'Trade Bitcoin WIN', '2022-01-14 04:14:05', '2022-01-14 04:14:05'),
(142, 2, 10.00000000, 0.00000000, 363.93000000, '-', '24S8U7NW5SPV', 'Trade Bitcoin Low', '2022-01-14 04:20:22', '2022-01-14 04:20:22'),
(143, 2, 10.00000000, 0.00000000, 353.93000000, '-', '7VX7EBT2OBWV', 'Trade Bitcoin Low', '2022-01-14 04:20:23', '2022-01-14 04:20:23'),
(144, 2, 10.00000000, 0.00000000, 343.93000000, '-', '3T48MV428C6U', 'Trade Bitcoin Low', '2022-01-14 04:24:55', '2022-01-14 04:24:55'),
(145, 2, 10.00000000, 0.00000000, 333.93000000, '-', 'YDT4F223QCWC', 'Trade Bitcoin Low', '2022-01-14 04:24:55', '2022-01-14 04:24:55'),
(146, 2, 10.00000000, 0.00000000, 323.93000000, '-', '4PUJYRN9T5T3', 'Trade Bitcoin Low', '2022-01-14 04:24:56', '2022-01-14 04:24:56'),
(147, 2, 18.70000000, 0.00000000, 342.63000000, '+', 'KTG2O3NQTK4W', 'Trade Bitcoin WIN', '2022-01-14 04:25:06', '2022-01-14 04:25:06'),
(148, 2, 18.70000000, 0.00000000, 361.33000000, '+', '9AD24UNAZGYH', 'Trade Bitcoin WIN', '2022-01-14 04:25:06', '2022-01-14 04:25:06'),
(149, 2, 18.70000000, 0.00000000, 380.03000000, '+', '3AX9R25UPGTQ', 'Trade Bitcoin WIN', '2022-01-14 04:25:08', '2022-01-14 04:25:08'),
(150, 2, 10.00000000, 0.00000000, 370.03000000, '-', 'CX1SGAMYHZT9', 'Trade Bitcoin Low', '2022-01-14 04:26:33', '2022-01-14 04:26:33'),
(151, 2, 10.00000000, 0.00000000, 360.03000000, '-', 'PUJCFS78Y8TP', 'Trade Bitcoin Low', '2022-01-14 04:27:59', '2022-01-14 04:27:59'),
(152, 2, 18.70000000, 0.00000000, 378.73000000, '+', 'CBH2GF53S2Q9', 'Trade Bitcoin WIN', '2022-01-14 04:28:10', '2022-01-14 04:28:10'),
(153, 2, 10.00000000, 0.00000000, 368.73000000, '-', 'NAW6F1EDQQJT', 'Trade Bitcoin Low', '2022-01-14 04:29:47', '2022-01-14 04:29:47'),
(154, 2, 18.70000000, 0.00000000, 387.43000000, '+', 'XZRED87DNR3S', 'Trade Bitcoin WIN', '2022-01-14 04:29:58', '2022-01-14 04:29:58'),
(155, 2, 10.00000000, 0.00000000, 377.43000000, '-', 'DO9EMZ5B6VZO', 'Trade Bitcoin Low', '2022-01-14 04:30:16', '2022-01-14 04:30:16'),
(156, 2, 10.00000000, 0.00000000, 367.43000000, '-', 'Z5ZTW855YZ8X', 'Trade Bitcoin Low', '2022-01-14 04:31:41', '2022-01-14 04:31:41'),
(157, 2, 10.00000000, 0.00000000, 377.43000000, '+', 'Z3BZQQKU13M7', 'Trade Bitcoin Refund', '2022-01-14 04:31:52', '2022-01-14 04:31:52'),
(158, 2, 10.00000000, 0.00000000, 367.43000000, '-', '41USTWGK7HCP', 'Trade Bitcoin Low', '2022-01-14 10:42:02', '2022-01-14 10:42:02'),
(159, 2, 10.00000000, 0.00000000, 357.43000000, '-', '2JZUT2UQK4XB', 'Trade Bitcoin Low', '2022-01-14 10:43:20', '2022-01-14 10:43:20'),
(160, 2, 18.70000000, 0.00000000, 376.13000000, '+', 'JVVNMMD2973V', 'Trade Bitcoin WIN', '2022-01-14 10:43:31', '2022-01-14 10:43:31'),
(161, 2, 10.00000000, 0.00000000, 366.13000000, '-', '43RCMA2BTM64', 'Trade Bitcoin Low', '2022-01-14 10:44:49', '2022-01-14 10:44:49'),
(162, 2, 18.70000000, 0.00000000, 384.83000000, '+', '9R3MPV3WA42K', 'Trade Bitcoin WIN', '2022-01-14 10:45:01', '2022-01-14 10:45:01'),
(163, 2, 10.00000000, 0.00000000, 374.83000000, '-', 'STOFQODZAQRM', 'Trade Bitcoin Low', '2022-01-14 10:45:19', '2022-01-14 10:45:19'),
(164, 2, 18.70000000, 0.00000000, 393.53000000, '+', 'R81GE13RHZOR', 'Trade Bitcoin WIN', '2022-01-14 10:45:31', '2022-01-14 10:45:31'),
(165, 2, 10.00000000, 0.00000000, 383.53000000, '-', 'B73O3CC2ZAKT', 'Trade Bitcoin Low', '2022-01-14 10:46:00', '2022-01-14 10:46:00'),
(166, 2, 18.70000000, 0.00000000, 402.23000000, '+', '16PBVZGB149C', 'Trade Bitcoin WIN', '2022-01-14 10:46:12', '2022-01-14 10:46:12'),
(167, 2, 10.00000000, 0.00000000, 392.23000000, '-', 'RR9ZD56B8FZH', 'Trade Bitcoin Low', '2022-01-14 10:49:10', '2022-01-14 10:49:10'),
(168, 2, 18.70000000, 0.00000000, 410.93000000, '+', 'MWUK273GVAWA', 'Trade Bitcoin WIN', '2022-01-14 10:49:21', '2022-01-14 10:49:21'),
(169, 2, 10.00000000, 0.00000000, 400.93000000, '-', '4F2X7JUZ7Q72', 'Trade Bitcoin Low', '2022-01-14 10:55:00', '2022-01-14 10:55:00'),
(170, 2, 18.70000000, 0.00000000, 419.63000000, '+', 'VG7M6358YDHZ', 'Trade Bitcoin WIN', '2022-01-14 10:55:11', '2022-01-14 10:55:11'),
(171, 2, 10.00000000, 0.00000000, 409.63000000, '-', 'SEWEAAXV576E', 'Trade Bitcoin Low', '2022-01-14 10:57:48', '2022-01-14 10:57:48'),
(172, 2, 18.70000000, 0.00000000, 428.33000000, '+', '564MUW3WVRD2', 'Trade Bitcoin WIN', '2022-01-14 10:58:00', '2022-01-14 10:58:00'),
(173, 2, 10.00000000, 0.00000000, 418.33000000, '-', '9GADH7Q29RUY', 'Trade Bitcoin Low', '2022-01-14 10:59:28', '2022-01-14 10:59:28'),
(174, 2, 18.70000000, 0.00000000, 437.03000000, '+', 'AOM9UHNROJ54', 'Trade Bitcoin WIN', '2022-01-14 10:59:39', '2022-01-14 10:59:39'),
(175, 2, 10.00000000, 0.00000000, 427.03000000, '-', 'OGMGQTX5VW8W', 'Trade Bitcoin Low', '2022-01-14 11:25:33', '2022-01-14 11:25:33'),
(176, 2, 18.70000000, 0.00000000, 445.73000000, '+', 'VVJ73AKKJNUZ', 'Trade Bitcoin WIN', '2022-01-17 08:16:46', '2022-01-17 08:16:46'),
(177, 2, 18.70000000, 0.00000000, 464.43000000, '+', 'HXC6UHOBDQCD', 'Trade Bitcoin WIN', '2022-01-17 08:16:46', '2022-01-17 08:16:46'),
(178, 1, 10.00000000, 0.00000000, 1436.23749000, '-', 'KCXATOBDKYEM', 'Trade Bitcoin Low', '2022-01-20 05:32:35', '2022-01-20 05:32:35'),
(179, 1, 18.70000000, 0.00000000, 1454.93749000, '+', 'JRSRXWNW9R71', 'Trade Bitcoin WIN', '2022-01-20 05:32:45', '2022-01-20 05:32:45'),
(180, 1, 10.00000000, 0.00000000, 1444.93749000, '-', '1BVQAROQOSFV', 'Trade Bitcoin Low', '2022-01-20 05:32:57', '2022-01-20 05:32:57'),
(181, 1, 18.70000000, 0.00000000, 1463.63749000, '+', '1H6C71943EN9', 'Trade Bitcoin WIN', '2022-01-20 05:33:08', '2022-01-20 05:33:08');

-- --------------------------------------------------------

--
-- Table structure for table `transactions_wallet`
--

CREATE TABLE `transactions_wallet` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable_id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('deposit','withdraw') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(64,0) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) UNSIGNED NOT NULL,
  `to_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('exchange','transfer','paid','refund','gift') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'transfer',
  `status_last` enum('exchange','transfer','paid','refund','gift') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_id` bigint(20) UNSIGNED NOT NULL,
  `withdraw_id` bigint(20) UNSIGNED NOT NULL,
  `discount` decimal(64,0) NOT NULL DEFAULT 0,
  `fee` decimal(64,0) NOT NULL DEFAULT 0,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` int(11) DEFAULT NULL,
  `balance` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `balance_btc` decimal(18,8) NOT NULL,
  `practice_balance` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `practice_balance_btc` decimal(18,8) NOT NULL,
  `country` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `country_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `zip` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `town` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `city` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `kyc` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: kyc unverified, 1: kyc verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: sms unverified, 1: sms verified',
  `ver_code` varchar(91) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `tsc1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 2,
  `twitter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `facebook` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `instagram` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `linkedin` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `registerMethod` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Email',
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `firstname`, `lastname`, `email`, `email_verified_at`, `username`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `mobile`, `ref_by`, `balance`, `balance_btc`, `practice_balance`, `practice_balance_btc`, `country`, `country_code`, `zip`, `address`, `town`, `city`, `status`, `kyc`, `sv`, `ver_code`, `ver_code_send_at`, `tsc1`, `provider1`, `provider_id1`, `role_id`, `twitter`, `facebook`, `instagram`, `linkedin`, `timezone`, `registerMethod`, `dob`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@site.com', '2021-12-10 01:20:49', 'admin', '$2y$10$CKPGLF/css.9D15kyTUtM.HH0gLCBTaoMhV86dFBYbIbyQcWWf54G', NULL, NULL, NULL, NULL, 'profile-photos/5XE3nm0JKVx0TWSdMuiOijo6LpkwFqDYXdgZIM56.png', '', NULL, 9845.31000000, 0.00234220, 9874.09606275, 0.00000045, 'United Kingdom', 'UK', '00000', '\"there\"', 'here', 'somewhere', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, '', '', '', NULL, 'Asia/Bangkok', 'Email', NULL, '2021-12-02 06:33:44', '2022-01-20 17:44:02'),
(2, 'adminDemo', 'adminDemo', 'adminDemo', 'adminDemo@site.com', '2021-12-10 01:20:49', 'adminDemo', '$2y$10$CKPGLF/css.9D15kyTUtM.HH0gLCBTaoMhV86dFBYbIbyQcWWf54G', NULL, NULL, NULL, NULL, 'profile-photos/5XE3nm0JKVx0TWSdMuiOijo6LpkwFqDYXdgZIM56.png', '', NULL, 464.43000000, 0.00000000, 9829.51000000, 0.00000000, 'United Kingdom', 'UK', '00000', 'there', 'here', 'somewhere', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 3, '11', '12', '12', NULL, 'America/New_York', 'Email', NULL, '2021-12-02 06:33:44', '2022-01-17 08:16:46'),
(3, 'Demo', 'Demo', 'Demo', 'Demo@site.com', '2021-12-10 01:20:49', 'Demo', '$2y$10$CKPGLF/css.9D15kyTUtM.HH0gLCBTaoMhV86dFBYbIbyQcWWf54G', NULL, NULL, NULL, NULL, 'profile-photos/5XE3nm0JKVx0TWSdMuiOijo6LpkwFqDYXdgZIM57.png', '', NULL, 0.00000000, 0.00000000, 9829.51000000, 0.00000000, 'United Kingdom', 'UK', '00000', 'there', 'here', 'somewhere', 1, 0, 1, NULL, NULL, NULL, NULL, NULL, 2, '11', '12', '12', NULL, 'America/New_York', 'Email', NULL, '2021-12-02 06:33:44', '2022-01-14 11:42:35'),
(11, 'asd asd', 'asd', 'asd', 'asd@gmail.com', NULL, 'asdasd', '$2y$10$gSVw7JShDE/VUs6QdqP0LOBfZfmROM06uqHyRf.uwaC8/vjL14wjO', NULL, NULL, NULL, NULL, NULL, '+077196556864', NULL, 0.00000000, 0.00000000, 0.00000000, 0.00000000, 'Heard Island and Mcdonald Islands', NULL, 'awd', NULL, 'adwd', NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'America/New_York', 'Email', NULL, '2022-01-19 17:26:40', '2022-01-19 17:26:43');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(91) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` tinyint(4) NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `symbol`, `balance`, `created_at`, `updated_at`) VALUES
(1, 1, 'USDT', 1463.63749000, '2022-01-18 18:17:40', '2022-01-20 05:33:08'),
(12, 1, 'BTC', 1.10310000, '2022-01-18 18:49:41', '2022-01-19 19:02:29'),
(13, 1, 'BNB', 0.00000000, '2022-01-19 14:58:41', '2022-01-19 14:58:41'),
(18, 1, 'ETH', 1.30700000, '2022-01-19 16:26:34', '2022-01-19 19:10:56'),
(19, 1, 'DOGE', 800.00000000, '2022-01-19 16:32:18', '2022-01-19 19:45:35'),
(20, 1, 'BNB', 0.00000000, '2022-01-20 04:58:59', '2022-01-20 04:58:59');

-- --------------------------------------------------------

--
-- Table structure for table `watchlists`
--

CREATE TABLE `watchlists` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` tinyint(11) DEFAULT NULL,
  `symbol` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `watchlists`
--

INSERT INTO `watchlists` (`id`, `user_id`, `symbol`, `created_at`, `updated_at`) VALUES
(44, 2, NULL, '2022-01-13 23:34:22', '2022-01-13 23:34:22'),
(45, 2, 'BTC', '2022-01-13 23:34:55', '2022-01-13 23:34:55'),
(47, 2, 'ETH', '2022-01-14 01:09:28', '2022-01-14 01:09:28'),
(48, 1, 'BTC', '2022-01-14 18:51:28', '2022-01-14 18:51:28');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int(10) UNSIGNED NOT NULL,
  `method_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(18,8) NOT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(18,8) NOT NULL,
  `charge` decimal(18,8) NOT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `final_amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `after_charge` decimal(18,8) NOT NULL,
  `withdraw_information` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_limit` decimal(18,8) DEFAULT NULL,
  `max_limit` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `delay` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_charge` decimal(18,8) DEFAULT NULL,
  `rate` decimal(18,8) DEFAULT NULL,
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_etc_categories`
--
ALTER TABLE `blog_etc_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_etc_categories_slug_unique` (`slug`),
  ADD KEY `blog_etc_categories_created_by_index` (`created_by`);

--
-- Indexes for table `blog_etc_comments`
--
ALTER TABLE `blog_etc_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_etc_comments_blog_etc_post_id_index` (`blog_etc_post_id`),
  ADD KEY `blog_etc_comments_user_id_index` (`user_id`);

--
-- Indexes for table `blog_etc_posts`
--
ALTER TABLE `blog_etc_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_etc_posts_slug_unique` (`slug`),
  ADD KEY `blog_etc_posts_user_id_index` (`user_id`),
  ADD KEY `blog_etc_posts_posted_at_index` (`posted_at`);

--
-- Indexes for table `blog_etc_post_categories`
--
ALTER TABLE `blog_etc_post_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_etc_post_categories_blog_etc_post_id_index` (`blog_etc_post_id`),
  ADD KEY `blog_etc_post_categories_blog_etc_category_id_index` (`blog_etc_category_id`);

--
-- Indexes for table `blog_etc_uploaded_photos`
--
ALTER TABLE `blog_etc_uploaded_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_etc_uploaded_photos_uploader_id_index` (`uploader_id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crypto_currencies`
--
ALTER TABLE `crypto_currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD UNIQUE KEY `symbol` (`symbol`),
  ADD KEY `name_4` (`name`);
ALTER TABLE `crypto_currencies` ADD FULLTEXT KEY `name_3` (`name`);

--
-- Indexes for table `crypto_currency_prices`
--
ALTER TABLE `crypto_currency_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crypto_pairs`
--
ALTER TABLE `crypto_pairs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD UNIQUE KEY `symbol` (`symbol`),
  ADD KEY `name_4` (`name`);
ALTER TABLE `crypto_pairs` ADD FULLTEXT KEY `name_3` (`name`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_templates_slug_unique` (`slug`);

--
-- Indexes for table `exchange_logs`
--
ALTER TABLE `exchange_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD UNIQUE KEY `data_keys` (`id`) USING BTREE;

--
-- Indexes for table `frontend_images`
--
ALTER TABLE `frontend_images`
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_metas`
--
ALTER TABLE `global_metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `practice_logs`
--
ALTER TABLE `practice_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rssfeeds`
--
ALTER TABLE `rssfeeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trade_logs`
--
ALTER TABLE `trade_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions_wallet`
--
ALTER TABLE `transactions_wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_uuid_unique` (`uuid`),
  ADD KEY `transactions_payable_type_payable_id_index` (`payable_type`,`payable_id`),
  ADD KEY `payable_type_payable_id_ind` (`payable_type`,`payable_id`),
  ADD KEY `payable_type_ind` (`payable_type`,`payable_id`,`type`),
  ADD KEY `payable_confirmed_ind` (`payable_type`,`payable_id`,`confirmed`),
  ADD KEY `payable_type_confirmed_ind` (`payable_type`,`payable_id`,`type`,`confirmed`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_wallet_id_foreign` (`wallet_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transfers_uuid_unique` (`uuid`),
  ADD KEY `transfers_from_type_from_id_index` (`from_type`,`from_id`),
  ADD KEY `transfers_to_type_to_id_index` (`to_type`,`to_id`),
  ADD KEY `transfers_deposit_id_foreign` (`deposit_id`),
  ADD KEY `transfers_withdraw_id_foreign` (`withdraw_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `watchlists`
--
ALTER TABLE `watchlists`
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `blog_etc_categories`
--
ALTER TABLE `blog_etc_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_etc_comments`
--
ALTER TABLE `blog_etc_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `blog_etc_posts`
--
ALTER TABLE `blog_etc_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_etc_post_categories`
--
ALTER TABLE `blog_etc_post_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_etc_uploaded_photos`
--
ALTER TABLE `blog_etc_uploaded_photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crypto_currencies`
--
ALTER TABLE `crypto_currencies`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- AUTO_INCREMENT for table `crypto_currency_prices`
--
ALTER TABLE `crypto_currency_prices`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `crypto_pairs`
--
ALTER TABLE `crypto_pairs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `exchange_logs`
--
ALTER TABLE `exchange_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `frontend_images`
--
ALTER TABLE `frontend_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `global_metas`
--
ALTER TABLE `global_metas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `practice_logs`
--
ALTER TABLE `practice_logs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rssfeeds`
--
ALTER TABLE `rssfeeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trade_logs`
--
ALTER TABLE `trade_logs`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `transactions_wallet`
--
ALTER TABLE `transactions_wallet`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `watchlists`
--
ALTER TABLE `watchlists`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_etc_comments`
--
ALTER TABLE `blog_etc_comments`
  ADD CONSTRAINT `blog_etc_comments_blog_etc_post_id_foreign` FOREIGN KEY (`blog_etc_post_id`) REFERENCES `blog_etc_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_etc_post_categories`
--
ALTER TABLE `blog_etc_post_categories`
  ADD CONSTRAINT `blog_etc_post_categories_blog_etc_category_id_foreign` FOREIGN KEY (`blog_etc_category_id`) REFERENCES `blog_etc_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_etc_post_categories_blog_etc_post_id_foreign` FOREIGN KEY (`blog_etc_post_id`) REFERENCES `blog_etc_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions_wallet`
--
ALTER TABLE `transactions_wallet`
  ADD CONSTRAINT `transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_deposit_id_foreign` FOREIGN KEY (`deposit_id`) REFERENCES `transactions_wallet` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_withdraw_id_foreign` FOREIGN KEY (`withdraw_id`) REFERENCES `transactions_wallet` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
