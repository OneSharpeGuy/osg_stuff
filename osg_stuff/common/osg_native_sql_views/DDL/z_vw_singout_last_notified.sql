-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 06, 2013 at 10:04 PM
-- Server version: 5.5.32-cll
-- PHP Version: 5.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `chasjr_drup707`
--

-- --------------------------------------------------------

--
-- Structure for view `z_vw_singout_last_notified`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`chasjr`@`localhost` SQL SECURITY DEFINER VIEW `z_vw_singout_last_notified` AS select `osg_singout_notifier_log`.`uid` AS `uid`,`osg_singout_notifier_log`.`nid` AS `nid`,`osg_singout_notifier_log`.`delta` AS `delta`,max(`osg_singout_notifier_log`.`notification_time`) AS `last_sent` from `osg_singout_notifier_log` group by `osg_singout_notifier_log`.`uid`,`osg_singout_notifier_log`.`nid`,`osg_singout_notifier_log`.`delta`;

--
-- VIEW  `z_vw_singout_last_notified`
-- Data: None
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
         