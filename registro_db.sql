--
-- Table structure for table `cron_job_status`
--

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
  `event_header` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template_pdf` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `organizer`, `start_date`, `end_date`, `venue_name`, `venue_address`, `event_url`, `iframe_events_url`, `event_header`, `email_template_pdf`, `created_at`, `updated_at`) VALUES
(15, 'Toy Show 2019', 'Banzai', '2019-02-01', '2019-02-03', 'MBS', '1 MBS Drive', 'Toy-Show-2019', NULL, '01-14-2019_event_template_header_1547448041.png', '01-26-2019_event_template_email_pdf_1548493620.pdf', '2019-01-26 01:07:00', '2019-01-26 01:07:00'),
(16, 'Singapore Show', 'Alvin', '2019-03-01', '2019-03-04', 'SunTec', 'SunTec', 'Singapore-Show', NULL, '01-24-2019_event_template_header_1548309602.jpg', '01-27-2019_event_template_email_pdf_1548578474.pdf', '2019-01-27 00:41:14', '2019-01-27 00:41:14'),
(17, 'XYZ show', 'ABC', '2019-02-01', '2019-02-07', 'MBS', '1 MDS drive', 'XYZ-Show', NULL, '01-27-2019_event_template_header_1548562090.jpg', '01-29-2019_event_template_email_pdf_1548724170.pdf', '2019-01-28 17:09:30', '2019-01-28 17:09:30'),
(18, 'ABS', 'Someone', '2019-02-01', '2019-02-09', 'Expo', 'Expo Drive', 'ABS', NULL, '01-29-2019_event_template_header_1548753723.jpg', '01-29-2019_event_template_email_pdf_1548753723.pdf', '2019-01-29 01:22:03', '2019-01-29 01:22:03');

-- --------------------------------------------------------

--
-- Table structure for table `event_business_owners`
--

CREATE TABLE `event_business_owners` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL COMMENT 'event id from event table',
  `owners_numbers` int(11) NOT NULL COMMENT 'Number of the business owners joined',
  `registration_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_business_owners`
--

INSERT INTO `event_business_owners` (`id`, `event_id`, `owners_numbers`, `registration_type`, `company_name`, `company_address`, `is_status`, `created_at`, `updated_at`) VALUES
(148, 15, 1, 'Online', 'Saif Power tec', 'Mohakhally', 1, '2019-01-13 18:46:30', '2019-01-13 18:46:30'),
(149, 15, 1, 'Online', 'Saif Power tec', 'Mohakhally', 1, '2019-01-13 18:50:04', '2019-01-13 18:50:04'),
(150, 15, 1, 'Online', 'Saif Power tec', 'Mohakhally', 1, '2019-01-13 18:52:00', '2019-01-13 18:52:00'),
(151, 15, 1, 'Online', 'Saif Power tec', 'Mohakhally', 1, '2019-01-13 18:53:15', '2019-01-13 18:53:15'),
(152, 15, 1, 'Online', 'Saif Power tec', 'Mohakhally', 1, '2019-01-13 18:54:27', '2019-01-13 18:54:27'),
(153, 15, 1, 'Online', 'Saif Power tec', 'Mohakhally', 1, '2019-01-13 19:03:09', '2019-01-13 19:03:09'),
(154, 15, 1, 'Online', 'Saif Power tec', 'Mohakhally', 1, '2019-01-13 19:04:48', '2019-01-13 19:04:48'),
(155, 15, 1, 'Online', 'Saif Power tec', 'Mohakhally', 1, '2019-01-13 19:10:28', '2019-01-13 19:10:28'),
(156, 15, 1, 'Online', 'Saif Power tec', 'Mohakhally', 1, '2019-01-13 19:15:28', '2019-01-13 19:15:28'),
(157, 15, 1, 'Online', 'Saif', 'f', 1, '2019-01-13 19:28:28', '2019-01-13 19:28:28'),
(158, 15, 1, 'Online', 'Dnet', 'abc', 1, '2019-01-13 20:11:29', '2019-01-13 20:11:29'),
(159, 15, 1, 'Online', 'Dnet', 'abc', 1, '2019-01-13 20:49:45', '2019-01-13 20:49:45'),
(160, 15, 1, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-13 20:55:52', '2019-01-13 20:55:52'),
(161, 15, 1, 'Online', 'Saif Sporting Club', 'Dhaka', 1, '2019-01-21 02:40:45', '2019-01-21 02:40:45'),
(162, 15, 1, 'Online', 'Dnet', 'Mohamaadpur', 1, '2019-01-21 02:52:34', '2019-01-21 02:52:34'),
(163, 15, 1, 'Online', 'Oxford International School', 'Dhanmondi', 1, '2019-01-21 03:02:23', '2019-01-21 03:02:23'),
(164, 15, 1, 'Online', 'jfkjDGKJ', NULL, 1, '2019-01-21 23:50:44', '2019-01-21 23:50:44'),
(174, 16, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-23 22:21:45', '2019-01-23 22:21:45'),
(175, 16, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-23 22:28:53', '2019-01-23 22:28:53'),
(176, 16, 1, 'Online', 'dd', 'dd', 1, '2019-01-23 22:32:02', '2019-01-23 22:32:02'),
(177, 16, 2, 'Online', 'abc', 'moha', 1, '2019-01-23 22:36:27', '2019-01-23 22:36:27'),
(178, 16, 2, 'Online', 'abc', 'moha', 1, '2019-01-23 22:51:13', '2019-01-23 22:51:13'),
(179, 16, 2, 'Online', 'abc', 'moha', 1, '2019-01-23 23:01:20', '2019-01-23 23:01:20'),
(180, 16, 2, 'Online', 'df', 'vb', 1, '2019-01-23 23:04:31', '2019-01-23 23:04:31'),
(181, 16, 2, 'Online', 'df', 'vb', 1, '2019-01-23 23:11:39', '2019-01-23 23:11:39'),
(182, 16, 2, 'Online', 'df', 'vb', 1, '2019-01-23 23:11:45', '2019-01-23 23:11:45'),
(183, 16, 1, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-23 19:11:00', '2019-01-23 19:11:00'),
(184, 16, 1, 'Online', 'dnet', 'mdpur', 1, '2019-01-23 20:59:10', '2019-01-23 20:59:10'),
(185, 16, 1, 'Online', 'dnet', 'mdpur', 1, '2019-01-23 21:21:47', '2019-01-23 21:21:47'),
(186, 16, 1, 'Online', 'dnet', NULL, 1, '2019-01-23 21:31:03', '2019-01-23 21:31:03'),
(187, 15, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-23 22:40:11', '2019-01-23 22:40:11'),
(188, 15, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-23 22:40:34', '2019-01-23 22:40:34'),
(189, 16, 1, 'Online', 'abc', NULL, 1, '2019-01-23 22:43:31', '2019-01-23 22:43:31'),
(190, 16, 2, 'Online', 'f', NULL, 1, '2019-01-23 22:48:09', '2019-01-23 22:48:09'),
(191, 16, 1, 'Online', 'abc', NULL, 1, '2019-01-24 18:53:33', '2019-01-24 18:53:33'),
(192, 16, 1, 'Online', 'saif', NULL, 1, '2019-01-24 18:57:09', '2019-01-24 18:57:09'),
(193, 16, 2, 'Online', 'Dnet', 'Mohaamdpur', 1, '2019-01-26 04:54:16', '2019-01-26 04:54:16'),
(194, 16, 2, 'Online', 'Dnet', 'Mohaamdpur', 1, '2019-01-26 04:55:37', '2019-01-26 04:55:37'),
(195, 16, 2, 'Online', 'Dnet', 'Mohaamdpur', 1, '2019-01-26 04:59:49', '2019-01-26 04:59:49'),
(196, 16, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-25 17:11:25', '2019-01-25 17:11:25'),
(197, 16, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-25 17:11:35', '2019-01-25 17:11:35'),
(198, 16, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-25 17:14:29', '2019-01-25 17:14:29'),
(199, 16, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-25 17:16:48', '2019-01-25 17:16:48'),
(200, 16, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-25 17:23:23', '2019-01-25 17:23:23'),
(201, 15, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-25 18:30:20', '2019-01-25 18:30:20'),
(202, 15, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-25 18:31:37', '2019-01-25 18:31:37'),
(203, 15, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-25 18:37:07', '2019-01-25 18:37:07'),
(204, 15, 3, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-25 21:08:35', '2019-01-25 21:08:35'),
(205, 16, 2, 'Online', 'Saif Power Tec', 'Mohakhali', 1, '2019-01-25 21:21:52', '2019-01-25 21:21:52'),
(206, 15, 2, 'Online', 'TEST', 'Dhaka', 1, '2019-01-26 00:42:54', '2019-01-26 00:42:54'),
(207, 15, 2, 'Online', 'TEST', 'Dhaka', 1, '2019-01-26 00:43:05', '2019-01-26 00:43:05'),
(208, 15, 2, 'Online', 'TEST', 'Dhaka', 1, '2019-01-26 00:45:15', '2019-01-26 00:45:15'),
(209, 15, 1, 'Online', 'dnet', 'test', 1, '2019-01-26 00:47:39', '2019-01-26 00:47:39'),
(210, 16, 1, 'Online', 'd', 'dd', 1, '2019-01-26 00:50:20', '2019-01-26 00:50:20'),
(211, 16, 1, 'Online', 'd', 'dd', 1, '2019-01-26 00:51:22', '2019-01-26 00:51:22'),
(212, 16, 1, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-26 00:56:29', '2019-01-26 00:56:29'),
(213, 15, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-26 01:04:26', '2019-01-26 01:04:26'),
(214, 15, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-26 01:04:37', '2019-01-26 01:04:37'),
(215, 15, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-26 01:07:05', '2019-01-26 01:07:05'),
(216, 16, 1, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-26 01:12:52', '2019-01-26 01:12:52'),
(228, 16, 2, 'Online', 'dent', 'bgt', 1, '2019-01-27 00:33:37', '2019-01-27 00:33:37'),
(229, 18, 1, 'Online', 'asd', NULL, 1, '2019-02-01 04:26:05', '2019-02-01 04:26:05'),
(230, 18, 2, 'Online', 'jumppypl', NULL, 1, '2019-02-01 04:30:11', '2019-02-01 04:30:11');

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
  `local_state` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `event_business_owners_details` (`id`, `event_id`, `business_owner_id`, `salutation`, `first_name`, `last_name`, `company_name`, `company_address`, `gender`, `designation`, `mobile`, `country_id`, `local_state`, `tel`, `fax`, `email`, `serial_digit`, `namebadge_user_label`, `is_confirmed`, `is_status`, `is_mail_confirmed`, `num_of_mail_sent`, `qrcode_path`, `pdf_path`, `namebadge_printed_date`, `created_at`, `updated_at`) VALUES
(924, 15, 164, 'Mr', 'ASDGASG', 'SDGASDG', NULL, NULL, 'Male', NULL, '45634573547', 1, '', '', '', 'ZETEO87@GMAIL.COM', '157686215164', 'visitor', 1, 1, 1, 0, '157686215164.png', 'Toy Show 2019.pdf', NULL, '2019-01-21 23:50:44', '2019-01-21 23:50:44'),
(1009, 15, 204, 'Dr', 'Rizvee', 'Qureshee r', NULL, NULL, 'Male', NULL, '43', 3, '', '', '', 'mjahanmeghna@gmail.com', '840955015204', 'visitor', 1, 1, 1, 0, '840955015204.png', '15_840955015204.pdf', NULL, '2019-01-25 21:08:35', '2019-01-25 21:08:35'),
(1049, 16, 228, 'Mr', 'bt', 'ct', NULL, NULL, NULL, NULL, '7890', 1, '', '', '', 'tanveeerqureshee1@gmail.com', '798363216228', 'visitor', 1, 1, 1, 0, '798363216228.png', '16_798363216228.pdf', NULL, '2019-01-27 00:33:37', '2019-01-27 00:33:37'),
(1050, 16, 228, 'Ms', 'bu', 'cu', NULL, NULL, NULL, NULL, '56', 2, '', '', '', 'tanveerqureshee@hotmail.com', '789096416228', 'visitor', 1, 1, 1, 0, '789096416228.png', '16_789096416228.pdf', NULL, '2019-01-27 00:33:37', '2019-01-27 00:33:37'),
(1051, 18, 229, 'Mr', 'asd', 'asd', NULL, NULL, 'Female', NULL, '15234532145', 1, '', '', '', 'zeteo87@gmail.com', '470419718229', 'visitor', 1, 1, 1, 0, '470419718229.png', '18_470419718229.pdf', NULL, '2019-02-01 04:26:05', '2019-02-01 04:26:05'),
(1052, 18, 230, 'Mr', 'ze', 'teo', NULL, NULL, NULL, NULL, '8769876', 1, '', '', '', 'adrian_teo@jumppy.com.sg', '219847418230', 'visitor', 1, 1, 1, 0, '219847418230.png', '18_219847418230.pdf', NULL, '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(1053, 18, 230, 'Mr', 'jumppy', 'contact', NULL, NULL, NULL, NULL, '234523152435', 1, '', '', '', 'happy@jumppy.com.sg', '715664318230', 'visitor', 1, 1, 1, 0, '715664318230.png', '18_715664318230.pdf', NULL, '2019-02-01 04:30:11', '2019-02-01 04:30:11');

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
(25, 15, 'Test Dyna Form', '[{\"type\":\"radio-group\",\"label\":\"Which Toys Do You Like Best\",\"name\":\"Which_Toys_Do_You_Like_Best\",\"values\":[{\"label\":\"Car\",\"value\":\"Car\"},{\"label\":\"Truck\",\"value\":\"Truck\"},{\"label\":\"Bus\",\"value\":\"Bus\"}]}]', '2019-01-13 18:38:30', '2019-01-13 18:38:30'),
(26, 16, 'Profession', '[{\"type\":\"header\",\"subtype\":\"h1\",\"label\":\"Visitor Registration Form\"},{\"type\":\"paragraph\",\"subtype\":\"p\",\"label\":\"By submitting this form, you have consented to be on our mailing list and will recive updates related to XYZ from time to time via emails, phone and mail.\"},{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"You are registering to visit OEA\",\"name\":\"You-are-registering-to-visit-OEA\",\"other\":true,\"values\":[{\"label\":\"SGPFair\",\"value\":\"SGPFair\"},{\"label\":\"Print+Pack+Sign\",\"value\":\"Print+Pack+Sign\"}]},{\"type\":\"radio-group\",\"label\":\"Gender\",\"name\":\"Gender\",\"values\":[{\"label\":\"Male\",\"value\":\"Male\"},{\"label\":\"Female\",\"value\":\"Female\"},{\"label\":\"Complicated\",\"value\":\"Complicared\"}]},{\"type\":\"select\",\"required\":true,\"label\":\"What do you like?\",\"className\":\"form-control\",\"name\":\"What-do-you-like\",\"values\":[{\"label\":\"Apple\",\"value\":\"Apple\",\"selected\":true},{\"label\":\"Orange\",\"value\":\"Orange\"},{\"label\":\"Durian\",\"value\":\"Durian\"}]}]', '2019-01-23 22:08:11', '2019-01-23 22:08:11'),
(27, 17, 'profession', '[{\"type\":\"select\",\"required\":true,\"label\":\"sJDflksdjf\",\"className\":\"form-control\",\"name\":\"select-1548562105286\",\"values\":[{\"label\":\"aple\",\"value\":\"apple\",\"selected\":true},{\"label\":\"orange\",\"value\":\"orange\"},{\"label\":\"star\",\"value\":\"star\"}]}]', '2019-01-27 00:39:09', '2019-01-27 00:39:09'),
(28, 18, 'Profession', '[{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"Please indicate the exhibition that you are visiting:\",\"name\":\"Please-indicate-the-exhibition-that-you-are-visiting\",\"values\":[{\"label\":\"ArchXpo 2018\",\"value\":\"ArchXpo 2018\"},{\"label\":\"International Facility Management Expo 2018\",\"value\":\"International Facility Management Expo 2018\"},{\"label\":\"LED+Light Asia 2018\",\"value\":\"LED+Light Asia 2018\"},{\"label\":\"Safety & Security Asia 2018\",\"value\":\"Safety & Security Asia 2018\"}]},{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"Your Profession\",\"name\":\"Your-Profession\",\"other\":true,\"values\":[{\"label\":\"Academic / Researcher\",\"value\":\"Academic / Researcher\",\"selected\":true},{\"label\":\"Administration/Human Resource/Finance\",\"value\":\"Administration/Human Resource/Finance\"},{\"label\":\"Architect\",\"value\":\"Architect\"},{\"label\":\"Association/ Institution\",\"value\":\"Association/ Institution\"},{\"label\":\"Consultant\",\"value\":\"Consultant\"},{\"label\":\"Contractor\",\"value\":\"Contractor\"}]},{\"type\":\"radio-group\",\"required\":true,\"label\":\"Please indicate your seniority in the company\",\"name\":\"Please-indicate-your-seniority-in-the-company\",\"other\":true,\"values\":[{\"label\":\"Senior Management\",\"value\":\"Senior Management\"},{\"label\":\"Middle Management\",\"value\":\"Middle Management\"},{\"label\":\"Junior Management\",\"value\":\"Junior Management\"}]},{\"type\":\"select\",\"required\":true,\"label\":\"Employee in your company\",\"className\":\"form-control\",\"name\":\"Employee-in-your-company\",\"values\":[{\"label\":\"5 - 10\",\"value\":\"5 - 10\",\"selected\":true},{\"label\":\"11 - 50\",\"value\":\"11 - 50\"},{\"label\":\"51 - 100\",\"value\":\"51 - 100\"}]}]', '2019-01-29 17:51:17', '2019-01-29 17:51:17');

-- --------------------------------------------------------

--
-- Table structure for table `event_registeration_form_values`
--

CREATE TABLE `event_registeration_form_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_register_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL COMMENT 'event id',
  `form_id` int(11) DEFAULT NULL COMMENT 'form id',
  `user_email` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Lebel name',
  `label_value` text COLLATE utf8mb4_unicode_ci COMMENT 'Form Data',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_registeration_form_values`
--

INSERT INTO `event_registeration_form_values` (`id`, `user_register_id`, `event_id`, `form_id`, `user_email`, `label_name`, `label_value`, `created_at`, `updated_at`) VALUES
(226, 148, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-13 18:46:30', '2019-01-13 18:46:30'),
(227, 149, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-13 18:50:04', '2019-01-13 18:50:04'),
(228, 150, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-13 18:52:00', '2019-01-13 18:52:00'),
(229, 151, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-13 18:53:15', '2019-01-13 18:53:15'),
(230, 152, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-13 18:54:27', '2019-01-13 18:54:27'),
(231, 153, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-13 19:03:09', '2019-01-13 19:03:09'),
(232, 154, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-13 19:04:48', '2019-01-13 19:04:48'),
(233, 155, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-13 19:10:28', '2019-01-13 19:10:28'),
(234, 156, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-13 19:15:28', '2019-01-13 19:15:28'),
(235, 157, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-13 19:28:28', '2019-01-13 19:28:28'),
(236, 158, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-13 20:11:29', '2019-01-13 20:11:29'),
(237, 159, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-13 20:49:45', '2019-01-13 20:49:45'),
(238, 161, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-21 02:40:45', '2019-01-21 02:40:45'),
(239, 163, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-21 03:02:23', '2019-01-21 03:02:23'),
(240, 164, 15, 25, 'ZETEO87@GMAIL.COM', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-21 23:50:44', '2019-01-21 23:50:44'),
(241, 165, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-22 22:43:40', '2019-01-22 22:43:40'),
(242, 165, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-22 22:43:40', '2019-01-22 22:43:40'),
(243, 165, 16, 26, 'zeteo87@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 22:04:31', '2019-01-23 22:04:31'),
(244, 165, 16, 26, 'zeteo87@gmail.com', 'Gender', 'on', '2019-01-23 22:04:31', '2019-01-23 22:04:31'),
(245, 166, 16, 26, 'zeteo87@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 22:04:38', '2019-01-23 22:04:38'),
(246, 166, 16, 26, 'zeteo87@gmail.com', 'Gender', 'on', '2019-01-23 22:04:38', '2019-01-23 22:04:38'),
(247, 167, 16, 26, 'zeteo87@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 22:04:59', '2019-01-23 22:04:59'),
(248, 167, 16, 26, 'zeteo87@gmail.com', 'Gender', 'on', '2019-01-23 22:04:59', '2019-01-23 22:04:59'),
(249, 168, 16, 26, 'zeteo87@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 22:04:59', '2019-01-23 22:04:59'),
(250, 168, 16, 26, 'zeteo87@gmail.com', 'Gender', 'on', '2019-01-23 22:04:59', '2019-01-23 22:04:59'),
(251, 169, 16, 26, 'zeteo87@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 22:06:58', '2019-01-23 22:06:58'),
(252, 169, 16, 26, 'zeteo87@gmail.com', 'Gender', 'on', '2019-01-23 22:06:58', '2019-01-23 22:06:58'),
(253, 170, 16, 26, 'zeteo87@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 22:06:59', '2019-01-23 22:06:59'),
(254, 170, 16, 26, 'zeteo87@gmail.com', 'Gender', 'on', '2019-01-23 22:06:59', '2019-01-23 22:06:59'),
(255, 171, 16, 26, 'zeteo87@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 22:06:59', '2019-01-23 22:06:59'),
(256, 171, 16, 26, 'zeteo87@gmail.com', 'Gender', 'on', '2019-01-23 22:06:59', '2019-01-23 22:06:59'),
(257, 174, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-23 22:21:45', '2019-01-23 22:21:45'),
(258, 174, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-23 22:21:45', '2019-01-23 22:21:45'),
(259, 174, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-23 22:21:45', '2019-01-23 22:21:45'),
(260, 174, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-23 22:21:45', '2019-01-23 22:21:45'),
(261, 174, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', NULL, '2019-01-23 22:21:45', '2019-01-23 22:21:45'),
(262, 175, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-23 22:28:53', '2019-01-23 22:28:53'),
(263, 175, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-23 22:28:53', '2019-01-23 22:28:53'),
(264, 175, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-23 22:28:53', '2019-01-23 22:28:53'),
(265, 175, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-23 22:28:53', '2019-01-23 22:28:53'),
(266, 175, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', NULL, '2019-01-23 22:28:53', '2019-01-23 22:28:53'),
(267, 176, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-23 22:32:02', '2019-01-23 22:32:02'),
(268, 176, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-23 22:32:02', '2019-01-23 22:32:02'),
(269, 176, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-23 22:32:02', '2019-01-23 22:32:02'),
(270, 177, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 22:36:27', '2019-01-23 22:36:27'),
(271, 177, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-23 22:36:27', '2019-01-23 22:36:27'),
(272, 177, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-23 22:36:27', '2019-01-23 22:36:27'),
(273, 177, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-23 22:36:27', '2019-01-23 22:36:27'),
(274, 177, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-23 22:36:27', '2019-01-23 22:36:27'),
(275, 177, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Orange', '2019-01-23 22:36:27', '2019-01-23 22:36:27'),
(276, 178, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 22:51:13', '2019-01-23 22:51:13'),
(277, 178, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-23 22:51:13', '2019-01-23 22:51:13'),
(278, 178, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-23 22:51:13', '2019-01-23 22:51:13'),
(279, 178, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-23 22:51:13', '2019-01-23 22:51:13'),
(280, 178, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-23 22:51:13', '2019-01-23 22:51:13'),
(281, 178, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Orange', '2019-01-23 22:51:13', '2019-01-23 22:51:13'),
(282, 179, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 23:01:20', '2019-01-23 23:01:20'),
(283, 179, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-23 23:01:20', '2019-01-23 23:01:20'),
(284, 179, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-23 23:01:20', '2019-01-23 23:01:20'),
(285, 179, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-23 23:01:20', '2019-01-23 23:01:20'),
(286, 179, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-23 23:01:20', '2019-01-23 23:01:20'),
(287, 179, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Orange', '2019-01-23 23:01:20', '2019-01-23 23:01:20'),
(288, 180, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-23 23:04:31', '2019-01-23 23:04:31'),
(289, 180, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-23 23:04:31', '2019-01-23 23:04:31'),
(290, 180, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-23 23:04:31', '2019-01-23 23:04:31'),
(291, 180, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 23:04:31', '2019-01-23 23:04:31'),
(292, 180, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-23 23:04:31', '2019-01-23 23:04:31'),
(293, 180, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Orange', '2019-01-23 23:04:31', '2019-01-23 23:04:31'),
(294, 181, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-23 23:11:39', '2019-01-23 23:11:39'),
(295, 181, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-23 23:11:39', '2019-01-23 23:11:39'),
(296, 181, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-23 23:11:39', '2019-01-23 23:11:39'),
(297, 181, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 23:11:39', '2019-01-23 23:11:39'),
(298, 181, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-23 23:11:39', '2019-01-23 23:11:39'),
(299, 181, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Orange', '2019-01-23 23:11:39', '2019-01-23 23:11:39'),
(300, 182, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-23 23:11:45', '2019-01-23 23:11:45'),
(301, 182, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-23 23:11:45', '2019-01-23 23:11:45'),
(302, 182, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-23 23:11:45', '2019-01-23 23:11:45'),
(303, 182, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 23:11:45', '2019-01-23 23:11:45'),
(304, 182, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-23 23:11:45', '2019-01-23 23:11:45'),
(305, 182, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Orange', '2019-01-23 23:11:45', '2019-01-23 23:11:45'),
(306, 183, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-23 19:11:00', '2019-01-23 19:11:00'),
(307, 183, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-23 19:11:00', '2019-01-23 19:11:00'),
(308, 183, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Orange', '2019-01-23 19:11:00', '2019-01-23 19:11:00'),
(309, 183, 16, 26, 'mjahanmeghna@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 19:11:00', '2019-01-23 19:11:00'),
(310, 183, 16, 26, 'mjahanmeghna@gmail.com', 'Gender', 'on', '2019-01-23 19:11:00', '2019-01-23 19:11:00'),
(311, 183, 16, 26, 'mjahanmeghna@gmail.com', 'What do you like', 'Orange', '2019-01-23 19:11:00', '2019-01-23 19:11:00'),
(312, 184, 16, 26, 'mjahanmeghna@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-23 20:59:10', '2019-01-23 20:59:10'),
(313, 184, 16, 26, 'mjahanmeghna@gmail.com', 'Gender', 'on', '2019-01-23 20:59:10', '2019-01-23 20:59:10'),
(314, 184, 16, 26, 'mjahanmeghna@gmail.com', 'What do you like', 'Apple', '2019-01-23 20:59:10', '2019-01-23 20:59:10'),
(315, 184, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 20:59:10', '2019-01-23 20:59:10'),
(316, 184, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-23 20:59:10', '2019-01-23 20:59:10'),
(317, 184, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Orange', '2019-01-23 20:59:10', '2019-01-23 20:59:10'),
(318, 185, 16, 26, 'mjahanmeghna@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-23 21:21:47', '2019-01-23 21:21:47'),
(319, 185, 16, 26, 'mjahanmeghna@gmail.com', 'Gender', 'on', '2019-01-23 21:21:47', '2019-01-23 21:21:47'),
(320, 185, 16, 26, 'mjahanmeghna@gmail.com', 'What do you like', 'Apple', '2019-01-23 21:21:47', '2019-01-23 21:21:47'),
(321, 185, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 21:21:47', '2019-01-23 21:21:47'),
(322, 185, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-23 21:21:47', '2019-01-23 21:21:47'),
(323, 185, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Orange', '2019-01-23 21:21:47', '2019-01-23 21:21:47'),
(324, 186, 16, 26, 'mjahanmeghna@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-23 21:31:03', '2019-01-23 21:31:03'),
(325, 186, 16, 26, 'mjahanmeghna@gmail.com', 'Gender', 'on', '2019-01-23 21:31:03', '2019-01-23 21:31:03'),
(326, 186, 16, 26, 'mjahanmeghna@gmail.com', 'What do you like', 'Apple', '2019-01-23 21:31:03', '2019-01-23 21:31:03'),
(327, 186, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 21:31:03', '2019-01-23 21:31:03'),
(328, 186, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-23 21:31:03', '2019-01-23 21:31:03'),
(329, 186, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Orange', '2019-01-23 21:31:03', '2019-01-23 21:31:03'),
(330, 187, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-23 22:40:11', '2019-01-23 22:40:11'),
(331, 187, 15, 25, 'tanveerqureshee@hotmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-23 22:40:11', '2019-01-23 22:40:11'),
(332, 188, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-23 22:40:34', '2019-01-23 22:40:34'),
(333, 188, 15, 25, 'tanveerqureshee@hotmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-23 22:40:34', '2019-01-23 22:40:34'),
(334, 189, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-23 22:43:31', '2019-01-23 22:43:31'),
(335, 189, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-23 22:43:31', '2019-01-23 22:43:31'),
(336, 189, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-23 22:43:31', '2019-01-23 22:43:31'),
(337, 189, 16, 26, 'mjahanmeghna@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 22:43:31', '2019-01-23 22:43:31'),
(338, 189, 16, 26, 'mjahanmeghna@gmail.com', 'Gender', 'on', '2019-01-23 22:43:31', '2019-01-23 22:43:31'),
(339, 189, 16, 26, 'mjahanmeghna@gmail.com', 'What do you like', 'Apple', '2019-01-23 22:43:31', '2019-01-23 22:43:31'),
(340, 190, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-23 22:48:09', '2019-01-23 22:48:09'),
(341, 190, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-23 22:48:09', '2019-01-23 22:48:09'),
(342, 190, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-23 22:48:09', '2019-01-23 22:48:09'),
(343, 190, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-23 22:48:09', '2019-01-23 22:48:09'),
(344, 190, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-23 22:48:09', '2019-01-23 22:48:09'),
(345, 190, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Orange', '2019-01-23 22:48:09', '2019-01-23 22:48:09'),
(346, 191, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-24 18:53:33', '2019-01-24 18:53:33'),
(347, 191, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-24 18:53:33', '2019-01-24 18:53:33'),
(348, 191, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-24 18:53:33', '2019-01-24 18:53:33'),
(349, 192, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-24 18:57:09', '2019-01-24 18:57:09'),
(350, 192, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-24 18:57:09', '2019-01-24 18:57:09'),
(351, 192, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Durian', '2019-01-24 18:57:09', '2019-01-24 18:57:09'),
(352, 193, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-26 04:54:16', '2019-01-26 04:54:16'),
(353, 193, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-26 04:54:16', '2019-01-26 04:54:16'),
(354, 193, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-26 04:54:16', '2019-01-26 04:54:16'),
(355, 193, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-26 04:54:16', '2019-01-26 04:54:16'),
(356, 193, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-26 04:54:16', '2019-01-26 04:54:16'),
(357, 193, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Orange', '2019-01-26 04:54:16', '2019-01-26 04:54:16'),
(358, 194, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-26 04:55:37', '2019-01-26 04:55:37'),
(359, 194, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-26 04:55:37', '2019-01-26 04:55:37'),
(360, 194, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-26 04:55:37', '2019-01-26 04:55:37'),
(361, 194, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-26 04:55:37', '2019-01-26 04:55:37'),
(362, 194, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-26 04:55:37', '2019-01-26 04:55:37'),
(363, 194, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Orange', '2019-01-26 04:55:37', '2019-01-26 04:55:37'),
(364, 195, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-26 04:59:49', '2019-01-26 04:59:49'),
(365, 195, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-26 04:59:49', '2019-01-26 04:59:49'),
(366, 195, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-26 04:59:49', '2019-01-26 04:59:49'),
(367, 195, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-26 04:59:49', '2019-01-26 04:59:49'),
(368, 195, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-26 04:59:49', '2019-01-26 04:59:49'),
(369, 195, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Orange', '2019-01-26 04:59:49', '2019-01-26 04:59:49'),
(370, 196, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-25 17:11:25', '2019-01-25 17:11:25'),
(371, 196, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-25 17:11:25', '2019-01-25 17:11:25'),
(372, 196, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Apple', '2019-01-25 17:11:25', '2019-01-25 17:11:25'),
(373, 196, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-25 17:11:25', '2019-01-25 17:11:25'),
(374, 196, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-25 17:11:25', '2019-01-25 17:11:25'),
(375, 196, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Orange', '2019-01-25 17:11:25', '2019-01-25 17:11:25'),
(376, 197, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-25 17:11:35', '2019-01-25 17:11:35'),
(377, 197, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-25 17:11:35', '2019-01-25 17:11:35'),
(378, 197, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Apple', '2019-01-25 17:11:35', '2019-01-25 17:11:35'),
(379, 197, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-25 17:11:35', '2019-01-25 17:11:35'),
(380, 197, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-25 17:11:35', '2019-01-25 17:11:35'),
(381, 197, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Orange', '2019-01-25 17:11:35', '2019-01-25 17:11:35'),
(382, 198, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-25 17:14:29', '2019-01-25 17:14:29'),
(383, 198, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-25 17:14:29', '2019-01-25 17:14:29'),
(384, 198, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Apple', '2019-01-25 17:14:30', '2019-01-25 17:14:30'),
(385, 198, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-25 17:14:30', '2019-01-25 17:14:30'),
(386, 198, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-25 17:14:30', '2019-01-25 17:14:30'),
(387, 198, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Orange', '2019-01-25 17:14:30', '2019-01-25 17:14:30'),
(388, 199, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-25 17:16:48', '2019-01-25 17:16:48'),
(389, 199, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-25 17:16:48', '2019-01-25 17:16:48'),
(390, 199, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Apple', '2019-01-25 17:16:48', '2019-01-25 17:16:48'),
(391, 199, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-25 17:16:48', '2019-01-25 17:16:48'),
(392, 199, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-25 17:16:48', '2019-01-25 17:16:48'),
(393, 199, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Orange', '2019-01-25 17:16:48', '2019-01-25 17:16:48'),
(394, 200, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-25 17:23:23', '2019-01-25 17:23:23'),
(395, 200, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-25 17:23:23', '2019-01-25 17:23:23'),
(396, 200, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Apple', '2019-01-25 17:23:23', '2019-01-25 17:23:23'),
(397, 200, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-25 17:23:23', '2019-01-25 17:23:23'),
(398, 200, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-25 17:23:23', '2019-01-25 17:23:23'),
(399, 200, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Orange', '2019-01-25 17:23:23', '2019-01-25 17:23:23'),
(400, 201, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-25 18:30:20', '2019-01-25 18:30:20'),
(401, 201, 15, 25, 'tanveerqureshee@hotmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-25 18:30:20', '2019-01-25 18:30:20'),
(402, 202, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-25 18:31:37', '2019-01-25 18:31:37'),
(403, 202, 15, 25, 'tanveerqureshee@hotmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-25 18:31:37', '2019-01-25 18:31:37'),
(404, 203, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-25 18:37:07', '2019-01-25 18:37:07'),
(405, 203, 15, 25, 'tanveerqureshee@hotmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-25 18:37:07', '2019-01-25 18:37:07'),
(406, 204, 15, 25, 'tanveerqureshee@hotmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-25 21:08:35', '2019-01-25 21:08:35'),
(407, 204, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-25 21:08:35', '2019-01-25 21:08:35'),
(408, 204, 15, 25, 'mjahanmeghna@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-25 21:08:35', '2019-01-25 21:08:35'),
(409, 205, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-25 21:21:52', '2019-01-25 21:21:52'),
(410, 205, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-25 21:21:52', '2019-01-25 21:21:52'),
(411, 205, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-25 21:21:52', '2019-01-25 21:21:52'),
(412, 205, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-25 21:21:52', '2019-01-25 21:21:52'),
(413, 205, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'on', '2019-01-25 21:21:52', '2019-01-25 21:21:52'),
(414, 205, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Durian', '2019-01-25 21:21:52', '2019-01-25 21:21:52'),
(415, 206, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-26 00:42:54', '2019-01-26 00:42:54'),
(416, 206, 15, 25, 'tanveerqureshee@hotmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-26 00:42:54', '2019-01-26 00:42:54'),
(417, 207, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-26 00:43:05', '2019-01-26 00:43:05'),
(418, 207, 15, 25, 'tanveerqureshee@hotmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-26 00:43:05', '2019-01-26 00:43:05'),
(419, 208, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-26 00:45:15', '2019-01-26 00:45:15'),
(420, 208, 15, 25, 'tanveerqureshee@hotmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-26 00:45:15', '2019-01-26 00:45:15'),
(421, 209, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-26 00:47:39', '2019-01-26 00:47:39'),
(422, 210, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-26 00:50:20', '2019-01-26 00:50:20'),
(423, 210, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-26 00:50:20', '2019-01-26 00:50:20'),
(424, 210, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Orange', '2019-01-26 00:50:20', '2019-01-26 00:50:20'),
(425, 211, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-26 00:51:22', '2019-01-26 00:51:22'),
(426, 211, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-26 00:51:22', '2019-01-26 00:51:22'),
(427, 211, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Orange', '2019-01-26 00:51:22', '2019-01-26 00:51:22'),
(428, 212, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-26 00:56:29', '2019-01-26 00:56:29'),
(429, 212, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'Print+Pack+Sign', '2019-01-26 00:56:29', '2019-01-26 00:56:29'),
(430, 212, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-26 00:56:29', '2019-01-26 00:56:29'),
(431, 212, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-26 00:56:29', '2019-01-26 00:56:29'),
(432, 213, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-26 01:04:26', '2019-01-26 01:04:26'),
(433, 213, 15, 25, 'tanveerqureshee@hotmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-26 01:04:26', '2019-01-26 01:04:26'),
(434, 214, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-26 01:04:37', '2019-01-26 01:04:37'),
(435, 214, 15, 25, 'tanveerqureshee@hotmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-26 01:04:37', '2019-01-26 01:04:37'),
(436, 215, 15, 25, 'tanveerqureshee1@gmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-26 01:07:05', '2019-01-26 01:07:05'),
(437, 215, 15, 25, 'tanveerqureshee@hotmail.com', 'Which_Toys_Do_You_Like_Best', 'on', '2019-01-26 01:07:05', '2019-01-26 01:07:05'),
(438, 216, 16, 26, 'tanveerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-26 01:12:52', '2019-01-26 01:12:52'),
(439, 216, 16, 26, 'tanveerqureshee1@gmail.com', 'Gender', 'on', '2019-01-26 01:12:52', '2019-01-26 01:12:52'),
(440, 216, 16, 26, 'tanveerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-26 01:12:52', '2019-01-26 01:12:52'),
(460, 228, 16, 26, 'tanveeerqureshee1@gmail.com', 'You are registering to visit OEA_required', NULL, '2019-01-27 00:33:37', '2019-01-27 00:33:37'),
(461, 228, 16, 26, 'tanveeerqureshee1@gmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-27 00:33:37', '2019-01-27 00:33:37'),
(462, 228, 16, 26, 'tanveeerqureshee1@gmail.com', 'Gender', 'Complicared', '2019-01-27 00:33:37', '2019-01-27 00:33:37'),
(463, 228, 16, 26, 'tanveeerqureshee1@gmail.com', 'What do you like', 'Apple', '2019-01-27 00:33:37', '2019-01-27 00:33:37'),
(464, 228, 16, 26, 'tanveeerqureshee1@gmail.com', 'What do you like_required', NULL, '2019-01-27 00:33:37', '2019-01-27 00:33:37'),
(465, 228, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA_required', NULL, '2019-01-27 00:33:37', '2019-01-27 00:33:37'),
(466, 228, 16, 26, 'tanveerqureshee@hotmail.com', 'You are registering to visit OEA', 'SGPFair', '2019-01-27 00:33:37', '2019-01-27 00:33:37'),
(467, 228, 16, 26, 'tanveerqureshee@hotmail.com', 'Gender', 'Female', '2019-01-27 00:33:37', '2019-01-27 00:33:37'),
(468, 228, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like', 'Durian', '2019-01-27 00:33:37', '2019-01-27 00:33:37'),
(469, 228, 16, 26, 'tanveerqureshee@hotmail.com', 'What do you like_required', NULL, '2019-01-27 00:33:37', '2019-01-27 00:33:37'),
(484, 235, 17, 27, 'zeteo87@gmail.com', 'select 1548562105286', 'apple', '2019-01-27 22:58:10', '2019-01-27 22:58:10'),
(485, 235, 17, 27, 'zeteo87@gmail.com', 'select 1548562105286_required', NULL, '2019-01-27 22:58:10', '2019-01-27 22:58:10'),
(486, 236, 17, 27, 'tanveerqureshee1@gmail.com', 'select 1548562105286', 'orange', '2019-01-28 03:58:07', '2019-01-28 03:58:07'),
(487, 236, 17, 27, 'tanveerqureshee1@gmail.com', 'select 1548562105286_required', NULL, '2019-01-28 03:58:07', '2019-01-28 03:58:07'),
(488, 237, 17, 27, 'tanveerqureshee1@gmail.com', 'select 1548562105286', 'apple', '2019-01-28 17:10:36', '2019-01-28 17:10:36'),
(489, 237, 17, 27, 'tanveerqureshee1@gmail.com', 'select 1548562105286_required', NULL, '2019-01-28 17:10:36', '2019-01-28 17:10:36'),
(490, 229, 18, 28, 'zeteo87@gmail.com', 'Please indicate the exhibition that you are visiting_required', NULL, '2019-02-01 04:26:05', '2019-02-01 04:26:05'),
(491, 229, 18, 28, 'zeteo87@gmail.com', 'Please indicate the exhibition that you are visiting', 'ArchXpo 2018', '2019-02-01 04:26:05', '2019-02-01 04:26:05'),
(492, 229, 18, 28, 'zeteo87@gmail.com', 'Your Profession_required', NULL, '2019-02-01 04:26:05', '2019-02-01 04:26:05'),
(493, 229, 18, 28, 'zeteo87@gmail.com', 'Your Profession', 'Architect', '2019-02-01 04:26:05', '2019-02-01 04:26:05'),
(494, 229, 18, 28, 'zeteo87@gmail.com', 'Please indicate your seniority in the company_required', NULL, '2019-02-01 04:26:05', '2019-02-01 04:26:05'),
(495, 229, 18, 28, 'zeteo87@gmail.com', 'Please indicate your seniority in the company', 'Senior Management', '2019-02-01 04:26:05', '2019-02-01 04:26:05'),
(496, 229, 18, 28, 'zeteo87@gmail.com', 'Employee in your company', '5 - 10', '2019-02-01 04:26:05', '2019-02-01 04:26:05'),
(497, 229, 18, 28, 'zeteo87@gmail.com', 'Employee in your company_required', NULL, '2019-02-01 04:26:05', '2019-02-01 04:26:05'),
(498, 230, 18, 28, 'adrian_teo@jumppy.com.sg', 'Please indicate the exhibition that you are visiting_required', NULL, '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(499, 230, 18, 28, 'adrian_teo@jumppy.com.sg', 'Please indicate the exhibition that you are visiting', 'International Facility Management Expo 2018', '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(500, 230, 18, 28, 'adrian_teo@jumppy.com.sg', 'Your Profession_required', NULL, '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(501, 230, 18, 28, 'adrian_teo@jumppy.com.sg', 'Your Profession', 'Architect', '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(502, 230, 18, 28, 'adrian_teo@jumppy.com.sg', 'Please indicate your seniority in the company_required', NULL, '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(503, 230, 18, 28, 'adrian_teo@jumppy.com.sg', 'Please indicate your seniority in the company', 'Middle Management', '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(504, 230, 18, 28, 'adrian_teo@jumppy.com.sg', 'Employee in your company', '5 - 10', '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(505, 230, 18, 28, 'adrian_teo@jumppy.com.sg', 'Employee in your company_required', NULL, '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(506, 230, 18, 28, 'happy@jumppy.com.sg', 'Please indicate the exhibition that you are visiting_required', NULL, '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(507, 230, 18, 28, 'happy@jumppy.com.sg', 'Please indicate the exhibition that you are visiting', 'Safety & Security Asia 2018', '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(508, 230, 18, 28, 'happy@jumppy.com.sg', 'Your Profession_required', NULL, '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(509, 230, 18, 28, 'happy@jumppy.com.sg', 'Your Profession', 'Administration/Human Resource/Finance', '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(510, 230, 18, 28, 'happy@jumppy.com.sg', 'Your Profession', 'Association/ Institution', '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(511, 230, 18, 28, 'happy@jumppy.com.sg', 'Please indicate your seniority in the company_required', NULL, '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(512, 230, 18, 28, 'happy@jumppy.com.sg', 'Please indicate your seniority in the company', 'Middle Management', '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(513, 230, 18, 28, 'happy@jumppy.com.sg', 'Employee in your company', '5 - 10', '2019-02-01 04:30:11', '2019-02-01 04:30:11'),
(514, 230, 18, 28, 'happy@jumppy.com.sg', 'Employee in your company_required', NULL, '2019-02-01 04:30:11', '2019-02-01 04:30:11');

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
(18, 11, 'abc', '01-14-2019_name_badge_template_0_1547448243.png', '2019-01-14 06:44:03', '2019-01-14 06:44:03'),
(19, 12, 'Badge', '01-24-2019_name_badge_template_0_1548319569.jpg', '2019-01-24 00:46:09', '2019-01-24 00:46:09'),
(20, 13, 'test', '02-01-2019_name_badge_template_0_1548981405.jpg', '2019-01-31 16:36:45', '2019-01-31 16:36:45');

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
(11, 15, '75', '105', NULL, '', 'mm', '2019-01-14 06:44:03', '2019-01-14 06:44:03'),
(12, 16, '90', '135', NULL, '', 'mm', '2019-01-24 00:46:09', '2019-01-24 00:46:09'),
(13, 18, '75', '105', NULL, '', 'mm', '2019-01-31 16:36:45', '2019-01-31 16:36:45');

-- --------------------------------------------------------

--
-- Table structure for table `name_badge_position`
--

CREATE TABLE `name_badge_position` (
  `id` int(10) UNSIGNED NOT NULL,
  `namebadgeTemplateType` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Default',
  `nameBadgeTemplateSet` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `name_badge_position` (`id`, `namebadgeTemplateType`, `nameBadgeTemplateSet`, `name_badge_id`, `event_id`, `field_id`, `left_value`, `top_value`, `left_absulate_value`, `top_absulate_value`, `font_style`, `created_at`, `updated_at`) VALUES
(133, 'Default', 'defaultEventNameBadge1', 11, 15, '', NULL, NULL, NULL, NULL, NULL, '2019-01-14 06:44:18', '2019-01-14 06:44:18'),
(134, 'Default', 'defaultEventNameBadge1', 13, 18, '', NULL, NULL, NULL, NULL, NULL, '2019-01-31 16:46:16', '2019-01-31 16:46:16');

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
  `user_email` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `temp_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registraion_temp`
--

INSERT INTO `registraion_temp` (`id`, `form_id`, `event_id`, `user_email`, `access_token`, `temp_data`, `created_at`, `updated_at`) VALUES
(234, 0, 15, NULL, '7a0da7950757ea8689930cee1e82f302', '{\"event_business_owners_data\":{\"event_id\":\"15\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"Saif Power tec\",\"company_address\":\"Mohakhally\",\"created_at\":\"2019-01-14 02:46:05\",\"updated_at\":\"2019-01-14 02:46:05\"},\"event_business_owners_details\":[{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanvir\",\"last_name\":\"Qureshee\",\"gender\":null,\"designation\":null,\"mobile\":\"0181716\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-14 02:46:05\",\"updated_at\":\"2019-01-14 02:46:05\"}]}', '2019-01-13 18:46:05', '2019-01-13 18:46:05'),
(235, 25, 15, 'tanveerqureshee1@gmail.com', '7a0da7950757ea8689930cee1e82f302', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-13 18:46:10', '2019-01-13 18:46:10'),
(236, 0, 15, NULL, '58edca5ea596dfc06f9181eea1f2a6ce', '{\"event_business_owners_data\":{\"event_id\":\"15\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"Saif\",\"company_address\":\"f\",\"created_at\":\"2019-01-14 03:26:48\",\"updated_at\":\"2019-01-14 03:26:48\"},\"event_business_owners_details\":[{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"v\",\"last_name\":\"b\",\"gender\":null,\"designation\":null,\"mobile\":\"45\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-14 03:26:48\",\"updated_at\":\"2019-01-14 03:26:48\"}]}', '2019-01-13 19:26:48', '2019-01-13 19:26:48'),
(237, 25, 15, 'tanveerqureshee1@gmail.com', '58edca5ea596dfc06f9181eea1f2a6ce', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-13 19:26:56', '2019-01-13 19:26:56'),
(238, 0, 15, NULL, 'e37865c01e222df6bd5b1156811ab7dd', '{\"event_business_owners_data\":{\"event_id\":\"15\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"Dnet\",\"company_address\":\"abc\",\"created_at\":\"2019-01-14 04:11:15\",\"updated_at\":\"2019-01-14 04:11:15\"},\"event_business_owners_details\":[{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"gender\":null,\"designation\":null,\"mobile\":\"094857\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-14 04:11:15\",\"updated_at\":\"2019-01-14 04:11:15\"}]}', '2019-01-13 20:11:15', '2019-01-13 20:11:15'),
(239, 25, 15, 'tanveerqureshee1@gmail.com', 'e37865c01e222df6bd5b1156811ab7dd', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-13 20:11:22', '2019-01-13 20:11:22'),
(240, 0, 15, NULL, '430529b0e4390f6939b14f278cfa6d34', '{\"event_business_owners_data\":{\"event_id\":\"15\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"Dnet\",\"company_address\":\"Mohammadpur\",\"created_at\":\"2019-01-14 04:55:40\",\"updated_at\":\"2019-01-14 04:55:40\"},\"event_business_owners_details\":[{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Fakhrul\",\"last_name\":\"Islam\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"09098\",\"country_id\":\"2\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-14 04:55:40\",\"updated_at\":\"2019-01-14 04:55:40\"}]}', '2019-01-13 20:55:40', '2019-01-13 20:55:40'),
(241, 0, 15, NULL, 'f6fab4b0147f87bd30d4a4307288e51c', '{\"event_business_owners_data\":{\"event_id\":\"15\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"Saif Sporting Club\",\"company_address\":\"Dhaka\",\"created_at\":\"2019-01-21 10:40:30\",\"updated_at\":\"2019-01-21 10:40:30\"},\"event_business_owners_details\":[{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Saif\",\"last_name\":\"Mehbub\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"09123\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-21 10:40:30\",\"updated_at\":\"2019-01-21 10:40:30\"}]}', '2019-01-21 02:40:30', '2019-01-21 02:40:30'),
(242, 25, 15, 'tanveerqureshee1@gmail.com', 'f6fab4b0147f87bd30d4a4307288e51c', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-21 02:40:35', '2019-01-21 02:40:35'),
(243, 0, 15, NULL, 'e831cd91a400084762d0669ee0423892', '{\"event_business_owners_data\":{\"event_id\":\"15\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"Dnet\",\"company_address\":\"Mohamaadpur\",\"created_at\":\"2019-01-21 10:52:24\",\"updated_at\":\"2019-01-21 10:52:24\"},\"event_business_owners_details\":[{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"gender\":null,\"designation\":null,\"mobile\":\"0171\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2019-01-21 10:52:24\",\"updated_at\":\"2019-01-21 10:52:24\"}]}', '2019-01-21 02:52:24', '2019-01-21 02:52:24'),
(244, 0, 15, NULL, '6504622621109f51000f37cadde2ba56', '{\"event_business_owners_data\":{\"event_id\":\"15\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"Oxford International School\",\"company_address\":\"Dhanmondi\",\"created_at\":\"2019-01-21 11:02:02\",\"updated_at\":\"2019-01-21 11:02:02\"},\"event_business_owners_details\":[{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Salman\",\"last_name\":\"Muktadir\",\"gender\":null,\"designation\":null,\"mobile\":\"017166\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-21 11:02:02\",\"updated_at\":\"2019-01-21 11:02:02\"}]}', '2019-01-21 03:02:02', '2019-01-21 03:02:02'),
(245, 25, 15, 'tanveerqureshee1@gmail.com', '6504622621109f51000f37cadde2ba56', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-21 03:02:14', '2019-01-21 03:02:14'),
(246, 0, 15, NULL, '06ab5aede51217efac6ddc36dd16a21f', '{\"event_business_owners_data\":{\"event_id\":\"15\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"jfkjDGKJ\",\"company_address\":null,\"created_at\":\"2019-01-22 07:50:24\",\"updated_at\":\"2019-01-22 07:50:24\"},\"event_business_owners_details\":[{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"ASDGASG\",\"last_name\":\"SDGASDG\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"45634573547\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"ZETEO87@GMAIL.COM\",\"created_at\":\"2019-01-22 07:50:24\",\"updated_at\":\"2019-01-22 07:50:24\"}]}', '2019-01-21 23:50:24', '2019-01-21 23:50:24'),
(247, 25, 15, 'ZETEO87@GMAIL.COM', '06ab5aede51217efac6ddc36dd16a21f', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-21 23:50:33', '2019-01-21 23:50:33'),
(248, 0, 16, NULL, 'b98e3f16c577f5decfa7573c8263c0fa', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"Saif\",\"company_address\":\"Dhaka\",\"created_at\":\"2019-01-23 06:43:20\",\"updated_at\":\"2019-01-23 06:43:20\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"gender\":null,\"designation\":null,\"mobile\":\"017166\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-23 06:43:20\",\"updated_at\":\"2019-01-23 06:43:20\"}]}', '2019-01-22 22:43:20', '2019-01-22 22:43:20'),
(249, 26, 16, 'tanveerqureshee1@gmail.com', 'b98e3f16c577f5decfa7573c8263c0fa', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"on\"}', '2019-01-22 22:43:27', '2019-01-22 22:43:27'),
(250, 0, 16, NULL, '609c87512b6d3e4eede836056435a0de', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":3,\"registration_type\":\"Online\",\"company_name\":\"asd\",\"company_address\":\"lnsaf;lknaflskjg\",\"created_at\":\"2019-01-24 06:03:58\",\"updated_at\":\"2019-01-24 06:03:58\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"kjsdbgkjasbg\",\"last_name\":\"jksjg\",\"gender\":null,\"designation\":null,\"mobile\":\"3462362457\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"zeteo87@gmail.com\",\"created_at\":\"2019-01-24 06:03:58\",\"updated_at\":\"2019-01-24 06:03:58\"},{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"sdgsg\",\"last_name\":\"sdgsdg\",\"gender\":null,\"designation\":null,\"mobile\":\"235436346\",\"country_id\":\"3\",\"tel\":null,\"fax\":null,\"email\":\"zeteo87@gmail.com\",\"created_at\":\"2019-01-24 06:03:58\",\"updated_at\":\"2019-01-24 06:03:58\"},{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"2egasgasg\",\"last_name\":\"asdgasgdsag\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"45236452364\",\"country_id\":\"4\",\"tel\":null,\"fax\":null,\"email\":\"asd@asd.com\",\"created_at\":\"2019-01-24 06:03:58\",\"updated_at\":\"2019-01-24 06:03:58\"}]}', '2019-01-23 22:03:58', '2019-01-23 22:03:58'),
(251, 26, 16, 'zeteo87@gmail.com', '609c87512b6d3e4eede836056435a0de', '{\"You-are-registering-to-visit-OEA\":[\"Print+Pack+Sign\"],\"Gender\":\"on\"}', '2019-01-23 22:04:07', '2019-01-23 22:04:07'),
(252, 0, 16, NULL, '54ef6a392f3eac20694dc3bdf585d48b', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"fgbszfgbzbg\",\"company_address\":null,\"created_at\":\"2019-01-24 06:08:43\",\"updated_at\":\"2019-01-24 06:08:43\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"afdf\",\"last_name\":\"asdfasdg\",\"gender\":null,\"designation\":null,\"mobile\":\"1252543\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"zeteo87@gmail.com\",\"created_at\":\"2019-01-24 06:08:43\",\"updated_at\":\"2019-01-24 06:08:43\"},{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"ebsdgng\",\"last_name\":\"sdgnsgns\",\"gender\":null,\"designation\":null,\"mobile\":\"3452362356\",\"country_id\":\"2\",\"tel\":null,\"fax\":null,\"email\":\"asd@asd.com\",\"created_at\":\"2019-01-24 06:08:43\",\"updated_at\":\"2019-01-24 06:08:43\"}]}', '2019-01-23 22:08:43', '2019-01-23 22:08:43'),
(253, 0, 16, NULL, 'fb6687ba0ab1e03adfdd5a82542b2edc', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"Dnet\",\"company_address\":\"Mohammadpur\",\"created_at\":\"2019-01-24 06:20:55\",\"updated_at\":\"2019-01-24 06:20:55\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"018\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-24 06:20:55\",\"updated_at\":\"2019-01-24 06:20:55\"},{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"Meghna\",\"last_name\":\"Jahan\",\"gender\":null,\"designation\":null,\"mobile\":\"9098\",\"country_id\":\"2\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2019-01-24 06:20:55\",\"updated_at\":\"2019-01-24 06:20:55\"}]}', '2019-01-23 22:20:55', '2019-01-23 22:20:55'),
(254, 26, 16, 'tanveerqureshee1@gmail.com', 'fb6687ba0ab1e03adfdd5a82542b2edc', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"on\",\"What-do-you-like\":\"Apple\"}', '2019-01-23 22:21:15', '2019-01-23 22:21:15'),
(255, 26, 16, 'tanveerqureshee@hotmail.com', 'fb6687ba0ab1e03adfdd5a82542b2edc', '{\"Gender\":\"on\",\"What-do-you-like\":null}', '2019-01-23 22:21:19', '2019-01-23 22:21:19'),
(256, 0, 16, NULL, 'c58aaacf741afbbb049ce546885c948a', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"dd\",\"company_address\":\"dd\",\"created_at\":\"2019-01-24 06:31:38\",\"updated_at\":\"2019-01-24 06:31:38\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"ddc\",\"last_name\":\"dcf\",\"gender\":null,\"designation\":null,\"mobile\":\"23\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-24 06:31:38\",\"updated_at\":\"2019-01-24 06:31:38\"}]}', '2019-01-23 22:31:38', '2019-01-23 22:31:38'),
(257, 26, 16, 'tanveerqureshee1@gmail.com', 'c58aaacf741afbbb049ce546885c948a', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"on\",\"What-do-you-like\":\"Apple\"}', '2019-01-23 22:31:48', '2019-01-23 22:31:48'),
(258, 0, 16, NULL, '58fd4ae0d286818a411fab138f7c657f', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"abc\",\"company_address\":\"moha\",\"created_at\":\"2019-01-24 06:35:52\",\"updated_at\":\"2019-01-24 06:35:52\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tan\",\"last_name\":\"Ji\",\"gender\":null,\"designation\":null,\"mobile\":\"123\",\"country_id\":\"2\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-24 06:35:52\",\"updated_at\":\"2019-01-24 06:35:52\"},{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"megh\",\"last_name\":\"Na\",\"gender\":null,\"designation\":null,\"mobile\":\"234\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2019-01-24 06:35:52\",\"updated_at\":\"2019-01-24 06:35:52\"}]}', '2019-01-23 22:35:52', '2019-01-23 22:35:52'),
(259, 26, 16, 'tanveerqureshee1@gmail.com', '58fd4ae0d286818a411fab138f7c657f', '{\"You-are-registering-to-visit-OEA\":[\"Print+Pack+Sign\"],\"Gender\":\"on\",\"What-do-you-like\":\"Apple\"}', '2019-01-23 22:36:02', '2019-01-23 22:36:02'),
(260, 26, 16, 'tanveerqureshee@hotmail.com', '58fd4ae0d286818a411fab138f7c657f', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"on\",\"What-do-you-like\":\"Orange\"}', '2019-01-23 22:36:11', '2019-01-23 22:36:11'),
(261, 0, 16, NULL, 'd001efa591eed2090c9f336fd76a6d03', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"df\",\"company_address\":\"vb\",\"created_at\":\"2019-01-24 07:04:05\",\"updated_at\":\"2019-01-24 07:04:05\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"cv\",\"last_name\":\"bv\",\"gender\":null,\"designation\":null,\"mobile\":\"44\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-24 07:04:05\",\"updated_at\":\"2019-01-24 07:04:05\"},{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"bn\",\"last_name\":\"gh\",\"gender\":null,\"designation\":null,\"mobile\":\"56\",\"country_id\":\"2\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2019-01-24 07:04:05\",\"updated_at\":\"2019-01-24 07:04:05\"}]}', '2019-01-23 23:04:05', '2019-01-23 23:04:05'),
(262, 26, 16, 'tanveerqureshee1@gmail.com', 'd001efa591eed2090c9f336fd76a6d03', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"on\",\"What-do-you-like\":\"Apple\"}', '2019-01-23 23:04:12', '2019-01-23 23:04:12'),
(263, 26, 16, 'tanveerqureshee@hotmail.com', 'd001efa591eed2090c9f336fd76a6d03', '{\"You-are-registering-to-visit-OEA\":[\"Print+Pack+Sign\"],\"Gender\":\"on\",\"What-do-you-like\":\"Orange\"}', '2019-01-23 23:04:20', '2019-01-23 23:04:20'),
(264, 0, 16, NULL, '55729332589729bc15e3821fff7065c8', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"Dnet\",\"company_address\":\"Mohammadpur\",\"created_at\":\"2019-01-24 03:10:18\",\"updated_at\":\"2019-01-24 03:10:18\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"gender\":null,\"designation\":null,\"mobile\":\"017166\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-24 03:10:18\",\"updated_at\":\"2019-01-24 03:10:18\"},{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"Meghna\",\"last_name\":\"jahan\",\"gender\":null,\"designation\":null,\"mobile\":\"8987\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"mjahanmeghna@gmail.com\",\"created_at\":\"2019-01-24 03:10:18\",\"updated_at\":\"2019-01-24 03:10:18\"}]}', '2019-01-23 19:10:18', '2019-01-23 19:10:18'),
(265, 26, 16, 'tanveerqureshee1@gmail.com', '55729332589729bc15e3821fff7065c8', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"on\",\"What-do-you-like\":\"Orange\"}', '2019-01-23 19:10:25', '2019-01-23 19:10:25'),
(266, 26, 16, 'mjahanmeghna@gmail.com', '55729332589729bc15e3821fff7065c8', '{\"You-are-registering-to-visit-OEA\":[\"Print+Pack+Sign\"],\"Gender\":\"on\",\"What-do-you-like\":\"Orange\"}', '2019-01-23 19:10:34', '2019-01-23 19:10:34'),
(267, 0, 16, NULL, 'f78281e2a180c60105b33e109d431c0a', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"dnet\",\"company_address\":\"mdpur\",\"created_at\":\"2019-01-24 04:57:54\",\"updated_at\":\"2019-01-24 04:57:54\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"megh\",\"last_name\":\"na\",\"gender\":null,\"designation\":null,\"mobile\":\"1235\",\"country_id\":\"4\",\"tel\":null,\"fax\":null,\"email\":\"mjahanmeghna@gmail.com\",\"created_at\":\"2019-01-24 04:57:54\",\"updated_at\":\"2019-01-24 04:57:54\"},{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"ta\",\"last_name\":\"ver\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"562\",\"country_id\":\"3\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-24 04:57:54\",\"updated_at\":\"2019-01-24 04:57:54\"}]}', '2019-01-23 20:57:54', '2019-01-23 20:57:54'),
(268, 26, 16, 'mjahanmeghna@gmail.com', 'f78281e2a180c60105b33e109d431c0a', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"on\",\"What-do-you-like\":\"Apple\"}', '2019-01-23 20:58:17', '2019-01-23 20:58:17'),
(269, 26, 16, 'tanveerqureshee1@gmail.com', 'f78281e2a180c60105b33e109d431c0a', '{\"You-are-registering-to-visit-OEA\":[\"Print+Pack+Sign\"],\"Gender\":\"on\",\"What-do-you-like\":\"Orange\"}', '2019-01-23 20:58:39', '2019-01-23 20:58:39'),
(270, 0, 16, NULL, 'dae88848294aa8ff23966482fbce6c31', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"dnet\",\"company_address\":null,\"created_at\":\"2019-01-24 05:29:41\",\"updated_at\":\"2019-01-24 05:29:41\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"meghna\",\"last_name\":\"jahan\",\"gender\":\"Female\",\"designation\":null,\"mobile\":\"23654\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"mjahanmeghna@gmail.com\",\"created_at\":\"2019-01-24 05:29:41\",\"updated_at\":\"2019-01-24 05:29:41\"},{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"tanveer\",\"last_name\":\"Qureshee\",\"gender\":null,\"designation\":null,\"mobile\":\"65478\",\"country_id\":\"2\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-24 05:29:41\",\"updated_at\":\"2019-01-24 05:29:41\"}]}', '2019-01-23 21:29:41', '2019-01-23 21:29:41'),
(271, 26, 16, 'mjahanmeghna@gmail.com', 'dae88848294aa8ff23966482fbce6c31', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"on\",\"What-do-you-like\":\"Apple\"}', '2019-01-23 21:30:01', '2019-01-23 21:30:01'),
(272, 26, 16, 'tanveerqureshee1@gmail.com', 'dae88848294aa8ff23966482fbce6c31', '{\"You-are-registering-to-visit-OEA\":[\"Print+Pack+Sign\"],\"Gender\":\"on\",\"What-do-you-like\":\"Orange\"}', '2019-01-23 21:30:23', '2019-01-23 21:30:23'),
(273, 0, 15, NULL, 'c5f4401e63bb9da946f859fc66535159', '{\"event_business_owners_data\":{\"event_id\":\"15\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"Dnet\",\"company_address\":\"Mohammadpur\",\"created_at\":\"2019-01-24 06:39:17\",\"updated_at\":\"2019-01-24 06:39:17\"},\"event_business_owners_details\":[{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"gender\":null,\"designation\":null,\"mobile\":\"123\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-24 06:39:17\",\"updated_at\":\"2019-01-24 06:39:17\"},{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"Meghna\",\"last_name\":\"Jahan\",\"gender\":null,\"designation\":null,\"mobile\":\"345\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2019-01-24 06:39:17\",\"updated_at\":\"2019-01-24 06:39:17\"}]}', '2019-01-23 22:39:17', '2019-01-23 22:39:17'),
(274, 25, 15, 'tanveerqureshee1@gmail.com', 'c5f4401e63bb9da946f859fc66535159', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-23 22:39:57', '2019-01-23 22:39:57'),
(275, 25, 15, 'tanveerqureshee@hotmail.com', 'c5f4401e63bb9da946f859fc66535159', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-23 22:40:01', '2019-01-23 22:40:01'),
(276, 0, 16, NULL, '9d74929ec4f8f5b2ab76a72a7a2723bf', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"abc\",\"company_address\":null,\"created_at\":\"2019-01-24 06:43:10\",\"updated_at\":\"2019-01-24 06:43:10\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"mmm\",\"last_name\":\"hhh\",\"gender\":null,\"designation\":null,\"mobile\":\"2145\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-24 06:43:10\",\"updated_at\":\"2019-01-24 06:43:10\"},{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mdm\",\"first_name\":\"mnhj\",\"last_name\":\"vbvv\",\"gender\":null,\"designation\":null,\"mobile\":\"214523\",\"country_id\":\"2\",\"tel\":null,\"fax\":null,\"email\":\"mjahanmeghna@gmail.com\",\"created_at\":\"2019-01-24 06:43:10\",\"updated_at\":\"2019-01-24 06:43:10\"}]}', '2019-01-23 22:43:10', '2019-01-23 22:43:10'),
(277, 26, 16, 'tanveerqureshee1@gmail.com', '9d74929ec4f8f5b2ab76a72a7a2723bf', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"on\",\"What-do-you-like\":\"Apple\"}', '2019-01-23 22:43:17', '2019-01-23 22:43:17'),
(278, 26, 16, 'mjahanmeghna@gmail.com', '9d74929ec4f8f5b2ab76a72a7a2723bf', '{\"You-are-registering-to-visit-OEA\":[\"Print+Pack+Sign\"],\"Gender\":\"on\",\"What-do-you-like\":\"Apple\"}', '2019-01-23 22:43:24', '2019-01-23 22:43:24'),
(279, 0, 16, NULL, '57c91e3f3d02d4845ce4a64d4ab1f912', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"f\",\"company_address\":null,\"created_at\":\"2019-01-24 06:47:48\",\"updated_at\":\"2019-01-24 06:47:48\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"b\",\"last_name\":\"bbb\",\"gender\":null,\"designation\":null,\"mobile\":\"5\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-24 06:47:48\",\"updated_at\":\"2019-01-24 06:47:48\"},{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"fg\",\"last_name\":\"rt\",\"gender\":null,\"designation\":null,\"mobile\":\"456\",\"country_id\":\"2\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2019-01-24 06:47:48\",\"updated_at\":\"2019-01-24 06:47:48\"}]}', '2019-01-23 22:47:48', '2019-01-23 22:47:48'),
(280, 26, 16, 'tanveerqureshee1@gmail.com', '57c91e3f3d02d4845ce4a64d4ab1f912', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"on\",\"What-do-you-like\":\"Apple\"}', '2019-01-23 22:47:55', '2019-01-23 22:47:55'),
(281, 26, 16, 'tanveerqureshee@hotmail.com', '57c91e3f3d02d4845ce4a64d4ab1f912', '{\"You-are-registering-to-visit-OEA\":[\"Print+Pack+Sign\"],\"Gender\":\"on\",\"What-do-you-like\":\"Orange\"}', '2019-01-23 22:48:03', '2019-01-23 22:48:03'),
(282, 0, 16, NULL, '91a69206424946d8497b2b4cf5605ffe', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"abc\",\"company_address\":null,\"created_at\":\"2019-01-25 02:53:01\",\"updated_at\":\"2019-01-25 02:53:01\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"tan\",\"last_name\":\"veer\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"2548\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-25 02:53:01\",\"updated_at\":\"2019-01-25 02:53:01\"}]}', '2019-01-24 18:53:01', '2019-01-24 18:53:01'),
(283, 26, 16, 'tanveerqureshee1@gmail.com', '91a69206424946d8497b2b4cf5605ffe', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"on\",\"What-do-you-like\":\"Apple\"}', '2019-01-24 18:53:20', '2019-01-24 18:53:20'),
(284, 0, 16, NULL, 'd5716ee57c5c3e0d623bf2acf6969548', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"saif\",\"company_address\":null,\"created_at\":\"2019-01-25 02:56:24\",\"updated_at\":\"2019-01-25 02:56:24\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"tanveer\",\"last_name\":\"qureshee\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"23654\",\"country_id\":\"4\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2019-01-25 02:56:24\",\"updated_at\":\"2019-01-25 02:56:24\"}]}', '2019-01-24 18:56:24', '2019-01-24 18:56:24'),
(285, 26, 16, 'tanveerqureshee@hotmail.com', 'd5716ee57c5c3e0d623bf2acf6969548', '{\"You-are-registering-to-visit-OEA\":[\"Print+Pack+Sign\"],\"Gender\":\"on\",\"What-do-you-like\":\"Durian\"}', '2019-01-24 18:56:49', '2019-01-24 18:56:49'),
(286, 0, 16, NULL, '594824c199d763b9e76540868dab3d76', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"Dnet\",\"company_address\":\"Mohaamdpur\",\"created_at\":\"2019-01-26 12:53:35\",\"updated_at\":\"2019-01-26 12:53:35\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"90\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-26 12:53:35\",\"updated_at\":\"2019-01-26 12:53:35\"},{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"Meghna\",\"last_name\":\"Jahan\",\"gender\":\"Female\",\"designation\":null,\"mobile\":\"345\",\"country_id\":\"3\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2019-01-26 12:53:35\",\"updated_at\":\"2019-01-26 12:53:35\"}]}', '2019-01-26 04:53:35', '2019-01-26 04:53:35'),
(287, 26, 16, 'tanveerqureshee1@gmail.com', '594824c199d763b9e76540868dab3d76', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"on\",\"What-do-you-like\":\"Apple\"}', '2019-01-26 04:53:42', '2019-01-26 04:53:42'),
(288, 26, 16, 'tanveerqureshee@hotmail.com', '594824c199d763b9e76540868dab3d76', '{\"You-are-registering-to-visit-OEA\":[\"Print+Pack+Sign\"],\"Gender\":\"on\",\"What-do-you-like\":\"Orange\"}', '2019-01-26 04:53:48', '2019-01-26 04:53:48'),
(289, 0, 16, NULL, '830c0498b3593044b32756745dd0356f', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"Dnet\",\"company_address\":\"Mohammadpur\",\"created_at\":\"2019-01-26 01:11:01\",\"updated_at\":\"2019-01-26 01:11:01\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"qureshee\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"12\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2019-01-26 01:11:01\",\"updated_at\":\"2019-01-26 01:11:01\"},{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"Meghna\",\"last_name\":\"Jahan\",\"gender\":null,\"designation\":null,\"mobile\":\"34\",\"country_id\":\"2\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-26 01:11:01\",\"updated_at\":\"2019-01-26 01:11:01\"}]}', '2019-01-25 17:11:01', '2019-01-25 17:11:01'),
(290, 26, 16, 'tanveerqureshee@hotmail.com', '830c0498b3593044b32756745dd0356f', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"on\",\"What-do-you-like\":\"Apple\"}', '2019-01-25 17:11:09', '2019-01-25 17:11:09'),
(291, 26, 16, 'tanveerqureshee1@gmail.com', '830c0498b3593044b32756745dd0356f', '{\"You-are-registering-to-visit-OEA\":[\"Print+Pack+Sign\"],\"Gender\":\"on\",\"What-do-you-like\":\"Orange\"}', '2019-01-25 17:11:16', '2019-01-25 17:11:16'),
(292, 0, 15, NULL, '716bef112b5d1bae86f9114da593984f', '{\"event_business_owners_data\":{\"event_id\":\"15\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"Dnet\",\"company_address\":\"Mohammadpur\",\"created_at\":\"2019-01-26 02:29:37\",\"updated_at\":\"2019-01-26 02:29:37\"},\"event_business_owners_details\":[{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"gender\":null,\"designation\":null,\"mobile\":\"45\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-26 02:29:37\",\"updated_at\":\"2019-01-26 02:29:37\"},{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"Meghna\",\"last_name\":\"Jahan\",\"gender\":\"Female\",\"designation\":null,\"mobile\":\"56\",\"country_id\":\"4\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2019-01-26 02:29:37\",\"updated_at\":\"2019-01-26 02:29:37\"}]}', '2019-01-25 18:29:37', '2019-01-25 18:29:37'),
(293, 25, 15, 'tanveerqureshee1@gmail.com', '716bef112b5d1bae86f9114da593984f', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-25 18:29:43', '2019-01-25 18:29:43'),
(294, 25, 15, 'tanveerqureshee@hotmail.com', '716bef112b5d1bae86f9114da593984f', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-25 18:29:46', '2019-01-25 18:29:46'),
(295, 0, 15, NULL, '80611c21afee6a95003cc6fc7da3fad6', '{\"event_business_owners_data\":{\"event_id\":\"15\",\"owners_numbers\":3,\"registration_type\":\"Online\",\"company_name\":\"Dnet\",\"company_address\":\"Mohammadpur\",\"created_at\":\"2019-01-26 05:08:04\",\"updated_at\":\"2019-01-26 05:08:04\"},\"event_business_owners_details\":[{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"12\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2019-01-26 05:08:04\",\"updated_at\":\"2019-01-26 05:08:04\"},{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"Meghna\",\"last_name\":\"Jahan\",\"gender\":\"Female\",\"designation\":null,\"mobile\":\"123\",\"country_id\":\"2\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-26 05:08:04\",\"updated_at\":\"2019-01-26 05:08:04\"},{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Dr\",\"first_name\":\"Rizvee\",\"last_name\":\"Qureshee r\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"43\",\"country_id\":\"3\",\"tel\":null,\"fax\":null,\"email\":\"mjahanmeghna@gmail.com\",\"created_at\":\"2019-01-26 05:08:04\",\"updated_at\":\"2019-01-26 05:08:04\"}]}', '2019-01-25 21:08:04', '2019-01-25 21:08:04'),
(296, 25, 15, 'tanveerqureshee@hotmail.com', '80611c21afee6a95003cc6fc7da3fad6', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-25 21:08:08', '2019-01-25 21:08:08'),
(297, 25, 15, 'tanveerqureshee1@gmail.com', '80611c21afee6a95003cc6fc7da3fad6', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-25 21:08:12', '2019-01-25 21:08:12'),
(298, 25, 15, 'mjahanmeghna@gmail.com', '80611c21afee6a95003cc6fc7da3fad6', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-25 21:08:16', '2019-01-25 21:08:16'),
(299, 0, 16, NULL, 'e2096674181aae90991f5fce83db1b2b', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"Saif Power Tec\",\"company_address\":\"Mohakhali\",\"created_at\":\"2019-01-26 05:21:06\",\"updated_at\":\"2019-01-26 05:21:06\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"12345\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-26 05:21:06\",\"updated_at\":\"2019-01-26 05:21:06\"},{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Saif\",\"last_name\":\"Mehebub\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"456\",\"country_id\":\"2\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2019-01-26 05:21:06\",\"updated_at\":\"2019-01-26 05:21:06\"}]}', '2019-01-25 21:21:06', '2019-01-25 21:21:06'),
(300, 26, 16, 'tanveerqureshee1@gmail.com', 'e2096674181aae90991f5fce83db1b2b', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"on\",\"What-do-you-like\":\"Apple\"}', '2019-01-25 21:21:14', '2019-01-25 21:21:14'),
(301, 26, 16, 'tanveerqureshee@hotmail.com', 'e2096674181aae90991f5fce83db1b2b', '{\"You-are-registering-to-visit-OEA\":[\"Print+Pack+Sign\"],\"Gender\":\"on\",\"What-do-you-like\":\"Durian\"}', '2019-01-25 21:21:21', '2019-01-25 21:21:21'),
(302, 0, 15, NULL, 'bb49f0c4fd8d4fa7e2c5e8de05a114c7', '{\"event_business_owners_data\":{\"event_id\":\"15\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"TEST\",\"company_address\":\"Dhaka\",\"created_at\":\"2019-01-26 08:42:18\",\"updated_at\":\"2019-01-26 08:42:18\"},\"event_business_owners_details\":[{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Alex\",\"last_name\":\"Ann\",\"gender\":null,\"designation\":null,\"mobile\":\"22\",\"country_id\":\"2\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-26 08:42:18\",\"updated_at\":\"2019-01-26 08:42:18\"},{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Kite\",\"last_name\":\"zeo\",\"gender\":null,\"designation\":null,\"mobile\":\"3\",\"country_id\":\"2\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2019-01-26 08:42:18\",\"updated_at\":\"2019-01-26 08:42:18\"}]}', '2019-01-26 00:42:18', '2019-01-26 00:42:18'),
(303, 25, 15, 'tanveerqureshee1@gmail.com', 'bb49f0c4fd8d4fa7e2c5e8de05a114c7', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-26 00:42:22', '2019-01-26 00:42:22'),
(304, 25, 15, 'tanveerqureshee@hotmail.com', 'bb49f0c4fd8d4fa7e2c5e8de05a114c7', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-26 00:42:25', '2019-01-26 00:42:25'),
(305, 0, 15, NULL, 'bcca4848962f7e6c8aa64c9b2e64282a', '{\"event_business_owners_data\":{\"event_id\":\"15\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"dnet\",\"company_address\":\"test\",\"created_at\":\"2019-01-26 08:47:27\",\"updated_at\":\"2019-01-26 08:47:27\"},\"event_business_owners_details\":[{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"tanveer\",\"last_name\":\"qureshee\",\"gender\":null,\"designation\":null,\"mobile\":\"12\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-26 08:47:27\",\"updated_at\":\"2019-01-26 08:47:27\"}]}', '2019-01-26 00:47:27', '2019-01-26 00:47:27'),
(306, 25, 15, 'tanveerqureshee1@gmail.com', 'bcca4848962f7e6c8aa64c9b2e64282a', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-26 00:47:30', '2019-01-26 00:47:30'),
(307, 0, 16, NULL, 'bd0ee7df0763c9bf964456b44f3d2e04', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"d\",\"company_address\":\"dd\",\"created_at\":\"2019-01-26 08:50:07\",\"updated_at\":\"2019-01-26 08:50:07\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"f\",\"last_name\":\"d\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"33\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-26 08:50:07\",\"updated_at\":\"2019-01-26 08:50:07\"}]}', '2019-01-26 00:50:07', '2019-01-26 00:50:07'),
(308, 26, 16, 'tanveerqureshee1@gmail.com', 'bd0ee7df0763c9bf964456b44f3d2e04', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"on\",\"What-do-you-like\":\"Orange\"}', '2019-01-26 00:50:13', '2019-01-26 00:50:13'),
(309, 0, 16, NULL, '30b0a8c723374caf57c6e7618d51ed94', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"Dnet\",\"company_address\":\"Mohammadpur\",\"created_at\":\"2019-01-26 08:56:15\",\"updated_at\":\"2019-01-26 08:56:15\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Latiful\",\"last_name\":\"Quader Qureshee\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"12\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-26 08:56:15\",\"updated_at\":\"2019-01-26 08:56:15\"}]}', '2019-01-26 00:56:15', '2019-01-26 00:56:15'),
(310, 26, 16, 'tanveerqureshee1@gmail.com', '30b0a8c723374caf57c6e7618d51ed94', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\",\"Print+Pack+Sign\"],\"Gender\":\"on\",\"What-do-you-like\":\"Apple\"}', '2019-01-26 00:56:21', '2019-01-26 00:56:21'),
(311, 0, 15, NULL, '0c9d862eef9e7c5c17b38da811074a56', '{\"event_business_owners_data\":{\"event_id\":\"15\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"Dnet\",\"company_address\":\"Mohammadpur\",\"created_at\":\"2019-01-26 09:04:14\",\"updated_at\":\"2019-01-26 09:04:14\"},\"event_business_owners_details\":[{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee Shwaon\",\"gender\":\"Male\",\"designation\":null,\"mobile\":\"56\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-26 09:04:14\",\"updated_at\":\"2019-01-26 09:04:14\"},{\"event_id\":\"15\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"Meghna\",\"last_name\":\"Jahan Qureshee\",\"gender\":\"Female\",\"designation\":null,\"mobile\":\"23\",\"country_id\":\"4\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2019-01-26 09:04:14\",\"updated_at\":\"2019-01-26 09:04:14\"}]}', '2019-01-26 01:04:14', '2019-01-26 01:04:14'),
(312, 25, 15, 'tanveerqureshee1@gmail.com', '0c9d862eef9e7c5c17b38da811074a56', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-26 01:04:17', '2019-01-26 01:04:17'),
(313, 25, 15, 'tanveerqureshee@hotmail.com', '0c9d862eef9e7c5c17b38da811074a56', '{\"Which_Toys_Do_You_Like_Best\":\"on\"}', '2019-01-26 01:04:21', '2019-01-26 01:04:21'),
(314, 0, 16, NULL, 'c34fa33174f59058a004fae807d5fc5c', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"Dnet\",\"company_address\":\"Mohammadpur\",\"created_at\":\"2019-01-26 09:12:39\",\"updated_at\":\"2019-01-26 09:12:39\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"gender\":null,\"designation\":null,\"mobile\":\"345\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-26 09:12:39\",\"updated_at\":\"2019-01-26 09:12:39\"}]}', '2019-01-26 01:12:39', '2019-01-26 01:12:39'),
(315, 26, 16, 'tanveerqureshee1@gmail.com', 'c34fa33174f59058a004fae807d5fc5c', '{\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"on\",\"What-do-you-like\":\"Apple\"}', '2019-01-26 01:12:46', '2019-01-26 01:12:46'),
(321, 0, 16, NULL, 'b883c1ba6767474396f2d34992ee1b21', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"xyz\",\"company_address\":null,\"created_at\":\"2019-01-27 04:45:20\",\"updated_at\":\"2019-01-27 04:45:20\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"xs\",\"last_name\":\"xd\",\"gender\":null,\"designation\":null,\"mobile\":\"23\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"x@gmail.com\",\"created_at\":\"2019-01-27 04:45:20\",\"updated_at\":\"2019-01-27 04:45:20\"}]}', '2019-01-26 20:45:20', '2019-01-26 20:45:20'),
(324, 0, 16, NULL, 'e5e56f745d166cb4f95329fe3bc97d78', '{\"event_business_owners_data\":{\"event_id\":\"16\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"dent\",\"company_address\":\"bgt\",\"created_at\":\"2019-01-27 08:32:15\",\"updated_at\":\"2019-01-27 08:32:15\"},\"event_business_owners_details\":[{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"bt\",\"last_name\":\"ct\",\"gender\":null,\"designation\":null,\"mobile\":\"7890\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveeerqureshee1@gmail.com\",\"created_at\":\"2019-01-27 08:32:15\",\"updated_at\":\"2019-01-27 08:32:15\"},{\"event_id\":\"16\",\"business_owner_id\":\"\",\"salutation\":\"Ms\",\"first_name\":\"bu\",\"last_name\":\"cu\",\"gender\":null,\"designation\":null,\"mobile\":\"56\",\"country_id\":\"2\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee@hotmail.com\",\"created_at\":\"2019-01-27 08:32:15\",\"updated_at\":\"2019-01-27 08:32:15\"}]}', '2019-01-27 00:32:15', '2019-01-27 00:32:15'),
(325, 26, 16, 'tanveeerqureshee1@gmail.com', 'e5e56f745d166cb4f95329fe3bc97d78', '{\"You-are-registering-to-visit-OEA_required\":null,\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"Complicared\",\"What-do-you-like\":\"Apple\",\"What-do-you-like_required\":null}', '2019-01-27 00:32:32', '2019-01-27 00:32:32'),
(326, 26, 16, 'tanveerqureshee@hotmail.com', 'e5e56f745d166cb4f95329fe3bc97d78', '{\"You-are-registering-to-visit-OEA_required\":null,\"You-are-registering-to-visit-OEA\":[\"SGPFair\"],\"Gender\":\"Female\",\"What-do-you-like\":\"Durian\",\"What-do-you-like_required\":null}', '2019-01-27 00:32:44', '2019-01-27 00:32:44'),
(332, 0, 17, NULL, 'ba9b0f666bc531995f050d89f6653ddd', '{\"event_business_owners_data\":{\"event_id\":\"17\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"jjhkjh;kjh\",\"company_address\":\"jh;jh\",\"created_at\":\"2019-01-28 06:57:57\",\"updated_at\":\"2019-01-28 06:57:57\"},\"event_business_owners_details\":[{\"event_id\":\"17\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"gasgsafhf\",\"last_name\":\"blkjklgkl\",\"gender\":null,\"designation\":null,\"mobile\":\"6587876786\",\"country_id\":\"2\",\"tel\":null,\"fax\":null,\"email\":\"zeteo87@gmail.com\",\"created_at\":\"2019-01-28 06:57:57\",\"updated_at\":\"2019-01-28 06:57:57\"}]}', '2019-01-27 22:57:57', '2019-01-27 22:57:57'),
(333, 27, 17, 'zeteo87@gmail.com', 'ba9b0f666bc531995f050d89f6653ddd', '{\"select-1548562105286\":\"apple\",\"select-1548562105286_required\":null}', '2019-01-27 22:58:03', '2019-01-27 22:58:03'),
(334, 0, 17, NULL, 'f9b88a2ab766b10907136b238c33c8b5', '{\"event_business_owners_data\":{\"event_id\":\"17\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"Dnet\",\"company_address\":\"Mohammadpur\",\"created_at\":\"2019-01-28 11:57:56\",\"updated_at\":\"2019-01-28 11:57:56\"},\"event_business_owners_details\":[{\"event_id\":\"17\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"Tanveer\",\"last_name\":\"Qureshee\",\"gender\":null,\"designation\":null,\"mobile\":\"234\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-28 11:57:56\",\"updated_at\":\"2019-01-28 11:57:56\"}]}', '2019-01-28 03:57:56', '2019-01-28 03:57:56'),
(335, 27, 17, 'tanveerqureshee1@gmail.com', 'f9b88a2ab766b10907136b238c33c8b5', '{\"select-1548562105286\":\"orange\",\"select-1548562105286_required\":null}', '2019-01-28 03:58:00', '2019-01-28 03:58:00'),
(336, 0, 17, NULL, '1a3c39f8a72701bb29cda3ee006904df', '{\"event_business_owners_data\":{\"event_id\":\"17\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"Dnet\",\"company_address\":\"Mohammadpur\",\"created_at\":\"2019-01-29 01:10:24\",\"updated_at\":\"2019-01-29 01:10:24\"},\"event_business_owners_details\":[{\"event_id\":\"17\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"tanveer\",\"last_name\":\"Qureshee\",\"gender\":null,\"designation\":null,\"mobile\":\"909\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"tanveerqureshee1@gmail.com\",\"created_at\":\"2019-01-29 01:10:24\",\"updated_at\":\"2019-01-29 01:10:24\"}]}', '2019-01-28 17:10:24', '2019-01-28 17:10:24'),
(337, 27, 17, 'tanveerqureshee1@gmail.com', '1a3c39f8a72701bb29cda3ee006904df', '{\"select-1548562105286\":\"apple\",\"select-1548562105286_required\":null}', '2019-01-28 17:10:29', '2019-01-28 17:10:29'),
(338, 0, 18, NULL, '9a68b73c236ed4311c4f8da587dadae6', '{\"event_business_owners_data\":{\"event_id\":\"18\",\"owners_numbers\":1,\"registration_type\":\"Online\",\"company_name\":\"asd\",\"company_address\":null,\"created_at\":\"2019-02-01 12:25:45\",\"updated_at\":\"2019-02-01 12:25:45\"},\"event_business_owners_details\":[{\"event_id\":\"18\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"asd\",\"last_name\":\"asd\",\"gender\":\"Female\",\"designation\":null,\"mobile\":\"15234532145\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"zeteo87@gmail.com\",\"created_at\":\"2019-02-01 12:25:45\",\"updated_at\":\"2019-02-01 12:25:45\"}]}', '2019-02-01 04:25:45', '2019-02-01 04:25:45'),
(339, 28, 18, 'zeteo87@gmail.com', '9a68b73c236ed4311c4f8da587dadae6', '{\"Please-indicate-the-exhibition-that-you-are-visiting_required\":null,\"Please-indicate-the-exhibition-that-you-are-visiting\":[\"ArchXpo 2018\"],\"Your-Profession_required\":null,\"Your-Profession\":[\"Architect\"],\"Please-indicate-your-seniority-in-the-company_required\":null,\"Please-indicate-your-seniority-in-the-company\":\"Senior Management\",\"Employee-in-your-company\":\"5 - 10\",\"Employee-in-your-company_required\":null}', '2019-02-01 04:25:58', '2019-02-01 04:25:58'),
(340, 0, 18, NULL, '2d92941e901c7c71c018553d26cec6d3', '{\"event_business_owners_data\":{\"event_id\":\"18\",\"owners_numbers\":2,\"registration_type\":\"Online\",\"company_name\":\"jumppypl\",\"company_address\":null,\"created_at\":\"2019-02-01 12:29:34\",\"updated_at\":\"2019-02-01 12:29:34\"},\"event_business_owners_details\":[{\"event_id\":\"18\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"ze\",\"last_name\":\"teo\",\"gender\":null,\"designation\":null,\"mobile\":\"8769876\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"adrian_teo@jumppy.com.sg\",\"created_at\":\"2019-02-01 12:29:34\",\"updated_at\":\"2019-02-01 12:29:34\"},{\"event_id\":\"18\",\"business_owner_id\":\"\",\"salutation\":\"Mr\",\"first_name\":\"jumppy\",\"last_name\":\"contact\",\"gender\":null,\"designation\":null,\"mobile\":\"234523152435\",\"country_id\":\"1\",\"tel\":null,\"fax\":null,\"email\":\"happy@jumppy.com.sg\",\"created_at\":\"2019-02-01 12:29:34\",\"updated_at\":\"2019-02-01 12:29:34\"}]}', '2019-02-01 04:29:34', '2019-02-01 04:29:34'),
(341, 28, 18, 'adrian_teo@jumppy.com.sg', '2d92941e901c7c71c018553d26cec6d3', '{\"Please-indicate-the-exhibition-that-you-are-visiting_required\":null,\"Please-indicate-the-exhibition-that-you-are-visiting\":[\"International Facility Management Expo 2018\"],\"Your-Profession_required\":null,\"Your-Profession\":[\"Architect\"],\"Please-indicate-your-seniority-in-the-company_required\":null,\"Please-indicate-your-seniority-in-the-company\":\"Middle Management\",\"Employee-in-your-company\":\"5 - 10\",\"Employee-in-your-company_required\":null}', '2019-02-01 04:29:48', '2019-02-01 04:29:48');
INSERT INTO `registraion_temp` (`id`, `form_id`, `event_id`, `user_email`, `access_token`, `temp_data`, `created_at`, `updated_at`) VALUES
(342, 28, 18, 'happy@jumppy.com.sg', '2d92941e901c7c71c018553d26cec6d3', '{\"Please-indicate-the-exhibition-that-you-are-visiting_required\":null,\"Please-indicate-the-exhibition-that-you-are-visiting\":[\"Safety & Security Asia 2018\"],\"Your-Profession_required\":null,\"Your-Profession\":[\"Administration\\/Human Resource\\/Finance\",\"Association\\/ Institution\"],\"Please-indicate-your-seniority-in-the-company_required\":null,\"Please-indicate-your-seniority-in-the-company\":\"Middle Management\",\"Employee-in-your-company\":\"5 - 10\",\"Employee-in-your-company_required\":null}', '2019-02-01 04:29:59', '2019-02-01 04:29:59');

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
(7, '5', '<p><strong>Hi There!</strong><br /><br />This is an email test for Airshow 2020.<br /><em>We are updating...</em><br /><br />Thank<br /><strong>Registro AsiaTeam</strong></p>', 'text', 'email_text'),
(8, '15', '<p>Hi {$first_name}&nbsp; {$last_name}<br /><br /><strong>Congratulation</strong>! You have successfully registered for the {$event_title}</p>', 'text', 'pdf_text'),
(9, '16', '<p>Dear {$first_name} {$last_name}<br />Congratulation! You have successfully registered for {$event_title}</p>', 'text', 'pdf_text'),
(10, '17', '<p>Hi {$first_name},</p>\r\n<p>&nbsp;</p>\r\n<p>Welome to {$event_title}.</p>', 'text', 'pdf_text');

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

-- --------------------------------------------------------

--
-- Table structure for table `user_label`
--

CREATE TABLE `user_label` (
  `id` int(11) NOT NULL,
  `name` varchar(400) DEFAULT NULL,
  `background_color` varchar(300) DEFAULT NULL,
  `text_clor` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_label`
--

INSERT INTO `user_label` (`id`, `name`, `background_color`, `text_clor`) VALUES
(5, 'Visitor', '#ffff00', '#ff0000'),
(6, 'Organizer', '#0080ff', '#ffffff'),
(7, 'VIP', '#ff8000', '#ffffff'),
(8, 'Exhibitor', '#808040', '#ffffff'),
(9, 'Demo', '#000000', '#ffffff');

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
-- Indexes for table `user_label`
--
ALTER TABLE `user_label`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `event_business_owners`
--
ALTER TABLE `event_business_owners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT for table `event_business_owners_details`
--
ALTER TABLE `event_business_owners_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1054;

--
-- AUTO_INCREMENT for table `event_forms`
--
ALTER TABLE `event_forms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `event_registeration_form_values`
--
ALTER TABLE `event_registeration_form_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=515;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `namebadge_print_status`
--
ALTER TABLE `namebadge_print_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `namebadge_template_details`
--
ALTER TABLE `namebadge_template_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `name_badge_config`
--
ALTER TABLE `name_badge_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `name_badge_position`
--
ALTER TABLE `name_badge_position`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `print_layout_config`
--
ALTER TABLE `print_layout_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registraion_temp`
--
ALTER TABLE `registraion_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- AUTO_INCREMENT for table `user_label`
--
ALTER TABLE `user_label`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
