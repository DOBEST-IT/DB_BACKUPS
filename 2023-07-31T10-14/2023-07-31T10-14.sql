/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: active_lessons
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `active_lessons` (
  `id_al` int(11) NOT NULL AUTO_INCREMENT,
  `teacher` int(11) DEFAULT NULL,
  `student` int(11) DEFAULT NULL,
  `subject` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `time` varchar(256) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`id_al`),
  KEY `teacher` (`teacher`),
  KEY `student` (`student`),
  KEY `subject` (`subject`),
  KEY `location` (`location`),
  CONSTRAINT `active_lessons_ibfk_1` FOREIGN KEY (`teacher`) REFERENCES `users` (`id_us`),
  CONSTRAINT `active_lessons_ibfk_2` FOREIGN KEY (`student`) REFERENCES `users` (`id_us`),
  CONSTRAINT `active_lessons_ibfk_3` FOREIGN KEY (`subject`) REFERENCES `subjects` (`id_su`),
  CONSTRAINT `active_lessons_ibfk_4` FOREIGN KEY (`location`) REFERENCES `locations` (`id_lo`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: active_students
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `active_students` (
  `id_st` int(11) DEFAULT NULL,
  `id_te` int(11) DEFAULT NULL,
  KEY `id_st` (`id_st`),
  KEY `id_te` (`id_te`),
  CONSTRAINT `active_students_ibfk_1` FOREIGN KEY (`id_st`) REFERENCES `users` (`id_us`),
  CONSTRAINT `active_students_ibfk_2` FOREIGN KEY (`id_te`) REFERENCES `users` (`id_us`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: analytics_site
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `analytics_site` (
  `id_ansi` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) DEFAULT '',
  `last_name` varchar(128) DEFAULT '',
  `email` varchar(128) NOT NULL,
  `note` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id_ansi`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: cl_us
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `cl_us` (
  `student` int(11) NOT NULL,
  `classroom` int(11) NOT NULL,
  KEY `student` (`student`),
  KEY `classroom` (`classroom`),
  CONSTRAINT `cl_us_ibfk_1` FOREIGN KEY (`student`) REFERENCES `users` (`id_us`),
  CONSTRAINT `cl_us_ibfk_2` FOREIGN KEY (`classroom`) REFERENCES `classroom_records` (`id_clre`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: classroom_records
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `classroom_records` (
  `id_clre` int(11) NOT NULL AUTO_INCREMENT,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `date` date NOT NULL,
  `teacher` int(11) DEFAULT NULL,
  `subject` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT '0',
  `maxCapacity` int(11) DEFAULT '1',
  PRIMARY KEY (`id_clre`),
  KEY `teacher` (`teacher`),
  KEY `subject` (`subject`),
  CONSTRAINT `classroom_records_ibfk_1` FOREIGN KEY (`teacher`) REFERENCES `users` (`id_us`),
  CONSTRAINT `classroom_records_ibfk_2` FOREIGN KEY (`subject`) REFERENCES `subjects` (`id_su`)
) ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: contracts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `contracts` (
  `id_co` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT '1',
  `user` int(11) NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `signed` varchar(64) DEFAULT NULL,
  `contract_number` int(11) DEFAULT NULL,
  `visible` int(11) DEFAULT '1',
  PRIMARY KEY (`id_co`),
  KEY `user` (`user`),
  CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id_us`)
) ENGINE = InnoDB AUTO_INCREMENT = 2271 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: genders
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `genders` (
  `id_ge` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_ge`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: invoice_types
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `invoice_types` (
  `id_inty` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_inty`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: invoices
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `invoices` (
  `id_in` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `visible` int(11) DEFAULT '1',
  PRIMARY KEY (`id_in`),
  KEY `user` (`user`),
  KEY `type` (`type`),
  CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id_us`),
  CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`type`) REFERENCES `invoice_types` (`id_inty`)
) ENGINE = InnoDB AUTO_INCREMENT = 1091 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: le_us
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `le_us` (
  `id_leus` int(11) NOT NULL AUTO_INCREMENT,
  `student` int(11) DEFAULT NULL,
  `teacher` int(11) DEFAULT NULL,
  `lesson` int(11) NOT NULL,
  PRIMARY KEY (`id_leus`),
  KEY `student` (`student`),
  KEY `teacher` (`teacher`),
  KEY `lesson` (`lesson`),
  CONSTRAINT `le_us_ibfk_1` FOREIGN KEY (`student`) REFERENCES `users` (`id_us`),
  CONSTRAINT `le_us_ibfk_2` FOREIGN KEY (`teacher`) REFERENCES `users` (`id_us`),
  CONSTRAINT `le_us_ibfk_3` FOREIGN KEY (`lesson`) REFERENCES `lessons` (`id_le`)
) ENGINE = InnoDB AUTO_INCREMENT = 2771 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: lessons
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `lessons` (
  `id_le` int(11) NOT NULL AUTO_INCREMENT,
  `subject` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `start` time DEFAULT '00:00:00',
  `end` time DEFAULT '00:00:00',
  `length` float DEFAULT NULL,
  `date` date NOT NULL,
  `type` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `isPaid` tinyint(1) DEFAULT '0',
  `description` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `last_update` datetime NOT NULL,
  `teacher_pay` int(11) DEFAULT '0',
  `visible` int(11) DEFAULT '1',
  PRIMARY KEY (`id_le`),
  KEY `subject` (`subject`),
  KEY `location` (`location`),
  KEY `type` (`type`),
  KEY `state` (`state`),
  CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`subject`) REFERENCES `subjects` (`id_su`),
  CONSTRAINT `lessons_ibfk_2` FOREIGN KEY (`location`) REFERENCES `locations` (`id_lo`),
  CONSTRAINT `lessons_ibfk_3` FOREIGN KEY (`type`) REFERENCES `types` (`id_ty`),
  CONSTRAINT `lessons_ibfk_4` FOREIGN KEY (`state`) REFERENCES `states` (`id_sa`)
) ENGINE = InnoDB AUTO_INCREMENT = 3081 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: locations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `locations` (
  `id_lo` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_lo`)
) ENGINE = InnoDB AUTO_INCREMENT = 91 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: monthly_pay
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `monthly_pay` (
  `id_mopa` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(32) NOT NULL,
  `user` int(11) NOT NULL,
  `number` int(11) DEFAULT '0',
  `state` varchar(64) DEFAULT 'Nezaplaceno',
  `salary` double DEFAULT NULL,
  PRIMARY KEY (`id_mopa`),
  KEY `user` (`user`),
  CONSTRAINT `monthly_pay_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id_us`)
) ENGINE = InnoDB AUTO_INCREMENT = 541 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: questions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `questions` (
  `id_qu` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lessons` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(64) NOT NULL,
  `location` int(64) NOT NULL,
  `achieve` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `howManyLessons` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `addInfo` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_qu`)
) ENGINE = InnoDB AUTO_INCREMENT = 21 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: regular_lessons
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `regular_lessons` (
  `id_rele` int(11) NOT NULL AUTO_INCREMENT,
  `student` int(11) DEFAULT NULL,
  `teacher` int(11) DEFAULT NULL,
  `subject` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `length` int(64) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `description` varchar(1024) NOT NULL,
  `price` int(11) NOT NULL,
  `day` varchar(32) NOT NULL,
  `active` int(11) DEFAULT '1',
  `teacher_pay` int(11) DEFAULT '0',
  PRIMARY KEY (`id_rele`),
  KEY `student` (`student`),
  KEY `teacher` (`teacher`),
  KEY `subject` (`subject`),
  KEY `location` (`location`),
  KEY `type` (`type`),
  CONSTRAINT `regular_lessons_ibfk_1` FOREIGN KEY (`student`) REFERENCES `users` (`id_us`),
  CONSTRAINT `regular_lessons_ibfk_2` FOREIGN KEY (`teacher`) REFERENCES `users` (`id_us`),
  CONSTRAINT `regular_lessons_ibfk_3` FOREIGN KEY (`subject`) REFERENCES `subjects` (`id_su`),
  CONSTRAINT `regular_lessons_ibfk_4` FOREIGN KEY (`location`) REFERENCES `locations` (`id_lo`),
  CONSTRAINT `regular_lessons_ibfk_5` FOREIGN KEY (`type`) REFERENCES `types` (`id_ty`)
) ENGINE = InnoDB AUTO_INCREMENT = 91 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: regularclassroom
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `regularclassroom` (
  `id_re` int(11) NOT NULL AUTO_INCREMENT,
  `teacher` int(11) NOT NULL,
  `subject` varchar(128) DEFAULT NULL,
  `note` varchar(256) DEFAULT NULL,
  `capacity` int(11) DEFAULT '0',
  `maxCapacity` int(11) DEFAULT '1',
  `day` int(11) DEFAULT NULL,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  PRIMARY KEY (`id_re`),
  KEY `teacher` (`teacher`),
  CONSTRAINT `regularclassroom_ibfk_1` FOREIGN KEY (`teacher`) REFERENCES `users` (`id_us`)
) ENGINE = InnoDB AUTO_INCREMENT = 122 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: roles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `roles` (
  `id_ro` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_ro`)
) ENGINE = InnoDB AUTO_INCREMENT = 21 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: salaries
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `salaries` (
  `id_sa` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `zs1On` int(11) DEFAULT NULL,
  `zs2On` int(11) DEFAULT NULL,
  `ssOn` int(11) DEFAULT NULL,
  `vsOn` int(11) DEFAULT NULL,
  `pink` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NE',
  `hours_per_week` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `time_possibilities` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `contract_signed` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NE',
  `contract_number` int(11) NOT NULL,
  `bank_number` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `arrival` date NOT NULL,
  `notes` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `zs1Off` int(11) DEFAULT NULL,
  `zs2Off` int(11) DEFAULT NULL,
  `ssOff` int(11) DEFAULT NULL,
  `vsOff` int(11) DEFAULT NULL,
  `contractStart` date DEFAULT NULL,
  `contractEnd` date DEFAULT NULL,
  `hasKeys` int(11) DEFAULT '0',
  PRIMARY KEY (`id_sa`)
) ENGINE = InnoDB AUTO_INCREMENT = 1311 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: states
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `states` (
  `id_sa` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_sa`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: students_info
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `students_info` (
  `id_stin` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `sent` float DEFAULT NULL,
  `spent` float DEFAULT NULL,
  `school` int(11) DEFAULT NULL,
  `note` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regular_lessons` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_active` int(11) DEFAULT NULL,
  `symbol` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prepaid` float DEFAULT NULL,
  `owned` float DEFAULT NULL,
  PRIMARY KEY (`id_stin`),
  KEY `user` (`user`),
  KEY `school` (`school`),
  CONSTRAINT `students_info_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id_us`),
  CONSTRAINT `students_info_ibfk_2` FOREIGN KEY (`school`) REFERENCES `types` (`id_ty`)
) ENGINE = InnoDB AUTO_INCREMENT = 3111 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: su_us
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `su_us` (
  `id_ss` int(11) NOT NULL AUTO_INCREMENT,
  `id_us` int(11) NOT NULL,
  `id_su` int(11) NOT NULL,
  `level` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ZŠ1',
  `how` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Online',
  `location` int(11) NOT NULL,
  PRIMARY KEY (`id_ss`),
  KEY `id_us` (`id_us`),
  KEY `id_su` (`id_su`),
  KEY `location` (`location`),
  CONSTRAINT `su_us_ibfk_1` FOREIGN KEY (`id_us`) REFERENCES `users` (`id_us`),
  CONSTRAINT `su_us_ibfk_2` FOREIGN KEY (`id_su`) REFERENCES `subjects` (`id_su`),
  CONSTRAINT `su_us_ibfk_3` FOREIGN KEY (`location`) REFERENCES `locations` (`id_lo`)
) ENGINE = InnoDB AUTO_INCREMENT = 4061 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: subjects
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `subjects` (
  `id_su` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_su`)
) ENGINE = InnoDB AUTO_INCREMENT = 281 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: types
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `types` (
  `id_ty` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT '200',
  PRIMARY KEY (`id_ty`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `users` (
  `id_us` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` int(11) NOT NULL,
  `salary` int(11) DEFAULT NULL,
  `canLog` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `gender` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_us`),
  KEY `role` (`role`),
  KEY `salary` (`salary`),
  KEY `gender` (`gender`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id_ro`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`salary`) REFERENCES `salaries` (`id_sa`),
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`gender`) REFERENCES `genders` (`id_ge`),
  CONSTRAINT `users_ibfk_4` FOREIGN KEY (`gender`) REFERENCES `genders` (`id_ge`)
) ENGINE = InnoDB AUTO_INCREMENT = 4821 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: active_lessons
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: active_students
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: analytics_site
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cl_us
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: classroom_records
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: contracts
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: genders
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: invoice_types
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: invoices
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: le_us
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: lessons
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: locations
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: monthly_pay
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: questions
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: regular_lessons
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: regularclassroom
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: roles
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: salaries
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: states
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: students_info
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: su_us
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: subjects
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: types
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: users
# ------------------------------------------------------------


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
