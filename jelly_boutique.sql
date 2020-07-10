-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2023 at 08:36 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jelly_boutique`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(2, '.', 'lorem-ipsum', '/storage/photos/33/Banner/MNT-DESIGN-BANNER-GIAY-DOWNLOAD-MIEN-PHI-1130x570.jpg', '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">Giảm tới 30%</span></h2>', 'active', '2020-08-14 01:50:23', '2023-09-05 23:04:14'),
(4, '.', 'banner', '/storage/photos/33/Banner/maxresdefault.jpg', '<blockquote><h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">Miễn phí giao hàng cho đơn trên 1.000.000đ</span></h2><h6><span style=\"font-family: &quot;Arial Black&quot;;\">﻿</span></h6></blockquote><h2><span style=\"color: rgb(156, 0, 255);\"></span></h2>', 'active', '2020-08-17 20:46:59', '2023-09-05 23:04:41'),
(5, '.', 'banner-test', '/storage/photos/33/Banner/kv_basas_mobileBanner_4_2019.jpg', '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">Giảm tới 10%</span></h2>', 'active', '2022-04-10 09:30:00', '2023-09-05 23:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Adidas', 'adidas', 'active', '2020-08-14 04:23:00', '2020-08-14 04:23:00'),
(2, 'Nike', 'nike', 'active', '2020-08-14 04:23:08', '2020-08-14 04:23:08'),
(3, 'Kappa', 'kappa', 'active', '2020-08-14 04:23:48', '2020-08-14 04:23:48'),
(4, 'Prada', 'prada', 'active', '2020-08-14 04:24:08', '2020-08-14 04:24:08');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(10,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(26, 'Giày Nam', 'giay-the-thao', '<p>Giày thể thao nam nữ<br></p>', '/storage/photos/33/download.jpg', 1, NULL, NULL, 'active', '2023-09-05 23:08:19', '2023-09-05 23:10:38'),
(27, 'Giày Nữ', 'giay-nu', '<p>Giày Nữ đa dạng<br></p>', '/storage/photos/33/istockphoto-907926200-1024x1024.jpg', 1, NULL, NULL, 'active', '2023-09-05 23:10:27', '2023-09-05 23:10:27'),
(28, 'Giày trẻ em', 'giay-tre-em', '<p>Giày trẻ em đa dạng<br></p>', '/storage/photos/33/Product/4297giay-tre-em-new-blance-running-fs996rdi-(3).jpg', 1, NULL, NULL, 'active', '2023-09-05 23:11:10', '2023-09-05 23:11:10'),
(29, 'Giày khuyến mãi', 'giay-khuyen-mai', '<p>Giày khuyến mãi tháng 9<br></p>', '/storage/photos/33/Product/8737242048-1620862535 (1).jpg', 1, NULL, NULL, 'active', '2023-09-05 23:12:06', '2023-09-05 23:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(6, 'GIAMGIAT4', 'percent', '11.00', 'active', '2022-04-25 11:42:51', '2022-04-25 11:43:59'),
(7, 'LOVE-JELLY', 'percent', '20.00', 'active', '2022-04-25 11:43:49', '2022-04-25 11:43:49');

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
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('150cdcf5-c912-4383-a96d-5538d878448c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2022-04-10 08:56:44', '2022-04-10 08:56:44'),
('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:31:21', '2020-08-15 07:31:21'),
('33fbcd3a-160e-417c-b742-c46af5288b2f', 'App\\Notifications\\StatusNotification', 'App\\User', 33, '{\"title\":\"C\\u00f3 \\u0111\\u01a1n h\\u00e0ng m\\u1edbi\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/admin\\/order\\/11\",\"fas\":\"fa-file-alt\"}', '2022-05-19 11:30:41', '2022-04-27 00:57:49', '2022-05-19 11:30:41'),
('3762a12a-e923-4815-8054-e7ca59d9e605', 'App\\Notifications\\StatusNotification', 'App\\User', 33, '{\"title\":\"C\\u00f3 \\u0111\\u01a1n h\\u00e0ng m\\u1edbi\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/admin\\/order\\/17\",\"fas\":\"fa-file-alt\"}', NULL, '2022-05-21 09:09:44', '2022-05-21 09:09:44'),
('3af39f84-cab4-4152-9202-d448435c67de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
('3c496f77-eaac-468c-b202-afd69c7445e7', 'App\\Notifications\\StatusNotification', 'App\\User', 33, '{\"title\":\"C\\u00f3 \\u0111\\u01a1n h\\u00e0ng m\\u1edbi\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/admin\\/order\\/16\",\"fas\":\"fa-file-alt\"}', NULL, '2022-05-21 07:29:07', '2022-05-21 07:29:07'),
('49e28d05-dc44-4650-b427-20e9136c6bfd', 'App\\Notifications\\StatusNotification', 'App\\User', 33, '{\"title\":\"B\\u00ecnh lu\\u1eadn m\\u1edbi \\u0111\\u01b0\\u1ee3c t\\u1ea1o\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/blog-detail\\/mua-quan-ao-online-lieu-co-thuc-su-tot\",\"fas\":\"fas fa-comment\"}', '2022-04-25 11:44:37', '2022-04-25 11:32:08', '2022-04-25 11:44:37'),
('4a0afdb0-71ad-4ce6-bc70-c92ef491a525', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
('503c7c00-3587-462b-bafd-a36dfb7355b8', 'App\\Notifications\\StatusNotification', 'App\\User', 33, '{\"title\":\"C\\u00f3 \\u0111\\u01a1n h\\u00e0ng m\\u1edbi\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/admin\\/order\\/19\",\"fas\":\"fa-file-alt\"}', NULL, '2022-07-03 07:33:08', '2022-07-03 07:33:08'),
('540ca3e9-0ff9-4e2e-9db3-6b5abc823422', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', '2020-08-15 07:30:44', '2020-08-14 07:12:28', '2020-08-15 07:30:44'),
('583cca10-9a7e-4c08-a51f-ebe18f0f5df6', 'App\\Notifications\\StatusNotification', 'App\\User', 33, '{\"title\":\"B\\u00ecnh lu\\u1eadn m\\u1edbi \\u0111\\u01b0\\u1ee3c t\\u1ea1o\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/blog-detail\\/mua-quan-ao-online-lieu-co-thuc-su-tot\",\"fas\":\"fas fa-comment\"}', NULL, '2022-07-03 07:34:44', '2022-07-03 07:34:44'),
('598c4988-99ff-44c6-8bee-a8c692b573c0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2022-04-11 08:26:33', '2022-04-11 08:26:33'),
('5c589337-cb66-4e08-b4bb-dfacb2e6a682', 'App\\Notifications\\StatusNotification', 'App\\User', 33, '{\"title\":\"C\\u00f3 \\u0111\\u01a1n h\\u00e0ng m\\u1edbi\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/admin\\/order\\/12\",\"fas\":\"fa-file-alt\"}', '2022-05-19 11:30:46', '2022-04-29 00:56:30', '2022-05-19 11:30:46'),
('5d8b5057-0447-4c06-817e-e3dbdd424170', 'App\\Notifications\\StatusNotification', 'App\\User', 33, '{\"title\":\"C\\u00f3 \\u0111\\u00e1nh gi\\u00e1 s\\u1ea3n ph\\u1ea9m m\\u1edbi!\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/product-detail\\/bo-tap-gym-nu\",\"fas\":\"fa-star\"}', '2022-05-19 11:30:49', '2022-04-28 09:59:54', '2022-05-19 11:30:49'),
('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:51:02', '2020-08-15 07:51:02'),
('5e91e603-024e-45c5-b22f-36931fef0d90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}', NULL, '2020-08-15 07:44:07', '2020-08-15 07:44:07'),
('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
('754c75a1-ccc0-4200-b6df-95f85fd8813e', 'App\\Notifications\\StatusNotification', 'App\\User', 33, '{\"title\":\"C\\u00f3 \\u0111\\u01a1n h\\u00e0ng m\\u1edbi\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/admin\\/order\\/18\",\"fas\":\"fa-file-alt\"}', NULL, '2022-05-21 18:28:12', '2022-05-21 18:28:12'),
('81942209-edba-4829-b459-24de3fcc621b', 'App\\Notifications\\StatusNotification', 'App\\User', 33, '{\"title\":\"C\\u00f3 \\u0111\\u01a1n h\\u00e0ng m\\u1edbi\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/admin\\/order\\/12\",\"fas\":\"fa-file-alt\"}', '2022-05-09 09:36:53', '2022-05-09 09:35:18', '2022-05-09 09:36:53'),
('8605db5d-1462-496e-8b5f-8b923d88912c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-14 07:20:44', '2020-08-14 07:20:44'),
('86cc4893-9589-4508-8f2c-7b8fe3d6868c', 'App\\Notifications\\StatusNotification', 'App\\User', 33, '{\"title\":\"C\\u00f3 \\u0111\\u01a1n h\\u00e0ng m\\u1edbi\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/admin\\/order\\/14\",\"fas\":\"fa-file-alt\"}', '2022-05-19 11:30:24', '2022-05-11 11:00:52', '2022-05-19 11:30:24'),
('97542d15-92d0-441a-8db2-2e6fd6ac8ea9', 'App\\Notifications\\StatusNotification', 'App\\User', 33, '{\"title\":\"C\\u00f3 \\u0111\\u01a1n h\\u00e0ng m\\u1edbi\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/admin\\/order\\/15\",\"fas\":\"fa-file-alt\"}', '2022-05-19 11:34:35', '2022-05-19 11:34:04', '2022-05-19 11:34:35'),
('9a44d5e2-0e99-4f56-b514-e18d619834eb', 'App\\Notifications\\StatusNotification', 'App\\User', 33, '{\"title\":\"C\\u00f3 \\u0111\\u01a1n h\\u00e0ng m\\u1edbi\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/admin\\/order\\/13\",\"fas\":\"fa-file-alt\"}', '2022-05-19 11:30:38', '2022-05-09 09:47:04', '2022-05-19 11:30:38'),
('a6ec5643-748c-4128-92e2-9a9f293f53b5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-17 21:17:03', '2020-08-17 21:17:03'),
('a8e2cdc0-722b-47d6-a410-45eafdea38b7', 'App\\Notifications\\StatusNotification', 'App\\User', 33, '{\"title\":\"B\\u00ecnh lu\\u1eadn m\\u1edbi \\u0111\\u01b0\\u1ee3c t\\u1ea1o\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/blog-detail\\/mua-quan-ao-online-lieu-co-thuc-su-tot\",\"fas\":\"fas fa-comment\"}', '2022-04-25 11:39:30', '2022-04-25 11:32:29', '2022-04-25 11:39:30'),
('aab7f84a-357c-4b07-b5ae-92e6a4f06681', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}', NULL, '2022-04-11 09:23:01', '2022-04-11 09:23:01'),
('b186a883-42f2-4a05-8fc5-f0d3e10309ff', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2020-08-15 04:17:24', '2020-08-14 22:14:55', '2020-08-15 04:17:24'),
('d2fd7c33-b0fe-47d6-8bc6-f377d404080d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:08:50', '2020-08-14 07:08:50'),
('d5578f59-dd6b-4b66-b033-42503d720fec', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}', NULL, '2022-04-11 09:28:24', '2022-04-11 09:28:24'),
('dff78b90-85c8-42ee-a5b1-de8ad0b21be4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 06:40:54', '2020-08-15 06:40:54'),
('e28b0a73-4819-4016-b915-0e525d4148f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}', NULL, '2020-08-17 21:08:16', '2020-08-17 21:08:16'),
('e2c9c58b-a066-4bee-ae6e-48c191dc1d39', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/jellyboutique.vtest:85\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2022-04-11 08:37:28', '2022-04-11 08:37:28'),
('ffffa177-c54e-4dfe-ba43-27c466ff1f4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(10,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(10,2) DEFAULT NULL,
  `total_amount` double(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('thinhtest222@gmail.com', '$2y$10$UpffYw4dpalbkPbK4U.G0eESzAPNL51Z4mMMKJa7Isx5h5Z/owehy', '2022-04-21 07:10:03'),
('thinhtest111@gmail.com', '$2y$10$Bs7ZIpjeJxaXkcZJVQsA2OdoPec6PNN6Co7CWD4OwEGeKnldJqgg2', '2022-04-21 07:15:47'),
('thinhphuongxa1@gmail.com', '$2y$10$zrt0Y16waKaRz4oX1sYgteMUFa2PGL9.ubqeQwA1f9nObdcg4MvXO', '2022-05-19 09:44:24');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Đồ công sở, màu nào phù hợp với bạn ?', 'do-cong-so-mau-nao-phu-hop-voi-ban', '<p>Đồ công sở, màu nào phù hợp với bạn ?<br></p>', '<p>Đồ công sở, màu nào phù hợp với bạn ?<br></p>', '<p>Đồ công sở, màu nào phù hợp với bạn ?<br></p>', '/storage/photos/33/Blog/blog1.jpg', '', 7, NULL, 35, 'active', '2022-04-25 11:24:08', '2022-04-25 11:24:08'),
(9, 'Chọn quần áo sao cho phù hợp ?', 'chon-quan-ao-sao-cho-phu-hop', '<p>Chọn quần áo sao cho phù hợp ?<br></p>', '<p>Chọn quần áo sao cho phù hợp ?<br></p>', '<p>Chọn quần áo sao cho phù hợp ?<br></p>', '/storage/photos/33/Blog/blog2.jpg', '', 9, NULL, 35, 'active', '2022-04-25 11:28:27', '2022-04-25 11:28:27'),
(10, 'Mua Giày  Online, liệu có thực sự tốt ?', 'mua-quan-ao-online-lieu-co-thuc-su-tot', '<p>Mua Giày&nbsp;&nbsp;Online, liệu có thực sự tốt ?<br></p>', '<p>Mua Giày&nbsp;&nbsp;Online, liệu có thực sự tốt ?<br></p>', '<p>Mua Giày Online, liệu có thực sự tốt ?<br></p>', '/storage/photos/33/gia-y-the-thao-nike-downshifter-11-black-coast-cw3411-001-mau-den-size-42-5-636efcabc6d13-12112022085347.jpg', '', 9, NULL, 34, 'active', '2022-04-25 11:31:35', '2023-09-05 23:33:06');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Thể thao', 'the-thao', 'active', '2022-04-25 11:20:11', '2022-04-25 11:20:11'),
(7, 'Công sở', 'cong-so', 'active', '2022-04-25 11:20:18', '2022-04-25 11:20:18'),
(8, 'Bảo quản quần áo', 'bao-quan-quan-ao', 'active', '2022-04-25 11:20:27', '2022-04-25 11:20:27'),
(9, 'Cách chọn quần áo', 'cach-chon-quan-ao', 'active', '2022-04-25 11:27:59', '2022-04-25 11:27:59');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(8, 33, 10, 'Có khả năng', 'active', NULL, NULL, '2022-04-25 11:32:08', '2022-04-27 01:59:30'),
(9, 33, 10, 'Tớ tự rep comment của tớ nè', 'inactive', NULL, 8, '2022-04-25 11:32:29', '2022-04-27 01:59:34'),
(10, 43, 10, 'bài viết hay (Đã sửa) (Admin sửa)', 'active', NULL, NULL, '2022-07-03 07:34:44', '2022-07-03 07:46:09');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Công sở', 'cong-so', 'active', '2022-04-25 11:34:58', '2022-04-25 11:34:58'),
(6, 'Thể thao', 'the-thao', 'active', '2022-04-25 11:35:05', '2022-04-25 11:35:05'),
(7, 'Bảo quản quần áo', 'bao-quan-quan-ao', 'active', '2022-04-25 11:35:17', '2022-04-25 11:35:17');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(20,2) NOT NULL,
  `discount` double(10,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(21, 'Giày Thể Thao Nam MWC - 5417 Giày Thể Thao Nam Phối Sọc Thể Thao,', 'giay-the-thao-nam-mwc-5417-giay-the-thao-nam-phoi-soc-the-thao', '<p dir=\"ltr\" style=\"padding: 0px; margin: 0pt 0px 3pt; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; line-height: 1.716; text-align: justify; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space-collapse: preserve; outline: none !important;\">MÔ TẢ SẢN PHẨM : Giày Thể Thao Nam MWC - 5417</span></p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style: none; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; padding-inline-start: 48px; outline: none !important;\"><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 3pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Giày được thiết kế kiểu dáng buộc dây sneaker cực ngầu phối sọc thể thao năng động, phong cách hiện đại,màu sắc khỏe khoắn.</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 3pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Với chất vải Flyknit chuyên dụng tạo cảm giác thoải mái cho bạn trong suốt quá trình vận động, mang lại một phong cách thật thời thượng mỗi khi xuống phố.&nbsp;</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0px; margin: 0pt 0px 3pt; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Sản phẩm có thiết kế tinh tế cùng đường may tỉ mỉ, chắc chắn, thích hợp trong các hoạt động thể thao, dạo chơi, picnic</span></p></li></ul>', '<p dir=\"ltr\" style=\"padding: 0px; margin: 0pt 0px 3pt; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; line-height: 1.716; text-align: justify; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space-collapse: preserve; outline: none !important;\">CHI TIẾT SẢN PHẨM</span></p><p style=\"padding: 0px; margin-right: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; outline: none !important;\"><span id=\"docs-internal-guid-9dc2c2d1-7fff-5a91-2ba2-ec284d3dc9da\" style=\"padding: 0px; margin: 0px; outline: none !important;\"></span></p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style: none; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; padding-inline-start: 48px; outline: none !important;\"><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 3pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Chiều cao giày 3cm</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 3pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Chất liệu vải Flyknit cao cấp</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 3pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Chất liệu đế cao su đúc êm mềm, độ đàn hồi tốt, chống trơn trượt</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 3pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Kiểu dáng giày thể thao nam cổ thấp</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 3pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Màu sắc: Kem - Đen</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 3pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Size: 39 - 40- 41 - 42 -43</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0px; margin: 0pt 0px 3pt; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Xuất xứ: Việt Nam </span></p></li></ul>', '/storage/photos/33/Product/11593421642-242872808.jpg', 8, '39,41,42', 'new', 'active', 679000.00, 10.00, 1, 26, NULL, 1, '2023-09-05 23:14:55', '2023-09-05 23:14:55'),
(22, 'Giày Thể Thao Nam MWC NATT- 5444 Giày Thể Thao Nam Cao Cấp, Sneaker Nam Cổ Thấp Năng Động Cá Tính', 'giay-the-thao-nam-mwc-natt-5444-giay-the-thao-nam-cao-cap-sneaker-nam-co-thap-nang-dong-ca-tinh', '<p dir=\"ltr\" style=\"padding: 0px; margin: 0pt 0px 2pt; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; line-height: 1.716; text-align: justify; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-family: Arial; color: rgb(67, 67, 67); font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space-collapse: preserve; outline: none !important;\">MÔ TẢ SẢN PHẨM : Giày Thể Thao Nam MWC NATT - 5444</span></p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style: none; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; padding-inline-start: 48px; outline: none !important;\"><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 2pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Giày được thiết kế theo phong cách hiện đại, phối màu thời trang,phong cách khỏe khoắn,sang trọng mang đến cho bạn 1 diện mạo hoàn toàn cá tính.&nbsp;</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 2pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Đặc biệt sản phẩm sử dụng chất liệu cao cấp có độ bền tối ưu giúp bạn thoải mái trong mọi hoàn cảnh.</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0px; margin: 0pt 0px 2pt; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Chất liệu cao cấp : thoáng khí cả mặt trong lẫn mặt ngoài khiến người mang luôn cảm thấy dễ chịu dù hoạt động trong thời gian dài.</span></p></li></ul>', '<p dir=\"ltr\" style=\"padding: 0px; margin: 0pt 0px 2pt; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; line-height: 1.716; text-align: justify; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-family: Arial; color: rgb(67, 67, 67); font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space-collapse: preserve; outline: none !important;\">CHI TIẾT SẢN PHẨM</span></p><p style=\"padding: 0px; margin-right: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; outline: none !important;\"><span id=\"docs-internal-guid-d2cba49e-7fff-9f01-f041-66fd73691d58\" style=\"padding: 0px; margin: 0px; outline: none !important;\"></span></p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style: none; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; padding-inline-start: 48px; outline: none !important;\"><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 2pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Chiều cao giày 3cm</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 2pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Chất liệu : da PU cao cấp</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 2pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Chất liệu đế cao su đúc êm mềm, độ đàn hồi tốt, chống trơn trượt</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 2pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Kiểu dáng giày Sneaker cổ thấp</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 2pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Màu sắc: Xanh Rêu - Xanh Biển</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 2pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Size: 39 - 40- 41 - 42 -43</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 2pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Xuất xứ : Việt Nam&nbsp;</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 2pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Chú ý : Kích thước so sánh một cách cẩn thận,vui lòng cho phép sai số 1-3 cm do đo lường thủ công</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 2pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Do màn hình hiển thị khác nhau và ánh sáng khác nhau, hình ảnh có thể chênh lệch 5-&gt;10% màu sắc thật của sản phẩm.</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(67, 67, 67); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0px; margin: 0pt 0px 2pt; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Cảm ơn bạn đã thông cảm.</span></p></li></ul>', '/storage/photos/33/Product/mwc (2).jpg', 88, '41,42,43', 'hot', 'active', 790000.00, 15.00, 1, 26, NULL, 2, '2023-09-05 23:16:28', '2023-09-05 23:16:28'),
(32, 'Giày Thể Thao Nam Phối Sọc Thể Thao,Sneaker Nam Cổ Thấp Năng Động Cá Tính', 'x', '<p dir=\"ltr\" style=\"padding: 0px; margin: 0pt 0px 3pt; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; line-height: 1.716; text-align: justify; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space-collapse: preserve; outline: none !important;\">MÔ TẢ SẢN PHẨM : Giày Thể Thao Nam MWC - 5419</span></p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style: none; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; padding-inline-start: 48px; outline: none !important;\"><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 3pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Giày được thiết kế kiểu dáng buộc dây sneaker cực ngầu phối sọc thể thao năng động, phong cách hiện đại,màu sắc khỏe khoắn.</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 3pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Với chất vải Flyknit chuyên dụng tạo cảm giác thoải mái cho bạn trong suốt quá trình vận động, mang lại một phong cách thật thời thượng mỗi khi xuống phố.&nbsp;</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0px; margin: 0pt 0px 3pt; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Sản phẩm có thiết kế tinh tế cùng đường may tỉ mỉ, chắc chắn, thích hợp trong các hoạt động thể thao, dạo chơi, picnic</span></p></li></ul>', '<p dir=\"ltr\" style=\"padding: 0px; margin: 0pt 0px 3pt; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; line-height: 1.716; text-align: justify; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space-collapse: preserve; outline: none !important;\">CHI TIẾT SẢN PHẨM</span></p><p style=\"padding: 0px; margin-right: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; outline: none !important;\"><span id=\"docs-internal-guid-9e61816e-7fff-b862-55c2-b7146dc5ec60\" style=\"padding: 0px; margin: 0px; outline: none !important;\"></span></p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style: none; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; padding-inline-start: 48px; outline: none !important;\"><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 3pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Chiều cao giày 3cm</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 3pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Chất liệu vải Flyknit cao cấp</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 3pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Chất liệu đế cao su đúc êm mềm, độ đàn hồi tốt, chống trơn trượt</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 3pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Kiểu dáng giày thể thao nam cổ thấp</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 3pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Màu sắc: Xám - Đen - Trắng</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0pt 0pt 3pt; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Size: 39 - 40- 41 - 42 -43</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0px; margin: 0pt 0px 3pt; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Xuất xứ: Việt Nam </span></p></li></ul>', '/storage/photos/33/Product/mwc (3).jpg', 4, '', 'new', 'active', 9000000.00, 5.00, 1, 26, NULL, 3, '2023-09-05 23:28:27', '2023-09-05 23:30:55'),
(33, 'Giày sandal nữ MWC NUSD- 2889', 'giay-sandal-nu-mwc-nusd-2889', '<p dir=\"ltr\" style=\"padding: 0px; margin: 0pt 0px; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; line-height: 1.716; text-align: justify; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space-collapse: preserve; outline: none !important;\">MÔ TẢ SẢN PHẨM</span></p><p style=\"padding: 0px; margin-right: 0px; margin-left: 0px; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; outline: none !important;\"><span id=\"docs-internal-guid-ed5e58dd-7fff-5ae1-7e95-8796749b1d7f\" style=\"padding: 0px; margin: 0px; outline: none !important;\"></span></p><ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style: none; color: rgba(0, 0, 0, 0.85); font-family: MuliDisplayVN, sans-serif; font-size: 14px; padding-inline-start: 48px; outline: none !important;\"><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0px; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Giày sandal nữ MWC NUSD- 2889 sử dụng chất liệu da bóng bền đẹp, lớp lót giày mềm mại cực kỳ êm chân.&nbsp;</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0px; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Đường may tỉ mỉ, form giày chuẩn đem lại cảm giác thoải mái cho bạn gái khi mang.</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0px; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Bên cạnh đó, sản phẩm Giày sandal nữ MWC NUSD- 2889 có kiểu dáng hiện đại, thời trang giúp tôn vinh đôi chân của phái nữ.</span></p></li><li dir=\"ltr\" aria-level=\"1\" style=\"padding: 0px; margin: 0px; list-style: disc; font-size: 10.5pt; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre; outline: none !important;\"><p dir=\"ltr\" role=\"presentation\" style=\"padding: 0px; margin: 0pt 0px; line-height: 1.716; outline: none !important;\"><span style=\"padding: 0px; margin: 0px; font-size: 10.5pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; text-wrap: wrap; outline: none !important;\">Có thể phối hợp với nhiều phong cách, phù hợp với nhiều hoàn cảnh như đi làm, đi học, đi chơi</span></p></li></ul>', '<p>z</p>', '/storage/photos/33/Product/mwc (4).jpg', 33, '38,39,40', 'new', 'active', 678000.00, 30.00, 1, 27, NULL, 3, '2023-09-05 23:32:03', '2023-09-05 23:32:03');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Mong muốn đáp ứng nhu cầu của khách hàng.', 'Mong muốn đáp ứng nhu cầu của khách hàng.', '/storage/photos/33/images.png', '/storage/photos/33/images.png', 'Phố Nhổn - Hà Nội', '0384972984', 'codedoan.com@gmail.com', NULL, '2023-09-05 23:36:22');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hà Nội', '40000.00', 'active', '2020-08-14 04:22:17', '2022-04-25 11:14:54'),
(2, 'Phú Thọ', '30000.00', 'active', '2020-08-14 04:22:41', '2022-04-25 11:15:11'),
(3, 'Vĩnh Phúc', '40000.00', 'active', '2020-08-15 06:54:04', '2022-04-25 11:15:27'),
(4, 'Ninh Bình', '35000.00', 'active', '2020-08-17 20:50:48', '2022-04-25 11:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8 NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(33, 'Admin', 'admin@gmail.com', NULL, '$2y$10$J56ypr5kia9iVvw1UEX9Auk2AwUQ9uO.eHE1.CuwP6ZxH4wgzaIyW', '/storage/photos/31/User/42195889_2218845655070033_5061281232172613632_n.jpg', 'admin', NULL, NULL, 'active', 'gdzsCgQlaxurWrKxnE31akm7B5nD9cTzqpNTl40sNDZ1gvlOsRJ2deookRRa', NULL, NULL),
(34, 'Linh', 'user@gmail.com', NULL, '$2y$10$An0KdWoqcI1JK8Fj7Db2burUfxtf2xbNSnLDr.4mbsUqvlR7E954.', '/storage/photos/33/User/4-ceo-viet-tuoi-suu-tai-gioi-dang-dieu-hanh-doanh-nghiep-nao.jpg', 'user', NULL, NULL, 'active', NULL, '2022-04-25 09:04:15', '2022-04-25 09:05:00'),
(35, 'Thịnh', 'thinhphuongxa1@gmail.com', NULL, '$2y$10$W8jNnJgUSG5zfXjWPW6KTeaM9uI2U0jOxozG/N0Ody6rf1.X/bssO', '/storage/photos/33/User/logo-comics-food-bar-hd-png.png', 'user', NULL, NULL, 'active', NULL, '2022-04-25 09:04:15', '2022-04-25 09:04:15'),
(36, 'Minh', 'minh@gmail.com', NULL, '$2y$10$AtPfHsxPzg7P8vooZEQBPeIc1mEpWh.sIOG1LNoAWBf9MytBDp5Dm', '/storage/photos/33/User/4-ceo-viet-tuoi-suu-tai-gioi-dang-dieu-hanh-doanh-nghiep-nao.jpg', 'user', NULL, NULL, 'active', NULL, '2022-04-27 02:05:54', '2022-04-28 11:11:36'),
(37, 'user1', 'user1@gmail.com', NULL, '$2y$10$kxkc4NscWvCxh0t/7nYIqOCOSJPwfrMLmawfwmxnJlCAFcbLvZWfC', NULL, 'user', NULL, NULL, 'active', NULL, '2022-05-11 10:04:16', '2022-05-11 10:04:16'),
(38, 'user2', 'user2@gmail.com', NULL, '$2y$10$RwduGWnyr96mK.DqvYi5Cex7ZujywKNJQ9lTfR9tuds36mUvc7Jie', NULL, 'user', NULL, NULL, 'active', NULL, '2022-05-19 08:11:39', '2022-05-19 08:11:39'),
(39, 'user3', 'user3@gmail.com', NULL, '$2y$10$DCyzfOKCmgt2njr8D7Z.ZeZ2pFVly/chBrJeqJFwYBjXipliyPs26', NULL, 'user', NULL, NULL, 'active', NULL, '2022-05-20 08:12:05', '2022-05-20 08:12:05'),
(40, 'user4', 'user4@gmail.com', NULL, '$2y$10$IbppthaqLsoS9QOEH3gWtu7cPiEzhY.lUeEFEz4EGVXBivJL8kN8y', NULL, 'user', NULL, NULL, 'active', NULL, '2022-05-21 08:12:28', '2022-05-21 08:12:28'),
(41, 'Cthinh', 'user123@gmail.com', NULL, '$2y$10$Ck/1ty46AupHTwcjJjRV1OFRhvLiueFWhFzZazs62K6y/GNkG39Ey', NULL, 'user', NULL, NULL, 'active', NULL, '2022-06-28 20:33:16', '2022-06-28 20:33:16'),
(42, 'Linh 2', 'linh2@gmail.com', NULL, '$2y$10$YprolQJNhqtXz1zBkwWjWues3yTuuNjpmb2Vk0p7EcUAoeAKSKiIO', NULL, 'user', NULL, NULL, 'active', NULL, '2022-07-03 07:29:33', '2022-07-03 07:29:33'),
(43, 'linh 3', 'linh3@gmail.com', NULL, '$2y$10$A/Sb7.II/R5.Bmc2PxPO7OKl505Vcsps7jxRHVSZpLjTQuEMss/yq', NULL, 'user', NULL, NULL, 'active', NULL, '2022-07-03 07:31:20', '2022-07-03 07:31:20'),
(44, 'ppp', 'pppppp@gmail.com', NULL, '$2y$10$J56ypr5kia9iVvw1UEX9Auk2AwUQ9uO.eHE1.CuwP6ZxH4wgzaIyW', NULL, 'user', NULL, NULL, 'active', NULL, '2023-09-05 23:01:19', '2023-09-05 23:01:19');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
