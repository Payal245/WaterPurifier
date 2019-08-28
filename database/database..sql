-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.48 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5222
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for waterpurifier_db
CREATE DATABASE IF NOT EXISTS `waterpurifier_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `waterpurifier_db`;

-- Dumping structure for table waterpurifier_db.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.auth_permission: ~42 rows (approximately)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can add permission', 2, 'add_permission'),
	(5, 'Can change permission', 2, 'change_permission'),
	(6, 'Can delete permission', 2, 'delete_permission'),
	(7, 'Can add group', 3, 'add_group'),
	(8, 'Can change group', 3, 'change_group'),
	(9, 'Can delete group', 3, 'delete_group'),
	(10, 'Can add user', 4, 'add_user'),
	(11, 'Can change user', 4, 'change_user'),
	(12, 'Can delete user', 4, 'delete_user'),
	(13, 'Can add content type', 5, 'add_contenttype'),
	(14, 'Can change content type', 5, 'change_contenttype'),
	(15, 'Can delete content type', 5, 'delete_contenttype'),
	(16, 'Can add session', 6, 'add_session'),
	(17, 'Can change session', 6, 'change_session'),
	(18, 'Can delete session', 6, 'delete_session'),
	(19, 'Can add role details', 7, 'add_roledetails'),
	(20, 'Can change role details', 7, 'change_roledetails'),
	(21, 'Can delete role details', 7, 'delete_roledetails'),
	(22, 'Can add descriptions', 8, 'add_descriptions'),
	(23, 'Can change descriptions', 8, 'change_descriptions'),
	(24, 'Can delete descriptions', 8, 'delete_descriptions'),
	(25, 'Can add modals', 9, 'add_modals'),
	(26, 'Can change modals', 9, 'change_modals'),
	(27, 'Can delete modals', 9, 'delete_modals'),
	(28, 'Can add purifier brands', 10, 'add_purifierbrands'),
	(29, 'Can change purifier brands', 10, 'change_purifierbrands'),
	(30, 'Can delete purifier brands', 10, 'delete_purifierbrands'),
	(31, 'Can add features', 11, 'add_features'),
	(32, 'Can change features', 11, 'change_features'),
	(33, 'Can delete features', 11, 'delete_features'),
	(34, 'Can add service charges', 12, 'add_servicecharges'),
	(35, 'Can change service charges', 12, 'change_servicecharges'),
	(36, 'Can delete service charges', 12, 'delete_servicecharges'),
	(37, 'Can add aquagaurd_parts', 13, 'add_aquagaurd_parts'),
	(38, 'Can change aquagaurd_parts', 13, 'change_aquagaurd_parts'),
	(39, 'Can delete aquagaurd_parts', 13, 'delete_aquagaurd_parts'),
	(40, 'Can add top brands', 14, 'add_topbrands'),
	(41, 'Can change top brands', 14, 'change_topbrands'),
	(42, 'Can delete top brands', 14, 'delete_topbrands');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.auth_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.backend_panel_aquagaurd_parts
CREATE TABLE IF NOT EXISTS `backend_panel_aquagaurd_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) DEFAULT NULL,
  `quality` varchar(225) DEFAULT NULL,
  `image` varchar(225) DEFAULT NULL,
  `price` varchar(225) DEFAULT NULL,
  `Desc` varchar(225) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `backend_panel_aquaga_company_id_0cc781d6_fk_backend_p` (`company_id`),
  CONSTRAINT `backend_panel_aquaga_company_id_0cc781d6_fk_backend_p` FOREIGN KEY (`company_id`) REFERENCES `backend_panel_purifierbrands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.backend_panel_aquagaurd_parts: ~2 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_aquagaurd_parts` DISABLE KEYS */;
INSERT INTO `backend_panel_aquagaurd_parts` (`id`, `name`, `quality`, `image`, `price`, `Desc`, `company_id`) VALUES
	(1, 'pipe', 'low', 'alchol_homo.PNG', 'Rs. 300', 'good', 4),
	(2, 'filter', 'low', 'Water Purifier-en.jpg', 'rs 100', 'good', 5);
/*!40000 ALTER TABLE `backend_panel_aquagaurd_parts` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.backend_panel_descriptions
CREATE TABLE IF NOT EXISTS `backend_panel_descriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(225) DEFAULT NULL,
  `modal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_panel_descri_modal_id_25e97cf5_fk_backend_p` (`modal_id`),
  CONSTRAINT `backend_panel_descri_modal_id_25e97cf5_fk_backend_p` FOREIGN KEY (`modal_id`) REFERENCES `backend_panel_modals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.backend_panel_descriptions: ~126 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_descriptions` DISABLE KEYS */;
INSERT INTO `backend_panel_descriptions` (`id`, `description`, `modal_id`) VALUES
	(9, 'RO, 7 Stage Purification', 5),
	(10, 'Mineraliser Technology balances the pH of the water & adds essential minerals', 5),
	(11, 'Advanced Alerts for Filter Change', 5),
	(12, 'India\'s First RO with hot water option', 5),
	(13, 'India\'s first RO with Night Assist', 5),
	(14, 'Intelligent Digital Display', 5),
	(15, '8 Stage Water Purification', 6),
	(16, 'Intelligent Digital Display', 6),
	(17, 'Advance Alerts for Filter & RO Membrane Change', 6),
	(18, '1 Year Comprehensive Warranty', 6),
	(19, 'Saves 2X More Water', 6),
	(20, '9 Litres Storage and Purification Capacity of up to 15 Litres/hour', 6),
	(21, 'Purified Hot Water at a Press of a Button', 7),
	(22, 'Glows in the Dark', 7),
	(23, 'Intelligent Digital Display', 7),
	(24, 'Advance Alerts for Filter & RO Membrane Change', 7),
	(25, 'Purified Hot Water at a Press of a Button', 8),
	(26, 'Glows in the Dark', 8),
	(27, 'Intelligent Digital Display', 8),
	(28, 'UV Fail Alert', 8),
	(29, 'RO with 7 Stage Purification', 9),
	(30, 'Storage capacity of 9 litres', 9),
	(31, 'Advance alert for Sediment + Pre Carbon filter and RO membrane + other filter change', 9),
	(32, 'ColourMatch System® to suit your kitchen décor', 9),
	(33, 'Suitable for water with low and high (up to 2000 ppm) TDS', 9),
	(34, 'RO, 7 Stage Purification', 10),
	(35, 'India\'s First RO with hot water option', 10),
	(36, 'Mineraliser Technology balances the pH of the water & adds essential minerals', 10),
	(37, 'India\'s first RO with Night Assist', 10),
	(38, 'Advanced Alerts for Filter Change', 10),
	(39, 'Intelligent Digital Display', 10),
	(40, 'Improves taste of water', 11),
	(41, 'Triple protection of RO+UV+UF makes it completely safe and pure', 11),
	(42, 'Twin-mode tap controller', 11),
	(43, 'Suitable for any type of water', 12),
	(44, 'Adjust the purification process', 12),
	(45, 'Displays the water level in the storage tank', 12),
	(46, 'The taste modulator lets you set the taste as per preference', 12),
	(47, 'Highly attractive design', 12),
	(48, 'Works for All Water Sources', 13),
	(49, 'Purified Water Storage Capacity of 8 Liters', 13),
	(50, 'Purification Capacity of 15 Liters/hour', 13),
	(51, '6 Stage RO+UV+MTDS purification', 14),
	(52, 'Compact & Lightweight', 14),
	(53, 'Price', 14),
	(54, 'Suitable for municipal tap water with TDS level of up to 200 ppm', 15),
	(55, '6.5 liters Purified water storage capacity', 15),
	(56, 'Smart LED Indicators for Filter Change and Service Alerts', 15),
	(57, 'Modern, Attractive Design', 15),
	(58, '7 Stage RO+UV+MP+MTDS purification', 16),
	(59, 'Clean & compact design', 16),
	(60, 'RO Membrane life enhancer', 16),
	(61, 'Aqua Taste Booster', 17),
	(62, '6 Stage Purification with RO+UV', 17),
	(63, 'Child Lock Button', 16),
	(64, 'Low Pressure Alert and UV Fail Alert', 16),
	(65, 'Purification Capacity of up to 12 litres/hour', 17),
	(66, 'Aqua Taste Booster', 18),
	(67, '6 Stage Purification with RO+UF', 18),
	(68, 'Child Lock Button', 18),
	(69, 'Low Pressure Alert', 18),
	(70, 'Purification Capacity of up to 12 litres/hour', 18),
	(71, 'Hot, Cold and Normal Water Dispensing', 19),
	(72, '8.2 Litres Large Storage Tank', 19),
	(73, 'Purification Capacity of 10 Litres/Hour', 19),
	(74, 'Auto Clean Function', 19),
	(75, 'Electronic Dispensing Button', 19),
	(76, 'Child Lock Function', 19),
	(77, 'RO+UV, 6 Stage Purification', 20),
	(78, 'Sleek & Stylish', 20),
	(79, 'Child lock button on the tap', 20),
	(80, 'UV Fail/Change Alert', 21),
	(81, 'Filter Change Alert', 21),
	(82, 'Advanced UV purification with Stainless Steel UV Chamber', 21),
	(83, 'Purification Capacity of 2 Litres/Minute', 21),
	(84, 'Elegant Modern Design', 21),
	(85, 'Purification Capacity of up to 12 Litres/Hour', 22),
	(86, 'Touch Screen Controls and Display', 22),
	(87, 'Speech Assistance', 22),
	(88, '1-litre/1-glass/Continuous Flow Dispensing Option', 22),
	(89, 'Day/Time Display', 22),
	(90, 'Filter Change Alerts', 22),
	(91, 'Good Storage Capacity', 23),
	(92, 'Less Water Wastage', 23),
	(93, 'TDS Controller Adds Essential Minerals Post purification', 23),
	(94, 'Suitable for Water from all Sources', 23),
	(95, 'Suitable for Water from all Sources', 24),
	(96, 'TDS Controller Retains Essential Minerals in Purified Water', 24),
	(97, 'Stores Up to 8 Litres of Purified Water', 24),
	(98, 'Alarms for UV Fail and Filter Change', 24),
	(99, 'Double purification with TDS Control for purity & great taste', 25),
	(100, 'Purifies water really fast', 25),
	(101, 'Nice compact design', 25),
	(102, 'Handles long range of voltage fluctuations', 25),
	(103, 'Double purification using UV+UF', 26),
	(104, 'Filter change alarm and UV fail alarm', 26),
	(105, 'Detachable storage tank', 26),
	(106, 'High Storage Capacity of 7 Liters', 27),
	(107, 'Double Purification with UV+UF', 27),
	(108, 'Activated Carbon Pre-Filter', 27),
	(109, 'UV Fail & Filter change alarm alert', 27),
	(110, 'Water level indicator in the storage tank', 27),
	(111, 'Under the Counter or Under the Sink Installation', 28),
	(112, 'Suitable for Water from all Sources', 28),
	(113, 'TDS Controller Retains Essential Minerals in Purified Water', 28),
	(114, 'Stores Up to 7 Litres of Purified Water', 28),
	(115, 'Alarms for UV Fail and Filter Change', 28),
	(116, '6-stage purification means safe, clean and tasty water', 29),
	(117, 'Sleek & compact design', 29),
	(118, 'Retains essential minerals after purification', 29),
	(119, 'RO+UV+UF Purification with Taste Enhancer', 30),
	(120, 'Compact and Elegant Design', 30),
	(121, '7 Stage advanced purification', 30),
	(122, 'Works up to 2000 TDS Level', 30),
	(123, 'RO+UV+UF Purification with Taste Enhancer', 31),
	(124, 'Clean, Compact Design with Touch Interface', 31),
	(125, 'Multiple dispensing options', 31),
	(126, 'Attractive price', 31),
	(127, '4 Stage UV+UF Purification', 32),
	(128, 'Compact & Stylish Design', 32),
	(129, 'UV Fail Alarm', 32),
	(130, 'Purification Capacity of up to 60 Litres/hour', 32),
	(131, '6 Stage Purification Technology', 33),
	(132, 'Nice clean design and compact', 33),
	(133, '6 Stage Purification Technology', 34),
	(134, 'Nice clean design and compact', 34);
/*!40000 ALTER TABLE `backend_panel_descriptions` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.backend_panel_features
CREATE TABLE IF NOT EXISTS `backend_panel_features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `features` varchar(1000) DEFAULT NULL,
  `modal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_panel_featur_modal_id_642e230e_fk_backend_p` (`modal_id`),
  CONSTRAINT `backend_panel_featur_modal_id_642e230e_fk_backend_p` FOREIGN KEY (`modal_id`) REFERENCES `backend_panel_modals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.backend_panel_features: ~214 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_features` DISABLE KEYS */;
INSERT INTO `backend_panel_features` (`id`, `features`, `modal_id`) VALUES
	(1, '1.WQA certified patented side stream RO membrane', 5),
	(2, 'Twin Advance Alert for Filters: Digital display tell you in advance when the RO membrane and other filters have to be changed', 5),
	(3, 'Purity through 7-stage purification technology, pre-filter, sediment filter, pre-carbon filter, side-stream RO membrane, min-tech, silver activated post-carbon, silver charge membrane technology and 100 percent of the water passes through the RO membrane and min-tech technology ensures addition of essential minerals in drinking water', 5),
	(4, 'Mineralised hot water at the press of a button and it is useful for preparing a quick cup of tea, baby food, soaking lentils, soothing a sore throat etc', 5),
	(5, 'It looks very beautiful and is useful when you wake up for water in the night', 5),
	(6, 'Warranty: 2 years on product', 5),
	(7, 'Purification through 8 Stages: A.O Smith X8 uses 8 Stage Purification Technology: Pre-filter + Sediment filter + Carbon block + ART™ (Advance Recovery Technology™) + Patented Side Stream RO Membrane + MIN-TECH (Mineraliser Technology) + ZX Double Protection Dual Filter* (Silver Activated Post Carbon block + SCMT). 100% of the water passes through the RO Membrane and Double Purified by SCMT.', 6),
	(8, 'Advance Recovery Technology: A.O Smith X8 uses A.O Smith’s breakthrough Advance Recovery Technology™ to recover up to 55% of water, while ensuring 100% RO purification. Most of the other 100% RO purifiers in India offer only 20-25% water recovery', 6),
	(9, 'SCMT (Silver Charged Membrane Technology): SCMT is an additional stage of purification, used post RO and Mineraliser, to remove any and all traces of micro-organic impurities. Double protection of RO and SCMT gives you 100% assurance of clean and pure water', 6),
	(10, 'MIN-TECH (Mineraliser Technology): The Mineraliser Technology adds essential minerals to the water post RO purification. This makes the water taste fresh and natural with balanced pH – what you get is 100% pure and healthy water', 6),
	(11, 'Ultra Modern Design: AO Smith X8 water purifier is a perfect fit to suit your modern lifestyle and complements the décor of your modular kitchen. Knob for dispensing water (most purifiers have regular tap) and Spill tray make the design truly unique.', 6),
	(12, 'Advance Alert Technology: AO Smith X8 alerts you well in advance when the RO membrane or any of the filters needs to be replaced', 6),
	(13, 'Convenient Installation: With option for both wall mounting & table top, A.O Smith X8 gives you complete freedom to use it the way you want to and wherever you want to.', 6),
	(14, 'High Purification Capacity: Up to 15 litres per hour.', 6),
	(15, 'Warranty: AO Smith X8 comes with a comprehensive warranty of 1 year that covers all the filters and RO membrane.', 6),
	(16, 'Purification Technology: 8 Stage RO purification with Mineraliser. Pre-filter + Sediment filter + Carbon block + ART™ (Advance Recovery Technology™) + Patented Side Stream RO Membrane + MIN-TECH (Mineraliser Technology) + ZX Double Protection Dual Filter*(SAPC + SCMT)', 7),
	(17, 'Storage Capacity: Purified water storage capacity of 10 Liters – 9.2 Liters + 0.8 Liters (purified hot water) 3.Hot Purified Water: Get hot purified water at a press of a button. This feature is very useful in winters and for places with cold weather', 7),
	(18, 'Mineraliser Technology: Mineraliser Technology adds essential minerals in the purified water. The purified water tastes fresh and has balanced pH', 7),
	(19, 'ART (ADVANCE RECOVERY TECHNOLOGY): With breakthrough Advance Recovery Technology save 2X water than an ordinary RO water purifer, while ensuring 100% RO purification.', 7),
	(20, 'Night Assist: India’s first RO equipped with with Night assist, glow effect guides you to your water purifier at night and makes your kitchen look good.', 7),
	(21, 'Advance Alert System: Get alerts in advance for RO membrane and other filters change', 7),
	(22, 'Warranty: 1 Years Comprehensive Warranty including all filters and RO Membrane from AO Smith.', 7),
	(23, 'Purification Technology: 5 Stage purification with UV, water passes through Pre-filter + Sediment filter + Silver Activated Post Carbon + UV Lamp + Ultra Fine Stainless Steel Tank (For Hot water only) to give you healthy drinking water', 8),
	(24, 'Storage Capacity: Total purified water storage capacity of 10 Liters – 9.2 Liters (normal water) + 0.8 Liters (hot water)', 8),
	(25, 'Hot Purified Water: Get hot purified water at the press of a button. This feature is very useful in winters and for places with cold weather.', 8),
	(26, 'Night Assist: Equipped with Night assist, glow effect guides you to your water purifier at night and makes your kitchen look good.', 8),
	(27, 'UV Life Alert: Indicates in advance when the UV Lamp needs to be changed.', 8),
	(28, 'Recommended For: Water with low TDS up to 200 ppm and hardness up to 120ppm', 8),
	(29, 'Advanced Pre-Filter & Sediment Filter: Removes suspended solids and sediment from water quite effectively.', 8),
	(30, 'Digital Display: Digital display for simple and intelligent display of information', 8),
	(31, 'Warranty: 1 Year Warranty from AO Smith', 8),
	(32, 'Purity through 7-stage purification technology, pre-filter, sediment filter, pre carbon filter, side-stream RO membrane, min-tech, silver activated post carbon, silver charge membrane technology and 100 percent of the water passes through the RO membrane and min-tech technology ensures addition of essential minerals in drinking water.', 9),
	(33, 'WQA certified patented side stream RO membrane.', 9),
	(34, 'Easy Placement: The A.O. Smith RO water purifiers come with the dual convenience of wall mounting or being used as table top options as per space available.', 9),
	(35, 'Storage Capacity: Pure water storage capacity of 9 litres.', 9),
	(36, 'A.O.Smith X7 RO water purifiers come with the unique colour match system to match your kitchen decor.', 9),
	(37, 'Twin Advance Alert for Filters: Digital display tells you in advance when the RO membrane and other filters have to be changed.', 9),
	(38, 'Digital Display: For simple and intelligent display of information.', 9),
	(39, 'Warranty: 2 years on product', 9),
	(40, 'WQA certified patented side stream RO membrane', 10),
	(41, 'Twin Advance Alert for Filters: Digital display tell you in advance when the RO membrane and other filters have to be changed', 10),
	(42, 'Purity through 7-stage purification technology, pre-filter, sediment filter, pre-carbon filter, side-stream RO membrane, min-tech, silver activated post-carbon, silver charge membrane technology and 100 percent of the water passes through the RO membrane and min-tech technology ensures addition of essential minerals in drinking water', 10),
	(43, 'Mineralised hot water at the press of a button and it is useful for preparing a quick cup of tea, baby food, soaking lentils, soothing a sore throat etc.', 10),
	(44, 'It looks very beautiful and is useful when you wake up for water in the night', 10),
	(45, 'Warranty: 2 years on product', 10),
	(46, 'Purification Technology: The Eureka Forbes Aquaguard Enhance RO + UV + UF + TDS Regulator Water Purifier provides absolutely safe drinking water and has a special error indication feature in case of inappropriate operation.', 11),
	(47, 'Storage Capacity: This can provide 7 liters of purified drinking water.', 11),
	(48, 'TDS regulator has the ability to result with a controlled final taste to your drinking water. You have the option to choose from the desired taste of water and can easily switch to the respective taste when there is a change in the water source.', 11),
	(49, 'Applicable TDS Range: 1- 2000 mg/litre', 11),
	(50, 'Features: TDS Regulator+, Enhanced Protection, Smart Auto-Fill, Enhanced Storage+, Enhanced Taste.', 11),
	(51, 'Warranty: 1 Year Manufacturer Warranty', 11),
	(52, 'Purification Technology: RO+UV/RO+UV+UF and Mineral Modulator', 12),
	(53, 'Water from any Source: Purifies water from any source municipal corporation, borewells, tankers', 12),
	(54, 'Indicators: LED Display, adjust the purification process for the optimal taste of your drinking water, check the water level in the storage tank.', 12),
	(55, 'Filtration Capacity: 15 liters/hour', 12),
	(56, 'TDS Levels: Purifies water with TDS level as high as 1-2000ppm', 12),
	(57, 'Taste Guard Technology: Senses the quality of water and uses purification technology accordingly', 12),
	(58, 'Intelligent Sensor: Gives an advance warning to replace its cartridges', 12),
	(59, 'Storage Capacity: 7 liters', 12),
	(60, 'Purification Modules: I-Cartridge, Chemi-Block, BiotronTM Cartridge, Mineral GuardTM, Reverse Osmosis Cartridge, UF Technology, Taste Enhancer Cartridge, UV Chamber', 12),
	(61, 'Warranty: 1 Year on product', 12),
	(62, 'RO technology removes impurities and retains essential minerals', 13),
	(63, 'TDS Regulator adjusts the levels of TDS and enhances the taste of water', 13),
	(64, 'Unique e-boiling makes the water as safe and pure as the water boiled for over 20 minutes', 13),
	(65, 'Storage Capacity: Enhanced storage capacity of 8 liters to ensure you get readily available drinking water', 13),
	(66, 'Purification Capacity: 15 Liters per Hour', 13),
	(67, 'Recommended for: Municipal water, Borewell water, Water from tankers', 13),
	(68, 'Applicable TDS Range: 1 – 2000 mg / litre', 13),
	(69, 'Warranty: 1 Year Manufacturer Warranty from Eureka Forbes company', 13),
	(70, '6 Stage RO+UV+MTDS purification', 14),
	(71, 'Compact & lightweight design', 14),
	(72, 'TDS controller for adjusting the taste of water depending upon the source of water', 14),
	(73, 'Suitable for all sources of water like taps, borewell and tanker', 14),
	(74, '6 litres storage tank', 14),
	(75, 'Smart colour changing indicators for purification process on / tank full, low incoming water pressure / no water supply / error with the machine / end of life', 14),
	(76, 'Voltage fluctuation protection (150 V – 270 V)', 14),
	(77, 'Table top or wall-mount installation', 14),
	(78, '1 year warranty', 14),
	(79, '5 Stage UV+UF purification: I-Cartridge, Chemi Block, UF Cartridge, Taste Enhancer Cartridge, Ultra Violet Reflector', 15),
	(80, 'Suitable for water from municipal tap', 15),
	(81, '6.5 litres storage tank', 15),
	(82, 'Ideal for low TDS water (up to 200 ppm)', 15),
	(83, 'LED indicators for purification process on/off, service and filter change', 15),
	(84, 'Warranty: 1 Year Manufacturer Warranty', 15),
	(85, '7 Stage RO+UV purification: Clarity Cartridge, Membrane Protector, Activated Carbon Filter Cartridge, Antiscalant Media, RO Membrane, Bacteriostatic Activated Carbon Filter, UV Lamp', 16),
	(86, 'Features Membrane Protector (MP) technology that enhances the life of RO membrane', 16),
	(87, 'Attractive, compact & lightweight design', 16),
	(88, 'TDS controller for adjusting the taste of water depending upon the source of water', 16),
	(89, 'Suitable for water from borewell, tanker, and municipal tap', 16),
	(90, '6 litres storage tank with water level indicator', 16),
	(91, 'Purifies water with high TDS up to 2000 mg/l or ppm', 16),
	(92, 'Colour changing indicators for purification process on/tank full, low incoming water pressure, and machine error', 16),
	(93, 'Voltage fluctuation protection (150 V – 270 V)', 16),
	(94, 'Double Layered RO+UV Protection Double layered RO + UV protection ensures that the water you drink is absolutely safe. While RO removes dissolved impurities, micro organisms, heavy metals and radioactive matter, UV deactivates micro organisms such as bacteria, viruses and cysts', 17),
	(95, 'Compact and Stylish Design One look at Blue Star Aristo is enough to make anyone a fan. This compact water purifier from Blue Star features minimalistic design and is available in two colours: White and Black. This water purifier would add that touch elegance in your kitchen.', 17),
	(96, 'Copper Impregnated Activated Carbon Ever experienced bad smell from the water that you drink? You are not alone, because the presence of organic impurities results in bad smell and poor taste.', 17),
	(97, 'Blue Star Aristo uses Copper impregnated activated carbon to effectively remove all kinds of organic impurities that may result in bad smell and odour in the purified water.', 17),
	(98, '6 Stage Purification Process Blue Star Aristo uses an advanced 6 stage purification process to give you water that is not only pure and safe but also tastes great.', 17),
	(99, 'The 6 stage purification process uses a pre-sediment filter, pre-carbon filter with antiscalant balls, sediment filter, RO membrane, post-carbon filter with Aqua Taste Booster (ATB) and UV lamp.', 17),
	(100, 'Blue Star Aristo RO+UV Purification Process', 17),
	(101, 'Avoid situations like these with the all-new Blue Star Aristo which features a very useful Child Lock button on the tap to protect your purifier from unnecessary wastage of water.', 17),
	(102, 'This water purifier from Blue Star offers an impressive purification capacity of up to 12 litres/hour (285 litres/day). The high purification capacity in this purifier can be attributed to a super-efficient and high quality RO membrane.', 17),
	(103, 'Double Layered RO+UF Protection Double layered RO + UF protection ensures that the water you drink is absolutely safe. RO removes dissolved impurities, micro organisms, heavy metals and radioactive matter, and UF membrane filters out physical impurities as well as harmful mircrobes like bacteria and cysts from the water.', 18),
	(104, 'Aqua Taste Booster (ATB) Blue Star Aristo comes with a unique feature called ‘Aqua Taste Booster (ATB)’. What Aqua Taste Booster does is it uses calcite media to maintain optimum pH level and improves the taste of water to give you sweet natural tasting water.', 18),
	(105, 'Compact and Stylish Design One look at Blue Star Aristo is enough to make anyone a fan. This compact water purifier from Blue Star features minimalistic design and is available in two colours: White and Black. This water purifier would add that touch elegance in your kitchen.', 18),
	(106, 'Copper Impregnated Activated Carbon Ever experienced bad smell from the water that you drink? You are not alone, because presence of organic impurities results in bad smell and poor taste.', 18),
	(107, 'Blue Star Aristo uses Copper impregnated activated carbon to effectively remove all kinds of organic impurities that may result in bad smell and odour in the purified water.', 18),
	(108, '6 Stage Purification Process Blue Star Aristo uses an advanced 6 stage purification process to give you water that is not only pure and safe but also tastes great', 18),
	(109, 'Ultra High TDS Removal Worried about the high TDS in your input water. Worry no more, as Blue Star Stella offers TDS removal of up to 96%. This means that the purified water that you get in safe and pure even with high levels of dissolved impurities in the input water.', 19),
	(110, '8.2 Litres Large Tank Blue Star Stella features a large tank of 8.2 litres which comprises 4.6 litres of room temperature water, 3 litres of cold water and 0.6 litres of hot water.', 19),
	(111, 'Superior Water Recovery of up to 33% Blue Star Stella also addresses the most common problem of using an RO water purifier that of wastage of water. With superior water recovery of up to 33%, Blue Star Stella minimizes water wastage and helps in the conservation of water.', 19),
	(112, 'Purification Capacity of 250 Litres/Day The super-efficient and high-quality RO membrane of Blue Star Stella offers purification capacity of up to 250 litres/day. The high-quality RO membrane used in Blue Star Stella is also capable of an ultra high TDS removal of up to 96%. Despite high levels of dissolved impurities in the input water, the output water is pure.', 19),
	(113, 'Auto Clean Function The auto clean function which ensures that stagnant water not used for 4 days is automatically drained and fresh water is filled. This feature makes sure that the water that you drink is never over 4 days old.', 19),
	(114, 'Touch Sensors Touch sensors let you make a quick and easy selection between cold, hot and room temperature options.', 19),
	(115, 'RO + UV water purifier', 20),
	(116, 'Free Pre Filter will be delivered at the time of installation', 20),
	(117, 'Aqua Taste Booster (ATB): Aqua Taste Booster uses Calcite media which enhances the taste and helps maintain optimum pH level of water', 20),
	(118, 'Child Lock: Special Child lock button on the tap to protect unnecessary wastage of water', 20),
	(119, 'Sleek and stylish: Sleek and stylish design available in different colors.', 20),
	(120, 'Storage Capacity: 8 liters', 20),
	(121, 'UV Change Indicator UV change indicator gives you an advance indication that the UV lamp needs replacement within 100 hours of usage. This gives you sufficient time to change the UV lamp.', 21),
	(122, 'Maximum Flow Rate of 2 litres/min Pristina offers a high flow rate of 2 litres/min. This is ideal for big families or corporate offices.', 21),
	(123, 'Elegant Modern Design The looks and design of Blue Star Pristina is one of it’s main USP. This machine is sure to lend an elegant modern look to your kitchen without taking much of the space', 21),
	(124, 'Advanced UV Protection Blue Star Pristina offers Advanced UV protection from all disease causing microorganisms like protozoa, bacteria and viruses. The purifier also features an Ultra efficient UV purification chamber which is made of stainless steel for maximum safety, durability and optimum performance.', 21),
	(125, 'Stage Purification The input water is purified using an advanced 5 stage purification process. The 5 different stages of purification comprise of a pre filter, sediment filter, carbon filter, micro trap filter, and UV Lamp. The water is purified at every stage to make sure that the water you drink is absolutely safe and pure', 21),
	(126, 'Purification Capacity of 285 Litres/Day The super-efficient and high-quality RO membrane of Blue Star Edge offers purification capacity of up to 285 litres/day.', 22),
	(127, 'Touch Screen Blue Star Edge features a smart and innovative touch screen that not only allows you to control the functions of the purifier with ease but also displays important information about the purifier like the water level in the tank and filter change status.', 22),
	(128, 'Super Fine Sediment Filter 1st stage of purification uses a super fine sediment filter of 5 microns which removes even the finest of sand, mud, dust and other suspended particles.', 22),
	(129, 'Speech Assist Speech assist provides you voice alerts about when to replace filter, the water level status, alerts you to check your water inflow and gives you safety messages so you can be rest-assured about the quality of drinking water', 22),
	(130, 'Mineral Management Mineral management or TDS controller technology helps in retention of essential minerals in the purified water.', 22),
	(131, '6 Litres Compact Tank Blue Star Edge features a compact tank of 6 litres which not only saves the much needed kitchen space but is also sufficient for a small family.', 22),
	(132, 'Water Tank Multi Level Display Water tank multi-level display to give you an update about the water storage level in the tank at all times', 22),
	(133, 'Filter Cartridges: Sediment, Carbon block filter, UF, and Post-carbon', 23),
	(134, 'Material: ABS Food Grade Plastic', 23),
	(135, 'Automatic: Fully automatic with auto-on and auto-off function', 23),
	(136, 'Mounting: Wall mounted', 23),
	(137, 'TDS Control Valve: It allows the user to control the content of natural minerals in the purified water', 23),
	(138, 'Extra Accessories: Push-fit components for leak-proof performance, User manual, Warranty card and Service center details', 23),
	(139, 'Indication: Purified water level indicator', 23),
	(140, 'Power Supply: Operates on electricity with built-in SMPS for frequent power fluctuations', 23),
	(141, 'Certifications: WQA (USA & India), NSF (USA) and ISI (India)', 23),
	(142, 'Installation: Free of cost at customer’s premises', 23),
	(143, 'Purification Capacity: Up to 15 litres per hour.', 24),
	(144, 'Purification Technology: RO + UV + UF + TDS Control.', 24),
	(145, 'TDS Controller: In-built TDS Controller that allows adjustment of TDS level of purified water.', 24),
	(146, 'Auto-on/off – Fully automatic operation, auto-on/off', 24),
	(147, 'Filter Change Indicator: Indicates when the time comes to change the filter.', 24),
	(148, 'UV Fail Alarm: Lets the user know about any malfunction in UV mechanism.', 24),
	(149, 'Warranty: 1 year warranty + 3 years free service', 24),
	(150, 'Applications: Appropriate for purification of brackish/tap water/municipal corporation water', 25),
	(151, 'Storage Capacity: 7 Litre ABS food grade tank for easy onsite cleaning', 25),
	(152, 'Purification Capacity: Up to 15 litres per hour', 25),
	(153, 'Purification Technology: RO+UV+UF+TDS Control', 25),
	(154, 'Auto On-Off: Fully automatic operation, auto-on/off', 25),
	(155, 'Filter Change Indicator: Indicates when the time comes to change the filter', 25),
	(156, 'Auto-Flushing System: Yes', 25),
	(157, 'Built-in SMPS: For a wide range of input AC voltage', 25),
	(158, 'Double purification by UV and UF removes even dead bacteria from purified water', 26),
	(159, 'Fully automatic UV purifier with 7 litres storage tank', 26),
	(160, 'Suitable for low TDS water', 26),
	(161, 'Computer controlled operation with filter change alarm and UV fail alarm', 26),
	(162, 'Push fit components for leak proof performance', 26),
	(163, 'LED indicator for power and purification display', 26),
	(164, 'ABS construction for corrosion free lifespan', 26),
	(165, 'Warranty: 1 year on product', 26),
	(166, 'Purification Technology: Double purification using UV and hollow fibre UF membrane.', 27),
	(167, 'Activated Carbon Pre-Filter: Reduce bad taste and odour from water and provide pure water to drink.', 27),
	(168, 'Storage Capacity: Purified water storage capacity of 7 Liters.', 27),
	(169, 'Purification Capacity: Ultra High purification capacity of 60 Liters per hour.', 27),
	(170, 'Suitable For: Suitable for big families and all water sources such as overhead storage tanks, bore-wells, municipal taps and even water tankers.', 27),
	(171, 'Computer Controlled Operation: Ultra Storage water purifier comes with computer controlled operation that alerts you with an alarm for filter change and UV lamp becomes inefficient', 27),
	(172, 'Warranty: 1 Year Manufacturer Warranty from Kent', 27),
	(173, 'Elegant under-the-counter/under-the-sink design.', 28),
	(174, 'Suitable for water from all sources such as bore-wells, tanks or municipal tap-water.', 28),
	(175, 'Spin-welded RO membrane housing that prevents tampering.', 28),
	(176, 'Push-fit components for leak-proof and maintenance free performance.', 28),
	(177, 'Fully automatic operation with auto-start and auto-off.', 28),
	(178, 'Filter Change Alarm to indicate filter replacement time', 28),
	(179, 'UV Fail Alarm to indicate failure in UV system', 28),
	(180, 'Design: Elegant and sleek', 29),
	(181, 'Purification: 6-stage advance purification system', 29),
	(182, 'Purification Technology: RO + UV + Mineralizer', 29),
	(183, 'Purification Cartridges: Sediment Filter, Pre-activated Carbon Filter + Absorber, RO Membrane, UV ', 29),
	(184, 'Disinfection Column, Silver Impregnated Post Carbon Filter, Mineral Cartridge', 29),
	(185, 'TDS Level: Works up to TDS level of 1500 ppm', 29),
	(186, 'Purification Technology: RO+UV+UF', 30),
	(187, 'Purification Stages: 7 stage purification with Sediment Filter, Pre Carbon Block Cum Adsorber, Anti-Scalant Cartridge, RO Membrane, UV Disinfection Column, Ultra-filtration Cartridge, and Silver Impregnated Post Carbon Cartridge.', 30),
	(188, 'Design: Elegant and sleek design.', 30),
	(189, 'Indicators: Power ON, Purification process, Tank Full Indicator, and UV Fail Alarm.', 30),
	(190, 'Storage Capacity: Effective tank storage capacity of 7 litres.', 30),
	(191, 'Purification Capacity: Up to 12 litres per hour.', 30),
	(192, 'Warranty: 1 Year Manufacturer Warranty from Livpure.', 30),
	(193, 'India’s first intelligent RO water purifier with touch technology.', 31),
	(194, 'Clean and compact design with a touch interface.', 31),
	(195, 'Filter change indication system.', 31),
	(196, 'Taste Enhancer improves the essential minerals, which enhances the taste and quality of water.', 31),
	(197, 'The purified water storage capacity of 8.5 litres.', 31),
	(198, 'Purification capacity of up to 15 litres/hour.', 31),
	(199, 'Multi dispensing options with no wastage of water, continuous free flow, and custom flow.', 31),
	(200, 'Removes turbidity, chlorine, inorganic impurities like calcium, magnesium, and a wide range of organic impurities like pesticides, THMs (Trihalomethanes) etc.', 31),
	(201, 'Warranty: 1 Year Manufacturer Warranty.', 31),
	(202, 'The Livpure Glitz UV Water Purifier is one of the best UV+UF water purifiers in India. Livpure Glitz UV and uses double purification of Ultrafiltration (UF) and Ultraviolet (UV) technology to give you clean and safe drinking water.', 32),
	(203, 'Featuring a UV failure indicator, this water purifier ensures that the water that you drink is 100% safe.', 32),
	(204, 'Its elegant and stylish design & its 4 stage purification system make this Livpure water purifier ideal for any home with municipal tap water supply', 32),
	(205, 'Purification Technology: 7 Stage advanced purification system', 33),
	(206, 'Purification Cartridges: Sediment Filter, Pre Activated Carbon Filter, Anti-Scalant Cartridge, RO Membrane, Silver Impregnated Post Carbon Cartridge', 33),
	(207, 'Modern look and stylish design with taste enhancer', 33),
	(208, 'Purification Capacity: Up to 12 liters per hour', 33),
	(209, 'Warranty: 1 Year', 33),
	(210, 'Purification Technology: 6 Stage RO+UF purification', 34),
	(211, 'Storage Capacity:7 litres', 34),
	(212, 'LED indicators for power on, purification process and tank', 34),
	(213, 'Wall-mount installation', 34),
	(214, 'Warranty:1 year', 34);
/*!40000 ALTER TABLE `backend_panel_features` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.backend_panel_modals
CREATE TABLE IF NOT EXISTS `backend_panel_modals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) DEFAULT NULL,
  `image` varchar(225) DEFAULT NULL,
  `price` varchar(225) DEFAULT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `backend_panel_modals_brand_id_73c124fd_fk_backend_p` (`brand_id`),
  CONSTRAINT `backend_panel_modals_brand_id_73c124fd_fk_backend_p` FOREIGN KEY (`brand_id`) REFERENCES `backend_panel_purifierbrands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.backend_panel_modals: ~30 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_modals` DISABLE KEYS */;
INSERT INTO `backend_panel_modals` (`id`, `name`, `image`, `price`, `brand_id`) VALUES
	(5, 'AO Smith Z8 10 Litre RO Water Purifier', 'AO-Smith-Z8-10-L-RO.jpg', 'Rs.26,900', 4),
	(6, 'AO Smith X8 Green Series RO Water Purifier', 'ao-smith-x8-ro-ns1.jpg', 'Rs.21,950', 4),
	(7, 'AO Smith Z9 10 Litre RO Water Purifier', 'AO-Smith-Z9-10-L-RO.jpg', 'Rs. 28,650', 4),
	(8, 'AO Smith Z1 UV+HOT Water Purifier', 'AO-Smith-Z1.jpg', 'Rs.14,990', 4),
	(9, 'AO Smith X7 RO Water Purifier', 'AO-Smith-X7-48-Watt-RO.jpg', 'Rs.20,250', 4),
	(10, 'AO Smith Z6 RO Water Purifier', 'A.O.Smith-Z6Hot-48-Watt-RO.jpg', 'Rs.24,500', 4),
	(11, 'Eureka Forbes Aquaguard Enhance RO + UV + UF + TDS Regulator water Purifier', 'Eureka-Forbes-7-Litres-Aquaguard-Enhance-RO.jpg', 'Rs.19,499', 5),
	(12, 'Eureka Forbes Aquaguard Geneus RO+UV 7 L Water Purifier', 'Eureka-Forbes-Aquaguard-Geneus-ROUV-7.jpg', 'Rs.25,999', 5),
	(13, 'AquaGuard Reviva RO + UV + TDS Water Purifier', 'AquaGuard-Reviva.jpg', 'Rs.16,090', 5),
	(14, 'Eureka Forbes Aquasure from Aquaguard Smart Plus RO+UV+MTDS Water Purifier', 'Aquasure-Smart-Plus-RO-UV-MTDS.jpg', 'Rs.15,999', 5),
	(15, 'Eureka Forbes Aquaguard Superb UV+UF Water Purifier', 'Aquaguard-Superb-UV-UF.jpg', 'Rs. 13,999', 5),
	(16, 'Eureka Forbes Aquasure from Aquaguard Shield', 'aquaguard-shield-water.jpg', 'Rs. 16,999', 5),
	(17, 'Blue Star Aristo RO + UV Water Purifier', 'blue-star-aristo-ro-uv.jpg', 'Rs. 13,400', 6),
	(18, 'Blue Star Aristo RO + UF Water Purifier', 'blue-star-aristo-ro-uf.jpg', 'Rs. 11,400', 6),
	(19, 'Blue Star Stella 8.2 L RO + UV Water Purifier', 'Blue-Star-Stella.jpg', 'Rs. 44,990', 6),
	(20, 'Blue Star Majesto RO + UV 8 L Water Purifier', 'Blue-Star-Majesto-Edge.jpg', 'Rs. 18,500', 6),
	(21, 'Blue Star Pristina UV Water Purifier', 'Blue-Star-Pristina.jpg', 'Rs. 8,900', 6),
	(22, 'Blue Star Edge 6 Litre RO + UV Water Purifier', 'Blue-Star-Edge.jpg', 'Rs. 21,900', 6),
	(23, 'Kent Grand Plus 8-Litre Mineral RO + UV/UF with TDS Controller Water Purifier', 'Kent-Grand-Plus-8-Litre.jpg', 'Rs. 19,500', 7),
	(24, 'Kent Grand 8 Litre RO+UV+UF+TDS Control Water Purifier', 'Kent-Grand-8-Litre.jpg', 'Rs. 19,000', 7),
	(25, 'Kent Ace Mineral 7 L RO+UV+UF+TDS Control Water Purifier', 'Kent-Ace-Mineral-7-Litre.jpg', 'Rs. 19,500', 7),
	(26, 'Kent Maxx UV+UF 7 L Water Purifier', 'Kent-Maxx-7-Litre.jpg', 'Rs.9,500', 7),
	(27, 'Kent Ultra Storage UV + UF Water Purifier (7 Litre)', 'kent-ultra-storage-7-litre-uv-uf.jpg', 'Rs. 9,500', 7),
	(28, 'Kent Excell Plus 7 Litres RO+UF+UV+TDS Controller Water Purifier', 'Kent-Excell-Plus-RO-UV.jpg', 'Rs. 19,500', 7),
	(29, 'Livpure Glo 7L RO+UV+Mineralizer Water Purifier', 'livpure-glo-lite-ro.jpg', 'Rs. 15,990', 9),
	(30, 'Livpure PEP Pro Plus RO+UV+UF 7L Water Purifier', 'livpure-pep-pro-plus.jpg', 'Rs. 15,500', 9),
	(31, 'Livpure Glo Touch RO+UV+UF+Taste Enhancer Water Purifier', 'livpure-glo-touch-rouvuf.jpg', 'Rs. 19,999', 9),
	(32, 'Livpure Glitz 7 L UV + UF Water Purifier', 'livpure-giltz-uv-7-ltr.jpg', 'Rs. 8,999', 9),
	(33, 'Livpure Glitz Plus RO+UF Water Purifier', 'Livpure-Glitz-Plus-ROUF.jpg', 'Rs. 10,299', 9),
	(34, 'Livpure Glo Lite RO+UF Water Purifier', 'livpure-glo-lite-ro-uf-.jpg', 'Rs. 11,999', 9);
/*!40000 ALTER TABLE `backend_panel_modals` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.backend_panel_purifierbrands
CREATE TABLE IF NOT EXISTS `backend_panel_purifierbrands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brands` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands` (`brands`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.backend_panel_purifierbrands: ~5 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_purifierbrands` DISABLE KEYS */;
INSERT INTO `backend_panel_purifierbrands` (`id`, `brands`) VALUES
	(4, 'AO Smith'),
	(5, 'Aquaguard'),
	(6, 'Blue Star'),
	(7, 'Kent'),
	(9, 'Livepure');
/*!40000 ALTER TABLE `backend_panel_purifierbrands` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.backend_panel_servicecharges
CREATE TABLE IF NOT EXISTS `backend_panel_servicecharges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(225) DEFAULT NULL,
  `price` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service` (`service`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.backend_panel_servicecharges: ~2 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_servicecharges` DISABLE KEYS */;
INSERT INTO `backend_panel_servicecharges` (`id`, `service`, `price`) VALUES
	(5, 'Simpe service', 'rs 100'),
	(6, 'service with piping', 'Rs. 300');
/*!40000 ALTER TABLE `backend_panel_servicecharges` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.backend_panel_topbrands
CREATE TABLE IF NOT EXISTS `backend_panel_topbrands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(225) DEFAULT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_panel_topbra_brand_id_551eb581_fk_backend_p` (`brand_id`),
  CONSTRAINT `backend_panel_topbra_brand_id_551eb581_fk_backend_p` FOREIGN KEY (`brand_id`) REFERENCES `backend_panel_purifierbrands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.backend_panel_topbrands: ~5 rows (approximately)
/*!40000 ALTER TABLE `backend_panel_topbrands` DISABLE KEYS */;
INSERT INTO `backend_panel_topbrands` (`id`, `image`, `brand_id`) VALUES
	(2, 'aquaguard logo.png', 5),
	(3, 'blue star.jpg', 6),
	(4, 'kent.jpg', 7),
	(5, 'livepure.jpg', 9),
	(6, 'AO smith.jpg', 4);
/*!40000 ALTER TABLE `backend_panel_topbrands` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.django_admin_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.django_content_type: ~14 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(13, 'backend_panel', 'aquagaurd_parts'),
	(8, 'backend_panel', 'descriptions'),
	(11, 'backend_panel', 'features'),
	(9, 'backend_panel', 'modals'),
	(10, 'backend_panel', 'purifierbrands'),
	(12, 'backend_panel', 'servicecharges'),
	(14, 'backend_panel', 'topbrands'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'front_panel', 'roledetails'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.django_migrations: ~26 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2019-07-21 13:11:35'),
	(2, 'auth', '0001_initial', '2019-07-21 13:11:39'),
	(3, 'admin', '0001_initial', '2019-07-21 13:11:40'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2019-07-21 13:11:40'),
	(5, 'contenttypes', '0002_remove_content_type_name', '2019-07-21 13:11:40'),
	(6, 'auth', '0002_alter_permission_name_max_length', '2019-07-21 13:11:41'),
	(7, 'auth', '0003_alter_user_email_max_length', '2019-07-21 13:11:41'),
	(8, 'auth', '0004_alter_user_username_opts', '2019-07-21 13:11:41'),
	(9, 'auth', '0005_alter_user_last_login_null', '2019-07-21 13:11:41'),
	(10, 'auth', '0006_require_contenttypes_0002', '2019-07-21 13:11:41'),
	(11, 'auth', '0007_alter_validators_add_error_messages', '2019-07-21 13:11:41'),
	(12, 'auth', '0008_alter_user_username_max_length', '2019-07-21 13:11:42'),
	(13, 'auth', '0009_alter_user_last_name_max_length', '2019-07-21 13:11:42'),
	(14, 'front_panel', '0001_initial', '2019-07-21 13:11:42'),
	(15, 'sessions', '0001_initial', '2019-07-21 13:11:43'),
	(16, 'backend_panel', '0001_initial', '2019-07-23 11:02:13'),
	(17, 'backend_panel', '0002_servicecharges', '2019-07-24 17:16:26'),
	(18, 'backend_panel', '0003_aquagaurd_parts', '2019-08-13 12:05:55'),
	(19, 'backend_panel', '0004_auto_20190815_1448', '2019-08-15 09:19:04'),
	(20, 'backend_panel', '0005_purifierbrands_image', '2019-08-27 13:20:04'),
	(21, 'backend_panel', '0006_remove_purifierbrands_image', '2019-08-27 14:07:15'),
	(22, 'backend_panel', '0007_purifierbrands_image', '2019-08-27 14:27:48'),
	(23, 'backend_panel', '0008_remove_purifierbrands_image', '2019-08-27 14:46:24'),
	(24, 'backend_panel', '0009_topbrands', '2019-08-27 17:30:48'),
	(25, 'backend_panel', '0010_servicecharges_image', '2019-08-28 13:31:48'),
	(26, 'backend_panel', '0011_remove_servicecharges_image', '2019-08-28 13:43:30');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.django_session: ~4 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('gj2kl9u85141vzm31mvdncd8ythxtax8', 'MWM5NDA2OWNhZGQ2NjMzYjIyY2Y1M2RhMDM0MWRjYTQ4ZTQ3MjljZjp7ImVtYWlsIjoicGc3Mjk4NDQxNDk1QGdtYWlsLmNvbSIsIm5hbWUiOiJwcmluY2UifQ==', '2019-08-08 04:57:35'),
	('hoveq9ctzhxhvk2vnh968nqntgvtxnhv', 'MWM5NDA2OWNhZGQ2NjMzYjIyY2Y1M2RhMDM0MWRjYTQ4ZTQ3MjljZjp7ImVtYWlsIjoicGc3Mjk4NDQxNDk1QGdtYWlsLmNvbSIsIm5hbWUiOiJwcmluY2UifQ==', '2019-08-07 18:40:10'),
	('ihfiz7giyznen7odal3wwce8hrzpjyx4', 'MWM5NDA2OWNhZGQ2NjMzYjIyY2Y1M2RhMDM0MWRjYTQ4ZTQ3MjljZjp7ImVtYWlsIjoicGc3Mjk4NDQxNDk1QGdtYWlsLmNvbSIsIm5hbWUiOiJwcmluY2UifQ==', '2019-08-07 18:31:44'),
	('mnrpt3mr0ovvnquf0xw6iosem84e8z4e', 'ODlkMTkyZWM4Nzk2OGJhNWMxYmQyMTkyMmRlNWE2ZmJlNzEyZjJlYzp7ImVtYWlsIjoicGc3Mjk4NDQxNDk1QGdtYWlsLmNvbSIsIm5hbWUiOiJLdW5hbCJ9', '2019-09-11 13:44:05');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Dumping structure for table waterpurifier_db.front_panel_roledetails
CREATE TABLE IF NOT EXISTS `front_panel_roledetails` (
  `name` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `mobile` varchar(225) NOT NULL,
  `image` varchar(225) DEFAULT NULL,
  `gender` varchar(225) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `otp` varchar(225) DEFAULT NULL,
  `active` varchar(225) NOT NULL,
  `verify_link` varchar(225) DEFAULT NULL,
  `auth_token` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table waterpurifier_db.front_panel_roledetails: ~1 rows (approximately)
/*!40000 ALTER TABLE `front_panel_roledetails` DISABLE KEYS */;
INSERT INTO `front_panel_roledetails` (`name`, `email`, `password`, `mobile`, `image`, `gender`, `address`, `otp`, `active`, `verify_link`, `auth_token`) VALUES
	('Kunal', 'pg7298441495@gmail.com', 'pbkdf2_sha256$100000$TUDAdVSeqavh$hyPVaxd2NxcUOSqHOBGQywauqAf72g2SgSgjBue8sKI=', '9888074267', 'abc.PNG', '', 'chandigarh', '', '1', '', '');
/*!40000 ALTER TABLE `front_panel_roledetails` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
