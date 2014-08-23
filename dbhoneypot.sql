-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 23, 2014 at 07:29 AM
-- Server version: 10.0.13-MariaDB-log
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbhoneypot`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `auth_profile`
--
CREATE TABLE IF NOT EXISTS `auth_profile` (
`ip` varchar(15)
,`id` char(32)
,`session` char(32)
,`username` varchar(100)
,`password` varchar(100)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `common_ip`
--
CREATE TABLE IF NOT EXISTS `common_ip` (
`hits` bigint(21)
,`ipx` text
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `common_port`
--
CREATE TABLE IF NOT EXISTS `common_port` (
`portx` int(11)
,`ipx` text
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `country_hit`
--
CREATE TABLE IF NOT EXISTS `country_hit` (
`hits` bigint(21)
,`country_name` varchar(25)
);
-- --------------------------------------------------------

--
-- Table structure for table `dionaea_connections`
--

CREATE TABLE IF NOT EXISTS `dionaea_connections` (
  `connection` int(11) NOT NULL,
  `connection_type` text NOT NULL,
  `connection_transport` text NOT NULL,
  `connection_protocol` text NOT NULL,
  `connection_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `connection_root` int(11) DEFAULT NULL,
  `connection_parent` int(11) DEFAULT NULL,
  `local_ip` text NOT NULL,
  `local_port` int(11) NOT NULL,
  `remote_ip` text NOT NULL,
  `remote_hostname` text NOT NULL,
  `remote_port` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dionaea_downloads`
--

CREATE TABLE IF NOT EXISTS `dionaea_downloads` (
  `download` int(11) NOT NULL,
  `connection` int(255) NOT NULL,
  `download_url` text NOT NULL,
  `download_md5_hash` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geoip`
--

CREATE TABLE IF NOT EXISTS `geoip` (
  `ip` varchar(25) NOT NULL,
  `country_code` varchar(25) NOT NULL,
  `country_code2` varchar(25) NOT NULL,
  `country_name` varchar(25) NOT NULL,
  `city` varchar(25) NOT NULL DEFAULT 'N/A',
  `region` varchar(25) NOT NULL DEFAULT 'N/A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `input_profile`
--
CREATE TABLE IF NOT EXISTS `input_profile` (
`ip` varchar(15)
,`id` char(32)
,`session` char(32)
,`input` text
);
-- --------------------------------------------------------

--
-- Table structure for table `kippo_auth`
--

CREATE TABLE IF NOT EXISTS `kippo_auth` (
  `id` int(11) NOT NULL,
  `session` char(32) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kippo_clients`
--

CREATE TABLE IF NOT EXISTS `kippo_clients` (
  `id` int(4) NOT NULL,
  `version` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kippo_downloads`
--

CREATE TABLE IF NOT EXISTS `kippo_downloads` (
  `id` int(11) NOT NULL,
  `session` char(32) NOT NULL,
  `timestamp` datetime NOT NULL,
  `url` text NOT NULL,
  `outfile` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kippo_input`
--

CREATE TABLE IF NOT EXISTS `kippo_input` (
  `id` int(11) NOT NULL,
  `session` char(32) NOT NULL,
  `timestamp` datetime NOT NULL,
  `realm` varchar(50) DEFAULT NULL,
  `success` tinyint(1) DEFAULT NULL,
  `input` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kippo_sessions`
--

CREATE TABLE IF NOT EXISTS `kippo_sessions` (
  `id` char(32) NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime DEFAULT NULL,
  `ip` varchar(15) NOT NULL,
  `termsize` varchar(7) DEFAULT NULL,
  `client` int(4) DEFAULT NULL,
  `port` int(25) NOT NULL DEFAULT '2222'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kippo_ttylog`
--

CREATE TABLE IF NOT EXISTS `kippo_ttylog` (
  `id` int(11) NOT NULL,
  `session` char(32) NOT NULL,
  `ttylog` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `malware_download`
--
CREATE TABLE IF NOT EXISTS `malware_download` (
`connection1` int(11)
,`remote_ip` text
,`connection` int(255)
,`download_url` text
,`download_md5_hash` text
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `os_used`
--
CREATE TABLE IF NOT EXISTS `os_used` (
`ipx` text
,`os` text
);
-- --------------------------------------------------------

--
-- Table structure for table `p0f_fingerprint`
--

CREATE TABLE IF NOT EXISTS `p0f_fingerprint` (
  `ip` varchar(25) NOT NULL,
  `os` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `port_hit`
--
CREATE TABLE IF NOT EXISTS `port_hit` (
`hits` bigint(21)
,`portx` int(11)
);
-- --------------------------------------------------------

--
-- Structure for view `auth_profile`
--
DROP TABLE IF EXISTS `auth_profile`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `auth_profile` AS select `kippo_sessions`.`ip` AS `ip`,`kippo_sessions`.`id` AS `id`,`kippo_auth`.`session` AS `session`,`kippo_auth`.`username` AS `username`,`kippo_auth`.`password` AS `password` from (`kippo_sessions` join `kippo_auth`) where (`kippo_sessions`.`id` = `kippo_auth`.`session`);

-- --------------------------------------------------------

--
-- Structure for view `common_ip`
--
DROP TABLE IF EXISTS `common_ip`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `common_ip` AS (select count(`dionaea_connections`.`remote_ip`) AS `hits`,`dionaea_connections`.`remote_ip` AS `ipx` from `dionaea_connections` group by `dionaea_connections`.`remote_ip`) union (select count(`kippo_sessions`.`ip`) AS `hits`,`kippo_sessions`.`ip` AS `ipx` from `kippo_sessions` group by `kippo_sessions`.`ip`);

-- --------------------------------------------------------

--
-- Structure for view `common_port`
--
DROP TABLE IF EXISTS `common_port`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `common_port` AS (select `dionaea_connections`.`local_port` AS `portx`,`dionaea_connections`.`remote_ip` AS `ipx` from `dionaea_connections`) union all (select `kippo_sessions`.`port` AS `portx`,`kippo_sessions`.`ip` AS `ipx` from `kippo_sessions`);

-- --------------------------------------------------------

--
-- Structure for view `country_hit`
--
DROP TABLE IF EXISTS `country_hit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `country_hit` AS select count(`geoip`.`country_name`) AS `hits`,`geoip`.`country_name` AS `country_name` from `geoip` group by `geoip`.`country_name` order by count(`geoip`.`country_name`) desc;

-- --------------------------------------------------------

--
-- Structure for view `input_profile`
--
DROP TABLE IF EXISTS `input_profile`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `input_profile` AS select `kippo_sessions`.`ip` AS `ip`,`kippo_sessions`.`id` AS `id`,`kippo_input`.`session` AS `session`,`kippo_input`.`input` AS `input` from (`kippo_sessions` join `kippo_input`) where (`kippo_sessions`.`id` = `kippo_input`.`session`);

-- --------------------------------------------------------

--
-- Structure for view `malware_download`
--
DROP TABLE IF EXISTS `malware_download`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `malware_download` AS select `dionaea_connections`.`connection` AS `connection1`,`dionaea_connections`.`remote_ip` AS `remote_ip`,`dionaea_downloads`.`connection` AS `connection`,`dionaea_downloads`.`download_url` AS `download_url`,`dionaea_downloads`.`download_md5_hash` AS `download_md5_hash` from (`dionaea_connections` join `dionaea_downloads`) where (`dionaea_connections`.`connection` = `dionaea_downloads`.`connection`);

-- --------------------------------------------------------

--
-- Structure for view `os_used`
--
DROP TABLE IF EXISTS `os_used`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `os_used` AS select `common_ip`.`ipx` AS `ipx`,`p0f_fingerprint`.`os` AS `os` from (`common_ip` join `p0f_fingerprint`) where (`common_ip`.`ipx` = `p0f_fingerprint`.`ip`);

-- --------------------------------------------------------

--
-- Structure for view `port_hit`
--
DROP TABLE IF EXISTS `port_hit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `port_hit` AS select count(`common_port`.`portx`) AS `hits`,`common_port`.`portx` AS `portx` from `common_port` group by `common_port`.`portx` order by count(`common_port`.`portx`) desc;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dionaea_connections`
--
ALTER TABLE `dionaea_connections`
 ADD PRIMARY KEY (`connection`), ADD UNIQUE KEY `connection_5` (`connection`), ADD KEY `connection` (`connection`), ADD KEY `connection_2` (`connection`), ADD KEY `connection_3` (`connection`), ADD KEY `connection_4` (`connection`);

--
-- Indexes for table `dionaea_downloads`
--
ALTER TABLE `dionaea_downloads`
 ADD PRIMARY KEY (`download`), ADD UNIQUE KEY `download` (`download`);

--
-- Indexes for table `geoip`
--
ALTER TABLE `geoip`
 ADD PRIMARY KEY (`ip`), ADD UNIQUE KEY `ip` (`ip`);

--
-- Indexes for table `kippo_auth`
--
ALTER TABLE `kippo_auth`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD UNIQUE KEY `id_2` (`id`), ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `kippo_clients`
--
ALTER TABLE `kippo_clients`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD UNIQUE KEY `id_2` (`id`);

--
-- Indexes for table `kippo_downloads`
--
ALTER TABLE `kippo_downloads`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD UNIQUE KEY `id_2` (`id`), ADD KEY `session` (`session`,`timestamp`);

--
-- Indexes for table `kippo_input`
--
ALTER TABLE `kippo_input`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD UNIQUE KEY `id_2` (`id`), ADD KEY `session` (`session`,`timestamp`);

--
-- Indexes for table `kippo_sessions`
--
ALTER TABLE `kippo_sessions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD UNIQUE KEY `id_2` (`id`), ADD KEY `ip` (`ip`,`starttime`);

--
-- Indexes for table `kippo_ttylog`
--
ALTER TABLE `kippo_ttylog`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD UNIQUE KEY `id_2` (`id`), ADD KEY `session` (`session`);

--
-- Indexes for table `p0f_fingerprint`
--
ALTER TABLE `p0f_fingerprint`
 ADD PRIMARY KEY (`ip`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
