-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 29, 2014 at 03:01 AM
-- Server version: 5.1.69
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dlindem3`
--
CREATE DATABASE `dlindem3` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dlindem3`;

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE IF NOT EXISTS `game` (
  `Home` varchar(30) NOT NULL,
  `Away` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `Odds` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`Home`, `Away`, `Date`, `Odds`) VALUES
('Florida State', 'North Carolina', '2014-04-27', '4:1'),
('Tenessee', 'Auburn', '2014-03-22', '2:1'),
('Arkansas', 'Mississippi', '2014-02-10', '2:1');

-- --------------------------------------------------------

--
-- Table structure for table `pool`
--

CREATE TABLE IF NOT EXISTS `pool` (
  `conference` varchar(3) NOT NULL,
  `commissioner` varchar(45) NOT NULL,
  `deadline` datetime NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `pool_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`pool_id`,`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `pool`
--

INSERT INTO `pool` (`conference`, `commissioner`, `deadline`, `password`, `pool_id`, `name`) VALUES
('SCC', 'Teepokun', '2014-04-27 19:43:43', NULL, 5, 'First'),
('ACC', 'Teepokun', '2014-04-27 19:43:43', NULL, 6, 'Second'),
('ACC', 'Teepokun', '2014-04-29 01:58:22', '', 19, 'Wowza');

--
-- Triggers `pool`
--
DROP TRIGGER IF EXISTS `pool_AINS`;
DELIMITER //
CREATE TRIGGER `pool_AINS` AFTER INSERT ON `pool`
 FOR EACH ROW begin
	insert into pool_users (name, pool_id, user) values (NEW.name, NEW.pool_id, new.commissioner);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pool_users`
--

CREATE TABLE IF NOT EXISTS `pool_users` (
  `name` varchar(25) NOT NULL,
  `pool_id` int(11) NOT NULL,
  `user` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`name`,`pool_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pool_users`
--

INSERT INTO `pool_users` (`name`, `pool_id`, `user`) VALUES
('First', 5, 'Teepokun'),
('Second', 6, 'Teepokun'),
('Wowza', 19, 'Teepokun');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `Name` varchar(30) NOT NULL,
  `Conference` varchar(45) NOT NULL,
  `Record` varchar(45) DEFAULT NULL,
  `Logo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Name`,`Conference`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`Name`, `Conference`, `Record`, `Logo`) VALUES
('Boston College', 'ACC', NULL, NULL),
('Virginia Tech', 'ACC', NULL, NULL),
('Clemson', 'ACC', NULL, NULL),
('Georgia Tech', 'ACC', NULL, NULL),
('Florida State 	', 'ACC', NULL, NULL),
('Miami', 'ACC', NULL, NULL),
('Louisville', 'ACC', NULL, NULL),
('Virginia', 'ACC', NULL, NULL),
('North Carolina ', 'ACC', NULL, NULL),
('Syracuse', 'ACC', NULL, NULL),
('Pittsburgh', 'ACC', NULL, NULL),
('Wake Forest', 'ACC', NULL, NULL),
('Duke', 'ACC', NULL, NULL),
('NC State', 'ACC', NULL, NULL),
('Mississippi', 'SEC', NULL, NULL),
('Louisiana', 'SEC', NULL, NULL),
('Auburn', 'SEC', NULL, NULL),
('Arkansas', 'SEC', NULL, NULL),
('Alabama', 'SEC', NULL, NULL),
('Vanderbilt', 'SEC', NULL, NULL),
('Tennessee', 'SEC', NULL, NULL),
('South Carolina', 'SEC', NULL, NULL),
('Missouri', 'SEC', NULL, NULL),
('Kentucky', 'SEC', NULL, NULL),
('Georgia', 'SEC', NULL, NULL),
('Florida', 'SEC', NULL, NULL),
('Mississippi State', 'SEC', NULL, NULL),
('Texas A&M', 'SEC', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `useraccount`
--

CREATE TABLE IF NOT EXISTS `useraccount` (
  `Name` varchar(25) NOT NULL,
  `Password` varchar(14) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Firstname` varchar(20) NOT NULL,
  `Lastname` varchar(20) NOT NULL,
  PRIMARY KEY (`Name`,`Email`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `useraccount`
--

INSERT INTO `useraccount` (`Name`, `Password`, `Email`, `Firstname`, `Lastname`) VALUES
('Teepokun', 'password', 'accession.ryu@gmail.com', 'David', 'Lindemann'),
('landset', 'androidishard', 'slandset@fau.edu', 'Sara', 'Landset');
--
-- Database: `information_schema`
--
CREATE DATABASE `information_schema` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `information_schema`;

-- --------------------------------------------------------

--
-- Table structure for table `CHARACTER_SETS`
--

CREATE TEMPORARY TABLE `CHARACTER_SETS` (
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `DEFAULT_COLLATE_NAME` varchar(32) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(60) NOT NULL DEFAULT '',
  `MAXLEN` bigint(3) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CHARACTER_SETS`
--

INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES
('big5', 'big5_chinese_ci', 'Big5 Traditional Chinese', 2),
('dec8', 'dec8_swedish_ci', 'DEC West European', 1),
('cp850', 'cp850_general_ci', 'DOS West European', 1),
('hp8', 'hp8_english_ci', 'HP West European', 1),
('koi8r', 'koi8r_general_ci', 'KOI8-R Relcom Russian', 1),
('latin1', 'latin1_swedish_ci', 'cp1252 West European', 1),
('latin2', 'latin2_general_ci', 'ISO 8859-2 Central European', 1),
('swe7', 'swe7_swedish_ci', '7bit Swedish', 1),
('ascii', 'ascii_general_ci', 'US ASCII', 1),
('ujis', 'ujis_japanese_ci', 'EUC-JP Japanese', 3),
('sjis', 'sjis_japanese_ci', 'Shift-JIS Japanese', 2),
('hebrew', 'hebrew_general_ci', 'ISO 8859-8 Hebrew', 1),
('tis620', 'tis620_thai_ci', 'TIS620 Thai', 1),
('euckr', 'euckr_korean_ci', 'EUC-KR Korean', 2),
('koi8u', 'koi8u_general_ci', 'KOI8-U Ukrainian', 1),
('gb2312', 'gb2312_chinese_ci', 'GB2312 Simplified Chinese', 2),
('greek', 'greek_general_ci', 'ISO 8859-7 Greek', 1),
('cp1250', 'cp1250_general_ci', 'Windows Central European', 1),
('gbk', 'gbk_chinese_ci', 'GBK Simplified Chinese', 2),
('latin5', 'latin5_turkish_ci', 'ISO 8859-9 Turkish', 1),
('armscii8', 'armscii8_general_ci', 'ARMSCII-8 Armenian', 1),
('utf8', 'utf8_general_ci', 'UTF-8 Unicode', 3),
('ucs2', 'ucs2_general_ci', 'UCS-2 Unicode', 2),
('cp866', 'cp866_general_ci', 'DOS Russian', 1),
('keybcs2', 'keybcs2_general_ci', 'DOS Kamenicky Czech-Slovak', 1),
('macce', 'macce_general_ci', 'Mac Central European', 1),
('macroman', 'macroman_general_ci', 'Mac West European', 1),
('cp852', 'cp852_general_ci', 'DOS Central European', 1),
('latin7', 'latin7_general_ci', 'ISO 8859-13 Baltic', 1),
('cp1251', 'cp1251_general_ci', 'Windows Cyrillic', 1),
('cp1256', 'cp1256_general_ci', 'Windows Arabic', 1),
('cp1257', 'cp1257_general_ci', 'Windows Baltic', 1),
('binary', 'binary', 'Binary pseudo charset', 1),
('geostd8', 'geostd8_general_ci', 'GEOSTD8 Georgian', 1),
('cp932', 'cp932_japanese_ci', 'SJIS for Windows Japanese', 2),
('eucjpms', 'eucjpms_japanese_ci', 'UJIS for Windows Japanese', 3);

-- --------------------------------------------------------

--
-- Table structure for table `COLLATIONS`
--

CREATE TEMPORARY TABLE `COLLATIONS` (
  `COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `ID` bigint(11) NOT NULL DEFAULT '0',
  `IS_DEFAULT` varchar(3) NOT NULL DEFAULT '',
  `IS_COMPILED` varchar(3) NOT NULL DEFAULT '',
  `SORTLEN` bigint(3) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLLATIONS`
--

INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES
('big5_chinese_ci', 'big5', 1, 'Yes', 'Yes', 1),
('big5_bin', 'big5', 84, '', 'Yes', 1),
('dec8_swedish_ci', 'dec8', 3, 'Yes', 'Yes', 1),
('dec8_bin', 'dec8', 69, '', 'Yes', 1),
('cp850_general_ci', 'cp850', 4, 'Yes', 'Yes', 1),
('cp850_bin', 'cp850', 80, '', 'Yes', 1),
('hp8_english_ci', 'hp8', 6, 'Yes', 'Yes', 1),
('hp8_bin', 'hp8', 72, '', 'Yes', 1),
('koi8r_general_ci', 'koi8r', 7, 'Yes', 'Yes', 1),
('koi8r_bin', 'koi8r', 74, '', 'Yes', 1),
('latin1_german1_ci', 'latin1', 5, '', 'Yes', 1),
('latin1_swedish_ci', 'latin1', 8, 'Yes', 'Yes', 1),
('latin1_danish_ci', 'latin1', 15, '', 'Yes', 1),
('latin1_german2_ci', 'latin1', 31, '', 'Yes', 2),
('latin1_bin', 'latin1', 47, '', 'Yes', 1),
('latin1_general_ci', 'latin1', 48, '', 'Yes', 1),
('latin1_general_cs', 'latin1', 49, '', 'Yes', 1),
('latin1_spanish_ci', 'latin1', 94, '', 'Yes', 1),
('latin2_czech_cs', 'latin2', 2, '', 'Yes', 4),
('latin2_general_ci', 'latin2', 9, 'Yes', 'Yes', 1),
('latin2_hungarian_ci', 'latin2', 21, '', 'Yes', 1),
('latin2_croatian_ci', 'latin2', 27, '', 'Yes', 1),
('latin2_bin', 'latin2', 77, '', 'Yes', 1),
('swe7_swedish_ci', 'swe7', 10, 'Yes', 'Yes', 1),
('swe7_bin', 'swe7', 82, '', 'Yes', 1),
('ascii_general_ci', 'ascii', 11, 'Yes', 'Yes', 1),
('ascii_bin', 'ascii', 65, '', 'Yes', 1),
('ujis_japanese_ci', 'ujis', 12, 'Yes', 'Yes', 1),
('ujis_bin', 'ujis', 91, '', 'Yes', 1),
('sjis_japanese_ci', 'sjis', 13, 'Yes', 'Yes', 1),
('sjis_bin', 'sjis', 88, '', 'Yes', 1),
('hebrew_general_ci', 'hebrew', 16, 'Yes', 'Yes', 1),
('hebrew_bin', 'hebrew', 71, '', 'Yes', 1),
('tis620_thai_ci', 'tis620', 18, 'Yes', 'Yes', 4),
('tis620_bin', 'tis620', 89, '', 'Yes', 1),
('euckr_korean_ci', 'euckr', 19, 'Yes', 'Yes', 1),
('euckr_bin', 'euckr', 85, '', 'Yes', 1),
('koi8u_general_ci', 'koi8u', 22, 'Yes', 'Yes', 1),
('koi8u_bin', 'koi8u', 75, '', 'Yes', 1),
('gb2312_chinese_ci', 'gb2312', 24, 'Yes', 'Yes', 1),
('gb2312_bin', 'gb2312', 86, '', 'Yes', 1),
('greek_general_ci', 'greek', 25, 'Yes', 'Yes', 1),
('greek_bin', 'greek', 70, '', 'Yes', 1),
('cp1250_general_ci', 'cp1250', 26, 'Yes', 'Yes', 1),
('cp1250_czech_cs', 'cp1250', 34, '', 'Yes', 2),
('cp1250_croatian_ci', 'cp1250', 44, '', 'Yes', 1),
('cp1250_bin', 'cp1250', 66, '', 'Yes', 1),
('cp1250_polish_ci', 'cp1250', 99, '', 'Yes', 1),
('gbk_chinese_ci', 'gbk', 28, 'Yes', 'Yes', 1),
('gbk_bin', 'gbk', 87, '', 'Yes', 1),
('latin5_turkish_ci', 'latin5', 30, 'Yes', 'Yes', 1),
('latin5_bin', 'latin5', 78, '', 'Yes', 1),
('armscii8_general_ci', 'armscii8', 32, 'Yes', 'Yes', 1),
('armscii8_bin', 'armscii8', 64, '', 'Yes', 1),
('utf8_general_ci', 'utf8', 33, 'Yes', 'Yes', 1),
('utf8_bin', 'utf8', 83, '', 'Yes', 1),
('utf8_unicode_ci', 'utf8', 192, '', 'Yes', 8),
('utf8_icelandic_ci', 'utf8', 193, '', 'Yes', 8),
('utf8_latvian_ci', 'utf8', 194, '', 'Yes', 8),
('utf8_romanian_ci', 'utf8', 195, '', 'Yes', 8),
('utf8_slovenian_ci', 'utf8', 196, '', 'Yes', 8),
('utf8_polish_ci', 'utf8', 197, '', 'Yes', 8),
('utf8_estonian_ci', 'utf8', 198, '', 'Yes', 8),
('utf8_spanish_ci', 'utf8', 199, '', 'Yes', 8),
('utf8_swedish_ci', 'utf8', 200, '', 'Yes', 8),
('utf8_turkish_ci', 'utf8', 201, '', 'Yes', 8),
('utf8_czech_ci', 'utf8', 202, '', 'Yes', 8),
('utf8_danish_ci', 'utf8', 203, '', 'Yes', 8),
('utf8_lithuanian_ci', 'utf8', 204, '', 'Yes', 8),
('utf8_slovak_ci', 'utf8', 205, '', 'Yes', 8),
('utf8_spanish2_ci', 'utf8', 206, '', 'Yes', 8),
('utf8_roman_ci', 'utf8', 207, '', 'Yes', 8),
('utf8_persian_ci', 'utf8', 208, '', 'Yes', 8),
('utf8_esperanto_ci', 'utf8', 209, '', 'Yes', 8),
('utf8_hungarian_ci', 'utf8', 210, '', 'Yes', 8),
('utf8_general_mysql500_ci', 'utf8', 223, '', 'Yes', 1),
('ucs2_general_ci', 'ucs2', 35, 'Yes', 'Yes', 1),
('ucs2_bin', 'ucs2', 90, '', 'Yes', 1),
('ucs2_unicode_ci', 'ucs2', 128, '', 'Yes', 8),
('ucs2_icelandic_ci', 'ucs2', 129, '', 'Yes', 8),
('ucs2_latvian_ci', 'ucs2', 130, '', 'Yes', 8),
('ucs2_romanian_ci', 'ucs2', 131, '', 'Yes', 8),
('ucs2_slovenian_ci', 'ucs2', 132, '', 'Yes', 8),
('ucs2_polish_ci', 'ucs2', 133, '', 'Yes', 8),
('ucs2_estonian_ci', 'ucs2', 134, '', 'Yes', 8),
('ucs2_spanish_ci', 'ucs2', 135, '', 'Yes', 8),
('ucs2_swedish_ci', 'ucs2', 136, '', 'Yes', 8),
('ucs2_turkish_ci', 'ucs2', 137, '', 'Yes', 8),
('ucs2_czech_ci', 'ucs2', 138, '', 'Yes', 8),
('ucs2_danish_ci', 'ucs2', 139, '', 'Yes', 8),
('ucs2_lithuanian_ci', 'ucs2', 140, '', 'Yes', 8),
('ucs2_slovak_ci', 'ucs2', 141, '', 'Yes', 8),
('ucs2_spanish2_ci', 'ucs2', 142, '', 'Yes', 8),
('ucs2_roman_ci', 'ucs2', 143, '', 'Yes', 8),
('ucs2_persian_ci', 'ucs2', 144, '', 'Yes', 8),
('ucs2_esperanto_ci', 'ucs2', 145, '', 'Yes', 8),
('ucs2_hungarian_ci', 'ucs2', 146, '', 'Yes', 8),
('ucs2_general_mysql500_ci', 'ucs2', 159, '', 'Yes', 1),
('cp866_general_ci', 'cp866', 36, 'Yes', 'Yes', 1),
('cp866_bin', 'cp866', 68, '', 'Yes', 1),
('keybcs2_general_ci', 'keybcs2', 37, 'Yes', 'Yes', 1),
('keybcs2_bin', 'keybcs2', 73, '', 'Yes', 1),
('macce_general_ci', 'macce', 38, 'Yes', 'Yes', 1),
('macce_bin', 'macce', 43, '', 'Yes', 1),
('macroman_general_ci', 'macroman', 39, 'Yes', 'Yes', 1),
('macroman_bin', 'macroman', 53, '', 'Yes', 1),
('cp852_general_ci', 'cp852', 40, 'Yes', 'Yes', 1),
('cp852_bin', 'cp852', 81, '', 'Yes', 1),
('latin7_estonian_cs', 'latin7', 20, '', 'Yes', 1),
('latin7_general_ci', 'latin7', 41, 'Yes', 'Yes', 1),
('latin7_general_cs', 'latin7', 42, '', 'Yes', 1),
('latin7_bin', 'latin7', 79, '', 'Yes', 1),
('cp1251_bulgarian_ci', 'cp1251', 14, '', 'Yes', 1),
('cp1251_ukrainian_ci', 'cp1251', 23, '', 'Yes', 1),
('cp1251_bin', 'cp1251', 50, '', 'Yes', 1),
('cp1251_general_ci', 'cp1251', 51, 'Yes', 'Yes', 1),
('cp1251_general_cs', 'cp1251', 52, '', 'Yes', 1),
('cp1256_general_ci', 'cp1256', 57, 'Yes', 'Yes', 1),
('cp1256_bin', 'cp1256', 67, '', 'Yes', 1),
('cp1257_lithuanian_ci', 'cp1257', 29, '', 'Yes', 1),
('cp1257_bin', 'cp1257', 58, '', 'Yes', 1),
('cp1257_general_ci', 'cp1257', 59, 'Yes', 'Yes', 1),
('binary', 'binary', 63, 'Yes', 'Yes', 1),
('geostd8_general_ci', 'geostd8', 92, 'Yes', 'Yes', 1),
('geostd8_bin', 'geostd8', 93, '', 'Yes', 1),
('cp932_japanese_ci', 'cp932', 95, 'Yes', 'Yes', 1),
('cp932_bin', 'cp932', 96, '', 'Yes', 1),
('eucjpms_japanese_ci', 'eucjpms', 97, 'Yes', 'Yes', 1),
('eucjpms_bin', 'eucjpms', 98, '', 'Yes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `COLLATION_CHARACTER_SET_APPLICABILITY`
--

CREATE TEMPORARY TABLE `COLLATION_CHARACTER_SET_APPLICABILITY` (
  `COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLLATION_CHARACTER_SET_APPLICABILITY`
--

INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES
('big5_chinese_ci', 'big5'),
('big5_bin', 'big5'),
('dec8_swedish_ci', 'dec8'),
('dec8_bin', 'dec8'),
('cp850_general_ci', 'cp850'),
('cp850_bin', 'cp850'),
('hp8_english_ci', 'hp8'),
('hp8_bin', 'hp8'),
('koi8r_general_ci', 'koi8r'),
('koi8r_bin', 'koi8r'),
('latin1_german1_ci', 'latin1'),
('latin1_swedish_ci', 'latin1'),
('latin1_danish_ci', 'latin1'),
('latin1_german2_ci', 'latin1'),
('latin1_bin', 'latin1'),
('latin1_general_ci', 'latin1'),
('latin1_general_cs', 'latin1'),
('latin1_spanish_ci', 'latin1'),
('latin2_czech_cs', 'latin2'),
('latin2_general_ci', 'latin2'),
('latin2_hungarian_ci', 'latin2'),
('latin2_croatian_ci', 'latin2'),
('latin2_bin', 'latin2'),
('swe7_swedish_ci', 'swe7'),
('swe7_bin', 'swe7'),
('ascii_general_ci', 'ascii'),
('ascii_bin', 'ascii'),
('ujis_japanese_ci', 'ujis'),
('ujis_bin', 'ujis'),
('sjis_japanese_ci', 'sjis'),
('sjis_bin', 'sjis'),
('hebrew_general_ci', 'hebrew'),
('hebrew_bin', 'hebrew'),
('filename', 'filename'),
('tis620_thai_ci', 'tis620'),
('tis620_bin', 'tis620'),
('euckr_korean_ci', 'euckr'),
('euckr_bin', 'euckr'),
('koi8u_general_ci', 'koi8u'),
('koi8u_bin', 'koi8u'),
('gb2312_chinese_ci', 'gb2312'),
('gb2312_bin', 'gb2312'),
('greek_general_ci', 'greek'),
('greek_bin', 'greek'),
('cp1250_general_ci', 'cp1250'),
('cp1250_czech_cs', 'cp1250'),
('cp1250_croatian_ci', 'cp1250'),
('cp1250_bin', 'cp1250'),
('cp1250_polish_ci', 'cp1250'),
('gbk_chinese_ci', 'gbk'),
('gbk_bin', 'gbk'),
('latin5_turkish_ci', 'latin5'),
('latin5_bin', 'latin5'),
('armscii8_general_ci', 'armscii8'),
('armscii8_bin', 'armscii8'),
('utf8_general_ci', 'utf8'),
('utf8_bin', 'utf8'),
('utf8_unicode_ci', 'utf8'),
('utf8_icelandic_ci', 'utf8'),
('utf8_latvian_ci', 'utf8'),
('utf8_romanian_ci', 'utf8'),
('utf8_slovenian_ci', 'utf8'),
('utf8_polish_ci', 'utf8'),
('utf8_estonian_ci', 'utf8'),
('utf8_spanish_ci', 'utf8'),
('utf8_swedish_ci', 'utf8'),
('utf8_turkish_ci', 'utf8'),
('utf8_czech_ci', 'utf8'),
('utf8_danish_ci', 'utf8'),
('utf8_lithuanian_ci', 'utf8'),
('utf8_slovak_ci', 'utf8'),
('utf8_spanish2_ci', 'utf8'),
('utf8_roman_ci', 'utf8'),
('utf8_persian_ci', 'utf8'),
('utf8_esperanto_ci', 'utf8'),
('utf8_hungarian_ci', 'utf8'),
('utf8_general_mysql500_ci', 'utf8'),
('ucs2_general_ci', 'ucs2'),
('ucs2_bin', 'ucs2'),
('ucs2_unicode_ci', 'ucs2'),
('ucs2_icelandic_ci', 'ucs2'),
('ucs2_latvian_ci', 'ucs2'),
('ucs2_romanian_ci', 'ucs2'),
('ucs2_slovenian_ci', 'ucs2'),
('ucs2_polish_ci', 'ucs2'),
('ucs2_estonian_ci', 'ucs2'),
('ucs2_spanish_ci', 'ucs2'),
('ucs2_swedish_ci', 'ucs2'),
('ucs2_turkish_ci', 'ucs2'),
('ucs2_czech_ci', 'ucs2'),
('ucs2_danish_ci', 'ucs2'),
('ucs2_lithuanian_ci', 'ucs2'),
('ucs2_slovak_ci', 'ucs2'),
('ucs2_spanish2_ci', 'ucs2'),
('ucs2_roman_ci', 'ucs2'),
('ucs2_persian_ci', 'ucs2'),
('ucs2_esperanto_ci', 'ucs2'),
('ucs2_hungarian_ci', 'ucs2'),
('ucs2_general_mysql500_ci', 'ucs2'),
('cp866_general_ci', 'cp866'),
('cp866_bin', 'cp866'),
('keybcs2_general_ci', 'keybcs2'),
('keybcs2_bin', 'keybcs2'),
('macce_general_ci', 'macce'),
('macce_bin', 'macce'),
('macroman_general_ci', 'macroman'),
('macroman_bin', 'macroman'),
('cp852_general_ci', 'cp852'),
('cp852_bin', 'cp852'),
('latin7_estonian_cs', 'latin7'),
('latin7_general_ci', 'latin7'),
('latin7_general_cs', 'latin7'),
('latin7_bin', 'latin7'),
('cp1251_bulgarian_ci', 'cp1251'),
('cp1251_ukrainian_ci', 'cp1251'),
('cp1251_bin', 'cp1251'),
('cp1251_general_ci', 'cp1251'),
('cp1251_general_cs', 'cp1251'),
('cp1256_general_ci', 'cp1256'),
('cp1256_bin', 'cp1256'),
('cp1257_lithuanian_ci', 'cp1257'),
('cp1257_bin', 'cp1257'),
('cp1257_general_ci', 'cp1257'),
('binary', 'binary'),
('geostd8_general_ci', 'geostd8'),
('geostd8_bin', 'geostd8'),
('cp932_japanese_ci', 'cp932'),
('cp932_bin', 'cp932'),
('eucjpms_japanese_ci', 'eucjpms'),
('eucjpms_bin', 'eucjpms');

-- --------------------------------------------------------

--
-- Table structure for table `COLUMNS`
--

CREATE TEMPORARY TABLE `COLUMNS` (
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COLUMN_DEFAULT` longtext,
  `IS_NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_PRECISION` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_SCALE` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(32) DEFAULT NULL,
  `COLLATION_NAME` varchar(32) DEFAULT NULL,
  `COLUMN_TYPE` longtext NOT NULL,
  `COLUMN_KEY` varchar(3) NOT NULL DEFAULT '',
  `EXTRA` varchar(27) NOT NULL DEFAULT '',
  `PRIVILEGES` varchar(80) NOT NULL DEFAULT '',
  `COLUMN_COMMENT` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLUMNS`
--

INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
(NULL, 'information_schema', 'CHARACTER_SETS', 'CHARACTER_SET_NAME', 1, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'CHARACTER_SETS', 'DEFAULT_COLLATE_NAME', 2, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'CHARACTER_SETS', 'DESCRIPTION', 3, '', 'NO', 'varchar', 60, 180, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(60)', '', '', 'select', ''),
(NULL, 'information_schema', 'CHARACTER_SETS', 'MAXLEN', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'COLLATION_NAME', 1, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'CHARACTER_SET_NAME', 2, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'ID', 3, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(11)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'IS_DEFAULT', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'IS_COMPILED', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'SORTLEN', 6, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'COLLATION_NAME', 1, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'CHARACTER_SET_NAME', 2, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'ORDINAL_POSITION', 5, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_DEFAULT', 6, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'IS_NULLABLE', 7, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'DATA_TYPE', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'CHARACTER_MAXIMUM_LENGTH', 9, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'CHARACTER_OCTET_LENGTH', 10, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'NUMERIC_PRECISION', 11, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'NUMERIC_SCALE', 12, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'CHARACTER_SET_NAME', 13, NULL, 'YES', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLLATION_NAME', 14, NULL, 'YES', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_TYPE', 15, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_KEY', 16, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'EXTRA', 17, '', 'NO', 'varchar', 27, 81, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(27)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'PRIVILEGES', 18, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_COMMENT', 19, '', 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'COLUMN_NAME', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'PRIVILEGE_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'IS_GRANTABLE', 7, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'ENGINE', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'SUPPORT', 2, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'COMMENT', 3, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'TRANSACTIONS', 4, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'XA', 5, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'ENGINES', 'SAVEPOINTS', 6, NULL, 'YES', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_CATALOG', 1, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'DEFINER', 4, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'TIME_ZONE', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_BODY', 6, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_DEFINITION', 7, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_TYPE', 8, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EXECUTE_AT', 9, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'INTERVAL_VALUE', 10, NULL, 'YES', 'varchar', 256, 768, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(256)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'INTERVAL_FIELD', 11, NULL, 'YES', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'SQL_MODE', 12, '', 'NO', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'STARTS', 13, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'ENDS', 14, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'STATUS', 15, '', 'NO', 'varchar', 18, 54, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(18)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'ON_COMPLETION', 16, '', 'NO', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'CREATED', 17, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'LAST_ALTERED', 18, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'LAST_EXECUTED', 19, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'EVENT_COMMENT', 20, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'ORIGINATOR', 21, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'CHARACTER_SET_CLIENT', 22, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'COLLATION_CONNECTION', 23, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'EVENTS', 'DATABASE_COLLATION', 24, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'FILE_ID', 1, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'FILE_NAME', 2, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'FILE_TYPE', 3, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TABLESPACE_NAME', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TABLE_CATALOG', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TABLE_SCHEMA', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TABLE_NAME', 7, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'LOGFILE_GROUP_NAME', 8, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'LOGFILE_GROUP_NUMBER', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'ENGINE', 10, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'FULLTEXT_KEYS', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'DELETED_ROWS', 12, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'UPDATE_COUNT', 13, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'FREE_EXTENTS', 14, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TOTAL_EXTENTS', 15, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'EXTENT_SIZE', 16, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'INITIAL_SIZE', 17, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'MAXIMUM_SIZE', 18, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'AUTOEXTEND_SIZE', 19, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'CREATION_TIME', 20, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'LAST_UPDATE_TIME', 21, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'LAST_ACCESS_TIME', 22, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'RECOVER_TIME', 23, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TRANSACTION_COUNTER', 24, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'VERSION', 25, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'ROW_FORMAT', 26, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'TABLE_ROWS', 27, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'AVG_ROW_LENGTH', 28, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'DATA_LENGTH', 29, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'MAX_DATA_LENGTH', 30, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'INDEX_LENGTH', 31, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'DATA_FREE', 32, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'CREATE_TIME', 33, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'UPDATE_TIME', 34, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'CHECK_TIME', 35, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'CHECKSUM', 36, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'STATUS', 37, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'FILES', 'EXTRA', 38, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
(NULL, 'information_schema', 'GLOBAL_STATUS', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'GLOBAL_STATUS', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
(NULL, 'information_schema', 'GLOBAL_VARIABLES', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'GLOBAL_VARIABLES', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_CATALOG', 4, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_NAME', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'COLUMN_NAME', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'ORDINAL_POSITION', 8, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'POSITION_IN_UNIQUE_CONSTRAINT', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_TABLE_SCHEMA', 10, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_TABLE_NAME', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_COLUMN_NAME', 12, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_NAME', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'SUBPARTITION_NAME', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_ORDINAL_POSITION', 6, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'SUBPARTITION_ORDINAL_POSITION', 7, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_METHOD', 8, NULL, 'YES', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'SUBPARTITION_METHOD', 9, NULL, 'YES', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_EXPRESSION', 10, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'SUBPARTITION_EXPRESSION', 11, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_DESCRIPTION', 12, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'TABLE_ROWS', 13, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'AVG_ROW_LENGTH', 14, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'DATA_LENGTH', 15, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'MAX_DATA_LENGTH', 16, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'INDEX_LENGTH', 17, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'DATA_FREE', 18, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'CREATE_TIME', 19, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'UPDATE_TIME', 20, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'CHECK_TIME', 21, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'CHECKSUM', 22, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'PARTITION_COMMENT', 23, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'NODEGROUP', 24, '', 'NO', 'varchar', 12, 36, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(12)', '', '', 'select', ''),
(NULL, 'information_schema', 'PARTITIONS', 'TABLESPACE_NAME', 25, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_VERSION', 2, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_STATUS', 3, '', 'NO', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_TYPE', 4, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_TYPE_VERSION', 5, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_LIBRARY', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_LIBRARY_VERSION', 7, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_AUTHOR', 8, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_DESCRIPTION', 9, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'PLUGINS', 'PLUGIN_LICENSE', 10, NULL, 'YES', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'ID', 1, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'USER', 2, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'HOST', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'DB', 4, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'COMMAND', 5, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'TIME', 6, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(7)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'STATE', 7, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'INFO', 8, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'QUERY_ID', 1, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SEQ', 2, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'STATE', 3, '', 'NO', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'DURATION', 4, '0.000000', 'NO', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'CPU_USER', 5, NULL, 'YES', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'CPU_SYSTEM', 6, NULL, 'YES', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'CONTEXT_VOLUNTARY', 7, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'CONTEXT_INVOLUNTARY', 8, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'BLOCK_OPS_IN', 9, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'BLOCK_OPS_OUT', 10, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'MESSAGES_SENT', 11, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'MESSAGES_RECEIVED', 12, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'PAGE_FAULTS_MAJOR', 13, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'PAGE_FAULTS_MINOR', 14, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SWAPS', 15, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SOURCE_FUNCTION', 16, NULL, 'YES', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SOURCE_FILE', 17, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SOURCE_LINE', 18, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_CATALOG', 4, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UNIQUE_CONSTRAINT_NAME', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'MATCH_OPTION', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'UPDATE_RULE', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'DELETE_RULE', 9, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'TABLE_NAME', 10, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'REFERENCED_TABLE_NAME', 11, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SPECIFIC_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_TYPE', 5, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'DTD_IDENTIFIER', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_BODY', 7, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_DEFINITION', 8, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'EXTERNAL_NAME', 9, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'EXTERNAL_LANGUAGE', 10, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'PARAMETER_STYLE', 11, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'IS_DETERMINISTIC', 12, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SQL_DATA_ACCESS', 13, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SQL_PATH', 14, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SECURITY_TYPE', 15, '', 'NO', 'varchar', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(7)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'CREATED', 16, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'LAST_ALTERED', 17, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SQL_MODE', 18, '', 'NO', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_COMMENT', 19, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'DEFINER', 20, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'CHARACTER_SET_CLIENT', 21, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'COLLATION_CONNECTION', 22, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'DATABASE_COLLATION', 23, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'CATALOG_NAME', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'SCHEMA_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'DEFAULT_CHARACTER_SET_NAME', 3, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'DEFAULT_COLLATION_NAME', 4, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'SQL_PATH', 5, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'PRIVILEGE_TYPE', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'IS_GRANTABLE', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'SESSION_STATUS', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SESSION_STATUS', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
(NULL, 'information_schema', 'SESSION_VARIABLES', 'VARIABLE_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SESSION_VARIABLES', 'VARIABLE_VALUE', 2, NULL, 'YES', 'varchar', 1024, 3072, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1024)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'NON_UNIQUE', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(1)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'INDEX_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'INDEX_NAME', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'SEQ_IN_INDEX', 7, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(2)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'COLUMN_NAME', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'COLLATION', 9, NULL, 'YES', 'varchar', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'CARDINALITY', 10, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'SUB_PART', 11, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'PACKED', 12, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'NULLABLE', 13, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'INDEX_TYPE', 14, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'COMMENT', 15, NULL, 'YES', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_TYPE', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'ENGINE', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'VERSION', 6, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'ROW_FORMAT', 7, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_ROWS', 8, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'AVG_ROW_LENGTH', 9, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'DATA_LENGTH', 10, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'MAX_DATA_LENGTH', 11, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'INDEX_LENGTH', 12, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'DATA_FREE', 13, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'AUTO_INCREMENT', 14, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'CREATE_TIME', 15, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'UPDATE_TIME', 16, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'CHECK_TIME', 17, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_COLLATION', 18, NULL, 'YES', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'CHECKSUM', 19, NULL, 'YES', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(21) unsigned', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'CREATE_OPTIONS', 20, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_COMMENT', 21, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'TABLE_SCHEMA', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'TABLE_NAME', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'PRIVILEGE_TYPE', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'IS_GRANTABLE', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'TRIGGER_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'TRIGGER_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'TRIGGER_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'EVENT_MANIPULATION', 4, '', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_CATALOG', 5, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_SCHEMA', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_TABLE', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_ORDER', 8, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_CONDITION', 9, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_STATEMENT', 10, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_ORIENTATION', 11, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_TIMING', 12, '', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_OLD_TABLE', 13, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_NEW_TABLE', 14, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_OLD_ROW', 15, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_NEW_ROW', 16, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'CREATED', 17, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'SQL_MODE', 18, '', 'NO', 'varchar', 8192, 24576, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8192)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'DEFINER', 19, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'CHARACTER_SET_CLIENT', 20, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'COLLATION_CONNECTION', 21, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
(NULL, 'information_schema', 'TRIGGERS', 'DATABASE_COLLATION', 22, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'PRIVILEGE_TYPE', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'IS_GRANTABLE', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'VIEW_DEFINITION', 4, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'CHECK_OPTION', 5, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'IS_UPDATABLE', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'DEFINER', 7, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'SECURITY_TYPE', 8, '', 'NO', 'varchar', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(7)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'CHARACTER_SET_CLIENT', 9, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'COLLATION_CONNECTION', 10, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', '', '', 'select', ''),
(NULL, 'dlindem3', 'game', 'Home', 1, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'game', 'Away', 2, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', '', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'game', 'Date', 3, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'game', 'Odds', 4, NULL, 'NO', 'varchar', 10, 10, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(10)', '', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'pool', 'conference', 1, NULL, 'NO', 'varchar', 3, 3, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(3)', '', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'pool', 'commissioner', 2, NULL, 'NO', 'varchar', 45, 45, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'pool', 'deadline', 3, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'pool', 'password', 4, NULL, 'YES', 'varchar', 45, 45, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'pool', 'pool_id', 5, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'pool', 'name', 6, NULL, 'NO', 'varchar', 45, 45, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(45)', 'PRI', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'pool_users', 'name', 1, NULL, 'NO', 'varchar', 25, 25, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(25)', 'PRI', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'pool_users', 'pool_id', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'pool_users', 'user', 3, NULL, 'YES', 'varchar', 45, 45, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'team', 'Name', 1, NULL, 'NO', 'varchar', 30, 30, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(30)', 'PRI', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'team', 'Conference', 2, NULL, 'NO', 'varchar', 45, 45, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(45)', 'PRI', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'team', 'Record', 3, NULL, 'YES', 'varchar', 45, 45, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'team', 'Logo', 4, NULL, 'YES', 'varchar', 45, 45, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'useraccount', 'Name', 1, NULL, 'NO', 'varchar', 25, 25, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(25)', 'PRI', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'useraccount', 'Password', 2, NULL, 'NO', 'varchar', 14, 14, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(14)', '', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'useraccount', 'Email', 3, NULL, 'NO', 'varchar', 50, 50, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(50)', 'PRI', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'useraccount', 'Firstname', 4, NULL, 'NO', 'varchar', 20, 20, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
(NULL, 'dlindem3', 'useraccount', 'Lastname', 5, NULL, 'NO', 'varchar', 20, 20, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'six_drops', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'test', 'six_drops', 'tier_one', 2, NULL, 'NO', 'varchar', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'six_drops', 'tier_two', 3, NULL, 'NO', 'varchar', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'six_drops', 'tier_three', 4, NULL, 'NO', 'varchar', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'six_drops', 'tier_four', 5, NULL, 'NO', 'varchar', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'six_drops', 'tier_five', 6, NULL, 'NO', 'varchar', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'six_drops', 'tier_six', 7, NULL, 'NO', 'varchar', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_cntctfrm_field', 'id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_cntctfrm_field', 'name', 2, NULL, 'NO', 'char', 100, 100, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'char(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_commentmeta', 'meta_id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_commentmeta', 'comment_id', 2, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_commentmeta', 'meta_key', 3, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_commentmeta', 'meta_value', 4, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_comments', 'comment_ID', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_comments', 'comment_post_ID', 2, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_comments', 'comment_author', 3, NULL, 'NO', 'tinytext', 255, 255, NULL, NULL, 'utf8', 'utf8_general_ci', 'tinytext', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_comments', 'comment_author_email', 4, '', 'NO', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_comments', 'comment_author_url', 5, '', 'NO', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_comments', 'comment_author_IP', 6, '', 'NO', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_comments', 'comment_date', 7, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_comments', 'comment_date_gmt', 8, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_comments', 'comment_content', 9, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_comments', 'comment_karma', 10, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_comments', 'comment_approved', 11, '1', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_comments', 'comment_agent', 12, '', 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_comments', 'comment_type', 13, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_comments', 'comment_parent', 14, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_comments', 'user_id', 15, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_links', 'link_id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_links', 'link_url', 2, '', 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_links', 'link_name', 3, '', 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_links', 'link_image', 4, '', 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_links', 'link_target', 5, '', 'NO', 'varchar', 25, 75, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(25)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_links', 'link_description', 6, '', 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_links', 'link_visible', 7, 'Y', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_links', 'link_owner', 8, '1', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_links', 'link_rating', 9, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_links', 'link_updated', 10, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_links', 'link_rel', 11, '', 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_links', 'link_notes', 12, NULL, 'NO', 'mediumtext', 16777215, 16777215, NULL, NULL, 'utf8', 'utf8_general_ci', 'mediumtext', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_links', 'link_rss', 13, '', 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_options', 'option_id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_options', 'option_name', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', 'UNI', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_options', 'option_value', 3, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_options', 'autoload', 4, 'yes', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_postmeta', 'meta_id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_postmeta', 'post_id', 2, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_postmeta', 'meta_key', 3, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_postmeta', 'meta_value', 4, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'ID', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'post_author', 2, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'post_date', 3, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'post_date_gmt', 4, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'post_content', 5, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'post_title', 6, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'post_excerpt', 7, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'post_status', 8, 'publish', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'comment_status', 9, 'open', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'ping_status', 10, 'open', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'post_password', 11, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'post_name', 12, '', 'NO', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'to_ping', 13, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'pinged', 14, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_general_ci', 'text', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'post_modified', 15, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'post_modified_gmt', 16, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'post_content_filtered', 17, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'post_parent', 18, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'guid', 19, '', 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'menu_order', 20, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'post_type', 21, 'post', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'post_mime_type', 22, '', 'NO', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_posts', 'comment_count', 23, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_term_relationships', 'object_id', 1, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_term_relationships', 'term_taxonomy_id', 2, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_term_relationships', 'term_order', 3, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_term_taxonomy', 'term_taxonomy_id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_term_taxonomy', 'term_id', 2, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_term_taxonomy', 'taxonomy', 3, '', 'NO', 'varchar', 32, 96, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(32)', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_term_taxonomy', 'description', 4, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_term_taxonomy', 'parent', 5, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_term_taxonomy', 'count', 6, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_terms', 'term_id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_terms', 'name', 2, '', 'NO', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_terms', 'slug', 3, '', 'NO', 'varchar', 200, 600, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(200)', 'UNI', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_terms', 'term_group', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_usermeta', 'umeta_id', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_usermeta', 'user_id', 2, '0', 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_usermeta', 'meta_key', 3, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_usermeta', 'meta_value', 4, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_users', 'ID', 1, NULL, 'NO', 'bigint', NULL, NULL, 20, 0, NULL, NULL, 'bigint(20) unsigned', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_users', 'user_login', 2, '', 'NO', 'varchar', 60, 180, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(60)', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_users', 'user_pass', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_users', 'user_nicename', 4, '', 'NO', 'varchar', 50, 150, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(50)', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_users', 'user_email', 5, '', 'NO', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_users', 'user_url', 6, '', 'NO', 'varchar', 100, 300, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(100)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_users', 'user_registered', 7, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_users', 'user_activation_key', 8, '', 'NO', 'varchar', 60, 180, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(60)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_users', 'user_status', 9, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'test', 'wp_users', 'display_name', 10, '', 'NO', 'varchar', 250, 750, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(250)', '', '', 'select,insert,update,references', '');

-- --------------------------------------------------------

--
-- Table structure for table `COLUMN_PRIVILEGES`
--

CREATE TEMPORARY TABLE `COLUMN_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ENGINES`
--

CREATE TEMPORARY TABLE `ENGINES` (
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `SUPPORT` varchar(8) NOT NULL DEFAULT '',
  `COMMENT` varchar(80) NOT NULL DEFAULT '',
  `TRANSACTIONS` varchar(3) DEFAULT NULL,
  `XA` varchar(3) DEFAULT NULL,
  `SAVEPOINTS` varchar(3) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ENGINES`
--

INSERT INTO `ENGINES` (`ENGINE`, `SUPPORT`, `COMMENT`, `TRANSACTIONS`, `XA`, `SAVEPOINTS`) VALUES
('MRG_MYISAM', 'YES', 'Collection of identical MyISAM tables', 'NO', 'NO', 'NO'),
('CSV', 'YES', 'CSV storage engine', 'NO', 'NO', 'NO'),
('MyISAM', 'DEFAULT', 'Default engine as of MySQL 3.23 with great performance', 'NO', 'NO', 'NO'),
('InnoDB', 'YES', 'Supports transactions, row-level locking, and foreign keys', 'YES', 'YES', 'YES'),
('MEMORY', 'YES', 'Hash based, stored in memory, useful for temporary tables', 'NO', 'NO', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `EVENTS`
--

CREATE TEMPORARY TABLE `EVENTS` (
  `EVENT_CATALOG` varchar(64) DEFAULT NULL,
  `EVENT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `EVENT_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `TIME_ZONE` varchar(64) NOT NULL DEFAULT '',
  `EVENT_BODY` varchar(8) NOT NULL DEFAULT '',
  `EVENT_DEFINITION` longtext NOT NULL,
  `EVENT_TYPE` varchar(9) NOT NULL DEFAULT '',
  `EXECUTE_AT` datetime DEFAULT NULL,
  `INTERVAL_VALUE` varchar(256) DEFAULT NULL,
  `INTERVAL_FIELD` varchar(18) DEFAULT NULL,
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `STARTS` datetime DEFAULT NULL,
  `ENDS` datetime DEFAULT NULL,
  `STATUS` varchar(18) NOT NULL DEFAULT '',
  `ON_COMPLETION` varchar(12) NOT NULL DEFAULT '',
  `CREATED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `EVENT_COMMENT` varchar(64) NOT NULL DEFAULT '',
  `ORIGINATOR` bigint(10) NOT NULL DEFAULT '0',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `FILES`
--

CREATE TEMPORARY TABLE `FILES` (
  `FILE_ID` bigint(4) NOT NULL DEFAULT '0',
  `FILE_NAME` varchar(64) DEFAULT NULL,
  `FILE_TYPE` varchar(20) NOT NULL DEFAULT '',
  `TABLESPACE_NAME` varchar(64) DEFAULT NULL,
  `TABLE_CATALOG` varchar(64) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) DEFAULT NULL,
  `TABLE_NAME` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NAME` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NUMBER` bigint(4) DEFAULT NULL,
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `FULLTEXT_KEYS` varchar(64) DEFAULT NULL,
  `DELETED_ROWS` bigint(4) DEFAULT NULL,
  `UPDATE_COUNT` bigint(4) DEFAULT NULL,
  `FREE_EXTENTS` bigint(4) DEFAULT NULL,
  `TOTAL_EXTENTS` bigint(4) DEFAULT NULL,
  `EXTENT_SIZE` bigint(4) NOT NULL DEFAULT '0',
  `INITIAL_SIZE` bigint(21) unsigned DEFAULT NULL,
  `MAXIMUM_SIZE` bigint(21) unsigned DEFAULT NULL,
  `AUTOEXTEND_SIZE` bigint(21) unsigned DEFAULT NULL,
  `CREATION_TIME` datetime DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime DEFAULT NULL,
  `LAST_ACCESS_TIME` datetime DEFAULT NULL,
  `RECOVER_TIME` bigint(4) DEFAULT NULL,
  `TRANSACTION_COUNTER` bigint(4) DEFAULT NULL,
  `VERSION` bigint(21) unsigned DEFAULT NULL,
  `ROW_FORMAT` varchar(10) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `STATUS` varchar(20) NOT NULL DEFAULT '',
  `EXTRA` varchar(255) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `GLOBAL_STATUS`
--

CREATE TEMPORARY TABLE `GLOBAL_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GLOBAL_STATUS`
--

INSERT INTO `GLOBAL_STATUS` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('ABORTED_CLIENTS', '263'),
('ABORTED_CONNECTS', '1113'),
('BINLOG_CACHE_DISK_USE', '0'),
('BINLOG_CACHE_USE', '0'),
('BYTES_RECEIVED', '12187621393'),
('BYTES_SENT', '12662026135'),
('COM_ADMIN_COMMANDS', '1041'),
('COM_ASSIGN_TO_KEYCACHE', '0'),
('COM_ALTER_DB', '1'),
('COM_ALTER_DB_UPGRADE', '0'),
('COM_ALTER_EVENT', '0'),
('COM_ALTER_FUNCTION', '0'),
('COM_ALTER_PROCEDURE', '0'),
('COM_ALTER_SERVER', '0'),
('COM_ALTER_TABLE', '454'),
('COM_ALTER_TABLESPACE', '0'),
('COM_ANALYZE', '0'),
('COM_BACKUP_TABLE', '0'),
('COM_BEGIN', '219'),
('COM_BINLOG', '0'),
('COM_CALL_PROCEDURE', '0'),
('COM_CHANGE_DB', '228947'),
('COM_CHANGE_MASTER', '0'),
('COM_CHECK', '1'),
('COM_CHECKSUM', '0'),
('COM_COMMIT', '228'),
('COM_CREATE_DB', '802'),
('COM_CREATE_EVENT', '0'),
('COM_CREATE_FUNCTION', '0'),
('COM_CREATE_INDEX', '44'),
('COM_CREATE_PROCEDURE', '0'),
('COM_CREATE_SERVER', '0'),
('COM_CREATE_TABLE', '927'),
('COM_CREATE_TRIGGER', '1'),
('COM_CREATE_UDF', '0'),
('COM_CREATE_USER', '0'),
('COM_CREATE_VIEW', '0'),
('COM_DEALLOC_SQL', '0'),
('COM_DELETE', '19906'),
('COM_DELETE_MULTI', '2'),
('COM_DO', '0'),
('COM_DROP_DB', '0'),
('COM_DROP_EVENT', '0'),
('COM_DROP_FUNCTION', '0'),
('COM_DROP_INDEX', '3'),
('COM_DROP_PROCEDURE', '0'),
('COM_DROP_SERVER', '0'),
('COM_DROP_TABLE', '230'),
('COM_DROP_TRIGGER', '1'),
('COM_DROP_USER', '0'),
('COM_DROP_VIEW', '0'),
('COM_EMPTY_QUERY', '12'),
('COM_EXECUTE_SQL', '0'),
('COM_FLUSH', '80'),
('COM_GRANT', '88'),
('COM_HA_CLOSE', '0'),
('COM_HA_OPEN', '0'),
('COM_HA_READ', '0'),
('COM_HELP', '198'),
('COM_INSERT', '38740026'),
('COM_INSERT_SELECT', '1'),
('COM_INSTALL_PLUGIN', '0'),
('COM_KILL', '4'),
('COM_LOAD', '0'),
('COM_LOAD_MASTER_DATA', '0'),
('COM_LOAD_MASTER_TABLE', '0'),
('COM_LOCK_TABLES', '8'),
('COM_OPTIMIZE', '5'),
('COM_PRELOAD_KEYS', '0'),
('COM_PREPARE_SQL', '0'),
('COM_PURGE', '0'),
('COM_PURGE_BEFORE_DATE', '0'),
('COM_RELEASE_SAVEPOINT', '0'),
('COM_RENAME_TABLE', '7'),
('COM_RENAME_USER', '0'),
('COM_REPAIR', '0'),
('COM_REPLACE', '1898'),
('COM_REPLACE_SELECT', '0'),
('COM_RESET', '0'),
('COM_RESTORE_TABLE', '0'),
('COM_REVOKE', '0'),
('COM_REVOKE_ALL', '0'),
('COM_ROLLBACK', '1'),
('COM_ROLLBACK_TO_SAVEPOINT', '0'),
('COM_SAVEPOINT', '0'),
('COM_SELECT', '2382106'),
('COM_SET_OPTION', '365991'),
('COM_SHOW_AUTHORS', '0'),
('COM_SHOW_BINLOG_EVENTS', '0'),
('COM_SHOW_BINLOGS', '1405'),
('COM_SHOW_CHARSETS', '0'),
('COM_SHOW_COLLATIONS', '0'),
('COM_SHOW_COLUMN_TYPES', '0'),
('COM_SHOW_CONTRIBUTORS', '0'),
('COM_SHOW_CREATE_DB', '3'),
('COM_SHOW_CREATE_EVENT', '0'),
('COM_SHOW_CREATE_FUNC', '0'),
('COM_SHOW_CREATE_PROC', '0'),
('COM_SHOW_CREATE_TABLE', '7038'),
('COM_SHOW_CREATE_TRIGGER', '1'),
('COM_SHOW_DATABASES', '3368'),
('COM_SHOW_ENGINE_LOGS', '0'),
('COM_SHOW_ENGINE_MUTEX', '0'),
('COM_SHOW_ENGINE_STATUS', '0'),
('COM_SHOW_EVENTS', '0'),
('COM_SHOW_ERRORS', '0'),
('COM_SHOW_FIELDS', '12025'),
('COM_SHOW_FUNCTION_STATUS', '24'),
('COM_SHOW_GRANTS', '724'),
('COM_SHOW_KEYS', '6246'),
('COM_SHOW_MASTER_STATUS', '1582'),
('COM_SHOW_NEW_MASTER', '0'),
('COM_SHOW_OPEN_TABLES', '0'),
('COM_SHOW_PLUGINS', '484'),
('COM_SHOW_PRIVILEGES', '0'),
('COM_SHOW_PROCEDURE_STATUS', '24'),
('COM_SHOW_PROCESSLIST', '175'),
('COM_SHOW_PROFILE', '3'),
('COM_SHOW_PROFILES', '0'),
('COM_SHOW_SLAVE_HOSTS', '0'),
('COM_SHOW_SLAVE_STATUS', '1583'),
('COM_SHOW_STATUS', '1164'),
('COM_SHOW_STORAGE_ENGINES', '310'),
('COM_SHOW_TABLE_STATUS', '19246'),
('COM_SHOW_TABLES', '7451'),
('COM_SHOW_TRIGGERS', '158'),
('COM_SHOW_VARIABLES', '8790'),
('COM_SHOW_WARNINGS', '971'),
('COM_SLAVE_START', '0'),
('COM_SLAVE_STOP', '0'),
('COM_STMT_CLOSE', '1761'),
('COM_STMT_EXECUTE', '1909'),
('COM_STMT_FETCH', '0'),
('COM_STMT_PREPARE', '1761'),
('COM_STMT_REPREPARE', '0'),
('COM_STMT_RESET', '0'),
('COM_STMT_SEND_LONG_DATA', '0'),
('COM_TRUNCATE', '2412'),
('COM_UNINSTALL_PLUGIN', '0'),
('COM_UNLOCK_TABLES', '8'),
('COM_UPDATE', '26258'),
('COM_UPDATE_MULTI', '12'),
('COM_XA_COMMIT', '0'),
('COM_XA_END', '0'),
('COM_XA_PREPARE', '0'),
('COM_XA_RECOVER', '0'),
('COM_XA_ROLLBACK', '0'),
('COM_XA_START', '0'),
('COMPRESSION', 'OFF'),
('CONNECTIONS', '39025287'),
('CREATED_TMP_DISK_TABLES', '116282'),
('CREATED_TMP_FILES', '452'),
('CREATED_TMP_TABLES', '347196'),
('DELAYED_ERRORS', '0'),
('DELAYED_INSERT_THREADS', '0'),
('DELAYED_WRITES', '0'),
('FLUSH_COMMANDS', '1'),
('HANDLER_COMMIT', '317635'),
('HANDLER_DELETE', '624318'),
('HANDLER_DISCOVER', '0'),
('HANDLER_PREPARE', '0'),
('HANDLER_READ_FIRST', '324110'),
('HANDLER_READ_KEY', '2515702'),
('HANDLER_READ_NEXT', '821672908'),
('HANDLER_READ_PREV', '45086'),
('HANDLER_READ_RND', '493220'),
('HANDLER_READ_RND_NEXT', '863735489'),
('HANDLER_ROLLBACK', '76'),
('HANDLER_SAVEPOINT', '0'),
('HANDLER_SAVEPOINT_ROLLBACK', '0'),
('HANDLER_UPDATE', '38446'),
('HANDLER_WRITE', '5387587'),
('INNODB_BUFFER_POOL_PAGES_DATA', '508'),
('INNODB_BUFFER_POOL_PAGES_DIRTY', '0'),
('INNODB_BUFFER_POOL_PAGES_FLUSHED', '60179'),
('INNODB_BUFFER_POOL_PAGES_FREE', '0'),
('INNODB_BUFFER_POOL_PAGES_MISC', '4'),
('INNODB_BUFFER_POOL_PAGES_TOTAL', '512'),
('INNODB_BUFFER_POOL_READ_AHEAD_RND', '155'),
('INNODB_BUFFER_POOL_READ_AHEAD_SEQ', '21'),
('INNODB_BUFFER_POOL_READ_REQUESTS', '6315085'),
('INNODB_BUFFER_POOL_READS', '4803'),
('INNODB_BUFFER_POOL_WAIT_FREE', '0'),
('INNODB_BUFFER_POOL_WRITE_REQUESTS', '880020'),
('INNODB_DATA_FSYNCS', '56467'),
('INNODB_DATA_PENDING_FSYNCS', '0'),
('INNODB_DATA_PENDING_READS', '0'),
('INNODB_DATA_PENDING_WRITES', '0'),
('INNODB_DATA_READ', '99192832'),
('INNODB_DATA_READS', '5171'),
('INNODB_DATA_WRITES', '87218'),
('INNODB_DATA_WRITTEN', '2189027328'),
('INNODB_DBLWR_PAGES_WRITTEN', '60179'),
('INNODB_DBLWR_WRITES', '4511'),
('INNODB_LOG_WAITS', '0'),
('INNODB_LOG_WRITE_REQUESTS', '414397'),
('INNODB_LOG_WRITES', '43900'),
('INNODB_OS_LOG_FSYNCS', '47451'),
('INNODB_OS_LOG_PENDING_FSYNCS', '0'),
('INNODB_OS_LOG_PENDING_WRITES', '0'),
('INNODB_OS_LOG_WRITTEN', '215218176'),
('INNODB_PAGE_SIZE', '16384'),
('INNODB_PAGES_CREATED', '4718'),
('INNODB_PAGES_READ', '5921'),
('INNODB_PAGES_WRITTEN', '60179'),
('INNODB_ROW_LOCK_CURRENT_WAITS', '0'),
('INNODB_ROW_LOCK_TIME', '527'),
('INNODB_ROW_LOCK_TIME_AVG', '263'),
('INNODB_ROW_LOCK_TIME_MAX', '527'),
('INNODB_ROW_LOCK_WAITS', '2'),
('INNODB_ROWS_DELETED', '41611'),
('INNODB_ROWS_INSERTED', '66963'),
('INNODB_ROWS_READ', '3300717'),
('INNODB_ROWS_UPDATED', '20839'),
('KEY_BLOCKS_NOT_FLUSHED', '0'),
('KEY_BLOCKS_UNUSED', '5410'),
('KEY_BLOCKS_USED', '1420'),
('KEY_READ_REQUESTS', '63890218'),
('KEY_READS', '46407'),
('KEY_WRITE_REQUESTS', '137185'),
('KEY_WRITES', '110349'),
('LAST_QUERY_COST', '0.000000'),
('MAX_USED_CONNECTIONS', '24'),
('NOT_FLUSHED_DELAYED_ROWS', '0'),
('OPEN_FILES', '120'),
('OPEN_STREAMS', '0'),
('OPEN_TABLE_DEFINITIONS', '256'),
('OPEN_TABLES', '64'),
('OPENED_FILES', '517822'),
('OPENED_TABLE_DEFINITIONS', '11957'),
('OPENED_TABLES', '29152'),
('PREPARED_STMT_COUNT', '0'),
('QCACHE_FREE_BLOCKS', '0'),
('QCACHE_FREE_MEMORY', '0'),
('QCACHE_HITS', '0'),
('QCACHE_INSERTS', '0'),
('QCACHE_LOWMEM_PRUNES', '0'),
('QCACHE_NOT_CACHED', '0'),
('QCACHE_QUERIES_IN_CACHE', '0'),
('QCACHE_TOTAL_BLOCKS', '0'),
('QUERIES', '80874652'),
('QUESTIONS', '80871129'),
('RPL_STATUS', 'NULL'),
('SELECT_FULL_JOIN', '1052'),
('SELECT_FULL_RANGE_JOIN', '0'),
('SELECT_RANGE', '95232'),
('SELECT_RANGE_CHECK', '0'),
('SELECT_SCAN', '308245'),
('SLAVE_OPEN_TEMP_TABLES', '0'),
('SLAVE_RETRIED_TRANSACTIONS', '0'),
('SLAVE_RUNNING', 'OFF'),
('SLOW_LAUNCH_THREADS', '1'),
('SLOW_QUERIES', '1'),
('SORT_MERGE_PASSES', '1631'),
('SORT_RANGE', '69245'),
('SORT_ROWS', '4738812'),
('SORT_SCAN', '138402'),
('SSL_ACCEPT_RENEGOTIATES', '0'),
('SSL_ACCEPTS', '0'),
('SSL_CALLBACK_CACHE_HITS', '0'),
('SSL_CIPHER', ''),
('SSL_CIPHER_LIST', ''),
('SSL_CLIENT_CONNECTS', '0'),
('SSL_CONNECT_RENEGOTIATES', '0'),
('SSL_CTX_VERIFY_DEPTH', '0'),
('SSL_CTX_VERIFY_MODE', '0'),
('SSL_DEFAULT_TIMEOUT', '0'),
('SSL_FINISHED_ACCEPTS', '0'),
('SSL_FINISHED_CONNECTS', '0'),
('SSL_SESSION_CACHE_HITS', '0'),
('SSL_SESSION_CACHE_MISSES', '0'),
('SSL_SESSION_CACHE_MODE', 'NONE'),
('SSL_SESSION_CACHE_OVERFLOWS', '0'),
('SSL_SESSION_CACHE_SIZE', '0'),
('SSL_SESSION_CACHE_TIMEOUTS', '0'),
('SSL_SESSIONS_REUSED', '0'),
('SSL_USED_SESSION_CACHE_ENTRIES', '0'),
('SSL_VERIFY_DEPTH', '0'),
('SSL_VERIFY_MODE', '0'),
('SSL_VERSION', ''),
('TABLE_LOCKS_IMMEDIATE', '5673467'),
('TABLE_LOCKS_WAITED', '1023095'),
('TC_LOG_MAX_PAGES_USED', '0'),
('TC_LOG_PAGE_SIZE', '0'),
('TC_LOG_PAGE_WAITS', '0'),
('THREADS_CACHED', '0'),
('THREADS_CONNECTED', '5'),
('THREADS_CREATED', '39025286'),
('THREADS_RUNNING', '1'),
('UPTIME', '13176795'),
('UPTIME_SINCE_FLUSH_STATUS', '13176795');

-- --------------------------------------------------------

--
-- Table structure for table `GLOBAL_VARIABLES`
--

CREATE TEMPORARY TABLE `GLOBAL_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GLOBAL_VARIABLES`
--

INSERT INTO `GLOBAL_VARIABLES` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('MAX_PREPARED_STMT_COUNT', '16382'),
('CHARACTER_SETS_DIR', '/usr/share/mysql/charsets/'),
('HAVE_CRYPT', 'YES'),
('CONNECT_TIMEOUT', '10'),
('MYISAM_REPAIR_THREADS', '1'),
('AUTOMATIC_SP_PRIVILEGES', 'ON'),
('MAX_CONNECT_ERRORS', '10'),
('BINLOG_CACHE_SIZE', '32768'),
('INNODB_CONCURRENCY_TICKETS', '500'),
('BACK_LOG', '50'),
('MAX_CONNECTIONS', '151'),
('STORAGE_ENGINE', 'MyISAM'),
('DELAYED_INSERT_TIMEOUT', '300'),
('MAX_LENGTH_FOR_SORT_DATA', '1024'),
('LOG_BIN_TRUST_ROUTINE_CREATORS', 'OFF'),
('CHARACTER_SET_CONNECTION', 'latin1'),
('SSL_CIPHER', ''),
('CHARACTER_SET_RESULTS', 'latin1'),
('BASEDIR', '/usr/'),
('LARGE_PAGES', 'OFF'),
('UPDATABLE_VIEWS_WITH_LIMIT', 'YES'),
('TABLE_DEFINITION_CACHE', '256'),
('SLOW_LAUNCH_TIME', '2'),
('QUERY_ALLOC_BLOCK_SIZE', '8192'),
('INNODB_LOCK_WAIT_TIMEOUT', '50'),
('COMPLETION_TYPE', '0'),
('RELAY_LOG_INDEX', ''),
('COLLATION_SERVER', 'latin1_swedish_ci'),
('SQL_QUOTE_SHOW_CREATE', 'ON'),
('EVENT_SCHEDULER', 'OFF'),
('SQL_LOG_UPDATE', 'ON'),
('COLLATION_DATABASE', 'latin1_swedish_ci'),
('INNODB_USE_LEGACY_CARDINALITY_ALGORITHM', 'ON'),
('FT_MAX_WORD_LEN', '84'),
('LOCKED_IN_MEMORY', 'OFF'),
('CONCURRENT_INSERT', '1'),
('MYISAM_RECOVER_OPTIONS', 'OFF'),
('NET_WRITE_TIMEOUT', '60'),
('REPORT_HOST', ''),
('AUTO_INCREMENT_OFFSET', '1'),
('SSL_KEY', ''),
('FLUSH', 'OFF'),
('CHARACTER_SET_DATABASE', 'latin1'),
('DELAYED_INSERT_LIMIT', '100'),
('SLAVE_SKIP_ERRORS', 'OFF'),
('FT_QUERY_EXPANSION_LIMIT', '20'),
('INSERT_ID', '0'),
('SQL_LOW_PRIORITY_UPDATES', 'OFF'),
('RELAY_LOG_PURGE', 'ON'),
('LANGUAGE', '/usr/share/mysql/english/'),
('SKIP_SHOW_DATABASE', 'OFF'),
('KEY_CACHE_AGE_THRESHOLD', '300'),
('GROUP_CONCAT_MAX_LEN', '1024'),
('JOIN_BUFFER_SIZE', '131072'),
('INNODB_LOG_BUFFER_SIZE', '1048576'),
('LOG', 'OFF'),
('VERSION_COMPILE_MACHINE', 'x86_64'),
('READ_BUFFER_SIZE', '131072'),
('INNODB_MAX_PURGE_LAG', '0'),
('DELAYED_QUEUE_SIZE', '1000'),
('TRANSACTION_PREALLOC_SIZE', '4096'),
('INTERACTIVE_TIMEOUT', '28800'),
('VERSION_COMPILE_OS', 'redhat-linux-gnu'),
('WAIT_TIMEOUT', '28800'),
('SQL_NOTES', 'ON'),
('TABLE_OPEN_CACHE', '64'),
('LOW_PRIORITY_UPDATES', 'OFF'),
('LARGE_PAGE_SIZE', '0'),
('REPORT_PASSWORD', ''),
('INIT_SLAVE', ''),
('MAX_INSERT_DELAYED_THREADS', '20'),
('MAX_BINLOG_SIZE', '1073741824'),
('HAVE_COMPRESS', 'YES'),
('MAX_ERROR_COUNT', '64'),
('TRANSACTION_ALLOC_BLOCK_SIZE', '8192'),
('FT_MIN_WORD_LEN', '4'),
('THREAD_CACHE_SIZE', '0'),
('LOG_WARNINGS', '2'),
('INNODB_DOUBLEWRITE', 'ON'),
('SQL_LOG_OFF', 'OFF'),
('PSEUDO_THREAD_ID', '0'),
('MAX_LONG_DATA_SIZE', '52428800'),
('DEFAULT_WEEK_FORMAT', '0'),
('INNODB_FLUSH_METHOD', ''),
('LOG_OUTPUT', 'FILE'),
('LOWER_CASE_TABLE_NAMES', '0'),
('MAX_RELAY_LOG_SIZE', '0'),
('MYISAM_STATS_METHOD', 'nulls_unequal'),
('PROTOCOL_VERSION', '10'),
('NET_RETRY_COUNT', '10'),
('HAVE_SYMLINK', 'DISABLED'),
('MAX_SORT_LENGTH', '1024'),
('TIME_ZONE', 'SYSTEM'),
('MAX_HEAP_TABLE_SIZE', '16777216'),
('INNODB_TABLE_LOCKS', 'ON'),
('FT_BOOLEAN_SYNTAX', '+ -><()~*:""&|'),
('INNODB_AUTOEXTEND_INCREMENT', '8'),
('LOG_QUERIES_NOT_USING_INDEXES', 'OFF'),
('MYISAM_DATA_POINTER_SIZE', '6'),
('NET_BUFFER_LENGTH', '16384'),
('INNODB_THREAD_SLEEP_DELAY', '10000'),
('FT_STOPWORD_FILE', '(built-in)'),
('SQL_AUTO_IS_NULL', 'ON'),
('DELAY_KEY_WRITE', 'ON'),
('SLAVE_TRANSACTION_RETRIES', '10'),
('MULTI_RANGE_COUNT', '256'),
('LOG_ERROR', '/var/log/mysqld.log'),
('LONG_QUERY_TIME', '10.000000'),
('GENERAL_LOG', 'OFF'),
('BULK_INSERT_BUFFER_SIZE', '8388608'),
('TABLE_TYPE', 'MyISAM'),
('SLAVE_MAX_ALLOWED_PACKET', '1073741824'),
('QUERY_CACHE_MIN_RES_UNIT', '4096'),
('MYISAM_USE_MMAP', 'OFF'),
('INNODB_STATS_ON_METADATA', 'ON'),
('MAX_BINLOG_CACHE_SIZE', '18446744073709547520'),
('INNODB_ROLLBACK_ON_TIMEOUT', 'OFF'),
('QUERY_CACHE_TYPE', 'ON'),
('PROFILING_HISTORY_SIZE', '15'),
('CHARACTER_SET_FILESYSTEM', 'binary'),
('INNODB_ADDITIONAL_MEM_POOL_SIZE', '1048576'),
('TX_ISOLATION', 'REPEATABLE-READ'),
('READ_RND_BUFFER_SIZE', '262144'),
('THREAD_HANDLING', 'one-thread-per-connection'),
('SECURE_AUTH', 'OFF'),
('BINLOG_DIRECT_NON_TRANSACTIONAL_UPDATES', 'OFF'),
('BIG_TABLES', 'OFF'),
('FLUSH_TIME', '0'),
('SQL_SELECT_LIMIT', '18446744073709551615'),
('HAVE_INNODB', 'YES'),
('DATE_FORMAT', '%Y-%m-%d'),
('OLD_PASSWORDS', 'OFF'),
('READ_ONLY', 'OFF'),
('QUERY_PREALLOC_SIZE', '8192'),
('RAND_SEED1', ''),
('SLOW_QUERY_LOG_FILE', '/var/run/mysqld/mysqld-slow.log'),
('INNODB_DATA_FILE_PATH', 'ibdata1:10M:autoextend'),
('MAX_SEEKS_FOR_KEY', '18446744073709551615'),
('QUERY_CACHE_LIMIT', '1048576'),
('SYSTEM_TIME_ZONE', 'EST'),
('PROFILING', 'OFF'),
('SSL_CERT', ''),
('QUERY_CACHE_SIZE', '0'),
('MYISAM_MAX_SORT_FILE_SIZE', '9223372036853727232'),
('KEY_CACHE_DIVISION_LIMIT', '100'),
('THREAD_STACK', '262144'),
('GENERAL_LOG_FILE', '/var/run/mysqld/mysqld.log'),
('OPEN_FILES_LIMIT', '1024'),
('MYISAM_SORT_BUFFER_SIZE', '8388608'),
('SKIP_NAME_RESOLVE', 'OFF'),
('AUTO_INCREMENT_INCREMENT', '1'),
('LAST_INSERT_ID', '0'),
('TMPDIR', '/tmp'),
('PID_FILE', '/var/run/mysqld/mysqld.pid'),
('EXPIRE_LOGS_DAYS', '0'),
('MAX_TMP_TABLES', '32'),
('HAVE_PARTITIONING', 'YES'),
('MIN_EXAMINED_ROW_LIMIT', '0'),
('FOREIGN_KEY_CHECKS', 'ON'),
('LARGE_FILES_SUPPORT', 'ON'),
('RELAY_LOG_INFO_FILE', 'relay-log.info'),
('SSL_CAPATH', ''),
('INNODB_AUTOINC_LOCK_MODE', '1'),
('VERSION_COMMENT', 'Source distribution'),
('INNODB_COMMIT_CONCURRENCY', '0'),
('OPTIMIZER_SWITCH', 'index_merge=on,index_merge_union=on,index_merge_sort_union=on,index_merge_intersection=on'),
('INNODB_MIRRORED_LOG_GROUPS', '1'),
('OPTIMIZER_PRUNE_LEVEL', '1'),
('UNIQUE_CHECKS', 'ON'),
('QUERY_CACHE_WLOCK_INVALIDATE', 'OFF'),
('VERSION', '5.1.69'),
('MAX_WRITE_LOCK_COUNT', '18446744073709551615'),
('INNODB_SUPPORT_XA', 'ON'),
('TIMED_MUTEXES', 'OFF'),
('INNODB_SYNC_SPIN_LOOPS', '20'),
('INIT_FILE', ''),
('COLLATION_CONNECTION', 'latin1_swedish_ci'),
('LC_TIME_NAMES', 'en_US'),
('HAVE_QUERY_CACHE', 'YES'),
('SERVER_ID', '0'),
('INNODB_ADAPTIVE_HASH_INDEX', 'ON'),
('SKIP_NETWORKING', 'OFF'),
('RPL_RECOVERY_RANK', '0'),
('CHARACTER_SET_SYSTEM', 'utf8'),
('DIV_PRECISION_INCREMENT', '4'),
('INIT_CONNECT', ''),
('DATADIR', '/var/lib/mysql/'),
('OPTIMIZER_SEARCH_DEPTH', '62'),
('INNODB_DATA_HOME_DIR', ''),
('AUTOCOMMIT', 'ON'),
('SKIP_EXTERNAL_LOCKING', 'ON'),
('KEY_CACHE_BLOCK_SIZE', '1024'),
('SQL_SLAVE_SKIP_COUNTER', ''),
('SQL_BIG_TABLES', 'OFF'),
('TIME_FORMAT', '%H:%i:%s'),
('TMP_TABLE_SIZE', '16777216'),
('INNODB_FORCE_RECOVERY', '0'),
('TABLE_LOCK_WAIT_TIMEOUT', '50'),
('INNODB_LOG_FILES_IN_GROUP', '2'),
('CHARACTER_SET_SERVER', 'latin1'),
('ERROR_COUNT', '0'),
('HOSTNAME', 'lamp.eng.fau.edu'),
('HAVE_DYNAMIC_LOADING', 'YES'),
('SQL_BUFFER_RESULT', 'OFF'),
('SYNC_BINLOG', '0'),
('LOG_BIN', 'OFF'),
('RELAY_LOG_SPACE_LIMIT', '0'),
('SQL_MODE', ''),
('INNODB_OPEN_FILES', '300'),
('MAX_USER_CONNECTIONS', '0'),
('OLD', 'OFF'),
('SLAVE_EXEC_MODE', 'STRICT'),
('INNODB_MAX_DIRTY_PAGES_PCT', '90'),
('SQL_MAX_JOIN_SIZE', '18446744073709551615'),
('HAVE_COMMUNITY_FEATURES', 'YES'),
('NEW', 'OFF'),
('KEY_BUFFER_SIZE', '8384512'),
('SECURE_FILE_PRIV', ''),
('HAVE_NDBCLUSTER', 'NO'),
('KEEP_FILES_ON_CREATE', 'OFF'),
('REPORT_PORT', '3306'),
('REPORT_USER', ''),
('INNODB_STATS_METHOD', 'nulls_equal'),
('ENGINE_CONDITION_PUSHDOWN', 'ON'),
('INNODB_FAST_SHUTDOWN', '1'),
('SQL_LOG_BIN', 'ON'),
('SSL_CA', ''),
('LOWER_CASE_FILE_SYSTEM', 'OFF'),
('INNODB_THREAD_CONCURRENCY', '8'),
('HAVE_CSV', 'YES'),
('SLAVE_NET_TIMEOUT', '3600'),
('SQL_SAFE_UPDATES', 'OFF'),
('INNODB_BUFFER_POOL_SIZE', '8388608'),
('PRELOAD_BUFFER_SIZE', '32768'),
('LOCAL_INFILE', 'ON'),
('SLAVE_COMPRESSED_PROTOCOL', 'OFF'),
('HAVE_RTREE_KEYS', 'YES'),
('HAVE_GEOMETRY', 'YES'),
('BINLOG_FORMAT', 'STATEMENT'),
('MAX_SP_RECURSION_DEPTH', '0'),
('OLD_ALTER_TABLE', 'OFF'),
('RELAY_LOG', ''),
('MYISAM_MMAP_SIZE', '18446744073709551615'),
('PLUGIN_DIR', '/usr/lib64/mysql/plugin'),
('LOG_SLOW_QUERIES', 'OFF'),
('IGNORE_BUILTIN_INNODB', 'OFF'),
('TIMESTAMP', '1398754885'),
('NET_READ_TIMEOUT', '30'),
('MAX_DELAYED_THREADS', '20'),
('SYNC_FRM', 'ON'),
('DATETIME_FORMAT', '%Y-%m-%d %H:%i:%s'),
('SLOW_QUERY_LOG', 'OFF'),
('INNODB_FLUSH_LOG_AT_TRX_COMMIT', '1'),
('WARNING_COUNT', '0'),
('INNODB_FILE_IO_THREADS', '4'),
('MAX_ALLOWED_PACKET', '52428800'),
('LICENSE', 'GPL'),
('SQL_BIG_SELECTS', 'ON'),
('RANGE_ALLOC_BLOCK_SIZE', '4096'),
('INNODB_CHECKSUMS', 'ON'),
('PORT', '3306'),
('INNODB_LOCKS_UNSAFE_FOR_BINLOG', 'OFF'),
('HAVE_SSL', 'DISABLED'),
('INNODB_LOG_FILE_SIZE', '5242880'),
('LOG_BIN_TRUST_FUNCTION_CREATORS', 'OFF'),
('LOG_SLAVE_UPDATES', 'OFF'),
('MAX_JOIN_SIZE', '18446744073709551615'),
('SORT_BUFFER_SIZE', '2097144'),
('HAVE_OPENSSL', 'DISABLED'),
('INNODB_FILE_PER_TABLE', 'OFF'),
('INNODB_LOG_GROUP_HOME_DIR', './'),
('SOCKET', '/var/lib/mysql/mysql.sock'),
('CHARACTER_SET_CLIENT', 'latin1'),
('RAND_SEED2', ''),
('IDENTITY', '0'),
('SQL_WARNINGS', 'OFF'),
('SLAVE_LOAD_TMPDIR', '/tmp');

-- --------------------------------------------------------

--
-- Table structure for table `KEY_COLUMN_USAGE`
--

CREATE TEMPORARY TABLE `KEY_COLUMN_USAGE` (
  `CONSTRAINT_CATALOG` varchar(512) DEFAULT NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(10) NOT NULL DEFAULT '0',
  `POSITION_IN_UNIQUE_CONSTRAINT` bigint(10) DEFAULT NULL,
  `REFERENCED_TABLE_SCHEMA` varchar(64) DEFAULT NULL,
  `REFERENCED_TABLE_NAME` varchar(64) DEFAULT NULL,
  `REFERENCED_COLUMN_NAME` varchar(64) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `KEY_COLUMN_USAGE`
--

INSERT INTO `KEY_COLUMN_USAGE` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `POSITION_IN_UNIQUE_CONSTRAINT`, `REFERENCED_TABLE_SCHEMA`, `REFERENCED_TABLE_NAME`, `REFERENCED_COLUMN_NAME`) VALUES
(NULL, 'dlindem3', 'PRIMARY', NULL, 'dlindem3', 'pool', 'pool_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'dlindem3', 'PRIMARY', NULL, 'dlindem3', 'pool', 'name', 2, NULL, NULL, NULL, NULL),
(NULL, 'dlindem3', 'PRIMARY', NULL, 'dlindem3', 'pool_users', 'name', 1, NULL, NULL, NULL, NULL),
(NULL, 'dlindem3', 'PRIMARY', NULL, 'dlindem3', 'pool_users', 'pool_id', 2, NULL, NULL, NULL, NULL),
(NULL, 'dlindem3', 'PRIMARY', NULL, 'dlindem3', 'team', 'Name', 1, NULL, NULL, NULL, NULL),
(NULL, 'dlindem3', 'PRIMARY', NULL, 'dlindem3', 'team', 'Conference', 2, NULL, NULL, NULL, NULL),
(NULL, 'dlindem3', 'PRIMARY', NULL, 'dlindem3', 'useraccount', 'Name', 1, NULL, NULL, NULL, NULL),
(NULL, 'dlindem3', 'PRIMARY', NULL, 'dlindem3', 'useraccount', 'Email', 2, NULL, NULL, NULL, NULL),
(NULL, 'dlindem3', 'Email', NULL, 'dlindem3', 'useraccount', 'Email', 1, NULL, NULL, NULL, NULL),
(NULL, 'test', 'PRIMARY', NULL, 'test', 'six_drops', 'id', 1, NULL, NULL, NULL, NULL),
(NULL, 'test', 'id', NULL, 'test', 'wp_cntctfrm_field', 'id', 1, NULL, NULL, NULL, NULL),
(NULL, 'test', 'PRIMARY', NULL, 'test', 'wp_commentmeta', 'meta_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'test', 'PRIMARY', NULL, 'test', 'wp_comments', 'comment_ID', 1, NULL, NULL, NULL, NULL),
(NULL, 'test', 'PRIMARY', NULL, 'test', 'wp_links', 'link_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'test', 'PRIMARY', NULL, 'test', 'wp_options', 'option_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'test', 'option_name', NULL, 'test', 'wp_options', 'option_name', 1, NULL, NULL, NULL, NULL),
(NULL, 'test', 'PRIMARY', NULL, 'test', 'wp_postmeta', 'meta_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'test', 'PRIMARY', NULL, 'test', 'wp_posts', 'ID', 1, NULL, NULL, NULL, NULL),
(NULL, 'test', 'PRIMARY', NULL, 'test', 'wp_term_relationships', 'object_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'test', 'PRIMARY', NULL, 'test', 'wp_term_relationships', 'term_taxonomy_id', 2, NULL, NULL, NULL, NULL),
(NULL, 'test', 'PRIMARY', NULL, 'test', 'wp_term_taxonomy', 'term_taxonomy_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'test', 'term_id_taxonomy', NULL, 'test', 'wp_term_taxonomy', 'term_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'test', 'term_id_taxonomy', NULL, 'test', 'wp_term_taxonomy', 'taxonomy', 2, NULL, NULL, NULL, NULL),
(NULL, 'test', 'PRIMARY', NULL, 'test', 'wp_terms', 'term_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'test', 'slug', NULL, 'test', 'wp_terms', 'slug', 1, NULL, NULL, NULL, NULL),
(NULL, 'test', 'PRIMARY', NULL, 'test', 'wp_usermeta', 'umeta_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'test', 'PRIMARY', NULL, 'test', 'wp_users', 'ID', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PARTITIONS`
--

CREATE TEMPORARY TABLE `PARTITIONS` (
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `PARTITION_NAME` varchar(64) DEFAULT NULL,
  `SUBPARTITION_NAME` varchar(64) DEFAULT NULL,
  `PARTITION_ORDINAL_POSITION` bigint(21) unsigned DEFAULT NULL,
  `SUBPARTITION_ORDINAL_POSITION` bigint(21) unsigned DEFAULT NULL,
  `PARTITION_METHOD` varchar(12) DEFAULT NULL,
  `SUBPARTITION_METHOD` varchar(12) DEFAULT NULL,
  `PARTITION_EXPRESSION` longtext,
  `SUBPARTITION_EXPRESSION` longtext,
  `PARTITION_DESCRIPTION` longtext,
  `TABLE_ROWS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `AVG_ROW_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_FREE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `PARTITION_COMMENT` varchar(80) NOT NULL DEFAULT '',
  `NODEGROUP` varchar(12) NOT NULL DEFAULT '',
  `TABLESPACE_NAME` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PARTITIONS`
--

INSERT INTO `PARTITIONS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `PARTITION_NAME`, `SUBPARTITION_NAME`, `PARTITION_ORDINAL_POSITION`, `SUBPARTITION_ORDINAL_POSITION`, `PARTITION_METHOD`, `SUBPARTITION_METHOD`, `PARTITION_EXPRESSION`, `SUBPARTITION_EXPRESSION`, `PARTITION_DESCRIPTION`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `CHECKSUM`, `PARTITION_COMMENT`, `NODEGROUP`, `TABLESPACE_NAME`) VALUES
(NULL, 'information_schema', 'CHARACTER_SETS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 384, 0, 16434816, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'COLLATIONS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 231, 0, 16704765, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 195, 0, 16357770, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'COLUMNS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-04-29 07:01:25', '2014-04-29 07:01:25', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2565, 0, 16757145, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'ENGINES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 490, 0, 16574250, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'EVENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-04-29 07:01:25', '2014-04-29 07:01:25', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'FILES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2677, 0, 16758020, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'GLOBAL_STATUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'GLOBAL_VARIABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4637, 0, 16762755, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'PARTITIONS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-04-29 07:01:25', '2014-04-29 07:01:25', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'PLUGINS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-04-29 07:01:25', '2014-04-29 07:01:25', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'PROCESSLIST', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-04-29 07:01:25', '2014-04-29 07:01:25', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'PROFILING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 308, 0, 16562084, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4814, 0, 16767162, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'ROUTINES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-04-29 07:01:25', '2014-04-29 07:01:25', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'SCHEMATA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3464, 0, 16738048, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2179, 0, 16736899, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'SESSION_STATUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'SESSION_VARIABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3268, 0, 16755036, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'STATISTICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2679, 0, 16770540, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'TABLES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3545, 0, 16743035, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2504, 0, 16721712, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2372, 0, 16748692, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'TRIGGERS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-04-29 07:01:25', '2014-04-29 07:01:25', NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'USER_PRIVILEGES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1986, 0, 16726092, 0, 0, '2014-04-29 07:01:25', NULL, NULL, NULL, '', '', NULL),
(NULL, 'information_schema', 'VIEWS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2014-04-29 07:01:25', '2014-04-29 07:01:25', NULL, NULL, '', '', NULL),
(NULL, 'dlindem3', 'game', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 33, 100, 281474976710655, 1024, 0, '2014-04-28 22:20:07', '2014-04-28 22:20:07', NULL, NULL, '', '', NULL),
(NULL, 'dlindem3', 'pool', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 50, 328, 281474976710655, 2048, 176, '2014-04-28 22:20:07', '2014-04-29 05:58:22', NULL, NULL, '', '', NULL),
(NULL, 'dlindem3', 'pool_users', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 25, 76, 281474976710655, 2048, 0, '2014-04-28 22:20:07', '2014-04-29 05:58:22', NULL, NULL, '', '', NULL),
(NULL, 'dlindem3', 'team', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, 22, 628, 281474976710655, 2048, 0, '2014-04-28 22:20:07', '2014-04-28 22:20:07', NULL, NULL, '', '', NULL),
(NULL, 'dlindem3', 'useraccount', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 60, 120, 281474976710655, 3072, 0, '2014-04-28 22:20:07', '2014-04-28 22:20:07', NULL, NULL, '', '', NULL),
(NULL, 'test', 'six_drops', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 51, 2068, 281474976710655, 2048, 0, '2014-04-19 21:25:13', '2014-04-19 21:25:13', NULL, NULL, '', '', NULL),
(NULL, 'test', 'wp_cntctfrm_field', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 105, 1365, 29554872554618879, 2048, 0, '2013-12-30 21:13:51', '2013-12-30 21:13:51', NULL, NULL, '', '', NULL),
(NULL, 'test', 'wp_commentmeta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 4096, 0, '2013-12-27 15:01:29', '2013-12-27 15:01:29', NULL, NULL, '', '', NULL),
(NULL, 'test', 'wp_comments', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 236, 281474976710655, 6144, 236, '2013-12-27 15:01:29', '2014-01-26 18:42:47', NULL, NULL, '', '', NULL),
(NULL, 'test', 'wp_links', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 281474976710655, 1024, 0, '2013-12-27 15:01:29', '2013-12-27 15:01:29', NULL, NULL, '', '', NULL),
(NULL, 'test', 'wp_options', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 155, 2091, 328888, 281474976710655, 12288, 4748, '2013-12-27 15:01:29', '2014-04-28 21:33:22', NULL, NULL, '', '', NULL),
(NULL, 'test', 'wp_postmeta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, 104, 6192, 281474976710655, 10240, 352, '2013-12-27 15:01:29', '2014-01-26 18:42:47', NULL, NULL, '', '', NULL),
(NULL, 'test', 'wp_posts', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 191, 5984, 281474976710655, 11264, 2924, '2013-12-27 15:01:29', '2014-01-26 18:42:47', NULL, NULL, '', '', NULL),
(NULL, 'test', 'wp_term_relationships', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 21, 5910974510923775, 3072, 21, '2013-12-27 15:01:29', '2014-01-26 18:42:47', NULL, NULL, '', '', NULL),
(NULL, 'test', 'wp_term_taxonomy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 281474976710655, 4096, 0, '2013-12-27 15:01:29', '2013-12-27 15:12:27', NULL, NULL, '', '', NULL),
(NULL, 'test', 'wp_terms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 281474976710655, 11264, 0, '2013-12-27 15:01:29', '2013-12-27 15:01:29', NULL, NULL, '', '', NULL),
(NULL, 'test', 'wp_usermeta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 66, 1196, 281474976710655, 10240, 0, '2013-12-27 15:01:29', '2013-12-28 16:44:02', NULL, NULL, '', '', NULL),
(NULL, 'test', 'wp_users', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 104, 104, 281474976710655, 4096, 0, '2013-12-27 15:01:29', '2013-12-27 15:01:29', NULL, NULL, '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PLUGINS`
--

CREATE TEMPORARY TABLE `PLUGINS` (
  `PLUGIN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PLUGIN_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_STATUS` varchar(10) NOT NULL DEFAULT '',
  `PLUGIN_TYPE` varchar(80) NOT NULL DEFAULT '',
  `PLUGIN_TYPE_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_LIBRARY` varchar(64) DEFAULT NULL,
  `PLUGIN_LIBRARY_VERSION` varchar(20) DEFAULT NULL,
  `PLUGIN_AUTHOR` varchar(64) DEFAULT NULL,
  `PLUGIN_DESCRIPTION` longtext,
  `PLUGIN_LICENSE` varchar(80) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PLUGINS`
--

INSERT INTO `PLUGINS` (`PLUGIN_NAME`, `PLUGIN_VERSION`, `PLUGIN_STATUS`, `PLUGIN_TYPE`, `PLUGIN_TYPE_VERSION`, `PLUGIN_LIBRARY`, `PLUGIN_LIBRARY_VERSION`, `PLUGIN_AUTHOR`, `PLUGIN_DESCRIPTION`, `PLUGIN_LICENSE`) VALUES
('binlog', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50169.0', NULL, NULL, 'MySQL AB', 'This is a pseudo storage engine to represent the binlog in a transaction', 'GPL'),
('partition', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50169.0', NULL, NULL, 'Mikael Ronstrom, MySQL AB', 'Partition Storage Engine Helper', 'GPL'),
('CSV', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50169.0', NULL, NULL, 'Brian Aker, MySQL AB', 'CSV storage engine', 'GPL'),
('MEMORY', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50169.0', NULL, NULL, 'MySQL AB', 'Hash based, stored in memory, useful for temporary tables', 'GPL'),
('InnoDB', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50169.0', NULL, NULL, 'Innobase OY', 'Supports transactions, row-level locking, and foreign keys', 'GPL'),
('MyISAM', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50169.0', NULL, NULL, 'MySQL AB', 'Default engine as of MySQL 3.23 with great performance', 'GPL'),
('MRG_MYISAM', '1.0', 'ACTIVE', 'STORAGE ENGINE', '50169.0', NULL, NULL, 'MySQL AB', 'Collection of identical MyISAM tables', 'GPL');

-- --------------------------------------------------------

--
-- Table structure for table `PROCESSLIST`
--

CREATE TEMPORARY TABLE `PROCESSLIST` (
  `ID` bigint(4) NOT NULL DEFAULT '0',
  `USER` varchar(16) NOT NULL DEFAULT '',
  `HOST` varchar(64) NOT NULL DEFAULT '',
  `DB` varchar(64) DEFAULT NULL,
  `COMMAND` varchar(16) NOT NULL DEFAULT '',
  `TIME` int(7) NOT NULL DEFAULT '0',
  `STATE` varchar(64) DEFAULT NULL,
  `INFO` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PROCESSLIST`
--

INSERT INTO `PROCESSLIST` (`ID`, `USER`, `HOST`, `DB`, `COMMAND`, `TIME`, `STATE`, `INFO`) VALUES
(39025286, 'dlindem3', 'localhost', 'dlindem3', 'Query', 0, 'executing', 'SELECT * FROM `information_schema`.`PROCESSLIST`'),
(39025212, 'dlindem3', 'localhost:40792', 'dlindem3', 'Sleep', 343, '', NULL),
(39024378, 'dlindem3', 'localhost:40286', 'dlindem3', 'Sleep', 342, '', NULL),
(39024377, 'dlindem3', 'localhost:40285', 'dlindem3', 'Sleep', 3839, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PROFILING`
--

CREATE TEMPORARY TABLE `PROFILING` (
  `QUERY_ID` int(20) NOT NULL DEFAULT '0',
  `SEQ` int(20) NOT NULL DEFAULT '0',
  `STATE` varchar(30) NOT NULL DEFAULT '',
  `DURATION` decimal(9,6) NOT NULL DEFAULT '0.000000',
  `CPU_USER` decimal(9,6) DEFAULT NULL,
  `CPU_SYSTEM` decimal(9,6) DEFAULT NULL,
  `CONTEXT_VOLUNTARY` int(20) DEFAULT NULL,
  `CONTEXT_INVOLUNTARY` int(20) DEFAULT NULL,
  `BLOCK_OPS_IN` int(20) DEFAULT NULL,
  `BLOCK_OPS_OUT` int(20) DEFAULT NULL,
  `MESSAGES_SENT` int(20) DEFAULT NULL,
  `MESSAGES_RECEIVED` int(20) DEFAULT NULL,
  `PAGE_FAULTS_MAJOR` int(20) DEFAULT NULL,
  `PAGE_FAULTS_MINOR` int(20) DEFAULT NULL,
  `SWAPS` int(20) DEFAULT NULL,
  `SOURCE_FUNCTION` varchar(30) DEFAULT NULL,
  `SOURCE_FILE` varchar(20) DEFAULT NULL,
  `SOURCE_LINE` int(20) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `REFERENTIAL_CONSTRAINTS`
--

CREATE TEMPORARY TABLE `REFERENTIAL_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) DEFAULT NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_CATALOG` varchar(512) DEFAULT NULL,
  `UNIQUE_CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_NAME` varchar(64) DEFAULT NULL,
  `MATCH_OPTION` varchar(64) NOT NULL DEFAULT '',
  `UPDATE_RULE` varchar(64) NOT NULL DEFAULT '',
  `DELETE_RULE` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `REFERENCED_TABLE_NAME` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ROUTINES`
--

CREATE TEMPORARY TABLE `ROUTINES` (
  `SPECIFIC_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_CATALOG` varchar(512) DEFAULT NULL,
  `ROUTINE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_TYPE` varchar(9) NOT NULL DEFAULT '',
  `DTD_IDENTIFIER` varchar(64) DEFAULT NULL,
  `ROUTINE_BODY` varchar(8) NOT NULL DEFAULT '',
  `ROUTINE_DEFINITION` longtext,
  `EXTERNAL_NAME` varchar(64) DEFAULT NULL,
  `EXTERNAL_LANGUAGE` varchar(64) DEFAULT NULL,
  `PARAMETER_STYLE` varchar(8) NOT NULL DEFAULT '',
  `IS_DETERMINISTIC` varchar(3) NOT NULL DEFAULT '',
  `SQL_DATA_ACCESS` varchar(64) NOT NULL DEFAULT '',
  `SQL_PATH` varchar(64) DEFAULT NULL,
  `SECURITY_TYPE` varchar(7) NOT NULL DEFAULT '',
  `CREATED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `ROUTINE_COMMENT` varchar(64) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SCHEMATA`
--

CREATE TEMPORARY TABLE `SCHEMATA` (
  `CATALOG_NAME` varchar(512) DEFAULT NULL,
  `SCHEMA_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFAULT_CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `DEFAULT_COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `SQL_PATH` varchar(512) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SCHEMATA`
--

INSERT INTO `SCHEMATA` (`CATALOG_NAME`, `SCHEMA_NAME`, `DEFAULT_CHARACTER_SET_NAME`, `DEFAULT_COLLATION_NAME`, `SQL_PATH`) VALUES
(NULL, 'information_schema', 'utf8', 'utf8_general_ci', NULL),
(NULL, 'dlindem3', 'latin1', 'latin1_swedish_ci', NULL),
(NULL, 'test', 'latin1', 'latin1_swedish_ci', NULL),
(NULL, 'test_table', 'latin1', 'latin1_swedish_ci', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SCHEMA_PRIVILEGES`
--

CREATE TEMPORARY TABLE `SCHEMA_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SCHEMA_PRIVILEGES`
--

INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'SELECT', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'INSERT', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'UPDATE', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'DELETE', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'CREATE', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'DROP', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'REFERENCES', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'INDEX', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'ALTER', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'CREATE TEMPORARY TABLES', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'LOCK TABLES', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'EXECUTE', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'CREATE VIEW', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'SHOW VIEW', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'CREATE ROUTINE', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'ALTER ROUTINE', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'EVENT', 'NO'),
('''dlindem3''@''localhost''', NULL, 'dlindem3', 'TRIGGER', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `SESSION_STATUS`
--

CREATE TEMPORARY TABLE `SESSION_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SESSION_STATUS`
--

INSERT INTO `SESSION_STATUS` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('ABORTED_CLIENTS', '263'),
('ABORTED_CONNECTS', '1113'),
('BINLOG_CACHE_DISK_USE', '0'),
('BINLOG_CACHE_USE', '0'),
('BYTES_RECEIVED', '8853'),
('BYTES_SENT', '190498'),
('COM_ADMIN_COMMANDS', '0'),
('COM_ASSIGN_TO_KEYCACHE', '0'),
('COM_ALTER_DB', '0'),
('COM_ALTER_DB_UPGRADE', '0'),
('COM_ALTER_EVENT', '0'),
('COM_ALTER_FUNCTION', '0'),
('COM_ALTER_PROCEDURE', '0'),
('COM_ALTER_SERVER', '0'),
('COM_ALTER_TABLE', '0'),
('COM_ALTER_TABLESPACE', '0'),
('COM_ANALYZE', '0'),
('COM_BACKUP_TABLE', '0'),
('COM_BEGIN', '0'),
('COM_BINLOG', '0'),
('COM_CALL_PROCEDURE', '0'),
('COM_CHANGE_DB', '2'),
('COM_CHANGE_MASTER', '0'),
('COM_CHECK', '0'),
('COM_CHECKSUM', '0'),
('COM_COMMIT', '0'),
('COM_CREATE_DB', '0'),
('COM_CREATE_EVENT', '0'),
('COM_CREATE_FUNCTION', '0'),
('COM_CREATE_INDEX', '0'),
('COM_CREATE_PROCEDURE', '0'),
('COM_CREATE_SERVER', '0'),
('COM_CREATE_TABLE', '0'),
('COM_CREATE_TRIGGER', '0'),
('COM_CREATE_UDF', '0'),
('COM_CREATE_USER', '0'),
('COM_CREATE_VIEW', '0'),
('COM_DEALLOC_SQL', '0'),
('COM_DELETE', '0'),
('COM_DELETE_MULTI', '0'),
('COM_DO', '0'),
('COM_DROP_DB', '0'),
('COM_DROP_EVENT', '0'),
('COM_DROP_FUNCTION', '0'),
('COM_DROP_INDEX', '0'),
('COM_DROP_PROCEDURE', '0'),
('COM_DROP_SERVER', '0'),
('COM_DROP_TABLE', '0'),
('COM_DROP_TRIGGER', '0'),
('COM_DROP_USER', '0'),
('COM_DROP_VIEW', '0'),
('COM_EMPTY_QUERY', '0'),
('COM_EXECUTE_SQL', '0'),
('COM_FLUSH', '0'),
('COM_GRANT', '0'),
('COM_HA_CLOSE', '0'),
('COM_HA_OPEN', '0'),
('COM_HA_READ', '0'),
('COM_HELP', '0'),
('COM_INSERT', '0'),
('COM_INSERT_SELECT', '0'),
('COM_INSTALL_PLUGIN', '0'),
('COM_KILL', '0'),
('COM_LOAD', '0'),
('COM_LOAD_MASTER_DATA', '0'),
('COM_LOAD_MASTER_TABLE', '0'),
('COM_LOCK_TABLES', '0'),
('COM_OPTIMIZE', '0'),
('COM_PRELOAD_KEYS', '0'),
('COM_PREPARE_SQL', '0'),
('COM_PURGE', '0'),
('COM_PURGE_BEFORE_DATE', '0'),
('COM_RELEASE_SAVEPOINT', '0'),
('COM_RENAME_TABLE', '0'),
('COM_RENAME_USER', '0'),
('COM_REPAIR', '0'),
('COM_REPLACE', '0'),
('COM_REPLACE_SELECT', '0'),
('COM_RESET', '0'),
('COM_RESTORE_TABLE', '0'),
('COM_REVOKE', '0'),
('COM_REVOKE_ALL', '0'),
('COM_ROLLBACK', '0'),
('COM_ROLLBACK_TO_SAVEPOINT', '0'),
('COM_SAVEPOINT', '0'),
('COM_SELECT', '27'),
('COM_SET_OPTION', '29'),
('COM_SHOW_AUTHORS', '0'),
('COM_SHOW_BINLOG_EVENTS', '0'),
('COM_SHOW_BINLOGS', '0'),
('COM_SHOW_CHARSETS', '0'),
('COM_SHOW_COLLATIONS', '0'),
('COM_SHOW_COLUMN_TYPES', '0'),
('COM_SHOW_CONTRIBUTORS', '0'),
('COM_SHOW_CREATE_DB', '0'),
('COM_SHOW_CREATE_EVENT', '0'),
('COM_SHOW_CREATE_FUNC', '0'),
('COM_SHOW_CREATE_PROC', '0'),
('COM_SHOW_CREATE_TABLE', '25'),
('COM_SHOW_CREATE_TRIGGER', '0'),
('COM_SHOW_DATABASES', '1'),
('COM_SHOW_ENGINE_LOGS', '0'),
('COM_SHOW_ENGINE_MUTEX', '0'),
('COM_SHOW_ENGINE_STATUS', '0'),
('COM_SHOW_EVENTS', '0'),
('COM_SHOW_ERRORS', '0'),
('COM_SHOW_FIELDS', '0'),
('COM_SHOW_FUNCTION_STATUS', '2'),
('COM_SHOW_GRANTS', '0'),
('COM_SHOW_KEYS', '0'),
('COM_SHOW_MASTER_STATUS', '0'),
('COM_SHOW_NEW_MASTER', '0'),
('COM_SHOW_OPEN_TABLES', '0'),
('COM_SHOW_PLUGINS', '0'),
('COM_SHOW_PRIVILEGES', '0'),
('COM_SHOW_PROCEDURE_STATUS', '2'),
('COM_SHOW_PROCESSLIST', '0'),
('COM_SHOW_PROFILE', '0'),
('COM_SHOW_PROFILES', '0'),
('COM_SHOW_SLAVE_HOSTS', '0'),
('COM_SHOW_SLAVE_STATUS', '0'),
('COM_SHOW_STATUS', '0'),
('COM_SHOW_STORAGE_ENGINES', '0'),
('COM_SHOW_TABLE_STATUS', '49'),
('COM_SHOW_TABLES', '2'),
('COM_SHOW_TRIGGERS', '24'),
('COM_SHOW_VARIABLES', '1'),
('COM_SHOW_WARNINGS', '0'),
('COM_SLAVE_START', '0'),
('COM_SLAVE_STOP', '0'),
('COM_STMT_CLOSE', '0'),
('COM_STMT_EXECUTE', '0'),
('COM_STMT_FETCH', '0'),
('COM_STMT_PREPARE', '0'),
('COM_STMT_REPREPARE', '0'),
('COM_STMT_RESET', '0'),
('COM_STMT_SEND_LONG_DATA', '0'),
('COM_TRUNCATE', '0'),
('COM_UNINSTALL_PLUGIN', '0'),
('COM_UNLOCK_TABLES', '0'),
('COM_UPDATE', '0'),
('COM_UPDATE_MULTI', '0'),
('COM_XA_COMMIT', '0'),
('COM_XA_END', '0'),
('COM_XA_PREPARE', '0'),
('COM_XA_RECOVER', '0'),
('COM_XA_ROLLBACK', '0'),
('COM_XA_START', '0'),
('COMPRESSION', 'OFF'),
('CONNECTIONS', '39025287'),
('CREATED_TMP_DISK_TABLES', '91'),
('CREATED_TMP_FILES', '452'),
('CREATED_TMP_TABLES', '293'),
('DELAYED_ERRORS', '0'),
('DELAYED_INSERT_THREADS', '0'),
('DELAYED_WRITES', '0'),
('FLUSH_COMMANDS', '1'),
('HANDLER_COMMIT', '0'),
('HANDLER_DELETE', '0'),
('HANDLER_DISCOVER', '0'),
('HANDLER_PREPARE', '0'),
('HANDLER_READ_FIRST', '5'),
('HANDLER_READ_KEY', '0'),
('HANDLER_READ_NEXT', '130'),
('HANDLER_READ_PREV', '0'),
('HANDLER_READ_RND', '0'),
('HANDLER_READ_RND_NEXT', '1646'),
('HANDLER_ROLLBACK', '0'),
('HANDLER_SAVEPOINT', '0'),
('HANDLER_SAVEPOINT_ROLLBACK', '0'),
('HANDLER_UPDATE', '0'),
('HANDLER_WRITE', '1670'),
('INNODB_BUFFER_POOL_PAGES_DATA', '508'),
('INNODB_BUFFER_POOL_PAGES_DIRTY', '0'),
('INNODB_BUFFER_POOL_PAGES_FLUSHED', '60179'),
('INNODB_BUFFER_POOL_PAGES_FREE', '0'),
('INNODB_BUFFER_POOL_PAGES_MISC', '4'),
('INNODB_BUFFER_POOL_PAGES_TOTAL', '512'),
('INNODB_BUFFER_POOL_READ_AHEAD_RND', '155'),
('INNODB_BUFFER_POOL_READ_AHEAD_SEQ', '21'),
('INNODB_BUFFER_POOL_READ_REQUESTS', '6315085'),
('INNODB_BUFFER_POOL_READS', '4803'),
('INNODB_BUFFER_POOL_WAIT_FREE', '0'),
('INNODB_BUFFER_POOL_WRITE_REQUESTS', '880020'),
('INNODB_DATA_FSYNCS', '56467'),
('INNODB_DATA_PENDING_FSYNCS', '0'),
('INNODB_DATA_PENDING_READS', '0'),
('INNODB_DATA_PENDING_WRITES', '0'),
('INNODB_DATA_READ', '99192832'),
('INNODB_DATA_READS', '5171'),
('INNODB_DATA_WRITES', '87218'),
('INNODB_DATA_WRITTEN', '2189027328'),
('INNODB_DBLWR_PAGES_WRITTEN', '60179'),
('INNODB_DBLWR_WRITES', '4511'),
('INNODB_LOG_WAITS', '0'),
('INNODB_LOG_WRITE_REQUESTS', '414397'),
('INNODB_LOG_WRITES', '43900'),
('INNODB_OS_LOG_FSYNCS', '47451'),
('INNODB_OS_LOG_PENDING_FSYNCS', '0'),
('INNODB_OS_LOG_PENDING_WRITES', '0'),
('INNODB_OS_LOG_WRITTEN', '215218176'),
('INNODB_PAGE_SIZE', '16384'),
('INNODB_PAGES_CREATED', '4718'),
('INNODB_PAGES_READ', '5921'),
('INNODB_PAGES_WRITTEN', '60179'),
('INNODB_ROW_LOCK_CURRENT_WAITS', '0'),
('INNODB_ROW_LOCK_TIME', '527'),
('INNODB_ROW_LOCK_TIME_AVG', '263'),
('INNODB_ROW_LOCK_TIME_MAX', '527'),
('INNODB_ROW_LOCK_WAITS', '2'),
('INNODB_ROWS_DELETED', '41611'),
('INNODB_ROWS_INSERTED', '66963'),
('INNODB_ROWS_READ', '3300717'),
('INNODB_ROWS_UPDATED', '20839'),
('KEY_BLOCKS_NOT_FLUSHED', '0'),
('KEY_BLOCKS_UNUSED', '5410'),
('KEY_BLOCKS_USED', '1420'),
('KEY_READ_REQUESTS', '63890222'),
('KEY_READS', '46407'),
('KEY_WRITE_REQUESTS', '137185'),
('KEY_WRITES', '110349'),
('LAST_QUERY_COST', '10.499000'),
('MAX_USED_CONNECTIONS', '24'),
('NOT_FLUSHED_DELAYED_ROWS', '0'),
('OPEN_FILES', '120'),
('OPEN_STREAMS', '0'),
('OPEN_TABLE_DEFINITIONS', '256'),
('OPEN_TABLES', '64'),
('OPENED_FILES', '518042'),
('OPENED_TABLE_DEFINITIONS', '1'),
('OPENED_TABLES', '19'),
('PREPARED_STMT_COUNT', '0'),
('QCACHE_FREE_BLOCKS', '0'),
('QCACHE_FREE_MEMORY', '0'),
('QCACHE_HITS', '0'),
('QCACHE_INSERTS', '0'),
('QCACHE_LOWMEM_PRUNES', '0'),
('QCACHE_NOT_CACHED', '0'),
('QCACHE_QUERIES_IN_CACHE', '0'),
('QCACHE_TOTAL_BLOCKS', '0'),
('QUERIES', '80874718'),
('QUESTIONS', '164'),
('RPL_STATUS', 'NULL'),
('SELECT_FULL_JOIN', '0'),
('SELECT_FULL_RANGE_JOIN', '0'),
('SELECT_RANGE', '0'),
('SELECT_RANGE_CHECK', '0'),
('SELECT_SCAN', '107'),
('SLAVE_OPEN_TEMP_TABLES', '0'),
('SLAVE_RETRIED_TRANSACTIONS', '0'),
('SLAVE_RUNNING', 'OFF'),
('SLOW_LAUNCH_THREADS', '1'),
('SLOW_QUERIES', '0'),
('SORT_MERGE_PASSES', '0'),
('SORT_RANGE', '0'),
('SORT_ROWS', '0'),
('SORT_SCAN', '0'),
('SSL_ACCEPT_RENEGOTIATES', '0'),
('SSL_ACCEPTS', '0'),
('SSL_CALLBACK_CACHE_HITS', '0'),
('SSL_CIPHER', ''),
('SSL_CIPHER_LIST', ''),
('SSL_CLIENT_CONNECTS', '0'),
('SSL_CONNECT_RENEGOTIATES', '0'),
('SSL_CTX_VERIFY_DEPTH', '0'),
('SSL_CTX_VERIFY_MODE', '0'),
('SSL_DEFAULT_TIMEOUT', '0'),
('SSL_FINISHED_ACCEPTS', '0'),
('SSL_FINISHED_CONNECTS', '0'),
('SSL_SESSION_CACHE_HITS', '0'),
('SSL_SESSION_CACHE_MISSES', '0'),
('SSL_SESSION_CACHE_MODE', 'NONE'),
('SSL_SESSION_CACHE_OVERFLOWS', '0'),
('SSL_SESSION_CACHE_SIZE', '0'),
('SSL_SESSION_CACHE_TIMEOUTS', '0'),
('SSL_SESSIONS_REUSED', '0'),
('SSL_USED_SESSION_CACHE_ENTRIES', '0'),
('SSL_VERIFY_DEPTH', '0'),
('SSL_VERIFY_MODE', '0'),
('SSL_VERSION', ''),
('TABLE_LOCKS_IMMEDIATE', '5673468'),
('TABLE_LOCKS_WAITED', '1023095'),
('TC_LOG_MAX_PAGES_USED', '0'),
('TC_LOG_PAGE_SIZE', '0'),
('TC_LOG_PAGE_WAITS', '0'),
('THREADS_CACHED', '0'),
('THREADS_CONNECTED', '5'),
('THREADS_CREATED', '39025286'),
('THREADS_RUNNING', '1'),
('UPTIME', '13176795'),
('UPTIME_SINCE_FLUSH_STATUS', '13176795');

-- --------------------------------------------------------

--
-- Table structure for table `SESSION_VARIABLES`
--

CREATE TEMPORARY TABLE `SESSION_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SESSION_VARIABLES`
--

INSERT INTO `SESSION_VARIABLES` (`VARIABLE_NAME`, `VARIABLE_VALUE`) VALUES
('MAX_PREPARED_STMT_COUNT', '16382'),
('CHARACTER_SETS_DIR', '/usr/share/mysql/charsets/'),
('HAVE_CRYPT', 'YES'),
('CONNECT_TIMEOUT', '10'),
('MYISAM_REPAIR_THREADS', '1'),
('AUTOMATIC_SP_PRIVILEGES', 'ON'),
('MAX_CONNECT_ERRORS', '10'),
('BINLOG_CACHE_SIZE', '32768'),
('INNODB_CONCURRENCY_TICKETS', '500'),
('BACK_LOG', '50'),
('MAX_CONNECTIONS', '151'),
('STORAGE_ENGINE', 'MyISAM'),
('DELAYED_INSERT_TIMEOUT', '300'),
('MAX_LENGTH_FOR_SORT_DATA', '1024'),
('LOG_BIN_TRUST_ROUTINE_CREATORS', 'OFF'),
('CHARACTER_SET_CONNECTION', 'utf8'),
('SSL_CIPHER', ''),
('CHARACTER_SET_RESULTS', 'utf8'),
('BASEDIR', '/usr/'),
('LARGE_PAGES', 'OFF'),
('UPDATABLE_VIEWS_WITH_LIMIT', 'YES'),
('TABLE_DEFINITION_CACHE', '256'),
('SLOW_LAUNCH_TIME', '2'),
('QUERY_ALLOC_BLOCK_SIZE', '8192'),
('INNODB_LOCK_WAIT_TIMEOUT', '50'),
('COMPLETION_TYPE', '0'),
('RELAY_LOG_INDEX', ''),
('COLLATION_SERVER', 'latin1_swedish_ci'),
('SQL_QUOTE_SHOW_CREATE', 'ON'),
('EVENT_SCHEDULER', 'OFF'),
('SQL_LOG_UPDATE', 'ON'),
('COLLATION_DATABASE', 'latin1_swedish_ci'),
('INNODB_USE_LEGACY_CARDINALITY_ALGORITHM', 'ON'),
('FT_MAX_WORD_LEN', '84'),
('LOCKED_IN_MEMORY', 'OFF'),
('CONCURRENT_INSERT', '1'),
('MYISAM_RECOVER_OPTIONS', 'OFF'),
('NET_WRITE_TIMEOUT', '60'),
('REPORT_HOST', ''),
('AUTO_INCREMENT_OFFSET', '1'),
('SSL_KEY', ''),
('FLUSH', 'OFF'),
('CHARACTER_SET_DATABASE', 'latin1'),
('DELAYED_INSERT_LIMIT', '100'),
('SLAVE_SKIP_ERRORS', 'OFF'),
('FT_QUERY_EXPANSION_LIMIT', '20'),
('INSERT_ID', '0'),
('SQL_LOW_PRIORITY_UPDATES', 'OFF'),
('RELAY_LOG_PURGE', 'ON'),
('LANGUAGE', '/usr/share/mysql/english/'),
('SKIP_SHOW_DATABASE', 'OFF'),
('KEY_CACHE_AGE_THRESHOLD', '300'),
('GROUP_CONCAT_MAX_LEN', '1024'),
('JOIN_BUFFER_SIZE', '131072'),
('INNODB_LOG_BUFFER_SIZE', '1048576'),
('LOG', 'OFF'),
('VERSION_COMPILE_MACHINE', 'x86_64'),
('READ_BUFFER_SIZE', '131072'),
('INNODB_MAX_PURGE_LAG', '0'),
('DELAYED_QUEUE_SIZE', '1000'),
('TRANSACTION_PREALLOC_SIZE', '4096'),
('INTERACTIVE_TIMEOUT', '28800'),
('VERSION_COMPILE_OS', 'redhat-linux-gnu'),
('WAIT_TIMEOUT', '28800'),
('SQL_NOTES', 'ON'),
('TABLE_OPEN_CACHE', '64'),
('LOW_PRIORITY_UPDATES', 'OFF'),
('LARGE_PAGE_SIZE', '0'),
('REPORT_PASSWORD', ''),
('INIT_SLAVE', ''),
('MAX_INSERT_DELAYED_THREADS', '20'),
('MAX_BINLOG_SIZE', '1073741824'),
('HAVE_COMPRESS', 'YES'),
('MAX_ERROR_COUNT', '64'),
('TRANSACTION_ALLOC_BLOCK_SIZE', '8192'),
('FT_MIN_WORD_LEN', '4'),
('THREAD_CACHE_SIZE', '0'),
('LOG_WARNINGS', '2'),
('INNODB_DOUBLEWRITE', 'ON'),
('SQL_LOG_OFF', 'OFF'),
('PSEUDO_THREAD_ID', '39025286'),
('MAX_LONG_DATA_SIZE', '52428800'),
('DEFAULT_WEEK_FORMAT', '0'),
('INNODB_FLUSH_METHOD', ''),
('LOG_OUTPUT', 'FILE'),
('LOWER_CASE_TABLE_NAMES', '0'),
('MAX_RELAY_LOG_SIZE', '0'),
('MYISAM_STATS_METHOD', 'nulls_unequal'),
('PROTOCOL_VERSION', '10'),
('NET_RETRY_COUNT', '10'),
('HAVE_SYMLINK', 'DISABLED'),
('MAX_SORT_LENGTH', '1024'),
('TIME_ZONE', '+00:00'),
('MAX_HEAP_TABLE_SIZE', '16777216'),
('INNODB_TABLE_LOCKS', 'ON'),
('FT_BOOLEAN_SYNTAX', '+ -><()~*:""&|'),
('INNODB_AUTOEXTEND_INCREMENT', '8'),
('LOG_QUERIES_NOT_USING_INDEXES', 'OFF'),
('MYISAM_DATA_POINTER_SIZE', '6'),
('NET_BUFFER_LENGTH', '16384'),
('INNODB_THREAD_SLEEP_DELAY', '10000'),
('FT_STOPWORD_FILE', '(built-in)'),
('SQL_AUTO_IS_NULL', 'ON'),
('DELAY_KEY_WRITE', 'ON'),
('SLAVE_TRANSACTION_RETRIES', '10'),
('MULTI_RANGE_COUNT', '256'),
('LOG_ERROR', '/var/log/mysqld.log'),
('LONG_QUERY_TIME', '10.000000'),
('GENERAL_LOG', 'OFF'),
('BULK_INSERT_BUFFER_SIZE', '8388608'),
('TABLE_TYPE', 'MyISAM'),
('SLAVE_MAX_ALLOWED_PACKET', '1073741824'),
('QUERY_CACHE_MIN_RES_UNIT', '4096'),
('MYISAM_USE_MMAP', 'OFF'),
('INNODB_STATS_ON_METADATA', 'ON'),
('MAX_BINLOG_CACHE_SIZE', '18446744073709547520'),
('INNODB_ROLLBACK_ON_TIMEOUT', 'OFF'),
('QUERY_CACHE_TYPE', 'ON'),
('PROFILING_HISTORY_SIZE', '15'),
('CHARACTER_SET_FILESYSTEM', 'binary'),
('INNODB_ADDITIONAL_MEM_POOL_SIZE', '1048576'),
('TX_ISOLATION', 'REPEATABLE-READ'),
('READ_RND_BUFFER_SIZE', '262144'),
('THREAD_HANDLING', 'one-thread-per-connection'),
('SECURE_AUTH', 'OFF'),
('BINLOG_DIRECT_NON_TRANSACTIONAL_UPDATES', 'OFF'),
('BIG_TABLES', 'OFF'),
('FLUSH_TIME', '0'),
('SQL_SELECT_LIMIT', '18446744073709551615'),
('HAVE_INNODB', 'YES'),
('DATE_FORMAT', '%Y-%m-%d'),
('OLD_PASSWORDS', 'OFF'),
('READ_ONLY', 'OFF'),
('QUERY_PREALLOC_SIZE', '8192'),
('RAND_SEED1', ''),
('SLOW_QUERY_LOG_FILE', '/var/run/mysqld/mysqld-slow.log'),
('INNODB_DATA_FILE_PATH', 'ibdata1:10M:autoextend'),
('MAX_SEEKS_FOR_KEY', '18446744073709551615'),
('QUERY_CACHE_LIMIT', '1048576'),
('SYSTEM_TIME_ZONE', 'EST'),
('PROFILING', 'OFF'),
('SSL_CERT', ''),
('QUERY_CACHE_SIZE', '0'),
('MYISAM_MAX_SORT_FILE_SIZE', '9223372036853727232'),
('KEY_CACHE_DIVISION_LIMIT', '100'),
('THREAD_STACK', '262144'),
('GENERAL_LOG_FILE', '/var/run/mysqld/mysqld.log'),
('OPEN_FILES_LIMIT', '1024'),
('MYISAM_SORT_BUFFER_SIZE', '8388608'),
('SKIP_NAME_RESOLVE', 'OFF'),
('AUTO_INCREMENT_INCREMENT', '1'),
('LAST_INSERT_ID', '0'),
('TMPDIR', '/tmp'),
('PID_FILE', '/var/run/mysqld/mysqld.pid'),
('EXPIRE_LOGS_DAYS', '0'),
('MAX_TMP_TABLES', '32'),
('HAVE_PARTITIONING', 'YES'),
('MIN_EXAMINED_ROW_LIMIT', '0'),
('FOREIGN_KEY_CHECKS', 'ON'),
('LARGE_FILES_SUPPORT', 'ON'),
('RELAY_LOG_INFO_FILE', 'relay-log.info'),
('SSL_CAPATH', ''),
('INNODB_AUTOINC_LOCK_MODE', '1'),
('VERSION_COMMENT', 'Source distribution'),
('INNODB_COMMIT_CONCURRENCY', '0'),
('OPTIMIZER_SWITCH', 'index_merge=on,index_merge_union=on,index_merge_sort_union=on,index_merge_intersection=on'),
('INNODB_MIRRORED_LOG_GROUPS', '1'),
('OPTIMIZER_PRUNE_LEVEL', '1'),
('UNIQUE_CHECKS', 'ON'),
('QUERY_CACHE_WLOCK_INVALIDATE', 'OFF'),
('VERSION', '5.1.69'),
('MAX_WRITE_LOCK_COUNT', '18446744073709551615'),
('INNODB_SUPPORT_XA', 'ON'),
('TIMED_MUTEXES', 'OFF'),
('INNODB_SYNC_SPIN_LOOPS', '20'),
('INIT_FILE', ''),
('COLLATION_CONNECTION', 'utf8_general_ci'),
('LC_TIME_NAMES', 'en_US'),
('HAVE_QUERY_CACHE', 'YES'),
('SERVER_ID', '0'),
('INNODB_ADAPTIVE_HASH_INDEX', 'ON'),
('SKIP_NETWORKING', 'OFF'),
('RPL_RECOVERY_RANK', '0'),
('CHARACTER_SET_SYSTEM', 'utf8'),
('DIV_PRECISION_INCREMENT', '4'),
('INIT_CONNECT', ''),
('DATADIR', '/var/lib/mysql/'),
('OPTIMIZER_SEARCH_DEPTH', '62'),
('INNODB_DATA_HOME_DIR', ''),
('AUTOCOMMIT', 'ON'),
('SKIP_EXTERNAL_LOCKING', 'ON'),
('KEY_CACHE_BLOCK_SIZE', '1024'),
('SQL_SLAVE_SKIP_COUNTER', ''),
('SQL_BIG_TABLES', 'OFF'),
('TIME_FORMAT', '%H:%i:%s'),
('TMP_TABLE_SIZE', '16777216'),
('INNODB_FORCE_RECOVERY', '0'),
('TABLE_LOCK_WAIT_TIMEOUT', '50'),
('INNODB_LOG_FILES_IN_GROUP', '2'),
('CHARACTER_SET_SERVER', 'latin1'),
('ERROR_COUNT', '0'),
('HOSTNAME', 'lamp.eng.fau.edu'),
('HAVE_DYNAMIC_LOADING', 'YES'),
('SQL_BUFFER_RESULT', 'OFF'),
('SYNC_BINLOG', '0'),
('LOG_BIN', 'OFF'),
('RELAY_LOG_SPACE_LIMIT', '0'),
('SQL_MODE', ''),
('INNODB_OPEN_FILES', '300'),
('MAX_USER_CONNECTIONS', '0'),
('OLD', 'OFF'),
('SLAVE_EXEC_MODE', 'STRICT'),
('INNODB_MAX_DIRTY_PAGES_PCT', '90'),
('SQL_MAX_JOIN_SIZE', '18446744073709551615'),
('HAVE_COMMUNITY_FEATURES', 'YES'),
('NEW', 'OFF'),
('KEY_BUFFER_SIZE', '8384512'),
('SECURE_FILE_PRIV', ''),
('HAVE_NDBCLUSTER', 'NO'),
('KEEP_FILES_ON_CREATE', 'OFF'),
('REPORT_PORT', '3306'),
('REPORT_USER', ''),
('INNODB_STATS_METHOD', 'nulls_equal'),
('ENGINE_CONDITION_PUSHDOWN', 'ON'),
('INNODB_FAST_SHUTDOWN', '1'),
('SQL_LOG_BIN', 'ON'),
('SSL_CA', ''),
('LOWER_CASE_FILE_SYSTEM', 'OFF'),
('INNODB_THREAD_CONCURRENCY', '8'),
('HAVE_CSV', 'YES'),
('SLAVE_NET_TIMEOUT', '3600'),
('SQL_SAFE_UPDATES', 'OFF'),
('INNODB_BUFFER_POOL_SIZE', '8388608'),
('PRELOAD_BUFFER_SIZE', '32768'),
('LOCAL_INFILE', 'ON'),
('SLAVE_COMPRESSED_PROTOCOL', 'OFF'),
('HAVE_RTREE_KEYS', 'YES'),
('HAVE_GEOMETRY', 'YES'),
('BINLOG_FORMAT', 'STATEMENT'),
('MAX_SP_RECURSION_DEPTH', '0'),
('OLD_ALTER_TABLE', 'OFF'),
('RELAY_LOG', ''),
('MYISAM_MMAP_SIZE', '18446744073709551615'),
('PLUGIN_DIR', '/usr/lib64/mysql/plugin'),
('LOG_SLOW_QUERIES', 'OFF'),
('IGNORE_BUILTIN_INNODB', 'OFF'),
('TIMESTAMP', '1398754885'),
('NET_READ_TIMEOUT', '30'),
('MAX_DELAYED_THREADS', '20'),
('SYNC_FRM', 'ON'),
('DATETIME_FORMAT', '%Y-%m-%d %H:%i:%s'),
('SLOW_QUERY_LOG', 'OFF'),
('INNODB_FLUSH_LOG_AT_TRX_COMMIT', '1'),
('WARNING_COUNT', '0'),
('INNODB_FILE_IO_THREADS', '4'),
('MAX_ALLOWED_PACKET', '52428800'),
('LICENSE', 'GPL'),
('SQL_BIG_SELECTS', 'ON'),
('RANGE_ALLOC_BLOCK_SIZE', '4096'),
('INNODB_CHECKSUMS', 'ON'),
('PORT', '3306'),
('INNODB_LOCKS_UNSAFE_FOR_BINLOG', 'OFF'),
('HAVE_SSL', 'DISABLED'),
('INNODB_LOG_FILE_SIZE', '5242880'),
('LOG_BIN_TRUST_FUNCTION_CREATORS', 'OFF'),
('LOG_SLAVE_UPDATES', 'OFF'),
('MAX_JOIN_SIZE', '18446744073709551615'),
('SORT_BUFFER_SIZE', '2097144'),
('HAVE_OPENSSL', 'DISABLED'),
('INNODB_FILE_PER_TABLE', 'OFF'),
('INNODB_LOG_GROUP_HOME_DIR', './'),
('SOCKET', '/var/lib/mysql/mysql.sock'),
('CHARACTER_SET_CLIENT', 'utf8'),
('RAND_SEED2', ''),
('IDENTITY', '0'),
('SQL_WARNINGS', 'OFF'),
('SLAVE_LOAD_TMPDIR', '/tmp');

-- --------------------------------------------------------

--
-- Table structure for table `STATISTICS`
--

CREATE TEMPORARY TABLE `STATISTICS` (
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `NON_UNIQUE` bigint(1) NOT NULL DEFAULT '0',
  `INDEX_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `INDEX_NAME` varchar(64) NOT NULL DEFAULT '',
  `SEQ_IN_INDEX` bigint(2) NOT NULL DEFAULT '0',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLLATION` varchar(1) DEFAULT NULL,
  `CARDINALITY` bigint(21) DEFAULT NULL,
  `SUB_PART` bigint(3) DEFAULT NULL,
  `PACKED` varchar(10) DEFAULT NULL,
  `NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `INDEX_TYPE` varchar(16) NOT NULL DEFAULT '',
  `COMMENT` varchar(16) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `STATISTICS`
--

INSERT INTO `STATISTICS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `NON_UNIQUE`, `INDEX_SCHEMA`, `INDEX_NAME`, `SEQ_IN_INDEX`, `COLUMN_NAME`, `COLLATION`, `CARDINALITY`, `SUB_PART`, `PACKED`, `NULLABLE`, `INDEX_TYPE`, `COMMENT`) VALUES
(NULL, 'dlindem3', 'pool', 0, 'dlindem3', 'PRIMARY', 1, 'pool_id', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dlindem3', 'pool', 0, 'dlindem3', 'PRIMARY', 2, 'name', 'A', 3, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dlindem3', 'pool_users', 0, 'dlindem3', 'PRIMARY', 1, 'name', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dlindem3', 'pool_users', 0, 'dlindem3', 'PRIMARY', 2, 'pool_id', 'A', 3, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dlindem3', 'team', 0, 'dlindem3', 'PRIMARY', 1, 'Name', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dlindem3', 'team', 0, 'dlindem3', 'PRIMARY', 2, 'Conference', 'A', 28, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dlindem3', 'useraccount', 0, 'dlindem3', 'PRIMARY', 1, 'Name', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dlindem3', 'useraccount', 0, 'dlindem3', 'PRIMARY', 2, 'Email', 'A', 2, NULL, NULL, '', 'BTREE', ''),
(NULL, 'dlindem3', 'useraccount', 0, 'dlindem3', 'Email', 1, 'Email', 'A', 2, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'six_drops', 0, 'test', 'PRIMARY', 1, 'id', 'A', 40, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_cntctfrm_field', 0, 'test', 'id', 1, 'id', 'A', 13, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_commentmeta', 0, 'test', 'PRIMARY', 1, 'meta_id', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_commentmeta', 1, 'test', 'comment_id', 1, 'comment_id', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_commentmeta', 1, 'test', 'meta_key', 1, 'meta_key', 'A', NULL, NULL, NULL, 'YES', 'BTREE', ''),
(NULL, 'test', 'wp_comments', 0, 'test', 'PRIMARY', 1, 'comment_ID', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_comments', 1, 'test', 'comment_post_ID', 1, 'comment_post_ID', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_comments', 1, 'test', 'comment_approved_date_gmt', 1, 'comment_approved', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_comments', 1, 'test', 'comment_approved_date_gmt', 2, 'comment_date_gmt', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_comments', 1, 'test', 'comment_date_gmt', 1, 'comment_date_gmt', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_comments', 1, 'test', 'comment_parent', 1, 'comment_parent', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_links', 0, 'test', 'PRIMARY', 1, 'link_id', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_links', 1, 'test', 'link_visible', 1, 'link_visible', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_options', 0, 'test', 'PRIMARY', 1, 'option_id', 'A', 155, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_options', 0, 'test', 'option_name', 1, 'option_name', 'A', 155, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_postmeta', 0, 'test', 'PRIMARY', 1, 'meta_id', 'A', 56, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_postmeta', 1, 'test', 'post_id', 1, 'post_id', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_postmeta', 1, 'test', 'meta_key', 1, 'meta_key', 'A', NULL, NULL, NULL, 'YES', 'BTREE', ''),
(NULL, 'test', 'wp_posts', 0, 'test', 'PRIMARY', 1, 'ID', 'A', 16, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_posts', 1, 'test', 'post_name', 1, 'post_name', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_posts', 1, 'test', 'type_status_date', 1, 'post_type', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_posts', 1, 'test', 'type_status_date', 2, 'post_status', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_posts', 1, 'test', 'type_status_date', 3, 'post_date', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_posts', 1, 'test', 'type_status_date', 4, 'ID', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_posts', 1, 'test', 'post_parent', 1, 'post_parent', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_posts', 1, 'test', 'post_author', 1, 'post_author', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_term_relationships', 0, 'test', 'PRIMARY', 1, 'object_id', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_term_relationships', 0, 'test', 'PRIMARY', 2, 'term_taxonomy_id', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_term_relationships', 1, 'test', 'term_taxonomy_id', 1, 'term_taxonomy_id', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_term_taxonomy', 0, 'test', 'PRIMARY', 1, 'term_taxonomy_id', 'A', 1, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_term_taxonomy', 0, 'test', 'term_id_taxonomy', 1, 'term_id', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_term_taxonomy', 0, 'test', 'term_id_taxonomy', 2, 'taxonomy', 'A', 1, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_term_taxonomy', 1, 'test', 'taxonomy', 1, 'taxonomy', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_terms', 0, 'test', 'PRIMARY', 1, 'term_id', 'A', 1, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_terms', 0, 'test', 'slug', 1, 'slug', 'A', 1, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_terms', 1, 'test', 'name', 1, 'name', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_usermeta', 0, 'test', 'PRIMARY', 1, 'umeta_id', 'A', 18, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_usermeta', 1, 'test', 'user_id', 1, 'user_id', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_usermeta', 1, 'test', 'meta_key', 1, 'meta_key', 'A', NULL, NULL, NULL, 'YES', 'BTREE', ''),
(NULL, 'test', 'wp_users', 0, 'test', 'PRIMARY', 1, 'ID', 'A', 1, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_users', 1, 'test', 'user_login_key', 1, 'user_login', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'test', 'wp_users', 1, 'test', 'user_nicename', 1, 'user_nicename', 'A', NULL, NULL, NULL, '', 'BTREE', '');

-- --------------------------------------------------------

--
-- Table structure for table `TABLES`
--

CREATE TEMPORARY TABLE `TABLES` (
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `ENGINE` varchar(64) DEFAULT NULL,
  `VERSION` bigint(21) unsigned DEFAULT NULL,
  `ROW_FORMAT` varchar(10) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `AUTO_INCREMENT` bigint(21) unsigned DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `TABLE_COLLATION` varchar(32) DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `CREATE_OPTIONS` varchar(255) DEFAULT NULL,
  `TABLE_COMMENT` varchar(80) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TABLES`
--

INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES
(NULL, 'information_schema', 'CHARACTER_SETS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 384, 0, 16434816, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=43690', ''),
(NULL, 'information_schema', 'COLLATIONS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 231, 0, 16704765, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=72628', ''),
(NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 195, 0, 16357770, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=86037', ''),
(NULL, 'information_schema', 'COLUMNS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-04-29 07:01:25', '2014-04-29 07:01:25', NULL, 'utf8_general_ci', NULL, 'max_rows=4560', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2565, 0, 16757145, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6540', ''),
(NULL, 'information_schema', 'ENGINES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 490, 0, 16574250, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=34239', ''),
(NULL, 'information_schema', 'EVENTS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-04-29 07:01:25', '2014-04-29 07:01:25', NULL, 'utf8_general_ci', NULL, 'max_rows=618', ''),
(NULL, 'information_schema', 'FILES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2677, 0, 16758020, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6267', ''),
(NULL, 'information_schema', 'GLOBAL_STATUS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
(NULL, 'information_schema', 'GLOBAL_VARIABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 4637, 0, 16762755, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=3618', ''),
(NULL, 'information_schema', 'PARTITIONS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-04-29 07:01:25', '2014-04-29 07:01:25', NULL, 'utf8_general_ci', NULL, 'max_rows=5612', ''),
(NULL, 'information_schema', 'PLUGINS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-04-29 07:01:25', '2014-04-29 07:01:25', NULL, 'utf8_general_ci', NULL, 'max_rows=13025', ''),
(NULL, 'information_schema', 'PROCESSLIST', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-04-29 07:01:25', '2014-04-29 07:01:25', NULL, 'utf8_general_ci', NULL, 'max_rows=23899', ''),
(NULL, 'information_schema', 'PROFILING', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 308, 0, 16562084, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=54471', ''),
(NULL, 'information_schema', 'REFERENTIAL_CONSTRAINTS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 4814, 0, 16767162, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=3485', ''),
(NULL, 'information_schema', 'ROUTINES', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-04-29 07:01:25', '2014-04-29 07:01:25', NULL, 'utf8_general_ci', NULL, 'max_rows=588', ''),
(NULL, 'information_schema', 'SCHEMATA', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3464, 0, 16738048, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=4843', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2179, 0, 16736899, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=7699', ''),
(NULL, 'information_schema', 'SESSION_STATUS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
(NULL, 'information_schema', 'SESSION_VARIABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3268, 0, 16755036, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=5133', ''),
(NULL, 'information_schema', 'STATISTICS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2679, 0, 16770540, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6262', ''),
(NULL, 'information_schema', 'TABLES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 3545, 0, 16743035, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=4732', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2504, 0, 16721712, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6700', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 2372, 0, 16748692, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=7073', ''),
(NULL, 'information_schema', 'TRIGGERS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-04-29 07:01:25', '2014-04-29 07:01:25', NULL, 'utf8_general_ci', NULL, 'max_rows=569', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 10, 'Fixed', NULL, 1986, 0, 16726092, 0, 0, NULL, '2014-04-29 07:01:25', NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=8447', ''),
(NULL, 'information_schema', 'VIEWS', 'SYSTEM VIEW', 'MyISAM', 10, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2014-04-29 07:01:25', '2014-04-29 07:01:25', NULL, 'utf8_general_ci', NULL, 'max_rows=6932', ''),
(NULL, 'dlindem3', 'game', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 3, 33, 100, 281474976710655, 1024, 0, NULL, '2014-04-28 22:20:07', '2014-04-28 22:20:07', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dlindem3', 'pool', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 3, 50, 328, 281474976710655, 2048, 176, 20, '2014-04-28 22:20:07', '2014-04-29 05:58:22', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dlindem3', 'pool_users', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 3, 25, 76, 281474976710655, 2048, 0, NULL, '2014-04-28 22:20:07', '2014-04-29 05:58:22', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dlindem3', 'team', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 28, 22, 628, 281474976710655, 2048, 0, NULL, '2014-04-28 22:20:07', '2014-04-28 22:20:07', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'dlindem3', 'useraccount', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 2, 60, 120, 281474976710655, 3072, 0, NULL, '2014-04-28 22:20:07', '2014-04-28 22:20:07', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'test', 'six_drops', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 40, 51, 2068, 281474976710655, 2048, 0, 41, '2014-04-19 21:25:13', '2014-04-19 21:25:13', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'test', 'wp_cntctfrm_field', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 13, 105, 1365, 29554872554618879, 2048, 0, 14, '2013-12-30 21:13:51', '2013-12-30 21:13:51', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'test', 'wp_commentmeta', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 4096, 0, 1, '2013-12-27 15:01:29', '2013-12-27 15:01:29', NULL, 'utf8_general_ci', NULL, '', ''),
(NULL, 'test', 'wp_comments', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 236, 281474976710655, 6144, 236, 2, '2013-12-27 15:01:29', '2014-01-26 18:42:47', NULL, 'utf8_general_ci', NULL, '', ''),
(NULL, 'test', 'wp_links', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2013-12-27 15:01:29', '2013-12-27 15:01:29', NULL, 'utf8_general_ci', NULL, '', ''),
(NULL, 'test', 'wp_options', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 155, 2091, 328888, 281474976710655, 12288, 4748, 1086, '2013-12-27 15:01:29', '2014-04-28 21:33:22', NULL, 'utf8_general_ci', NULL, '', ''),
(NULL, 'test', 'wp_postmeta', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 56, 104, 6192, 281474976710655, 10240, 352, 65, '2013-12-27 15:01:29', '2014-01-26 18:42:47', NULL, 'utf8_general_ci', NULL, '', ''),
(NULL, 'test', 'wp_posts', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 16, 191, 5984, 281474976710655, 11264, 2924, 23, '2013-12-27 15:01:29', '2014-01-26 18:42:47', NULL, 'utf8_general_ci', NULL, '', ''),
(NULL, 'test', 'wp_term_relationships', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 21, 5910974510923775, 3072, 21, NULL, '2013-12-27 15:01:29', '2014-01-26 18:42:47', NULL, 'utf8_general_ci', NULL, '', ''),
(NULL, 'test', 'wp_term_taxonomy', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 1, 40, 40, 281474976710655, 4096, 0, 2, '2013-12-27 15:01:29', '2013-12-27 15:12:27', NULL, 'utf8_general_ci', NULL, '', ''),
(NULL, 'test', 'wp_terms', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 1, 40, 40, 281474976710655, 11264, 0, 2, '2013-12-27 15:01:29', '2013-12-27 15:01:29', NULL, 'utf8_general_ci', NULL, '', ''),
(NULL, 'test', 'wp_usermeta', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 18, 66, 1196, 281474976710655, 10240, 0, 19, '2013-12-27 15:01:29', '2013-12-28 16:44:02', NULL, 'utf8_general_ci', NULL, '', ''),
(NULL, 'test', 'wp_users', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 1, 104, 104, 281474976710655, 4096, 0, 2, '2013-12-27 15:01:29', '2013-12-27 15:01:29', NULL, 'utf8_general_ci', NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `TABLE_CONSTRAINTS`
--

CREATE TEMPORARY TABLE `TABLE_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) DEFAULT NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_TYPE` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TABLE_CONSTRAINTS`
--

INSERT INTO `TABLE_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_SCHEMA`, `TABLE_NAME`, `CONSTRAINT_TYPE`) VALUES
(NULL, 'dlindem3', 'PRIMARY', 'dlindem3', 'pool', 'PRIMARY KEY'),
(NULL, 'dlindem3', 'PRIMARY', 'dlindem3', 'pool_users', 'PRIMARY KEY'),
(NULL, 'dlindem3', 'PRIMARY', 'dlindem3', 'team', 'PRIMARY KEY'),
(NULL, 'dlindem3', 'PRIMARY', 'dlindem3', 'useraccount', 'PRIMARY KEY'),
(NULL, 'dlindem3', 'Email', 'dlindem3', 'useraccount', 'UNIQUE'),
(NULL, 'test', 'PRIMARY', 'test', 'six_drops', 'PRIMARY KEY'),
(NULL, 'test', 'id', 'test', 'wp_cntctfrm_field', 'UNIQUE'),
(NULL, 'test', 'PRIMARY', 'test', 'wp_commentmeta', 'PRIMARY KEY'),
(NULL, 'test', 'PRIMARY', 'test', 'wp_comments', 'PRIMARY KEY'),
(NULL, 'test', 'PRIMARY', 'test', 'wp_links', 'PRIMARY KEY'),
(NULL, 'test', 'PRIMARY', 'test', 'wp_options', 'PRIMARY KEY'),
(NULL, 'test', 'option_name', 'test', 'wp_options', 'UNIQUE'),
(NULL, 'test', 'PRIMARY', 'test', 'wp_postmeta', 'PRIMARY KEY'),
(NULL, 'test', 'PRIMARY', 'test', 'wp_posts', 'PRIMARY KEY'),
(NULL, 'test', 'PRIMARY', 'test', 'wp_term_relationships', 'PRIMARY KEY'),
(NULL, 'test', 'PRIMARY', 'test', 'wp_term_taxonomy', 'PRIMARY KEY'),
(NULL, 'test', 'term_id_taxonomy', 'test', 'wp_term_taxonomy', 'UNIQUE'),
(NULL, 'test', 'PRIMARY', 'test', 'wp_terms', 'PRIMARY KEY'),
(NULL, 'test', 'slug', 'test', 'wp_terms', 'UNIQUE'),
(NULL, 'test', 'PRIMARY', 'test', 'wp_usermeta', 'PRIMARY KEY'),
(NULL, 'test', 'PRIMARY', 'test', 'wp_users', 'PRIMARY KEY');

-- --------------------------------------------------------

--
-- Table structure for table `TABLE_PRIVILEGES`
--

CREATE TEMPORARY TABLE `TABLE_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `TRIGGERS`
--

CREATE TEMPORARY TABLE `TRIGGERS` (
  `TRIGGER_CATALOG` varchar(512) DEFAULT NULL,
  `TRIGGER_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TRIGGER_NAME` varchar(64) NOT NULL DEFAULT '',
  `EVENT_MANIPULATION` varchar(6) NOT NULL DEFAULT '',
  `EVENT_OBJECT_CATALOG` varchar(512) DEFAULT NULL,
  `EVENT_OBJECT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `EVENT_OBJECT_TABLE` varchar(64) NOT NULL DEFAULT '',
  `ACTION_ORDER` bigint(4) NOT NULL DEFAULT '0',
  `ACTION_CONDITION` longtext,
  `ACTION_STATEMENT` longtext NOT NULL,
  `ACTION_ORIENTATION` varchar(9) NOT NULL DEFAULT '',
  `ACTION_TIMING` varchar(6) NOT NULL DEFAULT '',
  `ACTION_REFERENCE_OLD_TABLE` varchar(64) DEFAULT NULL,
  `ACTION_REFERENCE_NEW_TABLE` varchar(64) DEFAULT NULL,
  `ACTION_REFERENCE_OLD_ROW` varchar(3) NOT NULL DEFAULT '',
  `ACTION_REFERENCE_NEW_ROW` varchar(3) NOT NULL DEFAULT '',
  `CREATED` datetime DEFAULT NULL,
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TRIGGERS`
--

INSERT INTO `TRIGGERS` (`TRIGGER_CATALOG`, `TRIGGER_SCHEMA`, `TRIGGER_NAME`, `EVENT_MANIPULATION`, `EVENT_OBJECT_CATALOG`, `EVENT_OBJECT_SCHEMA`, `EVENT_OBJECT_TABLE`, `ACTION_ORDER`, `ACTION_CONDITION`, `ACTION_STATEMENT`, `ACTION_ORIENTATION`, `ACTION_TIMING`, `ACTION_REFERENCE_OLD_TABLE`, `ACTION_REFERENCE_NEW_TABLE`, `ACTION_REFERENCE_OLD_ROW`, `ACTION_REFERENCE_NEW_ROW`, `CREATED`, `SQL_MODE`, `DEFINER`, `CHARACTER_SET_CLIENT`, `COLLATION_CONNECTION`, `DATABASE_COLLATION`) VALUES
(NULL, 'dlindem3', 'pool_AINS', 'INSERT', NULL, 'dlindem3', 'pool', 0, NULL, 'begin\n	insert into pool_users (name, pool_id, user) values (NEW.name, NEW.pool_id, new.commissioner);\nEND', 'ROW', 'AFTER', NULL, NULL, 'OLD', 'NEW', NULL, '', 'dlindem3@localhost', 'utf8', 'utf8_general_ci', 'latin1_swedish_ci');

-- --------------------------------------------------------

--
-- Table structure for table `USER_PRIVILEGES`
--

CREATE TEMPORARY TABLE `USER_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `USER_PRIVILEGES`
--

INSERT INTO `USER_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES
('''dlindem3''@''localhost''', NULL, 'USAGE', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `VIEWS`
--

CREATE TEMPORARY TABLE `VIEWS` (
  `TABLE_CATALOG` varchar(512) DEFAULT NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VIEW_DEFINITION` longtext NOT NULL,
  `CHECK_OPTION` varchar(8) NOT NULL DEFAULT '',
  `IS_UPDATABLE` varchar(3) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `SECURITY_TYPE` varchar(7) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Database: `test`
--
CREATE DATABASE `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Table structure for table `six_drops`
--

CREATE TABLE IF NOT EXISTS `six_drops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tier_one` varchar(255) NOT NULL,
  `tier_two` varchar(255) NOT NULL,
  `tier_three` varchar(255) NOT NULL,
  `tier_four` varchar(255) NOT NULL,
  `tier_five` varchar(255) NOT NULL,
  `tier_six` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `six_drops`
--

INSERT INTO `six_drops` (`id`, `tier_one`, `tier_two`, `tier_three`, `tier_four`, `tier_five`, `tier_six`) VALUES
(1, 'Chevy', 'Camaro', 'Black', 'alloy', 'gps_navigation', 'premium_audio'),
(2, 'Chevy', 'Camaro', 'Black', 'none', 'gps_navigation', 'premium_audio'),
(3, 'Chevy', 'Camaro', 'Black', 'alloy', 'none', 'premium_audio'),
(4, 'Chevy', 'Camaro', 'Black', 'none', 'none', 'premium_audio'),
(5, 'Chevy', 'Camaro', 'Black', 'alloy', 'gps_navigation', 'none'),
(6, 'Chevy', 'Camaro', 'Black', 'none', 'gps_navigation', 'none'),
(7, 'Chevy', 'Camaro', 'Black', 'alloy', 'none', 'none'),
(8, 'Chevy', 'Camaro', 'Black', 'none', 'none', 'none'),
(9, 'Chevy', 'Camaro', 'White', 'alloy', 'gps_navigation', 'premium_audio'),
(10, 'Chevy', 'Camaro', 'White', 'none', 'gps_navigation', 'premium_audio'),
(11, 'Chevy', 'Camaro', 'White', 'alloy', 'none', 'premium_audio'),
(12, 'Chevy', 'Camaro', 'White', 'none', 'none', 'premium_audio'),
(13, 'Chevy', 'Camaro', 'White', 'alloy', 'gps_navigation', 'none'),
(14, 'Chevy', 'Camaro', 'White', 'none', 'gps_navigation', 'none'),
(15, 'Chevy', 'Camaro', 'White', 'alloy', 'none', 'none'),
(16, 'Chevy', 'Camaro', 'White', 'none', 'none', 'none'),
(17, 'Chevy', 'Impala', 'Blue', 'alloy', 'gps_navigation', 'none'),
(18, 'Chevy', 'Impala', 'Black', 'alloy', 'none', 'premium_audio'),
(19, 'Chevy', 'Impala', 'Blue', 'none', 'gps_navigation', 'none'),
(20, 'Chevy', 'Impala', 'Black', 'none', 'none', 'premium_audio'),
(21, 'Chevy', 'Impala', 'Red', 'none', 'none', 'none'),
(22, 'Chevy', 'Camaro', 'Red', 'alloy', 'gps_navigation', 'none'),
(23, 'Chevy', 'Camaro', 'Black', 'alloy', 'none', 'premium_audio'),
(24, 'Chevy', 'Camaro', 'Red', 'none', 'gps_navigation', 'premium_audio'),
(25, 'Chevy', 'Camaro', 'Black', 'none', 'none', 'premium_audio'),
(26, 'Chevy', 'Camaro', 'Blue', 'none', 'gps_navigation', 'none'),
(27, 'Audi', 'A3', 'White', 'none', 'none', 'none'),
(28, 'Audi', 'A3', 'White', 'alloy', 'gps_navigation', 'premium_audio'),
(29, 'Audi', 'A3', 'White', 'alloy', 'none', 'none'),
(30, 'Audi', 'A3', 'Black', 'alloy', 'gps_navigation', 'none'),
(31, 'Audi', 'S5', 'Black', 'alloy', 'gps_navigation', 'premium_audio'),
(32, 'Audi', 'S5', 'Black', 'none', 'none', 'none'),
(33, 'Audi', 'S5', 'Red', 'alloy', 'none', 'none'),
(34, 'Honda', 'Civic', 'Black', 'alloy', 'gps_navigation', 'premium_audio'),
(35, 'Honda', 'Civic', 'Red', 'none', 'none', 'none'),
(36, 'Honda', 'Civic', 'Silver', 'alloy', 'gps_navigation', 'premium_audio'),
(37, 'Honda', 'Civic', 'Silver', 'none', 'none', 'none'),
(38, 'Honda', 'Prelude', 'Red', 'none', 'none', 'none'),
(39, 'Honda', 'Prelude', 'Red', 'alloy', 'gps_navigation', 'none'),
(40, 'Honda', 'Prelude', 'White', 'alloy', 'gps_navigation', 'premium_audio');

-- --------------------------------------------------------

--
-- Table structure for table `wp_cntctfrm_field`
--

CREATE TABLE IF NOT EXISTS `wp_cntctfrm_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `wp_cntctfrm_field`
--

INSERT INTO `wp_cntctfrm_field` (`id`, `name`) VALUES
(1, 'name'),
(2, 'email'),
(3, 'subject'),
(4, 'message'),
(5, 'address'),
(6, 'phone'),
(7, 'attachment'),
(8, 'attachment_explanations'),
(9, 'send_copy'),
(10, 'sent_from'),
(11, 'date_time'),
(12, 'coming_from'),
(13, 'user_agent');

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1086 ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://lamp.cse.fau.edu/~jshakya/wordpress', 'yes'),
(2, 'blogname', 'XtreamH20', 'yes'),
(3, 'blogdescription', 'XtreamH&lt;sub&gt;2&lt;/sub&gt;O', 'yes'),
(4, 'users_can_register', '0', 'yes'),
(5, 'admin_email', 'jebinshakya@gmail.com', 'yes'),
(6, 'start_of_week', '1', 'yes'),
(7, 'use_balanceTags', '0', 'yes'),
(8, 'use_smilies', '1', 'yes'),
(9, 'require_name_email', '', 'yes'),
(10, 'comments_notify', '', 'yes'),
(11, 'posts_per_rss', '10', 'yes'),
(12, 'rss_use_excerpt', '0', 'yes'),
(13, 'mailserver_url', 'mail.example.com', 'yes'),
(14, 'mailserver_login', 'login@example.com', 'yes'),
(15, 'mailserver_pass', 'password', 'yes'),
(16, 'mailserver_port', '110', 'yes'),
(17, 'default_category', '1', 'yes'),
(18, 'default_comment_status', 'closed', 'yes'),
(19, 'default_ping_status', 'closed', 'yes'),
(20, 'default_pingback_flag', '', 'yes'),
(21, 'posts_per_page', '10', 'yes'),
(22, 'date_format', 'F j, Y', 'yes'),
(23, 'time_format', 'g:i a', 'yes'),
(24, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(25, 'links_recently_updated_prepend', '<em>', 'yes'),
(26, 'links_recently_updated_append', '</em>', 'yes'),
(27, 'links_recently_updated_time', '120', 'yes'),
(28, 'comment_moderation', '', 'yes'),
(29, 'moderation_notify', '', 'yes'),
(30, 'permalink_structure', '/%postname%/', 'yes'),
(31, 'gzipcompression', '0', 'yes'),
(32, 'hack_file', '0', 'yes'),
(33, 'blog_charset', 'UTF-8', 'yes'),
(34, 'moderation_keys', '', 'no'),
(35, 'active_plugins', 'a:3:{i:0;s:36:"contact-form-plugin/contact_form.php";i:1;s:41:"responsive-add-ons/responsive-add-ons.php";i:2;s:33:"ssh-sftp-updater-support/sftp.php";}', 'yes'),
(36, 'home', 'http://lamp.cse.fau.edu/~jshakya/wordpress', 'yes'),
(37, 'category_base', '', 'yes'),
(38, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(39, 'advanced_edit', '0', 'yes'),
(40, 'comment_max_links', '2', 'yes'),
(41, 'gmt_offset', '-5', 'yes'),
(42, 'default_email_category', '1', 'yes'),
(43, 'recently_edited', 'a:2:{i:0;s:78:"/home/jshakya/public_html/wordpress/wp-content/themes/twentyfourteen/style.css";i:2;s:0:"";}', 'no'),
(44, 'template', 'customizr', 'yes'),
(45, 'stylesheet', 'customizr', 'yes'),
(46, 'comment_whitelist', '', 'yes'),
(47, 'blacklist_keys', '', 'no'),
(48, 'comment_registration', '', 'yes'),
(49, 'html_type', 'text/html', 'yes'),
(50, 'use_trackback', '0', 'yes'),
(51, 'default_role', 'subscriber', 'yes'),
(52, 'db_version', '26691', 'yes'),
(53, 'uploads_use_yearmonth_folders', '1', 'yes'),
(54, 'upload_path', '', 'yes'),
(55, 'blog_public', '1', 'yes'),
(56, 'default_link_category', '2', 'yes'),
(57, 'show_on_front', 'page', 'yes'),
(58, 'tag_base', '', 'yes'),
(59, 'show_avatars', '1', 'yes'),
(60, 'avatar_rating', 'G', 'yes'),
(61, 'upload_url_path', '', 'yes'),
(62, 'thumbnail_size_w', '150', 'yes'),
(63, 'thumbnail_size_h', '150', 'yes'),
(64, 'thumbnail_crop', '1', 'yes'),
(65, 'medium_size_w', '300', 'yes'),
(66, 'medium_size_h', '300', 'yes'),
(67, 'avatar_default', 'mystery', 'yes'),
(68, 'large_size_w', '1024', 'yes'),
(69, 'large_size_h', '1024', 'yes'),
(70, 'image_default_link_type', 'file', 'yes'),
(71, 'image_default_size', '', 'yes'),
(72, 'image_default_align', '', 'yes'),
(73, 'close_comments_for_old_posts', '', 'yes'),
(74, 'close_comments_days_old', '14', 'yes'),
(75, 'thread_comments', '', 'yes'),
(76, 'thread_comments_depth', '5', 'yes'),
(77, 'page_comments', '', 'yes'),
(78, 'comments_per_page', '50', 'yes'),
(79, 'default_comments_page', 'newest', 'yes'),
(80, 'comment_order', 'asc', 'yes'),
(81, 'sticky_posts', 'a:0:{}', 'yes'),
(82, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(83, 'widget_text', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:4:"text";s:32:"Thank you for visiting the site.";s:6:"filter";b:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(84, 'widget_rss', 'a:0:{}', 'yes'),
(85, 'uninstall_plugins', 'a:1:{s:36:"contact-form-plugin/contact_form.php";s:23:"cntctfrm_delete_options";}', 'no'),
(86, 'timezone_string', '', 'yes'),
(87, 'page_for_posts', '10', 'yes'),
(88, 'page_on_front', '10', 'yes'),
(89, 'default_post_format', '0', 'yes'),
(90, 'link_manager_enabled', '0', 'yes'),
(91, 'initial_db_version', '26691', 'yes'),
(92, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(93, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(201, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'sidebars_widgets', 'a:7:{s:19:"wp_inactive_widgets";a:3:{i:0;s:10:"calendar-2";i:1;s:6:"text-2";i:2;s:10:"nav_menu-2";}s:5:"right";a:1:{i:0;s:8:"search-2";}s:4:"left";a:0:{}s:10:"footer_one";N;s:10:"footer_two";N;s:12:"footer_three";N;s:13:"array_version";i:3;}', 'yes'),
(199, 'widget_nav_menu', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:8:"nav_menu";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'cron', 'a:5:{i:1398740492;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1398757080;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1398783698;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1398787984;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(248, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:4:{i:0;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:57:"https://downloads.wordpress.org/release/wordpress-3.9.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:57:"https://downloads.wordpress.org/release/wordpress-3.9.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:3:"3.9";s:7:"version";s:3:"3.9";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.8";s:15:"partial_version";s:0:"";}i:1;O:8:"stdClass":10:{s:8:"response";s:10:"autoupdate";s:8:"download";s:57:"https://downloads.wordpress.org/release/wordpress-3.9.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:57:"https://downloads.wordpress.org/release/wordpress-3.9.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:3:"3.9";s:7:"version";s:3:"3.9";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.8";s:15:"partial_version";s:0:"";}i:2;O:8:"stdClass":10:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-3.8.3.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-3.8.3.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-3.8.3-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-3.8.3-new-bundled.zip";s:7:"partial";s:69:"https://downloads.wordpress.org/release/wordpress-3.8.3-partial-0.zip";s:8:"rollback";s:70:"https://downloads.wordpress.org/release/wordpress-3.8.3-rollback-0.zip";}s:7:"current";s:5:"3.8.3";s:7:"version";s:5:"3.8.3";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.8";s:15:"partial_version";s:3:"3.8";}i:3;O:8:"stdClass":11:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-3.8.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-3.8.2.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-3.8.2-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-3.8.2-new-bundled.zip";s:7:"partial";s:69:"https://downloads.wordpress.org/release/wordpress-3.8.2-partial-0.zip";s:8:"rollback";s:70:"https://downloads.wordpress.org/release/wordpress-3.8.2-rollback-0.zip";}s:7:"current";s:5:"3.8.2";s:7:"version";s:5:"3.8.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.8";s:15:"partial_version";s:3:"3.8";s:12:"notify_email";s:1:"1";}}s:12:"last_checked";i:1398720801;s:15:"version_checked";s:3:"3.8";s:12:"translations";a:0:{}}', 'yes'),
(253, 'cntctfrm_options', 'a:56:{s:19:"cntctfrm_user_email";s:7:"jshakya";s:21:"cntctfrm_custom_email";s:0:"";s:21:"cntctfrm_select_email";s:4:"user";s:19:"cntctfrm_from_email";s:4:"user";s:26:"cntctfrm_custom_from_email";s:0:"";s:26:"cntctfrm_additions_options";i:0;s:19:"cntctfrm_attachment";i:0;s:32:"cntctfrm_attachment_explanations";i:1;s:18:"cntctfrm_send_copy";i:0;s:19:"cntctfrm_from_field";s:9:"XtreamH20";s:26:"cntctfrm_select_from_field";s:6:"custom";s:27:"cntctfrm_display_name_field";i:1;s:30:"cntctfrm_display_address_field";i:0;s:28:"cntctfrm_display_phone_field";i:0;s:28:"cntctfrm_required_name_field";i:1;s:31:"cntctfrm_required_address_field";i:0;s:29:"cntctfrm_required_email_field";i:1;s:29:"cntctfrm_required_phone_field";i:0;s:31:"cntctfrm_required_subject_field";i:1;s:31:"cntctfrm_required_message_field";i:1;s:24:"cntctfrm_required_symbol";s:1:"*";s:25:"cntctfrm_display_add_info";i:1;s:26:"cntctfrm_display_sent_from";i:1;s:26:"cntctfrm_display_date_time";i:1;s:20:"cntctfrm_mail_method";s:7:"wp-mail";s:28:"cntctfrm_display_coming_from";i:1;s:27:"cntctfrm_display_user_agent";i:1;s:17:"cntctfrm_language";a:0:{}s:21:"cntctfrm_change_label";i:0;s:19:"cntctfrm_name_label";a:1:{s:2:"en";s:5:"Name:";}s:22:"cntctfrm_address_label";a:1:{s:2:"en";s:8:"Address:";}s:20:"cntctfrm_email_label";a:1:{s:2:"en";s:14:"Email Address:";}s:20:"cntctfrm_phone_label";a:1:{s:2:"en";s:13:"Phone number:";}s:22:"cntctfrm_subject_label";a:1:{s:2:"en";s:8:"Subject:";}s:22:"cntctfrm_message_label";a:1:{s:2:"en";s:8:"Message:";}s:25:"cntctfrm_attachment_label";a:1:{s:2:"en";s:11:"Attachment:";}s:27:"cntctfrm_attachment_tooltip";a:1:{s:2:"en";s:152:"Supported file types: HTML, TXT, CSS, GIF, PNG, JPEG, JPG, TIFF, BMP, AI, EPS, PS, RTF, PDF, DOC, DOCX, XLS, ZIP, RAR, WAV, MP3, PPT. Max file size: 2MB";}s:24:"cntctfrm_send_copy_label";a:1:{s:2:"en";s:14:"Send me a copy";}s:21:"cntctfrm_submit_label";a:1:{s:2:"en";s:6:"Submit";}s:19:"cntctfrm_name_error";a:1:{s:2:"en";s:22:"Your name is required.";}s:22:"cntctfrm_address_error";a:1:{s:2:"en";s:20:"Address is required.";}s:20:"cntctfrm_email_error";a:1:{s:2:"en";s:34:"A valid email address is required.";}s:20:"cntctfrm_phone_error";a:1:{s:2:"en";s:25:"Phone number is required.";}s:22:"cntctfrm_subject_error";a:1:{s:2:"en";s:20:"Subject is required.";}s:22:"cntctfrm_message_error";a:1:{s:2:"en";s:25:"Message text is required.";}s:25:"cntctfrm_attachment_error";a:1:{s:2:"en";s:25:"File format is not valid.";}s:32:"cntctfrm_attachment_upload_error";a:1:{s:2:"en";s:18:"File upload error.";}s:30:"cntctfrm_attachment_move_error";a:1:{s:2:"en";s:31:"The file could not be uploaded.";}s:30:"cntctfrm_attachment_size_error";a:1:{s:2:"en";s:23:"This file is too large.";}s:22:"cntctfrm_captcha_error";a:1:{s:2:"en";s:28:"Please fill out the CAPTCHA.";}s:19:"cntctfrm_form_error";a:1:{s:2:"en";s:44:"Please make corrections below and try again.";}s:26:"cntctfrm_action_after_send";i:1;s:19:"cntctfrm_thank_text";a:1:{s:2:"en";s:28:"Thank you for contacting us.";}s:21:"cntctfrm_redirect_url";s:0:"";s:29:"cntctfrm_delete_attached_file";i:0;s:19:"cntctfrm_html_email";i:1;}', 'yes'),
(1081, '_site_transient_timeout_theme_roots', '1398722601', 'yes'),
(1082, '_site_transient_theme_roots', 'a:5:{s:9:"customizr";s:7:"/themes";s:10:"responsive";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";s:12:"twentytwelve";s:7:"/themes";}', 'yes'),
(106, '_site_transient_timeout_browser_2eafc93727dd7cbb81746b9535cba76f', '1388761299', 'yes'),
(107, '_site_transient_browser_2eafc93727dd7cbb81746b9535cba76f', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:6:"Safari";s:7:"version";s:5:"7.0.1";s:10:"update_url";s:28:"http://www.apple.com/safari/";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/safari.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/safari.png";s:15:"current_version";s:1:"5";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(229, '_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1388480758', 'no'),
(230, '_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1388437558', 'no'),
(227, '_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1388480758', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(228, '_transient_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:51:"\n	\n	\n	\n	\n	\n	\n		\n		\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:25:"http://wordpress.org/news";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 20 Dec 2013 08:24:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/?v=3.9-alpha";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"WordPress 3.8 “Parker”";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:41:"http://wordpress.org/news/2013/12/parker/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:50:"http://wordpress.org/news/2013/12/parker/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 12 Dec 2013 17:00:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2765";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:354:"Version 3.8 of WordPress, named “Parker” in honor of Charlie Parker, bebop innovator, is available for download or update in your WordPress dashboard. We hope you&#8217;ll think this is the most beautiful update yet. Introducing a modern new design WordPress has gotten a facelift. 3.8 brings a fresh new look to the entire admin dashboard. [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:18197:"<p>Version 3.8 of WordPress, named “Parker” in honor of <a href="http://en.wikipedia.org/wiki/Charlie_Parker">Charlie Parker</a>, bebop innovator, is available <a href="http://wordpress.org/download/">for download</a> or update in your WordPress dashboard. We hope you&#8217;ll think this is the most beautiful update yet.</p>\n<div id="v-6wORgoGb-1" class="video-player"><embed id="v-6wORgoGb-1-video" src="http://s0.videopress.com/player.swf?v=1.03&amp;guid=6wORgoGb&amp;isDynamicSeeking=true" type="application/x-shockwave-flash" width="692" height="388" wmode="direct" seamlesstabbing="true" allowfullscreen="true" allowscriptaccess="always" overstretch="true"></embed></div>\n<h2 class="aligncenter">Introducing a modern new design</h2>\n<p><img class="wp-image-2951 aligncenter" alt="overview" src="http://i0.wp.com/wpdotorg.files.wordpress.com/2013/12/overview.jpg?resize=623%2C193" data-recalc-dims="1" /></p>\n<p>WordPress has gotten a facelift. 3.8 brings a fresh new look to the entire admin dashboard. Gone are overbearing gradients and dozens of shades of grey — bring on a bigger, bolder, more colorful design!</p>\n<p><img class="aligncenter  wp-image-2856" style="margin-left: 0;margin-right: 0" alt="about-modern-wordpress" src="http://i2.wp.com/wpdotorg.files.wordpress.com/2013/12/design.png?resize=623%2C151" data-recalc-dims="1" /></p>\n<h3>Modern aesthetic</h3>\n<p>The new WordPress dashboard has a fresh, uncluttered design that embraces clarity and simplicity.</p>\n<h3>Clean typography</h3>\n<p>The Open Sans typeface provides simple, friendly text that is optimized for both desktop and mobile viewing. It’s even open source, just like WordPress.</p>\n<h3>Refined contrast</h3>\n<p>We think beautiful design should never sacrifice legibility. With superior contrast and large, comfortable type, the new design is easy to read and a pleasure to navigate.</p>\n<hr />\n<h2 class="aligncenter">WordPress on every device</h2>\n<p><img class="alignright  wp-image-2984" alt="responsive" src="http://i2.wp.com/wpdotorg.files.wordpress.com/2013/12/responsive.jpg?resize=255%2C255" data-recalc-dims="1" />We all access the internet in different ways. Smartphone, tablet, notebook, desktop — no matter what you use, WordPress will adapt and you’ll feel right at home.</p>\n<h3>High definition at high speed</h3>\n<p>WordPress is sharper than ever with new vector-based icons that scale to your screen. By ditching pixels, pages load significantly faster, too.</p>\n<hr />\n<h2 class="aligncenter">Admin color schemes to match your personality</h2>\n<p><img class="aligncenter  wp-image-2954" alt="colors" src="http://i0.wp.com/wpdotorg.files.wordpress.com/2013/12/colors.jpg?resize=623%2C339" data-recalc-dims="1" /></p>\n<p>WordPress just got a colorful new update. We’ve included eight new admin color schemes so you can pick the one that suits you best.</p>\n<p>Color schemes can be previewed and changed from your Profile page.</p>\n<hr />\n<h2 class="aligncenter">Refined theme management</h2>\n<p><img class="alignright  wp-image-2967" alt="themes" src="http://i0.wp.com/wpdotorg.files.wordpress.com/2013/12/themes.jpg?resize=360%2C344" data-recalc-dims="1" />The new themes screen lets you survey your themes at a glance. Or want more information? Click to discover more. Then sit back and use your keyboard’s navigation arrows to flip through every theme you’ve got.</p>\n<h3>Smoother widget experience</h3>\n<p>Drag-drag-drag. Scroll-scroll-scroll. Widget management can be complicated. With the new design, we’ve worked to streamline the widgets screen.</p>\n<p>Have a large monitor? Multiple widget areas stack side-by-side to use the available space. Using a tablet? Just tap a widget to add it.</p>\n<hr />\n<h2 class="aligncenter">Twenty Fourteen, a sleek new magazine theme</h2>\n<p><img class="aligncenter size-large wp-image-2789" alt="The new Twenty Fourteen theme displayed on a laptop. tablet and phone" src="http://i0.wp.com/wpdotorg.files.wordpress.com/2013/12/twentyfourteen.jpg?resize=692%2C275" data-recalc-dims="1" /></p>\n<h3>Turn your blog into a magazine</h3>\n<p>Create a beautiful magazine-style site with WordPress and Twenty Fourteen. Choose a grid or a slider to display featured content on your homepage. Customize your site with three widget areas or change your layout with two page templates.</p>\n<p>With a striking design that does not compromise our trademark simplicity, Twenty Fourteen is our most intrepid default theme yet.</p>\n<hr />\n<h2>Beginning of a new era</h2>\n<p>This release was led by Matt Mullenweg. This is our second release using the new plugin-first development process, with a much shorter timeframe than in the past. We think it’s been going great. You can check out the features currently in production on the <a title="Make WordPress Core" href="http://make.wordpress.org/core/" target="_blank">make/core blog</a>.</p>\n<p>There are 188 contributors with props in this release:</p>\n<p><a href="http://profiles.wordpress.org/aaronholbrook">Aaron Holbrook</a>, <a href="http://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="http://profiles.wordpress.org/adamsilverstein">adamsilverstein</a>, <a href="http://profiles.wordpress.org/admiralthrawn">admiralthrawn</a>, <a href="http://profiles.wordpress.org/ahoereth">Alexander Hoereth</a>, <a href="http://profiles.wordpress.org/sabreuse">Amy Hendrix (sabreuse)</a>, <a href="http://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="http://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="http://profiles.wordpress.org/aralbald">Andrey Kabakchiev</a>, <a href="http://profiles.wordpress.org/apeatling">Andy Peatling</a>, <a href="http://profiles.wordpress.org/ankitgadertcampcom">Ankit Gade</a>, <a href="http://profiles.wordpress.org/atimmer">Anton Timmermans</a>, <a href="http://profiles.wordpress.org/fliespl">Arkadiusz Rzadkowolski</a>, <a href="http://profiles.wordpress.org/aubreypwd">Aubrey Portwood</a>, <a href="http://profiles.wordpress.org/bassgang">bassgang</a>, <a href="http://profiles.wordpress.org/empireoflight">Ben Dunkle</a>, <a href="http://profiles.wordpress.org/bananastalktome">Billy (bananastalktome)</a>, <a href="http://profiles.wordpress.org/binarymoon">binarymoon</a>, <a href="http://profiles.wordpress.org/bradyvercher">Brady Vercher</a>, <a href="http://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="http://profiles.wordpress.org/rzen">Brian Richards</a>, <a href="http://profiles.wordpress.org/bpetty">Bryan Petty</a>, <a href="http://profiles.wordpress.org/calin">Calin Don</a>, <a href="http://profiles.wordpress.org/carldanley">Carl Danley</a>, <a href="http://profiles.wordpress.org/sixhours">Caroline Moore</a>, <a href="http://profiles.wordpress.org/caspie">Caspie</a>, <a href="http://profiles.wordpress.org/chrisbliss18">Chris Jean</a>, <a href="http://profiles.wordpress.org/iblamefish">Clinton Montague</a>, <a href="http://profiles.wordpress.org/corphi">Corphi</a>, <a href="http://profiles.wordpress.org/dbernar1">Dan Bernardic</a>, <a href="http://profiles.wordpress.org/danieldudzic">Daniel Dudzic</a>, <a href="http://profiles.wordpress.org/koop">Daryl Koopersmith</a>, <a href="http://profiles.wordpress.org/datafeedrcom">datafeedr</a>, <a href="http://profiles.wordpress.org/lessbloat">Dave Martin</a>, <a href="http://profiles.wordpress.org/drw158">Dave Whitley</a>, <a href="http://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="http://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="http://profiles.wordpress.org/dougwollison">Doug Wollison</a>, <a href="http://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="http://profiles.wordpress.org/dziudek">dziudek</a>, <a href="http://profiles.wordpress.org/ericlewis">Eric Andrew Lewis</a>, <a href="http://profiles.wordpress.org/ericmann">Eric Mann</a>, <a href="http://profiles.wordpress.org/ethitter">Erick Hitter</a>, <a href="http://profiles.wordpress.org/evansolomon">Evan Solomon</a>, <a href="http://profiles.wordpress.org/faison">Faison</a>, <a href="http://profiles.wordpress.org/frank-klein">Frank Klein</a>, <a href="http://profiles.wordpress.org/garyj">Gary Jones</a>, <a href="http://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="http://profiles.wordpress.org/soulseekah">Gennady Kovshenin</a>, <a href="http://profiles.wordpress.org/georgestephanis">George Stephanis</a>, <a href="http://profiles.wordpress.org/gnarf37">gnarf37</a>, <a href="http://profiles.wordpress.org/tivnet">Gregory Karpinsky</a>, <a href="http://profiles.wordpress.org/hanni">hanni</a>, <a href="http://profiles.wordpress.org/helen">Helen Hou-Sandi</a>, <a href="http://profiles.wordpress.org/iandunn">Ian Dunn</a>, <a href="http://profiles.wordpress.org/ipstenu">Ipstenu (Mika Epstein)</a>, <a href="http://profiles.wordpress.org/isaackeyet">Isaac Keyet</a>, <a href="http://profiles.wordpress.org/jdgrimes">J.D. Grimes</a>, <a href="http://profiles.wordpress.org/jacklenox">Jack Lenox</a>, <a href="http://profiles.wordpress.org/janhenckens">janhenckens</a>, <a href="http://profiles.wordpress.org/jblz">Jeff Bowen</a>, <a href="http://profiles.wordpress.org/jeffr0">Jeff Chandler</a>, <a href="http://profiles.wordpress.org/jenmylo">Jen Mylo</a>, <a href="http://profiles.wordpress.org/buffler">Jeremy Buller</a>, <a href="http://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="http://profiles.wordpress.org/jeherve">Jeremy Herve</a>, <a href="http://profiles.wordpress.org/jpry">Jeremy Pry</a>, <a href="http://profiles.wordpress.org/jayjdk">Jesper Johansen (jayjdk)</a>, <a href="http://profiles.wordpress.org/jhned">jhned</a>, <a href="http://profiles.wordpress.org/jim912">jim912</a>, <a href="http://profiles.wordpress.org/jartes">Joan Artes</a>, <a href="http://profiles.wordpress.org/joedolson">Joe Dolson</a>, <a href="http://profiles.wordpress.org/joen">Joen Asmussen</a>, <a href="http://profiles.wordpress.org/johnbillion">John Blackbourn</a>, <a href="http://profiles.wordpress.org/johnafish">John Fish</a>, <a href="http://profiles.wordpress.org/johnjamesjacoby">John James Jacoby</a>, <a href="http://profiles.wordpress.org/duck_">Jon Cave</a>, <a href="http://profiles.wordpress.org/joostdevalk">Joost de Valk</a>, <a href="http://profiles.wordpress.org/joshuaabenazer">Joshua Abenazer</a>, <a href="http://profiles.wordpress.org/nukaga">Junko Nukaga</a>, <a href="http://profiles.wordpress.org/devesine">Justin de Vesine</a>, <a href="http://profiles.wordpress.org/justinsainton">Justin Sainton</a>, <a href="http://profiles.wordpress.org/kadamwhite">K. Adam White</a>, <a href="http://profiles.wordpress.org/trepmal">Kailey (trepmal)</a>, <a href="http://profiles.wordpress.org/codebykat">Kat Hagan</a>, <a href="http://profiles.wordpress.org/littlethingsstudio">Kate Whitley</a>, <a href="http://profiles.wordpress.org/ryelle">Kelly Dwan</a>, <a href="http://profiles.wordpress.org/kpdesign">Kim Parsell</a>, <a href="http://profiles.wordpress.org/kwight">Kirk Wight</a>, <a href="http://profiles.wordpress.org/koki4a">Konstantin Dankov</a>, <a href="http://profiles.wordpress.org/kovshenin">Konstantin Kovshenin</a>, <a href="http://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="http://profiles.wordpress.org/drozdz">Krzysiek Drozdz</a>, <a href="http://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="http://profiles.wordpress.org/leewillis77">Lee Willis</a>, <a href="http://profiles.wordpress.org/lite3">lite3</a>, <a href="http://profiles.wordpress.org/lucp">Luc Princen</a>, <a href="http://profiles.wordpress.org/latz">Lutz Schroer</a>, <a href="http://profiles.wordpress.org/mako09">Mako</a>, <a href="http://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="http://profiles.wordpress.org/markmcwilliams">Mark McWilliams</a>, <a href="http://profiles.wordpress.org/markoheijnen">Marko Heijnen</a>, <a href="http://profiles.wordpress.org/matt">Matt Mullenweg</a>, <a href="http://profiles.wordpress.org/iammattthomas">Matt Thomas</a>, <a href="http://profiles.wordpress.org/mattwiebe">Matt Wiebe</a>, <a href="http://profiles.wordpress.org/mdbitz">Matthew Denton</a>, <a href="http://profiles.wordpress.org/mattheu">Matthew Haines-Young</a>, <a href="http://profiles.wordpress.org/matveb">Matías Ventura</a>, <a href="http://profiles.wordpress.org/megane9988">megane9988</a>, <a href="http://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="http://profiles.wordpress.org/micahwave">micahwave</a>, <a href="http://profiles.wordpress.org/cainm">Michael Cain</a>, <a href="http://profiles.wordpress.org/mitchoyoshitaka">Michael Erlewine</a>, <a href="http://profiles.wordpress.org/michelwppi">Michel - xiligroup dev</a>, <a href="http://profiles.wordpress.org/chellycat">Michelle Langston</a>, <a href="http://profiles.wordpress.org/gradyetc">Mike Burns</a>, <a href="http://profiles.wordpress.org/mikehansenme">Mike Hansen</a>, <a href="http://profiles.wordpress.org/mikelittle">Mike Little</a>, <a href="http://profiles.wordpress.org/dh-shredder">Mike Schroder</a>, <a href="http://profiles.wordpress.org/dimadin">Milan Dinic</a>, <a href="http://profiles.wordpress.org/batmoo">Mohammad Jangda</a>, <a href="http://profiles.wordpress.org/morganestes">Morgan Estes</a>, <a href="http://profiles.wordpress.org/mt8biz">moto hachi</a>, <a href="http://profiles.wordpress.org/Nao">Naoko Takano</a>, <a href="http://profiles.wordpress.org/neil_pie">Neil Pie</a>, <a href="http://profiles.wordpress.org/nickdaugherty">Nick Daugherty</a>, <a href="http://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="http://profiles.wordpress.org/nbachiyski">Nikolay Bachiyski</a>, <a href="http://profiles.wordpress.org/ninio">ninio</a>, <a href="http://profiles.wordpress.org/ninnypants">ninnypants</a>, <a href="http://profiles.wordpress.org/nofearinc">nofearinc</a>, <a href="http://profiles.wordpress.org/nvwd">Nowell VanHoesen</a>, <a href="http://profiles.wordpress.org/odysseygate">odyssey</a>, <a href="http://profiles.wordpress.org/originalexe">OriginalEXE</a>, <a href="http://profiles.wordpress.org/swissspidy">Pascal Birchler</a>, <a href="http://profiles.wordpress.org/pauldewouters">Paul de Wouters</a>, <a href="http://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="http://profiles.wordpress.org/westi">Peter Westwood</a>, <a href="http://profiles.wordpress.org/senlin">Piet</a>, <a href="http://profiles.wordpress.org/ptahdunbar">Ptah Dunbar</a>, <a href="http://profiles.wordpress.org/raamdev">Raam Dev</a>, <a href="http://profiles.wordpress.org/bamadesigner">Rachel Carden</a>, <a href="http://profiles.wordpress.org/rachelbaker">rachelbaker</a>, <a href="http://profiles.wordpress.org/radices">Radices</a>, <a href="http://profiles.wordpress.org/mauryaratan">Ram Ratan Maurya</a>, <a href="http://profiles.wordpress.org/defries">Remkus de Vries</a>, <a href="http://profiles.wordpress.org/ounziw">Rescuework Support</a>, <a href="http://profiles.wordpress.org/rickalee">Ricky Lee Whittemore</a>, <a href="http://profiles.wordpress.org/rdall">Robert Dall</a>, <a href="http://profiles.wordpress.org/wet">Robert Wetzlmayr, PHP-Programmierer</a>, <a href="http://profiles.wordpress.org/rodrigosprimo">Rodrigo Primo</a>, <a href="http://profiles.wordpress.org/ryan">Ryan Boren</a>, <a href="http://profiles.wordpress.org/otto42">Samuel Wood</a>, <a href="http://profiles.wordpress.org/sanchothefat">sanchothefat</a>, <a href="http://profiles.wordpress.org/sboisvert">sboisvert</a>, <a href="http://profiles.wordpress.org/scottbasgaard">Scott Basgaard</a>, <a href="http://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="http://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="http://profiles.wordpress.org/scribu">scribu</a>, <a href="http://profiles.wordpress.org/seanchayes">Sean Hayes</a>, <a href="http://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="http://profiles.wordpress.org/shaunandrews">Shaun Andrews</a>, <a href="http://profiles.wordpress.org/designsimply">Sheri Bigelow (designsimply)</a>, <a href="http://profiles.wordpress.org/shinichin">ShinichiN</a>, <a href="http://profiles.wordpress.org/simonwheatley">Simon Wheatley</a>, <a href="http://profiles.wordpress.org/siobhan">Siobhan</a>, <a href="http://profiles.wordpress.org/siobhyb">Siobhan Bamber (siobhyb)</a>, <a href="http://profiles.wordpress.org/sirbrillig">sirbrillig</a>, <a href="http://profiles.wordpress.org/solarissmoke">solarissmoke</a>, <a href="http://profiles.wordpress.org/netweb">Stephen Edgar</a>, <a href="http://profiles.wordpress.org/stephenharris">Stephen Harris</a>, <a href="http://profiles.wordpress.org/stevenkword">Steven Word</a>, <a href="http://profiles.wordpress.org/iamtakashi">Takashi Irie</a>, <a href="http://profiles.wordpress.org/miyauchi">Takayuki Miyauchi</a>, <a href="http://profiles.wordpress.org/tmtoy">Takuma Morikawa</a>, <a href="http://profiles.wordpress.org/thomasguillot">Thomas Guillot</a>, <a href="http://profiles.wordpress.org/tierra">tierra</a>, <a href="http://profiles.wordpress.org/tillkruess">Till Krüss</a>, <a href="http://profiles.wordpress.org/tlamedia">TLA Media</a>, <a href="http://profiles.wordpress.org/tobiasbg">TobiasBg</a>, <a href="http://profiles.wordpress.org/tommcfarlin">tommcfarlin</a>, <a href="http://profiles.wordpress.org/zodiac1978">Torsten Landsiedel</a>, <a href="http://profiles.wordpress.org/taupecat">Tracy Rotton</a>, <a href="http://profiles.wordpress.org/trishasalas">trishasalas</a>, <a href="http://profiles.wordpress.org/mbmufffin">Tyler Smith</a>, <a href="http://profiles.wordpress.org/grapplerulrich">Ulrich</a>, <a href="http://profiles.wordpress.org/l10n">Vladimir</a>, <a href="http://profiles.wordpress.org/westonruter">Weston Ruter</a>, <a href="http://profiles.wordpress.org/yoavf">Yoav Farhi</a>, <a href="http://profiles.wordpress.org/yonasy">yonasy</a>, and <a href="http://profiles.wordpress.org/tollmanz">Zack Tollman</a>. Also thanks to <a href="http://benmorrison.org/">Ben Morrison</a> and <a href="http://christineswebb.com/">Christine Webb</a> for help with the video.</p>\n<p>Thanks for choosing WordPress. See you soon for version 3.9!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:46:"http://wordpress.org/news/2013/12/parker/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"3.8 RC2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:42:"http://wordpress.org/news/2013/12/3-8-rc2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:51:"http://wordpress.org/news/2013/12/3-8-rc2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 10 Dec 2013 01:08:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2805";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:343:"Release candidate 2 of WordPress 3.8 is now available for download. This is the last pre-release, and we expect it to be effectively identical to what&#8217;s officially released to the public on Thursday. This means if you are a plugin or theme developer, start your engines! (If they&#8217;re not going already.) Lots of admin code [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1180:"<p>Release candidate 2 of WordPress 3.8 is <a href="http://wordpress.org/wordpress-3.8-RC2.zip">now available for download</a>. This is the last pre-release, and we expect it to be effectively identical to what&#8217;s officially released to the public on Thursday.</p>\n<p>This means if you are a plugin or theme developer, start your engines! (If they&#8217;re not going already.) Lots of admin code has changed so it&#8217;s especially important to see if your plugin works well within the new admin design and layout, and update <a href="http://wordpress.org/plugins/about/readme.txt">the &#8220;Tested up to:&#8221; part of your plugin readme.txt</a>.</p>\n<p>If there is something in your plugin that you&#8217;re unable to fix, or if you think you&#8217;ve found a bug, join us <a href="http://codex.wordpress.org/IRC">in #wordpress-dev in IRC</a>, especially if you&#8217;re able to join during the dev chat on Wednesday, or post in the <a href="http://wordpress.org/support/forum/alphabeta">alpha/beta forum</a>. The developers and designers who worked on this release are happy to help anyone update their code before the 3.8 release.</p>\n<p>Happy hacking, everybody!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:47:"http://wordpress.org/news/2013/12/3-8-rc2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:17:"WordPress 3.8 RC1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"http://wordpress.org/news/2013/12/3-8-almost/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:54:"http://wordpress.org/news/2013/12/3-8-almost/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 04 Dec 2013 09:54:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2760";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:345:"We&#8217;re entering the quiet but busy part of a release, whittling down issues to bring you all of the new features you&#8217;re excited about with the stability you expect from WordPress. There are just a few days from the &#8220;code freeze&#8221; for our 3.8 release, which includes a number of exciting enhancements, so the focus [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1873:"<p>We&#8217;re entering the quiet but busy part of a release, whittling down issues to bring you all of the new features you&#8217;re excited about with the stability you expect from WordPress. There are just a few days from the &#8220;code freeze&#8221; for our 3.8 release, <a href="http://wordpress.org/news/2013/11/wordpress-3-8-beta-1/">which includes a number of exciting enhancements</a>, so the focus is on identifying any major issues and resolving them as soon as possible.</p>\n<p>If you&#8217;ve ever wondered about how to contribute to WordPress, here&#8217;s a time you can: download this release candidate and use it in as many ways as you can imagine. Try to break it, and if you do, let us know how you did it so we can make sure it never happens again. If you work for a web host, this is the release you should test as much as possible and start getting your automatic upgrade systems and 1-click installers ready.</p>\n<p><a href="http://wordpress.org/wordpress-3.8-RC1.zip">Download WordPress 3.8 RC1</a> (zip) or use the <a href="http://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;).</p>\n<p>If you think you’ve found a bug, you can post to the <a href="http://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a reproducible bug report, <a href="http://core.trac.wordpress.org/">file one on the WordPress Trac</a>. There, you can also find <a href="http://core.trac.wordpress.org/report/5">a list of known bugs</a> and <a href="http://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=3.8">everything we’ve fixed</a> so far.</p>\n<p><em>We&#8217;re so close to the</em><br />\n<em>finish line, jump in and help</em><br />\n<em>good karma is yours.</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:50:"http://wordpress.org/news/2013/12/3-8-almost/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 3.8 Beta 1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2013/11/wordpress-3-8-beta-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/news/2013/11/wordpress-3-8-beta-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 21 Nov 2013 05:21:56 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2754";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:307:"The first beta of the 3.8 is now available, and the next dates to watch out for are code freeze on December 5th and a final release on December 12th. 3.8 brings together several of the features as plugins projects and while this isn&#8217;t our first rodeo, expect this to be more beta than usual. [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2236:"<p>The first beta of the 3.8 is now available, and the next dates to watch out for are code freeze on December 5th and a final release on December 12th.</p>\n<p>3.8 brings together <a href="http://make.wordpress.org/core/features-as-plugins/">several of the features as plugins projects</a> and while this isn&#8217;t our first rodeo, expect this to be more beta than usual. The headline things to test out in this release are:</p>\n<ul>\n<li>The new admin design, especially the responsive aspect of it. Try it out on different devices and browsers, see how it goes, especially the more complex pages like widgets or seldom-looked-at-places like Press This. Color schemes, which you can change on your profile, have also been spruced up.</li>\n<li>The dashboard homepage has been refreshed, poke and prod it.</li>\n<li>Choosing themes under Appearance is completely different, try to break it however possible.</li>\n<li>There&#8217;s a new default theme, Twenty Fourteen.</li>\n<li>Over 250 issues closed already.</li>\n</ul>\n<p>Given how many things in the admin have changed it&#8217;s extra super duper important to test as many plugins and themes with admin pages against the new stuff. Also if you&#8217;re a developer consider how you can make your admin interface fit the MP6 aesthetic better.</p>\n<p>As always, if you think you’ve found a bug, you can post to the <a href="http://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a reproducible bug report, <a href="http://core.trac.wordpress.org/">file one on the WordPress Trac</a>. There, you can also find <a href="http://core.trac.wordpress.org/report/5">a list of known bugs</a> and <a href="http://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=3.8">everything we’ve fixed</a> so far.</p>\n<p><a href="http://wordpress.org/wordpress-3.8-beta-1.zip">Download WordPress 3.8 Beta 1</a> (zip) or use the <a href="http://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;).</p>\n<p><em>Alphabet soup of</em><br />\n<em>Plugins as features galore</em><br />\n<em>The future is here</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/news/2013/11/wordpress-3-8-beta-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"WordPress 3.7.1 Maintenance Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:50:"http://wordpress.org/news/2013/10/wordpress-3-7-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/news/2013/10/wordpress-3-7-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 29 Oct 2013 21:04:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2745";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:371:"WordPress 3.7.1 is now available! This maintenance release addresses 11 bugs in WordPress 3.7, including: Images with captions no longer appear broken in the visual editor. Allow some sites running on old or poorly configured servers to continue to check for updates from WordPress.org. Avoid fatal errors with certain plugins that were incorrectly calling some [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1594:"<p>WordPress 3.7.1 is now available! This maintenance release addresses 11 bugs in WordPress 3.7, including:</p>\n<ul>\n<li>Images with captions no longer appear broken in the visual editor.</li>\n<li>Allow some sites running on old or poorly configured servers to continue to check for updates from WordPress.org.</li>\n<li>Avoid fatal errors with certain plugins that were incorrectly calling some WordPress functions too early.</li>\n<li>Fix hierarchical sorting in get_pages(), exclusions in wp_list_categories(), and in_category() when called with empty values.</li>\n<li>Fix a warning that may occur in certain setups while performing a search, and a few other notices.</li>\n</ul>\n<p>For a full list of changes, consult the <a href="http://core.trac.wordpress.org/query?milestone=3.7.1">list of tickets</a> and <a href="http://core.trac.wordpress.org/log/branches/3.7?stop_rev=25914&amp;rev=25986">the changelog</a>.</p>\n<p>If you are one of the <a href="http://wordpress.org/download/counter/">nearly two million</a> already running WordPress 3.7, we will start rolling out the all-new <a href="http://wordpress.org/news/2013/10/basie/">automatic background updates</a> for WordPress 3.7.1 in the next few hours. For sites <a href="http://wordpress.org/plugins/background-update-tester/">that support them</a>, of course.</p>\n<p><a href="http://wordpress.org/download/">Download WordPress 3.7.1</a> or venture over to <strong>Dashboard → Updates</strong> and simply click &#8220;Update Now.&#8221;</p>\n<p><em>Just a few fixes<br />\nYour new update attitude:<br />\nZero clicks given</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2013/10/wordpress-3-7-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"WordPress 3.7 “Basie”";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:40:"http://wordpress.org/news/2013/10/basie/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:49:"http://wordpress.org/news/2013/10/basie/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 24 Oct 2013 22:35:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2736";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:357:"Version 3.7 of WordPress, named &#8220;Basie&#8221; in honor of Count Basie, is available for download or update in your WordPress dashboard. This release features some of the most important architectural updates we&#8217;ve made to date. Here are the big ones: Updates while you sleep: With WordPress 3.7, you don&#8217;t have to lift a finger to [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:17229:"<p>Version 3.7 of WordPress, named &#8220;Basie&#8221; in honor of <a href="http://en.wikipedia.org/wiki/Count_basie">Count Basie</a>, is available <a href="http://wordpress.org/download/">for download</a> or update in your WordPress dashboard. This release features some of the most important architectural updates we&#8217;ve made to date. Here are the big ones:</p>\n<ul>\n<li><strong>Updates while you sleep</strong>: With WordPress 3.7, you don&#8217;t have to lift a finger to apply maintenance and security updates. Most sites are now able to automatically apply these updates in the background. The update process also has been made even more reliable and secure, with dozens of new checks and safeguards.</li>\n<li><strong>Stronger password recommendations</strong>: Your password is your site&#8217;s first line of defense. It&#8217;s best to create passwords that are complex, long, and unique. To that end, our password meter has been updated in WordPress 3.7 to recognize common mistakes that can weaken your password: dates, names, keyboard patterns (123456789), and even pop culture references.</li>\n<li><strong>Better global support</strong>: Localized versions of WordPress will receive faster and more complete translations. WordPress 3.7 adds support for automatically installing the right language files and keeping them up to date, a boon for the many millions who use WordPress in a language other than English.</li>\n</ul>\n<p>For developers there are lots of options around how to control the new updates feature, including allowing it to handle major upgrades as well as minor ones, more sophisticated date query support, and multisite improvements. As always, if you&#8217;re hungry for more <a href="http://codex.wordpress.org/Version_3.7">dive into the Codex</a> or browse the <a href="http://core.trac.wordpress.org/query?status=closed&amp;group=resolution&amp;milestone=3.7">over 400 closed tickets on Trac</a>.</p>\n<h3>A New Wave</h3>\n<p>This release was led by Andrew Nacin, backed up by Dion Hulse and Jon Cave. This is our first release using the new plugin-first development process, with a much shorter timeframe than in the past. (3.6 was released in August.) The 3.8 release, due in December, will continue this plugin-led development cycle that gives much more autonomy to plugin leads and allows us to decouple feature development from a release. You can follow this grand experiment, and what we&#8217;re learning from it, <a href="http://make.wordpress.org/core/">on the make/core blog</a>. There are 211 contributors with props in this release:</p>\n<p><a href="http://profiles.wordpress.org/technosailor">Aaron Brazell</a>, <a href="http://profiles.wordpress.org/aaroncampbell">Aaron D. Campbell</a>, <a href="http://profiles.wordpress.org/aaronholbrook">Aaron Holbrook</a>, <a href="http://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="http://profiles.wordpress.org/adamsilverstein">adamsilverstein</a>, <a href="http://profiles.wordpress.org/ahoereth">Alexander Hoereth</a>, <a href="http://profiles.wordpress.org/viper007bond">Alex Mills (Viper007Bond)</a>, <a href="http://profiles.wordpress.org/sabreuse">Amy Hendrix (sabreuse)</a>, <a href="http://profiles.wordpress.org/andg">andg</a>, <a href="http://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="http://profiles.wordpress.org/norcross">Andrew Norcross</a>, <a href="http://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="http://profiles.wordpress.org/andrewspittle">Andrew Spittle</a>, <a href="http://profiles.wordpress.org/askapache">askapache</a>, <a href="http://profiles.wordpress.org/atimmer">atimmer</a>, <a href="http://profiles.wordpress.org/barry">Barry</a>, <a href="http://profiles.wordpress.org/beaulebens">Beau Lebens</a>, <a href="http://profiles.wordpress.org/benmoody">ben.moody</a>, <a href="http://profiles.wordpress.org/bhengh">Ben Miller</a>, <a href="http://profiles.wordpress.org/neoxx">Bernhard Riedl</a>, <a href="http://profiles.wordpress.org/bftrick">BFTrick</a>, <a href="http://profiles.wordpress.org/bananastalktome">Billy (bananastalktome)</a>, <a href="http://profiles.wordpress.org/bmb">bmb</a>, <a href="http://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="http://profiles.wordpress.org/brianhogg">brianhogg</a>, <a href="http://profiles.wordpress.org/rzen">Brian Richards</a>, <a href="http://profiles.wordpress.org/bpetty">Bryan Petty</a>, <a href="http://profiles.wordpress.org/carldanley">Carl Danley</a>, <a href="http://profiles.wordpress.org/charlesclarkson">CharlesClarkson</a>, <a href="http://profiles.wordpress.org/chipbennett">Chip Bennett</a>, <a href="http://profiles.wordpress.org/chouby">Chouby</a>, <a href="http://profiles.wordpress.org/c3mdigital">Chris Olbekson</a>, <a href="http://profiles.wordpress.org/chrisrudzki">Chris Rudzki</a>, <a href="http://profiles.wordpress.org/aeg0125">coderaaron</a>, <a href="http://profiles.wordpress.org/coenjacobs">Coen Jacobs</a>, <a href="http://profiles.wordpress.org/crrobi01">Colin Robinson</a>, <a href="http://profiles.wordpress.org/andreasnrb">cyonite</a>, <a href="http://profiles.wordpress.org/daankortenbach">Daan Kortenbach</a>, <a href="http://profiles.wordpress.org/danielbachhuber">Daniel Bachhuber</a>, <a href="http://profiles.wordpress.org/convissor">Daniel Convissor</a>, <a href="http://profiles.wordpress.org/dartiss">dartiss</a>, <a href="http://profiles.wordpress.org/koop">Daryl Koopersmith</a>, <a href="http://profiles.wordpress.org/csixty4">Dave Ross</a>, <a href="http://profiles.wordpress.org/davidjlaietta">David Laietta</a>, <a href="http://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="http://profiles.wordpress.org/dllh">dllh</a>, <a href="http://profiles.wordpress.org/ocean90">Dominik Schilling (ocean90)</a>, <a href="http://profiles.wordpress.org/dpash">dpash</a>, <a href="http://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="http://profiles.wordpress.org/drprotocols">DrProtocols</a>, <a href="http://profiles.wordpress.org/dustyf">Dustin Filippini</a>, <a href="http://profiles.wordpress.org/dzver">dzver</a>, <a href="http://profiles.wordpress.org/cais">Edward Caissie</a>, <a href="http://profiles.wordpress.org/enej">enej</a>, <a href="http://profiles.wordpress.org/ericlewis">Eric Andrew Lewis</a>, <a href="http://profiles.wordpress.org/ericmann">Eric Mann</a>, <a href="http://profiles.wordpress.org/evansolomon">Evan Solomon</a>, <a href="http://profiles.wordpress.org/faishal">faishal</a>, <a href="http://profiles.wordpress.org/faison">Faison</a>, <a href="http://profiles.wordpress.org/foofy">Foofy</a>, <a href="http://profiles.wordpress.org/fjarrett">Frankie Jarrett</a>, <a href="http://profiles.wordpress.org/frank-klein">Frank Klein</a>, <a href="http://profiles.wordpress.org/garyc40">Gary Cao</a>, <a href="http://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="http://profiles.wordpress.org/gayadesign">Gaya Kessler</a>, <a href="http://profiles.wordpress.org/georgestephanis">George Stephanis</a>, <a href="http://profiles.wordpress.org/gizburdt">Gizburdt</a>, <a href="http://profiles.wordpress.org/goldenapples">goldenapples</a>, <a href="http://profiles.wordpress.org/gradyetc">gradyetc</a>, <a href="http://profiles.wordpress.org/gcorne">Gregory Cornelius</a>, <a href="http://profiles.wordpress.org/webord">Gustavo Bordoni</a>, <a href="http://profiles.wordpress.org/hakre">hakre</a>, <a href="http://profiles.wordpress.org/helen">Helen Hou-Sandi</a>, <a href="http://profiles.wordpress.org/iandunn">Ian Dunn</a>, <a href="http://profiles.wordpress.org/ipstenu">Ipstenu (Mika Epstein)</a>, <a href="http://profiles.wordpress.org/creativeinfusion">itinerant</a>, <a href="http://profiles.wordpress.org/jdgrimes">J.D. Grimes</a>, <a href="http://profiles.wordpress.org/jakubtyrcha">jakub.tyrcha</a>, <a href="http://profiles.wordpress.org/jamescollins">James Collins</a>, <a href="http://profiles.wordpress.org/jenmylo">Jen Mylo</a>, <a href="http://profiles.wordpress.org/buffler">Jeremy Buller</a>, <a href="http://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="http://profiles.wordpress.org/jayjdk">Jesper Johansen (jayjdk)</a>, <a href="http://profiles.wordpress.org/joehoyle">Joe Hoyle</a>, <a href="http://profiles.wordpress.org/jkudish">Joey Kudish</a>, <a href="http://profiles.wordpress.org/johnnyb">John Beales</a>, <a href="http://profiles.wordpress.org/johnbillion">John Blackbourn (johnbillion)</a>, <a href="http://profiles.wordpress.org/johnafish">John Fish</a>, <a href="http://profiles.wordpress.org/johnjamesjacoby">John James Jacoby</a>, <a href="http://profiles.wordpress.org/johnpbloch">John P. Bloch</a>, <a href="http://profiles.wordpress.org/jond3r">Jonas Bolinder (jond3r)</a>, <a href="http://profiles.wordpress.org/jchristopher">Jonathan Christopher</a>, <a href="http://profiles.wordpress.org/desrosj">Jonathan Desrosiers</a>, <a href="http://profiles.wordpress.org/duck_">Jon Cave</a>, <a href="http://profiles.wordpress.org/jonlynch">Jon Lynch</a>, <a href="http://profiles.wordpress.org/joostdevalk">Joost de Valk</a>, <a href="http://profiles.wordpress.org/josephscott">Joseph Scott</a>, <a href="http://profiles.wordpress.org/betzster">Josh Betz</a>, <a href="http://profiles.wordpress.org/devesine">Justin de Vesine</a>, <a href="http://profiles.wordpress.org/justinsainton">Justin Sainton</a>, <a href="http://profiles.wordpress.org/kadamwhite">K.Adam White</a>, <a href="http://profiles.wordpress.org/trepmal">Kailey (trepmal)</a>, <a href="http://profiles.wordpress.org/ketwaroo">Ketwaroo</a>, <a href="http://profiles.wordpress.org/kevinb">kevinB</a>, <a href="http://profiles.wordpress.org/kpdesign">Kim Parsell</a>, <a href="http://profiles.wordpress.org/kitchin">kitchin</a>, <a href="http://profiles.wordpress.org/kovshenin">Konstantin Kovshenin</a>, <a href="http://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="http://profiles.wordpress.org/koopersmith">koopersmith</a>, <a href="http://profiles.wordpress.org/kurtpayne">Kurt Payne</a>, <a href="http://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="http://profiles.wordpress.org/leewillis77">Lee Willis (leewillis77)</a>, <a href="http://profiles.wordpress.org/lessbloat">lessbloat</a>, <a href="http://profiles.wordpress.org/layotte">Lew Ayotte</a>, <a href="http://profiles.wordpress.org/lgedeon">Luke Gedeon</a>, <a href="http://profiles.wordpress.org/iworks">Marcin Pietrzak</a>, <a href="http://profiles.wordpress.org/cimmo">Marco Cimmino</a>, <a href="http://profiles.wordpress.org/marco_teethgrinder">Marco Galasso</a>, <a href="http://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="http://profiles.wordpress.org/markmcwilliams">Mark McWilliams</a>, <a href="http://profiles.wordpress.org/markoheijnen">Marko Heijnen</a>, <a href="http://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="http://profiles.wordpress.org/tw2113">Michael Beckwith</a>, <a href="http://profiles.wordpress.org/mikehansenme">Mike Hansen</a>, <a href="http://profiles.wordpress.org/mikeschinkel">Mike Schinkel</a>, <a href="http://profiles.wordpress.org/dh-shredder">Mike Schroder</a>, <a href="http://profiles.wordpress.org/dimadin">Milan Dinic</a>, <a href="http://profiles.wordpress.org/mitchoyoshitaka">mitcho (Michael Yoshitaka Erlewine)</a>, <a href="http://profiles.wordpress.org/usermrpapa">Mr Papa</a>, <a href="http://profiles.wordpress.org/Nao">Naoko Takano</a>, <a href="http://profiles.wordpress.org/naomicbush">Naomi</a>, <a href="http://profiles.wordpress.org/alex-ye">Nashwan Doaqan</a>, <a href="http://profiles.wordpress.org/natejacobs">NateJacobs</a>, <a href="http://profiles.wordpress.org/nathanrice">nathanrice</a>, <a href="http://profiles.wordpress.org/niallkennedy">Niall Kennedy</a>, <a href="http://profiles.wordpress.org/nickdaugherty">Nick Daugherty</a>, <a href="http://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="http://profiles.wordpress.org/nickmomrik">Nick Momrik</a>, <a href="http://profiles.wordpress.org/nikv">Nikhil Vimal (NikV)</a>, <a href="http://profiles.wordpress.org/nbachiyski">Nikolay Bachiyski</a>, <a href="http://profiles.wordpress.org/noahsilverstein">noahsilverstein</a>, <a href="http://profiles.wordpress.org/nofearinc">nofearinc</a>, <a href="http://profiles.wordpress.org/nukaga">nukaga</a>, <a href="http://profiles.wordpress.org/nullvariable">nullvariable</a>, <a href="http://profiles.wordpress.org/butuzov">Oleg Butuzov</a>, <a href="http://profiles.wordpress.org/paolal">Paolo Belcastro</a>, <a href="http://profiles.wordpress.org/xparham">Parham</a>, <a href="http://profiles.wordpress.org/pbiron">Paul Biron</a>, <a href="http://profiles.wordpress.org/pauldewouters">Paul de Wouters</a>, <a href="http://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="http://profiles.wordpress.org/peterjaap">peterjaap</a>, <a href="http://profiles.wordpress.org/westi">Peter Westwood</a>, <a href="http://profiles.wordpress.org/philiparthurmoore">Philip Arthur Moore</a>, <a href="http://profiles.wordpress.org/mordauk">Pippin Williamson</a>, <a href="http://profiles.wordpress.org/plocha">plocha</a>, <a href="http://profiles.wordpress.org/pollett">Pollett</a>, <a href="http://profiles.wordpress.org/ptahdunbar">Ptah Dunbar</a>, <a href="http://profiles.wordpress.org/ramiy">Rami Yushuvaev</a>, <a href="http://profiles.wordpress.org/rasheed">Rasheed Bydousi</a>, <a href="http://profiles.wordpress.org/raybernard">RayBernard</a>, <a href="http://profiles.wordpress.org/rboren">rboren</a>, <a href="http://profiles.wordpress.org/greuben">Reuben Gunday</a>, <a href="http://profiles.wordpress.org/rfair404">rfair404</a>, <a href="http://profiles.wordpress.org/iamfriendly">Richard Tape</a>, <a href="http://profiles.wordpress.org/r3df">Rick Radko</a>, <a href="http://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="http://profiles.wordpress.org/rdall">Robert Dall</a>, <a href="http://profiles.wordpress.org/rodrigosprimo">Rodrigo Primo</a>, <a href="http://profiles.wordpress.org/wpmuguru">Ron Rennick</a>, <a href="http://profiles.wordpress.org/rpattillo">rpattillo</a>, <a href="http://profiles.wordpress.org/ryan">Ryan Boren</a>, <a href="http://profiles.wordpress.org/rmccue">Ryan McCue</a>, <a href="http://profiles.wordpress.org/hotchkissconsulting">Sam Hotchkiss</a>, <a href="http://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="http://profiles.wordpress.org/scottsweb">scottsweb</a>, <a href="http://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="http://profiles.wordpress.org/scribu">scribu</a>, <a href="http://profiles.wordpress.org/scruffian">scruffian</a>, <a href="http://profiles.wordpress.org/tenpura">Seisuke Kuraishi (tenpura)</a>, <a href="http://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="http://profiles.wordpress.org/shinichin">ShinichiN</a>, <a href="http://profiles.wordpress.org/pross">Simon Prosser</a>, <a href="http://profiles.wordpress.org/simonwheatley">Simon Wheatley</a>, <a href="http://profiles.wordpress.org/siobhan">Siobhan</a>, <a href="http://profiles.wordpress.org/siobhyb">Siobhan Bamber (siobhyb)</a>, <a href="http://profiles.wordpress.org/sirzooro">sirzooro</a>, <a href="http://profiles.wordpress.org/solarissmoke">solarissmoke</a>, <a href="http://profiles.wordpress.org/sillybean">Stephanie Leary</a>, <a href="http://profiles.wordpress.org/netweb">Stephen Edgar (@netweb)</a>, <a href="http://profiles.wordpress.org/stephenharris">Stephen Harris</a>, <a href="http://profiles.wordpress.org/strangerstudios">strangerstudios</a>, <a href="http://profiles.wordpress.org/sweetie089">sweetie089</a>, <a href="http://profiles.wordpress.org/swissspidy">swissspidy</a>, <a href="http://profiles.wordpress.org/miyauchi">Takayuki Miyauchi</a>, <a href="http://profiles.wordpress.org/tmtoy">Takuma Morikawa</a>, <a href="http://profiles.wordpress.org/tlovett1">Taylor Lovett</a>, <a href="http://profiles.wordpress.org/tivnet">tivnet</a>, <a href="http://profiles.wordpress.org/tobiasbg">TobiasBg</a>, <a href="http://profiles.wordpress.org/tomauger">Tom Auger</a>, <a href="http://profiles.wordpress.org/toscho">toscho</a>, <a href="http://profiles.wordpress.org/wpsmith">Travis Smith</a>, <a href="http://profiles.wordpress.org/sorich87">Ulrich Sossou</a>, <a href="http://profiles.wordpress.org/vericgar">vericgar</a>, <a href="http://profiles.wordpress.org/vinod-dalvi">Vinod Dalvi</a>, <a href="http://profiles.wordpress.org/westonruter">Weston Ruter</a>, <a href="http://profiles.wordpress.org/wikicms">wikicms</a>, <a href="http://profiles.wordpress.org/willnorris">Will Norris</a>, <a href="http://profiles.wordpress.org/wojtekszkutnik">Wojtek Szkutnik</a>, <a href="http://profiles.wordpress.org/wycks">wycks</a>, <a href="http://profiles.wordpress.org/yoavf">Yoav Farhi</a>, and <a href="http://profiles.wordpress.org/yurivictor">Yuri Victor</a>.</p>\n<p>Enjoy what may be one of your last few manual updates. See you soon for version 3.8!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:45:"http://wordpress.org/news/2013/10/basie/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WordPress 3.7 Release Candidate 2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"http://wordpress.org/news/2013/10/wordpress-3-7-release-candidate-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"http://wordpress.org/news/2013/10/wordpress-3-7-release-candidate-2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 23 Oct 2013 00:05:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2729";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:417:"The second release candidate of WordPress 3.7 is now available for testing! Those of you already testing WordPress 3.7 will be updated automatically to RC2. (Nice.) If you&#8217;d like to start testing, there&#8217;s no time like the present! Try the WordPress Beta Tester plugin (you’ll want “bleeding edge nightlies”) or download the release candidate here (zip). Please post to the Alpha/Beta [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1183:"<p>The second release candidate of WordPress 3.7 is now available for testing!</p>\n<p>Those of you already testing WordPress 3.7 will be updated automatically to RC2. (<em>Nice.</em>) If you&#8217;d like to start testing, there&#8217;s no time like the present! Try the <a href="http://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”) or <a href="http://wordpress.org/wordpress-3.7-RC2.zip">download the release candidate here</a> (zip). Please post to the <a href="http://wordpress.org/support/forum/alphabeta/">Alpha/Beta area in the support forums</a> if you think you&#8217;ve found a bug, and if any known issues are raised, you’ll be able to <a href="http://core.trac.wordpress.org/report/5">find them here</a>.</p>\n<p>Developers, please test your plugins and themes against WordPress 3.7. If there is a compatibility issue, let us know as soon as possible so we can deal with it before the final release.</p>\n<p>For more on WordPress 3.7, check out the <a href="http://wordpress.org/news/2013/10/wordpress-3-7-release-candidate/">announcement post for Release Candidate 1</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"http://wordpress.org/news/2013/10/wordpress-3-7-release-candidate-2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Upcoming WordCamps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2013/10/upcoming-wordcamps-4/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/news/2013/10/upcoming-wordcamps-4/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 22 Oct 2013 19:25:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:9:"Community";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"WordCamp";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2723";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:368:"WordCamps are casual, locally-organized conferences that celebrate everything related to WordPress, and are a great opportunity to meet other WordPress users and professionals in your community. This has been a great year for WordCamps &#8212; there have been 56 so far in more than 20 countries, and there another 15 on the calendar before the year&#8217;s [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"Jen Mylo";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3584:"<p><a href="http://central.wordcamp.org/">WordCamps</a> are casual, locally-organized conferences that celebrate everything related to WordPress, and are a great opportunity to meet other WordPress users and professionals in your community. This has been a great year for WordCamps &#8212; there have been 56 so far in more than 20 countries, and there another 15 on the calendar before the year&#8217;s over. If there&#8217;s one near you, check it out! In addition to getting to know your local WordPress community, most WordCamps attract some traveling visitors a well, giving you the chance to meet contributors to the WordPress open source project and <a href="http://make.wordpress.org/">get involved</a> yourself.</p>\n<p>Here are the WordCamps on the schedule for the rest of this year.</p>\n<p>October 25-27: <strong><a href="http://2013.boston.wordcamp.org/">WordCamp Boston</a></strong>, Boston, MA, USA<br />\nOctober 25-26: <strong><a href="http://2013.malaga.wordcamp.org/">WordCamp Malaga</a></strong>, Spain<br />\nOctober 26: <strong><a href="http://2013.nepal.wordcamp.org/">WordCamp Nepal</a></strong>, Kathmandu, Nepal<br />\nOctober 26: <strong><a href="http://2013.sofia.wordcamp.org/">WordCamp Sofia</a></strong>, Bulgaria<br />\nNovember 7: <strong><a href="http://2013.capetown.wordcamp.org/">WordCamp Cape Town</a></strong>, South Africa<br />\nNovember 9: <strong><a href="http://2013.porto.wordcamp.org/">WordCamp Porto</a></strong>, Portugal<br />\nNovember 9-10: <strong><a href="http://2013.kenya.wordcamp.org/">WordCamp Kenya</a></strong>, Nairobi, Kenya<br />\nNovember 15: <strong><a href="http://2013.edmonton.wordcamp.org/">WordCamp Edmonton</a></strong>, AB, Canada<br />\nNovember 16-17: <strong><a href="http://2013.orlando.wordcamp.org/">WordCamp Orlando</a></strong>, FL, USA<br />\nNovember 16: <strong><a href="http://2013.denver.wordcamp.org/">WordCamp Denver</a></strong>, CO, USA<br />\nNovember 23-24: <strong><a href="http://2013.london.wordcamp.org/">WordCamp London</a></strong>, UK<br />\nNovember 23-24: <strong><a href="http://2013.raleigh.wordcamp.org/">WordCamp Raleigh</a></strong>, NC, USA<br />\nNovember 23: <strong><a href="http://2013.saopaulo.wordcamp.org/">WordCamp São Paulo</a></strong>, Brazil<br />\nDecember 14: <strong><a href="http://2013.vegas.wordcamp.org/">WordCamp Las Vegas</a></strong>, NV, USA<br />\nDecember 14-15: <strong><a href="http://2013.sevilla.wordcamp.org/">WordCamp Sevilla</a></strong>, Spain</p>\n<p>No WordCamps on this list in your area? Not to worry! There are thriving <a href="http://wordpress.meetup.com/">WordPress meetups</a> all over the world where you can meet like-minded people, and we maintain a library of <a href="http://wordpress.tv/category/wordcamptv/">WordCamp videos</a> at <a href="http://wordpress.tv/">WordPress.tv</a>.</p>\n<h3>Get Involved</h3>\n<ul>\n<li>If you&#8217;re interested in organizing a WordCamp in your area, check out our <a href="http://plan.wordcamp.org/">WordCamp planning</a> site.</li>\n<li>If you&#8217;re interested in <a href="http://make.wordpress.org/community/meetup-interest-form/">starting a WordPress meetup</a> in your area, let us know and we can set up a group on meetup.com for you.</li>\n<li>And speaking of WordCamp videos, we&#8217;ve recently enabled volunteer-generated subtitles/closed captioning of the videos on WordPress.tv to make them more accessible. Interested in helping? Check out the <a href="http://wordpress.tv/using-amara-org-to-caption-or-subtitle-a-wordpress-tv-video/">WordPress.tv subtitling instructions</a>.</li>\n</ul>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/news/2013/10/upcoming-wordcamps-4/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"WordPress 3.7 Release Candidate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"http://wordpress.org/news/2013/10/wordpress-3-7-release-candidate/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:75:"http://wordpress.org/news/2013/10/wordpress-3-7-release-candidate/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 18 Oct 2013 19:52:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2718";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:331:"The first release candidate for WordPress 3.7 is now available! In RC 1, we&#8217;ve made some adjustments to the update process to make it more reliable than ever. We hope to ship WordPress 3.7 next week, but we need your help to get there. If you haven’t tested 3.7 yet, there’s no time like the present. (Please, [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2274:"<p>The first release candidate for WordPress 3.7 is now available!</p>\n<p>In RC 1, we&#8217;ve made some adjustments to the update process to make it more reliable than ever. We hope to ship WordPress 3.7 <em>next week</em>, but we need your help to get there. If you haven’t tested 3.7 yet, there’s no time like the present. (Please, not on a production site, unless you’re adventurous.)</p>\n<p>WordPress 3.7 introduces <strong>automatic background updates</strong> for security and minor releases (like updating from 3.7 to 3.7.1). These are really easy to test  — RC 1 will update every 12 hours or so to the latest development version, and then email you the results. (You may get two emails: one for debugging, and one all users of 3.7 will receive.) If something went wrong, you can report it.</p>\n<p><strong>Think you’ve found a bug? </strong>Please post to the <a href="http://wordpress.org/support/forum/alphabeta/">Alpha/Beta area in the support forums</a>. If any known issues come up, you’ll be able to <a href="http://core.trac.wordpress.org/report/5">find them here</a>.</p>\n<p>To test WordPress 3.7 RC1, try the <a href="http://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="http://wordpress.org/wordpress-3.7-RC1.zip">download the release candidate here</a> (zip). If you’d like to learn more about what&#8217;s new in WordPress 3.7, visit the awesome About screen in your dashboard (<strong><img alt="" src="http://i0.wp.com/core.svn.wordpress.org/branches/3.6/wp-content/themes/twentyten/images/wordpress.png?w=692" data-recalc-dims="1" /> → About</strong> in the toolbar). There, you can also see if your install is eligible for background updates. WordPress won’t automatically update, for example, if you’re using version control like Subversion or Git.</p>\n<p><strong>Developers,</strong> please test your plugins and themes against WordPress 3.7, so that if there is a compatibility issue, we can figure it out before the final release. Make sure you post any issues to the support forums.</p>\n<p><em>WordPress three seven</em><br />\n<em>A self-updating engine</em><br />\n<em>Lies beneath the hood</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:71:"http://wordpress.org/news/2013/10/wordpress-3-7-release-candidate/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 3.7 Beta 2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/news/2013/10/wordpress-3-7-beta-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wordpress.org/news/2013/10/wordpress-3-7-beta-2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Oct 2013 21:28:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=2706";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:357:"WordPress 3.7 Beta 2 is now available for download and testing. This is software still in development, so we don&#8217;t recommend that you run it on a production site. This has been a quiet beta period. We&#8217;re hoping to get some more testers for automatic background updates, which will occur for security and minor releases (like updating [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2108:"<p>WordPress 3.7 Beta 2 is now available for download and testing. This is software still in development, so we don&#8217;t recommend that you run it on a production site.</p>\n<p>This has been a quiet beta period. We&#8217;re hoping to get some more testers for <strong>automatic background updates</strong>, which will occur for security and minor releases (like updating from 3.7 to 3.7.1). It&#8217;s really easy to test this, as Beta 2 will update each day to the latest development version and then email you the results. If something goes wrong, you can report it — it&#8217;s that simple. To get the beta, try the <a href="http://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you can <a href="http://wordpress.org/wordpress-3.7-beta2.zip">download the beta here</a> (zip). Check out <strong>Dashboard → Updates</strong> to see if your install is eligible for background updates. WordPress won&#8217;t update if, for example, you&#8217;re using version control like SVN or Git.</p>\n<p>For more of what&#8217;s new in version 3.7, <a title="WordPress 3.7 Beta 1" href="http://wordpress.org/news/2013/09/wordpress-3-7-beta-1/">check out the Beta 1 blog post</a>. In Beta 2, we further increased the stability of background updates and also added about 50 bug fixes, including a fix for Internet Explorer 11 in the visual editor.</p>\n<p>If you think you’ve found a bug, you can post to the <a href="http://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. Or, if you’re comfortable writing a bug report, <a href="http://core.trac.wordpress.org/">file one on the WordPress Trac</a>. There, you can also find <a href="http://core.trac.wordpress.org/report/5">a list of known bugs</a> and <a href="http://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=3.7">everything we’ve fixed</a>.</p>\n<p>Happy testing!</p>\n<p><em>Beta 2 released<br />\nDotting i&#8217;s and crossing t&#8217;s</em><br />\n<em>Expect RC next</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/news/2013/10/wordpress-3-7-beta-2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:31:"http://wordpress.org/news/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:8:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Mon, 30 Dec 2013 21:06:34 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:10:"x-pingback";s:36:"http://wordpress.org/news/xmlrpc.php";s:13:"last-modified";s:29:"Fri, 20 Dec 2013 08:24:58 GMT";s:4:"x-nc";s:11:"HIT lax 249";}s:5:"build";s:14:"20131227145148";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(114, 'can_compress_scripts', '1', 'yes'),
(233, '_transient_timeout_feed_mod_867bd5c64f85878d03a060509cd2f92c', '1388480758', 'no'),
(234, '_transient_feed_mod_867bd5c64f85878d03a060509cd2f92c', '1388437558', 'no'),
(241, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1388480758', 'no'),
(242, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''http://wordpress.org/news/2013/12/parker/'' title=''Version 3.8 of WordPress, named “Parker” in honor of Charlie Parker, bebop innovator, is available for download or update in your WordPress dashboard. We hope you’ll think this is the most beautiful update yet. Introducing a modern new design WordPress has gotten a facelift. 3.8 brings a fresh new look to the entire admin dashboard. […]''>WordPress 3.8 “Parker”</a> <span class="rss-date">December 12, 2013</span><div class=''rssSummary''>Version 3.8 of WordPress, named “Parker” in honor of Charlie Parker, bebop innovator, is available for download or update in your WordPress dashboard. We hope you’ll think this is the most beautiful update yet. Introducing a modern new design WordPress has gotten a facelift. 3.8 brings a fresh new look to the entire admin dashboard. […]</div></li></ul></div><div class="rss-widget"><ul><li><a class=''rsswidget'' href=''http://alexking.org/blog/2013/12/30/fixing-broken-social-twitter-avatars'' title=''If you’ve been using Social for a while like I have, you might also be seeing broken images in the comments area of your old posts. I did a little digging into this and discovered that this is related to how Twitter handles user avatars. When Twitter returns a user object, they include the URL of the user’s avatar. But that URL isn’t a reliable URL (like Facebook provides). Instead it’s a URL to a file location on a CDN. Over time these URLs change, likely relating to users changing their avatars. Social grabs the provided user avatar URL when creating comments from Twitter replies, retweets, or for comments by people who log in with Twitter and faithfully sticks it in for appropriate comments – even when that URL has stopped working. Since Twitter doesn’t provide a reliable URL that we can use over time, I ended up creating a little plugin that asks Twitter for the current user avatar for each Twitter account related to Social comment activity and updates the comments with the new image URLs accordingly. This plugin runs a one-time action, asking Twitter for user information 100 users at a time and updating your comments at that time. So you’ll need to run it every so often to keep things looking and working properly. Since it is a fairly intensive action, I didn’t think putting it on a CRON was a good idea. When you activate the plugin you’ll see a “Run” link in it’s section on the Plugins page. Click that and it will hit Twitter and do its thing.  It’s worked well for my site but that’s about the extent if the testing that’s been done with it. Normal caveats like “make sure you have backups” apply. That’s it – I hope you’ll find this useful if you’re using Social with your WordPress site. Download, fork and contribute on GitHub. This post is part of the project: Social. View the project timeline for more context on this post.''>Alex King: Fixing Broken Social Twitter Avatars</a></li><li><a class=''rsswidget'' href=''http://crowdfavorite.com/blog/2013/12/twitter-tools-v3-1/'' title=''Yay, an update to Twitter Tools! This should fix the “not auto-updating since upgrading Social to version 2.10 (or 2.11)” problem and adds a couple little goodies. I’m primarily posting these types of updates over on the Crowd Favorite blog now, so be sure to subscribe over there. You can also or follow Crowd Favorite on Twitter or Like us on Facebook to get updates. This post is part of the project: Twitter Tools. View the project timeline for more context on this post. #''>Alex King: Twitter Tools v3.1</a></li><li><a class=''rsswidget'' href=''http://wptavern.com/wp-smackdown-on-enhancing-the-distraction-free-writing-experience'' title=''Distraction free writing mode is something I rarely use in WordPress but WP Smackdown has a great post that explains how using two plugins can enhance the distraction free writing experience. The Just Writing plugin enables the ability for preferences to be stored on a per-user basis as well as a few other features. Meanwhile, the DFWM Themes plugin provides up to eight themes to customize the look of the distraction free writing screen.  It’s cool to see that this particular feature in WordPress is able to be customized with themes or plugins. What’s nice about the two plugins mentioned is that both enable customizations at the individual user level. ''>WPTavern: WP Smackdown On Enhancing The Distraction Free Writing Experience</a></li></ul></div><div class="rss-widget"><ul><li class=''dashboard-news-plugin''><span>Popular Plugin:</span> <a href=''http://wordpress.org/plugins/jetpack/'' class=''dashboard-news-plugin-link''>Jetpack by WordPress.com</a></h5>&nbsp;<span>(<a href=''plugin-install.php?tab=plugin-information&amp;plugin=jetpack&amp;_wpnonce=d797287d96&amp;TB_iframe=true&amp;width=600&amp;height=800'' class=''thickbox'' title=''Jetpack by WordPress.com''>Install</a>)</span></li></ul></div>', 'no'),
(254, '_site_transient_timeout_popular_importers_en_US', '1388610785', 'yes'),
(255, '_site_transient_popular_importers_en_US', 'a:2:{s:9:"importers";a:8:{s:7:"blogger";a:4:{s:4:"name";s:7:"Blogger";s:11:"description";s:86:"Install the Blogger importer to import posts, comments, and users from a Blogger blog.";s:11:"plugin-slug";s:16:"blogger-importer";s:11:"importer-id";s:7:"blogger";}s:9:"wpcat2tag";a:4:{s:4:"name";s:29:"Categories and Tags Converter";s:11:"description";s:109:"Install the category/tag converter to convert existing categories to tags or tags to categories, selectively.";s:11:"plugin-slug";s:18:"wpcat2tag-importer";s:11:"importer-id";s:9:"wpcat2tag";}s:11:"livejournal";a:4:{s:4:"name";s:11:"LiveJournal";s:11:"description";s:82:"Install the LiveJournal importer to import posts from LiveJournal using their API.";s:11:"plugin-slug";s:20:"livejournal-importer";s:11:"importer-id";s:11:"livejournal";}s:11:"movabletype";a:4:{s:4:"name";s:24:"Movable Type and TypePad";s:11:"description";s:99:"Install the Movable Type importer to import posts and comments from a Movable Type or TypePad blog.";s:11:"plugin-slug";s:20:"movabletype-importer";s:11:"importer-id";s:2:"mt";}s:4:"opml";a:4:{s:4:"name";s:8:"Blogroll";s:11:"description";s:61:"Install the blogroll importer to import links in OPML format.";s:11:"plugin-slug";s:13:"opml-importer";s:11:"importer-id";s:4:"opml";}s:3:"rss";a:4:{s:4:"name";s:3:"RSS";s:11:"description";s:58:"Install the RSS importer to import posts from an RSS feed.";s:11:"plugin-slug";s:12:"rss-importer";s:11:"importer-id";s:3:"rss";}s:6:"tumblr";a:4:{s:4:"name";s:6:"Tumblr";s:11:"description";s:84:"Install the Tumblr importer to import posts &amp; media from Tumblr using their API.";s:11:"plugin-slug";s:15:"tumblr-importer";s:11:"importer-id";s:6:"tumblr";}s:9:"wordpress";a:4:{s:4:"name";s:9:"WordPress";s:11:"description";s:130:"Install the WordPress importer to import posts, pages, comments, custom fields, categories, and tags from a WordPress export file.";s:11:"plugin-slug";s:18:"wordpress-importer";s:11:"importer-id";s:9:"wordpress";}}s:10:"translated";b:0;}', 'yes'),
(256, 'rewrite_rules', 'a:68:{s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:39:"index.php?&page_id=10&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes'),
(1085, '_site_transient_update_plugins', 'O:8:"stdClass":3:{s:12:"last_checked";i:1398720802;s:8:"response";a:2:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.0.0";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.0.0.zip";}s:36:"contact-form-plugin/contact_form.php";O:8:"stdClass":6:{s:2:"id";s:5:"22832";s:4:"slug";s:19:"contact-form-plugin";s:6:"plugin";s:36:"contact-form-plugin/contact_form.php";s:11:"new_version";s:4:"3.77";s:3:"url";s:50:"https://wordpress.org/plugins/contact-form-plugin/";s:7:"package";s:67:"https://downloads.wordpress.org/plugin/contact-form-plugin.3.77.zip";}}s:12:"translations";a:0:{}}', 'yes'),
(962, 'auto_core_update_notified', 'a:4:{s:4:"type";s:6:"manual";s:5:"email";s:21:"jebinshakya@gmail.com";s:7:"version";s:5:"3.8.2";s:9:"timestamp";i:1397092045;}', 'yes'),
(231, '_transient_timeout_feed_867bd5c64f85878d03a060509cd2f92c', '1388480758', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(232, '_transient_feed_867bd5c64f85878d03a060509cd2f92c', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:61:"\n	\n	\n	\n	\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"WordPress Planet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:28:"http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:2:"en";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:47:"WordPress Planet - http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:50:{i:0;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:47:"Alex King: Fixing Broken Social Twitter Avatars";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://alexking.org/?p=19031";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:72:"http://alexking.org/blog/2013/12/30/fixing-broken-social-twitter-avatars";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2555:"<p>If you&#8217;ve been using <a href="http://alexking.org/projects/social">Social</a> for a while like I have, you might also be seeing broken images in the comments area of your old posts. I did a little digging into this and discovered that this is related to how Twitter handles user avatars.</p>\n<p>When Twitter returns a user object, they include the URL of the user&#8217;s avatar. But that URL isn&#8217;t a reliable URL (like Facebook provides). Instead it&#8217;s a URL to a file location on a CDN. Over time these URLs change, likely relating to users changing their avatars.</p>\n<p>Social grabs the provided user avatar URL when creating comments from Twitter replies, retweets, or for comments by people who log in with Twitter and faithfully sticks it in for appropriate comments &#8211; even when that URL has stopped working.</p>\n<p>Since Twitter doesn&#8217;t provide a reliable URL that we can use over time, I ended up <a href="https://github.com/alexkingorg/wp-social-twitter-avatar-update">creating a little plugin</a> that asks Twitter for the <em>current</em> user avatar for each Twitter account related to Social comment activity and updates the comments with the new image URLs accordingly.</p>\n<p>This plugin runs a one-time action, asking Twitter for user information 100 users at a time and updating your comments at that time. So you&#8217;ll need to run it every so often to keep things looking and working properly. Since it is a fairly intensive action, I didn&#8217;t think putting it on a CRON was a good idea.</p>\n<p>When you activate the plugin you&#8217;ll see a &#8220;Run&#8221; link in it&#8217;s section on the Plugins page. Click that and it will hit Twitter and do its thing.</p>\n<p><img src="http://alexking.org/wp-content/uploads/2013/12/social-twitter-avatar-fix-510x68.png" alt="Social Twitter Avatar Fix" width="480" height="64" class="alignnone size-medium-img wp-image-19032" /></p>\n<p>It&#8217;s worked well for my site but that&#8217;s about the extent if the testing that&#8217;s been done with it. Normal caveats like &#8220;make sure you have backups&#8221; apply.</p>\n<p>That&#8217;s it &#8211; I hope you&#8217;ll find this useful if you&#8217;re using Social with your WordPress site.</p>\n<p><a href="https://github.com/alexkingorg/wp-social-twitter-avatar-update">Download, fork and contribute on GitHub.</a></p>\n<p class="threads-post-notice">This post is part of the project: <a href="http://alexking.org/project/social">Social</a>. View the project timeline for more context on this post.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 30 Dec 2013 19:58:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Alex";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Alex King: Twitter Tools v3.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:48:"http://pinboard-491795aa96bc8913d24b16b74307030d";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"http://crowdfavorite.com/blog/2013/12/twitter-tools-v3-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:825:"<p>Yay, an update to Twitter Tools! This should fix the &#8220;not auto-updating since upgrading Social to version 2.10 (or 2.11)&#8221; problem and adds a couple little goodies.</p>\n<p>I&#8217;m primarily posting these types of updates over on the <a href="http://crowdfavorite.com/blog/">Crowd Favorite blog</a> now, so be sure to subscribe over there. You can also or <a href="https://twitter.com/crowdfavorite">follow Crowd Favorite on Twitter</a> or <a href="https://www.facebook.com/crowdfavoritecom">Like us on Facebook</a> to get updates.</p>\n<p class="threads-post-notice">This post is part of the project: <a href="http://alexking.org/project/twitter-tools">Twitter Tools</a>. View the project timeline for more context on this post.</p>\n<p><a href="http://alexking.org/blog/2013/12/30/twitter-tools-v3-1">#</a></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 30 Dec 2013 19:23:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Alex";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:75:"WPTavern: WP Smackdown On Enhancing The Distraction Free Writing Experience";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=13856";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:85:"http://wptavern.com/wp-smackdown-on-enhancing-the-distraction-free-writing-experience";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1435:"<p>Distraction free writing mode is something I rarely use in WordPress but WP Smackdown has a <a href="http://wpsmackdown.com/wordpress-distraction-free-writing-mode/" title="http://wpsmackdown.com/wordpress-distraction-free-writing-mode/">great post</a> that explains how using two plugins can enhance the distraction free writing experience. The <a href="http://wordpress.org/plugins/just-writing/" title="http://wordpress.org/plugins/just-writing/">Just Writing plugin</a> enables the ability for preferences to be stored on a per-user basis as well as a few other features. Meanwhile, the <a href="http://wordpress.org/plugins/distraction-free-writing-mode-themes/" title="http://wordpress.org/plugins/distraction-free-writing-mode-themes/">DFWM Themes plugin</a> provides up to eight themes to customize the look of the distraction free writing screen.</p>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/DFWMThemes.jpg" rel="prettyphoto[13856]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/DFWMThemes-500x160.jpg" alt="Distraction Free Writing Mode Themes Plugin Header" width="500" height="160" class="aligncenter size-large wp-image-13863" /></a></p>\n<p>It&#8217;s cool to see that this particular feature in WordPress is able to be customized with themes or plugins. What&#8217;s nice about the two plugins mentioned is that both enable customizations at the individual user level. </p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 30 Dec 2013 19:14:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:6:"Jeffro";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:65:"WPTavern: Growing A CSS Zen Garden Using WordPress Default Themes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=13750";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"http://wptavern.com/growing-a-css-zen-garden-using-wordpress-default-themes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2667:"<p>Konstantin Obenland who worked on the default theme for WordPress 3.8 <a title="http://konstantin.obenland.it/2013/12/19/twenty-fifteen/" href="http://konstantin.obenland.it/2013/12/19/twenty-fifteen/">published a post</a> that provides details into the development of TwentyFourteen. Konstantin shares some of the lessons learned throughout its development and explains what direction TwentyFifteen may take.</p>\n<blockquote><p>I think it would be great if we could combine the two approaches, start from scratch and use an existing theme, for Twenty Fifteen. Let’s create a theme design from scratch, much like Twenty Twelve and Twenty Thirteen, and have it be based on _s, as the pre-existing theme.</p></blockquote>\n<p>However, a cool idea sprang from his post. A <a title="http://www.csszengarden.com/" href="http://www.csszengarden.com/">CSS Zen Garden</a> like website but for WordPress themes. CSS Zen Garden showcases what&#8217;s possible with just CSS. The HTML structure stays the same, while CSS provides all of the visual elements. The idea proposed for WordPress is to use a simple theme like <a title="http://underscores.me/" href="http://underscores.me/">_s</a> and apply changes only through the style.css file.</p>\n<blockquote><p>But most importantly: Let changes only be in style.css. That’s it! No additional functionality or bloat. If anything, we take unneeded code out. This doesn’t mean it can’t look good. It doesn’t mean it will be less awesome than its predecessors. CSS is a powerful tool, if in the right hands.</p></blockquote>\n<h3>Not A New Idea</h3>\n<p>In 2005, Alex King hosted a <a title="http://alexking.org/blog/2005/02/27/wordpress-theme-competition" href="http://alexking.org/blog/2005/02/27/wordpress-theme-competition">WordPress theme competition</a> for WordPress 1.5. Entries were composed of changes to the style.css file for the WordPress 1.2 template and 1.5 Classic Theme. The WordPress theme landscape was much different during this time and through competitions like Alex King&#8217;s, WordPress users instantly had a larger variety of themes to choose from.</p>\n<p>As an aside, <a title="http://konstantin.obenland.it/2013/12/19/twenty-fifteen/comment-page-1/#comment-33" href="http://konstantin.obenland.it/2013/12/19/twenty-fifteen/comment-page-1/#comment-33">this comment by Lance Willett</a> provides some food for thought. Basically, instead of themes becoming more complex, perhaps the core of WordPress needs to have more features and improvements so code heavy items are taken out of the theme. Overall, I think a CSS Zen Garden like website for WordPress default themes is an excellent idea.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 30 Dec 2013 17:31:29 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:6:"Jeffro";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:51:"WordPress.tv: MaAnna Stephenson: WordPress Bootcamp";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=24471";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"http://wordpress.tv/2013/12/30/maanna-stephenson-wordpress-bootcamp/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:651:"<div id="v-sxkXi60T-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/24471/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/24471/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=24471&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/30/maanna-stephenson-wordpress-bootcamp/"><img alt="MaAnna Stephenson: WordPress Bootcamp" src="http://videos.videopress.com/sxkXi60T/video-a48dbf73ce_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 30 Dec 2013 16:19:40 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:63:"WordPress.tv: Brian Hogg: Working With Geolocation In WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=26847";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:80:"http://wordpress.tv/2013/12/30/brian-hogg-working-with-geolocation-in-wordpress/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:675:"<div id="v-BnLZUzl3-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/26847/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/26847/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=26847&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/30/brian-hogg-working-with-geolocation-in-wordpress/"><img alt="Brian Hogg: Working With Geolocation In WordPress" src="http://videos.videopress.com/BnLZUzl3/video-86d136ace9_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 30 Dec 2013 16:15:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:71:"WordPress.tv: Saurabh Shukla: WordPress As A Distributed Social Network";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=26755";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:88:"http://wordpress.tv/2013/12/29/saurabh-shukla-wordpress-as-a-distributed-social-network/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:691:"<div id="v-vWAT5VBm-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/26755/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/26755/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=26755&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/29/saurabh-shukla-wordpress-as-a-distributed-social-network/"><img alt="Saurabh Shukla: WordPress As A Distributed Social Network" src="http://videos.videopress.com/vWAT5VBm/video-87e82653ed_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 29 Dec 2013 19:51:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:91:"WordPress.tv: Lisa Sabin-Wilson: Scoping Projects To Avoid Stress, Headaches And Angry Mobs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=24097";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:107:"http://wordpress.tv/2013/12/29/lisa-sabin-wilson-scoping-projects-to-avoid-stress-headaches-and-angry-mobs/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:736:"<div id="v-GFMyqXrP-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/24097/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/24097/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=24097&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/29/lisa-sabin-wilson-scoping-projects-to-avoid-stress-headaches-and-angry-mobs/"><img alt="Lisa Sabin-Wilson: Scoping Projects To Avoid Stress, Headaches And Angry Mobs" src="http://videos.videopress.com/GFMyqXrP/video-dba930b87b_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 29 Dec 2013 16:04:17 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:67:"WordPress.tv: Carl Danley and Eric Mann: WordPress Javascript Hooks";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=24095";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:84:"http://wordpress.tv/2013/12/28/carl-danley-and-eric-mann-wordpress-javascript-hooks/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:689:"<div id="v-XFqEDLLE-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/24095/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/24095/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=24095&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/28/carl-danley-and-eric-mann-wordpress-javascript-hooks/"><img alt="Carl Danley and Eric Mann: WordPress Javascript Hooks" src="http://videos.videopress.com/XFqEDLLE/video-6fd56447c5_scruberthumbnail_2.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 28 Dec 2013 19:47:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:60:"WordPress.tv: Adam Pickering: Running A WordPress Theme Shop";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=25260";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:77:"http://wordpress.tv/2013/12/28/adam-pickering-running-a-wordpress-theme-shop/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:669:"<div id="v-8BzQdlzS-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/25260/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/25260/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=25260&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/28/adam-pickering-running-a-wordpress-theme-shop/"><img alt="Adam Pickering: Running A WordPress Theme Shop" src="http://videos.videopress.com/8BzQdlzS/video-f96ccb73e3_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 28 Dec 2013 19:40:20 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:68:"WordPress.tv: Chris Ford: Creating An Agile WordPress Design Process";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=25447";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:85:"http://wordpress.tv/2013/12/27/chris-ford-creating-an-agile-wordpress-design-process/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:691:"<div id="v-L6f6ZklR-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/25447/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/25447/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=25447&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/27/chris-ford-creating-an-agile-wordpress-design-process/"><img alt="Chris Ford: Creating An Agile WordPress Design Process" src="http://videos.videopress.com/L6f6ZklR/video-6fe6a009fb_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 27 Dec 2013 19:24:20 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:41:"Alex King: Ghost and Accidental Messaging";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://alexking.org/?p=18996";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"http://alexking.org/blog/2013/12/27/ghost-and-accidental-messaging";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2824:"<p>I investigate pretty much every new publishing system that comes out. I&#8217;m eager to see what features they think are important, and see what might spark new ideas for my own site. I got my invite to try <a href="https://ghost.org/">Ghost</a> a short time ago. I put up a test post, and was a shocked by what I saw in the footer.</p>\n<p><img src="http://alexking.org/wp-content/uploads/2013/12/ghost-copyright-510x307.png" alt="Ghost Copyright" width="480" height="288" class="alignnone size-medium-img wp-image-18997" /></p>\n<p>I&#8217;ve circled the footer area, which includes:</p>\n<blockquote><p>All content copyright Ghost &copy; 2013 &middot; All rights reserved.</p></blockquote>\n<p>My reaction upon seeing this? <em>Whoah &#8211; &#8220;Copyright Ghost&#8221;? I don&#8217;t think so&#8230;</em></p>\n<p>I did a little poking around and found <a href="https://ghost.org/about/terms/">Ghost&#8217;s Terms of Service</a>, which are derived from the <a href="http://en.wordpress.com/tos/">WordPress.com TOS</a> and are released under a Creative Common 3.0 license. That was more like what I expected and didn&#8217;t seem to jive with what I was seeing in the footer.</p>\n<p>So I did a little more searching. Pretty soon I found this:</p>\n<p><img src="http://alexking.org/wp-content/uploads/2013/12/ghost-template-510x68.png" alt="Template File" width="480" height="64" class="alignnone size-medium-img wp-image-19000" /></p>\n<p>In the search results, I could see that the line that was bothering me is actually a pretty reasonable bit of template language:</p>\n<blockquote><p><code>All content copyright {{@blog.title}} &copy; 2013 [&hellip;]</code></p></blockquote>\n<p>This was a simple matter of defaults causing accidental messaging. See when you create a blog on Ghost, the default name of the blog is &#8220;Ghost&#8221;. Then the footer is outputting the blog name (Ghost) as the copyright holder.<sup id="fnref:1"><a href="http://alexking.org/blog/topic/wordpress/feed#fn:1" rel="footnote">1</a></sup> If I had taken the time to set my blog name to &#8220;Alex King&#8221;, then the footer message would have read &#8220;copyright Alex King&#8221;. This is a case of several things coming together to say something they didn&#8217;t mean.</p>\n<p>Be careful with your defaults! Your messaging is important and if you&#8217;re not careful it can say something you didn&#8217;t intend.</p>\n<div class="footnotes">\n<hr />\n<ol>\n<li id="fn:1">\nI&#8217;m not a lawyer, but I believe this really isn&#8217;t an accurate copyright statement. Copyright is owned by a person or entity; the name of a blog isn&#8217;t something that can own copyright (unless it is also the name of a person or entity).&#160;<a href="http://alexking.org/blog/topic/wordpress/feed#fnref:1" rev="footnote">&#8617;</a>\n</li>\n</ol>\n</div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 27 Dec 2013 18:23:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Alex";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"Akismet: Our 2013 In Review";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"http://blog.akismet.com/?p=1097";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:50:"http://blog.akismet.com/2013/12/27/2013-in-review/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5011:"<p>As 2013 draws to a close, we at Akismet would like to let you know just what we&#8217;ve been up to &#8212; and, of course, wish you a very happy holiday season.</p>\n<p>For the abridged version, we&#8217;ve prepared a nifty infographic illustrating the year that was:</p>\n<p><a href="http://akismet.files.wordpress.com/2013/12/2013-year-in-review.png"><img class="size-large wp-image-1186 aligncenter" alt="Akismet 2013 Year In Review Infographic" src="http://akismet.files.wordpress.com/2013/12/2013-year-in-review.png?w=468&h=1024" /></a></p>\n<p><span id="more-1097"></span></p>\n<p>We reached an incredible milestone this year in catching our <strong>100-billionth</strong> spam comment. And we&#8217;re already fast approaching our 115-billionth.</p>\n<p>The levels of spam we&#8217;re seeing and catching have increased dramatically over the past year. In fact, when compared with 2012 numbers (as seen in <a href="http://blog.akismet.com/2012/12/21/a-spammy-year-in-review/">last year&#8217;s post</a>), each month in 2013 experienced an average year-over-year increase of <strong>more than 70%</strong>, as the following chart shows:</p>\n<p><a href="http://akismet.files.wordpress.com/2013/12/akismet-2013-spam-totals.png"><img class="size-large wp-image-1121 aligncenter" alt="Akismet 2013 Spam Totals - Month by Month" src="http://akismet.files.wordpress.com/2013/12/akismet-2013-spam-totals.png?w=600&h=375" width="600" height="375" /></a></p>\n<p>On average, we are currently catching around <strong>200 million</strong> spam comments every day, which is about <strong>80 million more</strong> than our daily average this time last year. That&#8217;s over <strong>8,000,000 per hour</strong>, or over <strong>2,000 per second</strong>. For the year, we averaged over <strong>120 million </strong>spam comments per day &#8211; a year-over-year jump of over 50 million. On December 21, we set a new record zapping <strong>245 million</strong> spam comments in just 24 hours.</p>\n<p>While spam themes and schemes are always changing, knockoff fashion-goods spam (which we talked about in last year&#8217;s post) dominated 2013. Even more troubling is the rising trend of these spammers using hacked sites to deliver payloads. You may have seen these before, where links point to individual pages that include an extension (like &#8220;.asp&#8221;). We suspect that <a href="http://www.theawl.com/2013/12/the-new-spammer-panic">disenchanted SEO spammers</a> are using this strategy in response to new policies by Google. Instead of simply posting comments with links to their own sites, they&#8217;ve moved to hacking vulnerable sites and launching buffer pages. Since the launch of Google&#8217;s Penguin 2.1 back in October, we have actually seen a significant increase in daily spam averages.</p>\n<p>Other themes of comment spam have certainly developed and intensified over the last 12 months (spell casters, anyone?), but these are merely blips on the radar compared to the knockoff-fashion variety. Here are some recent examples of sites that Akismet intercepted:</p>\n\n<a href="http://blog.akismet.com/2013/12/27/2013-in-review/oakley-knockoff-spam-site/"><img width="150" height="101" src="http://akismet.files.wordpress.com/2013/12/oakley-knockoff-spam-site.png?w=150&h=101" class="attachment-thumbnail" alt="Oakley Knockoff Spam" /></a>\n<a href="http://blog.akismet.com/2013/12/27/2013-in-review/nfl-jerseys-knockoff-spam-site/"><img width="150" height="96" src="http://akismet.files.wordpress.com/2013/12/nfl-jerseys-knockoff-spam-site.png?w=150&h=96" class="attachment-thumbnail" alt="NFL Jersey Knockoff Spam" /></a>\n<a href="http://blog.akismet.com/2013/12/27/2013-in-review/ugg-knockoff-spam-site/"><img width="150" height="86" src="http://akismet.files.wordpress.com/2013/12/ugg-knockoff-spam-site.png?w=150&h=86" class="attachment-thumbnail" alt="Ugg Knockoff Spam" /></a>\n\n<p>Beyond our usual spam fighting activities, we have also started reaching out to other UGC services to see where, based on our vast pool of spam data, we can help in identifying spam troubling their own communities. We hope to expand that initiative in the coming year, and include hosts in the conversation as well. In 2014 you can also expect more educational anti-spam projects (including webinars), more frequent and insightful blog content, enhanced support documentation, and an increase in developer-friendly initiatives. And, of course, even stronger spam protection.</p>\n<p>A sincere Happy Holidays to you and yours,<br />\nThe Akismet Team <small>(Alex, Mark, Eoin, Anthony, Chris F., Valerie, Chris R., Greg, Dan, and Nick)</small></p><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/akismet.wordpress.com/1097/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/akismet.wordpress.com/1097/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=blog.akismet.com&blog=116920&post=1097&subd=akismet&ref=&feed=1" width="1" height="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 27 Dec 2013 18:08:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:7:"Anthony";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:68:"WordPress.tv: Tomas Puig: Design And Development Trends In WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=25371";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:85:"http://wordpress.tv/2013/12/27/tomas-puig-design-and-development-trends-in-wordpress/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:691:"<div id="v-Mqtu8rZl-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/25371/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/25371/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=25371&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/27/tomas-puig-design-and-development-trends-in-wordpress/"><img alt="Tomas Puig: Design And Development Trends In WordPress" src="http://videos.videopress.com/Mqtu8rZl/video-eef3fef18d_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 27 Dec 2013 14:26:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:68:"Alex King: Will 2014 Be the Year of WordPress Tuck-ins and Roll-ups?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:48:"http://pinboard-be8b48f1c13c5144f15df29a710eb67c";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:77:"http://torquemag.io/will-2014-be-the-year-of-wordpress-tuck-ins-and-roll-ups/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:801:"<p>Most WordPress businesses are very young (<a href="http://crowdfavorite.com">Crowd Favorite</a> was one of, if not the first in 2007). As these businesses mature and realize what is needed of them to take the next steps, consolidation often looks like a saner route than continuing to build. Especially for technical founders that aren&#8217;t as interested in managing the necessary business infrastructure (I count myself in this group).</p>\n<p class="threads-post-notice">This post is part of the thread: <a href="http://alexking.org/blog/thread/crowd-favorite">Crowd Favorite</a> &#8211; an ongoing story on this site. View the thread timeline for more context on this post.</p>\n<p><a href="http://alexking.org/blog/2013/12/26/will-2014-be-the-year-of-wordpress-tuck-ins-and-roll-ups">#</a></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 26 Dec 2013 21:45:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Alex";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:61:"WordPress.tv: Scott Kingsley Clark: Ermahgerd! Content Types!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=24087";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:76:"http://wordpress.tv/2013/12/26/scott-kingsley-clark-ermahgerd-content-types/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:675:"<div id="v-g5NH2v1v-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/24087/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/24087/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=24087&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/26/scott-kingsley-clark-ermahgerd-content-types/"><img alt="Scott Kingsley Clark: Ermahgerd! Content Types!" src="http://videos.videopress.com/g5NH2v1v/video-2d5e47d94d_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 26 Dec 2013 14:21:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:56:"WordPress.tv: Noel Tock and Joe Hoyle: WordPress As SaaS";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=24115";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"http://wordpress.tv/2013/12/26/noel-tock-and-joe-hoyle-wordpress-as-saas/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:667:"<div id="v-ljXD0OmB-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/24115/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/24115/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=24115&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/26/noel-tock-and-joe-hoyle-wordpress-as-saas/"><img alt="Noel Tock and Joe Hoyle: WordPress As SaaS" src="http://videos.videopress.com/ljXD0OmB/video-ca541b8d13_scruberthumbnail_1.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 26 Dec 2013 14:03:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Matt: Christmas Jazz Music";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=43248";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:42:"http://ma.tt/2013/12/christmas-jazz-music/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:863:"<p>I love Christmas: the lights, the food, the music. The music part can sometimes be fraught, though. There&#8217;s so many cheesy and badly done Christmas albums out there. Fortunately my favorite genre, jazz, has actually a really impressive collection of interesting interpretations of Christmas classics.</p>\n<p>Over the years I&#8217;ve curated a few of my favorites. Thanks to Spotify, one of my favorite services I discovered in 2013, it&#8217;s easy to share them with you. Here&#8217;s my Xmas Jazz playlist, including my favorite holiday arrangement of all time, Duke Ellington&#8217;s version of the Nutcracker Suite.</p>\n<p></p>\n<p>Remember: It&#8217;s okay to play holiday music until at least mid-January.</p>\n<p>If you have any favorites you&#8217;d like me to add, send them via Spotify messages or in the comments. Merry Christmas everybody!</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 25 Dec 2013 17:54:15 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"WordPress.tv: Mari Kane: WordPress in 10 Steps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=24401";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:63:"http://wordpress.tv/2013/12/25/mari-kane-wordpress-in-10-steps/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:647:"<div id="v-NT0CfMIF-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/24401/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/24401/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=24401&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/25/mari-kane-wordpress-in-10-steps/"><img alt="Mari Kane: WordPress in 10 Steps" src="http://videos.videopress.com/NT0CfMIF/video-27674b3537_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 25 Dec 2013 13:51:43 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:72:"WordPress.tv: Austin Smith: Customizing The Admin Area With Fieldmanager";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=24327";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:89:"http://wordpress.tv/2013/12/25/austin-smith-customizing-the-admin-area-with-fieldmanager/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:693:"<div id="v-6Iy3fsYO-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/24327/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/24327/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=24327&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/25/austin-smith-customizing-the-admin-area-with-fieldmanager/"><img alt="Austin Smith: Customizing The Admin Area With Fieldmanager" src="http://videos.videopress.com/6Iy3fsYO/video-8d7530a3e2_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 25 Dec 2013 13:28:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:76:"WordPress.tv: Philip Arthur Moore: How To Become A WordPress Theme Developer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=26942";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:93:"http://wordpress.tv/2013/12/24/philip-arthur-moore-how-to-become-a-wordpress-theme-developer/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:707:"<div id="v-2IaJzR94-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/26942/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/26942/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=26942&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/24/philip-arthur-moore-how-to-become-a-wordpress-theme-developer/"><img alt="Philip Arthur Moore: How To Become A WordPress Theme Developer" src="http://videos.videopress.com/2IaJzR94/video-71c5cbe33d_scruberthumbnail_1.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 24 Dec 2013 23:08:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:82:"WPTavern: Admin Color Schemer: The Easiest Way to Customize WordPress Admin Colors";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=13795";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:91:"http://wptavern.com/admin-color-schemer-the-easiest-way-to-customize-wordpress-admin-colors";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3929:"<p>This week on the Tavern we&#8217;ve been following the trend of new plugins popping up for customizing admin color schemes. Since WordPress 3.8 was released, developers have been having fun creating tools that give WordPress users more options beyond the eight default schemes. Yesterday we featured the <a href="http://wptavern.com/create-custom-admin-color-schemes-directly-within-wordpress" target="_blank">HS Custom Admin Theme</a> plugin as one of the first plugins to take a stab at it, but the developer seems to have pulled it from the repo. </p>\n<p>In the meantime, Helen Hou-Sandi, in collaboration with Mark Jaquith, released a new plugin today called <a href="http://wordpress.org/plugins/admin-color-schemer/" target="_blank">Admin Color Schemer</a> that gives you the ability to create and preview color schemes within the WordPress admin. This is by far the smoothest implementation of this feature that I&#8217;ve seen to date.</p>\n<p>After you install the plugin, you&#8217;ll find a new &#8220;Admin Colors&#8221; menu under <strong>Tools</strong>. This seems a little difficult to find, but Helen <a href="https://github.com/helenhousandi/admin-color-schemer/issues/12" target="_blank">plans to add an &#8220;Edit&#8221; link</a> to the User profile page in the near future. Here&#8217;s a quick test I performed:</p>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/admin-color-schemer.jpg" rel="prettyphoto[13795]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/admin-color-schemer.jpg" alt="admin-color-schemer" width="787" height="437" class="aligncenter size-full wp-image-13829" /></a></p>\n<p>The color-picker used with this plugin provides a truly pleasant experience for exploring a full range of different hues. </p>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/color-picker.jpg" rel="prettyphoto[13795]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/color-picker.jpg" alt="color-picker" width="800" height="348" class="aligncenter size-full wp-image-13833" /></a></p>\n<p>Clicking the &#8220;Preview&#8221; button will let you see your color scheme live so that you can tweak it as necessary before saving it to use.</p>\n<h3>Advanced Options for Editing Admin Color Schemes</h3>\n<p>While testing the plugin, I found that if you click on &#8220;Show Advanced Options&#8221;, there are an additional 30 options for editing your admin color scheme. These include the ability to color the buttons, body background, links, menu background, menu current background, checked form controls and so much more. </p>\n<p>If you build websites for clients, the Admin Color Schemer provides a great option for customizing the admin to use the colors for your client&#8217;s brand. You could even go all out and try to match the colors to the front-end design. </p>\n<p>One thing to note is that this plugin is a tool for the whole admin and does not provide color schemes specific to users or their profiles.  Of course this is just the first iteration and additional features may be added down the line. If you&#8217;d like to collaborate with Helen and Mark to contribute on the project, check out the plugin&#8217;s <a href="https://github.com/helenhousandi/admin-color-schemer" target="_blank">github repo</a>.</p>\n<p>If you don&#8217;t trust yourself to create a decent color scheme &#8211; truly, it&#8217;s harder than it looks &#8211; you might install the <a href="http://wptavern.com/get-more-admin-color-schemes-for-wordpress-3-8" target="_blank">Admin Color Schemes</a> plugin for an assortment of eye-pleasing options. For WordPress users who are excited to try creating their own color schemes with a live preview, it looks like the <a href="http://wordpress.org/plugins/admin-color-schemer/" target="_blank">Admin Color Schemer</a> will be the front-runner plugin for providing the best solution with the most options.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 24 Dec 2013 22:18:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"WPTavern: Development Agency 10up Acquires Brainstorm Media";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=13637";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"http://wptavern.com/development-agency-10up-acquires-brainstorm-media";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3816:"<p><a href="http://wptavern.com/wp-content/uploads/2013/12/10UpLogo.jpg" rel="prettyphoto[13637]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/10UpLogo.jpg" alt="10up Logo" width="139" height="164" class="alignright size-full wp-image-13736" /></a>Web development Agency <a title="http://10up.com/" href="http://10up.com/">10up</a> has <a href="http://10up.com/blog/brainstorm-joins-10up/" title="http://10up.com/blog/brainstorm-joins-10up/">announced</a> they have acquired <a title="http://brainstormmedia.com/" href="http://brainstormmedia.com/">Brainstorm Media</a> for an undisclosed amount. Brainstorm Media, also a WordPress development agency, was a staff of eight led by Paul Clark and Taylor Aldridge. The entire team will join 10up at the start of 2014, adding to its development capacity and strengthening the creative design arm of the company. This brings the total number of full time 10up employees to 50.</p>\n<p>While Brainstorm Media may not be familiar to you, they&#8217;ve been developing websites on top of WordPress for years. Brainstorm&#8217;s team has worked with a number of high profile clients such as Larry Fitzgerald of the Arizona Cardinals and the Wall Street Journal. A few months ago, Sarah Gooding <a title="http://wptavern.com/how-to-install-wordpress-plugins-directly-from-github" href="http://wptavern.com/how-to-install-wordpress-plugins-directly-from-github">profiled a plugin</a> created by Paul Clark called <a title="https://github.com/brainstormmedia/github-plugin-search" href="https://github.com/brainstormmedia/github-plugin-search">Github Plugin Search</a> that enables users to access and install WordPress plugins directly from your dashboard.</p>\n<p>However, Paul is most widely known throughout the WordPress community for his presentation on how <a title="http://pdclark.com/wordpress-saves-lives-moves-governments-lightning-talk/" href="http://pdclark.com/wordpress-saves-lives-moves-governments-lightning-talk/">WordPress Saves Lives and Moves Governments</a>. I&#8217;ve been told by those who have attended his sessions that he always receives a standing ovation.</p>\n<p>This acquisition is similar to the one we <a title="http://wptavern.com/crowd-favorite-acquired-by-velomedia" href="http://wptavern.com/crowd-favorite-acquired-by-velomedia">reported on</a> in the middle of November when VeloMedia acquired Crowd Favorite. When I spoke with Jake Goldman, President of 10up, and asked him why they acquired the company, he replied:</p>\n<blockquote><p>I&#8217;ve been impressed with Brainstorm since Paul, Taylor, and I met at WordCamp LA more than 2 years ago. Paul is a very unique mix of skilled software engineer, smart business leader, and inspiring speaker. Taylor&#8217;s gravitas and depth &#8211; more than two decades worth &#8211; when it comes to design is very apparent, and I&#8217;m inspired by his genuine values. Our teams share common values around contribution, quality, and work ethic, and our capacity to effectively collaborate was validated with a trial engagement. Everyone at 10up feels very lucky and excited to be joining forces with this team.</p></blockquote>\n<h3>WordPress Has A Healthy Ecosystem</h3>\n<p>This acquisition is a sign that the WordPress community as a whole is maturing. WordPress companies acquiring other WordPress companies is a signal that the WordPress ecosystem is healthy. Within the next 2-4 years, I think these acquisitions will be common place. The ecosystem is filled with WordPress development agencies that are one to ten person operations. Any of these development agencies that become mildly successful will most likely become an acquisition of talent more than anything else.</p>\n<h3>Watch Paul Clark&#8217;s WordCamp Presentation</h3>\n<div class="aligncenter"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 24 Dec 2013 20:24:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:6:"Jeffro";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:65:"WPTavern: WordCamp Miami to Celebrate 5th Anniversary in May 2014";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=13775";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"http://wptavern.com/wordcamp-miami-to-celebrate-5th-anniversary-in-may-2014";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4108:"<p><a href="http://wptavern.com/wp-content/uploads/2013/12/miami-header.jpg" rel="prettyphoto[13775]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/miami-header.jpg" alt="http://www.dreamstime.com/-image11969050" width="1000" height="288" class="aligncenter size-full wp-image-13779" /></a></p>\n<p><a href="http://www.davidbisset.com/" target="_blank">David Bisset</a> has been organizing <a href="http://2014.miami.wordcamp.org/" target="_blank">WordCamp Miami</a> for the past five years. That&#8217;s a long time in WordPress years! WordCamp Miami will celebrate its five year anniversary May 23-25, 2014. </p>\n<p>The first WordCamp Miami was held in 2010, spreading the phenomenon of WordCamps to one of the largest metropolitan areas in the US. Every single year the event has sold out and attendance has steadily increased:</p>\n<ul>\n<li>2010 attendance: 250 people (sold out)</li>\n<li>2011 attendance: 340 people (sold out)</li>\n<li>2012 attendance: 420 people (sold out)</li>\n<li>2013 attendance: 500 people (sold out), 1500 unique visitors via livestream</li>\n</ul>\n<p>This year the team anticipates 600 &#8211; 700 attendees. Now that the official dates have been announced, they&#8217;ve opened the event up for <a href="http://2014.miami.wordcamp.org/call-for-speakers/" target="_blank">speaker submissions</a> and <a href="http://2014.miami.wordcamp.org/become-a-sponsor/" target="_blank">sponsors</a>. They&#8217;ve also put together a <a href="http://miami.wordcamp.org/" target="_blank">photo contest</a> to celebrate the 5th anniversary. Contestants are urged to take a unique WordPress or WCMIA photo and submit for a chance to win prizes from the organizers.</p>\n<p>WordCamp Miami is a fantastic example of a WordPress event done right. It&#8217;s not easy to nail down why it&#8217;s been such a successful event, because so many factors come into play. Bisset says that he doesn&#8217;t have a formula for other WordCamps to follow: </p>\n<blockquote><p>WordCamps are not all clones of each other, they each have their own mood and personality. For Miami, we&#8217;ve been wild and experimental in what we do to see what works well and what doesn&#8217;t. But we&#8217;ve always held in high regard that WordCamps in general should be about education, the social element, and networking. You don&#8217;t truly appreciate the WordPress community until you&#8217;re literally surrounded by people at a WordCamp or WordPress social event, and it&#8217;s something that you can&#8217;t fully pick up online.</p></blockquote>\n<p>Putting together a massive event like WordCamp Miami is quite a feat, but Bisset has help from his local community. The organization committee he works with has different people to help handle various aspects of the event. The team also holds a special relationship with local people from the University of Miami LaunchPad and RefreshMiami, two local tech groups that have also pitched in to help. </p>\n<p>I asked Bisset if he&#8217;ll be down for the next five years of organizing WordCamp Miami. He said he&#8217;s taking it one year at a time. &#8220;I wasn&#8217;t expecting to be planning a WordCamp for this long. So, yes definitely taking it one year at a time. I think every year I say &#8220;that&#8217;s it&#8221; but that passes after a few months.&#8221; </p>\n<p>If past years are any indication, this event is bound to sell out quickly so get your tickets early if you plan to go. First time attendees are also welcome to get in on the <a href="http://miami.wordcamp.org/" target="_blank">photo contest</a> for a chance to win tickets and prizes. The event will be stocked with goodies for attendees when they arrive in May in order to say thanks to the thousands of people that have supported WordCamp Miami throughout the years. The organizers have planned an amazing after party, even more exciting than last year&#8217;s dance-off that boasted an iPad as the grand prize. <a href="http://2014.miami.wordcamp.org/" target="_blank">WordCamp Miami 2014</a> is ramping up to be the best event the team has put on so far. </p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 24 Dec 2013 20:13:29 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:75:"WordPress.tv: Rob La Gatta: Managing Support for a Premium WordPress Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=24127";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:92:"http://wordpress.tv/2013/12/24/rob-la-gatta-managing-support-for-a-premium-wordpress-plugin/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:705:"<div id="v-EAYGoGFs-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/24127/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/24127/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=24127&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/24/rob-la-gatta-managing-support-for-a-premium-wordpress-plugin/"><img alt="Rob La Gatta: Managing Support for a Premium WordPress Plugin" src="http://videos.videopress.com/EAYGoGFs/video-c2fcdad95c_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 24 Dec 2013 13:12:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:56:"WordPress.tv: Media: We Are Here And Where Are We Going?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=24113";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:72:"http://wordpress.tv/2013/12/23/media-we-are-here-and-where-are-we-going/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:666:"<div id="v-F7oFtUCY-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/24113/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/24113/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=24113&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/23/media-we-are-here-and-where-are-we-going/"><img alt="Media: We Are Here And Where Are We Going?" src="http://videos.videopress.com/F7oFtUCY/video-4121a9b346_scruberthumbnail_0.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Dec 2013 16:33:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:41:"WordPress.tv: Sara Cannon: Be The Unicorn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=24093";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"http://wordpress.tv/2013/12/23/sara-cannon-be-the-unicorn/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:637:"<div id="v-IFtiBqnk-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/24093/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/24093/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=24093&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/23/sara-cannon-be-the-unicorn/"><img alt="Sara Cannon: Be The Unicorn" src="http://videos.videopress.com/IFtiBqnk/video-1c9ede7244_scruberthumbnail_1.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Dec 2013 16:20:25 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:60:"WPTavern: Edit Flow Plugin Fixes Numerous Bugs In New Update";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=13570";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:70:"http://wptavern.com/edit-flow-plugin-fixes-numerous-bugs-in-new-update";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3302:"<p>On December 19th, an update to <a title="http://wordpress.org/plugins/edit-flow/" href="http://wordpress.org/plugins/edit-flow/">Edit Flow</a>, a popular plugin used on multi-author blogs was released. Prior to December 19th, the most recent update was on January 30th, 2013. In <a title="http://wptavern.com/edit-flow-jetpack-and-mp6" href="http://wptavern.com/edit-flow-jetpack-and-mp6">previous articles</a>, I outlined a number of issues that nearly forced me to stop using the plugin. The latest version fixes those problems and adds a few new features.</p>\n<p>The <a title="http://wordpress.org/plugins/edit-flow/changelog/" href="http://wordpress.org/plugins/edit-flow/changelog/">changelog</a> for this release is a mile long but that&#8217;s a good thing. One of the most annoying bugs that has been addressed is that posts, pages, and custom post types can now be previewed correctly. This version also includes a new feature named <strong>Dashboard Notepad</strong>. The new dashboard widget provides an easy way to leave instructions or notes to other administrators or users of the site.</p>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/EditFlowDashboardNotes.jpg" rel="prettyphoto[13570]" rel="thumbnail"><img class="aligncenter size-full wp-image-13702" alt="Edit Flow Dashboard Notes" src="http://wptavern.com/wp-content/uploads/2013/12/EditFlowDashboardNotes.jpg" width="491" height="183" /></a></p>\n<p>For those that extensively use the editorial comments functionality within Edit Flow, you&#8217;ll be pleased to know that subscriptions are now saved via AJAX, which means you can add or remove subscribers without hitting &#8220;<strong>Save Post</strong>&#8220;. This release also contains updates to the Japanese and Dutch localizations. Some other notable changes include:</p>\n<ul>\n<li>You can now double-click to create a new post on the calendar or edit details associated with an existing post</li>\n<li>Subscribe to a post&#8217;s updates using a quick &#8220;Follow&#8221; link on Manage Posts, the Calendar, or Story Budget</li>\n<li>Assign a date and time to editorial metadata&#8217;s date field</li>\n<li>Modify which filters are used on the calendar and story budget, or add your own</li>\n<li>Scheduled publication time is now included in relevant email notifications</li>\n<li>Calendar and story budget module descriptions link to their respective pages in the admin for usability.</li>\n</ul>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/EditFlowIconTooDark.jpg" rel="prettyphoto[13570]" rel="thumbnail"><img class="alignright size-full wp-image-13700" alt="Edit Flow Icon Too Dark" src="http://wptavern.com/wp-content/uploads/2013/12/EditFlowIconTooDark.jpg" width="152" height="140" /></a>Since WPTavern became a multi-authored blog, Edit Flow has become an important plugin that helps manage the workflow and communication between authors. I’ve spoken to a number of people via email who love using Edit Flow. However, most of them stopped using it because of bugs and no sign of active development during 2013. One minor suggestion I have for a future update is to change the Edit Flow menu icon. It&#8217;s too hard to see when using a dark-colored admin color scheme.</p>\n<p>I hope this update is a sign of great things to come.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Dec 2013 15:00:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:6:"Jeffro";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:54:"WPTavern: 22 Beautiful Free WordPress Themes From 2013";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=13671";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"http://wptavern.com/22-beautiful-free-wordpress-themes-from-2013";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:14619:"<p>2013 was an excellent year for finding beautiful themes in the official <a href="http://wordpress.org/themes/" target="_blank">WordPress Themes Directory</a>. The Theme Review Team has been breaking all kinds of records lately, averaging more than 80 new themes approved per month, <a href="http://make.wordpress.org/themes/2013/11/21/new-wptrt-admin-justin-tadlock/" target="_blank">according to Chip Bennett</a>. With so many themes available, it can be difficult to sort through them all to find the best ones.</p>\n<p>We&#8217;ve hand-selected a few favorites from those that gained admission to the directory this year. These themes represent some of the most outstanding, well-designed themes created in 2013. Each theme has passed the Theme Review Team&#8217;s rigorous <a href="http://make.wordpress.org/themes/guidelines/" target="_blank">guidelines</a> for admission to the WordPress.org directory, so you know it&#8217;s safe to install and free from malicious code. Grab a cup of coffee and start bookmarking your favorites.<span id="more-13671"></span></p>\n<h2>Snaps</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/snaps.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/snaps.png" alt="Snaps WordPress theme" width="600" height="450" class="aligncenter size-full wp-image-13686" /></a></p>\n<p>Snaps is a popular portfolio theme created by the folks at <a href="http://graphpaperpress.com/themes/snaps/" target="_blank">Graph Paper Press</a>. The homepage and archives pages have a grid layout that is ideal for showcasing portrait images and galleries.</p>\n<p><a href="http://wordpress.org/themes/snaps" target="_blank">View Demo &#038; Download</a></p>\n<h2>Ryu</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/ryu.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/ryu.png" alt="ryu WordPress Theme" width="600" height="450" class="aligncenter size-full wp-image-13693" /></a></p>\n<p>Ryu is a minimalist blogging theme from Automattic that focuses on large, readable typography. The top panel has a hidden widget area and the background of image posts automatically changes to match the colors of the image.</p>\n<p><a href="http://wordpress.org/themes/ryu" target="_blank">View Demo &#038; Download</a></p>\n<h2>Hueman</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/hueman.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/hueman.png" alt="Hueman WordPress Theme" width="600" height="450" class="aligncenter size-full wp-image-13695" /></a></p>\n<p>Hueman is a magazine style theme that has quickly become a favorite on WordPress.org with more than 50,000 downloads already. On smaller devices the sidebars toggle for a great mobile viewing experience. This theme supports 10 post formats, has unlimited widget areas, social links and much more.</p>\n<p><a href="http://wordpress.org/themes/hueman" target="_blank">View Demo &#038; Download</a></p>\n<h2>WP Jurist</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/wpjurist.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/wpjurist.png" alt="WP Jurist WordPress Theme" width="600" height="450" class="aligncenter size-full wp-image-13696" /></a></p>\n<p>WP Jurist is a bold, responsive theme designed for law firms. The theme is bundled with a &#8220;People&#8221; plugin for displaying staff profiles.</p>\n<p><a href="http://wordpress.org/themes/wp-jurist" target="_blank">View Demo &#038; Download</a></p>\n<h2>Untitled</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/untitled.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/untitled.png" alt="untitled" width="600" height="450" class="aligncenter size-full wp-image-13705" /></a></p>\n<p>The Untitled theme was created by the Theme Team at Automattic and features a full-bleed homepage slider. It was designed to showcase photos and videos. Although Untitled looks best without widgets, the theme does support a right sidebar.</p>\n<p><a href="http://wordpress.org/themes/untitled" target="_blank">View Demo &#038; Download</a></p>\n<h2>Nictitate-free</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/Nictitate-free.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/Nictitate-free.png" alt="Nictitate-free" width="600" height="450" class="aligncenter size-full wp-image-13710" /></a></p>\n<p>Nictitate is a more corporate style WordPress theme. It includes a layout manager for creating custom layout options on each page.</p>\n<p><a href="http://wordpress.org/themes/nictitate-free" target="_blank">View Demo &#038; Download</a></p>\n<h2>Flounder</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/flounder.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/flounder.png" alt="Flounder WordPress theme" width="600" height="450" class="aligncenter size-full wp-image-13712" /></a></p>\n<p>Flounder is a flat style blogging theme with support for post formats, including color and icons for each. It&#8217;s based on the <a href="http://underscores.me/" target="_blank">Underscores</a> theme, which is used by the Theme Team at WordPress.com. </p>\n<p><a href="http://wordpress.org/themes/flounder" target="_blank">View Demo &#038; Download</a></p>\n<h2>Celebrate</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/celebrate.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/celebrate.png" alt="celebrate" width="600" height="450" class="aligncenter size-full wp-image-13714" /></a></p>\n<p>Celebrate is built on top of the Hybrid Core framework. It features a responsive masonry layout, support for post formats and a custom header and background.</p>\n<p><a href="http://wordpress.org/themes/celebrate" target="_blank">View Demo &#038; Download</a></p>\n<h2>Bearded</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/bearded.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/bearded.png" alt="bearded" width="600" height="450" class="aligncenter size-full wp-image-13716" /></a></p>\n<p>Bearded is a unique responsive theme that is well-suited to being used as a portfolio or an agency website. It supports the Custom Content Portfolio plugin to help you showcase your work.</p>\n<p><a href="http://wordpress.org/themes/bearded" target="_blank">View Demo &#038; Download</a></p>\n<h2>Serene</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/serene.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/serene.png" alt="serene" width="600" height="450" class="aligncenter size-full wp-image-13718" /></a></p>\n<p>Serene is a beautiful, minimalist blogging theme created by the folks at <a href="http://www.elegantthemes.com/" target="_blank">Elegant Themes</a>. The theme supports post formats and was designed to be easy on the eyes.</p>\n<p><a href="http://wordpress.org/themes/serene" target="_blank">View Demo &#038; Download</a></p>\n<h2>Gridster-Lite</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/gridster.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/gridster.png" alt="gridster" width="600" height="450" class="aligncenter size-full wp-image-13720" /></a></p>\n<p>Created by the folks at <a href="http://themefurnace.com/" target="_blank">Themefurnace</a>, Gridster-lite is a grid-based portfolio theme. The theme sports a left sidebar and is responsive so it looks great on all screen sizes.</p>\n<p><a href="http://wordpress.org/themes/gridster-lite" target="_blank">View Demo &#038; Download</a></p>\n<h2>Trvl</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/trvl.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/trvl.png" alt="trvl" width="600" height="450" class="aligncenter size-full wp-image-13722" /></a></p>\n<p>Trvl is a minimalist tumblelog theme with support for eight post formats. This theme was created by Automattic. It includes a custom header, menu and widgets above the footer.</p>\n<p><a href="http://wordpress.org/themes/trvl" target="_blank">View Demo &#038; Download</a></p>\n<h2>Inkness</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/inkness.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/inkness.png" alt="inkness" width="600" height="450" class="aligncenter size-full wp-image-13724" /></a></p>\n<p>Inkness is a responsive theme created by <a href="http://inkhive.com/product/inkness/" target="_blank">InkHive</a>. The theme features a three column homepage, multiple page layouts, configurable sidebar locations, footer widgets and more.</p>\n<p><a href="http://wordpress.org/themes/inkness" target="_blank">View Demo &#038; Download</a></p>\n<h2>Houston</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/houston.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/houston.png" alt="houston" width="600" height="450" class="aligncenter size-full wp-image-13726" /></a></p>\n<p>Houston is a child theme for the <a href="http://wordpress.org/themes/p2" target="_blank">P2</a> blogging / collaboration theme. The layout responds nicely to devices and adds a new widget area under the posting box.</p>\n<p><a href="http://wordpress.org/themes/houston" target="_blank">View Demo &#038; Download</a></p>\n<h2>Writr</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/writr.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/writr.png" alt="writr" width="600" height="450" class="aligncenter size-full wp-image-13728" /></a></p>\n<p>Writr is a beautiful blogging theme from Automattic. This tumblelog theme includes six different color schemes and support for all post formats.</p>\n<p><a href="http://wordpress.org/themes/writr" target="_blank">View Demo &#038; Download</a></p>\n<h2>Sublime Press</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/sublime.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/sublime.png" alt="sublime" width="600" height="450" class="aligncenter size-full wp-image-13730" /></a></p>\n<p>Sublime is an ultra-minimalist responsive blogging theme designed for writers. This theme has a content-oriented, centered layout and it does not include any widget areas.</p>\n<p><a href="http://wordpress.org/themes/sublime-press" target="_blank">View Demo &#038; Download</a></p>\n<h2>Mixfolio</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/mixfolio.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/mixfolio.png" alt="mixfolio" width="600" height="450" class="aligncenter size-full wp-image-13732" /></a></p>\n<p>Mixfolio is a grid-style portfolio theme developed by Graph Paper Press. The theme is responsive, supports post formats and includes an options panel for customizing details.</p>\n<p><a href="http://wordpress.org/themes/mixfolio" target="_blank">View Demo &#038; Download</a></p>\n<h2>Stargazer</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/stargazer.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/stargazer.png" alt="stargazer" width="600" height="450" class="aligncenter size-full wp-image-13735" /></a></p>\n<p>Stargazer is a parent theme built on the Hybrid Core theme framework created by <a href="http://themehybrid.com/themes/stargazer" target="_blank">Justin Tadlock</a>. It&#8217;s fully responsive, includes a custom background, custom header and more features for customizing the design.</p>\n<p><a href="http://wordpress.org/themes/stargazer" target="_blank">View Demo &#038; Download</a></p>\n<h2>Asteria Lite</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/asteria.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/asteria.png" alt="asteria" width="600" height="450" class="aligncenter size-full wp-image-13739" /></a></p>\n<p>Asteria Lite is a responsive theme with an eye catching slider and a narrow/wide optional layout. It includes support for custom fonts, a maintenance mode feature, three page templates, social icons and more.</p>\n<p><a href="http://wordpress.org/themes/asteria-lite" target="_blank">View Demo &#038; Download</a></p>\n<h2>Superhero</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/superhero.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/superhero.png" alt="superhero" width="600" height="450" class="aligncenter size-full wp-image-13742" /></a></p>\n<p>Superhero is another theme from Automattic. It features a sticky/fixed top menu, full-bleed featured Content area and images and subtle CSS3 transitions.</p>\n<p><a href="http://wordpress.org/themes/superhero" target="_blank">View Demo &#038; Download</a></p>\n<h2>Adamos</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/adamos.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/adamos.png" alt="adamos" width="600" height="450" class="aligncenter size-full wp-image-13748" /></a></p>\n<p>Adamos is a responsive theme that features a full-width slider. It includes an easy way to add your logo, custom header, featured areas and more.</p>\n<p><a href="http://wordpress.org/themes/adamos" target="_blank">View Demo &#038; Download</a></p>\n<h2>Twenty Fourteen</h2>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/twentyfourteen.png" rel="prettyphoto[13671]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/twentyfourteen.png" alt="twentyfourteen" width="880" height="660" class="aligncenter size-full wp-image-13752" /></a></p>\n<p>Twenty Fourteen is the latest default theme for WordPress. This theme features a magazine style layout with featured content areas arranged in a grid or a slider. Customize the theme with three different widget areas, a full-width page template and a nicely designed contributor page.</p>\n<p><a href="http://wordpress.org/themes/twentyfourteen" target="_blank">View Demo &#038; Download</a></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Dec 2013 13:03:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:69:"WPTavern: Create Custom Admin Color Schemes Directly Within WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=13646";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:79:"http://wptavern.com/create-custom-admin-color-schemes-directly-within-wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2480:"<p>The new WordPress admin design released in 3.8 was created in such a way that it&#8217;s easy for developers to extend the feature and write their own color schemes. But for your average user who doesn&#8217;t know how to work with Sass, creating color schemes is probably not going to happen. Fortunately, someone has created a plugin that makes custom admin color schemes available to everyone.</p>\n<p><a href="http://wordpress.org/plugins/hs-custom-admin-themes/" target="_blank">HS Custom Admin Theme</a> is a new free plugin that lets you create your own admin color schemes in its settings panel via a user-friendly color picker. Up until now, the only way to get alternative color schemes was to <a href="http://wptavern.com/get-more-admin-color-schemes-for-wordpress-3-8" target="_blank">use a plugin</a> or go through the process of <a href="http://mattcromwell.com/create-custom-wordpress-admin-color-scheme/" target="_blank">rolling your own</a>.</p>\n<p>The HS Custom Admin Theme plugin makes it easy to design your own color palettes for the WordPress admin area, without knowing any CSS. Here&#8217;s an example of a custom color scheme I created on a test site:</p>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/customcolors.png" rel="prettyphoto[13646]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/customcolors.png" alt="customcolors" width="900" height="654" class="aligncenter size-full wp-image-13649" /></a></p>\n<p>The plugin records all of the color schemes you create and test so that you can always return to one made previously. You can essentially create a library of your favorite color palettes and change the admin according to your mood. </p>\n<h3>A few suggestions</h3>\n<p>There are a few things I would change about how this plugin works. The most important one is the non-native placement of its settings panel. I would prefer the plugin placed its settings under the &#8220;Edit My Profile&#8221; screen where users are already trained to look for admin color schemes. It would also be really cool if each color selection updated live while editing. Other than that, the plugin works well for allowing users to make their own color selections and store them as a custom theme.</p>\n<p><a href="http://wordpress.org/plugins/hs-custom-admin-themes/" target="_blank">HS Custom Admin Theme</a> is the first plugin of its kind, but I anticipate there will be many more like it hitting the repository soon. </p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Dec 2013 11:03:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:30;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:97:"WordPress.tv: Kurt Hansen: Are You Nuts? You Want People to Pay You to Create WordPress Websites?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=23004";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:112:"http://wordpress.tv/2013/12/22/kurt-hansen-are-you-nuts-you-want-people-to-pay-you-to-create-wordpress-websites/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:747:"<div id="v-z1tXyrxw-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/23004/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/23004/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=23004&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/22/kurt-hansen-are-you-nuts-you-want-people-to-pay-you-to-create-wordpress-websites/"><img alt="Kurt Hansen: Are You Nuts? You Want People to Pay You to Create WordPress Websites?" src="http://videos.videopress.com/z1tXyrxw/video-3bdb195f6b_scruberthumbnail_1.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 22 Dec 2013 16:11:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:31;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:87:"WordPress.tv: D’nelle Dowis: Intermediate Intro To WordPress: Images, Widgets, Themes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=24558";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:98:"http://wordpress.tv/2013/12/22/dnelle-dowis-intermediate-intro-to-wordpress-images-widgets-themes/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:717:"<div id="v-6tqXpSEq-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/24558/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/24558/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=24558&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/22/dnelle-dowis-intermediate-intro-to-wordpress-images-widgets-themes/"><img alt="D’nelle Dowis: Intermediate Intro To WordPress: Images, Widgets, Themes" src="http://videos.videopress.com/6tqXpSEq/video-a408eb6cbb_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 22 Dec 2013 16:09:25 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:32;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:40:"Alex King: Spam Comment Generator Script";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://alexking.org/?p=18969";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:65:"http://alexking.org/blog/2013/12/22/spam-comment-generator-script";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:360:"<p>Someone recently posted the entire contents of their SPAM comment generator script into my comments; I assume by mistake. It&#8217;s pretty interesting to look at. It appears that each line is a different comment with replacement clauses that would be randomly selected.</p>\n<p><p>View the code on <a href="https://gist.github.com/8084666">Gist</a>.</p></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 22 Dec 2013 16:09:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Alex";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:33;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:74:"Alex King: CF Colors v 2.1, Post Formats Admin UI v1.3.1, and Social v2.10";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://alexking.org/?p=18966";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:82:"http://alexking.org/blog/2013/12/21/cf-colors-post-formats-admin-ui-social-updated";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:852:"<p>We&#8217;ve updated our <a href="http://crowdfavorite.com/blog/2013/12/cf-colors-v2-1/">CF Colors</a> and <a href="http://crowdfavorite.com/blog/2013/12/post-formats-admin-ui-v1-3-1/">Post Formats Admin UI</a> WordPress developer libraries to be compatible with the admin UI refresh in WordPress 3.8.</p>\n<p>We&#8217;ve also update the <a href="http://wordpress.org/plugins/social/">Social plugin</a> to address a change in the comment walker class in WordPress 3.8 (comments are shown as threaded again) as well as updates for the admin UI refresh.</p>\n<p>Enjoy!</p>\n<p class="threads-post-notice">This post is part of the following projects: <a href="http://alexking.org/project/post-formats-admin-ui">Post Formats Admin UI</a>, <a href="http://alexking.org/project/social">Social</a>. View the project timelines for more context on this post.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 21 Dec 2013 23:51:29 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Alex";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:34;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:49:"WordPress.tv: Advanced WordPress San Diego Meetup";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=22836";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"http://wordpress.tv/2013/12/21/advanced-wordpress-san-diego-meetup/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:648:"<div id="v-jgZTG6Pt-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/22836/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/22836/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=22836&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/21/advanced-wordpress-san-diego-meetup/"><img alt="Advanced WordPress San Diego Meetup" src="http://videos.videopress.com/jgZTG6Pt/video-e1994aeca0_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 21 Dec 2013 23:02:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:35;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:100:"WordPress.tv: Jimba Tamang: 5 Reasons Why “Parallax Websites” Are Awesome And How To Create Them";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=26856";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:111:"http://wordpress.tv/2013/12/21/jimba-tamang-5-reasons-why-parallax-websites-are-awesome-and-how-to-create-them/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:775:"<div id="v-RHgeiQpm-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/26856/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/26856/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=26856&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/21/jimba-tamang-5-reasons-why-parallax-websites-are-awesome-and-how-to-create-them/"><img alt="Jimba Tamang: 5 reJimba Tamang: 5 Reasons Why &#8220;Parallax Websites&#8221; Are Awesome And How To Create Them" src="http://videos.videopress.com/RHgeiQpm/video-06112df7ae_scruberthumbnail_1.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 21 Dec 2013 14:16:25 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:36;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:68:"WPTavern: WPWeekly Episode 132 – Not The Kris Kringle Of WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:44:"http://wptavern.com?p=13639&preview_id=13639";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:74:"http://wptavern.com/wpweekly-episode-132-not-the-kris-kringle-of-wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2307:"<p><a href="http://www.wptavern.com/wp-content/uploads/2013/08/WordPressWeekly_albumart2.jpg" rel="prettyphoto[13639]" rel="thumbnail"><img src="http://www.wptavern.com/wp-content/uploads/2013/08/WordPressWeekly_albumart2-150x150.jpg" alt="WordPress Weekly Cover Art" width="150" height="150" class="alignright size-thumbnail wp-image-8715" /></a> In this information packed episode of WordPress Weekly, we were joined by <a href="http://chrislema.com/" title="http://chrislema.com/">Chris Lema</a>. We discussed a number of topics on the show including the headlines of the week, WordPress in the enterprise, contributing to WordPress, approachable WordPress, and last but not least, whether Chris was actually the Kris Kringle of WordPress. We had a blast interviewing Chris Lema and I think there are more than a few nuggets of wisdom to take away from this episode. </p>\n<h2>Stories Discussed:</h2>\n<p><a href="http://wptavern.com/wptavern-gets-responsive-with-new-design" title="http://wptavern.com/wptavern-gets-responsive-with-new-design">WPTavern Gets Redesigned</a><br />\n<a href="http://wptavern.com/buddypress-1-9-sammy-released-with-new-notifications-component" title="http://wptavern.com/buddypress-1-9-sammy-released-with-new-notifications-component">BuddyPress 1.9 Released</a><br />\n<a href="http://wptavern.com/jetpack-is-now-available-on-github" title="http://wptavern.com/jetpack-is-now-available-on-github">Jetpack Now On Github</a><br />\n<a href="http://wptavern.com/10-great-gift-ideas-for-wordpress-geeks" title="http://wptavern.com/10-great-gift-ideas-for-wordpress-geeks">10 Great Gift Ideas for WordPress Geeks</a></p>\n<h2>WPWeekly Meta:</h2>\n<p><strong>Next Episode:</strong> Friday, January 3rd 3 P.M. Eastern</p>\n<p><strong>Subscribe To WPWeekly Via Itunes: </strong><a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via RSS: </strong><a href="http://www.wptavern.com/feed/podcast" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via Stitcher Radio: </strong><a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr" target="_blank">Click here to subscribe</a></p>\n<p><strong>Listen To Episode #132:</strong><br />\n</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 21 Dec 2013 08:37:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:6:"Jeffro";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:37;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:49:"WPTavern: Planning For Upcoming WordCamps in 2014";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=13622";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wptavern.com/planning-for-upcoming-wordcamps-in-2014";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2947:"<div id="attachment_13628" class="wp-caption aligncenter"><a href="http://wptavern.com/wp-content/uploads/2013/12/wcsf.jpg" rel="prettyphoto[13622]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/wcsf.jpg" alt="WordCamp San Francisco" width="1300" height="479" class="size-full wp-image-13628" /></a><p class="wp-caption-text">photo credit: <a href="https://ma.tt/2013/07/wordcamp-san-francisco-2013/wordcamp-san-francisco-crowd/">matt mullenweg</a></p></div>\n<p>We&#8217;re entering the time of year when everyone opens their calendars and starts planning for the new year. The dates for WordCamp San Francisco 2014 were just announced this week to be set for October 25-26. The dates and times for pre and post-WordCamp events have not yet been decided, so the organizers urge you to hold off booking non-refundable travel until the full schedule is announced. Follow  <a href="http://twitter.com/wordcampsf" target="_blank">@wordcampsf</a> on Twitter for all the latest updates on the event.</p>\n<h3>The List of Upcoming WordCamps is Growing</h3>\n<p>In addition to WordCamp San Francisco, Andrea Middleton <a href="http://make.wordpress.org/community/2013/12/19/wordcamps-update-december-19-2013/" target="_blank">posted</a> on the make.wordpress.org Community blog that dates have been published for seven upcoming WordCamps, including Dayton, Asheville, Miami, Atlanta, Norway, Prague, and St. Louis.  These dates for <a href="http://central.wordcamp.org/" target="_blank">upcoming events</a> can be found on the <a href="http://central.wordcamp.org/" target="_blank">WordCamp Central</a> site, along with links to the websites for each event. Middleton also noted that five WordCamps have now been added to the pre-planning list: Connecticut, Nashville, Hamburg, Netherlands, and Slovakia. Hopefully that information will help you to plan your travels, especially if you intend to go to multiple events in 2014.</p>\n<p>If you can&#8217;t see yourself getting out to a WordCamp this next year, the next best thing is to <a href="http://wptavern.com/monitor-wordcamps-online-with-wp-armchair" target="_blank">monitor the camps online with WP Armchair</a> or catch up on presentations via <a href="http://wordpress.tv/" target="_blank">WordPress.tv</a>. 151 WordCamp presentation videos have recently been published to the site, which is quickly becoming a massive library of WordPress-related videos. </p>\n<h3>Buy Tickets Early</h3>\n<p>If you&#8217;re a WordPress fan who has never been to a WordCamp, here&#8217;s a bit of advice: Buy tickets to the event as soon as you commit to go. During 2013 many WordCamps sold out far in advance of the event. If you&#8217;re intent on attending a certain event, grab those tickets and plan your travel early. Expect to get addicted. Connecting with other WordPress fans is an exciting experience that never gets old. </p>\n<p>Which WordCamps will you be attending in 2014?</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 21 Dec 2013 00:38:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:38;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:75:"WordPress.tv: Paul Tela: Keeping WordPress Under [Version] Control With Git";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=27525";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:90:"http://wordpress.tv/2013/12/20/paul-tela-keeping-wordpress-under-version-control-with-git/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:703:"<div id="v-UD5M2W6b-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/27525/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/27525/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=27525&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/20/paul-tela-keeping-wordpress-under-version-control-with-git/"><img alt="Paul Tela: Keeping WordPress Under [Version] Control With Git" src="http://videos.videopress.com/UD5M2W6b/video-ff607b3c88_scruberthumbnail_1.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 20 Dec 2013 23:51:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:39;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:58:"WPTavern: An Alternative Admin Interface for WordPress 3.8";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=13572";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"http://wptavern.com/an-alternative-admin-interface-for-wordpress-3-8";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4821:"<p>By and large, most WordPress users are in love with the new admin interface. However, there are some who have been resistant to the changes in the design, as evidenced by the creation of the <a href="http://wordpress.org/plugins/wp-admin-classic/" target="_blank">wp-admin classic</a>, a plugin that actually goes so far as to conjure up the old, unresponsive admin from the dead. While I find this kind of resistance perplexing, given the overwhelmingly positive reaction to WordPress 3.8&#8242;s new design, it&#8217;s interesting to examine where opponents are coming from. </p>\n<h3>Go ahead and paint the walls</h3>\n<div id="attachment_13592" class="wp-caption aligncenter"><a href="http://wptavern.com/wp-content/uploads/2013/12/paint.jpg" rel="prettyphoto[13572]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/paint.jpg" alt="photo credit: spo0nman - cc" width="1024" height="406" class="size-full wp-image-13592" /></a><p class="wp-caption-text">photo credit: <a href="http://www.flickr.com/photos/pankaj/2774373164/">spo0nman</a> &#8211; <a href="http://creativecommons.org/licenses/by-nc-nd/2.0/">cc</a></p></div>\n<p>The fact that you can do anything you want to customize the frontend and the backend is why so many people enjoy WordPress in the first place. So if you want to make a plugin that removes the new admin design or changes it in some way to suit your needs, by all means, go for it! Add <a href="http://wptavern.com/get-more-admin-color-schemes-for-wordpress-3-8" target="_blank">more color schemes</a> to WordPress 3.8, <a href="http://wordpress.org/plugins/grey-admin-color-schemes/" target="_blank">make the admin 50 shades of grey</a>, or <a href="http://wordpress.org/plugins/wp-admin-classic/" target="_blank">nuke it</a> entirely and go back to the old admin design. If a different style of backend inspires you to publish great content, do whatever it takes. </p>\n<h3>Avenue Factory&#8217;s Alternative Admin Interface</h3>\n<p>WordPress designer and developer <a href="http://www.avenuefactory.com/" target="_blank">Haseeb Qureshi</a> created a plugin  called <a href="http://wordpress.org/plugins/admin-interface-by-avenue-factory/" target="_blank">Admin Interface by Avenue Factory</a> that he claims <strong>&#8220;restores visual balance and tactility to WordPress 3.8.&#8221;</strong> Although he sees the admin design as a giant leap forward, Quereshi says, &#8220;It appears to be chaotic and with no balance, right out of the box.&#8221;</p>\n<p>His plugin loads a <a href="http://plugins.svn.wordpress.org/admin-interface-by-avenue-factory/trunk/av-assets/av-admin-interface.css" target="_blank">CSS file</a> to override some of the styles in the new WordPress admin. Qureshi&#8217;s changes address his main concern: &#8220;Looking at WordPress 3.8 now, it just seems that the sidebar, widefat table elements, and the general type size are fighting for attention.&#8221; </p>\n<p>Can you spot the differences in the screenshot below? The plugin adds a more tactile view to the sidebar and makes some subtle changes in typography and spacing. </p>\n<div id="attachment_13579" class="wp-caption aligncenter"><a href="http://wptavern.com/wp-content/uploads/2013/12/admin-interface-avenue-factory.png" rel="prettyphoto[13572]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/admin-interface-avenue-factory.png" alt="Admin Interface by Avenue Factory" width="491" height="575" class="size-full wp-image-13579" /></a><p class="wp-caption-text">Admin Interface by Avenue Factory</p></div>\n<p>His plugin also makes some broad stroke changes to the <em>.widefat</em> class, as you can see on the posts screen:</p>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/posts-screen.png" rel="prettyphoto[13572]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/posts-screen.png" alt="posts-screen" width="770" height="540" class="aligncenter size-full wp-image-13596" /></a></p>\n<p>If you&#8217;ve had similar thoughts about the new admin design, the <a href="http://wordpress.org/plugins/admin-interface-by-avenue-factory/" target="_blank">Admin Interface by Avenue Factory</a> might be an option to explore for housing some of your own custom tweaks. </p>\n<p>Even if you don&#8217;t think that the WordPress admin needs a more tactile appearance, it&#8217;s cool to see the freedom designers and developers have to make changes with just a simple CSS file. Since millions of people are using WordPress, it&#8217;s likely that more alternatives to the admin design will pop up. Personally, I prefer the default interface as it currently ships with 3.8, but not everyone perceives colors, space and balance in the same way. We&#8217;re lucky that with WordPress you&#8217;re never locked into the default.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 20 Dec 2013 22:10:40 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:40;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:67:"WordPress.tv: Connie Oswald Stofko: How To Get Ideas For Blog Posts";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=25309";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:84:"http://wordpress.tv/2013/12/20/connie-oswald-stofko-how-to-get-ideas-for-blog-posts/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:683:"<div id="v-2jCPUXXK-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/25309/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/25309/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=25309&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/20/connie-oswald-stofko-how-to-get-ideas-for-blog-posts/"><img alt="Connie Oswald Stofko: How To Get Ideas For Blog Posts" src="http://videos.videopress.com/2jCPUXXK/video-31666eb4e2_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 20 Dec 2013 20:00:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:41;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:73:"WPTavern: How to Use Ghostery to Find Trackers Added by WordPress Plugins";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://www.wptavern.com/?p=13386";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:83:"http://wptavern.com/how-to-use-ghostery-to-find-trackers-added-by-wordpress-plugins";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5791:"<div id="attachment_13548" class="wp-caption aligncenter"><a href="http://wptavern.com/wp-content/uploads/2013/12/nazgul.jpg" rel="prettyphoto[13386]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/nazgul.jpg" alt="photo credit: CosContopia" width="1024" height="507" class="size-full wp-image-13548" /></a><p class="wp-caption-text">photo credit: <a href="http://coscontopia.com/?attachment_id=6274" target="_blank">CosContopia</a></p></div>\n<p>A few days ago, Jeff wrote a <a href="http://wptavern.com/wordpress-plugin-authors-be-up-front-and-honest-with-users-about-tracking" target="_blank">post</a> encouraging WordPress plugin developers to be more transparent about trackers they apply to your website via their extensions. He referenced Pooria Asteraky&#8217;s <a href="http://pooriast.wordpress.com/2013/12/15/trackers-wordpress-plugin/" target="_blank">discovery</a> that a social sharing plugin had applied 13 trackers on a vanilla installation. This is no surprise, really, as a site owner installs social sharing plugins with the express purpose of sending information out from the website via Javascript or some other means.</p>\n<p>Otto left a <a href="http://pooriast.wordpress.com/2013/12/15/trackers-wordpress-plugin/comment-page-1/#comment-1384" target="_blank">comment</a> on the original post, clarifying which trackers might indeed be harmful or unwanted. He said, <span class="pullquote alignleft">&#8220;Our primary concern in this regard would be plugins that do things without the consent or without the knowledge of the website owner.&#8221;</span> This is an important distinction to make, as many trackers perform a welcome and valuable service, such as Jetpack stats, Gravatar or Google Analytics. The trackers you want to hunt down are those that collect information about users or activities on the site without consent.<span id="more-13386"></span></p>\n<h3>Let&#8217;s hunt trackers!</h3>\n<p>Since plugin authors may not always be transparent about what kinds of trackers their plugins install, especially if they&#8217;re not hosted on WordPress.org, site owners need some way to sniff these out. That&#8217;s where a free tool like <a href="http://www.ghostery.com/" target="_blank">Ghostery</a> comes in handy for finding out what services might be communicating to and from a website. It operates as a browser extension and there are versions available for Firefox, Opera, Safari, IE, iOS and Firefox for Android.</p>\n<p>Here&#8217;s an example of what it looks like when I installed it to Chrome, which was painless and instant.</p>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/ghostery-chrome.png" rel="prettyphoto[13386]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/ghostery-chrome.png" alt="ghostery-chrome" width="453" height="202" class="aligncenter size-full wp-image-13499" /></a></p>\n<p>Once installed, the extension looks for third-party page elements (or &#8220;trackers&#8221;) on the web pages you visit and displays them in the corner of your browser. It verifies these trackers against Ghostery&#8217;s extensive library of more than  1,700 trackers and 3,400 tracking patterns, including beacons, advertisements, analytics services, page widgets, and other third-party page elements.</p>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/ghostery-in-action.png" rel="prettyphoto[13386]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/ghostery-in-action.png" alt="ghostery-in-action" width="594" height="193" class="aligncenter size-full wp-image-13501" /></a></p>\n<h3>Get the Details Behind the Trackers</h3>\n<p>If you suspect that a plugin might be &#8220;phoning home&#8221; from your website, inserting ads or invisible pixels for tracking, Ghostery gives you a quick way to track down the tracker and find out who is behind it. It&#8217;s not just for use on your own website &#8211; you can check out other sites as well. Here&#8217;s a quick example run on a WordPress.org plugin page:</p>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/trackers1.jpg" rel="prettyphoto[13386]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/trackers1.jpg" alt="trackers" width="682" height="499" class="aligncenter size-full wp-image-13557" /></a></p>\n<p>You can click on each individual tracker to see the URL and find out more information. For the most part, you&#8217;ll see a harmless list like the one above. The Ghostery tool comes in handy if you feel that you may have been hacked or have noticed some suspicious activity on your site. The information Ghostery provides will help you to investigate your plugins and/or themes to find the culprit. It&#8217;s also useful for inspecting other sites for a small window into their third-party connections.</p>\n<h3>Block Unwanted Trackers</h3>\n<p>Ghostery also lets visitors block trackers based on the type of function they perform or on an individual basis. This is particularly useful if you want to block trackers that violate your privacy by collecting your behavioral data.</p>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/block.png" rel="prettyphoto[13386]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/block.png" alt="block" width="787" height="434" class="aligncenter size-full wp-image-13505" /></a></p>\n<p>The ultimate goal here is to use <a href="http://www.ghostery.com/" target="_blank">Ghostery</a> to find more information about invisible trackers and control your privacy online. Though it has a broad use outside of WordPress, Ghostery provides a first line of defense for finding plugins that &#8220;phone home&#8221; and using that knowledge to disable them and report on their activities.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 19 Dec 2013 21:26:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:42;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:72:"WPTavern: Edit Posts From Within The Preview Screen With Post Customizer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=13533";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:82:"http://wptavern.com/edit-posts-from-within-the-preview-screen-with-post-customizer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6803:"<p>There are all sorts of frontend editors being created for WordPress. We&#8217;ve already covered <a title="http://wptavern.com/barley-for-wordpress-a-revolutionary-inline-content-editor" href="http://wptavern.com/barley-for-wordpress-a-revolutionary-inline-content-editor">Barley</a>, <a title="http://wptavern.com/an-interesting-concept-for-front-end-editing-inline-access" href="http://wptavern.com/an-interesting-concept-for-front-end-editing-inline-access">Inline Access</a>, and <a title="http://wptavern.com/prettypress-plugin-reinvents-wordpress-post-editing-with-live-preview" href="http://wptavern.com/prettypress-plugin-reinvents-wordpress-post-editing-with-live-preview">PrettyPress</a>. Each plugin takes a different approach to solving the problem.</p>\n<p><a title="http://wordpress.org/plugins/post-customizer/" href="http://wordpress.org/plugins/post-customizer/">Post Customizer</a>, developed by <a title="http://profiles.wordpress.org/10up/" href="http://profiles.wordpress.org/10up/">10up</a> continues the trend of taking a different approach to solving the problem of live editing. Post Customizer works in a similar fashion to the theme customizer. When a user previews a page or a post, an interface is loaded that looks just like the theme customizer. From this interface, you can edit the post excerpt, post thumbnail, save changes to the post or close the interface without saving. Selecting text within the post displays a simple editor that makes it easy to style words, apply unordered lists etc.</p>\n<div id="attachment_13538" class="wp-caption aligncenter"><a href="http://wptavern.com/wp-content/uploads/2013/12/PostCustomizer.jpg" rel="prettyphoto[13533]" rel="thumbnail"><img class="size-large wp-image-13538" alt="Customizing a post" src="http://wptavern.com/wp-content/uploads/2013/12/PostCustomizer-500x166.jpg" width="500" height="166" /></a><p class="wp-caption-text">Simple editor to edit posts</p></div>\n<h3>Idea Turned Into Reality</h3>\n<p>I got in touch with John James Jacoby, one of several developers for the plugin (along with Carl Danley, John Bloch, Taylor Lovett, and Drew Jaynes). I found out why the plugin was created, the decision to use the customizer interface and whether or not this is just a prototype or something they want people to use on a routine basis.</p>\n<p><strong>Tavern</strong> &#8211; <em>Is this plugin a prototype of an idea to edit posts or does 10up plan on improving the plugin? Does 10up want people to use it?</em></p>\n<p><strong>JJJ</strong> &#8211; Both! It was an idea I&#8217;ve had in my head for a while, and we threw it together at our company meetup and then it sat mostly unloved for a few months. We spent a few hours getting it to a workable state, and open sourced it for improvements and feedback. We actually built the majority of it over the course of two evenings, just hacking together and rapidly prototyping.</p>\n<p><strong>Tavern</strong> &#8211; <em>When it comes to the post customizer, does it not make sense to be able to have the category and tags be editable from within the customizer? At that point, you&#8217;re sort of substituting the post writing screen although you don&#8217;t see the customizing interface until after you hit preview.</em></p>\n<p><strong>JJJ</strong> &#8211; Sure. Pretty much any metabox is game for inclusion. We specifically wanted to provide an interface for editing post content after the original post was written. We’d like to work <strong>Revisions</strong> into the sidebar, so authors can scroll through updates live.</p>\n<h3>Nice Idea But Needs A Lot Of Elbow Grease</h3>\n<p>While the idea is great, the implementation and experience needs to be improved before users can feel comfortable with using this plugin. Here are some things I noticed.</p>\n<p><strong>Update Or Save</strong> &#8211; The theme customizer that the interface is based on does not feel natural when editing posts. When editing themes, I realize an update will save the changes I made to the theme. For posts however, I&#8217;m used to clicking a save button. While the update button does the same thing, it just doesn&#8217;t seem right.</p>\n<p><strong>Exiting The Interface</strong> &#8211; I&#8217;m used to closing interfaces with an X on the top right portion of the screen. Despite the post customizer using a familiar layout, I keep looking to the right of the screen for a way to close the editing panel. It&#8217;s as simple as clicking the close button but I&#8217;m always looking somewhere else to get out of the editing interface.</p>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/PostCustomizerExiting.jpg" rel="prettyphoto[13533]" rel="thumbnail"><img class="aligncenter size-large wp-image-13542" alt="Exiting The Post Customizer" src="http://wptavern.com/wp-content/uploads/2013/12/PostCustomizerExiting-500x189.jpg" width="500" height="189" /></a></p>\n<p>It&#8217;s also weird that upon closing the editing panel, I&#8217;m taken back to the WordPress editing screen that&#8217;s missing the right sidebar. It&#8217;s here that I have to click an X to completely close the editing interface. Clicking close and then the X feels redundant. I&#8217;d rather see the close button take the role of doing both tasks and returning me to the normal editing panel without any additional steps.</p>\n<p><strong>Editor Toolbar Sticks To The Top Of The Post</strong> &#8211; When the editing toolbar is enabled, it sticks to the top of the page. While I could use keyboard shortcuts, I&#8217;d rather see the editor appear above the text I&#8217;m highlighting so I don&#8217;t have to scroll or move my mouse so much. When the edited text is not highlighted, the toolbar should disappear.</p>\n<p><strong>Excerpts Reload The Entire Page</strong> &#8211; The first time you try to edit the excerpt in the sidebar, it reloads the entire page along with the interface. I found this to be a jarring experience and would like to see the excerpt loaded without having to reload the entire page.</p>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/PostCustomizerExcerpts.jpg" rel="prettyphoto[13533]" rel="thumbnail"><img class="aligncenter size-full wp-image-13541" alt="PostCustomizer Excerpts" src="http://wptavern.com/wp-content/uploads/2013/12/PostCustomizerExcerpts.jpg" width="297" height="305" /></a></p>\n<h3>Interesting Take On The Post Editing Idea</h3>\n<p>I never would have thought that the theme customizer interface could be used to edit posts. Post Customizer proves the idea has merit. It will be interesting to see how this plugin evolves over time. If you&#8217;re interested in contributing back to the plugin, you can <a title="https://github.com/10up/Post-Customizer" href="https://github.com/10up/Post-Customizer">fork it on Github</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 19 Dec 2013 19:44:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:6:"Jeffro";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:43;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:49:"WordPress.tv: Charlie Craine: SEO Beyond Beginner";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=25317";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:66:"http://wordpress.tv/2013/12/19/charlie-craine-seo-beyond-beginner/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:653:"<div id="v-y0tC0AZk-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/25317/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/25317/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=25317&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/19/charlie-craine-seo-beyond-beginner/"><img alt="Charlie Craine: SEO Beyond Beginner" src="http://videos.videopress.com/y0tC0AZk/video-83e037952d_scruberthumbnail_2.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 19 Dec 2013 19:41:21 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:44;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:97:"WordPress.tv: Jordan Quintal: WordPress Accessibility – Building Websites That Everyone Can Use";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=26850";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:110:"http://wordpress.tv/2013/12/19/jordan-quintal-wordpress-accessibility-building-websites-that-everyone-can-use/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:739:"<div id="v-asU7f4NH-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/26850/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/26850/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=26850&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/19/jordan-quintal-wordpress-accessibility-building-websites-that-everyone-can-use/"><img alt="Jordan Quintal: WordPress Accessibility – Building Websites That Everyone Can Use" src="http://videos.videopress.com/asU7f4NH/video-499c5b9464_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 19 Dec 2013 16:40:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:45;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:72:"WPTavern: Romangie: A Free Responsive WordPress Theme Based on Bootstrap";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://www.wptavern.com/?p=13312";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:89:"http://wptavern.com/romangie-a-free-responsive-wordpress-theme-based-on-twitter-bootstrap";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3021:"<p>WordPress themes that integrate well-known front-end frameworks, such as <a href="http://getbootstrap.com/" target="_blank">Twitter Bootstrap</a> and <a href="http://wptavern.com/10-free-wordpress-themes-based-on-the-foundation-framework" target="_blank">Foundation</a>, offer a full range of UI tools to help users quickly customize their websites. Not having to style a ton of UI components can be quite liberating when creating a new site, especially when you combine that with the publishing power of WordPress.</p>\n<p><a href="http://wordpress.org/themes/romangie" target="_blank">Romangie</a> is a new theme in the WordPress Theme Directory and is one of only a handful to support the latest <a href="http://wptavern.com/ http://blog.getbootstrap.com/2013/08/19/bootstrap-3-released/" target="_blank">Bootstrap 3</a> release. The theme is fully responsive and, although it is based on Bootstrap, it&#8217;s not heavy-handed with the styling, nor does it look like your typical Bootstrap site.</p>\n<p><a href="http://wptavern.com/wp-content/uploads/2013/12/romangie.png" rel="prettyphoto[13312]" rel="thumbnail"><img src="http://wptavern.com/wp-content/uploads/2013/12/romangie.png" alt="romangie" width="905" height="884" class="aligncenter size-full wp-image-13516" /></a></p>\n<p>Romangie was created to have a simple design with a focus on content and performance. The theme supports all the WordPress post formats out of the box and includes styles for videos, music, chat, logs, quotes, galleries,  etc.<span id="more-13312"></span></p>\n<p>In addition to its responsive design, Romangie is also retina ready, which means it will look great on small devices and larger formats, all the way up to 27&#8243; Full HD displays. The theme uses scalable fonts as icons, instead of jpg images, so it won&#8217;t go blurry on high definition displays. </p>\n<h4>Romangie features at a glance:</h4>\n<ul>\n<li>Built with Bootstrap 3 at its base</li>\n<li>Retina ready</li>\n<li>Includes full width page template</li>\n<li>Fully styled post formats</li>\n<li>Sidebar and multiple footer widget areas</li>\n</ul>\n<p>View a <a href="http://themes.tobscore.com/romangie/demo/" target="_blank">live demo</a> to see it in action. </p>\n<p>Because Romangie is built on Bootstrap 3, you&#8217;ll be able to take advantage of all the new features of the framework, including the improved grid system, Glyphicons, new panels and list group components, a mobile-first design approach and much more. </p>\n<p>A lot of work has gone into this theme to ensure a modern browsing experience for users on all devices. If you want to combine WordPress with all that Bootstrap 3 has to offer, this theme is a great starting place.</p>\n<p>You can download <a href="http://wordpress.org/themes/romangie" target="_blank">Romangie</a> for free through your WordPress themes panel. For more information or to contact the theme&#8217;s developer, visit the <a href="http://themes.tobscore.com/romangie/" target="_blank">Romangie theme homepage</a>. </p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 19 Dec 2013 11:15:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:46;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:64:"WPTavern: I Contributed To The Core Of WordPress and You Can Too";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://www.wptavern.com/?p=13159";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:74:"http://wptavern.com/i-contributed-to-the-core-of-wordpress-and-you-can-too";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6885:"<p><a href="http://www.wptavern.com/wp-content/uploads/2013/12/WordPress38Contributors.jpg" rel="prettyphoto[13159]" rel="thumbnail"><img src="http://www.wptavern.com/wp-content/uploads/2013/12/WordPress38Contributors.jpg" alt="WordPress 3.8 Contributors" width="258" height="139" class="alignright size-full wp-image-13495" /></a>WordPress 3.8 <a title="http://wordpress.org/news/2013/12/parker/" href="http://wordpress.org/news/2013/12/parker/">was released</a> just a few days ago. There were 188 contributors that helped make WordPress 3.8 a reality. I&#8217;m proud to say that <a title="http://profiles.wordpress.org/jeffr0" href="http://profiles.wordpress.org/jeffr0">I</a> was among those 188 contributors. I never thought I&#8217;d be able to make the list but thanks to some help, I was able to contribute in my own way. The following is my experience contributing to WordPress. <span id="more-13159"></span></p>\n<p>During the development of WordPress 3.8, I used the <a title="http://wordpress.org/plugins/wordpress-beta-tester/" href="http://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Testing</a> plugin to keep up with changes on my local server. While testing the default theme TwentyFourteen, I noticed a typo within the theme details. I could have reported the typo to a default theme team member and it would have been fixed immediately. However, once I discovered the typo I knew it was an opportunity to contribute to the core and make it on the contributors list.</p>\n<h3>Is Fixing A Typo Really A Contribution?</h3>\n<p>Before I reported the typo, I thought about whether fixing a typo would classify as a contribution. It was a small change that involved adding one letter to a word. I asked my followers on Twitter what they thought.</p>\n<blockquote class="twitter-tweet" width="550"><p>Curiosity question. If I fix a typo in WordPress core, is that enough to get a credit link for a contribution or is that not enough?</p>\n<p>&mdash; Jeff (@jeffr0) <a href="https://twitter.com/jeffr0/statuses/410575551905030144">December 11, 2013</a></p></blockquote>\n<p></p>\n<p>What I learned is that some people have contributed to WordPress simply by removing white space from code. Konstantin Obenland contributed to WordPress by adding an underscore where it was appropriate. The moral of the story is that no matter how small the contribution, every little bit counts and helps to improve the software. There is no need to feel guilty or unworthy of being listed as a contributor if all you did was fix a typo.</p>\n<h3>Getting My Patch Into Core</h3>\n<p>After discovering the typo, I immediately reached out to Konstantin Obenland who was a member of the team responsible for TwentyFourteen. I reported the typo to him and he recommended that I create a new ticket on <a title="http://core.trac.wordpress.org/" href="http://core.trac.wordpress.org/">Trac</a>. Bug reports along with their associated patches go through Trac in the form of tickets. Trac is not for the faint of heart. It&#8217;s an intimidating website for those that don&#8217;t frequent it often. Even though I&#8217;ve participated in the WordPress community for years, Trac still rattles my nerves when I create a ticket.</p>\n<p><a href="http://www.wptavern.com/wp-content/uploads/2013/12/ContributionTicketFor38.jpg" rel="prettyphoto[13159]" rel="thumbnail"><img src="http://www.wptavern.com/wp-content/uploads/2013/12/ContributionTicketFor38-500x205.jpg" alt="The Ticket I Created For WordPress 3.8" width="500" height="205" class="aligncenter size-large wp-image-13496" /></a></p>\n<p>Using Konstantin as a mentor, he walked me through the process of <a title="http://core.trac.wordpress.org/ticket/26528" href="http://core.trac.wordpress.org/ticket/26528">creating the ticket</a>. He also created the diff file for me that I uploaded as a patch. I didn&#8217;t know how to create diff files so it was nice of Konstantin to create one for me. Once the patch was uploaded, the ticket was out of my hands. After some edits to the ticket, the right people saw the patch and applied the fix to WordPress 3.8 before it was released.</p>\n<h3>WordPress Needs Core Contributor Mentors</h3>\n<p>WordPress would benefit from having a list of people that act as mentors for those contributing to WordPress for the first time via Trac. Drupal has gone through great lengths to make core contributing mentorship a priority. They have <a title="http://drupalmentoring.org/" href="http://drupalmentoring.org/">an entire site</a> dedicated to mentoring new contributors. Even if it were not as organized as Drupal, I&#8217;d like to see a list of mentors I could get in touch with to walk me through the process of patching a bug or fixing a typo in core.</p>\n<p>A few years ago, WordPress tried to create a core mentorship program but it didn&#8217;t take off. The contributor team was much smaller than it is today and WordPress didn&#8217;t have regular working teams. I asked Jen Mylo if there are any plans to try and create a mentorship program now that there are a lot more people involved with the core development of WordPress. She tells me that she is currently working on a proposal for a formalized mentorship program across all of the contributor teams. </p>\n<blockquote><p>We didn&#8217;t really have regular working teams then, and even the core team back then was much smaller active group. We&#8217;re in a much better place now to support formal mentorship programs since we now have regularly meeting teams, team reps posting weekly updates, etc.</p></blockquote>\n<p>Jen says the proposal will be posted sometime before the end of the year.</p>\n<h3>Contributing Was Awesome</h3>\n<p>Despite it only being a typo, contributing to the core of WordPress was exhilarating. For a brief moment, I felt like learning PHP and MySQL to contribute everything I could to WordPress. After the excitement went away, I came back to my senses. Special thanks to Konstantin Obenland for holding my hand during the process of contributing. The last thing I want to do on Trac is make the core WordPress developers job harder by improperly filing tickets. Instead of screwing up, it&#8217;s better to not mess with Trac at all. At least that&#8217;s the way I&#8217;ve approached it.</p>\n<p>While there is a <a title="http://make.wordpress.org/core/handbook/" href="http://make.wordpress.org/core/handbook/">handbook devoted entirely to contributing to WordPress</a>, it&#8217;s not the same as being guided through the process with an experienced individual. Thankfully, most of the <a title="http://chrislema.com/approachable-wordpress/" href="http://chrislema.com/approachable-wordpress/">WordPress community is approachable</a> and getting help is as easy as tweeting, skypeing, or emailing someone.</p>\n<p><strong>At the end of the day, I contributed to WordPress and you can too.</strong></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 18 Dec 2013 23:30:24 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:6:"Jeffro";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:47;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:80:"WPTavern: Piwik Redesigned: Open Source Web Analytics Software Gets a Fresh Look";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://www.wptavern.com/?p=13440";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:89:"http://wptavern.com/piwik-redesigned-open-source-web-analytics-software-gets-a-fresh-look";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5663:"<p><a href="http://piwik.org/" target="_blank">Piwik</a> is leading the way when it comes to open source web analytics software. More than 1,000,000 websites are using Piwik for analytics, according to the current <a href="http://trends.builtwith.com/analytics/Piwik-Web-Analytics" target="_blank">Builtwith assessment</a>. The team has just launched its 2.0 release with a brand new website and redesigned mobile app. This release is the culmination of seven months of work from the Piwik team and community.</p>\n<p><a href="http://www.wptavern.com/wp-content/uploads/2013/12/piwik_app.jpg" rel="prettyphoto[13440]" rel="thumbnail"><img src="http://www.wptavern.com/wp-content/uploads/2013/12/piwik_app.jpg" alt="piwik_app" width="1214" height="726" class="aligncenter size-full wp-image-13464" /></a></p>\n<p>Haven&#8217;t heard of Piwik? That&#8217;s probably due to the fact that Google Analytics thoroughly dominates this space. But there&#8217;s something exceptional that sets Piwik apart from Google Analytics. <strong>Piwik is free and open source, affording you privacy and full control over your data.</strong> Piwik takes about five minutes to install on your server. You can track multiple websites and keep all your data in the same place on your own server, away from prying eyes. </p>\n<h3>Piwik: An Open Source Alternative to Google Analytics</h3>\n<p>The Piwik dashboard has everything you&#8217;d expect from a comprehensive web analytics platform, including recent visits, keyword information, visitor location map, browser information, referrer information, and real-time visitor stats, and more available via widgets.</p>\n<p>I had the chance to chat with Piwik founder and lead developer Matthieu Aubry. Given that Google Analytics is considered the default choice for the vast majority of websites, I asked him what is the number one reason people choose Piwik over its more popular competitor. He replied, &#8220;There are many reasons but <span class="pullquote alignleft">I think the number one reason for many choosing Piwik over Google Analytics is privacy and keeping control over sensitive user data.</span> This is becoming all too important. Another good reason may be that people like the simplicity of the UI and the openness of the platform.&#8221;</p>\n<p>Part of that openness is that developers are encouraged to extend the platform using the Piwik APIs and many are already doing some creative things.<strong> &#8220;There are several businesses using the API to provide web analytics to many of their customers&#8217; websites automatically (by creating website users and scheduled reports using the API),&#8221;</strong> Aubry said. &#8220;Others use the API to request data and display it elsewhere. The tracking API is also used to implement custom app usage tracking within Mobile apps. Finally, what we hope to help developers build 3rd party plugins similar to WordPress or other popular open source frameworks. This will be our chance to bring a lot of innovation in analytics!&#8221;</p>\n<h3>How to Use Piwik With WordPress</h3>\n<p>Piwik is <a href="http://piwik.org/faq/new-to-piwik/#faq_45" target="_blank">licensed under the GPL</a>, just like WordPress. The WP-Piwik plugin integrates Piwik into your WordPress site, adds the tracking code and displays a summary of stats in your admin panel.</p>\n<p><a href="http://www.wptavern.com/wp-content/uploads/2013/12/piwik_wp.jpg" rel="prettyphoto[13440]" rel="thumbnail"><img src="http://www.wptavern.com/wp-content/uploads/2013/12/piwik_wp.jpg" alt="piwik_wp" width="1024" height="596" class="aligncenter size-full wp-image-13478" /></a></p>\n<p>Instructions for setting up WP-Piwik can be found on the <a href="http://wordpress.org/plugins/wp-piwik/" target="_blank">WordPress Integration</a> page and the the <a href="http://wordpress.org/plugins/wp-piwik/" target="_blank">plugin</a> is available in the WordPress repository. </p>\n<h3>What&#8217;s New in Piwik 2.0?</h3>\n<p>In addition to the new website, Piwik users will enjoy a host of new features with this <a href="http://piwik.org/changelog/piwik-2-0/" target="_blank">2.0 release</a>:</p>\n<ul>\n<li>Launch of the Piwik <a href="http://plugins.piwik.org/" target="_blank">marketplace</a> for plugins and themes</li>\n<li>Browse and install plugins and themes directly from within Piwik</li>\n<li>New completely redesigned mobile app, allowing users to monitor web traffic on the go</li>\n<li>Piwik 2.0 has now been translated by volunteers into 53 different languages</li>\n</ul>\n<p>The team has also launched a new <a href="http://piwik.pro/" target="_blank">Piwik Pro</a> service that will offer professional analytics services for businesses, NGOs and governments, as well as cloud hosting and enterprise deployments. The service also includes custom integrations and support. </p>\n<p>If you&#8217;re curious about Piwik but would rather try it before installing on your own server, check out the <a href="http://demo.piwik.org/index.php?module=CoreHome&action=index&idSite=7&period=day&date=yesterday#module=Dashboard&action=embeddedIndex&idSite=7&period=day&date=yesterday&idDashboard=1" target="_blank">live demo</a>. Piwik is not just for web analytics &#8211; you can also use it to track e-commerce, server logs and intranet analytics.</p>\n<p>Many website owners are willing to trade privacy for the convenience of Google Analytics. But if you&#8217;re serious about owning your own data and protecting sensitive information, it&#8217;s nice to know that there are open source options like <a href="http://piwik.org/" target="_blank">Piwik</a> that can provide the same comprehensive level of analytics.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 18 Dec 2013 20:53:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:48;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:50:"WPTavern: WPTavern Gets Responsive With New Design";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://www.wptavern.com/?p=13443";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wptavern.com/wptavern-gets-responsive-with-new-design";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2545:"<p>It&#8217;s been a long time since the Tavern has received a new coat of paint. I&#8217;d like to introduce you to the <strong>new WordPress Tavern</strong>. This design is a child theme that we created, based on <a href="http://www.wptavern.com/stargazer-a-free-design-specific-parent-theme-for-wordpress" title="http://www.wptavern.com/stargazer-a-free-design-specific-parent-theme-for-wordpress">Stargazer</a>, a new parent theme from <a href="http://themehybrid.com/" title="http://themehybrid.com/">Theme Hybrid</a>. WPTavern is now responsive and looks good on any mobile device without the need to use a special mobile theme. If the font used for the content looks familiar to you, it&#8217;s because it&#8217;s <a href="http://opensans.com/" title="http://opensans.com/">the same one</a> used within the <a href="http://www.wptavern.com/wordpress-3-8-parker-released" title="http://www.wptavern.com/wordpress-3-8-parker-released">newly redesigned backend of WordPress</a>. </p>\n<div id="attachment_12155" class="wp-caption aligncenter"><a href="http://www.wptavern.com/wp-content/uploads/2013/11/stargazer.png" rel="prettyphoto[13443]" rel="thumbnail"><img src="http://www.wptavern.com/wp-content/uploads/2013/11/stargazer-500x375.png" alt="Stargazer Theme By Justin Tadlock" width="500" height="375" class="size-large wp-image-12155" /></a><p class="wp-caption-text">Stargazer Theme By Justin Tadlock</p></div>\n<p>We&#8217;ve tried to maintain some of the personality unique to WordPress Tavern such as the wooden floor. This time however, the wood is a lighter shade which brightens the website. I&#8217;d like to take this opportunity to thank <a href="http://angiemeekerdesigns.com/" title="http://angiemeekerdesigns.com/">Angie Meeker</a> for the inspiration behind the new Tavern header logo and <a href="http://profiles.wordpress.org/users/coffee2code/" title="http://profiles.wordpress.org/users/coffee2code/">Scott Reilly</a> for playing the role of guinea pig. The beer mug in the header will be used as our brand image across the various social networking sites. </p>\n<p>This is the first of many big changes on the way. With the redesign in place, keep an eye out for the WordPress Tavern forum to make a return. If you come across a  bug while browsing the site, please <a href="http://wptavern.com/ http://www.wptavern.com/contact-me" title=" http://www.wptavern.com/contact-me">get in touch with us</a>. When providing a bug report, tell us what browser and version you&#8217;re using. Be as descriptive as possible.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 18 Dec 2013 18:41:29 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:6:"Jeffro";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:49;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:54:"WordPress.tv: Raushan Jaiswal: WordPress For Beginners";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wordpress.tv/?p=26813";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"http://wordpress.tv/2013/12/18/raushan-jaiswal-wordpress-for-beginners/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:657:"<div id="v-X0xsFBFP-1" class="video-player">\n</div><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/wptv.wordpress.com/26813/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/wptv.wordpress.com/26813/" /></a> <img alt="" border="0" src="http://stats.wordpress.com/b.gif?host=wordpress.tv&blog=5089392&post=26813&subd=wptv&ref=&feed=1" width="1" height="1" /><div><a href="http://wordpress.tv/2013/12/18/raushan-jaiswal-wordpress-for-beginners/"><img alt="Raushan Jaiswal: WordPress For Beginners" src="http://videos.videopress.com/X0xsFBFP/video-054ebd5cd3_std.original.jpg" width="160" height="120" /></a></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 18 Dec 2013 16:21:15 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"WordPress.tv";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:9:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Mon, 30 Dec 2013 21:06:35 GMT";s:12:"content-type";s:8:"text/xml";s:14:"content-length";s:6:"149638";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:13:"last-modified";s:29:"Mon, 30 Dec 2013 20:45:20 GMT";s:4:"x-nc";s:11:"HIT lax 249";s:13:"accept-ranges";s:5:"bytes";}s:5:"build";s:14:"20131227145148";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(237, '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1388480758', 'no'),
(238, '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1388437558', 'no'),
(235, '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1388480758', 'no'),
(236, '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:72:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:44:"http://wordpress.org/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 30 Dec 2013 20:58:40 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:15:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"WordPress SEO by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"http://wordpress.org/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"8321@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using the WordPress SEO plugin by Yoast.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"http://wordpress.org/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2141@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"http://wordpress.org/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"753@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:126:"All in One SEO Pack is a WordPress SEO plugin to automatically optimize your Wordpress blog for Search Engines such as Google.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"http://wordpress.org/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"23862@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:104:"Supercharge your WordPress site with powerful features previously only available to WordPress.com users.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Tim Moore";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:63:"http://wordpress.org/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"132@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:5:"Arnee";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"http://wordpress.org/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"18101@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"http://wordpress.org/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"15@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"WPtouch Mobile Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:47:"http://wordpress.org/plugins/wptouch/#post-5468";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 May 2008 04:58:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"5468@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:63:"Create a slick mobile WordPress website with just a few clicks.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"BraveNewCode Inc.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"BackWPup Free - WordPress Backup Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"http://wordpress.org/plugins/backwpup/#post-11392";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 23 Jun 2009 11:31:17 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"11392@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:146:"Schedule complete automatic backups of your WordPress installation. Decide which content will be stored (Dropbox, S3…). This is the free version";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Daniel Huesken";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"NextGEN Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wordpress.org/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"1169@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:122:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 7.5 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"Ultimate TinyMCE";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"http://wordpress.org/plugins/ultimate-tinymce/#post-32088";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 14 Nov 2011 09:06:40 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"32088@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:94:"Description: Beef up the WordPress TinyMCE content editor with a plethora of advanced options.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:19:"Josh (Ult. Tinymce)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Captcha";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"http://wordpress.org/plugins/captcha/#post-26129";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Apr 2011 05:53:50 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"26129@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:79:"This plugin allows you to implement super security captcha form into web forms.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"bestwebsoft";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WooCommerce - excelling eCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"http://wordpress.org/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"29860@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"TinyMCE Advanced";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://wordpress.org/plugins/tinymce-advanced/#post-2082";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Jun 2007 15:00:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"2082@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Enables the advanced features of TinyMCE, the WordPress WYSIWYG editor.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Andrew Ozz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:12:"Contact Form";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"http://wordpress.org/plugins/contact-form-plugin/#post-26890";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 26 May 2011 07:34:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"26890@http://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:43:"Add Contact Form to your WordPress website.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"bestwebsoft";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:45:"http://wordpress.org/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:7:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Mon, 30 Dec 2013 21:06:35 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:13:"last-modified";s:29:"Thu, 01 Jan 2009 20:34:44 GMT";s:4:"x-nc";s:11:"HIT lax 249";}s:5:"build";s:14:"20131227145148";}', 'no'),
(239, '_transient_timeout_plugin_slugs', '1388524322', 'no'),
(240, '_transient_plugin_slugs', 'a:5:{i:0;s:19:"akismet/akismet.php";i:1;s:36:"contact-form-plugin/contact_form.php";i:2;s:9:"hello.php";i:3;s:41:"responsive-add-ons/responsive-add-ons.php";i:4;s:33:"ssh-sftp-updater-support/sftp.php";}', 'no'),
(202, '_site_transient_timeout_wporg_theme_feature_list', '1388260355', 'yes'),
(203, '_site_transient_wporg_theme_feature_list', 'a:5:{s:6:"Colors";a:15:{i:0;s:5:"black";i:1;s:4:"blue";i:2;s:5:"brown";i:3;s:4:"gray";i:4;s:5:"green";i:5;s:6:"orange";i:6;s:4:"pink";i:7;s:6:"purple";i:8;s:3:"red";i:9;s:6:"silver";i:10;s:3:"tan";i:11;s:5:"white";i:12;s:6:"yellow";i:13;s:4:"dark";i:14;s:5:"light";}s:7:"Columns";a:6:{i:0;s:10:"one-column";i:1;s:11:"two-columns";i:2;s:13:"three-columns";i:3;s:12:"four-columns";i:4;s:12:"left-sidebar";i:5;s:13:"right-sidebar";}s:6:"Layout";a:3:{i:0;s:12:"fixed-layout";i:1;s:12:"fluid-layout";i:2;s:17:"responsive-layout";}s:8:"Features";a:20:{i:0;s:19:"accessibility-ready";i:1;s:8:"blavatar";i:2;s:10:"buddypress";i:3;s:17:"custom-background";i:4;s:13:"custom-colors";i:5;s:13:"custom-header";i:6;s:11:"custom-menu";i:7;s:12:"editor-style";i:8;s:21:"featured-image-header";i:9;s:15:"featured-images";i:10;s:15:"flexible-header";i:11;s:20:"front-page-post-form";i:12;s:19:"full-width-template";i:13;s:12:"microformats";i:14;s:12:"post-formats";i:15;s:20:"rtl-language-support";i:16;s:11:"sticky-post";i:17;s:13:"theme-options";i:18;s:17:"threaded-comments";i:19;s:17:"translation-ready";}s:7:"Subject";a:3:{i:0;s:7:"holiday";i:1;s:13:"photoblogging";i:2;s:8:"seasonal";}}', 'yes'),
(138, 'widget_calendar', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(139, 'theme_mods_twentyfourteen', 'a:10:{s:16:"header_textcolor";s:6:"ffffff";s:16:"background_color";s:6:"f5f5f5";s:16:"background_image";s:0:"";s:17:"background_repeat";s:6:"repeat";s:21:"background_position_x";s:4:"left";s:21:"background_attachment";s:5:"fixed";s:23:"featured_content_layout";s:4:"grid";s:12:"header_image";s:96:"http://lamp.cse.fau.edu/~jshakya/wordpress/wp-content/uploads/2013/12/copy-cropped-logoTemp.jpeg";s:17:"header_image_data";a:5:{s:13:"attachment_id";i:17;s:3:"url";s:96:"http://lamp.cse.fau.edu/~jshakya/wordpress/wp-content/uploads/2013/12/copy-cropped-logoTemp.jpeg";s:13:"thumbnail_url";s:96:"http://lamp.cse.fau.edu/~jshakya/wordpress/wp-content/uploads/2013/12/copy-cropped-logoTemp.jpeg";s:5:"width";i:246;s:6:"height";i:129;}s:16:"sidebars_widgets";a:2:{s:4:"time";i:1388249283;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:3:{i:0;s:10:"nav_menu-2";i:1;s:8:"search-2";i:2;s:10:"calendar-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:1:{i:0;s:6:"text-2";}}}}', 'yes'),
(130, 'current_theme', 'Customizr', 'yes'),
(131, 'theme_mods_twentythirteen', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1388249578;s:4:"data";a:3:{s:19:"wp_inactive_widgets";a:3:{i:0;s:10:"calendar-2";i:1;s:6:"text-2";i:2;s:10:"nav_menu-2";}s:9:"sidebar-1";a:1:{i:0;s:8:"search-2";}s:9:"sidebar-2";a:0:{}}}}', 'yes'),
(132, 'theme_switched', '', 'yes'),
(134, 'ftp_credentials', 'a:3:{s:8:"hostname";s:16:"lamp.cse.fau.edu";s:8:"username";s:7:"jshakya";s:15:"connection_type";s:3:"ssh";}', 'yes'),
(140, 'recently_activated', 'a:0:{}', 'yes'),
(144, 'theme_mods_responsive', 'a:8:{i:0;b:0;s:12:"header_image";s:13:"remove-header";s:16:"background_color";s:0:"";s:16:"background_image";s:0:"";s:17:"background_repeat";s:9:"no-repeat";s:21:"background_position_x";s:4:"left";s:21:"background_attachment";s:5:"fixed";s:16:"sidebars_widgets";a:2:{s:4:"time";i:1388161512;s:4:"data";a:13:{s:19:"wp_inactive_widgets";a:0:{}s:12:"main-sidebar";a:7:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";i:6;s:10:"calendar-2";}s:13:"right-sidebar";a:0:{}s:12:"left-sidebar";a:0:{}s:17:"left-sidebar-half";N;s:18:"right-sidebar-half";N;s:13:"home-widget-1";N;s:13:"home-widget-2";N;s:13:"home-widget-3";N;s:14:"gallery-widget";N;s:15:"colophon-widget";N;s:10:"top-widget";N;s:13:"footer-widget";N;}}}', 'yes'),
(146, '_site_transient_timeout_browser_8b7535adeddc223aa9c8b2b378cdf189', '1388764843', 'yes'),
(147, '_site_transient_browser_8b7535adeddc223aa9c8b2b378cdf189', 'a:9:{s:8:"platform";s:9:"Macintosh";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"31.0.1650.63";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(148, 'responsive_theme_options', 'a:34:{s:10:"breadcrumb";i:1;s:10:"cta_button";i:1;s:22:"blog_post_title_toggle";s:1:"1";s:20:"blog_post_title_text";s:0:"";s:10:"front_page";i:1;s:13:"home_headline";N;s:16:"home_subheadline";N;s:17:"home_content_area";N;s:7:"cta_url";N;s:8:"cta_text";N;s:16:"featured_content";N;s:26:"static_page_layout_default";s:20:"content-sidebar-page";s:26:"single_post_layout_default";s:20:"content-sidebar-page";s:31:"blog_posts_index_layout_default";s:20:"content-sidebar-page";s:11:"twitter_uid";s:0:"";s:12:"facebook_uid";s:32:"http://facebook.com/jebin.shakya";s:12:"linkedin_uid";s:0:"";s:11:"youtube_uid";s:0:"";s:11:"stumble_uid";s:0:"";s:7:"rss_uid";s:0:"";s:15:"google_plus_uid";s:0:"";s:13:"instagram_uid";s:0:"";s:13:"pinterest_uid";s:0:"";s:8:"yelp_uid";s:0:"";s:9:"vimeo_uid";s:0:"";s:14:"foursquare_uid";s:0:"";s:6:"submit";s:12:"Save Options";s:21:"responsive_inline_css";s:0:"";s:25:"responsive_inline_js_head";s:0:"";s:27:"responsive_inline_js_footer";s:0:"";s:24:"google_site_verification";s:0:"";s:22:"bing_site_verification";s:0:"";s:23:"yahoo_site_verification";s:0:"";s:23:"site_statistics_tracker";s:0:"";}', 'yes'),
(196, 'featured-content', 'a:2:{s:6:"tag-id";i:0;s:8:"hide-tag";i:1;}', 'yes'),
(197, 'widget_widget_twentyfourteen_ephemera', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(156, 'category_children', 'a:0:{}', 'yes'),
(198, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(205, 'theme_mods_customizr', 'a:1:{i:0;b:0;}', 'yes'),
(206, 'menu_button', '', 'yes'),
(207, 'tc_theme_options', 'a:46:{s:12:"tc_menu_type";s:5:"hover";s:7:"tc_skin";s:8:"blue.css";s:13:"tc_top_border";i:1;s:14:"tc_logo_upload";s:79:"http://lamp.cse.fau.edu/~jshakya/wordpress/wp-content/uploads/2013/12/logo2.png";s:14:"tc_logo_resize";i:1;s:13:"tc_fav_upload";s:0:"";s:15:"tc_front_layout";s:1:"f";s:15:"tc_front_slider";s:4:"demo";s:15:"tc_slider_width";i:1;s:15:"tc_slider_delay";i:5000;s:22:"tc_show_featured_pages";i:1;s:26:"tc_show_featured_pages_img";i:1;s:28:"tc_featured_page_button_text";s:12:"Read more »";s:20:"tc_featured_page_one";s:2:"10";s:20:"tc_featured_page_two";s:2:"10";s:22:"tc_featured_page_three";s:2:"10";s:20:"tc_featured_text_one";s:8:"Service ";s:20:"tc_featured_text_two";s:8:"About us";s:22:"tc_featured_text_three";s:10:"Contact Us";s:13:"tc_breadcrumb";i:1;s:24:"tc_sidebar_global_layout";s:1:"l";s:23:"tc_sidebar_force_layout";i:0;s:22:"tc_sidebar_post_layout";s:1:"l";s:19:"tc_post_list_length";s:7:"excerpt";s:22:"tc_sidebar_page_layout";s:1:"l";s:16:"tc_page_comments";i:0;s:19:"tc_social_in_header";i:1;s:25:"tc_social_in_left-sidebar";i:0;s:26:"tc_social_in_right-sidebar";i:0;s:19:"tc_social_in_footer";i:1;s:6:"tc_rss";s:52:"http://lamp.cse.fau.edu/~jshakya/wordpress/?feed=rss";s:10:"tc_twitter";s:0:"";s:11:"tc_facebook";s:0:"";s:9:"tc_google";s:0:"";s:12:"tc_instagram";s:0:"";s:12:"tc_wordpress";s:0:"";s:10:"tc_youtube";s:0:"";s:12:"tc_pinterest";s:0:"";s:9:"tc_github";s:0:"";s:11:"tc_dribbble";s:0:"";s:11:"tc_linkedin";s:0:"";s:11:"tc_fancybox";i:1;s:21:"tc_fancybox_autoscale";i:1;s:17:"tc_retina_support";i:1;s:14:"tc_link_scroll";i:0;s:13:"tc_custom_css";s:0:"";}', 'yes'),
(208, 'hr_logo', '', 'yes'),
(209, 'homecontent_title', '', 'yes'),
(210, 'slider_check', '', 'yes'),
(1084, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1398720802;s:7:"checked";a:5:{s:9:"customizr";s:5:"3.1.5";s:10:"responsive";s:7:"1.9.4.2";s:14:"twentyfourteen";s:3:"1.0";s:14:"twentythirteen";s:3:"1.1";s:12:"twentytwelve";s:3:"1.3";}s:8:"response";a:2:{s:9:"customizr";a:4:{s:5:"theme";s:9:"customizr";s:11:"new_version";s:6:"3.1.11";s:3:"url";s:38:"https://wordpress.org/themes/customizr";s:7:"package";s:58:"https://wordpress.org/themes/download/customizr.3.1.11.zip";}s:10:"responsive";a:4:{s:5:"theme";s:10:"responsive";s:11:"new_version";s:7:"1.9.5.6";s:3:"url";s:39:"https://wordpress.org/themes/responsive";s:7:"package";s:60:"https://wordpress.org/themes/download/responsive.1.9.5.6.zip";}}s:12:"translations";a:0:{}}', 'yes'),
(250, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1388448688', 'yes'),
(251, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:40:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"3898";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"2456";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"2344";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"1930";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"1856";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"1583";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1329";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1325";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1310";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1260";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1225";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1121";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"1000";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:3:"982";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:3:"974";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:3:"950";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:3:"844";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:3:"821";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:3:"780";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"722";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:3:"686";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"681";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:3:"678";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:3:"623";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"615";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"595";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"572";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"570";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"541";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"539";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"530";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"522";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"506";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"505";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"471";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"458";}s:5:"stats";a:3:{s:4:"name";s:5:"stats";s:4:"slug";s:5:"stats";s:5:"count";s:3:"453";}s:8:"category";a:3:{s:4:"name";s:8:"category";s:4:"slug";s:8:"category";s:5:"count";s:3:"452";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"436";}s:7:"comment";a:3:{s:4:"name";s:7:"comment";s:4:"slug";s:7:"comment";s:5:"count";s:3:"432";}}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(2, 4, '_menu_item_type', 'custom'),
(3, 4, '_menu_item_menu_item_parent', '0'),
(4, 4, '_menu_item_object_id', '4'),
(5, 4, '_menu_item_object', 'custom'),
(6, 4, '_menu_item_target', ''),
(7, 4, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(8, 4, '_menu_item_xfn', ''),
(9, 4, '_menu_item_url', 'http://lamp.cse.fau.edu/~jshakya/wordpress/'),
(10, 4, '_menu_item_orphaned', '1388156877'),
(11, 5, '_menu_item_type', 'post_type'),
(12, 5, '_menu_item_menu_item_parent', '0'),
(13, 5, '_menu_item_object_id', '2'),
(14, 5, '_menu_item_object', 'page'),
(15, 5, '_menu_item_target', ''),
(16, 5, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(17, 5, '_menu_item_xfn', ''),
(18, 5, '_menu_item_url', ''),
(19, 5, '_menu_item_orphaned', '1388156877'),
(25, 8, '_wp_attached_file', '2013/12/cropped-logoTemp.jpeg'),
(26, 8, '_wp_attachment_context', 'custom-header'),
(27, 8, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:246;s:6:"height";i:129;s:4:"file";s:29:"2013/12/cropped-logoTemp.jpeg";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:29:"cropped-logoTemp-150x129.jpeg";s:5:"width";i:150;s:6:"height";i:129;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(28, 8, '_wp_attachment_is_custom_header', 'responsive'),
(29, 9, '_wp_attached_file', '2013/12/logoTemp.jpeg'),
(30, 9, '_wp_attachment_context', 'custom-background'),
(31, 9, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:246;s:6:"height";i:205;s:4:"file";s:21:"2013/12/logoTemp.jpeg";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"logoTemp-150x150.jpeg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(32, 9, '_wp_attachment_is_custom_background', 'responsive'),
(33, 10, '_edit_last', '1'),
(34, 10, '_edit_lock', '1388160807:1'),
(35, 10, '_wp_page_template', 'default'),
(36, 10, '_responsive_layout', 'default'),
(40, 13, '_wp_page_template', 'default'),
(39, 13, '_edit_last', '1'),
(41, 13, '_edit_lock', '1388250215:1'),
(42, 15, '_edit_last', '1'),
(43, 15, '_wp_page_template', 'default'),
(44, 15, '_edit_lock', '1388250273:1'),
(45, 17, '_wp_attached_file', '2013/12/copy-cropped-logoTemp.jpeg'),
(46, 17, '_wp_attachment_context', 'custom-header'),
(47, 17, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:246;s:6:"height";i:129;s:4:"file";s:34:"2013/12/copy-cropped-logoTemp.jpeg";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:34:"copy-cropped-logoTemp-150x129.jpeg";s:5:"width";i:150;s:6:"height";i:129;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(48, 17, '_wp_attachment_is_custom_header', 'twentyfourteen'),
(49, 9, '_edit_lock', '1388249852:1'),
(50, 18, '_wp_attached_file', '2013/12/logo.png'),
(51, 18, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:250;s:6:"height";i:100;s:4:"file";s:16:"2013/12/logo.png";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:16:"logo-150x100.png";s:5:"width";i:150;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(52, 19, '_wp_attached_file', '2013/12/logo1.png'),
(53, 19, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:250;s:6:"height";i:100;s:4:"file";s:17:"2013/12/logo1.png";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:17:"logo1-150x100.png";s:5:"width";i:150;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(54, 20, '_wp_attached_file', '2013/12/logo2.png'),
(55, 20, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:250;s:6:"height";i:100;s:4:"file";s:17:"2013/12/logo2.png";s:5:"sizes";a:1:{s:9:"thumbnail";a:4:{s:4:"file";s:17:"logo2-150x100.png";s:5:"width";i:150;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:10:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";}}'),
(56, 21, 'post_slider_check_key', '0'),
(57, 21, '_edit_last', '1'),
(58, 21, '_wp_page_template', 'default'),
(59, 21, 'layout_key', ''),
(60, 21, '_edit_lock', '1388250196:1'),
(61, 13, 'layout_key', ''),
(62, 13, 'post_slider_check_key', '0'),
(63, 15, 'layout_key', ''),
(64, 15, 'post_slider_check_key', '0');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(4, 1, '2013-12-27 15:07:57', '0000-00-00 00:00:00', '', 'Home', '', 'draft', 'open', 'open', '', '', '', '', '2013-12-27 15:07:57', '0000-00-00 00:00:00', '', 0, 'http://lamp.cse.fau.edu/~jshakya/wordpress/?p=4', 1, 'nav_menu_item', '', 0),
(5, 1, '2013-12-27 15:07:57', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2013-12-27 15:07:57', '0000-00-00 00:00:00', '', 0, 'http://lamp.cse.fau.edu/~jshakya/wordpress/?p=5', 1, 'nav_menu_item', '', 0),
(8, 1, '2013-12-27 16:07:13', '2013-12-27 16:07:13', 'http://lamp.cse.fau.edu/~jshakya/wordpress/wp-content/uploads/2013/12/cropped-logoTemp.jpeg', 'cropped-logoTemp.jpeg', '', 'inherit', 'closed', 'open', '', 'cropped-logotemp-jpeg', '', '', '2013-12-27 16:07:13', '2013-12-27 16:07:13', '', 0, 'http://lamp.cse.fau.edu/~jshakya/wordpress/wp-content/uploads/2013/12/cropped-logoTemp.jpeg', 0, 'attachment', 'image/jpeg', 0),
(9, 1, '2013-12-27 16:12:31', '2013-12-27 16:12:31', '', 'logoTemp', '', 'inherit', 'open', 'open', '', 'logotemp', '', '', '2013-12-27 16:12:31', '2013-12-27 16:12:31', '', 0, 'http://lamp.cse.fau.edu/~jshakya/wordpress/wp-content/uploads/2013/12/logoTemp.jpeg', 0, 'attachment', 'image/jpeg', 0),
(10, 1, '2013-12-27 16:13:26', '2013-12-27 16:13:26', 'This is the home page.', 'Home', '', 'publish', 'open', 'open', '', 'home', '', '', '2013-12-27 16:13:26', '2013-12-27 16:13:26', '', 0, 'http://lamp.cse.fau.edu/~jshakya/wordpress/?page_id=10', 0, 'page', '', 0),
(11, 1, '2013-12-27 16:13:26', '2013-12-27 16:13:26', 'This is the home page.', 'Home', '', 'inherit', 'open', 'open', '', '10-revision-v1', '', '', '2013-12-27 16:13:26', '2013-12-27 16:13:26', '', 10, 'http://lamp.cse.fau.edu/~jshakya/wordpress/?p=11', 0, 'revision', '', 0),
(13, 1, '2013-12-28 12:05:25', '2013-12-28 17:05:25', '', 'Contact Us', '', 'publish', 'open', 'open', '', 'contact-us', '', '', '2013-12-28 12:05:25', '2013-12-28 17:05:25', '', 0, 'http://lamp.cse.fau.edu/~jshakya/wordpress/?page_id=13', 0, 'page', '', 0),
(14, 1, '2013-12-28 16:32:11', '2013-12-28 16:32:11', '', 'Contact Us', '', 'inherit', 'open', 'open', '', '13-revision-v1', '', '', '2013-12-28 16:32:11', '2013-12-28 16:32:11', '', 13, 'http://lamp.cse.fau.edu/~jshakya/wordpress/?p=14', 0, 'revision', '', 0),
(15, 1, '2013-12-28 12:05:36', '2013-12-28 17:05:36', '', 'Services', '', 'publish', 'open', 'open', '', 'services', '', '', '2013-12-28 12:05:36', '2013-12-28 17:05:36', '', 0, 'http://lamp.cse.fau.edu/~jshakya/wordpress/?page_id=15', 0, 'page', '', 0),
(16, 1, '2013-12-28 11:39:50', '2013-12-28 16:39:50', '', 'Services', '', 'inherit', 'open', 'open', '', '15-revision-v1', '', '', '2013-12-28 11:39:50', '2013-12-28 16:39:50', '', 15, 'http://lamp.cse.fau.edu/~jshakya/wordpress/?p=16', 0, 'revision', '', 0),
(17, 1, '2013-12-28 11:44:08', '2013-12-28 16:44:08', 'http://lamp.cse.fau.edu/~jshakya/wordpress/wp-content/uploads/2013/12/copy-cropped-logoTemp.jpeg', 'copy-cropped-logoTemp.jpeg', '', 'inherit', 'open', 'open', '', 'copy-cropped-logotemp-jpeg', '', '', '2013-12-28 11:44:08', '2013-12-28 16:44:08', '', 0, 'http://lamp.cse.fau.edu/~jshakya/wordpress/wp-content/uploads/2013/12/copy-cropped-logoTemp.jpeg', 0, 'attachment', 'image/jpeg', 0),
(18, 1, '2013-12-28 11:59:30', '2013-12-28 16:59:30', '', 'logo', '', 'inherit', 'open', 'open', '', 'logo', '', '', '2013-12-28 11:59:30', '2013-12-28 16:59:30', '', 0, 'http://lamp.cse.fau.edu/~jshakya/wordpress/wp-content/uploads/2013/12/logo.png', 0, 'attachment', 'image/png', 0),
(19, 1, '2013-12-28 11:59:39', '2013-12-28 16:59:39', '', 'logo', '', 'inherit', 'open', 'open', '', 'logo-2', '', '', '2013-12-28 11:59:39', '2013-12-28 16:59:39', '', 0, 'http://lamp.cse.fau.edu/~jshakya/wordpress/wp-content/uploads/2013/12/logo1.png', 0, 'attachment', 'image/png', 0),
(20, 1, '2013-12-28 12:00:21', '2013-12-28 17:00:21', '', 'logo', '', 'inherit', 'open', 'open', '', 'logo-3', '', '', '2013-12-28 12:00:21', '2013-12-28 17:00:21', '', 0, 'http://lamp.cse.fau.edu/~jshakya/wordpress/wp-content/uploads/2013/12/logo2.png', 0, 'attachment', 'image/png', 0),
(21, 1, '2013-12-28 12:04:58', '2013-12-28 17:04:58', '', 'About Us', '', 'publish', 'open', 'open', '', 'about-us', '', '', '2013-12-28 12:04:58', '2013-12-28 17:04:58', '', 0, 'http://lamp.cse.fau.edu/~jshakya/wordpress/?page_id=21', 0, 'page', '', 0),
(22, 1, '2013-12-28 12:04:58', '2013-12-28 17:04:58', '', 'About Us', '', 'inherit', 'open', 'open', '', '21-revision-v1', '', '', '2013-12-28 12:04:58', '2013-12-28 17:04:58', '', 21, 'http://lamp.cse.fau.edu/~jshakya/wordpress/?p=22', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'first_name', ''),
(2, 1, 'last_name', ''),
(3, 1, 'nickname', 'jshakya'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp360_locks'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(15, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(16, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:8:"add-post";i:1;s:12:"add-post_tag";i:2;s:15:"add-post_format";}'),
(17, 1, 'wp_user-settings', 'libraryContent=browse'),
(18, 1, 'wp_user-settings-time', '1388249037');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'jshakya', '$P$Bwq.Gbio/W8mQKiY4SLG0yLUt4aEc40', 'jshakya', 'jebinshakya@gmail.com', '', '2013-12-27 15:01:29', '', 0, 'jshakya');
--
-- Database: `test_table`
--
CREATE DATABASE `test_table` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test_table`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
