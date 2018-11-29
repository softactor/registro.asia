-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 30, 2018 at 06:45 PM
-- Server version: 5.5.61-cll
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `registro_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Name of the event',
  `organizer` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Name of the event organizer',
  `start_date` date NOT NULL COMMENT 'Event start date',
  `end_date` date NOT NULL COMMENT 'Event end date',
  `venue_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Name of the event vanue',
  `venue_address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Name of the event vanue address',
  `event_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iframe_events_url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `organizer`, `start_date`, `end_date`, `venue_name`, `venue_address`, `event_url`, `iframe_events_url`, `created_at`, `updated_at`) VALUES
(5, 'Airshow 2020', 'Registro', '2020-10-08', '2020-10-10', 'Singapore Expo', '1 expo drive', 'Airshow-2020', NULL, '2018-10-25 00:37:58', '2018-10-25 00:37:58'),
(6, 'Singapore International jewelry Expo (SIZE) 2018', 'Jewelry community', '2018-10-01', '2018-10-30', 'International Stadium', 'Paltan Square', 'Singapore-International-Jewelry-Expo-(SIZE)-2018', NULL, '2018-10-25 00:45:46', '2018-10-25 00:45:46'),
(7, 'Transport Show Oct 2018', 'Registro', '2018-10-01', '2018-10-03', 'Marina Bay Sands', '1 sands drive', 'Transport-Show-Oct-2018', NULL, '2018-10-25 00:38:27', '2018-10-25 00:38:27'),
(8, 'Water Week', 'PUB', '2018-10-26', '2018-10-31', 'Expo', 'expo drive', 'Water-Week', '<iframe src=\"http://registro.asia/iframe/event_registration/Water-Week/\" style=\"border:0px #ffffff none;\" name=\"myiFrame\" scrolling=\"no\" frameborder=\"1\" marginheight=\"0px\" marginwidth=\"0px\" height=\"2100px\" width=\"100%\" allowfullscreen>\r\n</iframe>', '2018-10-28 21:48:31', '2018-10-28 21:48:31'),
(9, 'MDDRM Events', 'DEB Company', '2018-10-05', '2018-10-31', 'International Stadium', 'Dhaka', 'MDDRM-Events', '<iframe src=\"https://registro.asia/iframe/event_registration/MDDRM-Events/\" style=\"border:0px #ffffff none;\" name=\"myiFrame\" scrolling=\"no\" frameborder=\"1\" marginheight=\"0px\" marginwidth=\"0px\" height=\"2100px\" width=\"100%\" allowfullscreen>\r\n</iframe>', '2018-10-30 17:32:48', '2018-10-30 17:32:48'),
(10, 'toy show', 'ATZE', '2018-10-30', '2018-10-31', 'expo', '1 expo', 'Toy-Show', '<iframe src=\"http://registro.asia/iframe/event_registration/Toy-Show/\" style=\"border:0px #ffffff none;\" name=\"myiFrame\" scrolling=\"no\" frameborder=\"1\" marginheight=\"0px\" marginwidth=\"0px\" height=\"2100px\" width=\"100%\" allowfullscreen>\r\n</iframe>', '2018-10-29 23:28:44', '2018-10-29 23:28:44'),
(11, 'SMA Show 2019', 'SMA', '2018-11-02', '2018-11-02', 'NUS', 'PGPR', 'SMA-Show-2019', '<iframe src=\"https://registro.asia/iframe/event_registration/SMA-Show-2019/\" style=\"border:0px #ffffff none;\" name=\"myiFrame\" scrolling=\"no\" frameborder=\"1\" marginheight=\"0px\" marginwidth=\"0px\" height=\"2100px\" width=\"100%\" allowfullscreen>\r\n</iframe>', '2018-11-04 02:43:58', '2018-11-04 02:43:58');

-- --------------------------------------------------------

--
-- Table structure for table `event_business_owners`
--

CREATE TABLE `event_business_owners` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL COMMENT 'event id from event table',
  `owners_numbers` int(11) NOT NULL COMMENT 'Number of the business owners joined',
  `registration_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_business_owners`
--

INSERT INTO `event_business_owners` (`id`, `event_id`, `owners_numbers`, `registration_type`, `is_status`, `created_at`, `updated_at`) VALUES
(45, 11, 1, 'Online', 1, '2018-11-09 02:27:25', '2018-11-09 02:27:25'),
(46, 11, 1, 'Online', 1, '2018-11-09 02:35:00', '2018-11-09 02:35:00'),
(47, 11, 1, 'Onsite', 1, '2018-11-09 02:39:16', '2018-11-09 02:39:16'),
(55, 11, 2, 'Import', 0, '2018-11-09 19:16:59', '2018-11-09 19:16:59'),
(56, 11, 2, 'Import', 0, '2018-11-09 19:21:13', '2018-11-09 19:21:13'),
(57, 11, 2, 'Import', 0, '2018-11-09 20:02:37', '2018-11-09 20:02:37'),
(58, 11, 2, 'Import', 0, '2018-11-09 21:50:55', '2018-11-09 21:50:55'),
(59, 11, 7, 'Import', 0, '2018-11-15 00:59:11', '2018-11-15 00:59:11'),
(60, 5, 2, 'Import', 0, '2018-11-15 17:22:35', '2018-11-15 17:22:35'),
(61, 6, 2, 'Import', 0, '2018-11-15 17:23:14', '2018-11-15 17:23:14'),
(62, 7, 2, 'Import', 0, '2018-11-15 17:23:44', '2018-11-15 17:23:44'),
(63, 8, 2, 'Import', 0, '2018-11-15 17:25:36', '2018-11-15 17:25:36'),
(64, 10, 2, 'Import', 0, '2018-11-15 17:26:06', '2018-11-15 17:26:06'),
(65, 11, 2, 'Import', 0, '2018-11-27 01:03:55', '2018-11-27 01:03:55');

-- --------------------------------------------------------

--
-- Table structure for table `event_business_owners_details`
--

CREATE TABLE `event_business_owners_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL COMMENT 'event id from event table',
  `business_owner_id` int(10) UNSIGNED NOT NULL COMMENT 'business owner id from event_business_owners table',
  `salutation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'mr or miss or madam',
  `first_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'First name',
  `last_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Last name',
  `company_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Company name',
  `company_address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Company address',
  `gender` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Male Female or Others',
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Designation',
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mobile',
  `country_id` int(11) DEFAULT NULL COMMENT 'Country id',
  `tel` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Telephone',
  `fax` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Fax',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `serial_digit` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namebadge_user_label` text COLLATE utf8mb4_unicode_ci,
  `is_confirmed` int(11) NOT NULL DEFAULT '1',
  `is_status` int(11) NOT NULL DEFAULT '1',
  `qrcode_path` text COLLATE utf8mb4_unicode_ci,
  `pdf_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_business_owners_details`
--

INSERT INTO `event_business_owners_details` (`id`, `event_id`, `business_owner_id`, `salutation`, `first_name`, `last_name`, `company_name`, `company_address`, `gender`, `designation`, `mobile`, `country_id`, `tel`, `fax`, `email`, `serial_digit`, `namebadge_user_label`, `is_confirmed`, `is_status`, `qrcode_path`, `pdf_path`, `created_at`, `updated_at`) VALUES
(23, 11, 45, 'Mr', 'Tanveer', 'Qureshee', 'Dnet', 'Dhaka', 'Male', 'Software Engineer', '01716600843', 1, NULL, NULL, 'tanveerqureshee1@gmail.com', '250170021145', 'visitor', 1, 1, '250170021145.png', '11541802445.pdf', '2018-11-09 02:27:25', '2018-11-09 02:27:25'),
(24, 11, 46, 'Mdm', 'Meghna', 'Jahan', 'Saif Power Tech LTD', 'Gulshan', NULL, NULL, '01716690909', 1, NULL, NULL, 'tanveerqureshee@hotmail.com', '270138671146', 'visitor', 1, 1, '270138671146.png', '11541802900.pdf', '2018-11-09 02:35:00', '2018-11-09 02:35:00'),
(25, 11, 47, 'Mr', 'Rizveer', 'Ahmed', 'Biddut', 'Dhaka', 'Male', NULL, '01716161', 1, NULL, NULL, 'tanveerqureshee1@gmail.com', '690658041147', 'visitor', 1, 1, '690658041147.png', '11541803156.pdf', '2018-11-09 02:39:16', '2018-11-09 02:39:16'),
(34, 11, 57, 'Mr', 'Tanveer', 'Qureshee', 'Saif Powertech LTD', 'Gulshan 1', 'Male', 'Software Engineer', '1716600843', 1, '', '', 'tanveerqureshee@hotmail.com', '965095971157', 'visitor', 1, 1, '965095971157.png', '11541822557.pdf', '2018-11-09 20:02:37', '2018-11-09 20:02:53'),
(35, 11, 57, 'Mdm', 'Meghna', 'Jahan', 'Dnet', 'Mohammadpur', 'Female', 'Executive Officer', '1676545520', 1, '', '', 'mjahanmeghna@gmail.com', '147525321157', 'visitor', 1, 1, '147525321157.png', '21541822561.pdf', '2018-11-09 20:02:37', '2018-11-09 21:47:44'),
(36, 11, 58, 'Hello', 'Tanveer', 'Qureshee', 'Saif Powertech LTD', 'Gulshan 1', 'Male', 'Software Engineer', '1716600843', 1, '', '', 'tanveerqureshee@hotmail.com', '622833471158', 'visitor', 1, 1, '622833471158.png', '11541872255.pdf', '2018-11-09 21:50:55', '2018-11-10 17:35:06'),
(37, 11, 58, 'Mdm', 'Meghna', 'Jahan', 'Dnet', 'Mohammadpur', 'Woman', 'Executive Officer', '1676545520', 1, '', '', 'mjahanmeghna@gmail', '810691721158', 'visitor', 1, 1, '810691721158.png', '21541872259.pdf', '2018-11-09 21:50:55', '2018-11-10 17:35:06'),
(38, 11, 59, 'Mr', 'Rosie', 'Sutton', 'Brett Santiago', '', 'M', '', '', 1, '', '', 'happy@jumppy.com.sg', '142526691159', 'visitor', 1, 1, '142526691159.png', '11542272351.pdf', '2018-11-15 00:59:11', '2018-11-15 01:00:00'),
(39, 11, 59, 'Mrs', 'Cristina', 'Leona', 'Leroy Park', '', 'F', '', '', 1, '', '', 'adrian_teo@jumppy.com.sg', '191931411159', 'visitor', 1, 1, '191931411159.png', '21542272356.pdf', '2018-11-15 00:59:11', '2018-11-15 01:00:00'),
(40, 11, 59, 'Miss', 'Craig', 'Jon', 'Louis Andrews', '', 'M', '', '', 1, '', '', 'zeteo87@gmail.com', '806706091159', 'visitor', 1, 1, '806706091159.png', '31542272359.pdf', '2018-11-15 00:59:11', '2018-11-15 01:00:00'),
(41, 11, 59, 'Dr', 'Mabel', 'Bishop', 'Duane Harvey', '', 'M', '', '', 1, '', '', 'adrian@clinkworks.sg', '689491921159', 'visitor', 1, 1, '689491921159.png', '41542272363.pdf', '2018-11-15 00:59:11', '2018-11-15 01:00:00'),
(42, 11, 59, 'Prof.', 'Alma', 'Dawson', 'Leona Baldwin', '', 'F', '', '', 1, '', '', 'adrian@smartparenting.sg', '829138491159', 'visitor', 1, 1, '829138491159.png', '51542272367.pdf', '2018-11-15 00:59:11', '2018-11-15 01:00:00'),
(43, 11, 59, 'AP', 'Ortega', 'Stokes', 'Freddie Cunningham', '', 'M', '', '', 1, '', '', 'contact@xiangfenginterior.com.sg', '268906101159', 'visitor', 1, 1, '268906101159.png', '61542272370.pdf', '2018-11-15 00:59:11', '2018-11-15 01:00:00'),
(44, 11, 59, 'Mr', 'Bradley', 'Watkins', 'Dorothy Parsons', '', 'M', '', '', 1, '', '', 'keith@howtoswim.com.sg', '115040241159', 'visitor', 1, 1, '115040241159.png', '71542272374.pdf', '2018-11-15 00:59:11', '2018-11-15 01:00:00'),
(45, 5, 60, 'Mr', 'Tanveer', 'Qureshee', 'Saif Powertech LTD', 'Gulshan 1', 'Male', 'Software Engineer', '1716600843', 1, '', '', 'tanveerqureshee@hotmail.com', '032471801560', 'visitor', 1, 1, '032471801560.png', '11542331355.pdf', '2018-11-15 17:22:35', '2018-11-15 17:22:48'),
(46, 5, 60, 'Mdm', 'Meghna', 'Jahan', 'Dnet', 'Mohammadpur', 'Female', 'Executive Officer', '1676545520', 1, '', '', 'mjahanmeghna@gmail.com', '969324784560', 'visitor', 1, 1, '969324784560.png', '21542331358.pdf', '2018-11-15 17:22:35', '2018-11-15 17:22:48'),
(47, 6, 61, 'Mr', 'Tanveer', 'Qureshee', 'Saif Powertech LTD', 'Gulshan 1', 'Male', 'Software Engineer', '1716600843', 1, '', '', 'tanveerqureshee@hotmail.com', '699334881661', 'visitor', 1, 1, '699334881661.png', '11542331394.pdf', '2018-11-15 17:23:14', '2018-11-15 17:23:28'),
(48, 6, 61, 'Mdm', 'Meghna', 'Jahan', 'Dnet', 'Mohammadpur', 'Female', 'Executive Officer', '1676545520', 1, '', '', 'mjahanmeghna@gmail.com', '858168002661', 'visitor', 1, 1, '858168002661.png', '21542331398.pdf', '2018-11-15 17:23:14', '2018-11-15 17:23:28'),
(49, 7, 62, 'Mr', 'Tanveer', 'Qureshee', 'Saif Powertech LTD', 'Gulshan 1', 'Male', 'Software Engineer', '1716600843', 1, '', '', 'tanveerqureshee@hotmail.com', '836095342762', 'visitor', 1, 1, '836095342762.png', '11542331424.pdf', '2018-11-15 17:23:44', '2018-11-15 17:23:55'),
(50, 7, 62, 'Mdm', 'Meghna', 'Jahan', 'Dnet', 'Mohammadpur', 'Female', 'Executive Officer', '1676545520', 1, '', '', 'mjahanmeghna@gmail.com', '474128977762', 'visitor', 1, 1, '474128977762.png', '21542331427.pdf', '2018-11-15 17:23:44', '2018-11-15 17:23:55'),
(51, 8, 63, 'Mr', 'Tanveer', 'Qureshee', 'Saif Powertech LTD', 'Gulshan 1', 'Male', 'Software Engineer', '1716600843', 1, '', '', 'tanveerqureshee@hotmail.com', '362618677863', 'visitor', 1, 1, '362618677863.png', '11542331536.pdf', '2018-11-15 17:25:36', '2018-11-15 17:25:49'),
(52, 8, 63, 'Mdm', 'Meghna', 'Jahan', 'Dnet', 'Mohammadpur', 'Female', 'Executive Officer', '1676545520', 1, '', '', 'mjahanmeghna@gmail.com', '467038558863', 'visitor', 1, 1, '467038558863.png', '21542331539.pdf', '2018-11-15 17:25:36', '2018-11-15 17:25:49'),
(53, 10, 64, 'Mr', 'Tanveer', 'Qureshee', 'Saif Powertech LTD', 'Gulshan 1', 'Male', 'Software Engineer', '1716600843', 1, '', '', 'tanveerqureshee@hotmail.com', '932322391064', 'visitor', 1, 1, '932322391064.png', '11542331566.pdf', '2018-11-15 17:26:06', '2018-11-15 17:26:18'),
(54, 10, 64, 'Mdm', 'Meghna', 'Jahan', 'Dnet', 'Mohammadpur', 'Female', 'Executive Officer', '1676545520', 1, '', '', 'mjahanmeghna@gmail.com', '434163731064', 'visitor', 1, 1, '434163731064.png', '21542331570.pdf', '2018-11-15 17:26:06', '2018-11-15 17:26:18'),
(55, 11, 65, 'Mr', 'Debasish', 'Rana', 'Saif Powertech LTD', 'Gulshan 1', 'Male', 'Software Engineer', '1716600843', 1, '', '', 'tanveerqureshee@hotmail.com', '493506081165', 'organizer', 1, 1, '493506081165.png', '11543352635.pdf', '2018-11-27 01:03:55', '2018-11-27 01:05:18'),
(56, 11, 65, 'Mdm', 'Andalif', 'Ahmed', 'Dnet', 'Mohammadpur', 'Female', 'Executive Officer', '1676545520', 1, '', '', 'tanveerqureshee1@gmail.com', '012068371165', 'visitor', 1, 1, '012068371165.png', '21543352639.pdf', '2018-11-27 01:03:55', '2018-11-27 01:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `event_forms`
--

CREATE TABLE `event_forms` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL COMMENT 'event id from event table',
  `lebel_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Lebel name',
  `form_data` text COLLATE utf8mb4_unicode_ci COMMENT 'Form Data',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_forms`
--

INSERT INTO `event_forms` (`id`, `event_id`, `lebel_name`, `form_data`, `created_at`, `updated_at`) VALUES
(13, 5, 'My Profession', '[{\"type\":\"radio-group\",\"label\":\"Role\",\"name\":\"role\",\"values\":[{\"label\":\"CEO\",\"value\":\"option-1\"},{\"label\":\"CFO\",\"value\":\"option-2\"},{\"label\":\"CTO\",\"value\":\"option-3\"}]}]', '2018-10-20 00:05:13', '2018-10-20 00:05:13'),
(14, 6, 'Details', '[{\"type\":\"text\",\"label\":\"Name\",\"className\":\"form-control\",\"name\":\"name\",\"subtype\":\"text\"},{\"type\":\"radio-group\",\"label\":\"Gender\",\"name\":\"radio-group-1540109698834\",\"values\":[{\"label\":\"Male\",\"value\":\"1\",\"selected\":true},{\"label\":\"Female\",\"value\":\"1\"}]}]', '2018-10-21 00:15:58', '2018-10-21 00:15:58'),
(15, 7, 'Profession', '[{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"Please indicate your type of business\",\"name\":\"checkbox-group-1540192031990\",\"values\":[{\"label\":\"Auction House\",\"value\":\"Auction House\"},{\"label\":\"Department Stores\",\"value\":\"\"},{\"label\":\"Engravers\",\"value\":\"\"},{\"label\":\"Exporters / Importer\",\"value\":\"\"}]},{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"Please indicate the purpose of your visit\",\"name\":\"checkbox-group-1540192084022\",\"values\":[{\"label\":\"Evaluate for future participation\",\"value\":\"option-1\",\"selected\":true},{\"label\":\"Gather Information\",\"value\":\"\"}]}]', '2018-10-21 23:10:16', '2018-10-21 23:10:16'),
(16, 8, 'Details', '[{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"Group\",\"name\":\"checkbox-group-1540260998204\",\"values\":[{\"label\":\"PUB\",\"value\":\"option-1\",\"selected\":true},{\"label\":\"MBS\",\"value\":\"\"}]}]', '2018-10-22 18:16:57', '2018-10-22 18:16:57'),
(17, 5, 'Test 123', '[{\"type\":\"select\",\"label\":\"Select\",\"className\":\"form-control\",\"name\":\"select-1540803406765\",\"values\":[{\"label\":\"Option 1\",\"value\":\"option-1\",\"selected\":true},{\"label\":\"Option 2\",\"value\":\"option-2\"},{\"label\":\"Option 3\",\"value\":\"option-3\"}]},{\"type\":\"text\",\"label\":\"Text Field\",\"className\":\"form-control\",\"name\":\"text-1540803419797\",\"subtype\":\"text\"}]', '2018-10-29 00:57:45', '2018-10-29 00:57:45'),
(18, 9, 'Interaction', '[{\"type\":\"checkbox-group\",\"label\":\"Point Of Interest\",\"name\":\"checkbox-group-1540812186641\",\"values\":[{\"label\":\"Interest 1\",\"value\":\"Interest 1\",\"selected\":true},{\"label\":\"Interest 2\",\"value\":\"Interest 2\"}]},{\"type\":\"radio-group\",\"label\":\"Gender\",\"name\":\"radio-group-1540812312252\",\"values\":[{\"label\":\"Male\",\"value\":\"Male\"},{\"label\":\"Female\",\"value\":\"Female\"}]}]', '2018-10-29 03:31:11', '2018-10-29 03:31:11'),
(19, 10, 'your info', '[{\"type\":\"select\",\"label\":\"Country\",\"className\":\"form-control\",\"name\":\"select-1540884928383\",\"values\":[{\"label\":\"A\",\"value\":\"option-1\",\"selected\":true},{\"label\":\"B\",\"value\":\"option-2\"},{\"label\":\"C\",\"value\":\"option-3\"}]}]', '2018-10-29 23:35:42', '2018-10-29 23:35:42'),
(20, 11, 'asdasdasd', '[{\"type\":\"text\",\"label\":\"Text Field\",\"className\":\"form-control\",\"name\":\"text-1541328258607\",\"subtype\":\"text\"},{\"type\":\"textarea\",\"label\":\"Text Area\",\"className\":\"form-control\",\"name\":\"textarea-1541328262437\",\"subtype\":\"textarea\"}]', '2018-11-04 02:44:24', '2018-11-04 02:44:24');

-- --------------------------------------------------------

--
-- Table structure for table `event_registeration_form_values`
--

CREATE TABLE `event_registeration_form_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_register_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL COMMENT 'event id',
  `form_id` int(11) DEFAULT NULL COMMENT 'form id',
  `label_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Lebel name',
  `label_value` text COLLATE utf8mb4_unicode_ci COMMENT 'Form Data',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_registeration_form_values`
--

INSERT INTO `event_registeration_form_values` (`id`, `user_register_id`, `event_id`, `form_id`, `label_name`, `label_value`, `created_at`, `updated_at`) VALUES
(31, 45, 11, 20, 'text 1541328258607', 'Good', '2018-11-09 02:27:25', '2018-11-09 02:27:25'),
(32, 45, 11, 20, 'textarea 1541328262437', 'Large events', '2018-11-09 02:27:25', '2018-11-09 02:27:25'),
(33, 46, 11, 20, 'text 1541328258607', 'Good', '2018-11-09 02:35:00', '2018-11-09 02:35:00'),
(34, 46, 11, 20, 'textarea 1541328262437', 'Big Events', '2018-11-09 02:35:00', '2018-11-09 02:35:00'),
(35, 47, 11, 20, 'text 1541328258607', 'Good', '2018-11-09 02:39:16', '2018-11-09 02:39:16'),
(36, 47, 11, 20, 'textarea 1541328262437', 'Ok', '2018-11-09 02:39:16', '2018-11-09 02:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `namebadge_template_details`
--

CREATE TABLE `namebadge_template_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `config_id` int(10) UNSIGNED NOT NULL COMMENT 'config_id from name_badge_config table',
  `template_name` text COLLATE utf8mb4_unicode_ci COMMENT 'template_name',
  `image_path` text COLLATE utf8mb4_unicode_ci COMMENT 'image_path',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `namebadge_template_details`
--

INSERT INTO `namebadge_template_details` (`id`, `config_id`, `template_name`, `image_path`, `created_at`, `updated_at`) VALUES
(3, 6, 'test', '11-25-2018_name_badge_template_0_1543112751.jpg', '2018-11-24 18:25:51', '2018-11-25 22:00:23'),
(4, 6, 'abc update', '11-25-2018_name_badge_template_1_1543112751.jpg', '2018-11-24 18:25:51', '2018-11-25 12:54:01'),
(5, 7, 'test 1', '11-27-2018_name_badge_template_0_1543281552.JPG', '2018-11-26 17:19:12', '2018-11-26 17:19:12'),
(6, 7, 'test 2', '11-28-2018_name_badge_template_0_1543369494.jpg', '2018-11-27 17:44:54', '2018-11-27 17:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `name_badge_config`
--

CREATE TABLE `name_badge_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL COMMENT 'event id from event table',
  `namebadge_width` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'width',
  `namebadge_height` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'height',
  `namebadge_orientation` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'orientation',
  `image_path` varchar(800) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'image_path',
  `measure_unit` varchar(800) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'unit like inchi, px',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `name_badge_config`
--

INSERT INTO `name_badge_config` (`id`, `event_id`, `namebadge_width`, `namebadge_height`, `namebadge_orientation`, `image_path`, `measure_unit`, `created_at`, `updated_at`) VALUES
(6, 5, '8', '5.347', 'portrait', '11-25-2018_name_badge_template_0_1543112751.jpg', 'in', '2018-11-24 18:25:51', '2018-11-25 22:06:09'),
(7, 11, '75', '105', 'portrait', '11-28-2018_name_badge_template_0_1543369494.jpg', 'mm', '2018-11-26 17:19:12', '2018-11-27 17:46:18');

-- --------------------------------------------------------

--
-- Table structure for table `name_badge_position`
--

CREATE TABLE `name_badge_position` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_badge_id` int(10) UNSIGNED NOT NULL COMMENT 'Name badge id',
  `event_id` int(10) UNSIGNED NOT NULL COMMENT 'event id from event table',
  `field_id` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'field id',
  `left_value` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'left value',
  `top_value` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'top value',
  `left_absulate_value` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `top_absulate_value` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `font_style` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `name_badge_position`
--

INSERT INTO `name_badge_position` (`id`, `name_badge_id`, `event_id`, `field_id`, `left_value`, `top_value`, `left_absulate_value`, `top_absulate_value`, `font_style`, `created_at`, `updated_at`) VALUES
(74, 6, 5, 'serial_digit', '37.25', '64.96875', '1px', '1px', '{\"font_unit\":\"\",\"font_size\":\"9\",\"font_weight\":\"\"}', '2018-11-25 22:02:16', '2018-11-25 22:03:00'),
(75, 6, 5, 'qrcode_path', '219.25', '62.875', '1px', '1px', NULL, '2018-11-25 22:02:16', '2018-11-25 22:02:16'),
(76, 6, 5, 'first_name', '34.25', '100.6875', '', '', '{\"font_unit\":\"\",\"font_size\":\"20\",\"font_weight\":\"bold\"}', '2018-11-25 22:02:16', '2018-11-25 22:04:00'),
(77, 6, 5, 'last_name', '36.25', '136.59375', '', '', NULL, '2018-11-25 22:02:16', '2018-11-25 22:02:16'),
(78, 6, 5, 'company_name', '40.25', '179.5', '', '', NULL, '2018-11-25 22:02:16', '2018-11-25 22:02:16'),
(86, 7, 11, 'qrcode_path', '130.25', '179.875', '1px', '1px', NULL, '2018-11-27 17:46:18', '2018-11-27 18:05:18'),
(87, 7, 11, 'first_name', '131.25', '67.703125', '', '', '{\"font_unit\":\"px\",\"font_size\":\"14\",\"font_weight\":\"bold\"}', '2018-11-27 17:46:18', '2018-11-27 18:07:26'),
(88, 7, 11, 'last_name', '131.25', '100.609375', '', '', '{\"font_unit\":\"px\",\"font_size\":\"14\",\"font_weight\":\"bold\"}', '2018-11-27 17:46:18', '2018-11-27 18:07:35'),
(89, 7, 11, 'company_name', '138.25', '140.515625', '', '', NULL, '2018-11-27 17:46:18', '2018-11-27 18:05:18'),
(92, 7, 11, 'namebadge_user_label', '55.25', '310.125', '', '', '{\"font_unit\":\"px\",\"font_size\":\"14\",\"font_weight\":\"bold\"}', '2018-11-27 17:51:36', '2018-11-27 18:07:46');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `print_layout_config`
--

CREATE TABLE `print_layout_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL COMMENT 'event_id from event table',
  `print_config_values` text COLLATE utf8mb4_unicode_ci COMMENT 'print_config_values',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `print_layout_config`
--

INSERT INTO `print_layout_config` (`id`, `event_id`, `print_config_values`, `created_at`, `updated_at`) VALUES
(1, 11, '{\"event_id\":\"11\",\"page_height\":\"10.5cm\",\"page_width\":\"7.5cm\",\"margin_top\":\"0cm\",\"margin_right\":\"0cm\",\"margin_bottom\":\"0cm\",\"margin_left\":\"0cm\",\"font_color\":\"#000000\"}', '2018-11-27 17:14:57', '2018-11-27 17:53:57');

-- --------------------------------------------------------

--
-- Table structure for table `registraion_temp`
--

CREATE TABLE `registraion_temp` (
  `id` int(10) UNSIGNED NOT NULL,
  `form_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `access_token` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `temp_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registraion_temp`
--

INSERT INTO `registraion_temp` (`id`, `form_id`, `event_id`, `access_token`, `temp_data`, `created_at`, `updated_at`) VALUES
(153, 0, 11, '8de441f2604bb1eb5517e81ae81f8caf', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-11-09 10:27:02\",\"updated_at\":\"2018-11-09 10:27:02\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"company_name\":\"Dnet\",\"company_address\":\"Dhaka\",\"gender\":\"Male\",\"designation\":\"Software Engineer\",\"mobile\":\"01716600843\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-11-09 10:27:02\",\"updated_at\":\"2018-11-09 10:27:02\"}]}', '2018-11-09 02:27:02', '2018-11-09 02:27:02'),
(154, 20, 11, '8de441f2604bb1eb5517e81ae81f8caf', '{\"text-1541328258607\":\"Good\",\"textarea-1541328262437\":\"Large events\"}', '2018-11-09 02:27:16', '2018-11-09 02:27:16'),
(155, 0, 11, '9dd156cadbe47c3b62b5eb7b512f368b', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-11-09 10:34:43\",\"updated_at\":\"2018-11-09 10:34:43\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Mdm\",\"first_name\":\"Meghna\",\"last_name\":\"Jahan\",\"company_name\":\"Saif Power Tech LTD\",\"company_address\":\"Gulshan\",\"gender\":null,\"designation\":null,\"mobile\":\"01716690909\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2018-11-09 10:34:43\",\"updated_at\":\"2018-11-09 10:34:43\"}]}', '2018-11-09 02:34:43', '2018-11-09 02:34:43'),
(156, 20, 11, '9dd156cadbe47c3b62b5eb7b512f368b', '{\"text-1541328258607\":\"Good\",\"textarea-1541328262437\":\"Big Events\"}', '2018-11-09 02:34:57', '2018-11-09 02:34:57'),
(157, 0, 11, '917a8cce2ae5abb425a08e9d96399a57', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Onsite\",\"created_at\":\"2018-11-09 10:38:37\",\"updated_at\":\"2018-11-09 10:38:37\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Rizveer\",\"last_name\":\"Ahmed\",\"company_name\":\"Biddut\",\"company_address\":\"Dhaka\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"01716161\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-11-09 10:38:37\",\"updated_at\":\"2018-11-09 10:38:37\"}]}', '2018-11-09 02:38:37', '2018-11-09 02:38:37'),
(158, 20, 11, '917a8cce2ae5abb425a08e9d96399a57', '{\"text-1541328258607\":\"Good\",\"textarea-1541328262437\":\"Ok\"}', '2018-11-09 02:38:45', '2018-11-09 02:38:45');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(400) DEFAULT NULL,
  `values` text,
  `data_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `values`, `data_type`) VALUES
(1, 'salutation', 'Mr,Ms,Mdm,Dr', 'csv'),
(2, 'gender', 'Male,Female,Others', 'csv'),
(3, 'page orientation', 'portrait,landscape', 'csv'),
(4, 'units', 'in,px,mm', 'csv');

-- --------------------------------------------------------

--
-- Table structure for table `temp_csv_import_data`
--

CREATE TABLE `temp_csv_import_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL COMMENT 'event id from event table',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'parent Id',
  `total_number` int(10) UNSIGNED NOT NULL COMMENT 'Total Number',
  `salutation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'mr or miss or madam',
  `first_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'First name',
  `last_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Last name',
  `company_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Company name',
  `company_address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Company address',
  `gender` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Male Female or Others',
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Designation',
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mobile',
  `country` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Country id',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Pending (Yes/No)',
  `is_confirmed` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_business_owners`
--
ALTER TABLE `event_business_owners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_business_owners_event_id_foreign` (`event_id`);

--
-- Indexes for table `event_business_owners_details`
--
ALTER TABLE `event_business_owners_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_business_owners_details_event_id_foreign` (`event_id`),
  ADD KEY `event_business_owners_details_business_owner_id_foreign` (`business_owner_id`);

--
-- Indexes for table `event_forms`
--
ALTER TABLE `event_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_registeration_form_values`
--
ALTER TABLE `event_registeration_form_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `namebadge_template_details`
--
ALTER TABLE `namebadge_template_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `namebadge_template_details_config_id_foreign` (`config_id`);

--
-- Indexes for table `name_badge_config`
--
ALTER TABLE `name_badge_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `name_badge_position`
--
ALTER TABLE `name_badge_position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `print_layout_config`
--
ALTER TABLE `print_layout_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `print_layout_config_event_id_foreign` (`event_id`);

--
-- Indexes for table `registraion_temp`
--
ALTER TABLE `registraion_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_csv_import_data`
--
ALTER TABLE `temp_csv_import_data`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `event_business_owners`
--
ALTER TABLE `event_business_owners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `event_business_owners_details`
--
ALTER TABLE `event_business_owners_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `event_forms`
--
ALTER TABLE `event_forms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `event_registeration_form_values`
--
ALTER TABLE `event_registeration_form_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `namebadge_template_details`
--
ALTER TABLE `namebadge_template_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `name_badge_config`
--
ALTER TABLE `name_badge_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `name_badge_position`
--
ALTER TABLE `name_badge_position`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `print_layout_config`
--
ALTER TABLE `print_layout_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `registraion_temp`
--
ALTER TABLE `registraion_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `temp_csv_import_data`
--
ALTER TABLE `temp_csv_import_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event_business_owners`
--
ALTER TABLE `event_business_owners`
  ADD CONSTRAINT `event_business_owners_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Constraints for table `event_business_owners_details`
--
ALTER TABLE `event_business_owners_details`
  ADD CONSTRAINT `event_business_owners_details_business_owner_id_foreign` FOREIGN KEY (`business_owner_id`) REFERENCES `event_business_owners` (`id`),
  ADD CONSTRAINT `event_business_owners_details_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Constraints for table `namebadge_template_details`
--
ALTER TABLE `namebadge_template_details`
  ADD CONSTRAINT `namebadge_template_details_config_id_foreign` FOREIGN KEY (`config_id`) REFERENCES `name_badge_config` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `print_layout_config`
--
ALTER TABLE `print_layout_config`
  ADD CONSTRAINT `print_layout_config_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
