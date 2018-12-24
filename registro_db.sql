CREATE TABLE `cron_job_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `is_running` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cron_job_status`
--

INSERT INTO `cron_job_status` (`id`, `name`, `is_running`) VALUES
(1, 'email_and_pdf', 0);

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
(12, 'Singapore International Jewelry Expo 2019', 'SIJE', '2019-02-01', '2019-02-03', 'Marina Bay Sands', '10 Bayfront Ave, Singapore 018956', 'Singapore-International-Jewelry-Expo-2019', NULL, '2018-12-08 22:06:07', '2018-12-08 22:06:07'),
(13, 'ABS 2019', 'Alvin', '2018-12-28', '2018-12-30', 'MBS', '1 MBS dive', 'ABS-2019', NULL, '2018-12-15 01:06:41', '2018-12-15 01:06:41'),
(14, 'Architecture & Bulding Services 2018', 'Alot of Organisation', '2018-10-02', '2018-10-03', 'Marina Bay Sands Hall 2B', '1 Marina Drive', 'Architecture-&-Bulding-Services-2018', NULL, '2018-12-19 15:36:17', '2018-12-19 15:36:17');

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
(71, 12, 1, 'Online', 1, '2018-12-08 23:47:53', '2018-12-08 23:47:53'),
(83, 12, 49, 'Import', 0, '2018-12-11 18:09:24', '2018-12-11 18:09:24'),
(84, 13, 2, 'Online', 1, '2018-12-15 01:10:56', '2018-12-15 01:10:56'),
(85, 13, 2, 'Online', 1, '2018-12-15 01:11:01', '2018-12-15 01:11:01'),
(86, 13, 2, 'Online', 1, '2018-12-15 01:11:02', '2018-12-15 01:11:02'),
(87, 13, 2, 'Online', 1, '2018-12-15 01:11:07', '2018-12-15 01:11:07'),
(88, 13, 2, 'Online', 1, '2018-12-15 01:11:27', '2018-12-15 01:11:27'),
(89, 13, 2, 'Online', 1, '2018-12-15 01:11:28', '2018-12-15 01:11:28'),
(90, 13, 2, 'Online', 1, '2018-12-15 01:11:32', '2018-12-15 01:11:32'),
(91, 13, 2, 'Online', 1, '2018-12-15 01:11:34', '2018-12-15 01:11:34'),
(92, 13, 2, 'Online', 1, '2018-12-15 01:11:39', '2018-12-15 01:11:39'),
(93, 13, 2, 'Online', 1, '2018-12-15 01:11:39', '2018-12-15 01:11:39'),
(94, 13, 2, 'Online', 1, '2018-12-15 01:11:40', '2018-12-15 01:11:40'),
(95, 13, 2, 'Online', 1, '2018-12-15 01:11:40', '2018-12-15 01:11:40'),
(96, 13, 2, 'Online', 1, '2018-12-15 01:11:41', '2018-12-15 01:11:41'),
(97, 13, 2, 'Online', 1, '2018-12-15 01:11:41', '2018-12-15 01:11:41'),
(98, 13, 2, 'Online', 1, '2018-12-15 01:11:52', '2018-12-15 01:11:52'),
(99, 13, 2, 'Online', 1, '2018-12-15 01:11:52', '2018-12-15 01:11:52'),
(100, 13, 2, 'Online', 1, '2018-12-15 01:11:53', '2018-12-15 01:11:53'),
(101, 13, 2, 'Online', 1, '2018-12-15 01:11:53', '2018-12-15 01:11:53'),
(102, 13, 2, 'Online', 1, '2018-12-15 01:11:54', '2018-12-15 01:11:54'),
(103, 13, 2, 'Online', 1, '2018-12-15 01:11:54', '2018-12-15 01:11:54'),
(104, 13, 2, 'Online', 1, '2018-12-15 01:11:55', '2018-12-15 01:11:55'),
(105, 13, 2, 'Online', 1, '2018-12-15 01:11:55', '2018-12-15 01:11:55'),
(106, 13, 2, 'Online', 1, '2018-12-15 01:11:55', '2018-12-15 01:11:55'),
(107, 13, 2, 'Online', 1, '2018-12-15 01:11:56', '2018-12-15 01:11:56'),
(108, 13, 2, 'Online', 1, '2018-12-15 01:12:05', '2018-12-15 01:12:05'),
(109, 13, 2, 'Online', 1, '2018-12-15 01:12:06', '2018-12-15 01:12:06'),
(110, 13, 2, 'Online', 1, '2018-12-15 01:12:06', '2018-12-15 01:12:06'),
(111, 13, 2, 'Online', 1, '2018-12-15 01:12:06', '2018-12-15 01:12:06'),
(112, 13, 2, 'Online', 1, '2018-12-15 01:12:07', '2018-12-15 01:12:07'),
(113, 13, 2, 'Online', 1, '2018-12-15 01:12:07', '2018-12-15 01:12:07'),
(114, 13, 2, 'Online', 1, '2018-12-15 01:12:08', '2018-12-15 01:12:08'),
(115, 13, 2, 'Online', 1, '2018-12-15 01:12:09', '2018-12-15 01:12:09'),
(116, 13, 2, 'Online', 1, '2018-12-15 01:12:11', '2018-12-15 01:12:11'),
(117, 13, 2, 'Online', 1, '2018-12-15 01:12:13', '2018-12-15 01:12:13'),
(118, 12, 1, 'Online', 1, '2018-12-15 01:13:15', '2018-12-15 01:13:15'),
(119, 13, 49, 'Import', 0, '2018-12-15 01:15:36', '2018-12-15 01:15:36'),
(120, 13, 1, 'Online', 1, '2018-12-14 16:29:30', '2018-12-14 16:29:30'),
(121, 13, 1, 'Online', 1, '2018-12-16 02:23:17', '2018-12-16 02:23:17'),
(122, 13, 1, 'Online', 1, '2018-12-16 02:28:46', '2018-12-16 02:28:46'),
(123, 13, 1, 'Online', 1, '2018-12-16 02:32:32', '2018-12-16 02:32:32'),
(124, 13, 1, 'Online', 1, '2018-12-16 02:40:10', '2018-12-16 02:40:10'),
(125, 13, 1, 'Online', 1, '2018-12-16 02:41:25', '2018-12-16 02:41:25'),
(126, 13, 49, 'Import', 0, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(127, 13, 1, 'Online', 1, '2018-12-16 22:45:05', '2018-12-16 22:45:05'),
(128, 13, 49, 'Import', 0, '2018-12-18 15:36:40', '2018-12-18 15:36:40'),
(129, 13, 49, 'Import', 0, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(130, 13, 1, 'Online', 1, '2018-12-18 15:59:41', '2018-12-18 15:59:41'),
(139, 14, 2, 'Import', 0, '2018-12-24 04:17:37', '2018-12-24 04:17:37');

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
  `is_mail_confirmed` tinyint(1) NOT NULL DEFAULT '1',
  `num_of_mail_sent` int(11) NOT NULL DEFAULT '0',
  `qrcode_path` text COLLATE utf8mb4_unicode_ci,
  `pdf_path` text COLLATE utf8mb4_unicode_ci,
  `namebadge_printed_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_business_owners_details`
--

INSERT INTO `event_business_owners_details` (`id`, `event_id`, `business_owner_id`, `salutation`, `first_name`, `last_name`, `company_name`, `company_address`, `gender`, `designation`, `mobile`, `country_id`, `tel`, `fax`, `email`, `serial_digit`, `namebadge_user_label`, `is_confirmed`, `is_status`, `is_mail_confirmed`, `num_of_mail_sent`, `qrcode_path`, `pdf_path`, `namebadge_printed_date`, `created_at`, `updated_at`) VALUES
(62, 12, 71, 'Mr', 'ze', 'teo', 'asd', NULL, NULL, NULL, '3462364', 1, NULL, NULL, 'tanveerqureshee1@gmail.com', '008899141271', 'Visitor', 1, 1, 1, 0, '008899141271.png', 'Singapore-International-Jewelry-Expo-2019_008899141271.pdf', '2018-12-19 12:20:46', '2018-12-08 23:47:53', '2018-12-18 00:38:44'),
(275, 12, 83, NULL, 'Cyndi', 'Arlena', 'Cyndi Arlena Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', NULL, '95167077', 1, NULL, NULL, 'tanveerqureshee@hotmail.com', '348431931283', 'Organiser', 1, 1, 1, 0, '348431931283.png', 'Singapore-International-Jewelry-Expo-2019_348431931283.pdf', '2018-12-19 12:20:29', '2018-12-11 18:09:24', '2018-12-18 00:39:20'),
(276, 12, 83, 'Mrs.', 'Golden', 'Brandi', 'Golden Brandi Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '98940528', 1, '', '', 'adrian_teo@jumppy.com.sg', '541433031283', 'Visitor', 1, 1, 1, 0, '541433031283.png', 'Singapore-International-Jewelry-Expo-2019_541433031283.pdf', '2018-12-19 12:20:29', '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(277, 12, 83, 'Ms', 'Jude', 'Lyndsay', 'Jude Lyndsay Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98547857', 1, '', '', 'happy@jumppy.com.sg', '792171711283', 'Visitor', 1, 1, 1, 0, '792171711283.png', 'Singapore-International-Jewelry-Expo-2019_792171711283.pdf', '2018-12-19 12:20:29', '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(278, 12, 83, 'Dr.', 'Doloris', 'Siobhan', 'Doloris Siobhan Pte Ltd', '8 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '97708117', 1, '', '', 'Doloris.Siobhan@gmail.com', '183555601283', 'Visitor', 1, 1, 1, 0, '183555601283.png', 'Singapore-International-Jewelry-Expo-2019_183555601283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(279, 12, 83, 'Prof', 'Glen', 'Ashly', 'Glen Ashly Pte Ltd', '108 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '96744641', 1, '', '', 'Glen.Ashly@gmail.com', '375838161283', 'Visitor', 1, 1, 1, 0, '375838161283.png', 'Singapore-International-Jewelry-Expo-2019_375838161283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(280, 12, 83, 'Mr.', 'Lillia', 'Jenniffer', 'Lillia Jenniffer Pte Ltd', '35 Gul Crescent, 629544, Singapore', 'Male', '', '98771508', 1, '', '', 'Lillia.Jenniffer@gmail.com', '538572321283', 'Visitor', 1, 1, 1, 0, '538572321283.png', 'Singapore-International-Jewelry-Expo-2019_538572321283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(281, 12, 83, 'Mrs.', 'Denna', 'Stephany', 'Denna Stephany Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '93203051', 1, '', '', 'Denna.Stephany@gmail.com', '451597641283', 'Visitor', 1, 1, 1, 0, '451597641283.png', 'Singapore-International-Jewelry-Expo-2019_451597641283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(282, 12, 83, 'Ms', 'Esther', 'Florencia', 'Esther Florencia Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Female', '', '94224847', 1, '', '', 'Esther.Florencia@gmail.com', '409965021283', 'Visitor', 1, 1, 1, 0, '409965021283.png', 'Singapore-International-Jewelry-Expo-2019_409965021283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(283, 12, 83, 'Dr.', 'Nguyet', 'Hannelore', 'Nguyet Hannelore Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '90324269', 1, '', '', 'Nguyet.Hannelore@gmail.com', '864710501283', 'Visitor', 1, 1, 1, 0, '864710501283.png', 'Singapore-International-Jewelry-Expo-2019_864710501283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(284, 12, 83, 'Prof', 'Elias', 'Deedra', 'Elias Deedra Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '89073452', 1, '', '', 'Elias.Deedra@gmail.com', '897179901283', 'Visitor', 1, 1, 1, 0, '897179901283.png', 'Singapore-International-Jewelry-Expo-2019_897179901283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(285, 12, 83, 'Mr.', 'Trevor', 'Fatima', 'Trevor Fatima Pte Ltd', '9 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Female', '', '89600025', 1, '', '', 'Trevor.Fatima@gmail.com', '959092021283', 'Visitor', 1, 1, 1, 0, '959092021283.png', 'Singapore-International-Jewelry-Expo-2019_959092021283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(286, 12, 83, 'Mrs.', 'Berneice', 'Melvina', 'Berneice Melvina Pte Ltd', '109 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '99223653', 1, '', '', 'Berneice.Melvina@gmail.com', '083244641283', 'Visitor', 1, 1, 1, 0, '083244641283.png', 'Singapore-International-Jewelry-Expo-2019_083244641283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(287, 12, 83, 'Ms', 'Dreama', 'Vincent', 'Dreama Vincent Pte Ltd', '36 Gul Crescent, 629544, Singapore', 'Male', '', '97278857', 1, '', '', 'Dreama.Vincent@gmail.com', '942053541283', 'Visitor', 1, 1, 1, 0, '942053541283.png', 'Singapore-International-Jewelry-Expo-2019_942053541283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(288, 12, 83, 'Dr.', 'Rozella', 'Lizzie', 'Rozella Lizzie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Female', '', '99875966', 1, '', '', 'Rozella.Lizzie@gmail.com', '978101811283', 'Visitor', 1, 1, 1, 0, '978101811283.png', 'Singapore-International-Jewelry-Expo-2019_978101811283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(289, 12, 83, 'Prof', 'Xiao', 'Mariela', 'Xiao Mariela Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '92648112', 1, '', '', 'Xiao.Mariela@gmail.com', '467897031283', 'Visitor', 1, 1, 1, 0, '467897031283.png', 'Singapore-International-Jewelry-Expo-2019_467897031283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(290, 12, 83, 'Mr.', 'Zandra', 'Yan', 'Zandra Yan Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '90962634', 1, '', '', 'Zandra.Yan@gmail.com', '464140141283', 'Visitor', 1, 1, 1, 0, '464140141283.png', 'Singapore-International-Jewelry-Expo-2019_464140141283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(291, 12, 83, 'Mrs.', 'Nadia', 'Claris', 'Nadia Claris Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Female', '', '94332539', 1, '', '', 'Nadia.Claris@gmail.com', '977441401283', 'Visitor', 1, 1, 1, 0, '977441401283.png', 'Singapore-International-Jewelry-Expo-2019_977441401283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(292, 12, 83, 'Ms', 'Barbie', 'Criselda', 'Barbie Criselda Pte Ltd', '10 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '93093512', 1, '', '', 'Barbie.Criselda@gmail.com', '341511731283', 'Visitor', 1, 1, 1, 0, '341511731283.png', 'Singapore-International-Jewelry-Expo-2019_341511731283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(293, 12, 83, 'Dr.', 'Sudie', 'Hoa', 'Sudie Hoa Pte Ltd', '110 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '97879423', 1, '', '', 'Sudie.Hoa@gmail.com', '765368821283', 'Visitor', 1, 1, 1, 0, '765368821283.png', 'Singapore-International-Jewelry-Expo-2019_765368821283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(294, 12, 83, 'Prof', 'Marti', 'Kirk', 'Marti Kirk Pte Ltd', '37 Gul Crescent, 629544, Singapore', 'Female', '', '96030158', 1, '', '', 'Marti.Kirk@gmail.com', '033949041283', 'Visitor', 1, 1, 1, 0, '033949041283.png', 'Singapore-International-Jewelry-Expo-2019_033949041283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(295, 12, 83, 'Mr.', 'Yan', 'Von', 'Yan Von Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '95821921', 1, '', '', 'Yan.Von@gmail.com', '699807201283', 'Visitor', 1, 1, 1, 0, '699807201283.png', 'Singapore-International-Jewelry-Expo-2019_699807201283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(296, 12, 83, 'Mrs.', 'Bruna', 'Karole', 'Bruna Karole Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '98244336', 1, '', '', 'Bruna.Karole@gmail.com', '955854021283', 'Visitor', 1, 1, 1, 0, '955854021283.png', 'Singapore-International-Jewelry-Expo-2019_955854021283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(297, 12, 83, 'Ms', 'Marry', 'Albertina', 'Marry Albertina Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '93159479', 1, '', '', 'Marry.Albertina@gmail.com', '607138201283', 'Visitor', 1, 1, 1, 0, '607138201283.png', 'Singapore-International-Jewelry-Expo-2019_607138201283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(298, 12, 83, 'Dr.', 'Jana', 'Darlena', 'Jana Darlena Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98172955', 1, '', '', 'Jana.Darlena@gmail.com', '632204551283', 'Visitor', 1, 1, 1, 0, '632204551283.png', 'Singapore-International-Jewelry-Expo-2019_632204551283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(299, 12, 83, 'Prof', 'Kiana', 'Antonietta', 'Kiana Antonietta Pte Ltd', '11 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '98140891', 1, '', '', 'Kiana.Antonietta@gmail.com', '916806521283', 'Visitor', 1, 1, 1, 0, '916806521283.png', 'Singapore-International-Jewelry-Expo-2019_916806521283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(300, 12, 83, 'Mr.', 'Tuyet', 'Karri', 'Tuyet Karri Pte Ltd', '111 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '89441381', 1, '', '', 'Tuyet.Karri@gmail.com', '990996881283', 'Visitor', 1, 1, 1, 0, '990996881283.png', 'Singapore-International-Jewelry-Expo-2019_990996881283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(301, 12, 83, 'Mrs.', 'Ronny', 'Michel', 'Ronny Michel Pte Ltd', '38 Gul Crescent, 629544, Singapore', 'Male', '', '94358957', 1, '', '', 'Ronny.Michel@gmail.com', '592284651283', 'Visitor', 1, 1, 1, 0, '592284651283.png', 'Singapore-International-Jewelry-Expo-2019_592284651283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(302, 12, 83, 'Ms', 'Anton', 'Shera', 'Anton Shera Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '97655645', 1, '', '', 'Anton.Shera@gmail.com', '726652991283', 'Visitor', 1, 1, 1, 0, '726652991283.png', 'Singapore-International-Jewelry-Expo-2019_726652991283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(303, 12, 83, 'Dr.', 'Sterling', 'Alease', 'Sterling Alease Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Female', '', '97215691', 1, '', '', 'Sterling.Alease@gmail.com', '348938741283', 'Visitor', 1, 1, 1, 0, '348938741283.png', 'Singapore-International-Jewelry-Expo-2019_348938741283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(304, 12, 83, 'Prof', 'Zenaida', 'Kum', 'Zenaida Kum Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '92525663', 1, '', '', 'Zenaida.Kum@gmail.com', '795576881283', 'Organiser', 1, 1, 1, 0, '795576881283.png', 'Singapore-International-Jewelry-Expo-2019_795576881283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(305, 12, 83, 'Mr.', 'Mikki', 'Markus', 'Mikki Markus Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98084100', 1, '', '', 'Mikki.Markus@gmail.com', '381010991283', 'Organiser', 1, 1, 1, 0, '381010991283.png', 'Singapore-International-Jewelry-Expo-2019_381010991283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(306, 12, 83, 'Mrs.', 'Sixta', 'Ariane', 'Sixta Ariane Pte Ltd', '12 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Female', '', '99352902', 1, '', '', 'Sixta.Ariane@gmail.com', '012130541283', 'Organiser', 1, 1, 1, 0, '012130541283.png', 'Singapore-International-Jewelry-Expo-2019_012130541283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(307, 12, 83, 'Ms', 'Elbert', 'Nakita', 'Elbert Nakita Pte Ltd', '112 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '91476589', 1, '', '', 'Elbert.Nakita@gmail.com', '105657251283', 'Visitor', 1, 1, 1, 0, '105657251283.png', 'Singapore-International-Jewelry-Expo-2019_105657251283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(308, 12, 83, 'Dr.', 'Lavera', 'Douglass', 'Lavera Douglass Pte Ltd', '39 Gul Crescent, 629544, Singapore', 'Male', '', '92382843', 1, '', '', 'Lavera.Douglass@gmail.com', '515813561283', 'Visitor', 1, 1, 1, 0, '515813561283.png', 'Singapore-International-Jewelry-Expo-2019_515813561283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(309, 12, 83, 'Prof', 'Hildegarde', 'Dinorah', 'Hildegarde Dinorah Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Female', '', '90345600', 1, '', '', 'Hildegarde.Dinorah@gmail.com', '835132291283', 'Visitor', 1, 1, 1, 0, '835132291283.png', 'Singapore-International-Jewelry-Expo-2019_835132291283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(310, 12, 83, 'Mr.', 'Kenton', 'Sheryll', 'Kenton Sheryll Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '90787291', 1, '', '', 'Kenton.Sheryll@gmail.com', '245511851283', 'Visitor', 1, 1, 1, 0, '245511851283.png', 'Singapore-International-Jewelry-Expo-2019_245511851283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(311, 12, 83, 'Mrs.', 'Pearly', 'Marjory', 'Pearly Marjory Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '93841256', 1, '', '', 'Pearly.Marjory@gmail.com', '800460451283', 'Visitor', 1, 1, 1, 0, '800460451283.png', 'Singapore-International-Jewelry-Expo-2019_800460451283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(312, 12, 83, 'Ms', 'Solomon', 'Isobel', 'Solomon Isobel Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Female', '', '94383863', 1, '', '', 'Solomon.Isobel@gmail.com', '481524611283', 'Visitor', 1, 1, 1, 0, '481524611283.png', 'Singapore-International-Jewelry-Expo-2019_481524611283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(313, 12, 83, 'Dr.', 'Rafael', 'Sherie', 'Rafael Sherie Pte Ltd', '13 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '89478508', 1, '', '', 'Rafael.Sherie@gmail.com', '685924621283', 'Visitor', 1, 1, 1, 0, '685924621283.png', 'Singapore-International-Jewelry-Expo-2019_685924621283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(314, 12, 83, 'Prof', 'Allen', 'Romona', 'Allen Romona Pte Ltd', '113 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '94812274', 1, '', '', 'Allen.Romona@gmail.com', '729860411283', 'Visitor', 1, 1, 1, 0, '729860411283.png', 'Singapore-International-Jewelry-Expo-2019_729860411283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(315, 12, 83, 'Mr.', 'Rosia', 'Dorthea', 'Rosia Dorthea Pte Ltd', '40 Gul Crescent, 629544, Singapore', 'Female', '', '91600651', 1, '', '', 'Rosia.Dorthea@gmail.com', '927772931283', 'VIP', 1, 1, 1, 0, '927772931283.png', 'Singapore-International-Jewelry-Expo-2019_927772931283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(316, 12, 83, 'Mrs.', 'Lida', 'Mammie', 'Lida Mammie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '92627695', 1, '', '', 'Lida.Mammie@gmail.com', '611728841283', 'VIP', 1, 1, 1, 0, '611728841283.png', 'Singapore-International-Jewelry-Expo-2019_611728841283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(317, 12, 83, 'Ms', 'Eva', 'Arvilla', 'Eva Arvilla Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '99346002', 1, '', '', 'Eva.Arvilla@gmail.com', '818416891283', 'VIP', 1, 1, 1, 0, '818416891283.png', 'Singapore-International-Jewelry-Expo-2019_818416891283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(318, 12, 83, 'Dr.', 'Gloria', 'Yoshiko', 'Gloria Yoshiko Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '98753035', 1, '', '', 'Gloria.Yoshiko@gmail.com', '001233091283', 'VIP', 1, 1, 1, 0, '001233091283.png', 'Singapore-International-Jewelry-Expo-2019_001233091283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(319, 12, 83, 'Prof', 'Kendrick', 'Lin', 'Kendrick Lin Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '99322304', 1, '', '', 'Kendrick.Lin@gmail.com', '681201571283', 'VIP', 1, 1, 1, 0, '681201571283.png', 'Singapore-International-Jewelry-Expo-2019_681201571283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(320, 12, 83, 'Mr.', 'Yuki', 'Jenice', 'Yuki Jenice Pte Ltd', '14 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '99959677', 1, '', '', 'Yuki.Jenice@gmail.com', '212004151283', 'VIP', 1, 1, 1, 0, '212004151283.png', 'Singapore-International-Jewelry-Expo-2019_212004151283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(321, 12, 83, 'Mrs.', 'Mackenzie', 'Dayna', 'Mackenzie Dayna Pte Ltd', '114 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '97424525', 1, '', '', 'Mackenzie.Dayna@gmail.com', '949092591283', 'VIP', 1, 1, 1, 0, '949092591283.png', 'Singapore-International-Jewelry-Expo-2019_949092591283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(322, 12, 83, 'Ms', 'Marissa', 'Junie', 'Marissa Junie Pte Ltd', '41 Gul Crescent, 629544, Singapore', 'Male', '', '89270181', 1, '', '', 'Marissa.Junie@gmail.com', '443520441283', 'VIP', 1, 1, 1, 0, '443520441283.png', 'Singapore-International-Jewelry-Expo-2019_443520441283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(323, 12, 83, 'Dr.', 'Roma', 'Jerrie', 'Roma Jerrie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '93184727', 1, '', '', 'Roma.Jerrie@gmail.com', '735498301283', 'VIP', 1, 1, 1, 0, '735498301283.png', 'Singapore-International-Jewelry-Expo-2019_735498301283.pdf', NULL, '2018-12-11 18:09:24', '2018-12-11 18:10:25'),
(324, 13, 84, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '519938231384', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:10:56', '2018-12-15 01:10:56'),
(325, 13, 84, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '960987501384', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:10:56', '2018-12-15 01:10:56'),
(326, 13, 85, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '791657811385', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:01', '2018-12-15 01:11:01'),
(327, 13, 85, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '064014781385', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:01', '2018-12-15 01:11:01'),
(328, 13, 86, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '973652411386', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:02', '2018-12-15 01:11:02'),
(329, 13, 86, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '675918011386', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:02', '2018-12-15 01:11:02'),
(330, 13, 87, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '402550091387', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:07', '2018-12-15 01:11:07'),
(331, 13, 87, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '206931521387', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:07', '2018-12-15 01:11:07'),
(332, 13, 88, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '303990701388', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:27', '2018-12-15 01:11:27'),
(333, 13, 88, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '705941451388', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:27', '2018-12-15 01:11:27'),
(334, 13, 89, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '734748941389', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:28', '2018-12-15 01:11:28'),
(335, 13, 89, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '161354191389', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:28', '2018-12-15 01:11:28'),
(336, 13, 90, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '842519991390', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:32', '2018-12-15 01:11:32'),
(337, 13, 90, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '320480711390', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:32', '2018-12-15 01:11:32'),
(338, 13, 91, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '365064441391', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:34', '2018-12-15 01:11:34'),
(339, 13, 91, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '117356131391', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:34', '2018-12-15 01:11:34'),
(340, 13, 92, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '441845321392', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:39', '2018-12-15 01:11:39'),
(341, 13, 92, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '707272831392', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:39', '2018-12-15 01:11:39'),
(342, 13, 93, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '364789091393', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:39', '2018-12-15 01:11:39'),
(343, 13, 93, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '018002021393', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:39', '2018-12-15 01:11:39'),
(344, 13, 94, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '556842631394', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:40', '2018-12-15 01:11:40'),
(345, 13, 94, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '815178361394', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:40', '2018-12-15 01:11:40'),
(346, 13, 95, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '206716941395', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:40', '2018-12-15 01:11:40'),
(347, 13, 95, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '506541421395', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:40', '2018-12-15 01:11:40'),
(348, 13, 96, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '645645361396', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:41', '2018-12-15 01:11:41'),
(349, 13, 96, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '326089611396', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:41', '2018-12-15 01:11:41'),
(350, 13, 97, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '840876261397', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:41', '2018-12-15 01:11:41'),
(351, 13, 97, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '876221281397', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:41', '2018-12-15 01:11:41'),
(352, 13, 98, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '337681601398', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:52', '2018-12-15 01:11:52'),
(353, 13, 98, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '459412831398', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:52', '2018-12-15 01:11:52'),
(354, 13, 99, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '118813381399', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:52', '2018-12-15 01:11:52'),
(355, 13, 99, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '441136901399', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:52', '2018-12-15 01:11:52'),
(356, 13, 100, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '262155213100', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:53', '2018-12-15 01:11:53'),
(357, 13, 100, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '959856113100', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:53', '2018-12-15 01:11:53'),
(358, 13, 101, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '149588413101', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:53', '2018-12-15 01:11:53'),
(359, 13, 101, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '909163113101', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:53', '2018-12-15 01:11:53'),
(360, 13, 102, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '801798713102', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:54', '2018-12-15 01:11:54'),
(361, 13, 102, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '641446313102', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:54', '2018-12-15 01:11:54'),
(362, 13, 103, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '127460413103', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:54', '2018-12-15 01:11:54'),
(363, 13, 103, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '121180613103', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:54', '2018-12-15 01:11:54'),
(364, 13, 104, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '790812013104', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:55', '2018-12-15 01:11:55'),
(365, 13, 104, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '671967713104', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:55', '2018-12-15 01:11:55'),
(366, 13, 105, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '734025813105', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:55', '2018-12-15 01:11:55'),
(367, 13, 105, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '184036313105', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:55', '2018-12-15 01:11:55'),
(368, 13, 106, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '254681013106', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:55', '2018-12-15 01:11:55'),
(369, 13, 106, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '603163413106', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:55', '2018-12-15 01:11:55'),
(370, 13, 107, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '664379313107', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:56', '2018-12-15 01:11:56'),
(371, 13, 107, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '027219113107', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:11:56', '2018-12-15 01:11:56'),
(372, 13, 108, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '973441713108', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:05', '2018-12-15 01:12:05'),
(373, 13, 108, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '908119613108', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:05', '2018-12-15 01:12:05'),
(374, 13, 109, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '780742813109', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:06', '2018-12-15 01:12:06'),
(375, 13, 109, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '199077713109', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:06', '2018-12-15 01:12:06'),
(376, 13, 110, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '074278313110', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:06', '2018-12-15 01:12:06'),
(377, 13, 110, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '464468013110', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:06', '2018-12-15 01:12:06'),
(378, 13, 111, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '231861813111', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:06', '2018-12-15 01:12:06'),
(379, 13, 111, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '959329113111', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:06', '2018-12-15 01:12:06'),
(380, 13, 112, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '710770913112', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:07', '2018-12-15 01:12:07'),
(381, 13, 112, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '442522913112', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:07', '2018-12-15 01:12:07'),
(382, 13, 113, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '521914313113', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:07', '2018-12-15 01:12:07'),
(383, 13, 113, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '672217513113', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:07', '2018-12-15 01:12:07'),
(384, 13, 114, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '799894413114', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:08', '2018-12-15 01:12:08'),
(385, 13, 114, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '796447813114', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:08', '2018-12-15 01:12:08'),
(386, 13, 115, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '516905613115', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:09', '2018-12-15 01:12:09'),
(387, 13, 115, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '795969213115', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:09', '2018-12-15 01:12:09'),
(388, 13, 116, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '599638513116', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:11', '2018-12-15 01:12:11'),
(389, 13, 116, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '408399713116', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:11', '2018-12-15 01:12:11'),
(390, 13, 117, 'Mr', 'alvin', 'tan', 'bls', '2gwrb', NULL, NULL, '57923479584', 1, '', '', 'alvinew@icloud.com', '483342413117', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:13', '2018-12-15 01:12:13'),
(391, 13, 117, 'Ms', 'adrian', 't', 'hgjhg', NULL, NULL, NULL, '21252t25', 4, '', '', 'zeteo87@gmail.com', '505846013117', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:12:13', '2018-12-15 01:12:13'),
(392, 12, 118, 'Mr', 'alvin', 'tan', 'hhg', NULL, NULL, '2312521512', '21512541254', 1, '', '', 'alvinew@icloud.com', '427207412118', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-15 01:13:15', '2018-12-15 01:13:15'),
(393, 13, 119, 'Mr.', 'Cyndi', 'Arlena', 'Cyndi Arlena Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '95167077', 1, '', '', 'Cyndi.Arlena@gmail.com', '264028813119', 'Visitor', 1, 1, 1, 0, '264028813119.png', 'ABS-2019_264028813119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(394, 13, 119, 'Mrs.', 'Golden', 'Brandi', 'Golden Brandi Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '98940528', 1, '', '', 'Golden.Brandi@gmail.com', '847326613119', 'Visitor', 1, 1, 1, 0, '847326613119.png', 'ABS-2019_847326613119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(395, 13, 119, 'Ms', 'Jude', 'Lyndsay', 'Jude Lyndsay Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98547857', 1, '', '', 'Jude.Lyndsay@gmail.com', '698585113119', 'Visitor', 1, 1, 1, 0, '698585113119.png', 'ABS-2019_698585113119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(396, 13, 119, 'Dr.', 'Doloris', 'Siobhan', 'Doloris Siobhan Pte Ltd', '8 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '97708117', 1, '', '', 'Doloris.Siobhan@gmail.com', '603753613119', 'Visitor', 1, 1, 1, 0, '603753613119.png', 'ABS-2019_603753613119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(397, 13, 119, 'Prof', 'Glen', 'Ashly', 'Glen Ashly Pte Ltd', '108 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '96744641', 1, '', '', 'Glen.Ashly@gmail.com', '958866513119', 'Visitor', 1, 1, 1, 0, '958866513119.png', 'ABS-2019_958866513119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(398, 13, 119, 'Mr.', 'Lillia', 'Jenniffer', 'Lillia Jenniffer Pte Ltd', '35 Gul Crescent, 629544, Singapore', 'Male', '', '98771508', 1, '', '', 'Lillia.Jenniffer@gmail.com', '440770713119', 'Visitor', 1, 1, 1, 0, '440770713119.png', 'ABS-2019_440770713119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(399, 13, 119, 'Mrs.', 'Denna', 'Stephany', 'Denna Stephany Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '93203051', 1, '', '', 'Denna.Stephany@gmail.com', '320403913119', 'Visitor', 1, 1, 1, 0, '320403913119.png', 'ABS-2019_320403913119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(400, 13, 119, 'Ms', 'Esther', 'Florencia', 'Esther Florencia Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Female', '', '94224847', 1, '', '', 'Esther.Florencia@gmail.com', '411146113119', 'Visitor', 1, 1, 1, 0, '411146113119.png', 'ABS-2019_411146113119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(401, 13, 119, 'Dr.', 'Nguyet', 'Hannelore', 'Nguyet Hannelore Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '90324269', 1, '', '', 'Nguyet.Hannelore@gmail.com', '454017513119', 'Visitor', 1, 1, 1, 0, '454017513119.png', 'ABS-2019_454017513119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(402, 13, 119, 'Prof', 'Elias', 'Deedra', 'Elias Deedra Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '89073452', 1, '', '', 'Elias.Deedra@gmail.com', '875555913119', 'Visitor', 1, 1, 1, 0, '875555913119.png', 'ABS-2019_875555913119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(403, 13, 119, 'Mr.', 'Trevor', 'Fatima', 'Trevor Fatima Pte Ltd', '9 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Female', '', '89600025', 1, '', '', 'Trevor.Fatima@gmail.com', '357092013119', 'Visitor', 1, 1, 1, 0, '357092013119.png', 'ABS-2019_357092013119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(404, 13, 119, 'Mrs.', 'Berneice', 'Melvina', 'Berneice Melvina Pte Ltd', '109 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '99223653', 1, '', '', 'Berneice.Melvina@gmail.com', '500383313119', 'Visitor', 1, 1, 1, 0, '500383313119.png', 'ABS-2019_500383313119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(405, 13, 119, 'Ms', 'Dreama', 'Vincent', 'Dreama Vincent Pte Ltd', '36 Gul Crescent, 629544, Singapore', 'Male', '', '97278857', 1, '', '', 'Dreama.Vincent@gmail.com', '947506713119', 'Visitor', 1, 1, 1, 0, '947506713119.png', 'ABS-2019_947506713119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(406, 13, 119, 'Dr.', 'Rozella', 'Lizzie', 'Rozella Lizzie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Female', '', '99875966', 1, '', '', 'Rozella.Lizzie@gmail.com', '189545113119', 'Visitor', 1, 1, 1, 0, '189545113119.png', 'ABS-2019_189545113119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(407, 13, 119, 'Prof', 'Xiao', 'Mariela', 'Xiao Mariela Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '92648112', 1, '', '', 'Xiao.Mariela@gmail.com', '424758613119', 'Visitor', 1, 1, 1, 0, '424758613119.png', 'ABS-2019_424758613119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(408, 13, 119, 'Mr.', 'Zandra', 'Yan', 'Zandra Yan Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '90962634', 1, '', '', 'Zandra.Yan@gmail.com', '131706013119', 'Visitor', 1, 1, 1, 0, '131706013119.png', 'ABS-2019_131706013119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(409, 13, 119, 'Mrs.', 'Nadia', 'Claris', 'Nadia Claris Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Female', '', '94332539', 1, '', '', 'Nadia.Claris@gmail.com', '861142513119', 'Visitor', 1, 1, 1, 0, '861142513119.png', 'ABS-2019_861142513119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(410, 13, 119, 'Ms', 'Barbie', 'Criselda', 'Barbie Criselda Pte Ltd', '10 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '93093512', 1, '', '', 'Barbie.Criselda@gmail.com', '872580013119', 'Visitor', 1, 1, 1, 0, '872580013119.png', 'ABS-2019_872580013119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(411, 13, 119, 'Dr.', 'Sudie', 'Hoa', 'Sudie Hoa Pte Ltd', '110 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '97879423', 1, '', '', 'Sudie.Hoa@gmail.com', '889416113119', 'Visitor', 1, 1, 1, 0, '889416113119.png', 'ABS-2019_889416113119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(412, 13, 119, 'Prof', 'Marti', 'Kirk', 'Marti Kirk Pte Ltd', '37 Gul Crescent, 629544, Singapore', 'Female', '', '96030158', 1, '', '', 'Marti.Kirk@gmail.com', '401119313119', 'Visitor', 1, 1, 1, 0, '401119313119.png', 'ABS-2019_401119313119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(413, 13, 119, 'Mr.', 'Yan', 'Von', 'Yan Von Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '95821921', 1, '', '', 'Yan.Von@gmail.com', '490198513119', 'Visitor', 1, 1, 1, 0, '490198513119.png', 'ABS-2019_490198513119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(414, 13, 119, 'Mrs.', 'Bruna', 'Karole', 'Bruna Karole Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '98244336', 1, '', '', 'Bruna.Karole@gmail.com', '486762413119', 'Visitor', 1, 1, 1, 0, '486762413119.png', 'ABS-2019_486762413119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(415, 13, 119, 'Ms', 'Marry', 'Albertina', 'Marry Albertina Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '93159479', 1, '', '', 'Marry.Albertina@gmail.com', '216579613119', 'Visitor', 1, 1, 1, 0, '216579613119.png', 'ABS-2019_216579613119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(416, 13, 119, 'Dr.', 'Jana', 'Darlena', 'Jana Darlena Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98172955', 1, '', '', 'Jana.Darlena@gmail.com', '194295813119', 'Visitor', 1, 1, 1, 0, '194295813119.png', 'ABS-2019_194295813119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(417, 13, 119, 'Prof', 'Kiana', 'Antonietta', 'Kiana Antonietta Pte Ltd', '11 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '98140891', 1, '', '', 'Kiana.Antonietta@gmail.com', '959404613119', 'Visitor', 1, 1, 1, 0, '959404613119.png', 'ABS-2019_959404613119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(418, 13, 119, 'Mr.', 'Tuyet', 'Karri', 'Tuyet Karri Pte Ltd', '111 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '89441381', 1, '', '', 'Tuyet.Karri@gmail.com', '060265113119', 'Visitor', 1, 1, 1, 0, '060265113119.png', 'ABS-2019_060265113119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(419, 13, 119, 'Mrs.', 'Ronny', 'Michel', 'Ronny Michel Pte Ltd', '38 Gul Crescent, 629544, Singapore', 'Male', '', '94358957', 1, '', '', 'Ronny.Michel@gmail.com', '301102313119', 'Visitor', 1, 1, 1, 0, '301102313119.png', 'ABS-2019_301102313119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(420, 13, 119, 'Ms', 'Anton', 'Shera', 'Anton Shera Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '97655645', 1, '', '', 'Anton.Shera@gmail.com', '873054013119', 'Visitor', 1, 1, 1, 0, '873054013119.png', 'ABS-2019_873054013119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(421, 13, 119, 'Dr.', 'Sterling', 'Alease', 'Sterling Alease Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Female', '', '97215691', 1, '', '', 'Sterling.Alease@gmail.com', '773570913119', 'Visitor', 1, 1, 1, 0, '773570913119.png', 'ABS-2019_773570913119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(422, 13, 119, 'Prof', 'Zenaida', 'Kum', 'Zenaida Kum Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '92525663', 1, '', '', 'Zenaida.Kum@gmail.com', '858137313119', 'Organiser', 1, 1, 1, 0, '858137313119.png', 'ABS-2019_858137313119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(423, 13, 119, 'Mr.', 'Mikki', 'Markus', 'Mikki Markus Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98084100', 1, '', '', 'Mikki.Markus@gmail.com', '160556613119', 'Organiser', 1, 1, 1, 0, '160556613119.png', 'ABS-2019_160556613119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(424, 13, 119, 'Mrs.', 'Sixta', 'Ariane', 'Sixta Ariane Pte Ltd', '12 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Female', '', '99352902', 1, '', '', 'Sixta.Ariane@gmail.com', '147406113119', 'Organiser', 1, 1, 1, 0, '147406113119.png', 'ABS-2019_147406113119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(425, 13, 119, 'Ms', 'Elbert', 'Nakita', 'Elbert Nakita Pte Ltd', '112 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '91476589', 1, '', '', 'Elbert.Nakita@gmail.com', '747760713119', 'Visitor', 1, 1, 1, 0, '747760713119.png', 'ABS-2019_747760713119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(426, 13, 119, 'Dr.', 'Lavera', 'Douglass', 'Lavera Douglass Pte Ltd', '39 Gul Crescent, 629544, Singapore', 'Male', '', '92382843', 1, '', '', 'Lavera.Douglass@gmail.com', '991171113119', 'Visitor', 1, 1, 1, 0, '991171113119.png', 'ABS-2019_991171113119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(427, 13, 119, 'Prof', 'Hildegarde', 'Dinorah', 'Hildegarde Dinorah Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Female', '', '90345600', 1, '', '', 'Hildegarde.Dinorah@gmail.com', '456684913119', 'Visitor', 1, 1, 1, 0, '456684913119.png', 'ABS-2019_456684913119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(428, 13, 119, 'Mr.', 'Kenton', 'Sheryll', 'Kenton Sheryll Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '90787291', 1, '', '', 'Kenton.Sheryll@gmail.com', '472758113119', 'Visitor', 1, 1, 1, 0, '472758113119.png', 'ABS-2019_472758113119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(429, 13, 119, 'Mrs.', 'Pearly', 'Marjory', 'Pearly Marjory Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '93841256', 1, '', '', 'Pearly.Marjory@gmail.com', '517143213119', 'Visitor', 1, 1, 1, 0, '517143213119.png', 'ABS-2019_517143213119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(430, 13, 119, 'Ms', 'Solomon', 'Isobel', 'Solomon Isobel Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Female', '', '94383863', 1, '', '', 'Solomon.Isobel@gmail.com', '040781213119', 'Visitor', 1, 1, 1, 0, '040781213119.png', 'ABS-2019_040781213119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(431, 13, 119, 'Dr.', 'Rafael', 'Sherie', 'Rafael Sherie Pte Ltd', '13 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '89478508', 1, '', '', 'Rafael.Sherie@gmail.com', '174206013119', 'Visitor', 1, 1, 1, 0, '174206013119.png', 'ABS-2019_174206013119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(432, 13, 119, 'Prof', 'Allen', 'Romona', 'Allen Romona Pte Ltd', '113 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '94812274', 1, '', '', 'Allen.Romona@gmail.com', '760442213119', 'Visitor', 1, 1, 1, 0, '760442213119.png', 'ABS-2019_760442213119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(433, 13, 119, 'Mr.', 'Rosia', 'Dorthea', 'Rosia Dorthea Pte Ltd', '40 Gul Crescent, 629544, Singapore', 'Female', '', '91600651', 1, '', '', 'Rosia.Dorthea@gmail.com', '287197913119', 'VIP', 1, 1, 1, 0, '287197913119.png', 'ABS-2019_287197913119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(434, 13, 119, 'Mrs.', 'Lida', 'Mammie', 'Lida Mammie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '92627695', 1, '', '', 'Lida.Mammie@gmail.com', '836238013119', 'VIP', 1, 1, 1, 0, '836238013119.png', 'ABS-2019_836238013119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(435, 13, 119, 'Ms', 'Eva', 'Arvilla', 'Eva Arvilla Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '99346001', 1, '', '', 'Eva.Arvilla@gmail.com', '883392613119', 'VIP', 1, 1, 1, 0, '883392613119.png', 'ABS-2019_883392613119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(436, 13, 119, 'Dr.', 'Gloria', 'Yoshiko', 'Gloria Yoshiko Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '98753035', 1, '', '', 'Gloria.Yoshiko@gmail.com', '389780313119', 'VIP', 1, 1, 1, 0, '389780313119.png', 'ABS-2019_389780313119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(437, 13, 119, 'Prof', 'Kendrick', 'Lin', 'Kendrick Lin Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '99322304', 1, '', '', 'Kendrick.Lin@gmail.com', '801349313119', 'VIP', 1, 1, 1, 0, '801349313119.png', 'ABS-2019_801349313119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(438, 13, 119, 'Mr.', 'Yuki', 'Jenice', 'Yuki Jenice Pte Ltd', '14 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '99959677', 1, '', '', 'Yuki.Jenice@gmail.com', '496663713119', 'VIP', 1, 1, 1, 0, '496663713119.png', 'ABS-2019_496663713119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(439, 13, 119, 'Mrs.', 'Mackenzie', 'Dayna', 'Mackenzie Dayna Pte Ltd', '114 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '97424525', 1, '', '', 'Mackenzie.Dayna@gmail.com', '424386013119', 'VIP', 1, 1, 1, 0, '424386013119.png', 'ABS-2019_424386013119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(440, 13, 119, 'Ms', 'Marissa', 'Junie', 'Marissa Junie Pte Ltd', '41 Gul Crescent, 629544, Singapore', 'Male', '', '89270181', 1, '', '', 'Marissa.Junie@gmail.com', '116278413119', 'VIP', 1, 1, 1, 0, '116278413119.png', 'ABS-2019_116278413119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(441, 13, 119, 'Dr.', 'Roma', 'Jerrie', 'Roma Jerrie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '93184727', 1, '', '', 'Roma.Jerrie@gmail.com', '561407313119', 'VIP', 1, 1, 1, 0, '561407313119.png', 'ABS-2019_561407313119.pdf', NULL, '2018-12-15 01:15:36', '2018-12-15 01:23:23'),
(442, 13, 120, 'Mr', 'Abc', 'Def', 'Abc', 'Abc', 'Male', 'Abc', '097715', 1, '0980', '021', 'Tanveerqureshee1@gmail.com', '639883213120', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-14 16:29:30', '2018-12-14 16:29:30'),
(443, 13, 121, 'Mr', 'aa', 'bb', 'abc', 'abc', 'Male', 'abc', '0929282', 1, '02', '090', 'tanveerqureshee1@gmail.com', '753695813121', 'visitor', 1, 1, 1, 0, '753695813121.png', 'ABS-2019_753695813121.pdf', NULL, '2018-12-16 02:23:17', '2018-12-16 02:23:17'),
(444, 13, 122, 'Mr', 'aa', 'bb', 'abc', 'abc', 'Male', 'abc', '0929282', 1, '02', '090', 'tanveerqureshee1@gmail.com', '002439813122', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2018-12-16 02:28:46', '2018-12-16 02:28:46');
INSERT INTO `event_business_owners_details` (`id`, `event_id`, `business_owner_id`, `salutation`, `first_name`, `last_name`, `company_name`, `company_address`, `gender`, `designation`, `mobile`, `country_id`, `tel`, `fax`, `email`, `serial_digit`, `namebadge_user_label`, `is_confirmed`, `is_status`, `is_mail_confirmed`, `num_of_mail_sent`, `qrcode_path`, `pdf_path`, `namebadge_printed_date`, `created_at`, `updated_at`) VALUES
(445, 13, 123, 'Mr', 'aa', 'bb', 'abc', 'abc', 'Male', 'abc', '0929282', 1, '02', '090', 'tanveerqureshee1@gmail.com', '232299413123', 'visitor', 1, 1, 1, 0, '232299413123.png', 'ABS 2019.pdf', NULL, '2018-12-16 02:32:32', '2018-12-16 02:32:32'),
(446, 13, 124, 'Ms', 'a', 'v', 'cc', 'cc', 'Female', 'vc', '0928', 1, '09', '2', 'tanveerqureshee1@gmail.com', '117280613124', 'visitor', 1, 1, 1, 0, '117280613124.png', 'ABS 2019.pdf', NULL, '2018-12-16 02:40:10', '2018-12-16 02:40:10'),
(447, 13, 125, 'Mdm', 'c', 'v', 'aaca', 'aca', 'Male', 'fd', '0182', 1, '09', '90', 'tanveerqureshee1@gmail.com', '136028613125', 'visitor', 1, 1, 1, 0, '136028613125.png', 'ABS 2019.pdf', NULL, '2018-12-16 02:41:25', '2018-12-16 02:41:25'),
(448, 13, 126, 'Mr.', 'Cyndi', 'Arlena', 'Cyndi Arlena Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '95167077', 1, '', '', 'tanveerqureshee1@gmail.com', '031221813126', 'Visitor', 1, 1, 1, 0, '031221813126.png', 'ABS-2019_031221813126.pdf', NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:45'),
(449, 13, 126, 'Mrs.', 'Golden', 'Brandi', 'Golden Brandi Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '98940528', 1, '', '', 'Golden.Brandi@gmail.com', '943556713126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(450, 13, 126, 'Ms', 'Jude', 'Lyndsay', 'Jude Lyndsay Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98547857', 1, '', '', 'Jude.Lyndsay@gmail.com', '662569913126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(451, 13, 126, 'Dr.', 'Doloris', 'Siobhan', 'Doloris Siobhan Pte Ltd', '8 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '97708117', 1, '', '', 'Doloris.Siobhan@gmail.com', '658251213126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(452, 13, 126, 'Prof', 'Glen', 'Ashly', 'Glen Ashly Pte Ltd', '108 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '96744641', 1, '', '', 'Glen.Ashly@gmail.com', '787533413126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(453, 13, 126, 'Mr.', 'Lillia', 'Jenniffer', 'Lillia Jenniffer Pte Ltd', '35 Gul Crescent, 629544, Singapore', 'Male', '', '98771508', 1, '', '', 'Lillia.Jenniffer@gmail.com', '187442113126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(454, 13, 126, 'Mrs.', 'Denna', 'Stephany', 'Denna Stephany Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '93203051', 1, '', '', 'Denna.Stephany@gmail.com', '542741613126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(455, 13, 126, 'Ms', 'Esther', 'Florencia', 'Esther Florencia Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Female', '', '94224847', 1, '', '', 'Esther.Florencia@gmail.com', '641100413126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(456, 13, 126, 'Dr.', 'Nguyet', 'Hannelore', 'Nguyet Hannelore Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '90324269', 1, '', '', 'Nguyet.Hannelore@gmail.com', '341379113126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(457, 13, 126, 'Prof', 'Elias', 'Deedra', 'Elias Deedra Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '89073452', 1, '', '', 'Elias.Deedra@gmail.com', '965806113126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(458, 13, 126, 'Mr.', 'Trevor', 'Fatima', 'Trevor Fatima Pte Ltd', '9 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Female', '', '89600025', 1, '', '', 'Trevor.Fatima@gmail.com', '601317113126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(459, 13, 126, 'Mrs.', 'Berneice', 'Melvina', 'Berneice Melvina Pte Ltd', '109 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '99223653', 1, '', '', 'Berneice.Melvina@gmail.com', '364943913126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(460, 13, 126, 'Ms', 'Dreama', 'Vincent', 'Dreama Vincent Pte Ltd', '36 Gul Crescent, 629544, Singapore', 'Male', '', '97278857', 1, '', '', 'Dreama.Vincent@gmail.com', '687117913126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(461, 13, 126, 'Dr.', 'Rozella', 'Lizzie', 'Rozella Lizzie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Female', '', '99875966', 1, '', '', 'Rozella.Lizzie@gmail.com', '707335013126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(462, 13, 126, 'Prof', 'Xiao', 'Mariela', 'Xiao Mariela Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '92648112', 1, '', '', 'Xiao.Mariela@gmail.com', '119946413126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(463, 13, 126, 'Mr.', 'Zandra', 'Yan', 'Zandra Yan Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '90962634', 1, '', '', 'Zandra.Yan@gmail.com', '624205013126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(464, 13, 126, 'Mrs.', 'Nadia', 'Claris', 'Nadia Claris Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Female', '', '94332539', 1, '', '', 'Nadia.Claris@gmail.com', '137956113126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(465, 13, 126, 'Ms', 'Barbie', 'Criselda', 'Barbie Criselda Pte Ltd', '10 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '93093512', 1, '', '', 'Barbie.Criselda@gmail.com', '878787313126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(466, 13, 126, 'Dr.', 'Sudie', 'Hoa', 'Sudie Hoa Pte Ltd', '110 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '97879423', 1, '', '', 'Sudie.Hoa@gmail.com', '117279713126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(467, 13, 126, 'Prof', 'Marti', 'Kirk', 'Marti Kirk Pte Ltd', '37 Gul Crescent, 629544, Singapore', 'Female', '', '96030158', 1, '', '', 'Marti.Kirk@gmail.com', '339639213126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(468, 13, 126, 'Mr.', 'Yan', 'Von', 'Yan Von Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '95821921', 1, '', '', 'Yan.Von@gmail.com', '867718013126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(469, 13, 126, 'Mrs.', 'Bruna', 'Karole', 'Bruna Karole Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '98244336', 1, '', '', 'Bruna.Karole@gmail.com', '594166113126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(470, 13, 126, 'Ms', 'Marry', 'Albertina', 'Marry Albertina Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '93159479', 1, '', '', 'Marry.Albertina@gmail.com', '179416813126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(471, 13, 126, 'Dr.', 'Jana', 'Darlena', 'Jana Darlena Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98172955', 1, '', '', 'Jana.Darlena@gmail.com', '993140513126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(472, 13, 126, 'Prof', 'Kiana', 'Antonietta', 'Kiana Antonietta Pte Ltd', '11 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '98140891', 1, '', '', 'Kiana.Antonietta@gmail.com', '182761213126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(473, 13, 126, 'Mr.', 'Tuyet', 'Karri', 'Tuyet Karri Pte Ltd', '111 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '89441381', 1, '', '', 'Tuyet.Karri@gmail.com', '106737713126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(474, 13, 126, 'Mrs.', 'Ronny', 'Michel', 'Ronny Michel Pte Ltd', '38 Gul Crescent, 629544, Singapore', 'Male', '', '94358957', 1, '', '', 'Ronny.Michel@gmail.com', '287349413126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(475, 13, 126, 'Ms', 'Anton', 'Shera', 'Anton Shera Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '97655645', 1, '', '', 'Anton.Shera@gmail.com', '469813513126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(476, 13, 126, 'Dr.', 'Sterling', 'Alease', 'Sterling Alease Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Female', '', '97215691', 1, '', '', 'Sterling.Alease@gmail.com', '979222513126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(477, 13, 126, 'Prof', 'Zenaida', 'Kum', 'Zenaida Kum Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '92525663', 1, '', '', 'Zenaida.Kum@gmail.com', '349835113126', 'Organiser', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(478, 13, 126, 'Mr.', 'Mikki', 'Markus', 'Mikki Markus Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98084100', 1, '', '', 'Mikki.Markus@gmail.com', '043146513126', 'Organiser', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(479, 13, 126, 'Mrs.', 'Sixta', 'Ariane', 'Sixta Ariane Pte Ltd', '12 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Female', '', '99352902', 1, '', '', 'Sixta.Ariane@gmail.com', '824597513126', 'Organiser', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(480, 13, 126, 'Ms', 'Elbert', 'Nakita', 'Elbert Nakita Pte Ltd', '112 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '91476589', 1, '', '', 'Elbert.Nakita@gmail.com', '004902013126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(481, 13, 126, 'Dr.', 'Lavera', 'Douglass', 'Lavera Douglass Pte Ltd', '39 Gul Crescent, 629544, Singapore', 'Male', '', '92382843', 1, '', '', 'Lavera.Douglass@gmail.com', '771544013126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(482, 13, 126, 'Prof', 'Hildegarde', 'Dinorah', 'Hildegarde Dinorah Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Female', '', '90345600', 1, '', '', 'Hildegarde.Dinorah@gmail.com', '030107713126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(483, 13, 126, 'Mr.', 'Kenton', 'Sheryll', 'Kenton Sheryll Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '90787291', 1, '', '', 'Kenton.Sheryll@gmail.com', '553543213126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(484, 13, 126, 'Mrs.', 'Pearly', 'Marjory', 'Pearly Marjory Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '93841256', 1, '', '', 'Pearly.Marjory@gmail.com', '670775713126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(485, 13, 126, 'Ms', 'Solomon', 'Isobel', 'Solomon Isobel Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Female', '', '94383863', 1, '', '', 'Solomon.Isobel@gmail.com', '677213913126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(486, 13, 126, 'Dr.', 'Rafael', 'Sherie', 'Rafael Sherie Pte Ltd', '13 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '89478508', 1, '', '', 'Rafael.Sherie@gmail.com', '372607013126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(487, 13, 126, 'Prof', 'Allen', 'Romona', 'Allen Romona Pte Ltd', '113 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '94812274', 1, '', '', 'Allen.Romona@gmail.com', '710180813126', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(488, 13, 126, 'Mr.', 'Rosia', 'Dorthea', 'Rosia Dorthea Pte Ltd', '40 Gul Crescent, 629544, Singapore', 'Female', '', '91600651', 1, '', '', 'Rosia.Dorthea@gmail.com', '837471113126', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(489, 13, 126, 'Mrs.', 'Lida', 'Mammie', 'Lida Mammie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '92627695', 1, '', '', 'Lida.Mammie@gmail.com', '576927613126', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(490, 13, 126, 'Ms', 'Eva', 'Arvilla', 'Eva Arvilla Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '99346002', 1, '', '', 'Eva.Arvilla@gmail.com', '326896313126', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(491, 13, 126, 'Dr.', 'Gloria', 'Yoshiko', 'Gloria Yoshiko Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '98753035', 1, '', '', 'Gloria.Yoshiko@gmail.com', '132009713126', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(492, 13, 126, 'Prof', 'Kendrick', 'Lin', 'Kendrick Lin Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '99322304', 1, '', '', 'Kendrick.Lin@gmail.com', '808200713126', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(493, 13, 126, 'Mr.', 'Yuki', 'Jenice', 'Yuki Jenice Pte Ltd', '14 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '99959677', 1, '', '', 'Yuki.Jenice@gmail.com', '666089013126', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(494, 13, 126, 'Mrs.', 'Mackenzie', 'Dayna', 'Mackenzie Dayna Pte Ltd', '114 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '97424525', 1, '', '', 'Mackenzie.Dayna@gmail.com', '594594313126', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(495, 13, 126, 'Ms', 'Marissa', 'Junie', 'Marissa Junie Pte Ltd', '41 Gul Crescent, 629544, Singapore', 'Male', '', '89270181', 1, '', '', 'Marissa.Junie@gmail.com', '519668313126', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(496, 13, 126, 'Dr.', 'Roma', 'Jerrie', 'Roma Jerrie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '93184727', 1, '', '', 'Roma.Jerrie@gmail.com', '361269913126', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-16 02:42:18', '2018-12-16 02:42:18'),
(497, 13, 127, 'Ms', 'asd', 'asd', 'asdasdasd', NULL, NULL, NULL, '212524512345', 2, '', '', 'zeteo87@gmail.com', '679228913127', 'visitor', 1, 1, 1, 0, '679228913127.png', 'ABS 2019.pdf', NULL, '2018-12-16 22:45:05', '2018-12-16 22:45:05'),
(498, 13, 128, 'Mr.', 'Cyndi', 'Arlena', 'Cyndi Arlena Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '95167077', 1, '', '', 'Cyndi.Arlena@gmail.com', '776384313128', 'Visitor', 1, 1, 1, 0, '776384313128.png', 'ABS-2019_776384313128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(499, 13, 128, 'Mrs.', 'Golden', 'Brandi', 'Golden Brandi Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '98940528', 1, '', '', 'Golden.Brandi@gmail.com', '559360013128', 'Visitor', 1, 1, 1, 0, '559360013128.png', 'ABS-2019_559360013128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(500, 13, 128, 'Ms', 'Jude', 'Lyndsay', 'Jude Lyndsay Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98547857', 1, '', '', 'Jude.Lyndsay@gmail.com', '563430913128', 'Visitor', 1, 1, 1, 0, '563430913128.png', 'ABS-2019_563430913128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(501, 13, 128, 'Dr.', 'Doloris', 'Siobhan', 'Doloris Siobhan Pte Ltd', '8 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '97708117', 1, '', '', 'Doloris.Siobhan@gmail.com', '598165913128', 'Visitor', 1, 1, 1, 0, '598165913128.png', 'ABS-2019_598165913128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(502, 13, 128, 'Prof', 'Glen', 'Ashly', 'Glen Ashly Pte Ltd', '108 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '96744641', 1, '', '', 'Glen.Ashly@gmail.com', '456514013128', 'Visitor', 1, 1, 1, 0, '456514013128.png', 'ABS-2019_456514013128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(503, 13, 128, 'Mr.', 'Lillia', 'Jenniffer', 'Lillia Jenniffer Pte Ltd', '35 Gul Crescent, 629544, Singapore', 'Male', '', '98771508', 1, '', '', 'Lillia.Jenniffer@gmail.com', '033719413128', 'Visitor', 1, 1, 1, 0, '033719413128.png', 'ABS-2019_033719413128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(504, 13, 128, 'Mrs.', 'Denna', 'Stephany', 'Denna Stephany Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '93203051', 1, '', '', 'Denna.Stephany@gmail.com', '482092413128', 'Visitor', 1, 1, 1, 0, '482092413128.png', 'ABS-2019_482092413128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(505, 13, 128, 'Ms', 'Esther', 'Florencia', 'Esther Florencia Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Female', '', '94224847', 1, '', '', 'Esther.Florencia@gmail.com', '419413913128', 'Visitor', 1, 1, 1, 0, '419413913128.png', 'ABS-2019_419413913128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(506, 13, 128, 'Dr.', 'Nguyet', 'Hannelore', 'Nguyet Hannelore Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '90324269', 1, '', '', 'Nguyet.Hannelore@gmail.com', '746366313128', 'Visitor', 1, 1, 1, 0, '746366313128.png', 'ABS-2019_746366313128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(507, 13, 128, 'Prof', 'Elias', 'Deedra', 'Elias Deedra Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '89073452', 1, '', '', 'Elias.Deedra@gmail.com', '406649013128', 'Visitor', 1, 1, 1, 0, '406649013128.png', 'ABS-2019_406649013128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(508, 13, 128, 'Mr.', 'Trevor', 'Fatima', 'Trevor Fatima Pte Ltd', '9 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Female', '', '89600025', 1, '', '', 'Trevor.Fatima@gmail.com', '980019713128', 'Visitor', 1, 1, 1, 0, '980019713128.png', 'ABS-2019_980019713128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(509, 13, 128, 'Mrs.', 'Berneice', 'Melvina', 'Berneice Melvina Pte Ltd', '109 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '99223653', 1, '', '', 'Berneice.Melvina@gmail.com', '351415613128', 'Visitor', 1, 1, 1, 0, '351415613128.png', 'ABS-2019_351415613128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(510, 13, 128, 'Ms', 'Dreama', 'Vincent', 'Dreama Vincent Pte Ltd', '36 Gul Crescent, 629544, Singapore', 'Male', '', '97278857', 1, '', '', 'Dreama.Vincent@gmail.com', '195222013128', 'Visitor', 1, 1, 1, 0, '195222013128.png', 'ABS-2019_195222013128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(511, 13, 128, 'Dr.', 'Rozella', 'Lizzie', 'Rozella Lizzie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Female', '', '99875966', 1, '', '', 'Rozella.Lizzie@gmail.com', '026504713128', 'Visitor', 1, 1, 1, 0, '026504713128.png', 'ABS-2019_026504713128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(512, 13, 128, 'Prof', 'Xiao', 'Mariela', 'Xiao Mariela Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '92648112', 1, '', '', 'Xiao.Mariela@gmail.com', '471387413128', 'Visitor', 1, 1, 1, 0, '471387413128.png', 'ABS-2019_471387413128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(513, 13, 128, 'Mr.', 'Zandra', 'Yan', 'Zandra Yan Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '90962634', 1, '', '', 'Zandra.Yan@gmail.com', '752791013128', 'Visitor', 1, 1, 1, 0, '752791013128.png', 'ABS-2019_752791013128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(514, 13, 128, 'Mrs.', 'Nadia', 'Claris', 'Nadia Claris Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Female', '', '94332539', 1, '', '', 'Nadia.Claris@gmail.com', '824207413128', 'Visitor', 1, 1, 1, 0, '824207413128.png', 'ABS-2019_824207413128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(515, 13, 128, 'Ms', 'Barbie', 'Criselda', 'Barbie Criselda Pte Ltd', '10 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '93093512', 1, '', '', 'Barbie.Criselda@gmail.com', '943386613128', 'Visitor', 1, 1, 1, 0, '943386613128.png', 'ABS-2019_943386613128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(516, 13, 128, 'Dr.', 'Sudie', 'Hoa', 'Sudie Hoa Pte Ltd', '110 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '97879423', 1, '', '', 'Sudie.Hoa@gmail.com', '233057813128', 'Visitor', 1, 1, 1, 0, '233057813128.png', 'ABS-2019_233057813128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(517, 13, 128, 'Prof', 'Marti', 'Kirk', 'Marti Kirk Pte Ltd', '37 Gul Crescent, 629544, Singapore', 'Female', '', '96030158', 1, '', '', 'Marti.Kirk@gmail.com', '389880013128', 'Visitor', 1, 1, 1, 0, '389880013128.png', 'ABS-2019_389880013128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(518, 13, 128, 'Mr.', 'Yan', 'Von', 'Yan Von Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '95821921', 1, '', '', 'Yan.Von@gmail.com', '673848013128', 'Visitor', 1, 1, 1, 0, '673848013128.png', 'ABS-2019_673848013128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(519, 13, 128, 'Mrs.', 'Bruna', 'Karole', 'Bruna Karole Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '98244336', 1, '', '', 'Bruna.Karole@gmail.com', '710930013128', 'Visitor', 1, 1, 1, 0, '710930013128.png', 'ABS-2019_710930013128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(520, 13, 128, 'Ms', 'Marry', 'Albertina', 'Marry Albertina Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '93159479', 1, '', '', 'Marry.Albertina@gmail.com', '173023013128', 'Visitor', 1, 1, 1, 0, '173023013128.png', 'ABS-2019_173023013128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(521, 13, 128, 'Dr.', 'Jana', 'Darlena', 'Jana Darlena Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98172955', 1, '', '', 'Jana.Darlena@gmail.com', '411383813128', 'Visitor', 1, 1, 1, 0, '411383813128.png', 'ABS-2019_411383813128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(522, 13, 128, 'Prof', 'Kiana', 'Antonietta', 'Kiana Antonietta Pte Ltd', '11 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '98140891', 1, '', '', 'Kiana.Antonietta@gmail.com', '787384413128', 'Visitor', 1, 1, 1, 0, '787384413128.png', 'ABS-2019_787384413128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(523, 13, 128, 'Mr.', 'Tuyet', 'Karri', 'Tuyet Karri Pte Ltd', '111 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '89441381', 1, '', '', 'Tuyet.Karri@gmail.com', '808062513128', 'Visitor', 1, 1, 1, 0, '808062513128.png', 'ABS-2019_808062513128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(524, 13, 128, 'Mrs.', 'Ronny', 'Michel', 'Ronny Michel Pte Ltd', '38 Gul Crescent, 629544, Singapore', 'Male', '', '94358957', 1, '', '', 'Ronny.Michel@gmail.com', '382089113128', 'Visitor', 1, 1, 1, 0, '382089113128.png', 'ABS-2019_382089113128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(525, 13, 128, 'Ms', 'Anton', 'Shera', 'Anton Shera Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '97655645', 1, '', '', 'Anton.Shera@gmail.com', '197619613128', 'Visitor', 1, 1, 1, 0, '197619613128.png', 'ABS-2019_197619613128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(526, 13, 128, 'Dr.', 'Sterling', 'Alease', 'Sterling Alease Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Female', '', '97215691', 1, '', '', 'Sterling.Alease@gmail.com', '166038313128', 'Visitor', 1, 1, 1, 0, '166038313128.png', 'ABS-2019_166038313128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(527, 13, 128, 'Prof', 'Zenaida', 'Kum', 'Zenaida Kum Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '92525663', 1, '', '', 'Zenaida.Kum@gmail.com', '706322513128', 'Organiser', 1, 1, 1, 0, '706322513128.png', 'ABS-2019_706322513128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(528, 13, 128, 'Mr.', 'Mikki', 'Markus', 'Mikki Markus Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98084100', 1, '', '', 'Mikki.Markus@gmail.com', '448993513128', 'Organiser', 1, 1, 1, 0, '448993513128.png', 'ABS-2019_448993513128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(529, 13, 128, 'Mrs.', 'Sixta', 'Ariane', 'Sixta Ariane Pte Ltd', '12 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Female', '', '99352902', 1, '', '', 'Sixta.Ariane@gmail.com', '567265213128', 'Organiser', 1, 1, 1, 0, '567265213128.png', 'ABS-2019_567265213128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(530, 13, 128, 'Ms', 'Elbert', 'Nakita', 'Elbert Nakita Pte Ltd', '112 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '91476589', 1, '', '', 'Elbert.Nakita@gmail.com', '399450213128', 'Visitor', 1, 1, 1, 0, '399450213128.png', 'ABS-2019_399450213128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(531, 13, 128, 'Dr.', 'Lavera', 'Douglass', 'Lavera Douglass Pte Ltd', '39 Gul Crescent, 629544, Singapore', 'Male', '', '92382843', 1, '', '', 'Lavera.Douglass@gmail.com', '396229413128', 'Visitor', 1, 1, 1, 0, '396229413128.png', 'ABS-2019_396229413128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(532, 13, 128, 'Prof', 'Hildegarde', 'Dinorah', 'Hildegarde Dinorah Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Female', '', '90345600', 1, '', '', 'Hildegarde.Dinorah@gmail.com', '377881713128', 'Visitor', 1, 1, 1, 0, '377881713128.png', 'ABS-2019_377881713128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(533, 13, 128, 'Mr.', 'Kenton', 'Sheryll', 'Kenton Sheryll Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '90787291', 1, '', '', 'Kenton.Sheryll@gmail.com', '790997513128', 'Visitor', 1, 1, 1, 0, '790997513128.png', 'ABS-2019_790997513128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(534, 13, 128, 'Mrs.', 'Pearly', 'Marjory', 'Pearly Marjory Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '93841256', 1, '', '', 'Pearly.Marjory@gmail.com', '374605213128', 'Visitor', 1, 1, 1, 0, '374605213128.png', 'ABS-2019_374605213128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(535, 13, 128, 'Ms', 'Solomon', 'Isobel', 'Solomon Isobel Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Female', '', '94383863', 1, '', '', 'Solomon.Isobel@gmail.com', '473757113128', 'Visitor', 1, 1, 1, 0, '473757113128.png', 'ABS-2019_473757113128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(536, 13, 128, 'Dr.', 'Rafael', 'Sherie', 'Rafael Sherie Pte Ltd', '13 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '89478508', 1, '', '', 'Rafael.Sherie@gmail.com', '453663813128', 'Visitor', 1, 1, 1, 0, '453663813128.png', 'ABS-2019_453663813128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(537, 13, 128, 'Prof', 'Allen', 'Romona', 'Allen Romona Pte Ltd', '113 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '94812274', 1, '', '', 'Allen.Romona@gmail.com', '807819013128', 'Visitor', 1, 1, 1, 0, '807819013128.png', 'ABS-2019_807819013128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(538, 13, 128, 'Mr.', 'Rosia', 'Dorthea', 'Rosia Dorthea Pte Ltd', '40 Gul Crescent, 629544, Singapore', 'Female', '', '91600651', 1, '', '', 'Rosia.Dorthea@gmail.com', '236808313128', 'VIP', 1, 1, 1, 0, '236808313128.png', 'ABS-2019_236808313128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(539, 13, 128, 'Mrs.', 'Lida', 'Mammie', 'Lida Mammie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '92627695', 1, '', '', 'Lida.Mammie@gmail.com', '389179113128', 'VIP', 1, 1, 1, 0, '389179113128.png', 'ABS-2019_389179113128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(540, 13, 128, 'Ms', 'Eva', 'Arvilla', 'Eva Arvilla Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '99346002', 1, '', '', 'Eva.Arvilla@gmail.com', '394029013128', 'VIP', 1, 1, 1, 0, '394029013128.png', 'ABS-2019_394029013128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(541, 13, 128, 'Dr.', 'Gloria', 'Yoshiko', 'Gloria Yoshiko Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '98753035', 1, '', '', 'Gloria.Yoshiko@gmail.com', '682242913128', 'VIP', 1, 1, 1, 0, '682242913128.png', 'ABS-2019_682242913128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(542, 13, 128, 'Prof', 'Kendrick', 'Lin', 'Kendrick Lin Pte Ltd', 'Crane Resistoflex Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '99322304', 1, '', '', 'Kendrick.Lin@gmail.com', '944783113128', 'VIP', 1, 1, 1, 0, '944783113128.png', 'ABS-2019_944783113128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(543, 13, 128, 'Mr.', 'Yuki', 'Jenice', 'Yuki Jenice Pte Ltd', '14 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '99959677', 1, '', '', 'Yuki.Jenice@gmail.com', '436395813128', 'VIP', 1, 1, 1, 0, '436395813128.png', 'ABS-2019_436395813128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(544, 13, 128, 'Mrs.', 'Mackenzie', 'Dayna', 'Mackenzie Dayna Pte Ltd', '114 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '97424525', 1, '', '', 'Mackenzie.Dayna@gmail.com', '653633113128', 'VIP', 1, 1, 1, 0, '653633113128.png', 'ABS-2019_653633113128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(545, 13, 128, 'Ms', 'Marissa', 'Junie', 'Marissa Junie Pte Ltd', '41 Gul Crescent, 629544, Singapore', 'Male', '', '89270181', 1, '', '', 'Marissa.Junie@gmail.com', '458433813128', 'VIP', 1, 1, 1, 0, '458433813128.png', 'ABS-2019_458433813128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(546, 13, 128, 'Dr.', 'Roma', 'Jerrie', 'Roma Jerrie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '93184727', 1, '', '', 'Roma.Jerrie@gmail.com', '068131513128', 'VIP', 1, 1, 1, 0, '068131513128.png', 'ABS-2019_068131513128.pdf', NULL, '2018-12-18 15:36:40', '2018-12-18 15:37:46'),
(547, 13, 129, 'Mr.', 'Cyndi', 'Arlena', 'Cyndi Arlena Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '95167077', 1, '', '', 'Cyndi.Arlena@gmail.com', '813271613129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(548, 13, 129, 'Mrs.', 'Golden', 'Brandi', 'Golden Brandi Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '98940528', 1, '', '', 'Golden.Brandi@gmail.com', '358904613129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(549, 13, 129, 'Ms', 'Jude', 'Lyndsay', 'Jude Lyndsay Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98547857', 1, '', '', 'Jude.Lyndsay@gmail.com', '321984613129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(550, 13, 129, 'Dr.', 'Doloris', 'Siobhan', 'Doloris Siobhan Pte Ltd', '8 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '97708117', 1, '', '', 'Doloris.Siobhan@gmail.com', '081135313129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(551, 13, 129, 'Prof', 'Glen', 'Ashly', 'Glen Ashly Pte Ltd', '108 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '96744641', 1, '', '', 'Glen.Ashly@gmail.com', '073407613129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(552, 13, 129, 'Mr.', 'Lillia', 'Jenniffer', 'Lillia Jenniffer Pte Ltd', '35 Gul Crescent, 629544, Singapore', 'Male', '', '98771508', 1, '', '', 'Lillia.Jenniffer@gmail.com', '393576313129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(553, 13, 129, 'Mrs.', 'Denna', 'Stephany', 'Denna Stephany Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '93203051', 1, '', '', 'Denna.Stephany@gmail.com', '504893713129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(554, 13, 129, 'Ms', 'Esther', 'Florencia', 'Esther Florencia Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Female', '', '94224847', 1, '', '', 'Esther.Florencia@gmail.com', '059331513129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(555, 13, 129, 'Dr.', 'Nguyet', 'Hannelore', 'Nguyet Hannelore Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '90324269', 1, '', '', 'Nguyet.Hannelore@gmail.com', '421993613129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(556, 13, 129, 'Prof', 'Elias', 'Deedra', 'Elias Deedra Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '89073452', 1, '', '', 'Elias.Deedra@gmail.com', '468568113129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(557, 13, 129, 'Mr.', 'Trevor', 'Fatima', 'Trevor Fatima Pte Ltd', '9 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Female', '', '89600025', 1, '', '', 'Trevor.Fatima@gmail.com', '707006513129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(558, 13, 129, 'Mrs.', 'Berneice', 'Melvina', 'Berneice Melvina Pte Ltd', '109 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '99223653', 1, '', '', 'Berneice.Melvina@gmail.com', '109277013129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(559, 13, 129, 'Ms', 'Dreama', 'Vincent', 'Dreama Vincent Pte Ltd', '36 Gul Crescent, 629544, Singapore', 'Male', '', '97278857', 1, '', '', 'Dreama.Vincent@gmail.com', '151116913129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(560, 13, 129, 'Dr.', 'Rozella', 'Lizzie', 'Rozella Lizzie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Female', '', '99875966', 1, '', '', 'Rozella.Lizzie@gmail.com', '221189013129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(561, 13, 129, 'Prof', 'Xiao', 'Mariela', 'Xiao Mariela Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '92648112', 1, '', '', 'Xiao.Mariela@gmail.com', '693143613129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(562, 13, 129, 'Mr.', 'Zandra', 'Yan', 'Zandra Yan Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '90962634', 1, '', '', 'Zandra.Yan@gmail.com', '045200813129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(563, 13, 129, 'Mrs.', 'Nadia', 'Claris', 'Nadia Claris Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Female', '', '94332539', 1, '', '', 'Nadia.Claris@gmail.com', '962071113129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(564, 13, 129, 'Ms', 'Barbie', 'Criselda', 'Barbie Criselda Pte Ltd', '10 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '93093512', 1, '', '', 'Barbie.Criselda@gmail.com', '648312613129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(565, 13, 129, 'Dr.', 'Sudie', 'Hoa', 'Sudie Hoa Pte Ltd', '110 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '97879423', 1, '', '', 'Sudie.Hoa@gmail.com', '515302113129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(566, 13, 129, 'Prof', 'Marti', 'Kirk', 'Marti Kirk Pte Ltd', '37 Gul Crescent, 629544, Singapore', 'Female', '', '96030158', 1, '', '', 'Marti.Kirk@gmail.com', '011534113129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(567, 13, 129, 'Mr.', 'Yan', 'Von', 'Yan Von Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '95821921', 1, '', '', 'Yan.Von@gmail.com', '075030513129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(568, 13, 129, 'Mrs.', 'Bruna', 'Karole', 'Bruna Karole Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '98244336', 1, '', '', 'Bruna.Karole@gmail.com', '518851913129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(569, 13, 129, 'Ms', 'Marry', 'Albertina', 'Marry Albertina Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '93159479', 1, '', '', 'Marry.Albertina@gmail.com', '467961713129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(570, 13, 129, 'Dr.', 'Jana', 'Darlena', 'Jana Darlena Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98172955', 1, '', '', 'Jana.Darlena@gmail.com', '483009713129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(571, 13, 129, 'Prof', 'Kiana', 'Antonietta', 'Kiana Antonietta Pte Ltd', '11 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '98140891', 1, '', '', 'Kiana.Antonietta@gmail.com', '595729013129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(572, 13, 129, 'Mr.', 'Tuyet', 'Karri', 'Tuyet Karri Pte Ltd', '111 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '89441381', 1, '', '', 'Tuyet.Karri@gmail.com', '658538513129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(573, 13, 129, 'Mrs.', 'Ronny', 'Michel', 'Ronny Michel Pte Ltd', '38 Gul Crescent, 629544, Singapore', 'Male', '', '94358957', 1, '', '', 'Ronny.Michel@gmail.com', '900334013129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(574, 13, 129, 'Ms', 'Anton', 'Shera', 'Anton Shera Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '97655645', 1, '', '', 'Anton.Shera@gmail.com', '378869013129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(575, 13, 129, 'Dr.', 'Sterling', 'Alease', 'Sterling Alease Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Female', '', '97215691', 1, '', '', 'Sterling.Alease@gmail.com', '619801413129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(576, 13, 129, 'Prof', 'Zenaida', 'Kum', 'Zenaida Kum Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '92525663', 1, '', '', 'Zenaida.Kum@gmail.com', '568999713129', 'Organiser', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(577, 13, 129, 'Mr.', 'Mikki', 'Markus', 'Mikki Markus Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '98084100', 1, '', '', 'Mikki.Markus@gmail.com', '292725113129', 'Organiser', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(578, 13, 129, 'Mrs.', 'Sixta', 'Ariane', 'Sixta Ariane Pte Ltd', '12 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Female', '', '99352902', 1, '', '', 'Sixta.Ariane@gmail.com', '663228713129', 'Organiser', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(579, 13, 129, 'Ms', 'Elbert', 'Nakita', 'Elbert Nakita Pte Ltd', '112 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '91476589', 1, '', '', 'Elbert.Nakita@gmail.com', '057353413129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(580, 13, 129, 'Dr.', 'Lavera', 'Douglass', 'Lavera Douglass Pte Ltd', '39 Gul Crescent, 629544, Singapore', 'Male', '', '92382843', 1, '', '', 'Lavera.Douglass@gmail.com', '560565513129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(581, 13, 129, 'Prof', 'Hildegarde', 'Dinorah', 'Hildegarde Dinorah Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Female', '', '90345600', 1, '', '', 'Hildegarde.Dinorah@gmail.com', '448175613129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(582, 13, 129, 'Mr.', 'Kenton', 'Sheryll', 'Kenton Sheryll Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '90787291', 1, '', '', 'Kenton.Sheryll@gmail.com', '952719413129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(583, 13, 129, 'Mrs.', 'Pearly', 'Marjory', 'Pearly Marjory Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Male', '', '93841256', 1, '', '', 'Pearly.Marjory@gmail.com', '120697913129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(584, 13, 129, 'Ms', 'Solomon', 'Isobel', 'Solomon Isobel Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Female', '', '94383863', 1, '', '', 'Solomon.Isobel@gmail.com', '657261313129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(585, 13, 129, 'Dr.', 'Rafael', 'Sherie', 'Rafael Sherie Pte Ltd', '13 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '89478508', 1, '', '', 'Rafael.Sherie@gmail.com', '466798113129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(586, 13, 129, 'Prof', 'Allen', 'Romona', 'Allen Romona Pte Ltd', '113 Gerald Drive #04-38, 799035, Singapore', 'Male', '', '94812274', 1, '', '', 'Allen.Romona@gmail.com', '753648113129', 'Visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(587, 13, 129, 'Mr.', 'Rosia', 'Dorthea', 'Rosia Dorthea Pte Ltd', '40 Gul Crescent, 629544, Singapore', 'Female', '', '91600651', 1, '', '', 'Rosia.Dorthea@gmail.com', '673582413129', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(588, 13, 129, 'Mrs.', 'Lida', 'Mammie', 'Lida Mammie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '92627695', 1, '', '', 'Lida.Mammie@gmail.com', '948580013129', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(589, 13, 129, 'Ms', 'Eva', 'Arvilla', 'Eva Arvilla Pte Ltd', 'Suntec City Mall 3 Temasek Boulevard #01-199 038983, Singapore', 'Male', '', '99346002', 1, '', '', 'Eva.Arvilla@gmail.com', '602832213129', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(590, 13, 129, 'Dr.', 'Gloria', 'Yoshiko', 'Gloria Yoshiko Pte Ltd', 'Suntec Tower Three 8 Temasek Boulevard #23-03 038988, Singapore', 'Female', '', '98753035', 1, '', '', 'Gloria.Yoshiko@gmail.com', '698915313129', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(591, 13, 129, 'Prof', 'Kendrick', 'Lin', 'Kendrick Lin Pte Ltd', 'Crane+Resistoflex+Xomox Pte Ltd 16 Gul Link Singapore 629386, Singapore', 'Male', '', '99322304', 1, '', '', 'Kendrick.Lin@gmail.com', '798873613129', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(592, 13, 129, 'Mr.', 'Yuki', 'Jenice', 'Yuki Jenice Pte Ltd', '14 Temasek Boulevard #40-02 Suntec Tower 3, 038988, Singapore', 'Male', '', '99959677', 1, '', '', 'Yuki.Jenice@gmail.com', '056158813129', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(593, 13, 129, 'Mrs.', 'Mackenzie', 'Dayna', 'Mackenzie Dayna Pte Ltd', '114 Gerald Drive #04-38, 799035, Singapore', 'Female', '', '97424525', 1, '', '', 'Mackenzie.Dayna@gmail.com', '762331213129', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(594, 13, 129, 'Ms', 'Marissa', 'Junie', 'Marissa Junie Pte Ltd', '41 Gul Crescent, 629544, Singapore', 'Male', '', '89270181', 1, '', '', 'Marissa.Junie@gmail.com', '430767613129', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(595, 13, 129, 'Dr.', 'Roma', 'Jerrie', 'Roma Jerrie Pte Ltd', 'United Square 101 Thomson Road #12-01 /#16-01 to #16-02 307591, Singapore', 'Male', '', '93184727', 1, '', '', 'Roma.Jerrie@gmail.com', '852857313129', 'VIP', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-18 15:41:03', '2018-12-18 15:41:03'),
(596, 13, 130, 'Mr', 'glkkjhg', 'kjhglkjhglk', 'kjlkhgkl', NULL, NULL, NULL, '3466242456', 1, '', '', 'asd@asd.com', '310104213130', 'visitor', 1, 1, 1, 0, '310104213130.png', 'ABS 2019.pdf', NULL, '2018-12-18 15:59:41', '2018-12-18 15:59:41'),
(800, 14, 139, 'Mr', 'Debasish', 'Rana', 'Saif Powertech LTD', 'Gulshan 1', 'Male', 'Software Engineer', '1716600843', 1, '', '', 'deb_rana@hotmail.com', '720902414139', 'organizer', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-24 04:17:37', '2018-12-24 04:17:37'),
(801, 14, 139, 'Mdm', 'Andalif', 'Ahmed', 'Dnet', 'Mohammadpur', 'Female', 'Executive Officer', '1676545520', 1, '', '', 'andalif_ahmed@gmail.com', '609939414139', 'visitor', 0, 0, 1, 0, NULL, NULL, NULL, '2018-12-24 04:17:37', '2018-12-24 04:17:37');

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
(13, 5, 'My Profession', '[{\"type\":\"radio-group\",\"label\":\"Role\",\"name\":\"role\",\"values\":[{\"label\":\"CEO\",\"value\":\"option-1\"},{\"label\":\"CFO\",\"value\":\"option-2\"},{\"label\":\"CTO\",\"value\":\"option-3\"}]}]', '2018-10-19 20:05:13', '2018-10-19 20:05:13'),
(14, 6, 'Details', '[{\"type\":\"text\",\"label\":\"Name\",\"className\":\"form-control\",\"name\":\"name\",\"subtype\":\"text\"},{\"type\":\"radio-group\",\"label\":\"Gender\",\"name\":\"radio-group-1540109698834\",\"values\":[{\"label\":\"Male\",\"value\":\"1\",\"selected\":true},{\"label\":\"Female\",\"value\":\"1\"}]}]', '2018-10-20 20:15:58', '2018-10-20 20:15:58'),
(15, 7, 'Profession', '[{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"Please indicate your type of business\",\"name\":\"checkbox-group-1540192031990\",\"values\":[{\"label\":\"Auction House\",\"value\":\"Auction House\"},{\"label\":\"Department Stores\",\"value\":\"\"},{\"label\":\"Engravers\",\"value\":\"\"},{\"label\":\"Exporters / Importer\",\"value\":\"\"}]},{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"Please indicate the purpose of your visit\",\"name\":\"checkbox-group-1540192084022\",\"values\":[{\"label\":\"Evaluate for future participation\",\"value\":\"option-1\",\"selected\":true},{\"label\":\"Gather Information\",\"value\":\"\"}]}]', '2018-10-21 19:10:16', '2018-10-21 19:10:16'),
(16, 8, 'Details', '[{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"Group\",\"name\":\"checkbox-group-1540260998204\",\"values\":[{\"label\":\"PUB\",\"value\":\"option-1\",\"selected\":true},{\"label\":\"MBS\",\"value\":\"\"}]}]', '2018-10-22 14:16:57', '2018-10-22 14:16:57'),
(17, 5, 'Test 123', '[{\"type\":\"select\",\"label\":\"Select\",\"className\":\"form-control\",\"name\":\"select-1540803406765\",\"values\":[{\"label\":\"Option 1\",\"value\":\"option-1\",\"selected\":true},{\"label\":\"Option 2\",\"value\":\"option-2\"},{\"label\":\"Option 3\",\"value\":\"option-3\"}]},{\"type\":\"text\",\"label\":\"Text Field\",\"className\":\"form-control\",\"name\":\"text-1540803419797\",\"subtype\":\"text\"}]', '2018-10-28 20:57:45', '2018-10-28 20:57:45'),
(18, 9, 'Interaction', '[{\"type\":\"checkbox-group\",\"label\":\"Point Of Interest\",\"name\":\"checkbox-group-1540812186641\",\"values\":[{\"label\":\"Interest 1\",\"value\":\"Interest 1\",\"selected\":true},{\"label\":\"Interest 2\",\"value\":\"Interest 2\"}]},{\"type\":\"radio-group\",\"label\":\"Gender\",\"name\":\"radio-group-1540812312252\",\"values\":[{\"label\":\"Male\",\"value\":\"Male\"},{\"label\":\"Female\",\"value\":\"Female\"}]}]', '2018-10-28 23:31:11', '2018-10-28 23:31:11'),
(19, 10, 'your info', '[{\"type\":\"select\",\"label\":\"Country\",\"className\":\"form-control\",\"name\":\"select-1540884928383\",\"values\":[{\"label\":\"A\",\"value\":\"option-1\",\"selected\":true},{\"label\":\"B\",\"value\":\"option-2\"},{\"label\":\"C\",\"value\":\"option-3\"}]}]', '2018-10-29 19:35:42', '2018-10-29 19:35:42'),
(20, 11, 'Product Like', '[{\"type\":\"radio-group\",\"label\":\"Do you like this product?\",\"name\":\"product_like\",\"values\":[{\"label\":\"yes\",\"value\":\"yes\"},{\"label\":\"no\",\"value\":\"no\"},{\"label\":\"medium \",\"value\":\"medium\"}]}]', '2018-12-04 16:45:31', '2018-12-04 16:45:31'),
(21, 11, 'Do you want to contact you?', '[{\"type\":\"radio-group\",\"label\":\"Again contact you?\",\"name\":\"want_to_contact\",\"values\":[{\"label\":\"yes\",\"value\":\"yes\"},{\"label\":\"no\",\"value\":\"no\"}]}]', '2018-12-04 17:18:57', '2018-12-04 17:18:57'),
(22, 12, 'Trade Profile', '[{\"type\":\"checkbox-group\",\"label\":\"Please indicate your type of business\",\"name\":\"checkbox-group-1544342869350\",\"other\":true,\"values\":[{\"label\":\"Auction House\",\"value\":\"Auction House\"},{\"label\":\"Department Stores\",\"value\":\"\"},{\"label\":\"Engraver\",\"value\":\"\"},{\"label\":\"Exporter / Importer\",\"value\":\"\"},{\"label\":\"Galleries\",\"value\":\"\"},{\"label\":\"Gems and Jewelry wholesalers\",\"value\":\"\"},{\"label\":\"Gold and Silversmiths\",\"value\":\"\"}]},{\"type\":\"checkbox-group\",\"label\":\"Please indicate your purpose of visit\",\"name\":\"checkbox-group-1544343035235\",\"other\":true,\"values\":[{\"label\":\"Evaluate for future participation\",\"value\":\"Evaluate for future participation\"},{\"label\":\"Gather Information\",\"value\":\"Gather Information\"},{\"label\":\"Networking\",\"value\":\"Networking\"},{\"label\":\"Purchase / Place Order\",\"value\":\"Purchase / Place Order\"},{\"label\":\"Seek DIstribution Channels\",\"value\":\"Seek DIstribution Channels\"},{\"label\":\"Source for new product(s)\",\"value\":\"Source for new product(s)\"}]},{\"type\":\"radio-group\",\"label\":\"What is the estimated budget of your company to purchase jewelry products?\",\"name\":\"radio-group-1544343184748\",\"values\":[{\"label\":\"< USD 30,000\",\"value\":\"option-1\"},{\"label\":\"USD 30,000 - 100,000\",\"value\":\"option-2\"},{\"label\":\"USD 100,000 - 300,000\",\"value\":\"option-3\"},{\"label\":\"USD 300,000 - 1,000,000\",\"value\":\"\"},{\"label\":\">USD 1,000,000\",\"value\":\"\"}]},{\"type\":\"header\",\"subtype\":\"h3\",\"label\":\"Please indicate your main product interest\"},{\"type\":\"checkbox-group\",\"label\":\"Jewelry\",\"name\":\"checkbox-group-1544343447753\",\"values\":[{\"label\":\"Costume Jewelry\",\"value\":\"option-1\",\"selected\":true},{\"label\":\"Diamond Jewelry\",\"value\":\"\"},{\"label\":\"Gemset Jewelry\",\"value\":\"\"},{\"label\":\"Gold Jewelry\",\"value\":\"\"},{\"label\":\"Pearl Jewelry\",\"value\":\"\"}]},{\"type\":\"select\",\"label\":\"How did you know about us?\",\"className\":\"form-control\",\"name\":\"select-1544343330556\",\"values\":[{\"label\":\"Radio\",\"value\":\"option-1\",\"selected\":true},{\"label\":\"Newspaper\",\"value\":\"option-2\"},{\"label\":\"Other Trade show\",\"value\":\"option-3\"},{\"label\":\"Forums\",\"value\":\"\"}]},{\"type\":\"radio-group\",\"label\":\"Would you like to hear more from us?\",\"name\":\"radio-group-1544343541917\",\"values\":[{\"label\":\"Yes\",\"value\":\"option-1\"},{\"label\":\"No\",\"value\":\"option-2\"}]}]', '2018-12-08 22:19:31', '2018-12-08 22:19:31'),
(23, 13, 'Professionalism', '[{\"type\":\"radio-group\",\"label\":\"Gender\",\"name\":\"Gender\",\"values\":[{\"label\":\"Boy\",\"value\":\"Boy\"},{\"label\":\"Girl\",\"value\":\"Girl\"},{\"label\":\"Option 3\",\"value\":\"option-3\"}]}]', '2018-12-18 15:58:52', '2018-12-18 15:58:52'),
(24, 14, 'Profession', '[{\"type\":\"text\",\"label\":\"Test Text Field\",\"className\":\"form-control\",\"name\":\"test-text-field\",\"subtype\":\"text\"},{\"type\":\"textarea\",\"label\":\"Address\",\"className\":\"form-control\",\"name\":\"address\",\"subtype\":\"textarea\"},{\"type\":\"radio-group\",\"label\":\"Employee type\",\"name\":\"employee-type\",\"other\":true,\"values\":[{\"label\":\"Employee\",\"value\":\"Employee\"},{\"label\":\"Entrepreneurs \",\"value\":\"Entrepreneurs\"}]},{\"type\":\"select\",\"label\":\"Select working place\",\"className\":\"form-control\",\"name\":\"working-place\",\"values\":[{\"label\":\"Country-a\",\"value\":\"Country-a\",\"selected\":true},{\"label\":\"Country-b\",\"value\":\"Country-b\"},{\"label\":\"Country-c\",\"value\":\"Country-c\"}]},{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"Please indicate the exhibition that you are vising\",\"name\":\"Please-indicate-the-exhibition-that-you-are-vising\",\"other\":true,\"values\":[{\"label\":\"ArchXpo 2018\",\"value\":\"ArchXpo 2018\"},{\"label\":\"International Facility Management Expo 2018\",\"value\":\"International Facility Management Expo 2018\"},{\"label\":\"LED+Light Asia 2018\",\"value\":\"LED+Light Asia 2018\"},{\"label\":\"Safety & Security Asia 2018\",\"value\":\"Safety & Security Asia 2018\"},{\"label\":\"Fire & Disaster Asia 2018\",\"value\":\"Fire & Disaster Asia 2018\"},{\"label\":\"Work Safe Asia 2018\",\"value\":\"Work Safe Asia 2018\"}]},{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"Your Profession\",\"name\":\"Your-Profession\",\"other\":true,\"values\":[{\"label\":\"Academic / Researcher\",\"value\":\"Academic / Researcher\"},{\"label\":\"Administration / Human Resource / Finance\",\"value\":\"Administration / Human Resource / Finance\"},{\"label\":\"Architect\",\"value\":\"Architect\"},{\"label\":\"Association / Institution\",\"value\":\"Association / Institution\"},{\"label\":\"Building Manager / Facility Manger\",\"value\":\"Building Manager / Facility Manger\"},{\"label\":\"Building Owner / Developer\",\"value\":\"Building Owner / Developer\"},{\"label\":\"Consultant\",\"value\":\"Consultant\"},{\"label\":\"Contractor\",\"value\":\"Contractor\"},{\"label\":\"Distributor\",\"value\":\"Distributor\"},{\"label\":\"Engineer\",\"value\":\"Engineer\"},{\"label\":\"Government\",\"value\":\"Government\"},{\"label\":\"Hotelier\",\"value\":\"Hotelier\"},{\"label\":\"Interior Designer\",\"value\":\"Interior Designer\"},{\"label\":\"Light Specialist / Lighting Designer / Lighting Consultant\",\"value\":\"Light Specialist / Lighting Designer / Lighting Consultant\"},{\"label\":\"Manufacturer / Product Designer / Supplier\",\"value\":\"Manufacturer / Product Designer / Supplier\"},{\"label\":\"Media\",\"value\":\"Media\"},{\"label\":\"Project Manger\",\"value\":\"Project Manger\"},{\"label\":\"Purchasing / Procurement Manger\",\"value\":\"Puschasing / Procurement Manger\"},{\"label\":\"Quantity Surveyor\",\"value\":\"Quantity Surveyor\"},{\"label\":\"Retailer\",\"value\":\"Retailer\"}]},{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"Please indicate your seniority in this company\",\"name\":\"Please-indicate-your-seniority-in-this-company\",\"other\":true,\"values\":[{\"label\":\"Senior Management\",\"value\":\"option-1\"},{\"label\":\"Middle Management\",\"value\":\"\"},{\"label\":\"Junior Management\",\"value\":\"\"}]},{\"type\":\"checkbox-group\",\"label\":\"Your Companys Nature of Business\",\"name\":\"Your-Companys-Nature-of-Business\",\"values\":[{\"label\":\"Option 1\",\"value\":\"option-1\"}]}]', '2018-12-21 18:59:55', '2018-12-21 18:59:55');

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
(37, 67, 11, 20, 'product_like', 'yes', '2018-12-04 17:40:27', '2018-12-04 17:40:27'),
(38, 67, 11, 21, 'want_to_contact', 'yes', '2018-12-04 17:40:27', '2018-12-04 17:40:27'),
(39, 68, 11, 20, 'product_like', 'medium', '2018-12-04 17:42:23', '2018-12-04 17:42:23'),
(40, 68, 11, 21, 'want_to_contact', 'no', '2018-12-04 17:42:23', '2018-12-04 17:42:23'),
(41, 69, 11, 20, 'product_like', 'no', '2018-12-04 17:47:14', '2018-12-04 17:47:14'),
(42, 69, 11, 21, 'want_to_contact', 'no', '2018-12-04 17:47:14', '2018-12-04 17:47:14'),
(43, 70, 5, 13, 'role', 'CFO', '2018-12-06 16:43:27', '2018-12-06 16:43:27'),
(44, 70, 5, 17, 'select 1540803406765', 'Option 2', '2018-12-06 16:43:27', '2018-12-06 16:43:27'),
(45, 70, 5, 17, 'text 1540803419797', 'test', '2018-12-06 16:43:27', '2018-12-06 16:43:27'),
(46, 71, 12, 22, 'checkbox group 1544342869350', 'Exporter / Importer', '2018-12-08 23:47:53', '2018-12-08 23:47:53'),
(47, 71, 12, 22, 'select 1544343330556', 'Radio', '2018-12-08 23:47:53', '2018-12-08 23:47:53'),
(48, 72, 11, 20, 'product_like', 'yes', '2018-12-09 01:48:58', '2018-12-09 01:48:58'),
(49, 72, 11, 21, 'want_to_contact', 'yes', '2018-12-09 01:48:58', '2018-12-09 01:48:58'),
(50, 73, 11, 20, 'product_like', 'yes', '2018-12-09 01:49:29', '2018-12-09 01:49:29'),
(51, 73, 11, 21, 'want_to_contact', 'yes', '2018-12-09 01:49:29', '2018-12-09 01:49:29'),
(52, 74, 11, 20, 'product_like', 'yes', '2018-12-09 01:50:50', '2018-12-09 01:50:50'),
(53, 74, 11, 21, 'want_to_contact', 'yes', '2018-12-09 01:50:50', '2018-12-09 01:50:50'),
(54, 75, 5, 13, 'role', 'CFO', '2018-12-09 01:53:59', '2018-12-09 01:53:59'),
(55, 75, 5, 17, 'select 1540803406765', 'Option 2', '2018-12-09 01:53:59', '2018-12-09 01:53:59'),
(56, 75, 5, 17, 'text 1540803419797', 'fgg', '2018-12-09 01:53:59', '2018-12-09 01:53:59'),
(57, 77, 12, 22, 'checkbox group 1544342869350', 'Department Stores', '2018-12-10 18:24:58', '2018-12-10 18:24:58'),
(58, 77, 12, 22, 'checkbox group 1544342869350', 'Gems and Jewelry wholesalers', '2018-12-10 18:24:58', '2018-12-10 18:24:58'),
(59, 77, 12, 22, 'checkbox group 1544343035235', 'Source for new product(s)', '2018-12-10 18:24:58', '2018-12-10 18:24:58'),
(60, 77, 12, 22, 'radio group 1544343184748', 'USD 30,000 - 100,000', '2018-12-10 18:24:58', '2018-12-10 18:24:58'),
(61, 77, 12, 22, 'checkbox group 1544343447753', 'Diamond Jewelry', '2018-12-10 18:24:58', '2018-12-10 18:24:58'),
(62, 77, 12, 22, 'select 1544343330556', 'Forums', '2018-12-10 18:24:58', '2018-12-10 18:24:58'),
(63, 77, 12, 22, 'radio group 1544343541917', 'No', '2018-12-10 18:24:58', '2018-12-10 18:24:58'),
(64, 84, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:10:56', '2018-12-15 01:10:56'),
(65, 84, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:10:56', '2018-12-15 01:10:56'),
(66, 85, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:01', '2018-12-15 01:11:01'),
(67, 85, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:01', '2018-12-15 01:11:01'),
(68, 86, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:02', '2018-12-15 01:11:02'),
(69, 86, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:02', '2018-12-15 01:11:02'),
(70, 87, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:07', '2018-12-15 01:11:07'),
(71, 87, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:07', '2018-12-15 01:11:07'),
(72, 88, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:27', '2018-12-15 01:11:27'),
(73, 88, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:27', '2018-12-15 01:11:27'),
(74, 89, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:28', '2018-12-15 01:11:28'),
(75, 89, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:28', '2018-12-15 01:11:28'),
(76, 90, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:32', '2018-12-15 01:11:32'),
(77, 90, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:32', '2018-12-15 01:11:32'),
(78, 91, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:34', '2018-12-15 01:11:34'),
(79, 91, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:34', '2018-12-15 01:11:34'),
(80, 92, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:39', '2018-12-15 01:11:39'),
(81, 92, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:39', '2018-12-15 01:11:39'),
(82, 93, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:39', '2018-12-15 01:11:39'),
(83, 93, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:39', '2018-12-15 01:11:39'),
(84, 94, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:40', '2018-12-15 01:11:40'),
(85, 94, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:40', '2018-12-15 01:11:40'),
(86, 95, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:40', '2018-12-15 01:11:40'),
(87, 95, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:40', '2018-12-15 01:11:40'),
(88, 96, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:41', '2018-12-15 01:11:41'),
(89, 96, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:41', '2018-12-15 01:11:41'),
(90, 97, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:41', '2018-12-15 01:11:41'),
(91, 97, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:41', '2018-12-15 01:11:41'),
(92, 98, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:52', '2018-12-15 01:11:52'),
(93, 98, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:52', '2018-12-15 01:11:52'),
(94, 99, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:52', '2018-12-15 01:11:52'),
(95, 99, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:52', '2018-12-15 01:11:52'),
(96, 100, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:53', '2018-12-15 01:11:53'),
(97, 100, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:53', '2018-12-15 01:11:53'),
(98, 101, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:53', '2018-12-15 01:11:53'),
(99, 101, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:53', '2018-12-15 01:11:53'),
(100, 102, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:54', '2018-12-15 01:11:54'),
(101, 102, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:54', '2018-12-15 01:11:54'),
(102, 103, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:54', '2018-12-15 01:11:54'),
(103, 103, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:54', '2018-12-15 01:11:54'),
(104, 104, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:55', '2018-12-15 01:11:55'),
(105, 104, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:55', '2018-12-15 01:11:55'),
(106, 105, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:55', '2018-12-15 01:11:55'),
(107, 105, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:55', '2018-12-15 01:11:55'),
(108, 106, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:55', '2018-12-15 01:11:55'),
(109, 106, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:55', '2018-12-15 01:11:55'),
(110, 107, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:11:56', '2018-12-15 01:11:56'),
(111, 107, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:11:56', '2018-12-15 01:11:56'),
(112, 108, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:12:05', '2018-12-15 01:12:05'),
(113, 108, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:12:05', '2018-12-15 01:12:05'),
(114, 109, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:12:06', '2018-12-15 01:12:06'),
(115, 109, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:12:06', '2018-12-15 01:12:06'),
(116, 110, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:12:06', '2018-12-15 01:12:06'),
(117, 110, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:12:06', '2018-12-15 01:12:06'),
(118, 111, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:12:06', '2018-12-15 01:12:06'),
(119, 111, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:12:06', '2018-12-15 01:12:06'),
(120, 112, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:12:07', '2018-12-15 01:12:07'),
(121, 112, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:12:07', '2018-12-15 01:12:07'),
(122, 113, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:12:07', '2018-12-15 01:12:07'),
(123, 113, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:12:07', '2018-12-15 01:12:07'),
(124, 114, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:12:08', '2018-12-15 01:12:08'),
(125, 114, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:12:08', '2018-12-15 01:12:08'),
(126, 115, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:12:09', '2018-12-15 01:12:09'),
(127, 115, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:12:09', '2018-12-15 01:12:09'),
(128, 116, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:12:11', '2018-12-15 01:12:11'),
(129, 116, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:12:11', '2018-12-15 01:12:11'),
(130, 117, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-15 01:12:13', '2018-12-15 01:12:13'),
(131, 117, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-15 01:12:13', '2018-12-15 01:12:13'),
(132, 118, 12, 22, 'select 1544343330556', 'Radio', '2018-12-15 01:13:15', '2018-12-15 01:13:15'),
(133, 120, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-14 16:29:30', '2018-12-14 16:29:30'),
(134, 121, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-16 02:23:17', '2018-12-16 02:23:17'),
(135, 122, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-16 02:28:46', '2018-12-16 02:28:46'),
(136, 123, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-16 02:32:32', '2018-12-16 02:32:32'),
(137, 124, 13, 23, 'checkbox group 1544872022797', 'boy', '2018-12-16 02:40:10', '2018-12-16 02:40:10'),
(138, 125, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-16 02:41:25', '2018-12-16 02:41:25'),
(139, 127, 13, 23, 'checkbox group 1544872022797', 'gal', '2018-12-16 22:45:05', '2018-12-16 22:45:05'),
(140, 130, 13, 23, 'Gender', 'Boy', '2018-12-18 15:59:41', '2018-12-18 15:59:41'),
(141, 131, 14, 24, 'test text field', 'Financial controller', '2018-12-21 20:26:16', '2018-12-21 20:26:16'),
(142, 131, 14, 24, 'address', '90 Uxbridge Road\r\nSKIDBY\r\nHU16 8TX', '2018-12-21 20:26:16', '2018-12-21 20:26:16'),
(143, 131, 14, 24, 'employee type', 'on', '2018-12-21 20:26:16', '2018-12-21 20:26:16'),
(144, 131, 14, 24, 'working place', 'Country-a', '2018-12-21 20:26:16', '2018-12-21 20:26:16'),
(145, 131, 14, 24, 'Please indicate the exhibition that you are vising', 'ArchXpo 2018', '2018-12-21 20:26:16', '2018-12-21 20:26:16'),
(146, 131, 14, 24, 'Please indicate the exhibition that you are vising', 'Fire & Disaster Asia 2018', '2018-12-21 20:26:16', '2018-12-21 20:26:16'),
(147, 131, 14, 24, 'Please indicate the exhibition that you are vising', 'Work Safe Asia 2018', '2018-12-21 20:26:16', '2018-12-21 20:26:16'),
(148, 131, 14, 24, 'Your Profession', 'Academic / Researcher', '2018-12-21 20:26:16', '2018-12-21 20:26:16'),
(149, 131, 14, 24, 'Your Profession', 'Contractor', '2018-12-21 20:26:16', '2018-12-21 20:26:16'),
(150, 131, 14, 24, 'Your Profession', 'Manufacturer / Product Designer / Supplier', '2018-12-21 20:26:16', '2018-12-21 20:26:16'),
(151, 131, 14, 24, 'Your Profession', 'Puschasing / Procurement Manger', '2018-12-21 20:26:16', '2018-12-21 20:26:16'),
(152, 131, 14, 24, 'Your Profession', 'Retailer', '2018-12-21 20:26:16', '2018-12-21 20:26:16'),
(153, 131, 14, 24, 'Please indicate your seniority in this company', NULL, '2018-12-21 20:26:16', '2018-12-21 20:26:16'),
(154, 131, 14, 24, 'Your Companys Nature of Business', 'option-1', '2018-12-21 20:26:16', '2018-12-21 20:26:16');

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
-- Table structure for table `namebadge_print_status`
--

CREATE TABLE `namebadge_print_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `namebadge_id` int(10) UNSIGNED DEFAULT NULL,
  `print_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `namebadge_print_status`
--

INSERT INTO `namebadge_print_status` (`id`, `namebadge_id`, `print_date`) VALUES
(9, 62, '2018-12-19 12:20:01'),
(10, 275, '2018-12-19 12:20:29'),
(11, 276, '2018-12-19 12:20:29'),
(12, 277, '2018-12-19 12:20:29'),
(13, 62, '2018-12-19 12:20:46');

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
(3, 6, 'test', '11-25-2018_name_badge_template_0_1543112751.jpg', '2018-11-24 14:25:51', '2018-11-25 18:00:23'),
(4, 6, 'abc update', '11-25-2018_name_badge_template_1_1543112751.jpg', '2018-11-24 14:25:51', '2018-11-25 08:54:01'),
(5, 7, 'test 1', '11-27-2018_name_badge_template_0_1543281552.JPG', '2018-11-26 13:19:12', '2018-11-26 13:19:12'),
(6, 7, 'test 2', '11-29-2018_name_badge_template_0_1543531647.jpg', '2018-11-29 12:47:27', '2018-11-29 12:47:27'),
(8, 9, 'test', '12-10-2018_name_badge_template_0_1544429213.php', '2018-12-09 22:06:53', '2018-12-09 22:06:53'),
(16, 10, '135 x 90 landscape', '12-15-2018_name_badge_template_0_1544859442.jpg', '2018-12-14 21:37:22', '2018-12-14 21:37:22');

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
(6, 5, '8', '5.347', 'portrait', '', 'mm', '2018-11-24 14:25:51', '2018-12-09 22:04:26'),
(7, 11, '75', '105', 'portrait', '11-29-2018_name_badge_template_0_1543531647.jpg', 'mm', '2018-11-26 13:19:12', '2018-11-29 12:56:01'),
(8, 10, '30', '35', NULL, '', 'mm', '2018-12-01 09:54:36', '2018-12-14 21:38:12'),
(9, 9, '500', '500', NULL, '', 'mm', '2018-12-09 22:06:53', '2018-12-09 22:06:53'),
(10, 12, '135', '90', NULL, '12-15-2018_name_badge_template_0_1544859442.jpg', 'mm', '2018-12-10 16:50:20', '2018-12-14 21:38:55');

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
(74, 6, 5, 'serial_digit', '37.25', '64.96875', '1px', '1px', '{\"font_unit\":\"\",\"font_size\":\"9\",\"font_weight\":\"\"}', '2018-11-25 18:02:16', '2018-11-25 18:03:00'),
(75, 6, 5, 'qrcode_path', '219.25', '62.875', '1px', '1px', NULL, '2018-11-25 18:02:16', '2018-11-25 18:02:16'),
(76, 6, 5, 'first_name', '34.25', '100.6875', '', '', '{\"font_unit\":\"\",\"font_size\":\"20\",\"font_weight\":\"bold\"}', '2018-11-25 18:02:16', '2018-11-25 18:04:00'),
(77, 6, 5, 'last_name', '36.25', '136.59375', '', '', NULL, '2018-11-25 18:02:16', '2018-11-25 18:02:16'),
(78, 6, 5, 'company_name', '40.25', '179.5', '', '', NULL, '2018-11-25 18:02:16', '2018-11-25 18:02:16'),
(117, 7, 11, 'first_name', '39.25', '70.875', '', '', '{\"font_color\":\"#000000\",\"font_size\":\"18\",\"font_weight\":\"bold\"}', '2018-12-01 10:42:43', '2018-12-01 10:56:48'),
(118, 7, 11, 'last_name', '194.25', '72.859375', '', '', '{\"font_color\":\"#000000\",\"font_size\":\"18\",\"font_weight\":\"bold\"}', '2018-12-01 10:42:43', '2018-12-01 10:56:59'),
(119, 7, 11, 'company_name', '150.25', '110.828125', '', '', '{\"font_color\":\"#000000\",\"font_size\":\"16\",\"font_weight\":\"bold\"}', '2018-12-01 10:42:43', '2018-12-01 10:57:11'),
(120, 7, 11, 'namebadge_user_label', '135.25', '319.6875', '', '', '{\"font_color\":\"#ff0000\",\"font_size\":\"20\",\"font_weight\":\"bold\"}', '2018-12-01 10:42:43', '2018-12-01 11:08:45'),
(127, 10, 12, 'qrcode_path', '8.25', '114.9375', '1px', '1px', NULL, '2018-12-14 21:38:55', '2018-12-14 21:38:55'),
(128, 10, 12, 'first_name', '177.25', '116.875', '', '', NULL, '2018-12-14 21:38:55', '2018-12-14 21:38:55'),
(129, 10, 12, 'last_name', '174.25', '152.84375', '', '', NULL, '2018-12-14 21:38:55', '2018-12-14 21:38:55'),
(130, 10, 12, 'namebadge_user_label', '154.25', '282.6875', '', '', NULL, '2018-12-14 21:38:55', '2018-12-14 21:38:55'),
(131, 10, 12, 'serial_digit', '22.25', '216.97499084472656', '1px', '1px', NULL, '2018-12-14 21:45:07', '2018-12-14 21:45:07');

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
(153, 0, 11, '8de441f2604bb1eb5517e81ae81f8caf', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-11-09 10:27:02\",\"updated_at\":\"2018-11-09 10:27:02\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"company_name\":\"Dnet\",\"company_address\":\"Dhaka\",\"gender\":\"Male\",\"designation\":\"Software Engineer\",\"mobile\":\"01716600843\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-11-09 10:27:02\",\"updated_at\":\"2018-11-09 10:27:02\"}]}', '2018-11-08 22:27:02', '2018-11-08 22:27:02'),
(154, 20, 11, '8de441f2604bb1eb5517e81ae81f8caf', '{\"text-1541328258607\":\"Good\",\"textarea-1541328262437\":\"Large events\"}', '2018-11-08 22:27:16', '2018-11-08 22:27:16'),
(155, 0, 11, '9dd156cadbe47c3b62b5eb7b512f368b', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-11-09 10:34:43\",\"updated_at\":\"2018-11-09 10:34:43\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Mdm\",\"first_name\":\"Meghna\",\"last_name\":\"Jahan\",\"company_name\":\"Saif Power Tech LTD\",\"company_address\":\"Gulshan\",\"gender\":null,\"designation\":null,\"mobile\":\"01716690909\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2018-11-09 10:34:43\",\"updated_at\":\"2018-11-09 10:34:43\"}]}', '2018-11-08 22:34:43', '2018-11-08 22:34:43'),
(156, 20, 11, '9dd156cadbe47c3b62b5eb7b512f368b', '{\"text-1541328258607\":\"Good\",\"textarea-1541328262437\":\"Big Events\"}', '2018-11-08 22:34:57', '2018-11-08 22:34:57'),
(157, 0, 11, '917a8cce2ae5abb425a08e9d96399a57', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Onsite\",\"created_at\":\"2018-11-09 10:38:37\",\"updated_at\":\"2018-11-09 10:38:37\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Rizveer\",\"last_name\":\"Ahmed\",\"company_name\":\"Biddut\",\"company_address\":\"Dhaka\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"01716161\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-11-09 10:38:37\",\"updated_at\":\"2018-11-09 10:38:37\"}]}', '2018-11-08 22:38:37', '2018-11-08 22:38:37'),
(158, 20, 11, '917a8cce2ae5abb425a08e9d96399a57', '{\"text-1541328258607\":\"Good\",\"textarea-1541328262437\":\"Ok\"}', '2018-11-08 22:38:45', '2018-11-08 22:38:45'),
(159, 0, 11, 'e126dd727d04e7daab59ebc83c8370ec', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-03 03:54:53\",\"updated_at\":\"2018-12-03 03:54:53\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Faisal Ahmed\",\"last_name\":\"Sumon\",\"company_name\":\"Digital Bangla\",\"company_address\":\"Boshundhara\",\"gender\":\"Male\",\"designation\":\"DGM\",\"mobile\":\"01978781\",\"country_id\":\"1\",\"tel\":\"121212\",\"fax\":\"2121\",\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-12-03 03:54:53\",\"updated_at\":\"2018-12-03 03:54:53\"}]}', '2018-12-02 17:54:53', '2018-12-02 17:54:53'),
(160, 20, 11, 'e126dd727d04e7daab59ebc83c8370ec', '{\"text-1541328258607\":\"test\",\"textarea-1541328262437\":\"test\"}', '2018-12-02 17:55:15', '2018-12-02 17:55:15'),
(161, 0, 11, 'b76362e48487fd5311e994eaf7981934', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-05 03:40:06\",\"updated_at\":\"2018-12-05 03:40:06\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"company_name\":\"Saif Power tec LTD\",\"company_address\":\"72 Mohakhali.\",\"gender\":\"Male\",\"designation\":\"Web designer\",\"mobile\":\"01716600843\",\"country_id\":\"1\",\"tel\":\"02918\",\"fax\":\"12345\",\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2018-12-05 03:40:06\",\"updated_at\":\"2018-12-05 03:40:06\"}]}', '2018-12-04 17:40:06', '2018-12-04 17:40:06'),
(162, 20, 11, 'b76362e48487fd5311e994eaf7981934', '{\"product_like\":\"yes\"}', '2018-12-04 17:40:13', '2018-12-04 17:40:13'),
(163, 21, 11, 'b76362e48487fd5311e994eaf7981934', '{\"want_to_contact\":\"yes\"}', '2018-12-04 17:40:17', '2018-12-04 17:40:17'),
(164, 0, 11, 'a11e9e5ac00aaf8527eb623d8f861ee1', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-05 03:42:10\",\"updated_at\":\"2018-12-05 03:42:10\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"Meghna\",\"last_name\":\"Jahan\",\"company_name\":\"Dnet\",\"company_address\":\"Humayon Road\",\"gender\":\"Female\",\"designation\":\"Executive Officer\",\"mobile\":\"0128171709\",\"country_id\":\"2\",\"tel\":\"02134566\",\"fax\":\"0233134\",\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-12-05 03:42:10\",\"updated_at\":\"2018-12-05 03:42:10\"}]}', '2018-12-04 17:42:10', '2018-12-04 17:42:10'),
(165, 20, 11, 'a11e9e5ac00aaf8527eb623d8f861ee1', '{\"product_like\":\"medium\"}', '2018-12-04 17:42:14', '2018-12-04 17:42:14'),
(166, 21, 11, 'a11e9e5ac00aaf8527eb623d8f861ee1', '{\"want_to_contact\":\"no\"}', '2018-12-04 17:42:17', '2018-12-04 17:42:17'),
(167, 0, 11, 'bbf51fd6c9213a6beab436935d1c1303', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Onsite\",\"created_at\":\"2018-12-05 03:46:35\",\"updated_at\":\"2018-12-05 03:46:35\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Dr\",\"first_name\":\"Farad\",\"last_name\":\"Hassan\",\"company_name\":\"Technobd web solution PVT LTD\",\"company_address\":\"Kawran Bazar\",\"gender\":\"Male\",\"designation\":\"Engineer\",\"mobile\":\"029373635\",\"country_id\":\"2\",\"tel\":\"01929291\",\"fax\":\"01929383\",\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-12-05 03:46:35\",\"updated_at\":\"2018-12-05 03:46:35\"}]}', '2018-12-04 17:46:35', '2018-12-04 17:46:35'),
(168, 20, 11, 'bbf51fd6c9213a6beab436935d1c1303', '{\"product_like\":\"no\"}', '2018-12-04 17:46:41', '2018-12-04 17:46:41'),
(169, 21, 11, 'bbf51fd6c9213a6beab436935d1c1303', '{\"want_to_contact\":\"no\"}', '2018-12-04 17:46:44', '2018-12-04 17:46:44'),
(170, 0, 5, '6a01064a1cf1f6c1a1f9f16c6320f3da', '{\"event_business_owners_data\":{\"event_id\":\"5\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-07 02:43:00\",\"updated_at\":\"2018-12-07 02:43:00\"},\"event_business_owners_details\":[{\"event_id\":\"5\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Willium\",\"last_name\":\"Tuitman\",\"company_name\":\"PLIS\",\"company_address\":\"Germany\",\"gender\":\"Male\",\"designation\":\"Team Leader\",\"mobile\":\"09282828\",\"country_id\":\"1\",\"tel\":\"02\",\"fax\":\"02\",\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-12-07 02:43:00\",\"updated_at\":\"2018-12-07 02:43:00\"}]}', '2018-12-06 16:43:00', '2018-12-06 16:43:00'),
(171, 13, 5, '6a01064a1cf1f6c1a1f9f16c6320f3da', '{\"role\":\"CFO\"}', '2018-12-06 16:43:12', '2018-12-06 16:43:12'),
(172, 17, 5, '6a01064a1cf1f6c1a1f9f16c6320f3da', '{\"select-1540803406765\":\"Option 2\",\"text-1540803419797\":\"test\"}', '2018-12-06 16:43:22', '2018-12-06 16:43:22'),
(173, 0, 12, 'fe69da47de2780e8e2fd9e347a496a7a', '{\"event_business_owners_data\":{\"event_id\":\"12\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-09 09:19:39\",\"updated_at\":\"2018-12-09 09:19:39\"},\"event_business_owners_details\":[{\"event_id\":\"12\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Ze\",\"last_name\":\"Teo\",\"company_name\":\"Asd\",\"company_address\":null,\"gender\":\"Male\",\"designation\":null,\"mobile\":\"94747483\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"zeteo87@gmail.com\",\"created_at\":\"2018-12-09 09:19:39\",\"updated_at\":\"2018-12-09 09:19:39\"}]}', '2018-12-08 23:19:39', '2018-12-08 23:19:39'),
(174, 22, 12, 'fe69da47de2780e8e2fd9e347a496a7a', '{\"checkbox-group-1544342869350\":[\"Auction House\",\"Galleries\"],\"checkbox-group-1544343035235\":[\"Purchase \\/ Place Order\",\"Seek DIstribution Channels\"],\"checkbox-group-1544343447753\":[\"Pearl Jewelry\"],\"select-1544343330556\":\"Radio\",\"radio-group-1544343541917\":\"No\"}', '2018-12-08 23:21:40', '2018-12-08 23:21:40'),
(175, 0, 12, '527f8743eb9a86b2310bf7eb3dc6c853', '{\"event_business_owners_data\":{\"event_id\":\"12\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-09 09:26:13\",\"updated_at\":\"2018-12-09 09:26:13\"},\"event_business_owners_details\":[{\"event_id\":\"12\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"ze\",\"last_name\":\"teo\",\"company_name\":\"asd\",\"company_address\":null,\"gender\":null,\"designation\":null,\"mobile\":\"36236\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"zeteo87@gmail.com\",\"created_at\":\"2018-12-09 09:26:13\",\"updated_at\":\"2018-12-09 09:26:13\"}]}', '2018-12-08 23:26:13', '2018-12-08 23:26:13'),
(176, 22, 12, '527f8743eb9a86b2310bf7eb3dc6c853', '{\"checkbox-group-1544342869350\":[\"Galleries\"],\"select-1544343330556\":\"Radio\"}', '2018-12-08 23:26:17', '2018-12-08 23:26:17'),
(177, 0, 12, '159d4440c4a004b65783e683de2ab9d5', '{\"event_business_owners_data\":{\"event_id\":\"12\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-09 09:47:42\",\"updated_at\":\"2018-12-09 09:47:42\"},\"event_business_owners_details\":[{\"event_id\":\"12\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"ze\",\"last_name\":\"teo\",\"company_name\":\"asd\",\"company_address\":null,\"gender\":null,\"designation\":null,\"mobile\":\"3462364\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"zeteo87@gmail.com\",\"created_at\":\"2018-12-09 09:47:42\",\"updated_at\":\"2018-12-09 09:47:42\"}]}', '2018-12-08 23:47:42', '2018-12-08 23:47:42'),
(178, 22, 12, '159d4440c4a004b65783e683de2ab9d5', '{\"checkbox-group-1544342869350\":[\"Exporter \\/ Importer\"],\"select-1544343330556\":\"Radio\"}', '2018-12-08 23:47:47', '2018-12-08 23:47:47'),
(179, 0, 11, 'c4dd4f9ff507396c8b0c3e682e68b342', '{\"event_business_owners_data\":{\"event_id\":\"11\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-09 11:48:41\",\"updated_at\":\"2018-12-09 11:48:41\"},\"event_business_owners_details\":[{\"event_id\":\"11\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"tanveer\",\"last_name\":\"qureshee\",\"company_name\":\"abc\",\"company_address\":\"abc\",\"gender\":\"Male\",\"designation\":\"abc\",\"mobile\":\"09383\",\"country_id\":\"1\",\"tel\":\"092\",\"fax\":\"02\",\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-12-09 11:48:41\",\"updated_at\":\"2018-12-09 11:48:41\"}]}', '2018-12-09 01:48:41', '2018-12-09 01:48:41'),
(180, 20, 11, 'c4dd4f9ff507396c8b0c3e682e68b342', '{\"product_like\":\"yes\"}', '2018-12-09 01:48:46', '2018-12-09 01:48:46'),
(181, 21, 11, 'c4dd4f9ff507396c8b0c3e682e68b342', '{\"want_to_contact\":\"yes\"}', '2018-12-09 01:48:50', '2018-12-09 01:48:50'),
(182, 0, 5, '2b4ab4f627b25096f4163b763b48ba62', '{\"event_business_owners_data\":{\"event_id\":\"5\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-09 11:53:44\",\"updated_at\":\"2018-12-09 11:53:44\"},\"event_business_owners_details\":[{\"event_id\":\"5\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Mamun\",\"last_name\":\"Ur Rashid\",\"company_name\":\"DFY\",\"company_address\":\"ABC\",\"gender\":\"Female\",\"designation\":\"Desiner\",\"mobile\":\"4646\",\"country_id\":\"1\",\"tel\":\"23\",\"fax\":\"4\",\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2018-12-09 11:53:44\",\"updated_at\":\"2018-12-09 11:53:44\"}]}', '2018-12-09 01:53:44', '2018-12-09 01:53:44'),
(183, 13, 5, '2b4ab4f627b25096f4163b763b48ba62', '{\"role\":\"CFO\"}', '2018-12-09 01:53:49', '2018-12-09 01:53:49'),
(184, 17, 5, '2b4ab4f627b25096f4163b763b48ba62', '{\"select-1540803406765\":\"Option 2\",\"text-1540803419797\":\"fgg\"}', '2018-12-09 01:53:54', '2018-12-09 01:53:54'),
(185, 0, 12, '06c72a70b67dc056d2e0d59ee1a5d7ab', '{\"event_business_owners_data\":{\"event_id\":\"12\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-11 04:24:37\",\"updated_at\":\"2018-12-11 04:24:37\"},\"event_business_owners_details\":[{\"event_id\":\"12\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"teo\",\"last_name\":\"zheng eng\",\"company_name\":\"jumppy\",\"company_address\":null,\"gender\":\"Male\",\"designation\":\"Dir\",\"mobile\":\"9876543\",\"country_id\":\"1\",\"tel\":null,\"fax\":\"a\",\"email\":\"adrian_teo@jumppy.com.sg\",\"created_at\":\"2018-12-11 04:24:37\",\"updated_at\":\"2018-12-11 04:24:37\"}]}', '2018-12-10 18:24:37', '2018-12-10 18:24:37'),
(186, 22, 12, '06c72a70b67dc056d2e0d59ee1a5d7ab', '{\"checkbox-group-1544342869350\":[\"Department Stores\",\"Gems and Jewelry wholesalers\"],\"checkbox-group-1544343035235\":[\"Source for new product(s)\"],\"radio-group-1544343184748\":\"USD 30,000 - 100,000\",\"checkbox-group-1544343447753\":[\"Diamond Jewelry\"],\"select-1544343330556\":\"Forums\",\"radio-group-1544343541917\":\"No\"}', '2018-12-10 18:24:50', '2018-12-10 18:24:50'),
(187, 0, 13, 'e020d3384697ea37f7200b4ec99f2a25', '{\"event_business_owners_data\":{\"event_id\":\"13\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"created_at\":\"2018-12-15 11:10:11\",\"updated_at\":\"2018-12-15 11:10:11\"},\"event_business_owners_details\":[{\"event_id\":\"13\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"alvin\",\"last_name\":\"tan\",\"company_name\":\"bls\",\"company_address\":\"2gwrb\",\"gender\":null,\"designation\":null,\"mobile\":\"57923479584\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"alvinew@icloud.com\",\"created_at\":\"2018-12-15 11:10:11\",\"updated_at\":\"2018-12-15 11:10:11\"},{\"event_id\":\"13\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"adrian\",\"last_name\":\"t\",\"company_name\":\"hgjhg\",\"company_address\":null,\"gender\":null,\"designation\":null,\"mobile\":\"21252t25\",\"country_id\":\"4\",\"tel\":null,\"fax\":null,\"email\":\"zeteo87@gmail.com\",\"created_at\":\"2018-12-15 11:10:11\",\"updated_at\":\"2018-12-15 11:10:11\"}]}', '2018-12-15 01:10:11', '2018-12-15 01:10:11'),
(188, 23, 13, 'e020d3384697ea37f7200b4ec99f2a25', '{\"checkbox-group-1544872022797\":[\"gal\",\"boy\"]}', '2018-12-15 01:10:46', '2018-12-15 01:10:46'),
(189, 0, 12, '953486698f7495299663bde860dd7301', '{\"event_business_owners_data\":{\"event_id\":\"12\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-15 11:13:03\",\"updated_at\":\"2018-12-15 11:13:03\"},\"event_business_owners_details\":[{\"event_id\":\"12\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"alvin\",\"last_name\":\"tan\",\"company_name\":\"hhg\",\"company_address\":null,\"gender\":null,\"designation\":\"2312521512\",\"mobile\":\"21512541254\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"alvinew@icloud.com\",\"created_at\":\"2018-12-15 11:13:03\",\"updated_at\":\"2018-12-15 11:13:03\"}]}', '2018-12-15 01:13:03', '2018-12-15 01:13:03'),
(190, 22, 12, '953486698f7495299663bde860dd7301', '{\"select-1544343330556\":\"Radio\"}', '2018-12-15 01:13:10', '2018-12-15 01:13:10'),
(191, 0, 13, 'e8604f0d3233c23524c6f1ab618251c9', '{\"event_business_owners_data\":{\"event_id\":\"13\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-15 02:29:19\",\"updated_at\":\"2018-12-15 02:29:19\"},\"event_business_owners_details\":[{\"event_id\":\"13\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Abc\",\"last_name\":\"Def\",\"company_name\":\"Abc\",\"company_address\":\"Abc\",\"gender\":\"Male\",\"designation\":\"Abc\",\"mobile\":\"097715\",\"country_id\":\"1\",\"tel\":\"0980\",\"fax\":\"021\",\"email\":\"Tanveerqureshee1@gmail.com\",\"created_at\":\"2018-12-15 02:29:19\",\"updated_at\":\"2018-12-15 02:29:19\"}]}', '2018-12-14 16:29:19', '2018-12-14 16:29:19'),
(192, 23, 13, 'e8604f0d3233c23524c6f1ab618251c9', '{\"checkbox-group-1544872022797\":[\"gal\"]}', '2018-12-14 16:29:24', '2018-12-14 16:29:24'),
(193, 0, 13, 'c11f46ba64075d81ab64334d8803e7c3', '{\"event_business_owners_data\":{\"event_id\":\"13\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-16 12:22:56\",\"updated_at\":\"2018-12-16 12:22:56\"},\"event_business_owners_details\":[{\"event_id\":\"13\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"aa\",\"last_name\":\"bb\",\"company_name\":\"abc\",\"company_address\":\"abc\",\"gender\":\"Male\",\"designation\":\"abc\",\"mobile\":\"0929282\",\"country_id\":\"1\",\"tel\":\"02\",\"fax\":\"090\",\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-12-16 12:22:56\",\"updated_at\":\"2018-12-16 12:22:56\"}]}', '2018-12-16 02:22:56', '2018-12-16 02:22:56'),
(194, 23, 13, 'c11f46ba64075d81ab64334d8803e7c3', '{\"checkbox-group-1544872022797\":[\"gal\"]}', '2018-12-16 02:23:08', '2018-12-16 02:23:08'),
(195, 0, 13, '409e52918406e8df5ee7217e4f962028', '{\"event_business_owners_data\":{\"event_id\":\"13\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-16 12:39:56\",\"updated_at\":\"2018-12-16 12:39:56\"},\"event_business_owners_details\":[{\"event_id\":\"13\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"a\",\"last_name\":\"v\",\"company_name\":\"cc\",\"company_address\":\"cc\",\"gender\":\"Female\",\"designation\":\"vc\",\"mobile\":\"0928\",\"country_id\":\"1\",\"tel\":\"09\",\"fax\":\"2\",\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-12-16 12:39:56\",\"updated_at\":\"2018-12-16 12:39:56\"}]}', '2018-12-16 02:39:56', '2018-12-16 02:39:56'),
(196, 23, 13, '409e52918406e8df5ee7217e4f962028', '{\"checkbox-group-1544872022797\":[\"boy\"]}', '2018-12-16 02:40:00', '2018-12-16 02:40:00'),
(197, 0, 13, 'e7bca92247cc82c5c59fc6d1f5f14df8', '{\"event_business_owners_data\":{\"event_id\":\"13\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-16 12:41:09\",\"updated_at\":\"2018-12-16 12:41:09\"},\"event_business_owners_details\":[{\"event_id\":\"13\",\"business_owner_id\":\"\",\"salutation\":\"Mdm\",\"first_name\":\"c\",\"last_name\":\"v\",\"company_name\":\"aaca\",\"company_address\":\"aca\",\"gender\":\"Male\",\"designation\":\"fd\",\"mobile\":\"0182\",\"country_id\":\"1\",\"tel\":\"09\",\"fax\":\"90\",\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-12-16 12:41:09\",\"updated_at\":\"2018-12-16 12:41:09\"}]}', '2018-12-16 02:41:09', '2018-12-16 02:41:09'),
(198, 23, 13, 'e7bca92247cc82c5c59fc6d1f5f14df8', '{\"checkbox-group-1544872022797\":[\"gal\"]}', '2018-12-16 02:41:12', '2018-12-16 02:41:12'),
(199, 0, 13, '882836412bdb7f3129696e657f5d33ab', '{\"event_business_owners_data\":{\"event_id\":\"13\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-17 08:45:00\",\"updated_at\":\"2018-12-17 08:45:00\"},\"event_business_owners_details\":[{\"event_id\":\"13\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"asd\",\"last_name\":\"asd\",\"company_name\":\"asdasdasd\",\"company_address\":null,\"gender\":null,\"designation\":null,\"mobile\":\"212524512345\",\"country_id\":\"2\",\"tel\":null,\"fax\":null,\"email\":\"zeteo87@gmail.com\",\"created_at\":\"2018-12-17 08:45:00\",\"updated_at\":\"2018-12-17 08:45:00\"}]}', '2018-12-16 22:45:00', '2018-12-16 22:45:00'),
(200, 23, 13, '882836412bdb7f3129696e657f5d33ab', '{\"checkbox-group-1544872022797\":[\"gal\"]}', '2018-12-16 22:45:02', '2018-12-16 22:45:02'),
(201, 0, 13, 'a1279dedd0fee5f6381db7e064fb5428', '{\"event_business_owners_data\":{\"event_id\":\"13\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-19 01:59:15\",\"updated_at\":\"2018-12-19 01:59:15\"},\"event_business_owners_details\":[{\"event_id\":\"13\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"glkkjhg\",\"last_name\":\"kjhglkjhglk\",\"company_name\":\"kjlkhgkl\",\"company_address\":null,\"gender\":null,\"designation\":null,\"mobile\":\"3466242456\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"asd@asd.com\",\"created_at\":\"2018-12-19 01:59:15\",\"updated_at\":\"2018-12-19 01:59:15\"}]}', '2018-12-18 15:59:15', '2018-12-18 15:59:15'),
(202, 23, 13, 'a1279dedd0fee5f6381db7e064fb5428', '{\"Gender\":\"Boy\"}', '2018-12-18 15:59:18', '2018-12-18 15:59:18'),
(203, 0, 14, '15cce1184c565d6e232063245d8a12fb', '{\"event_business_owners_data\":{\"event_id\":\"14\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-21 02:32:35\",\"updated_at\":\"2018-12-21 02:32:35\"},\"event_business_owners_details\":[{\"event_id\":\"14\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"asfasdf\",\"last_name\":\"sdgasg\",\"company_name\":\"jlkjh\",\"company_address\":null,\"gender\":null,\"designation\":null,\"mobile\":\"345326364\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"asd@asd.com\",\"created_at\":\"2018-12-21 02:32:35\",\"updated_at\":\"2018-12-21 02:32:35\"}]}', '2018-12-20 16:32:35', '2018-12-20 16:32:35'),
(204, 0, 14, '35062bb7a901f45b8485a257dcf3d933', '{\"event_business_owners_data\":{\"event_id\":\"14\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-21 03:39:15\",\"updated_at\":\"2018-12-21 03:39:15\"},\"event_business_owners_details\":[{\"event_id\":\"14\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"abc\",\"last_name\":\"abc\",\"company_name\":\"av\",\"company_address\":null,\"gender\":\"Male\",\"designation\":null,\"mobile\":\"3525252\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"abc@abc.com\",\"created_at\":\"2018-12-21 03:39:15\",\"updated_at\":\"2018-12-21 03:39:15\"}]}', '2018-12-20 19:39:15', '2018-12-20 19:39:15'),
(205, 0, 14, '4a1580682af6e1712b11d4d08cb57301', '{\"event_business_owners_data\":{\"event_id\":\"14\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-21 08:04:25\",\"updated_at\":\"2018-12-21 08:04:25\"},\"event_business_owners_details\":[{\"event_id\":\"14\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"abc\",\"last_name\":\"abc\",\"company_name\":\"abc\",\"company_address\":null,\"gender\":null,\"designation\":null,\"mobile\":\"122\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"abc@abc.com\",\"created_at\":\"2018-12-21 08:04:25\",\"updated_at\":\"2018-12-21 08:04:25\"}]}', '2018-12-21 00:04:25', '2018-12-21 00:04:25'),
(206, 0, 14, '5299d925a1626f9243dfb0b3b15a8e6e', '{\"event_business_owners_data\":{\"event_id\":\"14\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-21 08:05:52\",\"updated_at\":\"2018-12-21 08:05:52\"},\"event_business_owners_details\":[{\"event_id\":\"14\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"abc\",\"last_name\":\"abc\",\"company_name\":\"abc\",\"company_address\":null,\"gender\":null,\"designation\":null,\"mobile\":\"01919\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"abc@abc.com\",\"created_at\":\"2018-12-21 08:05:52\",\"updated_at\":\"2018-12-21 08:05:52\"}]}', '2018-12-21 00:05:52', '2018-12-21 00:05:52'),
(207, 0, 14, '3eba86264a62cdedad8cdec3984a75ac', '{\"event_business_owners_data\":{\"event_id\":\"14\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-22 01:44:08\",\"updated_at\":\"2018-12-22 01:44:08\"},\"event_business_owners_details\":[{\"event_id\":\"14\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"abc\",\"last_name\":\"abc\",\"company_name\":\"abc\",\"company_address\":\"abc\",\"gender\":null,\"designation\":null,\"mobile\":\"093837\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"abc@abc.com\",\"created_at\":\"2018-12-22 01:44:08\",\"updated_at\":\"2018-12-22 01:44:08\"}]}', '2018-12-21 17:44:08', '2018-12-21 17:44:08'),
(208, 0, 14, '057a1bf6661c5f30a0bcfe97bcd3dd0d', '{\"event_business_owners_data\":{\"event_id\":\"14\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"created_at\":\"2018-12-22 04:23:58\",\"updated_at\":\"2018-12-22 04:23:58\"},\"event_business_owners_details\":[{\"event_id\":\"14\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Maurice\",\"last_name\":\"S. Plummer\",\"company_name\":\"Great Clothes\",\"company_address\":null,\"gender\":\"Male\",\"designation\":null,\"mobile\":\"87888\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2018-12-22 04:23:58\",\"updated_at\":\"2018-12-22 04:23:58\"}]}', '2018-12-21 20:23:58', '2018-12-21 20:23:58'),
(209, 24, 14, '057a1bf6661c5f30a0bcfe97bcd3dd0d', '{\"test-text-field\":\"Financial controller\",\"address\":\"90 Uxbridge Road\\r\\nSKIDBY\\r\\nHU16 8TX\",\"employee-type\":\"on\",\"working-place\":\"Country-a\",\"Please-indicate-the-exhibition-that-you-are-vising\":[\"ArchXpo 2018\",\"Fire & Disaster Asia 2018\",\"Work Safe Asia 2018\"],\"Your-Profession\":[\"Academic \\/ Researcher\",\"Contractor\",\"Manufacturer \\/ Product Designer \\/ Supplier\",\"Puschasing \\/ Procurement Manger\",\"Retailer\"],\"Please-indicate-your-seniority-in-this-company\":[null],\"Your-Companys-Nature-of-Business\":[\"option-1\"]}', '2018-12-21 20:25:40', '2018-12-21 20:25:40');

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
(5, 'namebadge label', 'Visitor,Organiser,vip', 'csv', NULL),
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
-- Indexes for table `cron_job_status`
--
ALTER TABLE `cron_job_status`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `namebadge_print_status`
--
ALTER TABLE `namebadge_print_status`
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
-- AUTO_INCREMENT for table `cron_job_status`
--
ALTER TABLE `cron_job_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `event_business_owners`
--
ALTER TABLE `event_business_owners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `event_business_owners_details`
--
ALTER TABLE `event_business_owners_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=802;

--
-- AUTO_INCREMENT for table `event_forms`
--
ALTER TABLE `event_forms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `event_registeration_form_values`
--
ALTER TABLE `event_registeration_form_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `namebadge_print_status`
--
ALTER TABLE `namebadge_print_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `namebadge_template_details`
--
ALTER TABLE `namebadge_template_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `name_badge_config`
--
ALTER TABLE `name_badge_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `name_badge_position`
--
ALTER TABLE `name_badge_position`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `print_layout_config`
--
ALTER TABLE `print_layout_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registraion_temp`
--
ALTER TABLE `registraion_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

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
