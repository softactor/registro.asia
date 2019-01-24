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
(15, 'Toy Show 2019', 'Banzai', '2019-02-01', '2019-02-03', 'MBS', '1 MBS Drive', 'Toy-Show-2019', NULL, '01-14-2019_event_template_header_1547448041.png', '01-14-2019_event_template_email_pdf_1547448041.pdf', '2019-01-13 18:40:41', '2019-01-13 18:40:41'),
(16, 'Singapore Show', 'Alvin', '2019-03-01', '2019-03-04', 'SunTec', 'SunTec', 'Singapore-Show', NULL, '01-24-2019_event_template_header_1548309602.jpg', '01-24-2019_event_template_email_pdf_1548309602.pdf', '2019-01-23 22:00:02', '2019-01-23 22:00:02');

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
(165, 16, 3, 'Online', 'asd', 'lnsaf;lknaflskjg', 1, '2019-01-23 22:04:31', '2019-01-23 22:04:31'),
(166, 16, 3, 'Online', 'asd', 'lnsaf;lknaflskjg', 1, '2019-01-23 22:04:38', '2019-01-23 22:04:38'),
(167, 16, 3, 'Online', 'asd', 'lnsaf;lknaflskjg', 1, '2019-01-23 22:04:59', '2019-01-23 22:04:59'),
(168, 16, 3, 'Online', 'asd', 'lnsaf;lknaflskjg', 1, '2019-01-23 22:04:59', '2019-01-23 22:04:59'),
(169, 16, 3, 'Online', 'asd', 'lnsaf;lknaflskjg', 1, '2019-01-23 22:06:58', '2019-01-23 22:06:58'),
(170, 16, 3, 'Online', 'asd', 'lnsaf;lknaflskjg', 1, '2019-01-23 22:06:59', '2019-01-23 22:06:59'),
(171, 16, 3, 'Online', 'asd', 'lnsaf;lknaflskjg', 1, '2019-01-23 22:06:59', '2019-01-23 22:06:59'),
(172, 16, 2, 'Online', 'fgbszfgbzbg', NULL, 1, '2019-01-23 22:08:51', '2019-01-23 22:08:51'),
(173, 16, 2, 'Online', 'fgbszfgbzbg', NULL, 1, '2019-01-23 22:09:24', '2019-01-23 22:09:24'),
(174, 16, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-23 22:21:45', '2019-01-23 22:21:45'),
(175, 16, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-23 22:28:53', '2019-01-23 22:28:53'),
(176, 16, 1, 'Online', 'dd', 'dd', 1, '2019-01-23 22:32:02', '2019-01-23 22:32:02'),
(177, 16, 2, 'Online', 'abc', 'moha', 1, '2019-01-23 22:36:27', '2019-01-23 22:36:27'),
(178, 16, 2, 'Online', 'abc', 'moha', 1, '2019-01-23 22:51:13', '2019-01-23 22:51:13'),
(179, 16, 2, 'Online', 'abc', 'moha', 1, '2019-01-23 23:01:20', '2019-01-23 23:01:20'),
(180, 16, 2, 'Online', 'df', 'vb', 1, '2019-01-23 23:04:31', '2019-01-23 23:04:31'),
(181, 16, 2, 'Online', 'df', 'vb', 1, '2019-01-23 23:11:39', '2019-01-23 23:11:39'),
(182, 16, 2, 'Online', 'df', 'vb', 1, '2019-01-23 23:11:45', '2019-01-23 23:11:45'),
(183, 16, 2, 'Online', 'Dnet', 'Mohammadpur', 1, '2019-01-23 19:11:00', '2019-01-23 19:11:00');

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
(908, 15, 148, 'Mr', 'Tanvir', 'Qureshee', NULL, NULL, NULL, NULL, '0181716', 1, '', '', '', 'tanveerqureshee1@gmail.com', '717459715148', 'visitor', 1, 1, 1, 0, '717459715148.png', 'Toy Show 2019.pdf', NULL, '2019-01-13 18:46:30', '2019-01-13 18:46:30'),
(909, 15, 149, 'Mr', 'Tanvir', 'Qureshee', NULL, NULL, NULL, NULL, '0181716', 1, '', '', '', 'tanveerqureshee1@gmail.com', '191454615149', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-13 18:50:04', '2019-01-13 18:50:04'),
(910, 15, 150, 'Mr', 'Tanvir', 'Qureshee', NULL, NULL, NULL, NULL, '0181716', 1, '', '', '', 'tanveerqureshee1@gmail.com', '687870115150', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-13 18:52:00', '2019-01-13 18:52:00'),
(911, 15, 151, 'Mr', 'Tanvir', 'Qureshee', NULL, NULL, NULL, NULL, '0181716', 1, '', '', '', 'tanveerqureshee1@gmail.com', '296595715151', 'visitor', 1, 1, 1, 0, '296595715151.png', 'Toy Show 2019.pdf', NULL, '2019-01-13 18:53:15', '2019-01-13 18:53:15'),
(912, 15, 152, 'Mr', 'Tanvir', 'Qureshee', NULL, NULL, NULL, NULL, '0181716', 1, '', '', '', 'tanveerqureshee1@gmail.com', '928537815152', 'visitor', 1, 1, 1, 0, '928537815152.png', 'Toy Show 2019.pdf', NULL, '2019-01-13 18:54:27', '2019-01-13 18:54:27'),
(913, 15, 153, 'Mr', 'Tanvir', 'Qureshee', NULL, NULL, NULL, NULL, '0181716', 1, '', '', '', 'tanveerqureshee1@gmail.com', '147900515153', 'visitor', 1, 1, 1, 0, '147900515153.png', 'Toy Show 2019.pdf', NULL, '2019-01-13 19:03:09', '2019-01-13 19:03:09'),
(914, 15, 154, 'Mr', 'Tanvir', 'Qureshee', NULL, NULL, NULL, NULL, '0181716', 1, '', '', '', 'tanveerqureshee1@gmail.com', '091709915154', 'visitor', 1, 1, 1, 0, '091709915154.png', 'Toy Show 2019.pdf', NULL, '2019-01-13 19:04:48', '2019-01-13 19:04:48'),
(915, 15, 155, 'Mr', 'Tanvir', 'Qureshee', NULL, NULL, NULL, NULL, '0181716', 1, '', '', '', 'tanveerqureshee1@gmail.com', '366542215155', 'visitor', 1, 1, 1, 0, '366542215155.png', 'Toy Show 2019.pdf', NULL, '2019-01-13 19:10:28', '2019-01-13 19:10:28'),
(916, 15, 156, 'Mr', 'Tanvir', 'Qureshee', NULL, NULL, NULL, NULL, '0181716', 1, '', '', '', 'tanveerqureshee1@gmail.com', '634956615156', 'visitor', 1, 1, 1, 0, '634956615156.png', 'Toy Show 2019.pdf', NULL, '2019-01-13 19:15:28', '2019-01-13 19:15:28'),
(917, 15, 157, 'Mr', 'v', 'b', NULL, NULL, NULL, NULL, '45', 1, '', '', '', 'tanveerqureshee1@gmail.com', '735746015157', 'visitor', 1, 1, 1, 0, '735746015157.png', 'Toy Show 2019.pdf', NULL, '2019-01-13 19:28:28', '2019-01-13 19:28:28'),
(918, 15, 158, 'Mr', 'Tanveer', 'Qureshee', NULL, NULL, NULL, NULL, '094857', 1, '', '', '', 'tanveerqureshee1@gmail.com', '416794115158', 'visitor', 1, 1, 1, 0, '416794115158.png', 'Toy Show 2019.pdf', NULL, '2019-01-13 20:11:29', '2019-01-13 20:11:29'),
(919, 15, 159, 'Mr', 'Tanveer', 'Qureshee', NULL, NULL, NULL, NULL, '094857', 1, '', '', '', 'tanveerqureshee1@gmail.com', '789847715159', 'visitor', 1, 1, 1, 0, '789847715159.png', 'Toy Show 2019.pdf', NULL, '2019-01-13 20:49:45', '2019-01-13 20:49:45'),
(920, 15, 160, 'Mr', 'Fakhrul', 'Islam', NULL, NULL, 'Male', NULL, '09098', 2, '', '', '', 'tanveerqureshee1@gmail.com', '968260115160', 'visitor', 1, 1, 1, 0, '968260115160.png', 'Toy Show 2019.pdf', NULL, '2019-01-13 20:55:52', '2019-01-13 20:55:52'),
(921, 15, 161, 'Mr', 'Saif', 'Mehbub', NULL, NULL, 'Male', NULL, '09123', 1, '', '', '', 'tanveerqureshee1@gmail.com', '451527115161', 'visitor', 1, 1, 1, 0, '451527115161.png', 'Toy Show 2019.pdf', NULL, '2019-01-21 02:40:45', '2019-01-21 02:40:45'),
(922, 15, 162, 'Mr', 'Tanveer', 'Qureshee', NULL, NULL, NULL, NULL, '0171', 1, '', '', '', 'tanveerqureshee@hotmail.com', '243224115162', 'visitor', 1, 1, 1, 0, '243224115162.png', 'Toy Show 2019.pdf', NULL, '2019-01-21 02:52:34', '2019-01-21 02:52:34'),
(923, 15, 163, 'Mr', 'Salman', 'Muktadir', NULL, NULL, NULL, NULL, '017166', 1, '', '', '', 'tanveerqureshee1@gmail.com', '151533515163', 'visitor', 1, 1, 1, 0, '151533515163.png', 'Toy Show 2019.pdf', NULL, '2019-01-21 03:02:23', '2019-01-21 03:02:23'),
(924, 15, 164, 'Mr', 'ASDGASG', 'SDGASDG', NULL, NULL, 'Male', NULL, '45634573547', 1, '', '', '', 'ZETEO87@GMAIL.COM', '157686215164', 'visitor', 1, 1, 1, 0, '157686215164.png', 'Toy Show 2019.pdf', NULL, '2019-01-21 23:50:44', '2019-01-21 23:50:44'),
(925, 16, 165, 'Mr', 'kjsdbgkjasbg', 'jksjg', NULL, NULL, NULL, NULL, '3462362457', 1, '', '', '', 'zeteo87@gmail.com', '129026916165', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:04:31', '2019-01-23 22:04:31'),
(926, 16, 165, 'Mr', 'sdgsg', 'sdgsdg', NULL, NULL, NULL, NULL, '235436346', 3, '', '', '', 'zeteo87@gmail.com', '920725316165', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:04:31', '2019-01-23 22:04:31'),
(927, 16, 165, 'Ms', '2egasgasg', 'asdgasgdsag', NULL, NULL, 'Male', NULL, '45236452364', 4, '', '', '', 'asd@asd.com', '504668316165', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:04:31', '2019-01-23 22:04:31'),
(928, 16, 166, 'Mr', 'kjsdbgkjasbg', 'jksjg', NULL, NULL, NULL, NULL, '3462362457', 1, '', '', '', 'zeteo87@gmail.com', '893641716166', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:04:38', '2019-01-23 22:04:38'),
(929, 16, 166, 'Mr', 'sdgsg', 'sdgsdg', NULL, NULL, NULL, NULL, '235436346', 3, '', '', '', 'zeteo87@gmail.com', '130160616166', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:04:38', '2019-01-23 22:04:38'),
(930, 16, 166, 'Ms', '2egasgasg', 'asdgasgdsag', NULL, NULL, 'Male', NULL, '45236452364', 4, '', '', '', 'asd@asd.com', '376535316166', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:04:38', '2019-01-23 22:04:38'),
(931, 16, 167, 'Mr', 'kjsdbgkjasbg', 'jksjg', NULL, NULL, NULL, NULL, '3462362457', 1, '', '', '', 'zeteo87@gmail.com', '579511416167', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:04:59', '2019-01-23 22:04:59'),
(932, 16, 167, 'Mr', 'sdgsg', 'sdgsdg', NULL, NULL, NULL, NULL, '235436346', 3, '', '', '', 'zeteo87@gmail.com', '736812116167', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:04:59', '2019-01-23 22:04:59'),
(933, 16, 167, 'Ms', '2egasgasg', 'asdgasgdsag', NULL, NULL, 'Male', NULL, '45236452364', 4, '', '', '', 'asd@asd.com', '896558016167', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:04:59', '2019-01-23 22:04:59'),
(934, 16, 168, 'Mr', 'kjsdbgkjasbg', 'jksjg', NULL, NULL, NULL, NULL, '3462362457', 1, '', '', '', 'zeteo87@gmail.com', '931112516168', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:04:59', '2019-01-23 22:04:59'),
(935, 16, 168, 'Mr', 'sdgsg', 'sdgsdg', NULL, NULL, NULL, NULL, '235436346', 3, '', '', '', 'zeteo87@gmail.com', '713006916168', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:04:59', '2019-01-23 22:04:59'),
(936, 16, 168, 'Ms', '2egasgasg', 'asdgasgdsag', NULL, NULL, 'Male', NULL, '45236452364', 4, '', '', '', 'asd@asd.com', '836873716168', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:04:59', '2019-01-23 22:04:59'),
(937, 16, 169, 'Mr', 'kjsdbgkjasbg', 'jksjg', NULL, NULL, NULL, NULL, '3462362457', 1, '', '', '', 'zeteo87@gmail.com', '880179916169', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:06:58', '2019-01-23 22:06:58'),
(938, 16, 169, 'Mr', 'sdgsg', 'sdgsdg', NULL, NULL, NULL, NULL, '235436346', 3, '', '', '', 'zeteo87@gmail.com', '070762816169', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:06:58', '2019-01-23 22:06:58'),
(939, 16, 169, 'Ms', '2egasgasg', 'asdgasgdsag', NULL, NULL, 'Male', NULL, '45236452364', 4, '', '', '', 'asd@asd.com', '277180716169', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:06:58', '2019-01-23 22:06:58'),
(940, 16, 170, 'Mr', 'kjsdbgkjasbg', 'jksjg', NULL, NULL, NULL, NULL, '3462362457', 1, '', '', '', 'zeteo87@gmail.com', '851660316170', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:06:59', '2019-01-23 22:06:59'),
(941, 16, 170, 'Mr', 'sdgsg', 'sdgsdg', NULL, NULL, NULL, NULL, '235436346', 3, '', '', '', 'zeteo87@gmail.com', '349635616170', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:06:59', '2019-01-23 22:06:59'),
(942, 16, 170, 'Ms', '2egasgasg', 'asdgasgdsag', NULL, NULL, 'Male', NULL, '45236452364', 4, '', '', '', 'asd@asd.com', '145865516170', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:06:59', '2019-01-23 22:06:59'),
(943, 16, 171, 'Mr', 'kjsdbgkjasbg', 'jksjg', NULL, NULL, NULL, NULL, '3462362457', 1, '', '', '', 'zeteo87@gmail.com', '777364216171', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:06:59', '2019-01-23 22:06:59'),
(944, 16, 171, 'Mr', 'sdgsg', 'sdgsdg', NULL, NULL, NULL, NULL, '235436346', 3, '', '', '', 'zeteo87@gmail.com', '630824416171', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:06:59', '2019-01-23 22:06:59'),
(945, 16, 171, 'Ms', '2egasgasg', 'asdgasgdsag', NULL, NULL, 'Male', NULL, '45236452364', 4, '', '', '', 'asd@asd.com', '802974816171', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:06:59', '2019-01-23 22:06:59'),
(946, 16, 172, 'Ms', 'afdf', 'asdfasdg', NULL, NULL, NULL, NULL, '1252543', 1, '', '', '', 'zeteo87@gmail.com', '818034616172', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:08:51', '2019-01-23 22:08:51'),
(947, 16, 172, 'Ms', 'ebsdgng', 'sdgnsgns', NULL, NULL, NULL, NULL, '3452362356', 2, '', '', '', 'asd@asd.com', '232128516172', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:08:51', '2019-01-23 22:08:51'),
(948, 16, 173, 'Ms', 'afdf', 'asdfasdg', NULL, NULL, NULL, NULL, '1252543', 1, '', '', '', 'zeteo87@gmail.com', '825024316173', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:09:24', '2019-01-23 22:09:24'),
(949, 16, 173, 'Ms', 'ebsdgng', 'sdgnsgns', NULL, NULL, NULL, NULL, '3452362356', 2, '', '', '', 'asd@asd.com', '334660516173', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:09:24', '2019-01-23 22:09:24'),
(950, 16, 174, 'Mr', 'Tanveer', 'Qureshee', NULL, NULL, 'Male', NULL, '018', 1, '', '', '', 'tanveerqureshee1@gmail.com', '495006216174', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:21:45', '2019-01-23 22:21:45'),
(951, 16, 174, 'Ms', 'Meghna', 'Jahan', NULL, NULL, NULL, NULL, '9098', 2, '', '', '', 'tanveerqureshee@hotmail.com', '824722316174', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:21:45', '2019-01-23 22:21:45'),
(952, 16, 175, 'Mr', 'Tanveer', 'Qureshee', NULL, NULL, 'Male', NULL, '018', 1, '', '', '', 'tanveerqureshee1@gmail.com', '381809516175', 'visitor', 1, 1, 1, 0, '381809516175.png', 'Singapore Show.pdf', NULL, '2019-01-23 22:28:53', '2019-01-23 22:28:53'),
(953, 16, 175, 'Ms', 'Meghna', 'Jahan', NULL, NULL, NULL, NULL, '9098', 2, '', '', '', 'tanveerqureshee@hotmail.com', '830803416175', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:28:53', '2019-01-23 22:28:53'),
(954, 16, 176, 'Mr', 'ddc', 'dcf', NULL, NULL, NULL, NULL, '23', 1, '', '', '', 'tanveerqureshee1@gmail.com', '956942716176', 'visitor', 1, 1, 1, 0, '956942716176.png', 'Singapore Show.pdf', NULL, '2019-01-23 22:32:02', '2019-01-23 22:32:02'),
(955, 16, 177, 'Mr', 'Tan', 'Ji', NULL, NULL, NULL, NULL, '123', 2, '', '', '', 'tanveerqureshee1@gmail.com', '499320816177', 'visitor', 1, 1, 1, 0, '499320816177.png', 'Singapore Show.pdf', NULL, '2019-01-23 22:36:27', '2019-01-23 22:36:27'),
(956, 16, 177, 'Ms', 'megh', 'Na', NULL, NULL, NULL, NULL, '234', 1, '', '', '', 'tanveerqureshee@hotmail.com', '823251616177', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:36:27', '2019-01-23 22:36:27'),
(957, 16, 178, 'Mr', 'Tan', 'Ji', NULL, NULL, NULL, NULL, '123', 2, '', '', '', 'tanveerqureshee1@gmail.com', '947247916178', 'visitor', 1, 1, 1, 0, '947247916178.png', 'Singapore Show947247916178.pdf', NULL, '2019-01-23 22:51:13', '2019-01-23 22:51:13'),
(958, 16, 178, 'Ms', 'megh', 'Na', NULL, NULL, NULL, NULL, '234', 1, '', '', '', 'tanveerqureshee@hotmail.com', '027126816178', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 22:51:13', '2019-01-23 22:51:13'),
(959, 16, 179, 'Mr', 'Tan', 'Ji', NULL, NULL, NULL, NULL, '123', 2, '', '', '', 'tanveerqureshee1@gmail.com', '184324516179', 'visitor', 1, 1, 1, 0, '184324516179.png', 'Singapore Show184324516179.pdf', NULL, '2019-01-23 23:01:20', '2019-01-23 23:01:20'),
(960, 16, 179, 'Ms', 'megh', 'Na', NULL, NULL, NULL, NULL, '234', 1, '', '', '', 'tanveerqureshee@hotmail.com', '774146316179', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 23:01:20', '2019-01-23 23:01:20'),
(961, 16, 180, 'Ms', 'cv', 'bv', NULL, NULL, NULL, NULL, '44', 1, '', '', '', 'tanveerqureshee1@gmail.com', '596513616180', 'visitor', 1, 1, 1, 0, '596513616180.png', 'Singapore Show596513616180.pdf', NULL, '2019-01-23 23:04:31', '2019-01-23 23:04:31'),
(962, 16, 180, 'Mr', 'bn', 'gh', NULL, NULL, NULL, NULL, '56', 2, '', '', '', 'tanveerqureshee@hotmail.com', '263238516180', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 23:04:31', '2019-01-23 23:04:31'),
(963, 16, 181, 'Ms', 'cv', 'bv', NULL, NULL, NULL, NULL, '44', 1, '', '', '', 'tanveerqureshee1@gmail.com', '000962716181', 'visitor', 1, 1, 1, 0, '000962716181.png', 'Singapore Show000962716181.pdf', NULL, '2019-01-23 23:11:39', '2019-01-23 23:11:39'),
(964, 16, 181, 'Mr', 'bn', 'gh', NULL, NULL, NULL, NULL, '56', 2, '', '', '', 'tanveerqureshee@hotmail.com', '379097516181', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 23:11:39', '2019-01-23 23:11:39'),
(965, 16, 182, 'Ms', 'cv', 'bv', NULL, NULL, NULL, NULL, '44', 1, '', '', '', 'tanveerqureshee1@gmail.com', '438994616182', 'visitor', 1, 1, 1, 0, '438994616182.png', 'Singapore Show438994616182.pdf', NULL, '2019-01-23 23:11:45', '2019-01-23 23:11:45'),
(966, 16, 182, 'Mr', 'bn', 'gh', NULL, NULL, NULL, NULL, '56', 2, '', '', '', 'tanveerqureshee@hotmail.com', '829276916182', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 23:11:45', '2019-01-23 23:11:45'),
(967, 16, 183, 'Mr', 'Tanveer', 'Qureshee', NULL, NULL, NULL, NULL, '017166', 1, '', '', '', 'tanveerqureshee1@gmail.com', '324774716183', 'visitor', 1, 1, 1, 0, '324774716183.png', 'Singapore Show324774716183.pdf', NULL, '2019-01-23 19:11:00', '2019-01-23 19:11:00'),
(968, 16, 183, 'Ms', 'Meghna', 'jahan', NULL, NULL, NULL, NULL, '8987', 1, '', '', '', 'mjahanmeghna@gmail.com', '487054116183', 'visitor', 1, 1, 1, 0, NULL, NULL, NULL, '2019-01-23 19:11:00', '2019-01-23 19:11:00');

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
(26, 16, 'Profession', '[{\"type\":\"header\",\"subtype\":\"h1\",\"label\":\"Visitor Registration Form\"},{\"type\":\"paragraph\",\"subtype\":\"p\",\"label\":\"By submitting this form, you have consented to be on our mailing list and will recive updates related to XYZ from time to time via emails, phone and mail.\"},{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"You are registering to visit OEA\",\"name\":\"You-are-registering-to-visit-OEA\",\"other\":true,\"values\":[{\"label\":\"SGPFair\",\"value\":\"SGPFair\"},{\"label\":\"Print+Pack+Sign\",\"value\":\"Print+Pack+Sign\"}]},{\"type\":\"radio-group\",\"label\":\"Gender\",\"name\":\"Gender\",\"values\":[{\"label\":\"Male\",\"value\":\"Male\"},{\"label\":\"Female\",\"value\":\"Female\"},{\"label\":\"Complicated\",\"value\":\"Complicared\"}]},{\"type\":\"select\",\"required\":true,\"label\":\"What do you like?\",\"className\":\"form-control\",\"name\":\"What-do-you-like\",\"values\":[{\"label\":\"Apple\",\"value\":\"Apple\",\"selected\":true},{\"label\":\"Orange\",\"value\":\"Orange\"},{\"label\":\"Durian\",\"value\":\"Durian\"}]}]', '2019-01-23 22:08:11', '2019-01-23 22:08:11');

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
(311, 183, 16, 26, 'mjahanmeghna@gmail.com', 'What do you like', 'Orange', '2019-01-23 19:11:00', '2019-01-23 19:11:00');

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
(19, 12, 'Badge', '01-24-2019_name_badge_template_0_1548319569.jpg', '2019-01-24 00:46:09', '2019-01-24 00:46:09');

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
(12, 16, '90', '135', NULL, '', 'mm', '2019-01-24 00:46:09', '2019-01-24 00:46:09');

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
(133, 'Default', 'defaultEventNameBadge1', 11, 15, '', NULL, NULL, NULL, NULL, NULL, '2019-01-14 06:44:18', '2019-01-14 06:44:18');

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
(266, 26, 16, 'mjahanmeghna@gmail.com', '55729332589729bc15e3821fff7065c8', '{\"You-are-registering-to-visit-OEA\":[\"Print+Pack+Sign\"],\"Gender\":\"on\",\"What-do-you-like\":\"Orange\"}', '2019-01-23 19:10:34', '2019-01-23 19:10:34');

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
(8, '15', '<p>Hi {$first_name}&nbsp; {$last_name}<br /><br /><strong>Congratulation</strong>! You have successfully registered for the {$event_title}</p>', 'text', 'pdf_text');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `event_business_owners`
--
ALTER TABLE `event_business_owners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `event_business_owners_details`
--
ALTER TABLE `event_business_owners_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=969;

--
-- AUTO_INCREMENT for table `event_forms`
--
ALTER TABLE `event_forms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `event_registeration_form_values`
--
ALTER TABLE `event_registeration_form_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=312;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `name_badge_config`
--
ALTER TABLE `name_badge_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `name_badge_position`
--
ALTER TABLE `name_badge_position`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `print_layout_config`
--
ALTER TABLE `print_layout_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registraion_temp`
--
ALTER TABLE `registraion_temp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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