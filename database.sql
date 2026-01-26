-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2023 at 05:42 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `haha`
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
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Provide Your Customers with Healthy Options by Stocking up on Fresh Vegetables', 'fefefw', '/storage/photos/1/Banner/Grow-Celery.jpg', '<p><span style=\"color: rgb(247, 247, 247);\">Unleash Your Culinary Creativity: Explore the Freshest Wholesale Produce and Craft Extraordinary Dishes. From Vibrant Vegetables to Exotic Fruits and Fragrant Herbs, Let Your Imagination Run Wild in the Kitchen.</span></p>', 'active', '2023-05-29 22:23:05', '2023-05-31 17:20:38');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 2, 4050.00, 'new', 3, 15000.00, '2023-05-31 17:38:06', '2023-05-31 17:38:17'),
(2, 6, 3, 31, 3560.00, 'new', 2, 7560.00, '2023-05-31 22:52:32', '2023-06-13 04:50:38'),
(3, 17, 3, 31, 3010.00, 'new', 1, 3500.00, '2023-06-13 04:49:10', '2023-06-13 04:50:38'),
(4, 15, 4, 31, 2300.00, 'new', 1, 2500.00, '2023-06-13 04:56:11', '2023-06-13 05:03:26'),
(5, 18, 5, 31, 780.00, 'new', 1, 1000.00, '2023-06-13 05:04:03', '2023-06-13 05:04:14'),
(6, 18, NULL, 31, 780.00, 'new', 1, 1000.00, '2023-06-13 05:08:37', '2023-06-13 05:08:37'),
(7, 19, 6, 1, 1410.00, 'new', 1, 1500.00, '2023-06-13 05:21:20', '2023-06-13 05:34:49'),
(8, 15, 7, 1, 2300.00, 'new', 9, 20700.00, '2023-06-13 05:36:47', '2023-06-13 06:22:44'),
(9, 5, NULL, 1, 3280.00, 'new', 4, 16000.00, '2023-06-13 06:23:02', '2023-06-13 06:23:02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
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
(1, 'Vegetables', 'vegetables', NULL, '/storage/photos/1/Category/vegetables.jpg', 1, NULL, NULL, 'active', '2023-05-21 08:00:00', '2023-05-21 14:52:29'),
(2, 'Fruits', 'fruits', NULL, '/storage/photos/1/Category/fruits.jpg', 1, NULL, NULL, 'active', '2023-05-21 08:00:00', '2023-05-21 08:00:00'),
(3, 'Herbs', 'aromatic-herbs', NULL, '/storage/photos/1/Category/aromatic-herbs.jpg', 1, NULL, NULL, 'active', '2023-05-21 08:00:00', '2023-05-29 20:51:46');

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'Prajwal Rai', 'About price', 'prajwal.iar@gmail.com', NULL, '9807009999', 'Hello sir i am from kathmandu nepal.', '2020-08-14 08:25:46', '2020-08-14 08:00:01', '2020-08-14 08:25:46'),
(2, 'Prajwal Rai', 'About Price', 'prajwal.iar@gmail.com', NULL, '9800099000', 'Hello i am Prajwal Rai', '2020-08-18 03:04:15', '2020-08-15 07:52:39', '2020-08-18 03:04:16'),
(3, 'Prajwal Rai', 'lorem ipsum', 'prajwal.iar@gmail.com', NULL, '1200990009', 'hello sir sdfdfd dfdjf ;dfjd fd ldkfd', '2023-05-22 15:35:43', '2020-08-17 21:15:12', '2023-05-22 15:35:43'),
(4, 'OTMANE hanine', 'Message de test', 'OTMANE.HANINE@ENIM.AC.MA', NULL, '0618705577', 'Message de test , pour tester le dashboard', '2023-06-05 20:00:30', '2023-06-01 00:27:05', '2023-06-05 20:00:30');

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
(20, '2020_08_01_143408_create_settings_table', 1),
(21, '2023_05_19_144625_remove_brand_from_products_table', 2);

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
('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:31:21', '2020-08-15 07:31:21'),
('250c54f1-5c27-4f8d-9e56-5c5f38b66682', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/square-pepper\",\"fas\":\"fa-star\"}', NULL, '2023-06-13 06:29:29', '2023-06-13 06:29:29'),
('3af39f84-cab4-4152-9202-d448435c67de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
('419fee3b-106e-4188-a78d-8382b1fda29a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/round-tomato\",\"fas\":\"fa-star\"}', '2023-06-05 20:01:45', '2023-06-01 00:11:55', '2023-06-05 20:01:45'),
('4a0afdb0-71ad-4ce6-bc70-c92ef491a525', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
('540ca3e9-0ff9-4e2e-9db3-6b5abc823422', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', '2020-08-15 07:30:44', '2020-08-14 07:12:28', '2020-08-15 07:30:44'),
('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:51:02', '2020-08-15 07:51:02'),
('5e91e603-024e-45c5-b22f-36931fef0d90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}', NULL, '2020-08-15 07:44:07', '2020-08-15 07:44:07'),
('6d197b81-1779-489a-a167-22ab17a36874', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2023-06-13 05:03:26', '2023-06-13 05:03:26'),
('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
('80b7989e-e970-47b1-b87b-97cc5a9a9cbb', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2023-06-13 05:34:49', '2023-06-13 05:34:49'),
('8605db5d-1462-496e-8b5f-8b923d88912c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-14 07:20:44', '2020-08-14 07:20:44'),
('980054ee-6c63-48e2-ac01-e9d1f643a259', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2023-06-13 06:18:48', '2023-06-13 06:18:48'),
('a6ec5643-748c-4128-92e2-9a9f293f53b5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-17 21:17:03', '2020-08-17 21:17:03'),
('b186a883-42f2-4a05-8fc5-f0d3e10309ff', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2020-08-15 04:17:24', '2020-08-14 22:14:55', '2020-08-15 04:17:24'),
('c2ff31ea-4b7e-46dc-aff1-3b4b3efe5280', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2023-06-13 05:04:14', '2023-06-13 05:04:14'),
('ce5c17a7-1172-4068-9379-dcd3313f276f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2023-06-13 04:50:38', '2023-06-13 04:50:38'),
('d2fd7c33-b0fe-47d6-8bc6-f377d404080d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:08:50', '2020-08-14 07:08:50'),
('dff78b90-85c8-42ee-a5b1-de8ad0b21be4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 06:40:54', '2020-08-15 06:40:54'),
('e28b0a73-4819-4016-b915-0e525d4148f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}', NULL, '2020-08-17 21:08:16', '2020-08-17 21:08:16'),
('ffffa177-c54e-4dfe-ba43-27c466ff1f4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(1, 'ORD-PMIQF5MYPK', 3, 14399.00, NULL, 573.90, 13925.10, 6, 'cod', 'unpaid', 'delivered', 'Prajwal', 'Rai', 'prajwal.iar@gmail.com', '9800887778', 'NP', '44600', 'Koteshwor', 'Kathmandu', '2020-08-14 07:20:44', '2020-08-14 09:37:37'),
(2, 'ORD-YFF8BF0YBK', 2, 1939.03, NULL, NULL, 2039.03, 1, 'cod', 'unpaid', 'delivered', 'Sandhya', 'Rai', 'user@gmail.com', '90000000990', 'NP', NULL, 'Lalitpur', NULL, '2020-08-14 22:14:49', '2020-08-14 22:15:19'),
(3, 'ORD-Q5IILFZJVJ', 31, 11060.00, NULL, NULL, 11460.00, 3, 'cod', 'unpaid', 'new', 'OTMANE', 'hanine', '1otmanehanine@gmail.com', '0618705577', 'MA', '23350', 'QUT DAKHLA BLOC 2 N 65 KASBA TADLA', NULL, '2023-06-13 04:50:38', '2023-06-13 04:50:38'),
(4, 'ORD-VRUDX49IJ7', 31, 2500.00, NULL, NULL, 2500.00, 1, 'cod', 'unpaid', 'new', 'OTMANE', 'hanine', '1otmanehanine@gmail.com', '0618705577', 'MA', '23350', 'QUT DAKHLA BLOC 2 N 65 KASBA TADLA', NULL, '2023-06-13 05:03:26', '2023-06-13 05:03:26'),
(5, 'ORD-UDQEILSG9U', 31, 1000.00, NULL, NULL, 1400.00, 1, 'cod', 'unpaid', 'new', 'OTMANE', 'hanine', '1otmanehanine@gmail.com', '0618705577', 'MA', '23350', 'QUT DAKHLA BLOC 2 N 65 KASBA TADLA', NULL, '2023-06-13 05:04:14', '2023-06-13 05:04:14'),
(6, 'ORD-IQCA86D1SZ', 1, 1500.00, 7, NULL, 1502.00, 1, 'cod', 'unpaid', 'new', 'OTMANE', 'hanine', '1otmanehanine@gmail.com', '0618705577', 'MA', '23350', 'QUT DAKHLA BLOC 2 N 65 KASBA TADLA', NULL, '2023-06-13 05:34:49', '2023-06-13 05:34:49'),
(7, 'ORD-C1ZV3EOAB3', 1, 2300.00, 7, NULL, 2302.00, 1, 'cod', 'unpaid', 'new', 'OTMANE', 'hanine', '1otmanehanine@gmail.com', '0618705577', 'MA', '23350', 'QUT DAKHLA BLOC 2 N 65 KASBA TADLA', NULL, '2023-06-13 06:18:48', '2023-06-13 06:18:48');

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
('pickinodenero@gmail.com', '$2y$10$cD0lDlWUa98gGIUuck4KseNtM.Te/DMEB1GHG1LD0jTo2GKGyvK4W', '2023-05-31 22:45:31'),
('otmane.hanine@enim.ac.ma', '$2y$10$T7c8Aj5P3ZyYlexzL.LnsOltey3mvzKMeiMfVkIoKL.XRz80VoZpm', '2023-05-31 23:00:48');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `quote` text COLLATE utf8mb4_unicode_ci,
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
(1, 'Moroccan Cuisine: The Perfect Blend of Tradition and Freshness', 'moroccan-cuisine-the-perfect-blend-of-tradition-and-freshness', '<p>Discover the vibrant flavors and aromatic spices of Moroccan cuisine in this captivating article. Explore the rich culinary traditions that have made Moroccan dishes renowned worldwide.<br></p>', '<p><span style=\"font-size: 1rem;\">Moroccan cuisine is renowned for its vibrant flavors, aromatic spices, and a perfect balance of tradition and freshness. With its diverse influences from Berber, Arab, and Mediterranean cultures, Moroccan dishes offer a unique and tantalizing culinary experience. One of the key elements that sets Moroccan cuisine apart is the use of fresh and wholesome ingredients sourced directly from local farms. From the bustling souks to the fertile valleys, Morocco\'s agricultural landscape provides a rich abundance of fruits, vegetables, and aromatic herbs that form the foundation of its culinary traditions. The local markets, known as \"souks,\" are a treasure trove of colorful produce, showcasing the bountiful harvest of Moroccan farms. From juicy tomatoes and plump eggplants to fragrant herbs like mint, coriander, and parsley, these fresh ingredients form the building blocks of Moroccan dishes. When it comes to Moroccan cuisine, freshness is paramount. The emphasis on using locally grown produce ensures that every dish bursts with flavor and nutritional value. The tomatoes are plucked at the peak of ripeness, offering a burst of sweet tanginess in every bite. The eggplants, known for their silky texture, absorb the aromatic spices and herbs, creating a symphony of flavors. And the aromatic herbs, carefully selected and freshly picked, add a delightful freshness to the dishes. From classic Moroccan tagines to couscous dishes and fragrant salads, the use of fresh produce elevates the taste and authenticity of Moroccan cuisine. The combination of sweet and savory flavors, enhanced by aromatic spices like cumin, cinnamon, and saffron, creates a culinary journey that is both comforting and adventurous. To fully experience the wonders of Moroccan cuisine, it is essential to embrace the concept of farm-to-table dining. By supporting local farmers and incorporating fresh Moroccan wholesale fruits, vegetables, and aromatic herbs into your cooking, you not only enhance the taste and quality of your dishes but also contribute to a sustainable food system. Whether you\'re a professional chef or a home cook, exploring Moroccan cuisine is an invitation to embark on a flavorful adventure. With its perfect blend of tradition and freshness, Moroccan dishes offer a sensory delight that captures the essence of this enchanting North African country. So, next time you step into your kitchen, channel the spirit of Moroccan cuisine by incorporating the vibrant and fresh ingredients that have made it a culinary treasure. Let the flavors of Morocco transport you to a world where tradition and freshness come together in every dish.</span><br></p>', NULL, '/storage/photos/1/Blog/article image.jpg', 'morocco', 1, NULL, 1, 'active', '2023-05-29 23:30:40', '2023-05-29 23:31:44'),
(2, 'Enter How Morocco\'s Wholesale Market is Becoming a Global Game-Changer', 'enter-how-moroccos-wholesale-market-is-becoming-a-global-game-changer', '<p><font face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space: pre-wrap;\">Uncover how Morocco\'s wholesale market is reshaping the industry with digital technologies and sustainable farming practices.</span></font><br></p>', 'In the context of the international wholesale market, Morocco has been increasingly staking its claim as a serious contender. Known for its diverse climate and fertile lands, Morocco has always had the potential to be a significant player in the wholesale market. Over the past few years, this potential has translated into a tangible reality. Today, Morocco\'s wholesale market is recognized as a global game-changer, transforming the industry and setting a new standard. Part of this transformation comes from Morocco\'s strategic geographic location at the intersection of Europe and Africa. This unique position provides Moroccan wholesalers with an advantage in terms of accessibility and logistics. Products are easily transported across the Mediterranean, reaching Europe\'s vast market swiftly and efficiently. The benefits of this have been particularly apparent in the fruit and vegetable wholesale industry, where freshness is key. In addition, Morocco\'s commitment to adopting innovative agricultural techniques plays a crucial role in its success. Techniques such as drip irrigation, greenhouses, and organic farming have significantly improved crop quality and yield. Consequently, the quality of Moroccan wholesale fruits and vegetables is high, creating an increased demand in international markets. But what truly sets Morocco apart in the global wholesale scene is its embrace of technology. Recognizing the importance of digital transformation, Moroccan wholesalers have incorporated online platforms into their business models. With the ability to buy fruit and vegetables online in bulk, customers around the globe can enjoy fresh, quality produce straight from Moroccan farms. This digital transformation not only broadens Morocco\'s customer base but also streamlines operations, ensuring efficiency and reliability. Furthermore, there\'s an increasing focus on sustainability within Morocco\'s wholesale industry. Conscious of the environmental implications of large-scale farming, Moroccan wholesalers are advocating for sustainable farming practices. Organic farming, in particular, is gaining traction, with more and more farms obtaining organic certification each year. This dedication to sustainable and organic farming resonates with global consumers, further driving demand for Moroccan products. In conclusion, the rise of Morocco\'s wholesale market is a reflection of the country\'s potential and its commitment to innovation, quality, and sustainability. By continually adapting to the needs of the global market, Morocco is proving itself to be a formidable player in the international wholesale industry. As a result, it\'s not just changing the game; it\'s setting a new standard for others to follow.', NULL, '/storage/photos/1/Blog/300763615_100542672790013_905498685631598359_n.jpg', 'Moroccan wholesale market,bulk buying', 2, NULL, 1, 'active', '2023-05-31 17:07:42', '2023-05-31 17:14:53'),
(3, 'Morocco’s Agricultural Sector: A Beacon of Sustainability', 'moroccos-agricultural-sector-a-beacon-of-sustainability', '<p><font face=\"Söhne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji\"><span style=\"white-space: pre-wrap;\">Explore Morocco\'s commitment to sustainability in agriculture, attracting customers with high-quality, sustainably grown produce.</span></font><br></p>', '<span style=\"font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; white-space: pre-wrap;\">Moroccan agriculture is undergoing a revolution, moving towards more sustainable and efficient practices. For a country known for its rich and diverse agricultural products, particularly fruits in Morocco, this transformation holds significant promise. By adopting modern farming techniques, farmers are improving crop yield, reducing waste, and promoting sustainability. With its recent focus on producing high-quality, wholesale fruits and vegetables, Morocco is quickly becoming a leading exporter in the agricultural sector. Coupled with a favorable climate and fertile soil, the country is an ideal location for growing a variety of fruits and vegetables, which are highly sought after on a global scale. One innovation propelling Moroccan agriculture forward is the use of digital tools and advanced analytics. By tapping into these resources, farmers can optimize their irrigation systems, ensuring that crops receive the right amount of water at the right time. This, in turn, boosts productivity while conserving water - a precious resource in the region. Moreover, the Moroccan government is showing increased support for organic farming, which is in line with global trends. This move encourages farmers to adopt sustainable farming practices that are beneficial to both the environment and consumers. As a result, the demand for Moroccan organic products is rising, particularly in European markets. In conclusion, the future of Moroccan agriculture seems promising. With its commitment to sustainable farming and innovative techniques, Morocco is well on its way to becoming a major player in the global agricultural industry.</span>', NULL, '/storage/photos/1/309392905_119874327523514_1001660616513886635_n.jpg', 'Moroccan wholesale market,sustainable farming', 3, NULL, 1, 'active', '2023-05-31 17:09:06', '2023-05-31 17:13:11');

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
(1, 'Food & Recipes', 'food-recipes', 'active', '2023-05-29 23:26:02', '2023-05-29 23:26:02'),
(2, 'Wholesale & Market Trends', 'wholesale-market-trends', 'active', '2023-05-31 17:01:51', '2023-05-31 17:01:51'),
(3, 'Sustainability & Environment', 'sustainability-environment', 'active', '2023-05-31 17:01:58', '2023-05-31 17:01:58');

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
  `replied_comment` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Testing comment edited', 'active', NULL, NULL, '2020-08-14 07:08:42', '2020-08-15 06:59:58'),
(2, 3, 2, 'testing 2', 'active', NULL, 1, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
(3, 2, 2, 'That\'s cool', 'active', NULL, 2, '2020-08-14 07:12:27', '2020-08-14 07:12:27'),
(4, 1, 2, 'nice', 'active', NULL, NULL, '2020-08-15 07:31:19', '2020-08-15 07:31:19'),
(5, 3, 5, 'nice blog', 'active', NULL, NULL, '2020-08-15 07:51:01', '2020-08-15 07:51:01'),
(6, 2, 3, 'nice', 'active', NULL, NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29'),
(7, 2, 3, 'really', 'active', NULL, 6, '2020-08-17 21:13:51', '2020-08-17 21:13:51');

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
(1, 'morocco', 'morocco', 'active', '2023-05-29 23:27:00', '2023-05-29 23:27:00'),
(2, 'Moroccan wholesale market', 'moroccan-wholesale-market', 'active', '2023-05-31 17:02:19', '2023-05-31 17:02:19'),
(3, 'digital technologies', 'digital-technologies', 'active', '2023-05-31 17:02:27', '2023-05-31 17:02:27'),
(4, 'sustainable farming', 'sustainable-farming', 'active', '2023-05-31 17:02:33', '2023-05-31 17:02:33'),
(5, 'bulk buying', 'bulk-buying', 'active', '2023-05-31 17:02:40', '2023-05-31 17:02:40'),
(6, 'farming innovations', 'farming-innovations', 'active', '2023-05-31 17:03:08', '2023-05-31 17:03:08');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '1',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `condition`, `status`, `price`, `discount`, `is_featured`, `created_at`, `updated_at`, `cat_id`, `child_cat_id`) VALUES
(1, 'Round Tomato', 'round-tomato', 'Refreshing and lusciously sweet, our wholesale Watermelons, sourced directly from sun-kissed Moroccan farms, offer the perfect blend of taste and health for a summer snack, fruit salad addition, or a hydrating juice.', 'Imagine a hot summer day and the first bite you take of a slice of our fresh Watermelon - it\'s pure bliss. Our watermelons, sourced directly from the finest Moroccan farms, are a testament to our commitment to offering top-quality wholesale fresh fruits and vegetables. Known for their distinctive sweetness, rich juiciness, and refreshing flavour, these watermelons make the perfect addition to your summer picnic, barbecue, or health-conscious menu. Served fresh, added to fruit salads, or juiced for a thirst-quenching drink, our watermelons are a versatile delight. As part of our fresh produce offerings, we ensure each watermelon meets high standards in taste, freshness, and nutritional value. They are naturally grown, ripened under the warm Moroccan sun, and harvested at peak maturity to ensure you and your customers get the best taste and quality. Whether you run a restaurant, grocery store, or a health-focused food service, our watermelons are an excellent choice for enhancing your wholesale fresh fruit offerings and satisfying your customers seeking a refreshing, hydrating, and fruity option.', '/storage/photos/round-tomato.jpg', 10, 'new', 'active', 5000.00, 19.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 1, NULL),
(2, 'Tomato Cenkara', 'tomato-cenkara', 'Experience the sweetness and vibrant flavour of our Green Melons. A versatile addition to your wholesale fruits and vegetables, perfect for fruit salads, smoothies, or enjoyed fresh.', 'Introduce your customers to the succulent, sweet, and slightly tangy flavour of our Green Melons. Harvested at peak ripeness from Moroccan farms, these melons are a testament to our commitment to providing high-quality wholesale fresh fruits and vegetables. Known for their juicy texture and delightful sweetness, these Green Melons offer a vibrant taste that\'s both refreshing and satisfying. They\'re versatile in use and can be enjoyed in a variety of ways. Slice them fresh and add to fruit salads, blend into smoothies, or serve as a standalone snack - they\'re sure to please your customers\' taste buds. As a part of our fresh produce range, we take great care to ensure the quality and freshness of our melons, adhering to stringent quality control measures from harvest to delivery. We believe in providing fruits that not only taste good but also contribute to the health and wellbeing of your customers. Packed with vitamins, minerals, and hydration, our Green Melons make a wholesome addition to any wholesale fresh fruit offering. Introduce these melons to your line-up and let your customers experience a taste of Moroccan sunshine in every bite.', '/storage/photos/tomato-cenkara.png', 10, 'new', 'active', 4500.00, 20.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 1, NULL),
(3, 'Cucumber', 'cucumber', 'Savor the cool, crisp crunch of our Cucumbers. An ideal fresh produce choice for bulk orders.', 'Our Cucumbers, a favorite in our bulk fruits and vegetables selection, deliver a refreshing crunch and hydration with every bite. Cultivated with sustainable practices, our cucumbers ensure top-notch quality, freshness, and a good supply of beneficial nutrients like vitamin K and water. Enjoy them in your salads, sandwiches, or refreshing summer drinks for a cooling effect. Our buy in bulk service guarantees you never run out of these hydrating delights. Depend on our wholesale fresh fruits and vegetables delivery service for the freshest cucumbers delivered to your kitchen.', '/storage/photos/cucumber.jpg', 10, 'new', 'active', 3000.00, 13.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 1, NULL),
(4, 'Aubergine', 'aubergine', 'Experience the versatile, earthy flavor of our Aubergines. A great fresh produce option for bulk purchases.', 'A prized member of our bulk fruits and vegetables lineup, our Aubergines (also known as eggplants) offer a unique earthy flavor and versatility in various cuisines. Grown using sustainable methods, our aubergines promise quality, freshness, and a dose of beneficial nutrients like fiber and vitamin B1. Utilize them in your stews, stir-fries, grills, or roasts for a heartwarming meal. Choose our buy in bulk service to always keep this versatile vegetable at your fingertips. Rely on our wholesale fresh fruits and vegetables delivery service for top-quality aubergines delivered straight to your doorstep.', '/storage/photos/aubergine.png', 10, 'new', 'active', 4500.00, 6.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 1, NULL),
(5, 'Habanero Chili Pepper', 'habanero-chili-pepper', 'Ignite your taste buds with our fiery Habanero Chili Peppers. A hot fresh produce choice for bulk orders.', 'If you\'re looking to spice things up, our Habanero Chili Peppers, part of our bulk fruits and vegetables range, are just the ticket. Sustainably grown, our habanero peppers guarantee quality, intense heat, freshness, and a significant amount of vitamin C and capsaicin. Use them sparingly in your sauces, stews, or marinades to add a fiery kick. Opt for our buy in bulk option to always have these spicy treats at your disposal. Count on our wholesale fresh fruits and vegetables delivery service for fresh habanero peppers delivered directly to your kitchen.', '/storage/photos/habanero-chili-pepper.png', 10, 'new', 'active', 4000.00, 18.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 1, NULL),
(6, 'Bullet Chili Pepper', 'bullet-chili-pepper', 'Experience the tantalizing heat of our Bullet Chili Peppers. An exciting fresh produce staple for bulk orders.', 'Our Bullet Chili Peppers are for those who love a little fire in their meals. As a part of our bulk fruits and vegetables, these peppers deliver an unforgettable punch of heat, balanced with a slightly sweet flavor. Grown under controlled conditions to preserve their spiciness, these peppers are perfect for adding an extra kick to your dishes. They are packed with vitamins A and C, beneficial for overall health. When you buy in bulk, you\'re guaranteed to receive these hot gems fresh, thanks to our reliable wholesale fresh fruits and vegetables delivery service. Dive into the realm of spicy cuisine and let our bullet chili peppers turn up the heat.', '/storage/photos/bullet-chili-pepper.png', 10, 'new', 'active', 4000.00, 11.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 1, NULL),
(7, 'Bird Chili Pepper', 'bird-chili-pepper', 'Unleash a fiery explosion of flavor with our Bird Chili Peppers. Essential fresh produce for bulk purchasing.', 'Bird Chili Peppers, part of our bulk fruits and vegetables range, are here to revolutionize your cooking. Offering a scorching heat paired with a slightly sweet and tart flavor, these small but mighty peppers are the perfect addition to a variety of dishes. Our Bird Chili Peppers are grown under ideal conditions to ensure their quality and fiery nature. Apart from their flavor, they are also a great source of antioxidants and vitamins. With our buy in bulk option, you can easily keep these spicy wonders on hand. Trust in our commitment to providing the best wholesale fresh fruits and vegetables.', '/storage/photos/bird-chili-pepper.png', 10, 'new', 'active', 4000.00, 30.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 1, NULL),
(8, 'Square Pepper', 'square-pepper', 'Enhance your dishes with the versatile and sweet flavor of our Square Peppers. A valuable addition to your fresh produce and ideal for bulk buying.', 'Our Square Peppers are a testament to the quality and variety of our bulk fruits and vegetables collection. These peppers, known for their unique shape, offer a wonderfully sweet and slightly tangy flavor, making them the perfect addition to a variety of dishes. Sourced from farms practicing sustainable farming techniques, our Square Peppers maintain their freshness, flavor, and nutritional content. They are rich in vitamins and antioxidants, making them as nutritious as they are delicious. With our buy in bulk option, keeping your kitchen stocked with these unique peppers is easy. Rely on our consistent delivery of wholesale fresh fruits and vegetables for your culinary needs.', '/storage/photos/square-pepper.png', 10, 'new', 'active', 3500.00, 30.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 1, NULL),
(9, 'Cowhorn Pepper', 'cowhorn-pepper', 'Savour the creamy texture and rich taste of our Long Aubergines. Ideal fresh produce for bulk orders.', 'Elevate your culinary creations with our Cowhorn Peppers, a special addition to our bulk fruits and vegetables collection. Known for their long, curved shape resembling a cow\'s horn, these peppers add a unique, sweet, and mildly spicy flavor to any dish. Grown under optimal conditions, our Cowhorn Peppers retain their freshness and nutritional content. They are a great source of vitamins A and C, making them as nutritious as they are flavorful. Our buy in bulk option ensures you have these unique peppers on hand whenever you need them. Trust in our wholesale fresh fruits and vegetables delivery for consistent quality and freshness.', '/storage/photos/cowhorn-pepper.png', 10, 'new', 'active', 5000.00, 26.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 1, NULL),
(10, 'Zucchini', 'zucchini', 'Enjoy the versatile, mild flavor of our Zucchinis. A must-have fresh produce item for bulk purchasing.', 'Our Zucchinis, part of our bulk fruits and vegetables range, bring a mild, slightly sweet flavor and a whole lot of nutrition to your table. These zucchinis are grown using sustainable farming practices, ensuring their quality and freshness. Zucchinis are packed with essential nutrients, including vitamin C, and are a wonderful addition to a variety of dishes. Whether grilled, roasted, or used in baking, our zucchinis never disappoint. Make the most of our buy in bulk option to keep your kitchen stocked with this versatile vegetable. We\'re committed to providing the best wholesale fresh fruits and vegetables for all your culinary needs.', '/storage/photos/zucchini.png', 10, 'new', 'active', 3500.00, 9.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 1, NULL),
(11, 'Black Zucchini', 'black-zucchini', 'Introduce a unique twist to your meals with our Black Zucchinis. An exciting fresh produce for bulk buying.', 'Our Black Zucchinis, a standout in our bulk fruits and vegetables collection, offer a subtly sweet flavor and a striking color to liven up your dishes. These zucchinis are grown sustainably, ensuring their freshness, quality, and nutritional content. Apart from their unique color, they are a fantastic source of vitamins and minerals. From stir-fries to baking, black zucchinis add an exciting twist to any dish. Our buy in bulk option ensures you\'ll never run out of these unique zucchinis. Rely on our wholesale fresh fruits and vegetables delivery service for the freshest produce.', '/storage/photos/black-zucchini.jpg', 10, 'new', 'active', 3500.00, 29.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 1, NULL),
(12, 'Long Aubergine', 'long-aubergine', 'Savour the creamy texture and rich taste of our Long Aubergines. Ideal fresh produce for bulk orders.', 'Savour the creamy texture and rich taste of our Long Aubergines. Ideal fresh produce for bulk orders.', '/storage/photos/long-aubergine.jpg', 10, 'new', 'active', 4500.00, 29.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 1, NULL),
(13, 'Lauki', 'lauki', 'Experience the refreshing taste of our Lauki. A unique fresh produce offering for bulk purchasing.', 'Experience the refreshing taste of our Lauki. A unique fresh produce offering for bulk purchasing.', '/storage/photos/lauki.jpg', 10, 'new', 'active', 3000.00, 24.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 1, NULL),
(14, 'Watermelon', 'watermelon', 'Relish the tropical, sweet richness of our Mangoes. An exotic fresh produce pick for bulk orders.', 'Relish the tropical, sweet richness of our Mangoes. An exotic fresh produce pick for bulk orders.', '/storage/photos/watermelon.png', 10, 'new', 'active', 2000.00, 4.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 2, NULL),
(15, 'Green Melon', 'green-melon', 'Our wholesale green melon is a succulent and nutritious addition to your daily diet.', 'Enjoy the succulent taste of our wholesale green melons. Harvested from the fertile Moroccan fields, our green melons bring a combination of nutrition and refreshing taste. Perfect for salads or as a standalone fruit, they contribute to a balanced and healthy diet. Buying fruits in bulk from us guarantees you get quality produce at wholesale prices.', '/storage/photos/green-melon.png', 10, 'new', 'active', 2500.00, 8.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 2, NULL),
(16, 'Yellow Melon', 'yellow-melon', 'Our wholesale yellow melon, sourced from Morocco, is a delicious and refreshing fruit.', 'Savour the delightful taste of our wholesale yellow melons. Our yellow melons are grown in the vibrant fields of Morocco and offer a balance of sweetness and refreshing taste. Ideal for a fruit salad or to be enjoyed on their own, these melons are a great source of vitamins and hydration. We are dedicated to providing fresh produce and satisfying our customers\' needs for wholesale fruits and vegetables.', '/storage/photos/yellow-melon.png', 10, 'new', 'active', 2500.00, 25.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 2, NULL),
(17, 'Mango', 'mango', 'Relish in the tropical sweetness of our wholesale mango, straight from Morocco.', 'Indulge in the tropical sweetness of our wholesale mangos. These mangos, grown in the vibrant Moroccan climate, offer a rich flavour and smooth texture. Whether you want to enjoy them as is or incorporate them into your culinary creations, our mangos will never disappoint. As a leading supplier of wholesale fresh fruits and vegetables, we ensure our mangos are ripe and quality-checked, promising a rewarding eating experience.', '/storage/photos/mango.png', 10, 'new', 'active', 3500.00, 14.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 2, NULL),
(18, 'Mint', 'mint', 'Wholesale fresh mint sourced from verdant Moroccan fields, an indispensable ingredient in African food, perfect for fresh produce suppliers.', 'Experience the refreshing burst of flavor with our wholesale fresh mint. Handpicked from the flourishing fields of Morocco, this mint variety adds an extraordinary tang to your culinary delights. As a distinguished supplier of wholesale African food, we believe in delivering only the freshest and finest produce to our customers. Our commitment to quality sets us apart as a fresh produce supplier across Europe. Whether you are a business seeking wholesale fruits and vegetables, or an individual intending to buy fruit and vegetable plants online, our fresh mint is a splendid addition to your purchase list. In addition to fresh mint, we offer a diverse range of wholesale African products, including a variety of fruits, vegetables, and other herbs. We guarantee competitive prices and supreme value when you buy in bulk from us. For those with a penchant for African wholesale food, our fresh mint, along with our other offerings, are sure to meet your needs.', '/storage/photos/mint.png', 10, 'new', 'active', 1000.00, 22.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 3, NULL),
(19, 'Coriander', 'coriander', 'Wholesale fresh coriander straight from Moroccan farms, an essential element in African food, ideal for fresh produce suppliers across Europe.', 'Our wholesale fresh coriander is your gateway to the robust flavors of Morocco. Grown in the fertile Moroccan soils, our coriander adds a distinctive zest to your meals. As purveyors of wholesale African food, our primary objective is to provide you with the freshest produce. Our coriander leaves are carefully harvested and transported to retain their freshness. As a leading fresh produce supplier in Europe, we understand that quality is paramount. Whether you are looking to buy fruit and vegetable plants online, or are a business in need of wholesale fruits and vegetables, our fresh coriander is a standout choice. Our catalogue extends beyond fresh coriander. We also provide an array of wholesale African products, ensuring a one-stop-shop experience for our customers. Choose to buy in bulk with us for competitive prices and great value.', '/storage/photos/coriander.png', 10, 'new', 'active', 1500.00, 6.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 3, NULL),
(20, 'Parsley', 'parsley', 'Wholesale fresh parsley cultivated in Moroccos fertile land, a key component in African food, suitable for fresh produce suppliers across Europe.', 'Immerse in the vibrant flavors of Morocco with our wholesale fresh parsley. Grown in the nutrient-rich soils of Morocco, our parsley imparts a unique flavor to your dishes. As prominent providers of wholesale African food, we are committed to delivering top-quality, fresh produce. As a reputed fresh produce supplier in Europe, we maintain rigorous standards for our produce. Whether youre a household wishing to buy fruit and vegetable plants online, or a business in need of wholesale fruits and vegetables, our fresh parsley is an excellent addition to your kitchen. In addition to parsley, our broad selection of wholesale African products provides customers with multiple options to choose from. Opt to buy in bulk with us and enjoy competitive prices and outstanding value on all our products.', '/storage/photos/parsley.png', 10, 'new', 'active', 1200.00, 27.00, 0, '2020-08-15 08:12:34', '2020-08-15 08:12:34', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT '0',
  `review` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, 5, 'nice product', 'active', '2020-08-15 07:44:05', '2020-08-15 07:44:05'),
(2, 2, NULL, 5, 'nice', 'active', '2020-08-17 21:08:14', '2020-08-17 21:18:31'),
(3, 1, 1, 3, 'Bonne produit. exemple de review', 'active', '2023-06-01 00:11:55', '2023-06-01 00:11:55'),
(4, 1, 8, 4, 'good product', 'active', '2023-06-13 06:29:29', '2023-06-13 06:29:29');

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
(1, 'AGRIJA is a Moroccan company leader in the production, packaging and export of Moroccan agricultural crops. Our products include citrus fruits, sultanas, pomegranates, mangoes, watermelons and all seasonal fruits, as well as vegetables such as iceberg lettuce, broccoli, tomatoes, potatoes, cucumbers, courgettes and other Moroccan vegetables, and dates. All this alongside herbs such as dill, coriander, thyme and so on. We have our own packing house to prepare our products for export.', 'TO PROVIDE OUR CUSTOMERS\r\nA RANGE OF HEALTHY, FRESH PRODUCTS', '/storage/photos/1/logo.png', '/storage/photos/1/blog3.jpg', '273 zone industrielle agadir Dcheira El Jihadia 80000 Maroc', '+212 611 845 583', 'Contact@agryja.com', NULL, '2020-08-14 01:49:09');

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
(5, 'By Air :', '6.00', 'active', '2023-06-13 05:19:48', '2023-06-13 05:31:13'),
(6, 'By truck:', '2.00', 'active', '2023-06-13 05:20:19', '2023-06-13 05:31:20'),
(7, 'By ship (container) :', '2.00', 'active', '2023-06-13 05:20:41', '2023-06-13 05:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 'otmane hanine', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', '/storage/photos/1/users/user1.jpg', 'admin', NULL, NULL, 'active', 'VRRtB7tNY94JM1URzHvBRKWn2HE46KdCJEBy9CLExVRhBaPQUORpVSCiH5av', NULL, '2023-05-21 14:52:46'),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', '/storage/photos/1/users/user2.jpg', 'user', NULL, NULL, 'active', NULL, NULL, '2020-08-15 07:30:07'),
(3, 'Client X', 'client.x@gmail.com', NULL, '$2y$10$15ZVMgH040v4Ukf9KSAFiucPJcfDwmeRKCaguVJBXplTs93m48F1G', '/storage/photos/1/users/user3.jpg', 'user', NULL, NULL, 'active', NULL, '2020-08-11 04:20:58', '2023-06-01 00:07:04'),
(4, 'Cynthia Beier', 'ernestina.wehner@example.net', '2020-08-14 21:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'fzmQDfEoaP', '2020-08-14 21:18:52', '2020-08-14 21:18:52'),
(5, 'Prof. Maybell Zulauf', 'wolf.harvey@example.org', '2020-08-14 21:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'B8cYq4huyT', '2020-08-14 21:18:54', '2020-08-14 21:18:54'),
(6, 'Diego Lind II', 'schroeder.emile@example.net', '2020-08-14 21:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'xLUaF26dE1', '2020-08-14 21:18:54', '2020-08-14 21:18:54'),
(7, 'Ian Macejkovic', 'ashlee16@example.com', '2020-08-14 21:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'i2ZIKbiM9O', '2020-08-12 21:18:54', '2020-08-14 21:18:54'),
(8, 'Perry McClure DDS', 'mayer.ashlynn@example.org', '2020-08-14 21:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'VD1MlsvW3I', '2020-08-14 21:18:55', '2020-08-14 21:18:55'),
(9, 'Juana Yost', 'carter47@example.net', '2020-08-14 21:19:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'kARxoay0FT', '2020-08-11 21:19:50', '2020-08-14 21:19:50'),
(10, 'Louvenia Will DDS', 'lowell06@example.net', '2020-08-14 21:19:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'QkbNNnO7ZG', '2020-08-10 21:19:50', '2020-08-14 21:19:50'),
(11, 'Miss Layla McClure', 'dcummings@example.com', '2020-08-14 21:19:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'DFnCS0bKFa', '2020-08-08 21:19:51', '2020-08-14 21:19:51'),
(12, 'Mrs. Taya Ziemann', 'anderson.luz@example.net', '2020-08-14 21:19:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', '4Xgvb1HnFT', '2020-08-09 21:19:51', '2020-08-14 21:19:51'),
(13, 'Porter Olson', 'jaden24@example.com', '2020-08-14 21:19:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', NULL, NULL, 'active', 'gFX2w4WaMj', '2020-08-14 21:19:51', '2020-08-14 21:19:51'),
(29, 'Otmane hanine', 'Otmane.hanine@gmail.com', NULL, NULL, NULL, 'user', 'google', '110717103019405487938', 'active', NULL, '2020-08-15 07:36:29', '2023-06-01 00:08:31'),
(30, 'otmane', 'pickinodenero@gmail.com', NULL, '$2y$10$gbko/nX9Ox/JcaLCiQLUk.BilWZ6P3YJHc2/IxDZeoHMGCqjWwkRq', NULL, 'user', NULL, NULL, 'active', NULL, '2023-05-12 09:17:23', '2023-05-12 09:17:23'),
(31, 'otmane', 'otmane.hanine@enim.ac.ma', NULL, '$2y$10$xRA3t.x3KdSXW1D/bte8YuQblWG.q58NTpBBkzXACWRB.TnTa/nXu', NULL, 'user', NULL, NULL, 'active', NULL, '2023-05-31 22:47:02', '2023-05-31 22:47:02');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 19, NULL, 2, 1410.00, 1, 1410.00, '2023-05-31 22:37:04', '2023-05-31 22:37:04'),
(2, 17, NULL, 2, 3010.00, 1, 3010.00, '2023-05-31 22:37:10', '2023-05-31 22:37:10'),
(3, 6, NULL, 2, 3560.00, 1, 3560.00, '2023-05-31 22:37:27', '2023-05-31 22:37:27');

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`);

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
