-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 31, 2014 at 07:45 PM
-- Server version: 10.0.12-MariaDB
-- PHP Version: 5.5.14

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
-- Table structure for table `dionaea_connections`
--

CREATE TABLE IF NOT EXISTS `dionaea_connections` (
  `connection` int(11) NOT NULL,
  `sensor` int(11) unsigned NOT NULL,
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
-- Table structure for table `kippo_auth`
--

CREATE TABLE IF NOT EXISTS `kippo_auth` (
  `id` int(11) NOT NULL,
  `sensor` int(11) unsigned NOT NULL,
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
  `sensor` int(11) unsigned NOT NULL,
  `version` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kippo_downloads`
--

CREATE TABLE IF NOT EXISTS `kippo_downloads` (
  `id` int(11) NOT NULL,
  `sensor` int(11) unsigned NOT NULL,
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
  `sensor` int(11) unsigned NOT NULL,
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
  `sensor` int(11) unsigned NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime DEFAULT NULL,
  `ip` varchar(15) NOT NULL,
  `termsize` varchar(7) DEFAULT NULL,
  `client` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kippo_ttylog`
--

CREATE TABLE IF NOT EXISTS `kippo_ttylog` (
  `id` int(11) NOT NULL,
  `sensor` int(11) unsigned NOT NULL,
  `session` char(32) NOT NULL,
  `ttylog` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `p0f_fingerprint`
--

CREATE TABLE IF NOT EXISTS `p0f_fingerprint` (
  `ip` varchar(25) NOT NULL,
  `os` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Indexes for table `kippo_auth`
--
ALTER TABLE `kippo_auth`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`,`sensor`), ADD UNIQUE KEY `id_2` (`id`), ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `kippo_clients`
--
ALTER TABLE `kippo_clients`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`,`sensor`), ADD UNIQUE KEY `id_2` (`id`);

--
-- Indexes for table `kippo_downloads`
--
ALTER TABLE `kippo_downloads`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`,`sensor`), ADD UNIQUE KEY `id_2` (`id`), ADD KEY `session` (`session`,`timestamp`);

--
-- Indexes for table `kippo_input`
--
ALTER TABLE `kippo_input`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`,`sensor`), ADD UNIQUE KEY `id_2` (`id`), ADD KEY `session` (`session`,`timestamp`);

--
-- Indexes for table `kippo_sessions`
--
ALTER TABLE `kippo_sessions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`,`sensor`), ADD UNIQUE KEY `id_2` (`id`), ADD KEY `ip` (`ip`,`starttime`);

--
-- Indexes for table `kippo_ttylog`
--
ALTER TABLE `kippo_ttylog`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`,`sensor`), ADD UNIQUE KEY `id_2` (`id`), ADD KEY `session` (`session`);

--
-- Indexes for table `p0f_fingerprint`
--
ALTER TABLE `p0f_fingerprint`
 ADD PRIMARY KEY (`ip`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;