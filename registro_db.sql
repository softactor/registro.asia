-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 11, 2018 at 02:37 PM
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
(5, 'Airshow 2020', 'Registro', '2020-10-08', '2020-10-10', 'Singapore Expo', '1 expo drive', 'Airshow-2020', NULL, '2018-10-24 22:37:58', '2018-10-24 22:37:58'),
(6, 'Singapore International jewelry Expo (SIZE) 2018', 'Jewelry community', '2018-10-01', '2018-10-30', 'International Stadium', 'Paltan Square', 'Singapore-International-Jewelry-Expo-(SIZE)-2018', NULL, '2018-10-24 22:45:46', '2018-10-24 22:45:46'),
(7, 'Transport Show Oct 2018', 'Registro', '2018-10-01', '2018-10-03', 'Marina Bay Sands', '1 sands drive', 'Transport-Show-Oct-2018', NULL, '2018-10-24 22:38:27', '2018-10-24 22:38:27'),
(8, 'Water Week', 'PUB', '2018-10-26', '2018-10-31', 'Expo', 'expo drive', 'Water-Week', '<iframe src=\"http://registro.asia/iframe/event_registration/Water-Week/\" style=\"border:0px #ffffff none;\" name=\"myiFrame\" scrolling=\"no\" frameborder=\"1\" marginheight=\"0px\" marginwidth=\"0px\" height=\"2100px\" width=\"100%\" allowfullscreen>\r\n</iframe>', '2018-10-28 19:48:31', '2018-10-28 19:48:31'),
(9, 'MDDRM Events', 'DEB Company', '2018-10-05', '2018-10-31', 'International Stadium', 'Dhaka', 'MDDRM-Events', '<iframe src=\"https://registro.asia/iframe/event_registration/MDDRM-Events/\" style=\"border:0px #ffffff none;\" name=\"myiFrame\" scrolling=\"no\" frameborder=\"1\" marginheight=\"0px\" marginwidth=\"0px\" height=\"2100px\" width=\"100%\" allowfullscreen>\r\n</iframe>', '2018-10-30 15:32:48', '2018-10-30 15:32:48'),
(10, 'toy show', 'ATZE', '2018-10-30', '2018-10-31', 'expo', '1 expo', 'Toy-Show', '<iframe src=\"http://registro.asia/iframe/event_registration/Toy-Show/\" style=\"border:0px #ffffff none;\" name=\"myiFrame\" scrolling=\"no\" frameborder=\"1\" marginheight=\"0px\" marginwidth=\"0px\" height=\"2100px\" width=\"100%\" allowfullscreen>\r\n</iframe>', '2018-10-29 21:28:44', '2018-10-29 21:28:44'),
(11, 'SMA Show 2019', 'SMA', '2018-11-02', '2018-11-02', 'NUS', 'PGPR', 'SMA-Show-2019', '<iframe src=\"https://registro.asia/iframe/event_registration/SMA-Show-2019/\" style=\"border:0px #ffffff none;\" name=\"myiFrame\" scrolling=\"no\" frameborder=\"1\" marginheight=\"0px\" marginwidth=\"0px\" height=\"2100px\" width=\"100%\" allowfullscreen>\r\n</iframe>', '2018-12-05 19:31:02', '2018-12-05 19:31:02'),
(12, 'Singapore International Jewelry Expo 2019', 'SIJE', '2019-02-01', '2019-02-03', 'Marina Bay Sands', '10 Bayfront Ave, Singapore 018956', 'Singapore-International-Jewelry-Expo-2019', NULL, '2018-12-09 00:06:07', '2018-12-09 00:06:07');

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
(67, 11, 1, 'Online', 1, '2018-12-04 19:40:27', '2018-12-04 19:40:27'),
(68, 11, 1, 'Online', 1, '2018-12-04 19:42:23', '2018-12-04 19:42:23'),
(69, 11, 1, 'Onsite', 1, '2018-12-04 19:47:14', '2018-12-04 19:47:14'),
(70, 5, 1, 'Online', 1, '2018-12-06 18:43:27', '2018-12-06 18:43:27'),
(71, 12, 1, 'Online', 1, '2018-12-09 01:47:53', '2018-12-09 01:47:53'),
(72, 11, 1, 'Online', 1, '2018-12-09 03:48:58', '2018-12-09 03:48:58'),
(73, 11, 1, 'Online', 1, '2018-12-09 03:49:29', '2018-12-09 03:49:29'),
(74, 11, 1, 'Online', 1, '2018-12-09 03:50:50', '2018-12-09 03:50:50'),
(75, 5, 1, 'Online', 1, '2018-12-09 03:53:59', '2018-12-09 03:53:59'),
(76, 12, 49, 'Import', 0, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(77, 12, 1, 'Online', 1, '2018-12-10 20:24:58', '2018-12-10 20:24:58');

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
(58, 11, 67, 'Mr', 'Tanveer', 'Qureshee', 'Saif Power tec LTD', '72 Mohakhali.', 'Male', 'Web designer', '01716600843', 1, '02918', '12345', 'tanveerqureshee@hotmail.com', '490927701167', 'visitor', 1, 1, '490927701167.png', '11544024427.pdf', '2018-12-04 19:40:27', '2018-12-04 19:40:27'),
(59, 11, 68, 'Ms', 'Meghna', 'Jahan', 'Dnet', 'Humayon Road', 'Female', 'Executive Officer', '0128171709', 2, '02134566', '0233134', 'tanveerqureshee1@gmail.com', '016057121168', 'visitor', 1, 1, '016057121168.png', '11544024543.pdf', '2018-12-04 19:42:23', '2018-12-04 19:42:23'),
(60, 11, 69, 'Dr', 'Farad', 'Hassan', 'Technobd web solution PVT LTD', 'Kawran Bazar', 'Male', 'Engineer', '029373635', 2, '01929291', '01929383', 'tanveerqureshee1@gmail.com', '689646941169', 'visitor', 1, 1, '689646941169.png', '11544024834.pdf', '2018-12-04 19:47:14', '2018-12-04 19:47:14'),
(61, 5, 70, 'Mr', 'Willium', 'Tuitman', 'PLIS', 'Germany', 'Male', 'Team Leader', '09282828', 1, '02', '02', 'tanveerqureshee1@gmail.com', '075759396570', 'visitor', 1, 1, '075759396570.png', '11544150607.pdf', '2018-12-06 18:43:27', '2018-12-06 18:43:27'),
(62, 12, 71, 'Mr', 'ze', 'teo', 'asd', NULL, NULL, NULL, '3462364', 1, '', '', 'zeteo87@gmail.com', '008899141271', 'visitor', 1, 1, '008899141271.png', '11544348873.pdf', '2018-12-09 01:47:53', '2018-12-09 01:47:53'),
(63, 11, 72, 'Mr', 'tanveer', 'qureshee', 'abc', 'abc', 'Male', 'abc', '09383', 1, '092', '02', 'tanveerqureshee1@gmail.com', '805125501172', 'visitor', 1, 1, '805125501172.png', '11544399338.pdf', '2018-12-09 03:48:58', '2018-12-09 03:48:58'),
(64, 11, 73, 'Mr', 'tanveer', 'qureshee', 'abc', 'abc', 'Male', 'abc', '09383', 1, '092', '02', 'tanveerqureshee1@gmail.com', '259632361173', 'visitor', 1, 1, '259632361173.png', '11544399369.pdf', '2018-12-09 03:49:29', '2018-12-09 03:49:29'),
(65, 11, 74, 'Mr', 'tanveer', 'qureshee', 'abc', 'abc', 'Male', 'abc', '09383', 1, '092', '02', 'tanveerqureshee1@gmail.com', '941479481174', 'visitor', 1, 1, '941479481174.png', '11544399450.pdf', '2018-12-09 03:50:50', '2018-12-09 03:50:50'),
(66, 5, 75, 'Mr', 'Mamun', 'Ur Rashid', 'DFY', 'ABC', 'Female', 'Desiner', '4646', 1, '23', '4', 'tanveerqureshee@hotmail.com', '469244978575', 'visitor', 1, 1, '469244978575.png', '11544399639.pdf', '2018-12-09 03:53:59', '2018-12-09 03:53:59'),
(67, 12, 76, 'Mr.', 'Cyndi', 'Arlena', 'Cyndi Arlena Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '95167077', 1, '', '', 'Cyndi.Arlena@gmail.com', '145181871276', 'Visitor', 0, 0, '145181871276.png', 'Singapore International Jewelry Expo 2019.pdf', '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(68, 12, 76, 'Mrs.', 'Golden', 'Brandi', 'Golden Brandi Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '98940528', 1, '', '', 'Golden.Brandi@gmail.com', '578652711276', 'Visitor', 0, 0, '578652711276.png', 'Singapore International Jewelry Expo 2019.pdf', '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(69, 12, 76, 'Ms', 'Jude', 'Lyndsay', 'Jude Lyndsay Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98547857', 1, '', '', 'Jude.Lyndsay@gmail.com', '135969831276', 'Visitor', 0, 0, '135969831276.png', 'Singapore International Jewelry Expo 2019.pdf', '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(70, 12, 76, 'Dr.', 'Doloris', 'Siobhan', 'Doloris Siobhan Pte Ltd', '8 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '97708117', 1, '', '', 'Doloris.Siobhan@gmail.com', '412375561276', 'Visitor', 0, 0, '412375561276.png', 'Singapore International Jewelry Expo 2019.pdf', '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(71, 12, 76, 'Prof', 'Glen', 'Ashly', 'Glen Ashly Pte Ltd', '108 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '96744641', 1, '', '', 'Glen.Ashly@gmail.com', '838136481276', 'Visitor', 0, 0, '838136481276.png', 'Singapore International Jewelry Expo 2019.pdf', '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(72, 12, 76, 'Mr.', 'Lillia', 'Jenniffer', 'Lillia Jenniffer Pte Ltd', '35 Gul Crescent, 629544, Singapore', 'Male', '', '98771508', 1, '', '', 'Lillia.Jenniffer@gmail.com', '636024701276', 'Visitor', 0, 0, '636024701276.png', 'Singapore International Jewelry Expo 2019.pdf', '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(73, 12, 76, 'Mrs.', 'Denna', 'Stephany', 'Denna Stephany Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '93203051', 1, '', '', 'Denna.Stephany@gmail.com', '660629941276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(74, 12, 76, 'Ms', 'Esther', 'Florencia', 'Esther Florencia Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Female', '', '94224847', 1, '', '', 'Esther.Florencia@gmail.com', '564681821276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(75, 12, 76, 'Dr.', 'Nguyet', 'Hannelore', 'Nguyet Hannelore Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '90324269', 1, '', '', 'Nguyet.Hannelore@gmail.com', '717397531276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(76, 12, 76, 'Prof', 'Elias', 'Deedra', 'Elias Deedra Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '89073452', 1, '', '', 'Elias.Deedra@gmail.com', '137940251276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(77, 12, 76, 'Mr.', 'Trevor', 'Fatima', 'Trevor Fatima Pte Ltd', '9 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Female', '', '89600025', 1, '', '', 'Trevor.Fatima@gmail.com', '073033671276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(78, 12, 76, 'Mrs.', 'Berneice', 'Melvina', 'Berneice Melvina Pte Ltd', '109 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '99223653', 1, '', '', 'Berneice.Melvina@gmail.com', '579200721276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(79, 12, 76, 'Ms', 'Dreama', 'Vincent', 'Dreama Vincent Pte Ltd', '36 Gul Crescent, 629544, Singapore', 'Male', '', '97278857', 1, '', '', 'Dreama.Vincent@gmail.com', '724762181276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(80, 12, 76, 'Dr.', 'Rozella', 'Lizzie', 'Rozella Lizzie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Female', '', '99875966', 1, '', '', 'Rozella.Lizzie@gmail.com', '625457941276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(81, 12, 76, 'Prof', 'Xiao', 'Mariela', 'Xiao Mariela Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '92648112', 1, '', '', 'Xiao.Mariela@gmail.com', '619629281276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(82, 12, 76, 'Mr.', 'Zandra', 'Yan', 'Zandra Yan Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '90962634', 1, '', '', 'Zandra.Yan@gmail.com', '134757731276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(83, 12, 76, 'Mrs.', 'Nadia', 'Claris', 'Nadia Claris Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Female', '', '94332539', 1, '', '', 'Nadia.Claris@gmail.com', '974638021276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(84, 12, 76, 'Ms', 'Barbie', 'Criselda', 'Barbie Criselda Pte Ltd', '10 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '93093512', 1, '', '', 'Barbie.Criselda@gmail.com', '504641101276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(85, 12, 76, 'Dr.', 'Sudie', 'Hoa', 'Sudie Hoa Pte Ltd', '110 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '97879423', 1, '', '', 'Sudie.Hoa@gmail.com', '934291071276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(86, 12, 76, 'Prof', 'Marti', 'Kirk', 'Marti Kirk Pte Ltd', '37 Gul Crescent, 629544, Singapore', 'Female', '', '96030158', 1, '', '', 'Marti.Kirk@gmail.com', '703564551276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(87, 12, 76, 'Mr.', 'Yan', 'Von', 'Yan Von Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '95821921', 1, '', '', 'Yan.Von@gmail.com', '383908671276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(88, 12, 76, 'Mrs.', 'Bruna', 'Karole', 'Bruna Karole Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '98244336', 1, '', '', 'Bruna.Karole@gmail.com', '998097261276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(89, 12, 76, 'Ms', 'Marry', 'Albertina', 'Marry Albertina Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '93159479', 1, '', '', 'Marry.Albertina@gmail.com', '101184241276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(90, 12, 76, 'Dr.', 'Jana', 'Darlena', 'Jana Darlena Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98172955', 1, '', '', 'Jana.Darlena@gmail.com', '530692811276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(91, 12, 76, 'Prof', 'Kiana', 'Antonietta', 'Kiana Antonietta Pte Ltd', '11 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '98140891', 1, '', '', 'Kiana.Antonietta@gmail.com', '412166921276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(92, 12, 76, 'Mr.', 'Tuyet', 'Karri', 'Tuyet Karri Pte Ltd', '111 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '89441381', 1, '', '', 'Tuyet.Karri@gmail.com', '658513251276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(93, 12, 76, 'Mrs.', 'Ronny', 'Michel', 'Ronny Michel Pte Ltd', '38 Gul Crescent, 629544, Singapore', 'Male', '', '94358957', 1, '', '', 'Ronny.Michel@gmail.com', '623880911276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(94, 12, 76, 'Ms', 'Anton', 'Shera', 'Anton Shera Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '97655645', 1, '', '', 'Anton.Shera@gmail.com', '863684891276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(95, 12, 76, 'Dr.', 'Sterling', 'Alease', 'Sterling Alease Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Female', '', '97215691', 1, '', '', 'Sterling.Alease@gmail.com', '992075161276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(96, 12, 76, 'Prof', 'Zenaida', 'Kum', 'Zenaida Kum Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '92525663', 1, '', '', 'Zenaida.Kum@gmail.com', '712650231276', 'Organiser', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(97, 12, 76, 'Mr.', 'Mikki', 'Markus', 'Mikki Markus Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98084100', 1, '', '', 'Mikki.Markus@gmail.com', '544197551276', 'Organiser', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(98, 12, 76, 'Mrs.', 'Sixta', 'Ariane', 'Sixta Ariane Pte Ltd', '12 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Female', '', '99352902', 1, '', '', 'Sixta.Ariane@gmail.com', '998949101276', 'Organiser', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(99, 12, 76, 'Ms', 'Elbert', 'Nakita', 'Elbert Nakita Pte Ltd', '112 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '91476589', 1, '', '', 'Elbert.Nakita@gmail.com', '547748391276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(100, 12, 76, 'Dr.', 'Lavera', 'Douglass', 'Lavera Douglass Pte Ltd', '39 Gul Crescent, 629544, Singapore', 'Male', '', '92382843', 1, '', '', 'Lavera.Douglass@gmail.com', '847753361276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(101, 12, 76, 'Prof', 'Hildegarde', 'Dinorah', 'Hildegarde Dinorah Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Female', '', '90345600', 1, '', '', 'Hildegarde.Dinorah@gmail.com', '875310581276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(102, 12, 76, 'Mr.', 'Kenton', 'Sheryll', 'Kenton Sheryll Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '90787291', 1, '', '', 'Kenton.Sheryll@gmail.com', '779532501276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(103, 12, 76, 'Mrs.', 'Pearly', 'Marjory', 'Pearly Marjory Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '93841256', 1, '', '', 'Pearly.Marjory@gmail.com', '851954551276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(104, 12, 76, 'Ms', 'Solomon', 'Isobel', 'Solomon Isobel Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Female', '', '94383863', 1, '', '', 'Solomon.Isobel@gmail.com', '814706251276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(105, 12, 76, 'Dr.', 'Rafael', 'Sherie', 'Rafael Sherie Pte Ltd', '13 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '89478508', 1, '', '', 'Rafael.Sherie@gmail.com', '861995921276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(106, 12, 76, 'Prof', 'Allen', 'Romona', 'Allen Romona Pte Ltd', '113 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '94812274', 1, '', '', 'Allen.Romona@gmail.com', '869631961276', 'Visitor', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(107, 12, 76, 'Mr.', 'Rosia', 'Dorthea', 'Rosia Dorthea Pte Ltd', '40 Gul Crescent, 629544, Singapore', 'Female', '', '91600651', 1, '', '', 'Rosia.Dorthea@gmail.com', '745173441276', 'VIP', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(108, 12, 76, 'Mrs.', 'Lida', 'Mammie', 'Lida Mammie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '92627695', 1, '', '', 'Lida.Mammie@gmail.com', '621534681276', 'VIP', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(109, 12, 76, 'Ms', 'Eva', 'Arvilla', 'Eva Arvilla Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '99346002', 1, '', '', 'Eva.Arvilla@gmail.com', '923077491276', 'VIP', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(110, 12, 76, 'Dr.', 'Gloria', 'Yoshiko', 'Gloria Yoshiko Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '98753035', 1, '', '', 'Gloria.Yoshiko@gmail.com', '045128501276', 'VIP', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(111, 12, 76, 'Prof', 'Kendrick', 'Lin', 'Kendrick Lin Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '99322304', 1, '', '', 'Kendrick.Lin@gmail.com', '452548331276', 'VIP', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(112, 12, 76, 'Mr.', 'Yuki', 'Jenice', 'Yuki Jenice Pte Ltd', '14 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '99959677', 1, '', '', 'Yuki.Jenice@gmail.com', '801807111276', 'VIP', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(113, 12, 76, 'Mrs.', 'Mackenzie', 'Dayna', 'Mackenzie Dayna Pte Ltd', '114 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '97424525', 1, '', '', 'Mackenzie.Dayna@gmail.com', '432585241276', 'VIP', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(114, 12, 76, 'Ms', 'Marissa', 'Junie', 'Marissa Junie Pte Ltd', '41 Gul Crescent, 629544, Singapore', 'Male', '', '89270181', 1, '', '', 'Marissa.Junie@gmail.com', '647690631276', 'VIP', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(115, 12, 76, 'Dr.', 'Roma', 'Jerrie', 'Roma Jerrie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '93184727', 1, '', '', 'Roma.Jerrie@gmail.com', '572217221276', 'VIP', 0, 0, NULL, NULL, '2018-12-10 19:36:42', '2018-12-10 19:36:42'),
(116, 12, 77, 'Mr', 'teo', 'zheng eng', 'jumppy', NULL, 'Male', 'Dir', '9876543', 1, '', 'a', 'adrian_teo@jumppy.com.sg', '086158791277', 'visitor', 1, 1, '086158791277.png', 'Singapore International Jewelry Expo 2019.pdf', '2018-12-10 20:24:58', '2018-12-10 20:24:58');

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
(13, 5, 'My Profession', '[{\"type\":\"radio-group\",\"label\":\"Role\",\"name\":\"role\",\"values\":[{\"label\":\"CEO\",\"value\":\"option-1\"},{\"label\":\"CFO\",\"value\":\"option-2\"},{\"label\":\"CTO\",\"value\":\"option-3\"}]}]', '2018-10-19 22:05:13', '2018-10-19 22:05:13'),
(14, 6, 'Details', '[{\"type\":\"text\",\"label\":\"Name\",\"className\":\"form-control\",\"name\":\"name\",\"subtype\":\"text\"},{\"type\":\"radio-group\",\"label\":\"Gender\",\"name\":\"radio-group-1540109698834\",\"values\":[{\"label\":\"Male\",\"value\":\"1\",\"selected\":true},{\"label\":\"Female\",\"value\":\"1\"}]}]', '2018-10-20 22:15:58', '2018-10-20 22:15:58'),
(15, 7, 'Profession', '[{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"Please indicate your type of business\",\"name\":\"checkbox-group-1540192031990\",\"values\":[{\"label\":\"Auction House\",\"value\":\"Auction House\"},{\"label\":\"Department Stores\",\"value\":\"\"},{\"label\":\"Engravers\",\"value\":\"\"},{\"label\":\"Exporters / Importer\",\"value\":\"\"}]},{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"Please indicate the purpose of your visit\",\"name\":\"checkbox-group-1540192084022\",\"values\":[{\"label\":\"Evaluate for future participation\",\"value\":\"option-1\",\"selected\":true},{\"label\":\"Gather Information\",\"value\":\"\"}]}]', '2018-10-21 21:10:16', '2018-10-21 21:10:16'),
(16, 8, 'Details', '[{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"Group\",\"name\":\"checkbox-group-1540260998204\",\"values\":[{\"label\":\"PUB\",\"value\":\"option-1\",\"selected\":true},{\"label\":\"MBS\",\"value\":\"\"}]}]', '2018-10-22 16:16:57', '2018-10-22 16:16:57'),
(17, 5, 'Test 123', '[{\"type\":\"select\",\"label\":\"Select\",\"className\":\"form-control\",\"name\":\"select-1540803406765\",\"values\":[{\"label\":\"Option 1\",\"value\":\"option-1\",\"selected\":true},{\"label\":\"Option 2\",\"value\":\"option-2\"},{\"label\":\"Option 3\",\"value\":\"option-3\"}]},{\"type\":\"text\",\"label\":\"Text Field\",\"className\":\"form-control\",\"name\":\"text-1540803419797\",\"subtype\":\"text\"}]', '2018-10-28 22:57:45', '2018-10-28 22:57:45'),
(18, 9, 'Interaction', '[{\"type\":\"checkbox-group\",\"label\":\"Point Of Interest\",\"name\":\"checkbox-group-1540812186641\",\"values\":[{\"label\":\"Interest 1\",\"value\":\"Interest 1\",\"selected\":true},{\"label\":\"Interest 2\",\"value\":\"Interest 2\"}]},{\"type\":\"radio-group\",\"label\":\"Gender\",\"name\":\"radio-group-1540812312252\",\"values\":[{\"label\":\"Male\",\"value\":\"Male\"},{\"label\":\"Female\",\"value\":\"Female\"}]}]', '2018-10-29 01:31:11', '2018-10-29 01:31:11'),
(19, 10, 'your info', '[{\"type\":\"select\",\"label\":\"Country\",\"className\":\"form-control\",\"name\":\"select-1540884928383\",\"values\":[{\"label\":\"A\",\"value\":\"option-1\",\"selected\":true},{\"label\":\"B\",\"value\":\"option-2\"},{\"label\":\"C\",\"value\":\"option-3\"}]}]', '2018-10-29 21:35:42', '2018-10-29 21:35:42'),
(20, 11, 'Product Like', '[{\"type\":\"radio-group\",\"label\":\"Do you like this product?\",\"name\":\"product_like\",\"values\":[{\"label\":\"yes\",\"value\":\"yes\"},{\"label\":\"no\",\"value\":\"no\"},{\"label\":\"medium \",\"value\":\"medium\"}]}]', '2018-12-04 18:45:31', '2018-12-04 18:45:31'),
(21, 11, 'Do you want to contact you?', '[{\"type\":\"radio-group\",\"label\":\"Again contact you?\",\"name\":\"want_to_contact\",\"values\":[{\"label\":\"yes\",\"value\":\"yes\"},{\"label\":\"no\",\"value\":\"no\"}]}]', '2018-12-04 19:18:57', '2018-12-04 19:18:57'),
(22, 12, 'Trade Profile', '[{\"type\":\"checkbox-group\",\"label\":\"Please indicate your type of business\",\"name\":\"checkbox-group-1544342869350\",\"other\":true,\"values\":[{\"label\":\"Auction House\",\"value\":\"Auction House\"},{\"label\":\"Department Stores\",\"value\":\"\"},{\"label\":\"Engraver\",\"value\":\"\"},{\"label\":\"Exporter / Importer\",\"value\":\"\"},{\"label\":\"Galleries\",\"value\":\"\"},{\"label\":\"Gems and Jewelry wholesalers\",\"value\":\"\"},{\"label\":\"Gold and Silversmiths\",\"value\":\"\"}]},{\"type\":\"checkbox-group\",\"label\":\"Please indicate your purpose of visit\",\"name\":\"checkbox-group-1544343035235\",\"other\":true,\"values\":[{\"label\":\"Evaluate for future participation\",\"value\":\"Evaluate for future participation\"},{\"label\":\"Gather Information\",\"value\":\"Gather Information\"},{\"label\":\"Networking\",\"value\":\"Networking\"},{\"label\":\"Purchase / Place Order\",\"value\":\"Purchase / Place Order\"},{\"label\":\"Seek DIstribution Channels\",\"value\":\"Seek DIstribution Channels\"},{\"label\":\"Source for new product(s)\",\"value\":\"Source for new product(s)\"}]},{\"type\":\"radio-group\",\"label\":\"What is the estimated budget of your company to purchase jewelry products?\",\"name\":\"radio-group-1544343184748\",\"values\":[{\"label\":\"< USD 30,000\",\"value\":\"option-1\"},{\"label\":\"USD 30,000 - 100,000\",\"value\":\"option-2\"},{\"label\":\"USD 100,000 - 300,000\",\"value\":\"option-3\"},{\"label\":\"USD 300,000 - 1,000,000\",\"value\":\"\"},{\"label\":\">USD 1,000,000\",\"value\":\"\"}]},{\"type\":\"header\",\"subtype\":\"h3\",\"label\":\"Please indicate your main product interest\"},{\"type\":\"checkbox-group\",\"label\":\"Jewelry\",\"name\":\"checkbox-group-1544343447753\",\"values\":[{\"label\":\"Costume Jewelry\",\"value\":\"option-1\",\"selected\":true},{\"label\":\"Diamond Jewelry\",\"value\":\"\"},{\"label\":\"Gemset Jewelry\",\"value\":\"\"},{\"label\":\"Gold Jewelry\",\"value\":\"\"},{\"label\":\"Pearl Jewelry\",\"value\":\"\"}]},{\"type\":\"select\",\"label\":\"How did you know about us?\",\"className\":\"form-control\",\"name\":\"select-1544343330556\",\"values\":[{\"label\":\"Radio\",\"value\":\"option-1\",\"selected\":true},{\"label\":\"Newspaper\",\"value\":\"option-2\"},{\"label\":\"Other Trade show\",\"value\":\"option-3\"},{\"label\":\"Forums\",\"value\":\"\"}]},{\"type\":\"radio-group\",\"label\":\"Would you like to hear more from us?\",\"name\":\"radio-group-1544343541917\",\"values\":[{\"label\":\"Yes\",\"value\":\"option-1\"},{\"label\":\"No\",\"value\":\"option-2\"}]}]', '2018-12-09 00:19:31', '2018-12-09 00:19:31');

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
(37, 67, 11, 20, 'product_like', 'yes', '2018-12-04 19:40:27', '2018-12-04 19:40:27'),
(38, 67, 11, 21, 'want_to_contact', 'yes', '2018-12-04 19:40:27', '2018-12-04 19:40:27'),
(39, 68, 11, 20, 'product_like', 'medium', '2018-12-04 19:42:23', '2018-12-04 19:42:23'),
(40, 68, 11, 21, 'want_to_contact', 'no', '2018-12-04 19:42:23', '2018-12-04 19:42:23'),
(41, 69, 11, 20, 'product_like', 'no', '2018-12-04 19:47:14', '2018-12-04 19:47:14'),
(42, 69, 11, 21, 'want_to_contact', 'no', '2018-12-04 19:47:14', '2018-12-04 19:47:14'),
(43, 70, 5, 13, 'role', 'CFO', '2018-12-06 18:43:27', '2018-12-06 18:43:27'),
(44, 70, 5, 17, 'select 1540803406765', 'Option 2', '2018-12-06 18:43:27', '2018-12-06 18:43:27'),
(45, 70, 5, 17, 'text 1540803419797', 'test', '2018-12-06 18:43:27', '2018-12-06 18:43:27'),
(46, 71, 12, 22, 'checkbox group 1544342869350', 'Exporter / Importer', '2018-12-09 01:47:53', '2018-12-09 01:47:53'),
(47, 71, 12, 22, 'select 1544343330556', 'Radio', '2018-12-09 01:47:53', '2018-12-09 01:47:53'),
(48, 72, 11, 20, 'product_like', 'yes', '2018-12-09 03:48:58', '2018-12-09 03:48:58'),
(49, 72, 11, 21, 'want_to_contact', 'yes', '2018-12-09 03:48:58', '2018-12-09 03:48:58'),
(50, 73, 11, 20, 'product_like', 'yes', '2018-12-09 03:49:29', '2018-12-09 03:49:29'),
(51, 73, 11, 21, 'want_to_contact', 'yes', '2018-12-09 03:49:29', '2018-12-09 03:49:29'),
(52, 74, 11, 20, 'product_like', 'yes', '2018-12-09 03:50:50', '2018-12-09 03:50:50'),
(53, 74, 11, 21, 'want_to_contact', 'yes', '2018-12-09 03:50:50', '2018-12-09 03:50:50'),
(54, 75, 5, 13, 'role', 'CFO', '2018-12-09 03:53:59', '2018-12-09 03:53:59'),
(55, 75, 5, 17, 'select 1540803406765', 'Option 2', '2018-12-09 03:53:59', '2018-12-09 03:53:59'),
(56, 75, 5, 17, 'text 1540803419797', 'fgg', '2018-12-09 03:53:59', '2018-12-09 03:53:59'),
(57, 77, 12, 22, 'checkbox group 1544342869350', 'Department Stores', '2018-12-10 20:24:58', '2018-12-10 20:24:58'),
(58, 77, 12, 22, 'checkbox group 1544342869350', 'Gems and Jewelry wholesalers', '2018-12-10 20:24:58', '2018-12-10 20:24:58'),
(59, 77, 12, 22, 'checkbox group 1544343035235', 'Source for new product(s)', '2018-12-10 20:24:58', '2018-12-10 20:24:58'),
(60, 77, 12, 22, 'radio group 1544343184748', 'USD 30,000 - 100,000', '2018-12-10 20:24:58', '2018-12-10 20:24:58'),
(61, 77, 12, 22, 'checkbox group 1544343447753', 'Diamond Jewelry', '2018-12-10 20:24:58', '2018-12-10 20:24:58'),
(62, 77, 12, 22, 'select 1544343330556', 'Forums', '2018-12-10 20:24:58', '2018-12-10 20:24:58'),
(63, 77, 12, 22, 'radio group 1544343541917', 'No', '2018-12-10 20:24:58', '2018-12-10 20:24:58');

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
(3, 6, 'test', '11-25-2018_name_badge_template_0_1543112751.jpg', '2018-11-24 16:25:51', '2018-11-25 20:00:23'),
(4, 6, 'abc update', '11-25-2018_name_badge_template_1_1543112751.jpg', '2018-11-24 16:25:51', '2018-11-25 10:54:01'),
(5, 7, 'test 1', '11-27-2018_name_badge_template_0_1543281552.JPG', '2018-11-26 15:19:12', '2018-11-26 15:19:12'),
(6, 7, 'test 2', '11-29-2018_name_badge_template_0_1543531647.jpg', '2018-11-29 14:47:27', '2018-11-29 14:47:27'),
(7, 8, 'test template', '12-01-2018_name_badge_template_0_1543694076.png', '2018-12-01 11:54:36', '2018-12-01 11:54:36'),
(8, 9, 'test', '12-10-2018_name_badge_template_0_1544429213.php', '2018-12-10 00:06:53', '2018-12-10 00:06:53'),
(11, 10, 'protrait', '12-11-2018_name_badge_template_0_1544496778.jpg', '2018-12-10 18:52:58', '2018-12-10 18:52:58'),
(12, 10, 'landscape', '12-11-2018_name_badge_template_0_1544496810.jpg', '2018-12-10 18:53:30', '2018-12-10 18:53:30'),
(13, 10, 'landscape 2', '12-11-2018_name_badge_template_0_1544496832.jpg', '2018-12-10 18:53:52', '2018-12-10 18:53:52');

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
(6, 5, '8', '5.347', 'portrait', '', 'mm', '2018-11-24 16:25:51', '2018-12-10 00:04:26'),
(7, 11, '75', '105', 'portrait', '11-29-2018_name_badge_template_0_1543531647.jpg', 'mm', '2018-11-26 15:19:12', '2018-11-29 14:56:01'),
(8, 10, '30', '35', NULL, '', 'cm', '2018-12-01 11:54:36', '2018-12-01 11:54:36'),
(9, 9, '500', '500', NULL, '', 'mm', '2018-12-10 00:06:53', '2018-12-10 00:06:53'),
(10, 12, '90', '135', NULL, '12-11-2018_name_badge_template_0_1544496778.jpg', 'mm', '2018-12-10 18:50:20', '2018-12-10 19:13:03');

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
(74, 6, 5, 'serial_digit', '37.25', '64.96875', '1px', '1px', '{\"font_unit\":\"\",\"font_size\":\"9\",\"font_weight\":\"\"}', '2018-11-25 20:02:16', '2018-11-25 20:03:00'),
(75, 6, 5, 'qrcode_path', '219.25', '62.875', '1px', '1px', NULL, '2018-11-25 20:02:16', '2018-11-25 20:02:16'),
(76, 6, 5, 'first_name', '34.25', '100.6875', '', '', '{\"font_unit\":\"\",\"font_size\":\"20\",\"font_weight\":\"bold\"}', '2018-11-25 20:02:16', '2018-11-25 20:04:00'),
(77, 6, 5, 'last_name', '36.25', '136.59375', '', '', NULL, '2018-11-25 20:02:16', '2018-11-25 20:02:16'),
(78, 6, 5, 'company_name', '40.25', '179.5', '', '', NULL, '2018-11-25 20:02:16', '2018-11-25 20:02:16'),
(117, 7, 11, 'first_name', '39.25', '70.875', '', '', '{\"font_color\":\"#000000\",\"font_size\":\"18\",\"font_weight\":\"bold\"}', '2018-12-01 12:42:43', '2018-12-01 12:56:48'),
(118, 7, 11, 'last_name', '194.25', '72.859375', '', '', '{\"font_color\":\"#000000\",\"font_size\":\"18\",\"font_weight\":\"bold\"}', '2018-12-01 12:42:43', '2018-12-01 12:56:59'),
(119, 7, 11, 'company_name', '150.25', '110.828125', '', '', '{\"font_color\":\"#000000\",\"font_size\":\"16\",\"font_weight\":\"bold\"}', '2018-12-01 12:42:43', '2018-12-01 12:57:11'),
(120, 7, 11, 'namebadge_user_label', '135.25', '319.6875', '', '', '{\"font_color\":\"#ff0000\",\"font_size\":\"20\",\"font_weight\":\"bold\"}', '2018-12-01 12:42:43', '2018-12-01 13:08:45'),
(121, 10, 12, 'serial_digit', '160.25', '211.96875', '1px', '1px', NULL, '2018-12-10 18:55:54', '2018-12-10 18:55:54'),
(122, 10, 12, 'qrcode_path', '164.25', '187.9375', '1px', '1px', NULL, '2018-12-10 18:55:54', '2018-12-10 18:55:54'),
(123, 10, 12, 'first_name', '160.25', '84.875', '', '', NULL, '2018-12-10 18:55:54', '2018-12-10 18:55:54'),
(124, 10, 12, 'last_name', '161.25', '111.84375', '', '', NULL, '2018-12-10 18:55:54', '2018-12-10 18:55:54'),
(125, 10, 12, 'namebadge_user_label', '166.25', '251.6875', '', '', NULL, '2018-12-10 18:55:54', '2018-12-10 18:55:54');

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
(1, 11, '{\"event_id\":\"11\",\"page_height\":\"10.5cm\",\"page_width\":\"7.5cm\",\"margin_top\":\"0cm\",\"margin_right\":\"0cm\",\"margin_bottom\":\"0cm\",\"margin_left\":\"0cm\",\"font_color\":\"#000000\"}', '2018-11-27 15:14:57', '2018-11-27 15:53:57');

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
(153, 0, 11, '8de441f2604bb1eb5517e81ae81f8caf', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-11-09 10:27:02\",\"updated_at\":\"2018-11-09 10:27:02\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"company_name\":\"Dnet\",\"company_address\":\"Dhaka\",\"gender\":\"Male\",\"designation\":\"Software Engineer\",\"mobile\":\"01716600843\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-11-09 10:27:02\",\"updated_at\":\"2018-11-09 10:27:02\"}]}', '2018-11-09 00:27:02', '2018-11-09 00:27:02'),
(154, 20, 11, '8de441f2604bb1eb5517e81ae81f8caf', '{\"text-1541328258607\":\"Good\",\"textarea-1541328262437\":\"Large events\"}', '2018-11-09 00:27:16', '2018-11-09 00:27:16'),
(155, 0, 11, '9dd156cadbe47c3b62b5eb7b512f368b', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-11-09 10:34:43\",\"updated_at\":\"2018-11-09 10:34:43\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Mdm\",\"first_name\":\"Meghna\",\"last_name\":\"Jahan\",\"company_name\":\"Saif Power Tech LTD\",\"company_address\":\"Gulshan\",\"gender\":null,\"designation\":null,\"mobile\":\"01716690909\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2018-11-09 10:34:43\",\"updated_at\":\"2018-11-09 10:34:43\"}]}', '2018-11-09 00:34:43', '2018-11-09 00:34:43'),
(156, 20, 11, '9dd156cadbe47c3b62b5eb7b512f368b', '{\"text-1541328258607\":\"Good\",\"textarea-1541328262437\":\"Big Events\"}', '2018-11-09 00:34:57', '2018-11-09 00:34:57'),
(157, 0, 11, '917a8cce2ae5abb425a08e9d96399a57', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Onsite\",\"created_at\":\"2018-11-09 10:38:37\",\"updated_at\":\"2018-11-09 10:38:37\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Rizveer\",\"last_name\":\"Ahmed\",\"company_name\":\"Biddut\",\"company_address\":\"Dhaka\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"01716161\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-11-09 10:38:37\",\"updated_at\":\"2018-11-09 10:38:37\"}]}', '2018-11-09 00:38:37', '2018-11-09 00:38:37'),
(158, 20, 11, '917a8cce2ae5abb425a08e9d96399a57', '{\"text-1541328258607\":\"Good\",\"textarea-1541328262437\":\"Ok\"}', '2018-11-09 00:38:45', '2018-11-09 00:38:45'),
(159, 0, 11, 'e126dd727d04e7daab59ebc83c8370ec', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-03 03:54:53\",\"updated_at\":\"2018-12-03 03:54:53\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Faisal Ahmed\",\"last_name\":\"Sumon\",\"company_name\":\"Digital Bangla\",\"company_address\":\"Boshundhara\",\"gender\":\"Male\",\"designation\":\"DGM\",\"mobile\":\"01978781\",\"country_id\":\"1\",\"tel\":\"121212\",\"fax\":\"2121\",\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-12-03 03:54:53\",\"updated_at\":\"2018-12-03 03:54:53\"}]}', '2018-12-02 19:54:53', '2018-12-02 19:54:53'),
(160, 20, 11, 'e126dd727d04e7daab59ebc83c8370ec', '{\"text-1541328258607\":\"test\",\"textarea-1541328262437\":\"test\"}', '2018-12-02 19:55:15', '2018-12-02 19:55:15'),
(161, 0, 11, 'b76362e48487fd5311e994eaf7981934', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-05 03:40:06\",\"updated_at\":\"2018-12-05 03:40:06\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"company_name\":\"Saif Power tec LTD\",\"company_address\":\"72 Mohakhali.\",\"gender\":\"Male\",\"designation\":\"Web designer\",\"mobile\":\"01716600843\",\"country_id\":\"1\",\"tel\":\"02918\",\"fax\":\"12345\",\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2018-12-05 03:40:06\",\"updated_at\":\"2018-12-05 03:40:06\"}]}', '2018-12-04 19:40:06', '2018-12-04 19:40:06'),
(162, 20, 11, 'b76362e48487fd5311e994eaf7981934', '{\"product_like\":\"yes\"}', '2018-12-04 19:40:13', '2018-12-04 19:40:13'),
(163, 21, 11, 'b76362e48487fd5311e994eaf7981934', '{\"want_to_contact\":\"yes\"}', '2018-12-04 19:40:17', '2018-12-04 19:40:17'),
(164, 0, 11, 'a11e9e5ac00aaf8527eb623d8f861ee1', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-05 03:42:10\",\"updated_at\":\"2018-12-05 03:42:10\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"Meghna\",\"last_name\":\"Jahan\",\"company_name\":\"Dnet\",\"company_address\":\"Humayon Road\",\"gender\":\"Female\",\"designation\":\"Executive Officer\",\"mobile\":\"0128171709\",\"country_id\":\"2\",\"tel\":\"02134566\",\"fax\":\"0233134\",\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-12-05 03:42:10\",\"updated_at\":\"2018-12-05 03:42:10\"}]}', '2018-12-04 19:42:10', '2018-12-04 19:42:10'),
(165, 20, 11, 'a11e9e5ac00aaf8527eb623d8f861ee1', '{\"product_like\":\"medium\"}', '2018-12-04 19:42:14', '2018-12-04 19:42:14'),
(166, 21, 11, 'a11e9e5ac00aaf8527eb623d8f861ee1', '{\"want_to_contact\":\"no\"}', '2018-12-04 19:42:17', '2018-12-04 19:42:17'),
(167, 0, 11, 'bbf51fd6c9213a6beab436935d1c1303', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Onsite\",\"created_at\":\"2018-12-05 03:46:35\",\"updated_at\":\"2018-12-05 03:46:35\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Dr\",\"first_name\":\"Farad\",\"last_name\":\"Hassan\",\"company_name\":\"Technobd web solution PVT LTD\",\"company_address\":\"Kawran Bazar\",\"gender\":\"Male\",\"designation\":\"Engineer\",\"mobile\":\"029373635\",\"country_id\":\"2\",\"tel\":\"01929291\",\"fax\":\"01929383\",\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-12-05 03:46:35\",\"updated_at\":\"2018-12-05 03:46:35\"}]}', '2018-12-04 19:46:35', '2018-12-04 19:46:35'),
(168, 20, 11, 'bbf51fd6c9213a6beab436935d1c1303', '{\"product_like\":\"no\"}', '2018-12-04 19:46:41', '2018-12-04 19:46:41'),
(169, 21, 11, 'bbf51fd6c9213a6beab436935d1c1303', '{\"want_to_contact\":\"no\"}', '2018-12-04 19:46:44', '2018-12-04 19:46:44'),
(170, 0, 5, '6a01064a1cf1f6c1a1f9f16c6320f3da', '{\"event_business_owners_data\":{\"event_id\":\"5\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-07 02:43:00\",\"updated_at\":\"2018-12-07 02:43:00\"},\"event_business_owners_details\":[{\"event_id\":\"5\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Willium\",\"last_name\":\"Tuitman\",\"company_name\":\"PLIS\",\"company_address\":\"Germany\",\"gender\":\"Male\",\"designation\":\"Team Leader\",\"mobile\":\"09282828\",\"country_id\":\"1\",\"tel\":\"02\",\"fax\":\"02\",\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-12-07 02:43:00\",\"updated_at\":\"2018-12-07 02:43:00\"}]}', '2018-12-06 18:43:00', '2018-12-06 18:43:00'),
(171, 13, 5, '6a01064a1cf1f6c1a1f9f16c6320f3da', '{\"role\":\"CFO\"}', '2018-12-06 18:43:12', '2018-12-06 18:43:12'),
(172, 17, 5, '6a01064a1cf1f6c1a1f9f16c6320f3da', '{\"select-1540803406765\":\"Option 2\",\"text-1540803419797\":\"test\"}', '2018-12-06 18:43:22', '2018-12-06 18:43:22'),
(173, 0, 12, 'fe69da47de2780e8e2fd9e347a496a7a', '{\"event_business_owners_data\":{\"event_id\":\"12\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-09 09:19:39\",\"updated_at\":\"2018-12-09 09:19:39\"},\"event_business_owners_details\":[{\"event_id\":\"12\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Ze\",\"last_name\":\"Teo\",\"company_name\":\"Asd\",\"company_address\":null,\"gender\":\"Male\",\"designation\":null,\"mobile\":\"94747483\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"zeteo87@gmail.com\",\"created_at\":\"2018-12-09 09:19:39\",\"updated_at\":\"2018-12-09 09:19:39\"}]}', '2018-12-09 01:19:39', '2018-12-09 01:19:39'),
(174, 22, 12, 'fe69da47de2780e8e2fd9e347a496a7a', '{\"checkbox-group-1544342869350\":[\"Auction House\",\"Galleries\"],\"checkbox-group-1544343035235\":[\"Purchase \\/ Place Order\",\"Seek DIstribution Channels\"],\"checkbox-group-1544343447753\":[\"Pearl Jewelry\"],\"select-1544343330556\":\"Radio\",\"radio-group-1544343541917\":\"No\"}', '2018-12-09 01:21:40', '2018-12-09 01:21:40'),
(175, 0, 12, '527f8743eb9a86b2310bf7eb3dc6c853', '{\"event_business_owners_data\":{\"event_id\":\"12\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-09 09:26:13\",\"updated_at\":\"2018-12-09 09:26:13\"},\"event_business_owners_details\":[{\"event_id\":\"12\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"ze\",\"last_name\":\"teo\",\"company_name\":\"asd\",\"company_address\":null,\"gender\":null,\"designation\":null,\"mobile\":\"36236\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"zeteo87@gmail.com\",\"created_at\":\"2018-12-09 09:26:13\",\"updated_at\":\"2018-12-09 09:26:13\"}]}', '2018-12-09 01:26:13', '2018-12-09 01:26:13'),
(176, 22, 12, '527f8743eb9a86b2310bf7eb3dc6c853', '{\"checkbox-group-1544342869350\":[\"Galleries\"],\"select-1544343330556\":\"Radio\"}', '2018-12-09 01:26:17', '2018-12-09 01:26:17'),
(177, 0, 12, '159d4440c4a004b65783e683de2ab9d5', '{\"event_business_owners_data\":{\"event_id\":\"12\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-09 09:47:42\",\"updated_at\":\"2018-12-09 09:47:42\"},\"event_business_owners_details\":[{\"event_id\":\"12\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"ze\",\"last_name\":\"teo\",\"company_name\":\"asd\",\"company_address\":null,\"gender\":null,\"designation\":null,\"mobile\":\"3462364\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"zeteo87@gmail.com\",\"created_at\":\"2018-12-09 09:47:42\",\"updated_at\":\"2018-12-09 09:47:42\"}]}', '2018-12-09 01:47:42', '2018-12-09 01:47:42'),
(178, 22, 12, '159d4440c4a004b65783e683de2ab9d5', '{\"checkbox-group-1544342869350\":[\"Exporter \\/ Importer\"],\"select-1544343330556\":\"Radio\"}', '2018-12-09 01:47:47', '2018-12-09 01:47:47'),
(179, 0, 11, 'c4dd4f9ff507396c8b0c3e682e68b342', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-09 11:48:41\",\"updated_at\":\"2018-12-09 11:48:41\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"tanveer\",\"last_name\":\"qureshee\",\"company_name\":\"abc\",\"company_address\":\"abc\",\"gender\":\"Male\",\"designation\":\"abc\",\"mobile\":\"09383\",\"country_id\":\"1\",\"tel\":\"092\",\"fax\":\"02\",\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-12-09 11:48:41\",\"updated_at\":\"2018-12-09 11:48:41\"}]}', '2018-12-09 03:48:41', '2018-12-09 03:48:41'),
(180, 20, 11, 'c4dd4f9ff507396c8b0c3e682e68b342', '{\"product_like\":\"yes\"}', '2018-12-09 03:48:46', '2018-12-09 03:48:46'),
(181, 21, 11, 'c4dd4f9ff507396c8b0c3e682e68b342', '{\"want_to_contact\":\"yes\"}', '2018-12-09 03:48:50', '2018-12-09 03:48:50'),
(182, 0, 5, '2b4ab4f627b25096f4163b763b48ba62', '{\"event_business_owners_data\":{\"event_id\":\"5\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-09 11:53:44\",\"updated_at\":\"2018-12-09 11:53:44\"},\"event_business_owners_details\":[{\"event_id\":\"5\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Mamun\",\"last_name\":\"Ur Rashid\",\"company_name\":\"DFY\",\"company_address\":\"ABC\",\"gender\":\"Female\",\"designation\":\"Desiner\",\"mobile\":\"4646\",\"country_id\":\"1\",\"tel\":\"23\",\"fax\":\"4\",\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2018-12-09 11:53:44\",\"updated_at\":\"2018-12-09 11:53:44\"}]}', '2018-12-09 03:53:44', '2018-12-09 03:53:44'),
(183, 13, 5, '2b4ab4f627b25096f4163b763b48ba62', '{\"role\":\"CFO\"}', '2018-12-09 03:53:49', '2018-12-09 03:53:49'),
(184, 17, 5, '2b4ab4f627b25096f4163b763b48ba62', '{\"select-1540803406765\":\"Option 2\",\"text-1540803419797\":\"fgg\"}', '2018-12-09 03:53:54', '2018-12-09 03:53:54'),
(185, 0, 12, '06c72a70b67dc056d2e0d59ee1a5d7ab', '{\"event_business_owners_data\":{\"event_id\":\"12\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-11 04:24:37\",\"updated_at\":\"2018-12-11 04:24:37\"},\"event_business_owners_details\":[{\"event_id\":\"12\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"teo\",\"last_name\":\"zheng eng\",\"company_name\":\"jumppy\",\"company_address\":null,\"gender\":\"Male\",\"designation\":\"Dir\",\"mobile\":\"9876543\",\"country_id\":\"1\",\"tel\":null,\"fax\":\"a\",\"email\":\"adrian_teo@jumppy.com.sg\",\"created_at\":\"2018-12-11 04:24:37\",\"updated_at\":\"2018-12-11 04:24:37\"}]}', '2018-12-10 20:24:37', '2018-12-10 20:24:37'),
(186, 22, 12, '06c72a70b67dc056d2e0d59ee1a5d7ab', '{\"checkbox-group-1544342869350\":[\"Department Stores\",\"Gems and Jewelry wholesalers\"],\"checkbox-group-1544343035235\":[\"Source for new product(s)\"],\"radio-group-1544343184748\":\"USD 30,000 - 100,000\",\"checkbox-group-1544343447753\":[\"Diamond Jewelry\"],\"select-1544343330556\":\"Forums\",\"radio-group-1544343541917\":\"No\"}', '2018-12-10 20:24:50', '2018-12-10 20:24:50');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(400) DEFAULT NULL,
  `values` text,
  `data_type` varchar(100) DEFAULT NULL,
  `post_type` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `values`, `data_type`, `post_type`) VALUES
(1, 'salutation', 'Mr,Ms,Mdm,Dr', 'csv', NULL),
(2, 'gender', 'Male,Female,Others', 'csv', NULL),
(3, 'page orientation', 'portrait,landscape', 'csv', NULL),
(4, 'units', 'in,px,mm', 'csv', NULL),
(5, 'namebadge label', 'visitor,organizer,volunteer', 'csv', NULL),
(6, '12', '<p><strong>Hi There!</strong><br /><br />This is an email test.<br /><em>We are updating...</em></p>\r\n<p>But will still send you.&nbsp;</p>\r\n<p><br />Thank<br /><strong>Registro AsiaTeam</strong></p>', 'text', 'email_text'),
(7, '5', '<p><strong>Hi There!</strong><br /><br />This is an email test for Airshow 2020.<br /><em>We are updating...</em><br /><br />Thank<br /><strong>Registro AsiaTeam</strong></p>', 'text', 'email_text');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `event_business_owners`
--
ALTER TABLE `event_business_owners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `event_business_owners_details`
--
ALTER TABLE `event_business_owners_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `event_forms`
--
ALTER TABLE `event_forms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `event_registeration_form_values`
--
ALTER TABLE `event_registeration_form_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `namebadge_template_details`
--
ALTER TABLE `namebadge_template_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `name_badge_config`
--
ALTER TABLE `name_badge_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `name_badge_position`
--
ALTER TABLE `name_badge_position`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `print_layout_config`
--
ALTER TABLE `print_layout_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `registraion_temp`
--
ALTER TABLE `registraion_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `temp_csv_import_data`
--
ALTER TABLE `temp_csv_import_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
