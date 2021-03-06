-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 06, 2013 at 10:00 PM
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
-- Structure for view `z_vw_non_singers`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`chasjr`@`207.87.72.16` SQL SECURITY DEFINER VIEW `z_vw_non_singers` AS select `r`.`rid` AS `rid`,`r`.`name` AS `role_name`,`u`.`uid` AS `uid` from ((`role` `r` join `users_roles` `ur` on((`r`.`rid` = `ur`.`rid`))) join `users` `u` on((`ur`.`uid` = `u`.`uid`))) where (`r`.`name` in ('administrator','anonymous user','director')) union select `r`.`rid` AS `rid`,`r`.`name` AS `name`,`u`.`uid` AS `uid` from (`role` `r` join `users` `u` on((`u`.`uid` = 0))) where (`r`.`name` = 'anonymous user') union select `r`.`rid` AS `rid`,`r`.`name` AS `NAME`,`u`.`uid` AS `uid` from (`role` `r` join `users` `u` on((`u`.`uid` = 1))) where (`r`.`name` = 'administrator');

--
-- VIEW  `z_vw_non_singers`
-- Data: None
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
         