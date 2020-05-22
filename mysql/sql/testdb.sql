-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Host: mysql1.cs.clemson.edu
-- Generation Time: Apr 23, 2020 at 10:07 PM
-- Server version: 5.5.52-0ubuntu0.12.04.1
-- PHP Version: 5.5.9-1ubuntu4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE DATABASE `testdb`;
USE `testdb`;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `metube_02dx`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'game'),
(2, 'lifestyle'),
(3, 'entertainment'),
(4, 'movies'),
(5, 'music'),
(6, 'technology'),
(7, 'digital'),
(8, 'animation');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `comment_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `community`
--

CREATE TABLE IF NOT EXISTS `community` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_name` varchar(70) NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `community_name` (`community_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `community_topic`
--

CREATE TABLE IF NOT EXISTS `community_topic` (
  `community_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`community_id`,`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `community_user`
--

CREATE TABLE IF NOT EXISTS `community_user` (
  `community_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`community_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contactlist`
--

CREATE TABLE IF NOT EXISTS `contactlist` (
  `mainuser` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `groupname` varchar(20) NOT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'block:1 nonblock:0',
  PRIMARY KEY (`mainuser`,`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contactlist`
--

INSERT INTO `contactlist` (`mainuser`, `username`, `groupname`, `blocked`) VALUES
('alan', 'john', 'friends', 0),
('alan', 'kelly', 'family', 0),
('kelly', 'alan', 'friends', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dialog`
--

CREATE TABLE IF NOT EXISTS `dialog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id_pair` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `disliked_list`
--

CREATE TABLE IF NOT EXISTS `disliked_list` (
  `video_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`video_id`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `download_list`
--

CREATE TABLE IF NOT EXISTS `download_list` (
  `video_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`video_id`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `download_list`
--

INSERT INTO `download_list` (`video_id`, `user_id`) VALUES
(4, 1),
(27, 2),
(28, 2);

-- --------------------------------------------------------

--
-- Table structure for table `keyword`
--

CREATE TABLE IF NOT EXISTS `keyword` (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(30) NOT NULL,
  `search_times` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `keyword`
--

INSERT INTO `keyword` (`keyword_id`, `keyword`, `search_times`) VALUES
(1, 'game', 7),
(2, 'thrones', 5),
(7, 'trailer', 0),
(11, 'season', 0),
(35, 'water', 0),
(36, 'glasses', 0),
(37, 'forest', 0),
(38, 'dance', 0),
(39, 'cups', 0),
(40, 'coffee', 0),
(41, 'bridge', 0),
(42, 'encrypting', 0),
(43, 'rocket', 3),
(44, 'countdown', 0);

-- --------------------------------------------------------

--
-- Table structure for table `liked_list`
--

CREATE TABLE IF NOT EXISTS `liked_list` (
  `video_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`video_id`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dialog_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `upload_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `dialog_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `read_status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE IF NOT EXISTS `playlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mainuser` varchar(20) NOT NULL,
  `playlistname` varchar(20) NOT NULL,
  `favorite` tinyint(1) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `playlist`
--

INSERT INTO `playlist` (`id`, `mainuser`, `playlistname`, `favorite`, `video_id`) VALUES
(1, 'alan', 'Entertainment', 0, 0),
(3, 'alan', 'Entertainment', 0, 28),
(5, 'alan', 'Entertainment', 0, 27),
(6, 'alan', 'life style', 0, 0),
(7, 'alan', 'life style', 0, 21),
(8, 'alan', 'life style', 0, 22);

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE IF NOT EXISTS `replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `comment_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE IF NOT EXISTS `subscriptions` (
  `username` varchar(20) NOT NULL,
  `Subscriptions` varchar(20) NOT NULL,
  PRIMARY KEY (`username`,`Subscriptions`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`username`, `Subscriptions`) VALUES
('alan', 'jeff'),
('alan', 'john'),
('alan', 'kelly');

-- --------------------------------------------------------

--
-- Table structure for table `thumbnails`
--

CREATE TABLE IF NOT EXISTS `thumbnails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `file_path` varchar(250) NOT NULL,
  `selected` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `thumbnails`
--

INSERT INTO `thumbnails` (`id`, `video_id`, `file_path`, `selected`) VALUES
(40, 16, 'uploads/videos/thumbnails/16-5e9fb78be385c.jpg', 1),
(41, 16, 'uploads/videos/thumbnails/16-5e9fb78e3fa17.jpg', 0),
(42, 16, 'uploads/videos/thumbnails/16-5e9fb793562f2.jpg', 0),
(45, 18, 'uploads/videos/thumbnails/18-5e9fbf472092c.jpg', 0),
(49, 20, 'uploads/videos/thumbnails/20-5ea08a732ec57.jpg', 1),
(50, 20, 'uploads/videos/thumbnails/20-5ea08a765c09b.jpg', 0),
(51, 20, 'uploads/videos/thumbnails/20-5ea08a7cafd10.jpg', 0),
(52, 21, 'uploads/videos/thumbnails/21-5ea08aed0eb12.jpg', 1),
(53, 21, 'uploads/videos/thumbnails/21-5ea08aed30198.jpg', 0),
(54, 21, 'uploads/videos/thumbnails/21-5ea08aed63613.jpg', 0),
(55, 22, 'uploads/videos/thumbnails/22-5ea08b10800ec.jpg', 1),
(56, 22, 'uploads/videos/thumbnails/22-5ea08b10d88b2.jpg', 0),
(57, 22, 'uploads/videos/thumbnails/22-5ea08b1184acb.jpg', 0),
(58, 23, 'uploads/videos/thumbnails/23-5ea08b33917e2.jpg', 1),
(59, 23, 'uploads/videos/thumbnails/23-5ea08b33cc7ab.jpg', 0),
(60, 23, 'uploads/videos/thumbnails/23-5ea08b34410a3.jpg', 0),
(61, 24, 'uploads/videos/thumbnails/24-5ea08b591f63a.jpg', 1),
(62, 24, 'uploads/videos/thumbnails/24-5ea08b59b9dc2.jpg', 0),
(63, 24, 'uploads/videos/thumbnails/24-5ea08b5ae3161.jpg', 0),
(64, 25, 'uploads/videos/thumbnails/25-5ea08b874a51b.jpg', 1),
(65, 25, 'uploads/videos/thumbnails/25-5ea08b884856b.jpg', 0),
(66, 25, 'uploads/videos/thumbnails/25-5ea08b8a264aa.jpg', 0),
(67, 26, 'uploads/videos/thumbnails/26-5ea08bc37da2d.jpg', 1),
(68, 26, 'uploads/videos/thumbnails/26-5ea08bc3d5fff.jpg', 0),
(69, 26, 'uploads/videos/thumbnails/26-5ea08bc470b10.jpg', 0),
(70, 27, 'uploads/videos/thumbnails/27-5ea08c758ef1c.jpg', 1),
(71, 27, 'uploads/videos/thumbnails/27-5ea08c76458f2.jpg', 0),
(72, 27, 'uploads/videos/thumbnails/27-5ea08c777822f.jpg', 0),
(73, 28, 'uploads/videos/thumbnails/28-5ea090b64b261.jpg', 1),
(74, 28, 'uploads/videos/thumbnails/28-5ea090bd197b7.jpg', 0),
(75, 28, 'uploads/videos/thumbnails/28-5ea090caae5da.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE IF NOT EXISTS `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `post_by` int(11) NOT NULL,
  `text` text NOT NULL,
  `post_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `topic_comment`
--

CREATE TABLE IF NOT EXISTS `topic_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_by` int(11) NOT NULL,
  `text` text NOT NULL,
  `comment_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `topic_topic_comment`
--

CREATE TABLE IF NOT EXISTS `topic_topic_comment` (
  `topic_id` int(11) NOT NULL,
  `topic_comment_id` int(11) NOT NULL,
  PRIMARY KEY (`topic_id`,`topic_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` char(128) NOT NULL,
  `sign_up_date` datetime NOT NULL,
  `avatar_path` varchar(200) NOT NULL,
  `birthday` date DEFAULT '1970-01-01',
  `gender` varchar(20) DEFAULT 'Rather not say',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `sign_up_date`, `avatar_path`, `birthday`, `gender`) VALUES
(2, 'alan', 'yang', 'alan', 'alan@gmail.com', 'da121c7052da9aadc111c79ac0f0666260267ef1642846b16daa713b714960fa6c5408a37866ec22ef0a830c5018735c5a3af647a08c8ce4e7fd1214272b2eaa', '2020-04-22 00:16:48', 'uploads/avatars/5e9fc54661138.jpg', '1970-01-01', 'Rather not say'),
(3, 'john', 'yang', 'john', 'john@gmail.com', 'da121c7052da9aadc111c79ac0f0666260267ef1642846b16daa713b714960fa6c5408a37866ec22ef0a830c5018735c5a3af647a08c8ce4e7fd1214272b2eaa', '2020-04-22 14:09:53', 'assets/imgs/avatars/default.png', '1970-01-01', 'Rather not say'),
(4, 'kelly', 'yang', 'kelly', 'kelly@gmail.com', 'da121c7052da9aadc111c79ac0f0666260267ef1642846b16daa713b714960fa6c5408a37866ec22ef0a830c5018735c5a3af647a08c8ce4e7fd1214272b2eaa', '2020-04-22 14:10:31', 'assets/imgs/avatars/default.png', '1970-01-01', 'Rather not say'),
(5, 'jeff', 'yang', 'jeff', 'jeff@gmail.com', 'da121c7052da9aadc111c79ac0f0666260267ef1642846b16daa713b714960fa6c5408a37866ec22ef0a830c5018735c5a3af647a08c8ce4e7fd1214272b2eaa', '2020-04-22 14:30:59', 'assets/imgs/avatars/default.png', '1970-01-01', 'Rather not say');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uploaded_by` varchar(20) NOT NULL,
  `title` varchar(70) NOT NULL,
  `description` text,
  `privacy` tinyint(4) DEFAULT '1',
  `file_path` varchar(250) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `upload_date` datetime NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `video_duration` time NOT NULL DEFAULT '00:00:00',
  `file_size` int(10) DEFAULT '0',
  `like` int(11) DEFAULT '0',
  `dislike` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `uploaded_by`, `title`, `description`, `privacy`, `file_path`, `category`, `upload_date`, `views`, `video_duration`, `file_size`, `like`, `dislike`) VALUES
(16, 'alan', 'game of thrones s3', 'game of thrones s3', 1, 'uploads/videos/5e9fb7590f3c1.mp4', '3', '2020-04-21 23:17:45', 6, '00:02:03', 6843219, 0, 0),
(20, 'alan', 'game of thrones s1', 'game of thrones season 1 trailer', 1, 'uploads/videos/5ea08a311f3b0.mp4', '3', '2020-04-21 14:17:21', 5, '00:02:41', 8961104, 0, 0),
(21, 'alan', 'water and glasses', 'water and glasses', 0, 'uploads/videos/5ea08aec3b91b.mp4', '2', '2020-04-20 14:20:28', 2, '00:00:04', 78671, 0, 0),
(22, 'alan', 'forest', 'forest', 1, 'uploads/videos/5ea08b0b5f213.mp4', '2', '2020-04-22 14:20:59', 3, '00:00:12', 1072406, 0, 0),
(23, 'alan', 'dance', 'dance', 1, 'uploads/videos/5ea08b308f4ae.mp4', '5', '2020-04-22 14:21:36', 0, '00:00:10', 351136, 0, 0),
(24, 'alan', 'cups', 'cups', 1, 'uploads/videos/5ea08b500b05c.mp4', '2', '2020-04-22 14:22:08', 0, '00:00:06', 565653, 0, 0),
(25, 'alan', 'coffee', 'coffee', 1, 'uploads/videos/5ea08b72cb383.mp4', '2', '2020-04-22 14:22:42', 0, '00:00:10', 873889, 0, 0),
(26, 'kelly', 'bridge', 'bridge', 2, 'uploads/videos/5ea08bb6a943a.mp4', '4', '2020-04-22 14:23:50', 3, '00:00:02', 1543443, 0, 0),
(27, 'kelly', 'data encrypting', 'data encrypting', 1, 'uploads/videos/5ea08c5cc0277.mp4', '7', '2020-04-22 14:26:36', 7, '00:00:10', 6814323, 0, 0),
(28, 'john', 'countdown to rocket', 'countdown to rocket', 1, 'uploads/videos/5ea08f796412a.mp4', '6', '2020-04-22 14:39:53', 6, '00:01:03', 29935362, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `video_keyword`
--

CREATE TABLE IF NOT EXISTS `video_keyword` (
  `video_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`keyword_id`,`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video_keyword`
--

INSERT INTO `video_keyword` (`video_id`, `keyword_id`) VALUES
(16, 1),
(20, 1),
(16, 2),
(20, 2),
(16, 7),
(20, 7),
(21, 35),
(21, 36),
(22, 37),
(23, 38),
(24, 39),
(25, 40),
(26, 41),
(27, 42),
(28, 43),
(28, 44);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
