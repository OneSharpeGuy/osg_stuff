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
-- Structure for view `z_vw_no_registration`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`chasjr_drup707`@`localhost` SQL SECURITY DEFINER VIEW `z_vw_no_registration` AS select `i`.`unique_id` AS `unique_id`,`i`.`start_time_unix` AS `start_time_unix`,`i`.`title` AS `venue`,`n`.`title` AS `title`,`n`.`nid` AS `nid`,`u`.`uid` AS `uid`,`u`.`name` AS `name`,`u`.`mail` AS `mail`,`f`.`field_firstname_value` AS `first_name`,`l`.`field_lastname_value` AS `last_name` from ((((((`osg_ical_imported` `i` join `node` `n` on(((`i`.`nid` = `n`.`nid`) and (`i`.`available` = 1)))) join `users` `u`) join `field_data_field_firstname` `f` on((`u`.`uid` = `f`.`entity_id`))) join `field_data_field_lastname` `l` on((`u`.`uid` = `l`.`entity_id`))) left join `registration` `r` on(((`r`.`entity_id` = `n`.`nid`) and (`u`.`uid` = `r`.`user_uid`) and (`u`.`status` = 1)))) left join `z_vw_non_singers` `ns` on((`ns`.`uid` = `u`.`uid`))) where (isnull(`r`.`registration_id`) and isnull(`ns`.`uid`));

--
-- VIEW  `z_vw_no_registration`
-- Data: None
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
         