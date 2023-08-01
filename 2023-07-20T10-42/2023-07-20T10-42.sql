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
) ENGINE = InnoDB AUTO_INCREMENT = 2171 DEFAULT CHARSET = utf8;

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
) ENGINE = InnoDB AUTO_INCREMENT = 481 DEFAULT CHARSET = utf8;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1261 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3911 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4771 DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: active_lessons
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: active_students
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: analytics_site
# ------------------------------------------------------------

INSERT INTO
  `analytics_site` (
    `id_ansi`,
    `first_name`,
    `last_name`,
    `email`,
    `note`
  )
VALUES
  (
    1,
    'Test Insomnie',
    'Test',
    'test@test.cz',
    'Testovací zpráva'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: cl_us
# ------------------------------------------------------------

INSERT INTO
  `cl_us` (`student`, `classroom`)
VALUES
  (911, 11);
INSERT INTO
  `cl_us` (`student`, `classroom`)
VALUES
  (911, 11);
INSERT INTO
  `cl_us` (`student`, `classroom`)
VALUES
  (911, 1);
INSERT INTO
  `cl_us` (`student`, `classroom`)
VALUES
  (911, 1);
INSERT INTO
  `cl_us` (`student`, `classroom`)
VALUES
  (141, 1);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: classroom_records
# ------------------------------------------------------------

INSERT INTO
  `classroom_records` (
    `id_clre`,
    `start`,
    `end`,
    `date`,
    `teacher`,
    `subject`,
    `capacity`,
    `maxCapacity`
  )
VALUES
  (1, '09:01:00', '10:30:00', '2022-12-18', 921, 1, 5, 1);
INSERT INTO
  `classroom_records` (
    `id_clre`,
    `start`,
    `end`,
    `date`,
    `teacher`,
    `subject`,
    `capacity`,
    `maxCapacity`
  )
VALUES
  (11, '09:00:00', '10:00:00', '2022-12-21', 921, 1, 5, 1);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: contracts
# ------------------------------------------------------------

INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (21, 1, 921, '2022-05-20', '2022-08-18', 'NE', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (31, 1, 921, '2022-11-25', '2023-01-23', 'ANO', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    41,
    1,
    921,
    '2022-10-26',
    '2023-01-23',
    'ANO - prozatím nemáme',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    51,
    2,
    921,
    '2022-11-24',
    '2023-01-23',
    'ANO - prozatím nemáme',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    61,
    1,
    2651,
    '2022-08-10',
    '2023-08-10',
    'Invalid date',
    168,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    71,
    2,
    2651,
    '2023-01-01',
    '2023-12-13',
    'ANO - máme',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    81,
    1,
    2661,
    '2022-09-08',
    '2023-09-08',
    'Invalid date',
    169,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (91, 2, 2661, '2023-01-01', '2023-12-13', 'NE', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (92, 1, 2151, '2022-08-16', '2023-08-16', 'Ano', 158, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (112, 1, 72, '2022-03-10', '2023-03-10', 'Ano', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (122, 1, 77, '2022-03-24', '2023-03-24', 'Ano', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    132,
    2,
    77,
    '2022-04-01',
    '2022-12-31',
    'ANO - máme',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    142,
    2,
    77,
    '2023-01-01',
    '2023-12-31',
    'ANO - máme',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    172,
    1,
    2672,
    '2022-09-20',
    '2023-09-20',
    'Invalid date',
    172,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (182, 2, 2672, '2023-01-31', '2023-01-31', 'NE', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    192,
    1,
    2682,
    '2023-01-31',
    '2023-01-31',
    'Invalid date',
    -1,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (202, 2, 2682, '2023-01-31', '2023-01-31', 'NE', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    212,
    1,
    2692,
    '2022-09-28',
    '2023-09-28',
    'Invalid date',
    174,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (222, 2, 2692, '2023-01-31', '2023-01-31', 'NE', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (232, 1, 26, '2022-04-28', '2023-04-28', 'Ano', 9, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (272, 1, 28, '2022-04-28', '2023-04-28', 'Ano', 6, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (282, 1, 2702, '2022-09-19', '2023-09-19', 'Ano', 175, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (292, 2, 2702, '2023-02-01', '2023-02-01', 'NE', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (302, 1, 2712, '2022-10-16', '2023-10-16', 'Ano', 176, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    312,
    2,
    2712,
    '2023-01-01',
    '2023-01-31',
    'ANO - máme',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (322, 1, 2722, '2022-10-24', '2023-10-24', 'Ano', 178, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (332, 2, 2722, '2023-01-01', '2023-01-31', 'NE', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (342, 1, 2732, '2022-09-25', '2023-09-25', 'Ano', 179, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    352,
    2,
    2732,
    '2023-01-01',
    '2023-01-31',
    'ANO - máme',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    362,
    1,
    2742,
    '2022-09-25',
    '2023-09-25',
    'Fakturuje',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (382, 1, 3062, '2023-01-23', '2024-01-23', 'Ano', 215, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (392, 2, 3062, '2023-02-07', '2023-02-07', 'Nemá', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (402, 1, 3072, '2022-11-01', '2023-11-01', 'Ano', 181, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (412, 2, 3072, '2023-01-01', '2023-12-31', 'ANO', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (422, 1, 3082, '2022-09-23', '2023-09-23', 'Ano', 182, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (432, 2, 3082, '2023-01-01', '2023-12-31', 'ANO', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (442, 1, 3092, '2022-10-24', '2023-10-24', 'Ano', 183, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (452, 2, 3092, '2023-01-01', '2023-12-31', 'ANO', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (482, 1, 3112, '2023-01-23', '2024-01-23', 'Ano', 211, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    492,
    2,
    3112,
    '2023-02-27',
    '2023-02-27',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (502, 1, 3122, '2023-02-08', '2024-02-08', 'Ano', 224, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (512, 2, 3122, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (522, 1, 3132, '2023-01-19', '2024-01-19', 'Ano', 209, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    532,
    2,
    3132,
    '2023-02-27',
    '2023-02-27',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (551, 1, 3951, '2022-11-08', '2023-11-08', 'Ano', 184, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (581, 2, 3951, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (591, 1, 3961, '2022-11-15', '2023-11-15', 'Ano', 185, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (601, 2, 3961, '2023-03-23', '2023-03-23', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (611, 1, 3971, '2022-11-15', '2023-11-15', 'Ano', 186, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (621, 2, 3971, '2023-03-23', '2023-03-23', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (631, 1, 3981, '2022-11-24', '2023-11-24', 'Ano', 187, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    641,
    2,
    3981,
    '2023-03-23',
    '2023-03-23',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (651, 1, 3991, '2022-11-23', '2023-11-23', 'Ano', 188, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    661,
    2,
    3991,
    '2023-03-23',
    '2023-03-23',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (671, 1, 4001, '2022-11-30', '2023-11-30', 'Ano', 189, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    681,
    2,
    4001,
    '2023-03-23',
    '2023-03-23',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (691, 1, 4011, '2022-11-23', '2023-11-23', 'Ano', 190, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (701, 2, 4011, '2023-03-24', '2023-03-24', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (711, 1, 4021, '2022-12-08', '2023-12-08', 'Ano', 191, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    721,
    2,
    4021,
    '2023-03-24',
    '2023-03-24',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (731, 1, 4031, '2022-12-08', '2023-12-08', 'Ano', 192, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    741,
    2,
    4031,
    '2023-03-24',
    '2023-03-24',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (751, 1, 4041, '2022-12-05', '2023-12-05', 'Ano', 193, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (761, 2, 4041, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (771, 1, 4051, '2022-11-30', '2023-11-30', 'Ano', 194, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (781, 2, 4051, '2023-03-24', '2023-03-24', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (791, 1, 4061, '2022-11-15', '2023-11-15', 'Ano', 195, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    801,
    2,
    4061,
    '2023-03-24',
    '2023-03-24',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (811, 1, 4071, '2022-11-15', '2023-11-15', 'Ano', 197, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    821,
    2,
    4071,
    '2023-03-24',
    '2023-03-24',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (831, 1, 4081, '2022-11-23', '2023-11-23', 'Ano', 198, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (841, 2, 4081, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (851, 1, 4091, '2022-11-15', '2023-11-15', 'Ano', 199, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    861,
    2,
    4091,
    '2023-03-24',
    '2023-03-24',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (871, 1, 4101, '2023-01-11', '2024-01-11', 'Ano', 201, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (881, 2, 4101, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (891, 1, 4111, '2023-01-12', '2024-01-12', 'Ano', 202, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    901,
    2,
    4111,
    '2023-03-24',
    '2023-03-24',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (911, 1, 4121, '2023-01-12', '2024-01-12', 'Ano', 203, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    921,
    2,
    4121,
    '2023-03-26',
    '2023-03-26',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (931, 1, 4131, '2023-01-15', '2024-01-15', 'Ano', 204, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    941,
    2,
    4131,
    '2023-03-26',
    '2023-03-26',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (951, 1, 4141, '2023-01-15', '2024-01-15', 'Ano', 205, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (961, 2, 4141, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (971, 1, 4151, '2023-01-19', '2024-01-19', 'Ano', 206, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    981,
    2,
    4151,
    '2023-03-26',
    '2023-03-26',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (991, 1, 4161, '2023-01-19', '2024-01-19', 'Ano', 207, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1001, 2, 4161, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1011,
    1,
    4171,
    '2023-01-22',
    '2024-01-22',
    'Ano',
    208,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1021,
    2,
    4171,
    '2023-03-27',
    '2023-03-27',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1031,
    1,
    4181,
    '2023-01-19',
    '2024-01-19',
    'Ano',
    209,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1041,
    2,
    4181,
    '2023-03-29',
    '2023-03-29',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1051,
    1,
    4191,
    '2023-01-23',
    '2024-01-23',
    'Ano',
    210,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1061,
    2,
    4191,
    '2023-03-29',
    '2023-03-29',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1071,
    1,
    4201,
    '2023-01-22',
    '2024-01-22',
    'Ano',
    212,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1081,
    2,
    4201,
    '2023-03-29',
    '2023-03-29',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1091,
    1,
    4211,
    '2022-12-05',
    '2023-12-05',
    'Ano',
    213,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1101, 2, 4211, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1111,
    1,
    4221,
    '2023-01-23',
    '2024-01-23',
    'Ano',
    214,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1121, 2, 4221, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1131,
    1,
    4231,
    '2023-03-30',
    '2023-03-30',
    'Fakturujeme',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1141,
    2,
    4231,
    '2023-03-30',
    '2023-03-30',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1151,
    1,
    4241,
    '2023-02-07',
    '2024-02-07',
    'Ano',
    217,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1161, 2, 4241, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1171,
    1,
    4251,
    '2023-02-07',
    '2024-02-07',
    'Ano',
    218,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1181,
    2,
    4251,
    '2023-03-30',
    '2023-03-30',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1191,
    1,
    4261,
    '2023-02-03',
    '2024-02-03',
    'Ano',
    219,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1201, 2, 4261, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1211,
    1,
    4271,
    '2022-11-15',
    '2023-11-15',
    'Ano',
    220,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1221,
    2,
    4271,
    '2023-03-31',
    '2023-03-31',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1231,
    1,
    4281,
    '2023-01-31',
    '2024-01-31',
    'Ano',
    221,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1241, 2, 4281, '2023-03-31', '2023-03-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1251,
    1,
    4291,
    '2023-03-01',
    '2024-03-01',
    'Ano',
    223,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1261,
    2,
    4291,
    '2023-03-31',
    '2023-03-31',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1271,
    1,
    4301,
    '2023-01-23',
    '2024-01-23',
    'Ano',
    225,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1281,
    2,
    4301,
    '2023-01-31',
    '2023-01-31',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1291,
    1,
    4311,
    '2023-02-15',
    '2024-02-15',
    'Ano',
    226,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1301, 2, 4311, '2023-03-31', '2023-03-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1311,
    1,
    4321,
    '2023-02-20',
    '2024-02-20',
    'Ano',
    227,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1321,
    2,
    4321,
    '2023-03-31',
    '2023-03-31',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1331,
    1,
    4331,
    '2023-02-16',
    '2024-02-16',
    'Ano',
    228,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1341,
    2,
    4331,
    '2023-03-31',
    '2023-03-31',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1351,
    1,
    4341,
    '2023-02-13',
    '2024-02-13',
    'Ano',
    229,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1361,
    2,
    4341,
    '2023-03-31',
    '2023-03-31',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1371,
    1,
    4351,
    '2023-02-15',
    '2024-02-15',
    'Ano',
    230,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1381, 2, 4351, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1391,
    1,
    4361,
    '2023-03-31',
    '2023-03-31',
    'Fakturujeme',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1401,
    2,
    4361,
    '2023-03-31',
    '2023-03-31',
    'Fakturujeme',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1411,
    1,
    4371,
    '2023-02-21',
    '2023-12-31',
    'Ano',
    232,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1421, 2, 4371, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1431,
    1,
    4381,
    '2023-02-21',
    '2024-02-21',
    'Ano',
    233,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1441,
    2,
    4381,
    '2023-03-31',
    '2023-03-31',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1451,
    1,
    4391,
    '2023-02-16',
    '2024-02-16',
    'Ano',
    234,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1461,
    2,
    4391,
    '2023-04-03',
    '2023-04-03',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1471,
    1,
    4401,
    '2023-02-07',
    '2024-02-07',
    'Ano',
    235,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1481,
    2,
    4401,
    '2023-04-04',
    '2023-04-04',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1491,
    1,
    4411,
    '2023-03-07',
    '2023-12-31',
    'Ano',
    236,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1501,
    2,
    4411,
    '2023-04-04',
    '2023-04-04',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1511,
    1,
    4421,
    '2023-03-01',
    '2023-12-31',
    'Ano',
    237,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1521, 2, 4421, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1531,
    1,
    4431,
    '2023-02-23',
    '2024-02-23',
    'Ano',
    238,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1541,
    2,
    4431,
    '2023-04-04',
    '2023-04-04',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1551,
    1,
    4441,
    '2023-03-01',
    '2023-12-31',
    'Ano',
    239,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1561,
    2,
    4441,
    '2023-04-08',
    '2023-04-08',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1571,
    1,
    4451,
    '2023-01-25',
    '2024-01-25',
    'Ano',
    240,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1581, 2, 4451, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1591,
    1,
    4461,
    '2023-02-03',
    '2024-02-03',
    'Ano',
    241,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1601, 2, 4461, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1611,
    1,
    4471,
    '2023-03-06',
    '2024-03-06',
    'Ano',
    242,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1621,
    2,
    4471,
    '2023-04-08',
    '2023-04-08',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1631,
    1,
    4481,
    '2023-03-07',
    '2023-12-31',
    'Ano',
    243,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1641,
    2,
    4481,
    '2023-04-08',
    '2023-04-08',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1651,
    1,
    4491,
    '2023-04-08',
    '2023-04-08',
    'Ano',
    244,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1661, 2, 4491, '2023-04-08', '2023-04-08', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1671,
    1,
    4501,
    '2023-04-08',
    '2023-04-08',
    'Ano',
    245,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1681, 2, 4501, '2023-04-08', '2023-04-08', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1691,
    1,
    4511,
    '2023-04-08',
    '2023-04-08',
    'Ano',
    246,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1701, 2, 4511, '2023-04-08', '2023-04-08', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1711,
    1,
    4521,
    '2023-03-13',
    '2023-12-31',
    'Ano',
    247,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1721, 2, 4521, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1731,
    1,
    4531,
    '2023-03-22',
    '2023-12-31',
    'Ano',
    248,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1741,
    2,
    4531,
    '2023-04-19',
    '2023-04-19',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1751,
    1,
    4541,
    '2023-03-22',
    '2023-12-31',
    'Ano',
    249,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1761,
    2,
    4541,
    '2023-04-19',
    '2023-04-19',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1771,
    1,
    4551,
    '2023-03-20',
    '2023-12-31',
    'Ano',
    250,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1781, 2, 4551, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1791,
    1,
    4561,
    '2023-03-01',
    '2023-12-31',
    'Ano',
    251,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1801,
    2,
    4561,
    '2023-04-20',
    '2023-04-20',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1811,
    1,
    4571,
    '2023-02-20',
    '2024-02-20',
    'Ano',
    252,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1821,
    2,
    4571,
    '2023-04-20',
    '2023-04-20',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1831,
    1,
    4581,
    '2023-04-01',
    '2023-12-31',
    'Ano',
    253,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1841,
    2,
    4581,
    '2023-04-20',
    '2023-04-20',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1851,
    1,
    4591,
    '2023-03-14',
    '2023-12-31',
    'Ano',
    254,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1861,
    2,
    4591,
    '2023-04-20',
    '2023-04-20',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1871,
    1,
    4621,
    '2023-03-01',
    '2023-12-31',
    'Ano',
    255,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1881,
    2,
    4621,
    '2023-05-04',
    '2023-05-04',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1891,
    1,
    4631,
    '2023-03-01',
    '2023-12-31',
    'Ano',
    256,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1901,
    2,
    4631,
    '2023-05-04',
    '2023-05-04',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1911,
    1,
    4641,
    '2023-05-04',
    '2023-05-04',
    'Ano',
    257,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1921,
    2,
    4641,
    '2023-05-04',
    '2023-05-04',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1931,
    1,
    4651,
    '2023-05-04',
    '2023-05-04',
    'Fakturujeme',
    258,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1941,
    2,
    4651,
    '2023-05-04',
    '2023-05-04',
    'Fakturujeme',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1951,
    1,
    4661,
    '2023-05-31',
    '2023-05-31',
    'Fakturujeme',
    259,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1961,
    2,
    4661,
    '2023-05-31',
    '2023-05-31',
    'Fakturujeme',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1971,
    1,
    4671,
    '2023-03-13',
    '2023-12-31',
    'Ano',
    260,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (1981, 2, 4671, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    1991,
    1,
    4681,
    '2023-04-20',
    '2023-12-31',
    'Ano',
    261,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (2001, 2, 4681, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    2011,
    1,
    4691,
    '2023-05-01',
    '2023-12-31',
    'Ano',
    262,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    2021,
    2,
    4691,
    '2023-05-31',
    '2023-05-31',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    2031,
    1,
    4701,
    '2023-05-01',
    '2023-12-31',
    'Ano',
    263,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    2041,
    2,
    4701,
    '2023-05-31',
    '2023-05-31',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    2051,
    1,
    4711,
    '2023-04-21',
    '2023-12-31',
    'Ano',
    264,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    2061,
    2,
    4711,
    '2023-05-31',
    '2023-05-31',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    2071,
    1,
    4721,
    '2023-04-20',
    '2023-12-31',
    'Ano',
    265,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    2081,
    2,
    4721,
    '2023-05-31',
    '2023-05-31',
    'Nechce',
    0,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    2091,
    1,
    4731,
    '2023-06-01',
    '2024-06-30',
    'Ano',
    266,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (2101, 2, 4731, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    2111,
    1,
    4741,
    '2023-06-01',
    '2024-06-30',
    'Ano',
    267,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (2121, 2, 4741, '2023-01-01', '2023-12-31', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    2131,
    1,
    4751,
    '2023-06-01',
    '2024-06-30',
    'Ano',
    268,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (2141, 2, 4751, '2023-06-30', '2023-06-30', 'Chce', 0, 1);
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    2151,
    1,
    4761,
    '2023-05-12',
    '2023-12-31',
    'Ano',
    269,
    1
  );
INSERT INTO
  `contracts` (
    `id_co`,
    `type`,
    `user`,
    `start`,
    `end`,
    `signed`,
    `contract_number`,
    `visible`
  )
VALUES
  (
    2161,
    2,
    4761,
    '2023-06-30',
    '2023-06-30',
    'Nechce',
    0,
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: genders
# ------------------------------------------------------------

INSERT INTO
  `genders` (`id_ge`, `title`)
VALUES
  (1, 'Muž');
INSERT INTO
  `genders` (`id_ge`, `title`)
VALUES
  (2, 'Žena');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: invoice_types
# ------------------------------------------------------------

INSERT INTO
  `invoice_types` (`id_inty`, `name`)
VALUES
  (1, 'Výplata');
INSERT INTO
  `invoice_types` (`id_inty`, `name`)
VALUES
  (2, 'Vrácení');
INSERT INTO
  `invoice_types` (`id_inty`, `name`)
VALUES
  (3, 'Přišlo');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: invoices
# ------------------------------------------------------------

INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (791, '30230573', '', 350, 3042, 3, '2023-05-09', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (801, '302305113', '', 350, 3042, 3, '2023-05-12', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (811, '302305197', '', 350, 3042, 3, '2023-05-23', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (821, '30230631', '', 350, 3042, 3, '2023-06-04', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (921, '30230488', '', 350, 3352, 3, '2023-04-06', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (931, '302304127', '', 1050, 3032, 3, '2023-04-11', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (941, '302304277', '', 3150, 3032, 3, '2023-04-26', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (951, '30230585', '', 438, 3352, 3, '2023-05-10', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (961, '20230204', '', 350, 3042, 3, '2023-02-08', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (971, '30230288', '', 350, 3042, 3, '2023-02-13', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (981, '302302125', '', 350, 3042, 3, '2023-02-17', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (991, '302302196', '', 350, 3042, 3, '2023-02-23', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (1001, '302303121', '', 350, 3042, 3, '2023-03-10', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (1011, '30230412', '', 350, 3042, 3, '2023-04-01', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (1021, '30230558', '', 350, 3042, 3, '2023-05-07', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (1041, '202301143', '', 525, 3032, 3, '2023-02-01', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (1051, '30230251', '', 1050, 3032, 3, '2023-02-08', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (1061, '302302247', '', 1050, 3032, 3, '2023-02-28', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (1071, '30230396', '', 1050, 3032, 3, '2023-03-08', 1);
INSERT INTO
  `invoices` (
    `id_in`,
    `title`,
    `description`,
    `amount`,
    `user`,
    `type`,
    `date`,
    `visible`
  )
VALUES
  (1081, '302303260', '', 525, 3032, 3, '2023-03-21', 1);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: le_us
# ------------------------------------------------------------

INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (1921, 1411, 59, 2181);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (1931, 1241, 26, 2191);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (1952, 3042, 62, 2232);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (1962, 3042, 62, 2242);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (1972, 3042, 3122, 2252);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (1982, 3042, 3122, 2262);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2111, 3042, 3122, 2391);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2271, 3042, 3122, 2581);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2311, 3352, 4041, 2621);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2331, 3352, 4041, 2641);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2341, 3352, 4041, 2651);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2351, 3352, 4041, 2661);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2401, 3032, 3112, 2711);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2411, 3032, 3112, 2721);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2421, 3032, 3112, 2731);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2431, 3032, 3112, 2741);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2441, 3032, 3112, 2751);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2451, 3032, 3112, 2761);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2461, 3032, 3112, 2771);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2471, 3032, 3112, 2781);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2481, 3032, 3112, 2791);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2491, 3032, 3112, 2801);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2501, 3032, 3112, 2811);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2511, 3032, 3112, 2821);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2521, 3032, 3112, 2831);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2631, 3352, 4041, 2941);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2651, 3032, 3112, 2961);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2661, 3032, 3112, 2971);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2671, 3032, 3112, 2981);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2691, 3352, 4041, 3001);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2701, 3352, 4041, 3011);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2751, 911, 921, 3061);
INSERT INTO
  `le_us` (`id_leus`, `student`, `teacher`, `lesson`)
VALUES
  (2761, 911, 921, 3071);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: lessons
# ------------------------------------------------------------

INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2181,
    1,
    1,
    '09:00:00',
    '10:00:00',
    0,
    '2023-01-07',
    1,
    350,
    1,
    0,
    '',
    '2023-01-02 11:33:30',
    0,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2191,
    1,
    1,
    '18:00:00',
    '18:45:00',
    1,
    '2023-01-02',
    1,
    350,
    2,
    0,
    '',
    '2023-01-30 06:29:47',
    0,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2232,
    0,
    2,
    '14:00:00',
    '15:00:00',
    1,
    '2023-02-08',
    1,
    350,
    2,
    0,
    '',
    '0000-00-00 00:00:00',
    0,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2242,
    0,
    2,
    '14:00:00',
    '15:00:00',
    1,
    '2023-02-11',
    1,
    350,
    2,
    0,
    '',
    '0000-00-00 00:00:00',
    0,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2252,
    0,
    2,
    '15:30:00',
    '16:30:00',
    1,
    '0000-00-00',
    1,
    350,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    0,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2262,
    0,
    2,
    '15:30:00',
    '16:30:00',
    1,
    '2023-02-21',
    1,
    350,
    2,
    0,
    '',
    '0000-00-00 00:00:00',
    0,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2391,
    0,
    2,
    '15:30:00',
    '16:30:00',
    1,
    '2023-03-07',
    1,
    350,
    2,
    0,
    '',
    '0000-00-00 00:00:00',
    200,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2501,
    1,
    1,
    '09:00:00',
    '10:00:00',
    1,
    '2023-05-27',
    1,
    350,
    1,
    0,
    '',
    '2023-05-27 12:18:13',
    0,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2511,
    1,
    1,
    '09:00:00',
    '10:00:00',
    1,
    '2023-05-27',
    1,
    350,
    1,
    0,
    '',
    '2023-05-27 12:19:55',
    0,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2521,
    1,
    1,
    '09:00:00',
    '10:00:00',
    1,
    '2023-05-27',
    1,
    350,
    1,
    1,
    '',
    '2023-05-27 12:22:32',
    0,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2581,
    31,
    2,
    '15:30:00',
    '16:30:00',
    1,
    '0000-00-00',
    1,
    350,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    200,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2621,
    31,
    2,
    '16:00:00',
    '17:00:00',
    1,
    '2023-02-28',
    1,
    350,
    2,
    0,
    '',
    '2023-06-14 07:38:32',
    200,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2641,
    31,
    2,
    '16:00:00',
    '17:00:00',
    1,
    '2023-03-07',
    1,
    350,
    2,
    0,
    '',
    '2023-06-14 07:43:32',
    200,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2651,
    31,
    2,
    '16:00:00',
    '17:00:00',
    1,
    '2023-03-21',
    1,
    350,
    2,
    0,
    '',
    '2023-06-07 02:19:47',
    200,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2661,
    31,
    2,
    '16:00:00',
    '17:00:00',
    1,
    '2023-03-28',
    1,
    350,
    2,
    0,
    '',
    '2023-06-14 07:21:01',
    200,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2711,
    31,
    1,
    '19:00:00',
    '20:00:00',
    1,
    '2023-02-05',
    1,
    525,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    225,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2721,
    31,
    1,
    '19:00:00',
    '20:00:00',
    1,
    '2023-02-08',
    1,
    525,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    225,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2731,
    31,
    1,
    '19:00:00',
    '20:00:00',
    1,
    '2023-02-20',
    1,
    525,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    225,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2741,
    31,
    1,
    '19:00:00',
    '20:00:00',
    1,
    '2023-02-22',
    1,
    525,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    225,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2751,
    31,
    1,
    '19:00:00',
    '20:00:00',
    1,
    '2023-02-27',
    1,
    525,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    225,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2761,
    31,
    1,
    '19:00:00',
    '20:00:00',
    1,
    '2023-03-01',
    1,
    525,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    225,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2771,
    31,
    1,
    '19:00:00',
    '20:00:00',
    1,
    '0000-00-00',
    1,
    525,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    225,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2781,
    31,
    1,
    '19:00:00',
    '20:00:00',
    1,
    '2023-03-08',
    1,
    525,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    225,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2791,
    31,
    1,
    '19:00:00',
    '20:00:00',
    1,
    '2023-03-15',
    1,
    525,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    225,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2801,
    31,
    1,
    '19:00:00',
    '20:00:00',
    1,
    '2023-03-19',
    1,
    525,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    225,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2811,
    31,
    1,
    '19:00:00',
    '20:00:00',
    1,
    '2023-03-26',
    1,
    525,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    225,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2821,
    31,
    1,
    '19:00:00',
    '20:00:00',
    1,
    '2023-03-29',
    1,
    525,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    225,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2831,
    31,
    1,
    '19:00:00',
    '20:00:00',
    1,
    '2023-04-02',
    1,
    525,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    225,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2941,
    31,
    2,
    '16:00:00',
    '16:45:00',
    0.75,
    '2023-04-20',
    1,
    350,
    2,
    0,
    '',
    '2023-06-14 09:10:02',
    200,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2961,
    31,
    1,
    '19:00:00',
    '20:00:00',
    1,
    '2023-04-11',
    1,
    525,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    225,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2971,
    31,
    1,
    '19:00:00',
    '20:00:00',
    1,
    '2023-04-12',
    1,
    525,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    225,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    2981,
    31,
    1,
    '19:00:00',
    '20:00:00',
    1,
    '2023-04-16',
    1,
    525,
    2,
    1,
    '',
    '0000-00-00 00:00:00',
    225,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    3001,
    31,
    2,
    '16:00:00',
    '17:00:00',
    0.5,
    '2023-04-27',
    1,
    350,
    2,
    1,
    '',
    '2023-06-14 09:11:26',
    200,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    3011,
    31,
    2,
    '16:00:00',
    '17:00:00',
    1,
    '2023-02-22',
    1,
    350,
    2,
    0,
    '',
    '2023-06-14 09:11:26',
    200,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    3061,
    1,
    1,
    '09:00:00',
    '10:00:00',
    2,
    '0000-00-00',
    1,
    350,
    2,
    0,
    '',
    '0000-00-00 00:00:00',
    0,
    1
  );
INSERT INTO
  `lessons` (
    `id_le`,
    `subject`,
    `location`,
    `start`,
    `end`,
    `length`,
    `date`,
    `type`,
    `price`,
    `state`,
    `isPaid`,
    `description`,
    `last_update`,
    `teacher_pay`,
    `visible`
  )
VALUES
  (
    3071,
    1,
    1,
    '09:00:00',
    '10:00:00',
    1,
    '1899-11-30',
    1,
    350,
    2,
    0,
    '',
    '2023-07-04 02:45:11',
    300,
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: locations
# ------------------------------------------------------------

INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (1, 'online');
INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (2, 'Praha');
INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (3, 'Brno');
INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (4, 'Trutnov');
INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (5, 'Liberec');
INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (6, 'Český Brod');
INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (7, 'Praha Benešov');
INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (8, 'Brno Tišnov');
INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (9, 'Brno Hustopeče');
INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (11, 'Rožnov pod Radhoštěm');
INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (12, 'Vsetín');
INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (31, 'Ústí nad Labem');
INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (41, 'Český Brod');
INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (51, 'Úvaly');
INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (61, 'Blatná');
INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (71, 'Pardubice');
INSERT INTO
  `locations` (`id_lo`, `location`)
VALUES
  (81, 'Ostrava');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: monthly_pay
# ------------------------------------------------------------

INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (1, '2022-11', 921, 1, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (11, '2022-11', 921, 1, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (22, '2023-01', 26, -1, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (32, '2023-01', 921, 0, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (42, '2023-02', 62, -1, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (51, '2023-05', 3, -1, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (61, '2023-02', 3122, 0, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (71, '2023-04', 3122, 0, '1', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (81, '2023-03', 3122, 1, '1', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (101, '2023-02', 3112, 1, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (111, '2023-03', 3112, 1, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (121, '2023-04', 3112, 4, '1', 900);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (141, '2023-02', 4041, 1, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (151, '2023-03', 4041, 1, '1', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (161, '2023-04', 4041, 1, '1', 250);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (371, '1899-11', 921, 0, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (381, '2023-06', 921, 1, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (391, '2023-3', 3112, 1, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (401, '2023-4', 3112, 0, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (411, '2023-2', 3112, 0, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (421, '2023-01', 3112, 0, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (431, '2023-2', 3122, 0, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (441, '2023-3', 3122, 0, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (451, '2023-2', 62, 0, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (461, '1899-11', 3122, -1, '0', 0);
INSERT INTO
  `monthly_pay` (
    `id_mopa`,
    `month`,
    `user`,
    `number`,
    `state`,
    `salary`
  )
VALUES
  (471, '1899-11', 3112, 0, '0', 0);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: questions
# ------------------------------------------------------------

INSERT INTO
  `questions` (
    `id_qu`,
    `name`,
    `email`,
    `phone`,
    `lessons`,
    `type`,
    `location`,
    `achieve`,
    `howManyLessons`,
    `addInfo`,
    `active`
  )
VALUES
  (
    11,
    'Test',
    'testovaci@email.cz',
    '[object Undefined]',
    'Matematika, Anglický jazyk, ',
    1,
    1,
    'Test',
    'aj ma',
    '',
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: regular_lessons
# ------------------------------------------------------------

INSERT INTO
  `regular_lessons` (
    `id_rele`,
    `student`,
    `teacher`,
    `subject`,
    `location`,
    `startTime`,
    `endTime`,
    `startDate`,
    `endDate`,
    `length`,
    `type`,
    `description`,
    `price`,
    `day`,
    `active`,
    `teacher_pay`
  )
VALUES
  (
    31,
    911,
    921,
    0,
    1,
    '09:00:00',
    '10:00:00',
    '2023-04-04',
    '2033-04-04',
    1,
    1,
    '',
    350,
    'Pondělí',
    1,
    300
  );
INSERT INTO
  `regular_lessons` (
    `id_rele`,
    `student`,
    `teacher`,
    `subject`,
    `location`,
    `startTime`,
    `endTime`,
    `startDate`,
    `endDate`,
    `length`,
    `type`,
    `description`,
    `price`,
    `day`,
    `active`,
    `teacher_pay`
  )
VALUES
  (
    41,
    3042,
    3122,
    0,
    2,
    '15:30:00',
    '16:30:00',
    '2023-02-17',
    '2033-04-10',
    1,
    1,
    '',
    350,
    'Pátek',
    1,
    200
  );
INSERT INTO
  `regular_lessons` (
    `id_rele`,
    `student`,
    `teacher`,
    `subject`,
    `location`,
    `startTime`,
    `endTime`,
    `startDate`,
    `endDate`,
    `length`,
    `type`,
    `description`,
    `price`,
    `day`,
    `active`,
    `teacher_pay`
  )
VALUES
  (
    51,
    3032,
    3112,
    0,
    1,
    '19:00:00',
    '20:00:00',
    '2023-02-02',
    '2033-04-12',
    1,
    1,
    '',
    525,
    'Pondělí',
    1,
    225
  );
INSERT INTO
  `regular_lessons` (
    `id_rele`,
    `student`,
    `teacher`,
    `subject`,
    `location`,
    `startTime`,
    `endTime`,
    `startDate`,
    `endDate`,
    `length`,
    `type`,
    `description`,
    `price`,
    `day`,
    `active`,
    `teacher_pay`
  )
VALUES
  (
    61,
    3032,
    3112,
    0,
    1,
    '19:00:00',
    '20:00:00',
    '2023-02-02',
    '2033-04-12',
    1,
    1,
    '',
    350,
    'Čtvrtek',
    1,
    225
  );
INSERT INTO
  `regular_lessons` (
    `id_rele`,
    `student`,
    `teacher`,
    `subject`,
    `location`,
    `startTime`,
    `endTime`,
    `startDate`,
    `endDate`,
    `length`,
    `type`,
    `description`,
    `price`,
    `day`,
    `active`,
    `teacher_pay`
  )
VALUES
  (
    71,
    3352,
    4041,
    0,
    2,
    '16:00:00',
    '17:00:00',
    '2023-02-22',
    '2033-04-12',
    1,
    1,
    '',
    350,
    'Úterý',
    1,
    200
  );
INSERT INTO
  `regular_lessons` (
    `id_rele`,
    `student`,
    `teacher`,
    `subject`,
    `location`,
    `startTime`,
    `endTime`,
    `startDate`,
    `endDate`,
    `length`,
    `type`,
    `description`,
    `price`,
    `day`,
    `active`,
    `teacher_pay`
  )
VALUES
  (
    81,
    911,
    921,
    1,
    2,
    '09:00:00',
    '10:00:00',
    '2023-05-27',
    '2033-05-27',
    1,
    1,
    '',
    100,
    'Pondělí',
    1,
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: regularclassroom
# ------------------------------------------------------------

INSERT INTO
  `regularclassroom` (
    `id_re`,
    `teacher`,
    `subject`,
    `note`,
    `capacity`,
    `maxCapacity`,
    `day`,
    `start`,
    `end`
  )
VALUES
  (
    71,
    72,
    'matematika',
    '',
    1,
    1,
    1,
    '15:30:00',
    '16:30:00'
  );
INSERT INTO
  `regularclassroom` (
    `id_re`,
    `teacher`,
    `subject`,
    `note`,
    `capacity`,
    `maxCapacity`,
    `day`,
    `start`,
    `end`
  )
VALUES
  (
    92,
    2661,
    'matematika',
    '',
    3,
    7,
    1,
    '16:30:00',
    '17:30:00'
  );
INSERT INTO
  `regularclassroom` (
    `id_re`,
    `teacher`,
    `subject`,
    `note`,
    `capacity`,
    `maxCapacity`,
    `day`,
    `start`,
    `end`
  )
VALUES
  (
    102,
    72,
    'matematika',
    '',
    1,
    1,
    1,
    '16:30:00',
    '17:30:00'
  );
INSERT INTO
  `regularclassroom` (
    `id_re`,
    `teacher`,
    `subject`,
    `note`,
    `capacity`,
    `maxCapacity`,
    `day`,
    `start`,
    `end`
  )
VALUES
  (
    112,
    74,
    'český jazyk',
    '',
    7,
    7,
    2,
    '16:00:00',
    '17:00:00'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: roles
# ------------------------------------------------------------

INSERT INTO
  `roles` (`id_ro`, `title`)
VALUES
  (1, 'admin');
INSERT INTO
  `roles` (`id_ro`, `title`)
VALUES
  (2, 'kristýna');
INSERT INTO
  `roles` (`id_ro`, `title`)
VALUES
  (3, 'student');
INSERT INTO
  `roles` (`id_ro`, `title`)
VALUES
  (4, 'lektor');
INSERT INTO
  `roles` (`id_ro`, `title`)
VALUES
  (5, 'koordinátor (front)');
INSERT INTO
  `roles` (`id_ro`, `title`)
VALUES
  (11, 'koordinátor (back)');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: salaries
# ------------------------------------------------------------

INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1,
    'Daria Yukhymenko',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    'Rodilý mluvčí ukrajinština, ruština, VUT Brno, může: ST, PÁ a víkend, ČT od 15.hod.',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    2,
    'Michal Buriánek',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '0',
    'PO: 0, ÚT: 0, ST: 0, ČT: 0, PÁ: 0, SO: 0, NE: 0',
    'ano do 28.4.2022',
    12,
    '86-7274170287/0100',
    '1899-11-01',
    '',
    0,
    0,
    0,
    0,
    '0000-00-00',
    '0000-00-00',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    3,
    'Klára Elefantová',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '',
    '',
    'ano do 6.6.2022',
    33,
    '229279150/0600',
    '0000-00-00',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    4,
    'Eleonora Mara Adamovič',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    5,
    'Lucie Hánová',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    6,
    'Petra Přibilová (Venská)',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '',
    '',
    'Ano, na dobu neurčitou',
    0,
    '226433538/0300',
    '0000-00-00',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    7,
    'Dominik Krasula',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    8,
    'Lenka Klimešová',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    'Brno',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    9,
    'Nela Brelová',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    'Brno',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    10,
    'Markéta Putnová',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    'úterý, středa, pátek od 15.30',
    'ano na neurčito',
    0,
    '258646730/0300',
    '2022-02-01',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    11,
    'Halija Vrbíková',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    'Praha',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    12,
    'Kateřina Havránková',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    13,
    'Klára Fialková',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'ano na neurčito',
    18,
    '2689889143/0800',
    '2021-04-01',
    'klienti jsou s ní velmi spokojeni',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    14,
    'František Hájek',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '',
    '',
    'ano do 5.5.2022',
    31,
    '275654767/0300',
    '2021-05-01',
    'Růžová NE',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    15,
    'Alvin Hofmann',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    16,
    'Zuzana Kratochvílová',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    17,
    'Gabriela Švejdová',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'ano na neurčito',
    24,
    '107-658090217/0100',
    '2021-04-01',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    18,
    'Matyáš Šikl',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    'Brno',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    19,
    'Jana Amadou',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    'Brno',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    20,
    'Jan Slovioček',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    21,
    'Zuzana Španková',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    22,
    'Karolína Laňková',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    23,
    'Karolína Štandová',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    24,
    'Viktor Šimov',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'ano do 9.5.2022',
    30,
    '107-2498170267/0100',
    '2021-05-01',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    25,
    'Michaela Tučková',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'ano do 28.4.2022',
    9,
    '115-8901280237/0100',
    '2021-04-01',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    26,
    'David Kadlec',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    'Brno',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    27,
    'Aneta Procházková',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'ano do 28.4.2022',
    6,
    '209758891/0600',
    '2021-04-01',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    28,
    'Zuzana Mocková',
    'CZK',
    150,
    150,
    150,
    0,
    'ANO - máme',
    '10',
    'PO: 0, ÚT: 0, ST: 0, ČT: 0, PÁ: 0, SO: 0, NE: 0',
    'NE',
    22,
    '123-5243660217/0100',
    '2021-05-01',
    'klienti jsou s ní velmi spokojeni',
    200,
    200,
    200,
    0,
    '0000-00-00',
    '0000-00-00',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    29,
    'Gabriela Tůmová',
    'CZK',
    149,
    149,
    150,
    0,
    'ANO - máme',
    '10',
    'PO: 0, ÚT: 0, ST: 0, ČT: 0, PÁ: 0, SO: 0, NE: 0',
    'NE',
    0,
    '123-5243660217/0100',
    '0000-00-00',
    '',
    200,
    200,
    200,
    0,
    '0000-00-00',
    '0000-00-00',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    30,
    'Muriel Dominů\n',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    31,
    'Lukáš Daněk',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'ANO',
    0,
    '2704655063/0800',
    '2022-03-01',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    32,
    'Zina Vykypělová',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    'Brno',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    33,
    'Lukáš Daněk',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    34,
    'Kristýna Kratochvílová',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'ano do 31.5.2022',
    5,
    '205306150/0600',
    '2021-06-01',
    'Online, předměty nejsou + Praha',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    35,
    'Helena Nováková',
    'CZK',
    150,
    150,
    200,
    0,
    'ANO - máme',
    '5',
    'PO: 0, ÚT: 0, ST: 0, ČT: 0, PÁ: 0, SO: 0, NE: 0',
    'ano',
    3,
    '1165153018/2700',
    '2021-04-01',
    '',
    200,
    200,
    250,
    0,
    '0000-00-00',
    '0000-00-00',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    36,
    'Jan Jehlička',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    'Praha',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    37,
    'Vendula Kadlecová',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    'málo času',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    38,
    'Magdaléna Kvasničková',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    2,
    '115-1694130217/0100',
    '0000-00-00',
    'klienti jsou s ní velmi spokojeni',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    39,
    'Renata Kafoňková',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'NE',
    0,
    '',
    '0000-00-00',
    'Online/Offline, Brno',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    40,
    'Karel Hynek',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '',
    '',
    'NE',
    0,
    '1343424002/5500',
    '0000-00-00',
    'ruzovy ne. 2 hod týdně',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    41,
    'Tomáš Kasal',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'ano do 26.10.2022',
    1,
    '2112032348/2700',
    '2021-10-01',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    42,
    'Simona Malaková',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '',
    '',
    'NE',
    62,
    '5738853002/5500',
    '0000-00-00',
    'Ruzovy ano',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    43,
    'Radek Zíka',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'Ano do 31.5.2022',
    86,
    '2164386113/0800',
    '0000-00-00',
    'student UK, 1-2 hodiny týdně, budeme danit',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    44,
    'Ludmila Pokorná ',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '',
    '',
    'ano do 15.11.2022',
    69,
    '220205729/0300',
    '0000-00-00',
    'Hodně hodin a kdykoliv. Růžový papír ano. Ne Prosek a dál',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    45,
    'Olesia Matva',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'ANO do 5.4.2023',
    91,
    '123-5304360227/0100',
    '0000-00-00',
    'magisterské studium na JAMU, budeme danit',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    46,
    'Klára Dědáčková',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '',
    '',
    'ANO do 1.2.2023',
    93,
    '3025145023/0800',
    '2022-02-01',
    'Offline dle lokace, jinak online, 5 hod., ružový ano, právnická fakulta MU',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    47,
    'Denisa Viktorie Laurynová',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    'Alespoň 5 hodin týdně',
    '',
    'ANO',
    95,
    '2959256013/0800',
    '2022-02-01',
    'Studentka VŠ - pedagogika',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    48,
    'Petra Lišková',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '',
    '',
    'Ano do 31.5.2022',
    96,
    '4059434063/0800',
    '0000-00-00',
    'VŠ - ekonomika podniku VUT, 3-4 hod týdně, ucetnictví NE',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    49,
    'Šimon Horák',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'ano do 12.12.2022',
    0,
    '2081266028/3030',
    '2021-12-01',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    50,
    'Karolína Biniová',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'ano do 30.6.2022',
    100,
    '1258486014/3030',
    '0000-00-00',
    'Pracuje na ZŠ 1.stupeň jako asistentka pedagoga, růžový NE, Může: PO: 14-15, ST: 14-16. POZOR! má rozdíl v odměně za práci, dle toho, zda je online nebo osobně!',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    51,
    'Žaneta Herzlová',
    'CZK',
    0,
    0,
    0,
    0,
    '',
    '',
    '',
    'ano na dobu neurčitou',
    101,
    '6349972002/5500',
    '2022-01-01',
    'časové možnosti jsou od 17 ve středu, sobota dopoledne i odpoledne a neděle pouze dopoledne.',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    52,
    'Daniel Fusek',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '',
    'PO: 14-21, ÚT: 18-21, ST 16-21, PÁ 16-21, SO 12-21, NE 12-21',
    'ANO do 18.1.2023',
    107,
    '2607471123/0800',
    '2022-01-01',
    'Fakulta architektury - 1. ročník',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    53,
    'Marcela Hančová',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '',
    'PO 14-17, ST 14-17, ČT 15-17, PÁ 14-17 SO+NE 8-15',
    'ano, do 20.1.2023',
    108,
    '5819741379/0800',
    '2022-01-01',
    'SŠ právní a diplomatické služby 3.ročník., Preferuje Online, když osobně, tak jedině P1, 2, 3, 4, 5.',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    54,
    'Kateřina Vilímová',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '',
    'Po 15-19, ST 15-19, ČT 16:30-19, PÁ 15:30 - 19, SO+NE celé dny',
    'ano do 23.1.2023',
    0,
    '4047566093/0800',
    '2022-01-01',
    'Zdravotnické lyceum 3.ročník, preferuje online, jinak P6 nebo Vyšehrad.',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    55,
    'Jolana Bezoušková',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '',
    'ÚT: 16:30-21, PÁ 14:30-21, SO+NE 9-21',
    'NE',
    0,
    '4422299063/0800',
    '2022-01-01',
    '2.ročník gympl, Lhota Praha-východ, nebo mohu přijet za klientem domů, pokud bude potřeba a bude to v Praze nebo v okresu Praha-východ. ',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    56,
    'Anna-Marie Vondráková',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '6 - 8',
    'ÚT: 18-20, ČT: 17-20, PÁ: 14:30-17, SO+NE: celé dny',
    'Ano, do 27.1.2023',
    111,
    '1844842018/3030',
    '2022-01-01',
    'Gymnázium Septima, Omská Praha, Osobně Praha 1, 3, 10 a okolí',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    57,
    'Lukáš Flek',
    'CZK',
    0,
    0,
    0,
    0,
    'NEVYPLNIL',
    '20',
    'Přizpůsobí se',
    'ano do 1.2.2023',
    0,
    '2810566013/0800',
    '2022-02-01',
    'Praha Říčany, pokud možno osobně, Pedagogická fakulta a Přírodovědecká fakulta, dějepis geografie, bakalář tři         ',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    58,
    'Evelina Lozovaja',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '4 - 8',
    'ÚT: 16-18, ST: 15-21, PÁ: 15-19, SO: celý den pouze online, Ne: celý den online, osobně:16-20',
    'Ano do 7.2.2023',
    0,
    '670100-2219413802/6210',
    '2022-02-01',
    'Obor právní administrativa ve druhém ročníku na SOŠ pro administrativu EU, preferuje osobní setkání, o víkendech může byt online.',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    59,
    'Damián Marcel Vlasič',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '30',
    'Každý den celý den',
    'Ano, do 27.1.2023',
    111,
    '1464908193/0800',
    '2022-02-01',
    'rodilý mluvčí, mluví hůře česky, nepouštět na malé děti',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    60,
    'Tereza Trnovská',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '',
    'čt+pá: odpoledne, so+ne dopoledne',
    'ANO',
    0,
    '115- 392780287/0100',
    '2022-02-01',
    'Praha Plzeň, Práva 2.ročník, doučuje všechny povinné předměty PRF UK, Španělská konverzace',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    61,
    'Tamara Míšková',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    'Nevyplnila',
    'PO+ÚT+PÁ: 13-19, ČT: 17-19, SO+NE: dle domluvy  ',
    'ano do 10.2.2023',
    0,
    '442159123/0800',
    '2022-02-01',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    62,
    'Anna Žáková',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '2 - 3',
    'PO: 9:00-11:00 a 14:00-15:00 (nejpozději od dubna až do 18:00), ÚT: 9:00-12:00 a 15:30-18:00, PÁ 9-16, SO+NE: nemohu pravidelně ',
    'ano do 31.12.2022',
    0,
    '2357109083/0800',
    '2022-02-01',
    '1. ročník ČVUT FD, nemám zájem o online doučování (pokud si to situace nevyžádá), měla bych zájem o doučování nejlépe v centru Prahy (ideální Praha 1 a 2), klidně nějaké věřejné místo jako knihovna atd',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    63,
    'Marek Sýkora',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '4-5 hodin',
    'ÚT: od 13.h, ST: od 16:30, ČT: od 18:15, PÁ: 12-16:30',
    'ANO',
    0,
    '249331964/0300',
    '2022-02-01',
    'PedF UK obor Biologie-chemie, 1. ročník',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    64,
    'Veronika Matějková',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    'cca 5 hodin',
    'PO: 16.20, ÚT: 17-20, ST: 14-17, ČT: 17-21',
    'ANO',
    0,
    '1826418010/3030',
    '2022-02-01',
    'Gymnázium Christiana Dopplera - obor cizí jazyky - 7. ročník osmiletého studia, preferuji osobně na Praze 1, 2, nebo v blízkosti centra, kolem Smíchova…  i online',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    65,
    'Vojtěch Vilím',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '',
    'PO: online 18:30 a dále, ST: online 18  a dále, osobně 17 a dále, PÁ: online i osobně 13 a dále, od 1.4. online od 18:30 a osobn',
    'ANO',
    0,
    '2788057123/0800',
    '0000-00-00',
    'Navazující magisterské studium analytické chemie, 1. ročník, osobně pouze na Praze 6, jinak online',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    66,
    'Kateřina Loužilová',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    'do 10 hodin',
    'Po-pá: flexibilní, SO+NE: ne!',
    'ANO',
    126,
    '2800013730/2010',
    '2022-03-01',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    67,
    'Šimon Tomek',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '16 hodin',
    'ST: 17-19, PÁ: 17-20, SO: 11-13 a 17-20, NE: 10-13 a 17-20',
    'ANO',
    0,
    '1029523133/6100',
    '2022-03-01',
    'česko-italské gymnázium s technickým zaměřením - 4. ročník (sexta), preferuje online, Osobně pouze na Praze 8',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    68,
    'Alexandra Šulcová',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '4 hodiny',
    'PO: 12:30-16, ÚT: 12:30-13:34 a 15:15-16:30, ST: 12:30-16',
    'ANO',
    0,
    '107-6521390267/0100',
    '2022-03-01',
    'ANJ-SŠ: pouze příprava k maturitě, Osobně preferuje Praha 2, 3, 4 a 10, 2. ročník - FP TUL (anglický jazyk-dějepis)',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    69,
    'Tomáš Vaněk',
    'CZK',
    0,
    0,
    0,
    0,
    'Neví',
    '1-3 hodiny',
    'PO: 16-20, ST: 16-20',
    'ANO',
    129,
    '126785093/0800',
    '2022-03-01',
    'Důchodce, Praha, nejlépe Nusle, Michle, Vršovice, Strašnice, Vinohrady, Nové Něsto, Dejvice, Pankrác',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    1
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    70,
    'Alžběta Ottová',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    'Nevyplnila',
    'PO: 16-18, PÁ: 14:30-18, SO+NE: odpoledne',
    'ANO',
    130,
    '3155861183/0800',
    '2022-03-01',
    '1. lékařská fakulta UK, zubní lékařství (1. ročník)',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    71,
    'Lea Uherková',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '8 hodin',
    'PO: 18-20, ÚT: 0, ST: 0, ČT: 18-21, PÁ: 10-21, SO: 10-19, NE: 10-19',
    'ANO',
    131,
    '115-2162130237/0100',
    '2022-03-01',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    1
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    72,
    'Vanessa Azemi',
    'CZK',
    0,
    0,
    0,
    0,
    'Nevyplnila',
    'max 20 hodin',
    'PO+ST+ČT: 9-18, ÚT: 15-18, PÁ: 9-16, SO: 12-16',
    'ANO',
    132,
    '270593774/0300',
    '2022-03-01',
    'Metropolitní Univerzita Praha, obor Humanitní studia, preferuje Prahu 1-6, je ochotná ale dojet kamkoliv',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    74,
    'Kateřina Wimmerová',
    'CZK',
    0,
    0,
    0,
    0,
    'Nevyplnila',
    '7, později bych mohla navýšit, ale nejdříve chci vidět, kolik času mi zabere příprava a samotné hodiny',
    'PO-PÁ: 15-20, SO-NE: 10-15',
    'Ano do 24.3.2023',
    134,
    '212052697/0600',
    '2022-03-01',
    'Informační média a služby 1. ročník na VOŠ, předtím Italská a anglická filologie na VŠ 2. roky, preferuji online, ale je možnost se domluvit',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    75,
    'Linda Hůrková',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    'Neurčeno',
    'PO-ST: 18-0:00, PÁ: celý den, NE: občas dopo nebo ve večerních hodinách',
    'ANO',
    135,
    '1559081002/5500',
    '2022-03-01',
    'Učitelství pro 1. stupeň ZŠ, 1. ročník',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    76,
    'Tomáš Pokorný',
    'CZK',
    0,
    0,
    0,
    0,
    'Nevyplnil',
    '8 hodin',
    'ST: 14-18, ČT: 16:30 - 20:30, SO+NE: dle dohody',
    'ANO do 1.4.2023',
    137,
    '605058002/5500',
    '2022-04-01',
    '2.ročník gymnázium Milady Horákové',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    77,
    'Tomáš Pokorný',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '14 - 18',
    'ÚT: od 17, SO+NE: od 10',
    'ANO do 3.4.2023',
    137,
    '1022956673/6100',
    '2022-03-01',
    'Český jazyk a dějepis se zaměřením na vzdělání - 4.semestr ',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    78,
    'Anna Linhartová',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '3 hodiny',
    'PO+ST: 15-večer, ÚT: 15-17:45, ČT: od 19:20, NE: od 19',
    'ANO do 29.3.2023',
    0,
    '161449140/0300',
    '2022-04-01',
    'Gymnázium Na Pražačce s německým zaměřením, 5.rok, 6ti leté, ve veřejném prostoru nebo u doučovaného doma',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    79,
    'Alexandra Hamplová',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '2-3 hodiny',
    'PO+ČT: 17-22, ÚT: 20-22, PÁ: 14-22, SO+NE: 12-22',
    'ANO',
    140,
    '4319596043/0800',
    '2022-04-01',
    'Anglicko-české gymnázium Amazon, 1. ročník, dojezd ideálně P1, 7, 8',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    80,
    'Tereza Davidová',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '20 hodin',
    'PO: 15:30-17:30, ÚT: od 15:30, ST: od 18:30, SO+NE: celý den pouze online',
    'ANO',
    140,
    '2345659010/3030',
    '2022-04-01',
    'Osobně jen Praha 11, Všeob.gymnázium Sexta, ',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    81,
    'Anežka Červená',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '4-5 hodin',
    'PO: od 15, ÚT-PÁ a NE: celý den',
    'Ano do 21.4.2023',
    143,
    '2495550002/5500',
    '2022-04-01',
    'dojedu kamkoliv po Praze, případně za Prahu podle linky S7, nemám problém doučovat i online, ale bych preferovala prezenční formu',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    82,
    'Tomáš Protiva',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '32,5 hod',
    'ST: 17:30-21, PÁ: 16-21 každý sudý týden, SO+NE: 9-21 - preferuje až od 19',
    'Ano do 20.4.2023',
    143,
    '2218198012/3030',
    '2022-04-01',
    'Informační Technologie - 1. ročník, Pouze v Jihovýchodní části Prahy a centru  Preferuji jihovýchodní čast Prahy (Celá Praha 10, Praha 15, Praha 22, Praha 3) nebo Online, Případně mohu doučovat 1.ročník SŠ',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    83,
    'Matěj Trýzna',
    'CZK',
    0,
    0,
    0,
    0,
    'Nevyplnil',
    'Nevyplnil',
    'PO-PÁ: 14-19, SO-NE: 10-16',
    'ANO',
    145,
    '670100-2251406701/6210',
    '2022-05-01',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    84,
    'Jan Kluz',
    'CZK',
    0,
    0,
    0,
    0,
    'Musí se dohodnout v souč.práci',
    '10-20',
    'PO: ráno dle dohody, jinak od 18, ÚT: od 16:15, ST: od 17:15, ČT: od 12:30, PÁ: do 18 a pak od 20:10, SO+NE: celé dny (občas má ',
    'Ano, do 28.4.2023',
    146,
    '670100-2213964136/6210',
    '2022-05-01',
    'Mechatronika - druhý semestr na vysoké škole, Doučování chce online, osobně pouze v Liberci',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    85,
    'Karolína Čechová',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '7 hodin + víkendy',
    'PO: 14:30-15:30 a 16-17, ÚT: 16-17, ST: 17-18 ČT: 14:30-15:30, 16-17, 17:30-18:30, SO+NE: na domluvě',
    '',
    0,
    '4132541093/0800',
    '2022-05-01',
    'všeobecné Gymnázium (Vítězná 616, Český Brod), 3A4',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    86,
    'Lukáš Burian',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '10 hodin',
    'PO: 14-18, ÚT: 16-18, ČT: 15-18, SO+NE: 13-19',
    'ANO',
    148,
    '51-2582030267/0100',
    '2022-05-01',
    'SOŠ Drtinova, obor právní a diplomatické služby, 3. ročník, online spíše v pozdějších hodinách, osobně spíše dříve odpoledne',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    87,
    'Tereza Pefková',
    'CZK',
    0,
    0,
    0,
    0,
    'Nevyplnila',
    '4 - 6 hodin',
    'PO: 15-18, ÚT: 14-16, ČT: 15-17:30, SO: celý den, NE: Jedině online 9-11',
    'ANO',
    149,
    '236687945/0600',
    '2022-05-01',
    'Česlovanská akademie obchodní Dr. Edvarda Beneše, střední odborná škola, Praha 2, Resslova 8 - ekonomické lyceum',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    88,
    'Karolína Zídková',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '5-7 hodin',
    'PO-PÁ: 16-20, SO+NE: 10-18',
    'ANO',
    0,
    '2661630113/0800',
    '2022-05-01',
    'Trivis 1.ročník Veřejnoprávní, P8',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    89,
    'Tereza Sotáková',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '5-6 hodin (od června i více)',
    'PO-ČT: 14-20',
    'ANO',
    0,
    '900000006/0300',
    '2022-05-01',
    'Všeobecné lékařství na 1. lékařské fakultě Univerzity Karlovy, 5. ročník',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    90,
    'Dominika Vašíčková',
    'CZK',
    0,
    0,
    0,
    0,
    'Nevyplnila',
    'Nevyplnila',
    'PO+ST+ČT+PÁ: červen - září mohu kdykoliv dopoledne a odpoledne, SO: individuální domluva,  ',
    'ANO do 24.5.2023',
    0,
    '233936686/0300',
    '2022-06-01',
    'Učitelství ruského jazyka a literatury pro střední školy - navazující dvouleté magisterské studium 2021-2023',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    91,
    'Anna Urbanová',
    'CZK',
    0,
    0,
    0,
    0,
    'Nevyplnila',
    '14 hodin',
    'PO-NE: V červnu kdykoli cca 2 hodiny denně',
    'ANO do 30.6.2022',
    0,
    '2960782053/0800',
    '2022-06-01',
    'PdF MU, první ročník, jedině Online, osobně jedině Tišnov',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    93,
    'Vendula Harmáčková',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '8-10 hodin',
    'PO+ST+PÁ: 9:00-12:00 (online i v Brně), 15:00-17:00 (online), NE: 12:00 - 16:00 - pouze online',
    'ANO',
    0,
    '1032582185/6100',
    '2022-07-01',
    'Český jazyk a literatura + Sdružená uměnovědná studia (bakalářské studium sdružené, FF MUNI), 1. ročník',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    94,
    'Barbora Váňová',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '1-15 hodin',
    'PO-PÁ: 12-20, SO: 13-15',
    'ANO',
    0,
    '107-7802720247/0100',
    '2022-06-01',
    '',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    95,
    'Jan Kostiha',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '4-8 hodin',
    'PO: 16-20, ÚT: 15-17, ST: 16-20, ČT: 15-17, NE: 15-20',
    'ANO do 30.5.2023',
    0,
    '123-4351060257/0100',
    '2022-06-01',
    'Studuji všeobecné gymnázium v 1. ročníku.',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    96,
    'Jitka Stritzlová',
    'CZK',
    0,
    0,
    0,
    0,
    'ANO',
    '',
    'PO: 13:30-18, ST: 14-18, ČT: 14:30-18',
    'Ano do 7.6.2023',
    0,
    '299492459/0300',
    '2022-06-01',
    'Gymnázium T. G. Masaryka Hustopeče, 1. ročník střední školy, základy programování v jazycích python, java. Mohu doučovat v Centrum Brna, Hustopeče a okolí',
    0,
    0,
    0,
    0,
    NULL,
    NULL,
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    131,
    'Test_Lektor Testovací',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '0',
    'PO: 0, ÚT: 0, ST: 0, ČT: 0, PÁ: 0, SO: 0, NE: 0',
    'NE',
    0,
    '0',
    '1899-11-01',
    '',
    0,
    0,
    0,
    0,
    '0000-00-00',
    '0000-00-00',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    171,
    'Miroslav Zubaj',
    'CZK',
    150,
    150,
    200,
    0,
    'NE',
    '5',
    'PO: celý den, ÚT: od 18, ST: od 18 ČT, ČT: od 18 PÁ, PÁ:  od 18, SO: ne, NE: ne',
    'Ano',
    132,
    '8293600806/6100',
    '2022-08-01',
    '',
    200,
    200,
    250,
    0,
    '0000-00-00',
    '0000-00-00',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    181,
    'Matouš  Korčák',
    'CZK',
    150,
    150,
    200,
    0,
    'NE',
    '16',
    'PO: 8-20, ÚT: 8-20, ST: 8-20 ČT: 8-20 PÁ: 8-20, SO: 8-20, NE: 8-20',
    'Jen scan',
    172,
    '2889154133/0800',
    '0000-00-00',
    '',
    200,
    200,
    250,
    0,
    '0000-00-00',
    '0000-00-00',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    191,
    'Kristian Oliver Beneš',
    'CZK',
    150,
    150,
    0,
    0,
    'NE',
    '5',
    'PO: 15:30-21, ÚT: 15:30-21, ST: 0 ČT: 15:30-21 PÁ: 0, SO: 0-21, NE: 0-21',
    'Ano',
    182,
    '2004071032/5500',
    '2023-08-01',
    '',
    200,
    200,
    0,
    0,
    '0000-00-00',
    '0000-00-00',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    201,
    'Kateřina Kalová',
    'CZK',
    150,
    150,
    200,
    0,
    'NE',
    '4',
    'PO: 12-19, ÚT: 0, ST: 12-19 ČT: 0 PÁ: 0, SO: 0, NE: 0',
    'Ano',
    161,
    '261799682/0300',
    '2023-08-01',
    'Online i osobně, preferuji kavárny, knihovny, Brno (ideálně centrum, Bohunice, Lískovec, ale nemám problém někam dojet)',
    200,
    200,
    250,
    0,
    '0000-00-00',
    '0000-00-00',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    211,
    'Lucie Šrámková',
    'CZK',
    150,
    150,
    0,
    0,
    'ANO - máme',
    '10',
    'PO: 6-22, ÚT: 6-22, ST: 6-22 ČT: 6-22 PÁ: 6-22, SO: 6-22, NE: 6-22',
    'Ano',
    162,
    '2901805227/2010',
    '2022-08-01',
    'Moravské gymnázium Brno, s.r.o., 2. ročník',
    0,
    0,
    0,
    0,
    '0000-00-00',
    '0000-00-00',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    221,
    'Dominik Melkovič',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '5',
    'PO: 15-20, ÚT: 15-20, ST: 15-20 ČT: 15-20 PÁ: 0, SO: 15-20, NE: 15-20',
    'ne',
    163,
    'CZ2455000000001813094002',
    '2022-08-01',
    'Informatika – 1 ročník; Učiteľstvo matematiky – 3. ročník',
    -1,
    -1,
    0,
    0,
    '0000-00-00',
    '0000-00-00',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    231,
    'Katarína Svobodová',
    'CZK',
    150,
    150,
    0,
    0,
    'ANO - máme',
    '3',
    'PO: 17-20, ÚT: 0, ST: 0 ČT: 16:30-20 PÁ: 0, SO: kdykoliv, NE: 0',
    'Ano',
    165,
    '2256796013/3030',
    '2022-08-01',
    'Gymnázium Brno Křenová, po prázdninách 2.ročník čtyřletého gymnázia\nraději osobně, možnost i online',
    200,
    200,
    0,
    0,
    '0000-00-00',
    '0000-00-00',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    241,
    'Barbora Kitlerová',
    'CZK',
    150,
    150,
    0,
    0,
    'ANO - máme',
    '10',
    'PO: 0, ÚT: 0, ST: 0 ČT: 0 PÁ: 0, SO: 10-17, NE: 10-17',
    'Ano',
    166,
    '2376876018/3030',
    '2022-08-01',
    '!!!!Má střídavou péči, tedy jeden týden je v Praze, druhý v Kolíně!!!!\nFinanční specialista, 2. ročník sš',
    200,
    200,
    0,
    0,
    '0000-00-00',
    '0000-00-00',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    271,
    'Natálie Hrubešová',
    'CZK',
    150,
    150,
    0,
    0,
    'ANO - máme',
    '16',
    'PO: 16-20.30, ÚT: 0, ST: 16-20.30 ČT: 16-20.30 PÁ: 16-20.30, SO: celý den, NE: celý den',
    'Invalid date',
    168,
    '103338071/0300',
    '2023-01-23',
    'bezpečnostně právní činnost v 2. ročníku',
    200,
    200,
    0,
    0,
    '2022-08-10',
    '2023-08-10',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    281,
    'Marek Patočka',
    'CZK',
    0,
    0,
    0,
    0,
    'NE',
    '5',
    'PO: 0, ÚT: 17-20.30, ST: 0, ČT: 17-20.30, PÁ: 0, SO: 0, NE: 0',
    'Ano',
    169,
    '264550217/0300',
    '2022-09-01',
    '',
    0,
    0,
    250,
    450,
    '0000-00-00',
    '0000-00-00',
    1
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    292,
    'Valentýna Hájková',
    'CZK',
    150,
    150,
    200,
    0,
    'NE',
    '6',
    'PO: 17-19:30, ÚT: 0, ST: 16-19:30, ČT: 0, PÁ: 14-16:30, SO: 0, NE: 0',
    'Invalid date',
    172,
    '2502007957/2010',
    '2022-09-01',
    'Preferuje Online, osobně jedině na P1 a P3\nStuduje gymnázium v maturitním ročníku',
    200,
    200,
    250,
    0,
    '2022-09-20',
    '2023-09-20',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    302,
    'Jiří Pražák',
    'CZK',
    150,
    150,
    200,
    0,
    'NE',
    '10',
    'PO: 17-20, ÚT: 17-20, ST: 17-20, ČT: 17-20, PÁ: 0, SO: 13-16, NE: 18-20',
    'Invalid date',
    -1,
    '280087656/0300',
    '2022-09-01',
    'Dokončen magisterský obor Kybernetika, automatizace a měření na VUT v Brně',
    0,
    0,
    0,
    0,
    '2023-01-31',
    '2023-01-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    312,
    'Ludmila Polanská',
    'CZK',
    150,
    150,
    200,
    0,
    'NE',
    '3',
    'PO: 19-20:30, ÚT: 0, ST: 18:30-21, ČT: 16-20, PÁ: 0, SO: 0, NE: 0',
    'Invalid date',
    174,
    '107-5976940267/0100',
    '2022-09-01',
    'Pedagogická fakulta UK, obor Učitelství pro 1. stupeň ZŠ, druhý ročník',
    200,
    200,
    250,
    0,
    '2022-09-28',
    '2023-09-28',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    322,
    'Anna Rytířová',
    'CZK',
    150,
    150,
    200,
    0,
    'NE',
    '10',
    'PO: 15:30-20, ÚT: 16-20, ST: 18-20, ČT: 16-18, PÁ: 0, SO: 0, NE: 0',
    'Ano',
    175,
    '4135130003/0800',
    '2022-09-01',
    'Pedagogické lyceum 1.ročník',
    200,
    200,
    250,
    0,
    '2022-09-19',
    '2023-09-19',
    1
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    332,
    'Vendula Rychtářová',
    'CZK',
    150,
    150,
    0,
    0,
    'ANO - máme',
    '2',
    'PO: 15-17, ÚT: 0, ST: 0, ČT: 0, PÁ: 15-17, SO: 0, NE: 0',
    'Ano',
    176,
    '4209081073/0800',
    '2022-10-01',
    'Všeobecné gymnázium, 3. ročník, osobně pouze zde: Praha 1, 2, 3, 4, 5, 10',
    200,
    200,
    0,
    0,
    '2022-10-16',
    '2023-10-16',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    342,
    'Vladimíra Šímová',
    'CZK',
    150,
    150,
    200,
    0,
    'NE',
    '15',
    'PO: 16-20:30, ÚT: 16-20:30, ST: 16-20:30, ČT: 0, PÁ: 16-20:30, SO: 16-20:30, NE: 16-20:30',
    'Ano',
    178,
    '2485699399/0800',
    '2022-11-01',
    'Osobně preferuje P4 nebo P8',
    200,
    200,
    250,
    0,
    '2022-10-24',
    '2023-10-24',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    352,
    'Marian Jerinic',
    'CZK',
    150,
    150,
    200,
    0,
    'ANO - máme',
    '3',
    'PO: 0, ÚT: 16:30-22:30, ST: 7-19, ČT: 13-19, PÁ: 7-18, SO: 0, NE: 0',
    'Ano',
    179,
    '198876568/0600',
    '2022-11-01',
    'Studuje Blízkovýchodní studia - arabistika na FF UK; 3. ročník Bc. studia\nDojede za žákem kamkoliv po Praze',
    200,
    200,
    250,
    0,
    '2022-09-25',
    '2023-09-25',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    362,
    'Jana Pelikánová',
    'CZK',
    0,
    0,
    200,
    400,
    'NE',
    '10',
    'PO: dle domluvy, ÚT: dle domluvy, ST: dle domluvy, ČT: dle domluvy, PÁ: dle domluvy, SO: dle domluvy, NE: dle domluvy',
    'Fakturuje',
    0,
    '670100-2205741944/6210',
    '2022-11-01',
    '',
    0,
    0,
    0,
    0,
    '2022-09-25',
    '2023-09-25',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    372,
    'Anežka Syrová',
    'CZK',
    150,
    150,
    0,
    0,
    'Nemá',
    '4',
    'PO: 16-18, ÚT: 16-18, ST: 0, ČT: 16-18, PÁ: 0, SO: 14-18, NE: 0',
    'Ano',
    215,
    '311909975/0300',
    '2023-01-01',
    'Preferuji osobně v Praze, ale online mi také nevadí.\nObchodní akademie Kubelíkova, 2. ročník',
    200,
    200,
    0,
    0,
    '2023-01-23',
    '2024-01-23',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    382,
    'Antonio Federico Iorio',
    'CZK',
    150,
    150,
    200,
    0,
    'ANO',
    '2',
    'PO: 0, ÚT: 0, ST: 0, ČT: 0, PÁ: 15-19, SO: 15-19, NE: 0',
    'Ano',
    181,
    '2590653173/0800',
    '2022-11-01',
    '',
    200,
    200,
    250,
    0,
    '2022-11-01',
    '2023-11-01',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    392,
    'Kristýna Valášková',
    'CZK',
    150,
    150,
    200,
    0,
    'ANO',
    '5',
    'PO: 18:15-20, ÚT: 0, ST: 13-16, ČT: 18:30-19:30, PÁ: 13-15, SO: 0, NE: 0',
    'Ano',
    182,
    '35-7836370257/0100',
    '2022-11-01',
    '',
    200,
    200,
    250,
    0,
    '2022-09-23',
    '2023-09-23',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    402,
    'Filip Babčický',
    'CZK',
    0,
    0,
    200,
    400,
    'ANO',
    '0',
    'PO: 0, ÚT: 0, ST: 0, ČT: 0, PÁ: 15-20, SO: 10-20, NE: 10-20',
    'Ano',
    183,
    '277431081/0300',
    '2022-11-01',
    'jaderná chemie, 4.ročník',
    0,
    0,
    250,
    450,
    '2022-10-24',
    '2023-10-24',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    422,
    'Ondřej Skála',
    'CZK',
    150,
    150,
    200,
    400,
    'Nechce',
    '8',
    'PO: 18-22, ÚT: 0, ST: 0, ČT: 18-22, PÁ: 18-22, SO: po domluvě, NE: po domluvě',
    'Ano',
    211,
    '194873917/0600',
    '2023-01-01',
    'manažer logistiky (zaměstnání)',
    200,
    200,
    250,
    450,
    '2023-01-23',
    '2024-01-23',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    432,
    'Růžena Szaková',
    'CZK',
    150,
    150,
    0,
    0,
    'Nechce',
    '12',
    'PO: 15-19, ÚT: 15-19, ST: 0, ČT: 0, PÁ: 14:30-19, SO: 11-18, NE: 11-18',
    'Ano',
    224,
    '2329242020/3030\t\t\t \"',
    '2023-02-01',
    'Veřejnosprávní činnost, 1. ročník.',
    200,
    200,
    0,
    0,
    '2023-02-08',
    '2024-02-08',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    442,
    'Dana Šipulová',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '6',
    'PO: 0, ÚT: 16-21, ST: 0, ČT: 16-21, PÁ: 17-21, SO: 15-20, NE: 0',
    'Ano',
    209,
    '104169660/0300',
    '2023-01-01',
    'učitelka matiky, moc milá paní.',
    0,
    0,
    0,
    0,
    '2023-02-27',
    '2023-02-27',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    461,
    'Šimon Drábek',
    'CZK',
    150,
    150,
    0,
    0,
    'Chce',
    '4',
    'PO: 15:20-21, ÚT: 15:20-21, ST: 17:45-21:00, ČT: 15:20-21, PÁ: ne, SO: ne, NE: 20-21',
    'Ano',
    184,
    '4494701023/0800',
    '2022-11-01',
    'Gymnázium Johanna Gregora Mendela, 2. ročník',
    200,
    200,
    0,
    0,
    '2023-03-22',
    '2023-11-08',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    471,
    'Jan Konečný',
    'CZK',
    150,
    150,
    200,
    0,
    'Chce',
    '6',
    'PO: 18-00, ÚT: 0, ST: 20-00, ČT: 17-00, PÁ: 17-00, SO: dle domluvy, NE: dle domluvy',
    'Ano',
    185,
    '000000-3070361083/0800',
    '2022-11-01',
    'Je to učitel, který i učitelství studuje. Preferuje online, osobně pouze pátky (Brno i Šlapanice)',
    200,
    200,
    250,
    0,
    '2022-11-15',
    '2023-11-15',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    481,
    'Natálie Vavrušová',
    'CZK',
    150,
    150,
    0,
    0,
    'Chce',
    '3',
    'PO: 0, ÚT: 16-20, ST: 0, ČT: 0, PÁ: 15-20, SO: 15-20, NE: 0',
    'Ano',
    186,
    '123-5254450207/0100',
    '2022-11-01',
    'Střední zdravotnická škola - ošetřovatelka. Má zkušenosti s doučováním.',
    200,
    200,
    0,
    0,
    '2022-11-15',
    '2023-11-15',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    491,
    'Adéla Pokorná',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '10',
    'PO: 16-19, ÚT: 0, ST: 10-17, ČT: 15-19, PÁ: 0, SO: 9-12:30, NE: 0',
    'Ano',
    187,
    '2686280113/0800',
    '2022-11-01',
    'Nemá problém dojet kamkoliv po Praze. Měla by zájem i o skupinové lekce. Studentka 3. ročníku Ruský jazyk a literatura na UK.',
    200,
    200,
    250,
    0,
    '2022-11-24',
    '2023-11-24',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    501,
    'Luboš Vidner',
    'CZK',
    150,
    150,
    200,
    400,
    'Nechce',
    '50',
    'PO: 14-22, ÚT: 14-22, ST: 14-22, ČT: 14-18, PÁ: 14-22, SO: celé dny, NE: celé dny',
    'Ano',
    188,
    '2900042969/2010',
    '2022-11-01',
    'Učí také v Populo, takovej typickej ajťák, trochu podivín, ale moc milej. Programátor - C, C++, C#,WPF,HTML/CSS. Má vystudovanou dopravní fakultu na uni v Pardubicích.',
    0,
    0,
    0,
    0,
    '2022-11-23',
    '2023-11-23',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    511,
    'Kristýna Mašková',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '10',
    'PO: 0, ÚT: 18:45-20, ST: 0, ČT: 13:30-17:15 + 18:45-20, PÁ: do 15:30, SO: pouze příležitostně, NE: pouze příležitostně',
    'Ano',
    189,
    '1268786002/5500',
    '2022-12-01',
    'Preferuje online, osobně pouze na Praze 11, anebo v blízkých lokalitách. Filozofická fakulta Univerzity Karlovy, bc. obor Český jazyk a literatura - 1. ročník.',
    200,
    200,
    250,
    0,
    '2022-11-30',
    '2023-11-30',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    521,
    'Barbora Konečná',
    'CZK',
    0,
    0,
    0,
    0,
    'Chce',
    '5',
    'PO: 14-18, ÚT: 15-18, ST: 14-16, ČT: 0, PÁ: 0, SO: 11-18, NE: 0',
    'Ano',
    190,
    '670100-2216216010/6210',
    '2022-12-01',
    'Gymnázium 8. ročník, profes.zkuš nemá, pomáhá jen sourozencům a spolužákům. Online lekce nechce vůbec.',
    200,
    200,
    250,
    0,
    '2022-11-23',
    '2023-11-23',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    531,
    'Ayesha Iman',
    'CZK',
    150,
    150,
    0,
    0,
    'Nechce',
    '20',
    'PO: 15-20, ÚT: 17-20, ST: 0, ČT: 15:30-20, PÁ: 0, SO: 12-17, NE: 0',
    'Ano',
    191,
    '2977653063/0800',
    '2022-12-01',
    'Preferuje Online, osobně pouze na P5 a P13 (Stodůlky), Studuje Právní a diplomatické služby ve 3.ročníku. Nejprve chce jen 1.stupeň ZŠ, na 2.stupeň si prozatím netroufá, to by přidala možná později.',
    200,
    200,
    0,
    0,
    '2022-12-08',
    '2023-12-08',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    541,
    'Zuzana Žáčková',
    'CZK',
    150,
    150,
    200,
    400,
    'Nechce',
    '10',
    'PO: 19-21, ÚT: 0, ST: 19-21, ČT: 0, PÁ: 19-21, SO: 15-19, NE: 0',
    'Ano',
    192,
    '642030113/0800',
    '2022-12-01',
    'Je to učitelka na SŠ, proto chce učit převážně SŠ. Lekce chce jenom online. Z češtiny chce učit literaturu.',
    0,
    0,
    0,
    0,
    '2022-12-08',
    '2023-12-08',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    551,
    'Matěj Müller',
    'CZK',
    0,
    0,
    0,
    0,
    'Chce',
    '9',
    'PO: 16-18, ÚT: 14-18, ST: 16-18, ČT: 14-18, PÁ: 15-18, SO: dle domluvy, NE: dle domluvy',
    'Ano',
    193,
    '115-4566830247/0100',
    '2022-12-01',
    'Provoz a ekonomika dopravy, 1. ročník. Ráčkuje, doučuje pouze sourozence, jiné zkušenosti nemá. Doučování nejlépe v Motole, Uhříněves, Háje. Nemá ale problém dojet kamkoliv po Praze.',
    200,
    200,
    0,
    0,
    '2022-12-05',
    '2023-12-05',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    561,
    'Jakub Paštika',
    'CZK',
    150,
    150,
    200,
    0,
    'Chce',
    '30',
    'PO: 8-14 + dle domluvy, ÚT: 8-14 + dle domluvy, ST: 8-14 + dle domluvy, ČT: 8-14 + dle domluvy, PÁ: 8-14 + dle domluvy, SO: 0, N',
    'Ano',
    194,
    '2484855193/0800',
    '2022-12-01',
    '',
    200,
    200,
    250,
    0,
    '2022-11-30',
    '2023-11-30',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    571,
    'Kateřina Bothová',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '4',
    'PO: 0, ÚT: 16:30-19, ST: 0, ČT: 16:30-19, PÁ: 15:30-18, SO: 0, NE: 0',
    'Ano',
    195,
    ' 264650170/0300',
    '2022-12-01',
    'Osobně Praha 1, 2, 6, 7.',
    200,
    200,
    250,
    0,
    '2022-11-15',
    '2023-11-15',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    581,
    'Anton Morozov',
    'CZK',
    150,
    150,
    200,
    400,
    'Nechce',
    '0',
    'PO: 19:50-21:30, ÚT: 12:30-13:45 + 17:30-20, ST: 12:30-13:45 + 18:30-20, ČT: 12:30-14:45 + 18:30-20, PÁ: 0, SO: 9-13 + 19-20, NE',
    'Ano',
    197,
    '2888842153/0800',
    '2022-12-01',
    'Má silný ruský přízvuj, není vhodný pro malé děti a sám to ani nechce. Pracuje také na škole Populo. Absolvent Masarykovy uni, obor Matematické modelování a numerické výpočty.',
    0,
    0,
    0,
    0,
    '2022-11-15',
    '2023-11-15',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    591,
    'Anna Mašková',
    'CZK',
    150,
    150,
    0,
    0,
    'Chce',
    '3',
    'PO: 16:30-18:30, ÚT: 16:30-18:30, ST: 0, ČT: 17:30-19, PÁ: 0, SO: 0, NE: 0',
    'Ano',
    198,
    '107-9555530217/0100',
    '2022-12-01',
    'Studuje gymnzium ve 4.ročníku.',
    200,
    200,
    0,
    0,
    '2022-11-23',
    '2023-11-23',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    601,
    'Martin Lichý',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '6',
    'PO: 16:30-19:30, ÚT: 0, ST: 17:30-20:30, ČT: 0, PÁ: 0, SO: 0, NE: 0',
    'Ano',
    199,
    '294322071/0300',
    '2022-12-01',
    '',
    0,
    0,
    0,
    0,
    '2022-11-15',
    '2023-11-15',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    611,
    'Eva Hermanová',
    'CZK',
    150,
    150,
    200,
    0,
    'Chce',
    '8',
    'PO: 0, ÚT: 0, ST: 14:30-20, ČT: 16:30-20, PÁ: 0, SO: 12-18, NE: 12-18',
    'Ano',
    201,
    '4695513002/5500',
    '2023-01-01',
    'Střední pedagogická škola FUTURUM, obor pedagogické lyceum, 3.ročník.',
    200,
    200,
    250,
    0,
    '2023-01-11',
    '2024-01-11',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    621,
    'Veronika Brožová',
    'CZK',
    150,
    150,
    0,
    0,
    'Nechce',
    '6',
    'PO: 16-19:30, ÚT: 16-19:30, ST: 0, ČT: 0, PÁ: 14-19:30, SO: kdykoli, NE: kdykoli',
    'Ano',
    202,
    '300533810/0300',
    '2023-01-01',
    'Šestileté Gymnázuim Na Pražačce s rozšířenou výukou německého jazyka, 3. ročník. Osobně jen na trase mezi Stodůlkama a Pražačkou.',
    200,
    200,
    0,
    0,
    '2023-01-12',
    '2024-01-12',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    631,
    'Kateřina Míšková',
    'CZK',
    150,
    150,
    0,
    0,
    'Nechce',
    '2',
    'PO: 15:45-20, ÚT: 18:15-20:30, ST: 15:45-20, ČT: 0, PÁ: 0, SO: 0, NE: 0',
    'Ano',
    203,
    '7939843002/5500',
    '2023-01-01',
    'Gymnázium 1.ročník. Anglicky umí z americké školy ze zahraničí. Lekce jedině online, bydlí v Davli za Prahou.',
    0,
    0,
    0,
    0,
    '2023-01-12',
    '2024-01-12',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    641,
    'Adam Pitro',
    'CZK',
    150,
    150,
    0,
    0,
    'Nechce',
    '7',
    'PO: 15-16:30, ÚT: 0, ST: 15-16:30, ČT: 15-20, PÁ: 0, SO: 0, NE: 14-20',
    'Ano',
    204,
    '4604451003/0800',
    '2023-01-01',
    'Osobně jen P3, P9, 10. Střední průmyslová škola elektrotechnická, Praha 10, V Úžlabině 320 obor: IT první ročník. S klientkou Krsak domluveno odměna 225 Kč/hodina (2 osoby).',
    200,
    200,
    0,
    0,
    '2023-01-15',
    '2024-01-15',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    651,
    'Adéla Pirošová',
    'CZK',
    150,
    150,
    0,
    0,
    'Chce',
    '5',
    'PO: 15-18, ÚT: 0, ST: 14-19, ČT: 0, PÁ: 0, SO: 0, NE: 13:30-17',
    'Ano',
    205,
    '8293801456/5500',
    '2023-01-01',
    '1. ročník pedagogické školy',
    200,
    200,
    0,
    0,
    '2023-01-15',
    '2024-01-15',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    661,
    'Petr Ryšlavý',
    'CZK',
    150,
    150,
    200,
    400,
    'Nechce',
    '8',
    'PO: 18-21, ÚT: 0, ST: 18-21, ČT: 18-21, PÁ: 18-21, SO: 0, NE: 15-21',
    'Ano',
    206,
    '1108058073/0800',
    '2023-01-01',
    '',
    0,
    0,
    0,
    0,
    '2023-01-19',
    '2024-01-19',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    671,
    'Václav Petráň',
    'CZK',
    150,
    150,
    200,
    0,
    'Chce',
    '5',
    'PO: 0, ÚT: 0, ST: 0, ČT: 0, PÁ: 0, SO: 0, NE: 0',
    'Ano',
    207,
    '1883767014/3030',
    '2023-01-01',
    'Studuje obor Informatika se zaměřením na vzdělávání na UK, 1. ročník bakalářského studia.',
    200,
    200,
    250,
    0,
    '2023-01-19',
    '2024-01-19',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    681,
    'Taťána Kadlecová',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '40',
    'PO: 10-15 + 17:30-20, ÚT: 10-14 + 17:45-20, ST: 12:18:30, ČT: 10-14 + 17:45-20, PÁ: 10-15 + 17:30-19, SO: 0, NE: 0',
    'Ano',
    208,
    '2701794797/2010',
    '2023-01-01',
    'Chce lekce jedině online.',
    0,
    0,
    0,
    0,
    '2023-01-22',
    '2024-01-22',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    691,
    'Dana Šipulová',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '6',
    'PO: 0, ÚT: 16-21, ST: 0, ČT: 16-21, PÁ: 17-21, SO: 15-20, NE: 0',
    'Ano',
    209,
    '104169660/0300',
    '2023-01-01',
    'Učitelka matiky, moc milá paní.',
    0,
    0,
    0,
    0,
    '2023-01-19',
    '2024-01-19',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    701,
    'Josef Zemek',
    'CZK',
    0,
    0,
    0,
    0,
    'Nechce',
    '0',
    'PO: 0, ÚT: 0, ST: 0, ČT: 0, PÁ: 0, SO: 0, NE: 0',
    'Ano',
    210,
    '8278820018/4000',
    '2023-01-01',
    'Chce doučovat pouze VŠ! nenabízet ZŠ, ani SŠ (chtěl by vyšší hodinovou sazbu a to minimálně 350 Kč/hod). Online ne-neumí to moc s počítačem. Na pohovoru sám řekl, že pokud se mu naskytne jiná, výhodnější nabídka, tak by nám ihned doučování přerušil. Chtěl by doučovat hlavně skupinové lekce v učebně - to bych nedoporučovala, dokud se neosvědčí, mluví dost arogantně. Radí, jak bychom měli Dobest vést, co změnit apod... ',
    0,
    0,
    0,
    450,
    '2023-01-23',
    '2024-01-23',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    711,
    'Miroslav Balík',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '20',
    'PO: 8-20, ÚT: 17-20, ST: 10-20, ČT: 17-20, PÁ: 10-20, SO: 9-20, NE: 9-20',
    'Ano',
    212,
    '272786932/0300',
    '2023-01-01',
    'Šilhá, dělá maséra.',
    0,
    0,
    0,
    0,
    '2023-01-22',
    '2024-01-22',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    721,
    'David Kopčan',
    'CZK',
    150,
    150,
    200,
    0,
    'Chce',
    '2',
    'PO: 0, ÚT: 15-19:30, ST: 0, ČT: 17-19, PÁ: 14-18, SO: 9-11 + 15-18, NE: 0',
    'Ano',
    213,
    '35-5511740257/0100',
    '2022-12-01',
    'Preferuje online, osobně pouze na Praze 8 nebo P20. Studuje Karlínské gymnázium 4. ročník.',
    200,
    200,
    250,
    0,
    '2022-12-05',
    '2023-12-05',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    731,
    'Jana Krůtová',
    'CZK',
    150,
    150,
    0,
    0,
    'Chce',
    '5',
    'PO: 14-15 pouze Jižní Město, ÚT: 17 a dál, ST: 13:30 a dál, ČT: 17 a dál, PÁ: 15 a dál, SO:  kdykoliv, NE:  kdykoliv',
    'Ano',
    214,
    '2514404028/3030',
    '2023-01-01',
    'Osobně ideálně Jižní Město, Petrovice, Měcholupy, Hostivař. Studuje všeobecné osmileté gymnázium, sedmý ročník.',
    200,
    200,
    0,
    0,
    '2023-01-23',
    '2024-01-23',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    741,
    'Jiří Šlaj',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '10',
    'PO: 14 a dál, ÚT: 16 a dál, ST: 16 a dál, ČT: 16 a dál, PÁ: 0, SO: 0, NE: 0',
    'Fakturujeme',
    0,
    '2252845017/3030',
    '2023-02-01',
    'Dokončuje magisterské studium na PF v Ústí nad Labem.',
    200,
    200,
    250,
    0,
    '2023-03-30',
    '2023-03-30',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    751,
    'Lucie Klasová',
    'CZK',
    150,
    150,
    200,
    0,
    'Chce',
    '10',
    'PO: 12:30-16, ÚT: 15:30-17:30, ST: 10-11:30, ČT: 0, PÁ: 0, SO: 0, NE: 10-12 + 15-17',
    'Ano',
    217,
    '43-9889730227/0100',
    '2023-02-01',
    'Experimentální molekulární biologie - Molekulární biologie a genetika (PřF MUNI), 1. ročník. ',
    0,
    0,
    0,
    0,
    '2023-02-07',
    '2024-02-07',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    761,
    'Sanzhar Nurakunov',
    'CZK',
    150,
    150,
    0,
    0,
    'Nechce',
    '20',
    'PO: kdykoliv, ÚT: kdykoliv, ST: kdykoliv, ČT: kdykoliv, PÁ: kdykoliv, SO: kdykoliv, NE: kdykoliv',
    'Ano',
    218,
    '1150273009/2700',
    '2023-02-01',
    'Obecná matematika, 2.rok,  jen rusky.',
    200,
    200,
    0,
    0,
    '2023-02-07',
    '2024-02-07',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    771,
    'David Hrdina',
    'CZK',
    150,
    150,
    200,
    0,
    'Chce',
    '4',
    'PO: 18-21, ÚT: 15-21, ST: 14:30-16, ČT: 15-21, PÁ: 0, SO: 0, NE: 0',
    'Ano',
    219,
    '123-2694810217/0100',
    '2023-02-01',
    '1. ročník bakalářského studia na přírodovědecké fakultě UK (obor Klinická a toxikologická analýza)',
    200,
    200,
    250,
    0,
    '2023-02-03',
    '2024-02-03',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    781,
    'Kristina Rossi',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '6',
    'PO: 14-16:30, ÚT: 14-20, ST: 0, ČT: 16:30-20, PÁ: 10:30-15, SO: dle domluvy, NE: dle domluvy',
    'Ano',
    220,
    '262591015/0300',
    '2023-02-01',
    'Preferuje online, lze se domluvit i prezenčně v Brně. Biologie + geografie a kartografie se zaměřením na vzdělávání,  Přírodovědecká fakulta 2.ročník.',
    200,
    200,
    250,
    0,
    '2022-11-15',
    '2023-11-15',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    791,
    'Adéla Dondová',
    'CZK',
    150,
    150,
    200,
    0,
    'Chce',
    '20',
    'PO: 14:30-18, ÚT: 0, ST: 0, ČT: 15:30-16:30, PÁ: 14:30-18, SO: 10-18, NE: 10-18',
    'Ano',
    221,
    '2757904123/0800',
    '2023-02-01',
    'Vyšší zdravotnická škola a střední zdravotnická škola, obor aplikovaná chemie, zaměření farmaceutické substance, .ročník.',
    200,
    200,
    250,
    0,
    '2023-01-31',
    '2024-01-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    801,
    'Natália Talábová',
    'CZK',
    150,
    150,
    200,
    400,
    'Nechce',
    '10',
    'PO: 17-20, ÚT: 0, ST: 10-16, ČT: 8-16, PÁ: 14-18 online, SO: 14-18 online, NE: 0',
    'Ano',
    223,
    'CZ5555000000002611200035',
    '2023-02-01',
    'Matematika, 3. ročník VŠ, Slovenka.',
    200,
    200,
    250,
    450,
    '2023-03-01',
    '2024-03-01',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    811,
    'Agáta Lorencová',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '1',
    'PO: 0, ÚT: 16:15-18, ST: 17-19, ČT: 0, PÁ: 16:15-17:45, SO: dle domluvy, NE: dle domluvy',
    'Ano',
    225,
    '3163139043/0800 ',
    '2023-02-01',
    'Gymnázium Nový PORG, ročník kvinta. Pohybuje se převážně na Praze 4 , 10 a 12, tedy pokud by byla nabídka někde poblíž, vyhovovalo by jí to. ',
    200,
    200,
    250,
    0,
    '2023-01-23',
    '2024-01-23',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    821,
    'Karolína Jírová',
    'CZK',
    150,
    150,
    200,
    0,
    'Chce',
    '20',
    'PO: 14-18, ÚT: 0, ST: 0, ČT: 14-19, PÁ: 14-19, SO: dle domluvy, NE: dle domluvy',
    'Ano',
    226,
    '2904403143/0800',
    '2023-02-01',
    'Preferuji osobně (Brno), možno i online. Právnická fakulta Masarykovy univerzity v Brně, 1. ročník.',
    200,
    200,
    250,
    0,
    '2023-02-15',
    '2024-02-15',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    831,
    'Tomáš Nečesaný',
    'CZK',
    150,
    150,
    200,
    400,
    'Nechce',
    '10',
    'PO: od 17, ÚT: od 15, ST: od 15, ČT: od 18, PÁ: kdykoliv, SO: kdykoliv, NE: kdykoliv',
    'Ano',
    227,
    '96572002/5500',
    '2023-02-01',
    'Záleží na dnech výuky a délce lekcí, odhadem 8-10 hodin (neví, jestli to není přepálené, není v tomto ohledu zkušený, kolik času bude na jednu lekci reálně třeba včetně přípravy). 4. ročník, Vysoké učení technické, Fakulta strojního inženýrství, obor Matematické inženýrství.',
    200,
    200,
    250,
    450,
    '2023-02-20',
    '2024-02-20',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    841,
    'Jakub Hrubý',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '6',
    'PO: 13-15 online, ÚT: 12:30-14 osobně kdekoliv, ST: od 14 dle druhé práce, ČT: od 16 dle druhé práce, PÁ: závisí na druhé práci,',
    'Ano',
    228,
    '3100378063/0800',
    '2023-02-01',
    'Chemie a přírodopis, 2. semestr Bc. studia',
    200,
    200,
    250,
    0,
    '2023-02-16',
    '2024-02-16',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    851,
    'Marie Venerová',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '13',
    'PO: 0, ÚT: 0, ST: 0, ČT: 12:30-13:30 + 16:00-20:00, PÁ: 13:30-15:30, SO: 14:00-20:00, NE: 0',
    'Ano',
    229,
    '670100-2218780109/6210',
    '2023-02-01',
    'Střední škola umění a designu Brno Husova 10, 2.ročník',
    200,
    200,
    250,
    0,
    '2023-02-13',
    '2024-02-13',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    861,
    'Marie Holopírková',
    'CZK',
    0,
    0,
    0,
    0,
    'Chce',
    '0',
    'PO: 16:00-20:00, ÚT: 16:00-20:00, ST: 16:00-20:00, ČT: 0, PÁ: 0, SO: 0, NE: 0',
    'Ano',
    230,
    '4585865023/0800',
    '2023-02-01',
    'Technologie piva, vína, lihu - 2. ročník',
    200,
    200,
    0,
    0,
    '2023-02-15',
    '2024-02-15',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    871,
    'Antonín Terber',
    'CZK',
    150,
    150,
    0,
    0,
    'Fakturujeme',
    '10',
    'PO: podle požadavků, ÚT: podle požadavků, ST: podle požadavků, ČT: podle požadavků, PÁ: podle požadavků, SO: podle požadavků, NE',
    'Fakturujeme',
    0,
    '284138617/0300',
    '2023-03-01',
    'Již nestuduje, starší pán. Praha, ale dojede i do širšího okolí.',
    200,
    200,
    0,
    0,
    '2023-03-31',
    '2023-03-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    881,
    'Ondřej Feikl',
    'CZK',
    150,
    150,
    200,
    0,
    'Chce',
    '3',
    'PO: 13:00 - 15:30 + od 18:00, ÚT: od 18:00, ST: sudé týdny 14:30 - 17:00; liché týdny od 14:30, ČT: sudé týdny od 16:30; liché t',
    'Ano',
    232,
    '115-4587720207/0100',
    '2023-03-01',
    'Pedagogická fakulta Univerzity Karlovy; 2. ročník',
    200,
    200,
    250,
    0,
    '2023-02-21',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    891,
    'Anna Nováková',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '0',
    'PO: 0, ÚT: 12:00-15:30 + 17:15-20:00, ST: 12:00-20:00, ČT: 12:00-15:30 + 17:15-20:00 (pouze jednou za dva týdny), PÁ: kdykoliv, ',
    'Ano',
    233,
    '290497659/0300',
    '2023-02-01',
    'První ročník, druhý semestr Právnická fakulta Masarykovy univerzity, obor: Právo a právní věda, magisterský studijní program',
    200,
    200,
    250,
    0,
    '2023-02-21',
    '2024-02-21',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    901,
    'Ondřej Zahálka',
    'CZK',
    150,
    150,
    0,
    0,
    'Nechce',
    '23',
    'PO: 0, ÚT: 0, ST: 14:30 - 17:00 (záleží na dopravě), ČT: 0, PÁ: 14:30 - 17:00 (záleží na dopravě), SO: 10:00 - 18:00 (spíše onli',
    'Ano',
    234,
    '2479044011/3030',
    '2023-02-01',
    '',
    200,
    200,
    0,
    0,
    '2023-02-16',
    '2024-02-16',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    911,
    'Anna Němcová',
    'CZK',
    150,
    150,
    0,
    0,
    'Nechce',
    '12',
    'PO: 15:00 - 18:00, ÚT: 15:00 - 18:00, ST: 0, ČT: 0, PÁ: 15:00 - 17:00, SO: 12:00 - 17:00 , NE: 12:00 - 17:00 ',
    'Ano',
    235,
    '4815397043/0800',
    '2023-03-01',
    'Veřejnosprávní činnost 1.ročník',
    200,
    200,
    0,
    0,
    '2023-02-07',
    '2024-02-07',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    921,
    'Adéla Vlčková',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '0',
    'PO: od rána do 17, ÚT: od rána do 11 + od 15 do večera, ST: 0, ČT: kdykoli, PÁ: 16:30 - 17:30, SO: individuálně, NE: individuáln',
    'Ano',
    236,
    '2013247028/3030',
    '2023-03-01',
    'ČZU - Podnikání a Administrativa, 1.ročník. Preferuje osobně, ale nejlépe v okolí Prahy 5.',
    200,
    200,
    250,
    0,
    '2023-03-07',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    931,
    'Agáta Šedivá',
    'CZK',
    150,
    150,
    200,
    0,
    'Chce',
    '3',
    'PO: od 16h, ÚT: od 14h, ST: 0, ČT: od 16h, PÁ: 14-15h, SO: 0, NE: 0',
    'Ano',
    237,
    '263420568/0300',
    '2023-03-01',
    'Gymnázium Jiřího Gutha-Jarkovského, sexta. Osobně preferuje spíše okolí centra Prahy.',
    200,
    200,
    250,
    0,
    '2023-03-01',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    941,
    'Lucie Vaňková',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '8',
    'PO: 16-20, ÚT: 0, ST: 16-20, ČT: 15-20, PÁ: nepravidelně 15-20, SO: 0, NE: 0',
    'Ano',
    238,
    '1087605073/0800',
    '2023-02-01',
    'učitelka na gymnáziu',
    200,
    200,
    250,
    0,
    '2023-02-23',
    '2024-02-23',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    951,
    'Alexandr Vondra',
    'CZK',
    150,
    150,
    0,
    0,
    'Nechce',
    '10',
    'PO: 17-21, ÚT: 0, ST: 17-21, ČT: 17-21, PÁ: 17-21, SO: 18-21, NE: 18-21',
    'Ano',
    239,
    '2371701016/3030',
    '2023-03-01',
    'Gymnázium bez zaměření, 7. ročník (3.ročník SŠ). Preferuje online.',
    200,
    200,
    0,
    0,
    '2023-03-01',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    961,
    'Ondřej Peleška',
    'CZK',
    150,
    150,
    200,
    400,
    'Chce',
    '3',
    'PO: 15-17, ÚT: 16-18, ST: 0, ČT: 0, PÁ: 16-18, SO: pouze online po domluvě, NE: pouze online po domluvě',
    'Ano',
    240,
    '2901663388/2010',
    '2023-01-01',
    'Studuje obor Historie ve třetím ročníku bakaláře na Filozofické fakultě Univerzity Karlovy.',
    200,
    200,
    250,
    450,
    '2023-01-25',
    '2024-01-25',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    971,
    'Eliška Baudišová',
    'CZK',
    150,
    150,
    200,
    0,
    'Chce',
    '4',
    'PO: 16-21, ÚT: 16-21, ST: 14-20, ČT: 17-20, PÁ: 0, SO: 0, NE: 16-20',
    'Ano',
    241,
    '1829600010/3030',
    '2023-02-01',
    'Ekonomické lyceum ve 4. ročníku',
    200,
    200,
    250,
    0,
    '2023-02-03',
    '2024-02-03',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    981,
    'Sára Malingerová',
    'CZK',
    150,
    150,
    0,
    0,
    'Nechce',
    '3',
    'PO: 0, ÚT: 16-18, ST: 0, ČT: 16-18, PÁ: 15-18, SO: dle domluvy, NE: dle domluvy',
    'Ano',
    242,
    '670100-2216804234/6210',
    '2023-03-01',
    'SŠ Charbulova Brno, obor - kosmetické služby, 2. ročník',
    200,
    200,
    0,
    0,
    '2023-03-06',
    '2024-03-06',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    991,
    'Jan Krist',
    'CZK',
    0,
    0,
    200,
    400,
    'Nechce',
    '0',
    'PO: 0, ÚT: 0, ST: kdykoliv, ČT: kdykoliv, PÁ: kdykoliv, SO: kdykoliv, NE: kdykoliv',
    'Ano',
    243,
    '158757265/0300',
    '2023-03-01',
    'Abs. VŠE, FF UK',
    0,
    0,
    250,
    450,
    '2023-03-07',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1001,
    'Filip Šlosárek',
    'CZK',
    0,
    0,
    200,
    0,
    'Chce',
    '10',
    'PO: 17-20, ÚT: 0, ST: 16-20, ČT: 17-20, PÁ: 0, SO: 0, NE: 0',
    'Ano',
    244,
    '4327375013/0800',
    '2023-03-01',
    'fyzika plazmatu a termojaderné fúze na FJFI ČVUT v Praze, 1. ročník bakalářského studia',
    0,
    0,
    250,
    0,
    '2023-04-08',
    '2023-04-08',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1011,
    'Eliška Podoláková',
    'CZK',
    150,
    150,
    200,
    400,
    'Chce',
    '20',
    'PO: 17-22, ÚT: 17-22, ST: 17-22, ČT: 17-22, PÁ: 17-22, SO: 8-11 + 17-22, NE: 0',
    'Ano',
    245,
    '2661844103/0800',
    '2023-03-01',
    '5., Bioanalytická laboratorní diagnostika ve zdravotnictví',
    0,
    0,
    0,
    0,
    '2023-04-08',
    '2023-04-08',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1021,
    'Anna Lechnýřová',
    'CZK',
    0,
    0,
    0,
    0,
    'Chce',
    '5',
    'PO: 12-18, ÚT: 15-18, ST: 0, ČT: 0, PÁ: 10-16, SO: 10-16, NE: 0',
    'Ano',
    246,
    '916091002/5500',
    '2023-03-01',
    'Studuje Biologii, geologii a enviromentalistiku a výchovu ke zdraví se zaměřením na vzdělávání na pedagogické fakultě Univerzity Karlovy v Praze.',
    200,
    200,
    250,
    0,
    '2023-04-08',
    '2023-04-08',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1031,
    'Veronika Bišková',
    'CZK',
    150,
    150,
    0,
    0,
    'Chce',
    '6',
    'PO: 14-18, ÚT: 0, ST: 14-18:30, ČT: 0, PÁ: 15-17:30, SO: kdykoli, NE: do 18',
    'Ano',
    247,
    '947476001/5500',
    '2023-03-01',
    '5. ročník osmiletého všeobecného gymnázia',
    0,
    0,
    0,
    0,
    '2023-03-13',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1041,
    'Martin Engst',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '4',
    'PO: 14-15:30, ÚT: 15-18, ST: 14-15:30 + 18-20, ČT: 0, PÁ: 0, SO: 0, NE: 0',
    'Ano',
    248,
    '1027638949/5500',
    '2023-03-01',
    'Fakulta stavební ČVUT v Praze, 1. ročník. Bioinformatika na VŠCHT v první ročníku magisterského studia.',
    200,
    200,
    250,
    0,
    '2023-03-22',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1051,
    'Matěj Vondrák',
    'CZK',
    150,
    150,
    0,
    0,
    'Nechce',
    '3',
    'PO: od 16 hodin v uvedených lokalitách, případně online, ÚT: od 16 hodin v uvedených lokalitách, případně online, ST: od 16 hodi',
    'Ano',
    249,
    '4103878033/0800',
    '2023-03-01',
    'Gymnázium Christiana Dopplera, 2. ročník, Preferuje osobně Prahu 1,2, 5, 4. Jinak online.',
    200,
    200,
    0,
    0,
    '2023-03-22',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1061,
    'Klára Štepánková',
    'CZK',
    150,
    150,
    200,
    400,
    'Chce',
    '3',
    'PO: 12-13, ÚT: 15-19, ST: 8-9:30 + 13:30-16:30, ČT: 0, PÁ: 16-17:30, SO: 8-19, NE: 8-19',
    'Ano',
    250,
    '1853897002/5500',
    '2023-03-01',
    'Fakulta stavební ČVUT v Praze, 1. ročník',
    200,
    200,
    250,
    450,
    '2023-03-20',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1071,
    'Jakub Kamenický',
    'CZK',
    150,
    150,
    200,
    400,
    'Nechce',
    '8',
    'PO: 8:00 – 11:00 + 16:00 – 20:00, ÚT: 16-20, ST: 0, ČT: 14-16, PÁ: pouze online, SO: pouze online, NE: pouze online',
    'Ano',
    251,
    '115-3497790207/0100',
    '2023-04-01',
    'VŠCHT 1. ročník navazujícího magisterského studia (chemické inženýrství a bioinženýrství)',
    200,
    200,
    250,
    450,
    '2023-03-01',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1081,
    'Jana Neužilová',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '3',
    'PO: 0, ÚT: 0, ST: 10:00-13:30 + 16:00-18:00, ČT: 11:00-13:30 pouze online, PÁ: 11:00-16:00 pouze online, SO: 0, NE: 0',
    'Ano',
    252,
    '1029461067/5500',
    '2023-04-01',
    'navazující magisterské studium, 2. ročník, překladatelství německého jazyka na FF MUNI, osobně pouze Brno-Královo Pole nebo Brno-střed',
    200,
    200,
    250,
    0,
    '2023-02-20',
    '2024-02-20',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1091,
    'Sofiya Shevtsova',
    'CZK',
    150,
    150,
    200,
    400,
    'Nechce',
    '15',
    'PO: 12:00-14:00 + 16:30-21:30, ÚT: 10:00-21:30, ST: 0, ČT: 18:30-21:30, PÁ: 7:00-14:00 + 16:30-19:00 (19:00-21:30 dle domluvy), ',
    'Ano',
    253,
    '6115084002/5500',
    '2023-04-01',
    'absolventka - studium Řízení průmyslových systémů',
    0,
    0,
    0,
    0,
    '2023-04-01',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1101,
    'Matěj Bodiš',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '10',
    'PO: od 16:30 (lze se domluvit i na dříve), ÚT: od 16:30 (lze se domluvit i na dříve), ST: od 16:30 (lze se domluvit i na dříve),',
    'Ano',
    254,
    '6896646003/2700',
    '2023-04-01',
    'Veřejná správa 1. ročník, osobně nejlépe v Zemské knihovně Brno',
    200,
    200,
    250,
    0,
    '2023-03-14',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1111,
    'Anežka Geislerová',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '9',
    'PO: 0, ÚT: 0, ST: 14-18, ČT: 0, PÁ: 0, SO: 10:00-12:00 + 13:00-15:00, NE: 10:00-12:00 + 18:00-19:00',
    'Ano',
    255,
    '123-3541960227/0100',
    '2023-03-01',
    'Všeobecně zaměřené gymnázium, septima. Online nebo Praha 5 a 1.',
    200,
    200,
    250,
    0,
    '2023-03-01',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1121,
    'Marie Jurenová',
    'CZK',
    150,
    150,
    0,
    0,
    'Nechce',
    '15',
    'PO: 16-19, ÚT: 9-11, ST: 16-19, ČT: 16-19, PÁ: 14-17, SO: 10-13, NE: 0',
    'Ano',
    256,
    '2774784063/0800',
    '2023-03-01',
    'Vyšší odborná škola sociálně právní - Jahodovka, sociální pedagogika, 1. ročník. Online nebo Praha 3, 2, 10.',
    200,
    200,
    0,
    0,
    '2023-03-01',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1131,
    'Anna Šaffková',
    'CZK',
    0,
    0,
    0,
    0,
    'Nechce',
    '12',
    'PO: 0, ÚT: 0, ST: 16-19, ČT: 16-19, PÁ: 15-19, SO: 0, NE: 9-19',
    'Ano',
    257,
    '670100-2216196865/6210',
    '2023-04-01',
    'Lyceum Elijáš, 4. ročník',
    200,
    200,
    250,
    0,
    '2023-05-04',
    '2023-05-04',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1141,
    'Ludmila Bukovič Orságová',
    'CZK',
    150,
    150,
    200,
    400,
    'Fakturujeme',
    '15',
    'PO: po domluvě, ÚT: 17-20, ST: 17-20, ČT: po domluvě, PÁ: 17-20, SO: v nutných případech ano, jinak spíše ne, NE: v nutných příp',
    'Fakturujeme',
    258,
    '670100-2217728333/6210',
    '2023-05-01',
    'Pracuje. Může pracovat i s předškoláky. Může dělat různé workouty. Je i přísedící u soudu, má široké pole působnosti. Online nebo Praha 1 a 4.',
    200,
    200,
    250,
    450,
    '2023-05-04',
    '2023-05-04',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1151,
    'Světlana Štrajtová',
    'CZK',
    150,
    150,
    200,
    0,
    'Fakturujeme',
    '25',
    'PO: denně 5 hodin flexibilně dle domluvy, ÚT: denně 5 hodin flexibilně dle domluvy, ST: denně 5 hodin flexibilně dle domluvy, ČT',
    'Fakturujeme',
    259,
    '123-2914910237/0100',
    '2023-05-01',
    'Dokončen bakalářský stupeň Speciální pedagogika, vychovatelství. Pracuje z domu, podniká. Energická ženská, sympatická. Offline v Brně.',
    200,
    200,
    250,
    0,
    '2023-05-31',
    '2023-05-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1161,
    'Marcela Hamplová',
    'CZK',
    150,
    150,
    200,
    0,
    'Chce',
    '12',
    'PO: kdykoliv po domluvě, ÚT: 0, ST: 0, ČT: kdykoliv po domluvě, PÁ: kdykoliv po domluvě, SO: kdykoliv po domluvě, NE: 0',
    'Ano',
    260,
    '2412200227/5500',
    '2023-05-01',
    'Teorie interaktivních médií na Filozofické fakultě Masakyrovy univerzity, 1. ročník, 2. semestr. Osobní setkání v centru Brna, možnost rezervace týmové učebny na FF MU, bohužel nemůžu dojíždět mimo centrum, preferuji online, osobně po domluvě v rámci cenra Brna. Max.3h denně.',
    200,
    200,
    250,
    0,
    '2023-03-13',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1171,
    'Erdenetegsh Dulamjav',
    'CZK',
    150,
    150,
    0,
    0,
    'Chce',
    '4',
    'PO: 15-18, ÚT: 15-18, ST: 0, ČT: 15-18, PÁ: 0, SO: 14-18, NE: 14-18',
    'Ano',
    261,
    '4612245023/0800',
    '2023-05-01',
    'Střední škola obchodní, belgická, obor Obchodník 1. ročník. Offline Praha centrum nebo Praha 2.',
    200,
    200,
    0,
    0,
    '2023-04-20',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1181,
    'Lucie Budáková',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '20',
    'PO: 8-17, ÚT: celý den, ST: do 16h, ČT: do 17h, PÁ: do 13h, SO: 0, NE: většinou celý den',
    'Ano',
    262,
    '199054240/0300',
    '2023-05-01',
    '4. ročník Gymnázium Kadaň. Radonice u Kadaně (doučování z domova).',
    0,
    0,
    0,
    0,
    '2023-05-01',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1191,
    'Šárka Kopencová',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '10',
    'PO: 0, ÚT: 0, ST: 0, ČT: 16:45 - 18:15 online, PÁ: od 18 online, SO: celý den offline/online, NE: celý den offline/online',
    'Ano',
    263,
    '104748152/2250',
    '2023-05-01',
    'Pracuje jako učitelka v mateřské škole, ale věnuje se aktivně doučování. ',
    200,
    200,
    250,
    0,
    '2023-05-01',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1201,
    'Erika Maliníková',
    'CZK',
    150,
    150,
    200,
    400,
    'Nechce',
    '6',
    'PO: 15-20, ÚT: 15-20, ST: 15-20, ČT: 15-20, PÁ: 15-20, SO: celý den, NE: odpoledne',
    'Ano',
    264,
    '670100-2222261651/6210',
    '2023-05-01',
    'Pracuje, preferuje osobně. Osobně Praha 8+9.',
    200,
    200,
    250,
    450,
    '2023-04-21',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1211,
    'Linda Opočenská',
    'CZK',
    150,
    150,
    0,
    0,
    'Nechce',
    '3',
    'PO: 0, ÚT: 0, ST: 16:30 - 17:30, ČT: 0, PÁ: 17-18, SO: 0, NE: 14-15',
    'Ano',
    265,
    '4424484043/0800',
    '2023-05-01',
    'Sociální činnost (SŠ), 1.ročník',
    0,
    0,
    0,
    0,
    '2023-04-20',
    '2023-12-31',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1221,
    'Jakub Kučera',
    'CZK',
    150,
    150,
    0,
    0,
    'Chce',
    '3',
    'PO: 0, ÚT: 0, ST: 15:30 - 18:00, ČT: 14:35 - 18:00, PÁ: 14:35 - 18:00, SO: kdykoli, NE: kdykoli',
    'Ano',
    266,
    '4265673073/0800',
    '2023-06-01',
    'Preferuje osobní setkání na veřejných místech, například MZK. 2. ročník gymnázia.',
    200,
    200,
    0,
    0,
    '2023-06-01',
    '2024-06-30',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1231,
    'Kryštof Cikrle',
    'CZK',
    150,
    150,
    200,
    0,
    'Chce',
    '2',
    'PO: 17-20, ÚT: 16-20, ST: 0, ČT: 17-20, PÁ: 16-20, SO: 9-20, NE: 9-20',
    'Ano',
    267,
    '4980023053/0800',
    '2023-06-01',
    'Preferuje osobně (pouze Brno), může i online. Gymnázium; 2. ročník.',
    200,
    200,
    250,
    0,
    '2023-06-01',
    '2024-06-30',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1241,
    'Polina Ryzhova',
    'CZK',
    150,
    150,
    200,
    0,
    'Chce',
    '20',
    'PO: 0, ÚT: 17-20, ST: 0, ČT: 16-20, PÁ: 15-20, SO: 10-20, NE: 10-20',
    'Ano',
    268,
    '2452212011/3030',
    '2023-06-01',
    'Všeobecné studium s rozšířenou výukou anglického jazyka - 1. ročník SŠ.',
    200,
    200,
    250,
    0,
    '2023-06-01',
    '2024-06-30',
    0
  );
INSERT INTO
  `salaries` (
    `id_sa`,
    `user`,
    `currency`,
    `zs1On`,
    `zs2On`,
    `ssOn`,
    `vsOn`,
    `pink`,
    `hours_per_week`,
    `time_possibilities`,
    `contract_signed`,
    `contract_number`,
    `bank_number`,
    `arrival`,
    `notes`,
    `zs1Off`,
    `zs2Off`,
    `ssOff`,
    `vsOff`,
    `contractStart`,
    `contractEnd`,
    `hasKeys`
  )
VALUES
  (
    1251,
    'Štěpánka Forejtová',
    'CZK',
    150,
    150,
    200,
    0,
    'Nechce',
    '6',
    'PO: 15-20, ÚT: 15-20, ST: 15-20, ČT: 15-20, PÁ: 15-20, SO: kdykoliv, NE: kdykoliv',
    'Ano',
    269,
    '153237076/0600',
    '2023-06-01',
    'Gymnázium, ve 2. ročníku. Dojede za žákem kamkoliv v rámci Praha-západ až do centra (ne Praha východ) + Kladno. Preferuje osobní (online pouze v případě nevyhovujícího místa/hodin).',
    200,
    200,
    250,
    0,
    '2023-05-12',
    '2023-12-31',
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: states
# ------------------------------------------------------------

INSERT INTO
  `states` (`id_sa`, `state`)
VALUES
  (1, 'Domluvena');
INSERT INTO
  `states` (`id_sa`, `state`)
VALUES
  (2, 'Proběhla');
INSERT INTO
  `states` (`id_sa`, `state`)
VALUES
  (3, 'Zrušena');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: students_info
# ------------------------------------------------------------

INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1, 63, 0, 0, 1, NULL, NULL, 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    31,
    141,
    0,
    0,
    1,
    'začátek 6.9. v 18.00, prosím o vystavení faktury na 300 Kč',
    NULL,
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (41, 151, 0, 0, 1, 'Český jazyk ', NULL, 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (51, 161, 0, 0, 1, 'Anglický jazyk ', NULL, 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    61,
    171,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    NULL,
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    71,
    181,
    0,
    0,
    1,
    'Matematika, český jazyk, anglický jazyk\n\nJde o 2 děti - chlapce a dívku ',
    NULL,
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    81,
    191,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    NULL,
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (91, 201, 0, 0, 1, 'Angličtina ', NULL, 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (101, 211, 0, 0, 1, 'Český jazyk ', NULL, 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (111, 221, 0, 0, 1, 'Český jazyk ', NULL, 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    121,
    231,
    0,
    0,
    1,
    'Matematika a český jazyk\nJde o 2 děti - chlapce a dívku ',
    NULL,
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (131, 241, 0, 0, 1, 'Matematika ', NULL, 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    141,
    251,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    NULL,
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (151, 261, 0, 0, 1, 'Matematika ', NULL, 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    161,
    271,
    0,
    0,
    1,
    'Český jazyk, příprava na přijímací řízení ',
    NULL,
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (171, 281, 0, 0, 3, 'Angličtina ', NULL, 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    181,
    291,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    NULL,
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (191, 301, 0, 0, 1, 'Český jazyk ', NULL, 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    211,
    321,
    0,
    0,
    3,
    'IT, matematika, fyzika ',
    NULL,
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    221,
    331,
    0,
    0,
    1,
    'Český jazyk a matematika, příprava na přijímací zkoušky ',
    NULL,
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    231,
    341,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    NULL,
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    241,
    351,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    NULL,
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    251,
    361,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na víceleté gymnázium',
    NULL,
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (261, 371, 0, 0, 1, 'Angličtina ', NULL, 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    271,
    381,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    NULL,
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (291, 551, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (301, 561, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (311, 571, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    321,
    581,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (331, 591, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    341,
    601,
    0,
    0,
    1,
    'Český jazyk a matematika ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    351,
    611,
    0,
    0,
    3,
    'Matematika a angličtina ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    361,
    621,
    0,
    0,
    1,
    'Matematika ',
    'Čtvrtek v 16.00',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (381, 641, 0, 0, 3, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (391, 651, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    401,
    661,
    0,
    0,
    1,
    'Matematika a fyzika ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (411, 671, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    421,
    681,
    0,
    0,
    1,
    'Matematika a český jazyk, 8.třída',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (431, 691, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    441,
    701,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (451, 711, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    461,
    721,
    0,
    0,
    1,
    'Matematika a fyzika ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    471,
    731,
    0,
    0,
    1,
    'matematika a český jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (481, 741, 0, 0, 1, 'Fyzika a chemie ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (491, 751, 0, 0, 3, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    501,
    761,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (511, 771, 0, 0, 1, 'Německý jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (521, 781, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    531,
    791,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    541,
    801,
    0,
    0,
    1,
    'Český jazyk a anglický jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (551, 811, 0, 0, 3, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (561, 821, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (571, 831, 0, 0, 1, 'Anglický jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    581,
    841,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (591, 851, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (601, 871, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (611, 881, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (621, 891, 0, 0, 1, 'Anglický jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    631,
    901,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (641, 911, 0, 0, 1, '', '', 3, NULL, 0, 3150);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (651, 931, 0, 0, 1, 'Německý jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (661, 941, 0, 0, 1, 'Angličtina ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (671, 951, 0, 0, 1, 'Fyzika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (681, 961, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (691, 971, 0, 0, 1, 'Anglický jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    701,
    981,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (711, 991, 0, 0, 1, 'Český jazyk ', '', 4, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    721,
    1001,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (731, 1011, 0, 0, 1, 'Německý jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (741, 1021, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (751, 1031, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (761, 1041, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    771,
    1051,
    0,
    0,
    1,
    'Český jazyk a anglický jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    781,
    1061,
    0,
    0,
    1,
    'Chemie, matematika, fyzika ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (791, 1071, 0, 0, 1, 'Anglický jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    801,
    1081,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    811,
    1091,
    0,
    0,
    3,
    'Německý jazyk, příprava na maturitu ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    821,
    1101,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    831,
    1111,
    0,
    0,
    1,
    'Český jazyk, anglický jazyk',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (841, 1121, 0, 0, 3, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (851, 1131, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (861, 1141, 0, 0, 1, 'Chemie ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (871, 1151, 0, 0, 1, 'Chemie ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (881, 1161, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (891, 1171, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (901, 1181, 0, 0, 1, '', 'út 17:30-18:30', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (911, 1191, 0, 0, 1, '', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (921, 1201, 0, 0, 1, '', 'čt 16-17', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (931, 1211, 0, 0, 1, '', 'čt 14:30-16', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (941, 1221, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (951, 1231, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (961, 1241, 0, 350, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (971, 1251, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    981,
    1261,
    0,
    0,
    1,
    'Matematika, fyzika ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    991,
    1271,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1001,
    1281,
    0,
    0,
    1,
    'Matematika, anglický jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1011, 1291, 0, 0, 1, 'Fyzika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1021, 1301, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1031, 1311, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1041,
    1321,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1051,
    1331,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1061, 1341, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1071,
    1351,
    0,
    0,
    1,
    'Matematika, český jazyk, anglický jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1081,
    1361,
    0,
    0,
    1,
    'Matematika, český jazyk, anglický jazyk, německý jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1091,
    1371,
    0,
    0,
    1,
    'Matematika, fyzika, chemie ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1101, 1381, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1111,
    1391,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1121,
    1401,
    0,
    0,
    1,
    '',
    'Matematika, český jazyk, anglický jazyk ',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1131, 1411, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1141, 1421, 0, 0, 1, 'Anglický jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1151, 1431, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1161,
    1441,
    0,
    0,
    1,
    'Matematika, český jazyk, anglický jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1171, 1451, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1181, 1461, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1191,
    1471,
    0,
    0,
    1,
    'Anglický jazyk, český jazyk, matematika, německý jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1201, 1481, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1211, 1491, 0, 0, 3, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1221, 1501, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1231,
    1511,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1241,
    1521,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1251, 1531, 0, 0, 1, 'Německý jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1261, 1541, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1271, 1551, 0, 0, 3, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1281,
    1561,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1291,
    1571,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1301,
    1581,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1311, 1591, 0, 0, 3, 'Fyzika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1321,
    1601,
    0,
    0,
    1,
    'Český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1331,
    1611,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na osmileté gymnázium ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1341,
    1621,
    0,
    0,
    1,
    'Matematika, fyzika, chemie ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1351,
    1631,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1361,
    1641,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1371, 1651, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1381,
    1661,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1391, 1671, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1401, 1681, 0, 0, 3, 'Fyzika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1411, 1691, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1421,
    1701,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1431, 1711, 0, 0, 3, 'Ruský jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1441,
    1721,
    0,
    0,
    1,
    'Zeměpis, přírodopis, dějepis ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1451,
    1731,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1461,
    1741,
    0,
    0,
    1,
    'Matematika a fyzika ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1471,
    1751,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1481,
    1761,
    0,
    0,
    1,
    'Matematika, příprava na víceleté gymnázium ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1491, 1771, 0, 0, 1, 'Fyzika', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1501, 1781, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1511,
    1791,
    0,
    0,
    1,
    'Matematika, český jazyk, anglický jazyk, dějepis ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1521, 1801, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1531,
    1811,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1541,
    1821,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1551,
    1831,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1561, 1841, 0, 0, 1, 'Český jazyk', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1571,
    1851,
    0,
    0,
    1,
    'Matematika a chemie ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1581, 1861, 0, 0, 3, 'Anglický jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1591, 1871, 0, 0, 3, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1601, 1881, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1611,
    1891,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1621,
    1901,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1631,
    1921,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1641, 1931, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1651, 1941, 0, 0, 3, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1661, 1951, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1671,
    1961,
    0,
    0,
    1,
    'Matematika a chemie ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1681,
    1971,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1691,
    1981,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1701,
    1991,
    0,
    0,
    3,
    'Matematika, příprava na maturitu ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1711,
    2001,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1721, 2011, 0, 0, 3, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1731,
    2021,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky, skupinové lekce ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1741,
    2031,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky, skupinové lekce ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1751,
    2041,
    0,
    0,
    1,
    'Český jazyk, příprava na přijímací zkoušky, skupinové lekce ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1761,
    2051,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1771, 2061, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1781,
    2071,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky, skupinové lekce ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1791,
    2081,
    0,
    0,
    3,
    'Matematika, příprava na maturitu ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1801,
    2091,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1811,
    2101,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky, skupinové lekce ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1821,
    2111,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1831,
    2231,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1841, 2241, 0, 0, 1, 'Anglický jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1851,
    2251,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1861,
    2261,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1871,
    2271,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1881,
    2281,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1891,
    2291,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1901,
    2301,
    0,
    0,
    1,
    'Matematika, dějepis ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1911,
    2311,
    0,
    0,
    3,
    'fyzika, příprava na maturitu ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1921, 2321, 0, 0, 1, 'Anglický jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1931,
    2331,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1941,
    2341,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (1951, 2351, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1961,
    2361,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1971,
    2371,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1981,
    2381,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    1991,
    2391,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2001, 2401, 0, 0, 1, 'Matematika, ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2011, 2411, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2021,
    2421,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2031,
    2431,
    0,
    0,
    1,
    'Matematika, německý jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2041, 2441, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2051,
    2451,
    0,
    0,
    1,
    'Český jazyk anglický jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2061, 2461, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2071,
    2471,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2081,
    2481,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2091,
    2491,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2101, 2501, 0, 0, 1, 'Český jazyk', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2111,
    2511,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2121, 2521, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2131, 2531, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2141, 2541, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2151,
    2551,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2161,
    2561,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2171,
    2571,
    0,
    0,
    1,
    'Český a anglický jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2181,
    2581,
    0,
    0,
    3,
    'Matematika a fyzika ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2191, 2591, 0, 0, 1, '', 'Anglický jazyk ', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2201, 2601, 0, 0, 3, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2211, 2611, 0, 0, 1, 'Anglický jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2221,
    2621,
    0,
    0,
    1,
    'Český jazyk, anglický jazyk \n\n',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2222, 2752, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2232, 2762, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2242,
    2772,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2252,
    2782,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2262,
    2792,
    0,
    0,
    3,
    'Matematika, anglický jazyk, IT',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2272, 2802, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2282,
    2812,
    0,
    0,
    1,
    'Český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2292, 2822, 0, 0, 1, 'Český jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2302, 2832, 0, 0, 1, 'Fyzika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2312,
    2842,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2322,
    2852,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2332,
    2862,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na osmileté gymnázium ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2342, 2872, 0, 0, 1, 'Španělský jazyk ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2352,
    2882,
    0,
    0,
    1,
    'Anglický a český jazyk',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2362,
    2892,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2372,
    2902,
    0,
    0,
    1,
    'matematika a český jazyk',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2382,
    2912,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2392,
    2922,
    0,
    0,
    1,
    'Matematika, příprava na šestileté gymnázium ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2402, 2932, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2412,
    2942,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2422,
    2952,
    0,
    0,
    1,
    'Matematika a fyzika ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2432, 2962, 0, 0, 3, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2442,
    2972,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2452, 2982, 0, 0, 1, 'Český jazyk \n\n', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2462,
    2992,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2472,
    3002,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2482,
    3012,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2492,
    3022,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2502,
    3032,
    8400,
    8400,
    1,
    'Matematika a český jazyk ',
    '',
    3,
    NULL,
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2512,
    3042,
    3850,
    2450,
    1,
    'Český jazyk ',
    '',
    3,
    NULL,
    0,
    -1400
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2522, 3052, 0, 0, 1, 'Matematika ', '', 3, NULL, 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2542,
    3352,
    788,
    175,
    1,
    'Matematika a český jazyk, 5. třída ',
    '',
    3,
    '',
    0,
    2012.5
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2552,
    3362,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2562,
    3372,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2572, 3382, 0, 0, 1, 'Český jazyk ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2582, 3392, 0, 0, 1, 'Fyzika ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2592, 3402, 0, 0, 1, 'Matematika ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2602, 3412, 0, 0, 1, 'Matematika ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2612, 3422, 0, 0, 3, 'Český jazyk ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2622,
    3432,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na osmileté gymnázium ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2632, 3442, 0, 0, 1, 'Matematika ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2642,
    3452,
    0,
    0,
    1,
    'Matematika, příprava na osmileté gymnázium ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2652,
    3462,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2662,
    3472,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2672,
    3482,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2682,
    3492,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2692,
    3512,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2702,
    3522,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2712, 3532, 0, 0, 3, 'Matematika ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2722,
    3542,
    0,
    0,
    3,
    'Český jazyk, maturita ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2732, 3552, 0, 0, 1, 'Matematika ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2742, 3562, 0, 0, 1, 'Anglický jazyk ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2752,
    3572,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2762, 3582, 0, 0, 1, 'Český jazyk ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2772,
    3592,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2782, 3602, 0, 0, 1, 'Matematika ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2792,
    3612,
    0,
    0,
    1,
    'Matematika a český jazyk ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2802,
    3622,
    0,
    0,
    1,
    'Matematika a fyzika ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2812, 3632, 0, 0, 1, 'Anglický jazyk ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2831,
    3671,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2841,
    3681,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2851, 3691, 0, 0, 1, 'Anglický jazyk ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2861,
    3701,
    0,
    0,
    1,
    'Anglický a český jazyk ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2871,
    3711,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2881,
    3721,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2891,
    3731,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na osmileté gymnázium ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2901, 3741, 0, 0, 3, 'Chemie ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2911,
    3751,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2921,
    3761,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2931,
    3771,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2941, 3781, 0, 0, 3, 'Matematika', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2951, 3791, 0, 0, 1, 'Matematika ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2961,
    3801,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2971, 3811, 0, 0, 1, 'Fyzika ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (2981, 3821, 0, 0, 3, 'Fyzika ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    2991,
    3831,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na šestileté gymnázium ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    3001,
    3841,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    3011,
    3851,
    0,
    0,
    1,
    'Matematika, příprava na osmileté gymnázium ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (3021, 3861, 0, 0, 1, 'Český jazyk ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    3031,
    3871,
    0,
    0,
    1,
    'Matematika a fyzika ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (3041, 3881, 0, 0, 3, 'Chemie ', '', 3, '', 0, 0);
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    3051,
    3891,
    0,
    0,
    1,
    'Matematika a fyzika ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    3061,
    3901,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    3071,
    3911,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    3081,
    3921,
    0,
    0,
    1,
    'Anglický jazyk a český jazyk ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    3091,
    3931,
    0,
    0,
    1,
    'Matematika, příprava na přijímací zkoušky na SŠ ',
    '',
    3,
    '',
    0,
    0
  );
INSERT INTO
  `students_info` (
    `id_stin`,
    `user`,
    `sent`,
    `spent`,
    `school`,
    `note`,
    `regular_lessons`,
    `student_active`,
    `symbol`,
    `prepaid`,
    `owned`
  )
VALUES
  (
    3101,
    3941,
    0,
    0,
    1,
    'Matematika a český jazyk, příprava na přijímací zkoušky na šestileté gymnázium ',
    '',
    3,
    '',
    0,
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: su_us
# ------------------------------------------------------------

INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1, 3, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2, 3, 1, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3, 3, 4, 'ZŠ1, ZŠ2, SŠ, VŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (4, 4, 2, 'ZŠ1, ZŠ2, SŠ', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (5, 4, 8, 'ZŠ1, ZŠ2, SŠ', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (6, 4, 1, 'ZŠ1, ZŠ2, SŠ', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (7, 5, 8, 'ZŠ1', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (8, 5, 2, 'ZŠ1', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (9, 6, 9, 'ZŠ1, ZŠ2, SŠ', 'Nevyplněno', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (10, 7, 6, 'SŠ, VŠ', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (11, 7, 2, 'SŠ', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (12, 7, 12, 'SŠ', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (13, 7, 13, 'SŠ', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (14, 8, 1, 'SŠ, VŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (15, 8, 15, 'SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (16, 11, 1, 'ZŠ1, ZŠ2', 'Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (17, 13, 13, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (18, 14, 9, 'ZŠ1, ZŠ2, SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (19, 14, 2, 'ZŠ1, ZŠ2, SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (20, 14, 8, 'ZŠ1, ZŠ2, SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (21, 15, 8, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (22, 15, 7, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (23, 15, 14, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (24, 15, 1, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (25, 15, 13, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (26, 16, 14, 'SŠ, VŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (27, 17, 8, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (28, 17, 1, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (29, 17, 2, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (30, 18, 8, 'ZŠ1', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (31, 18, 9, 'ZŠ1', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (32, 18, 3, 'ZŠ1', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (33, 18, 2, 'ZŠ1', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (34, 21, 2, 'ZŠ1, ZŠ2, SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (35, 22, 9, 'ZŠ1, ZŠ2, SŠ', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (36, 23, 8, 'ZŠ1, ZŠ2, SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (37, 23, 16, 'ZŠ1, ZŠ2, SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (38, 23, 13, 'ZŠ1, ZŠ2, SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (39, 24, 1, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (40, 24, 6, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (41, 24, 13, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (42, 24, 9, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (43, 25, 2, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (44, 25, 9, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (45, 26, 8, 'ZŠ1, ZŠ2, SŠ', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (46, 26, 7, 'ZŠ1, ZŠ2, SŠ', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (47, 28, 1, 'ZŠ1, ZŠ2', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (48, 28, 13, 'ZŠ1, ZŠ2', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (49, 29, 6, 'ZŠ1, ZŠ2', 'Nevyplněno', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (50, 29, 1, 'ZŠ1, ZŠ2', 'Nevyplněno', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (51, 30, 9, 'ZŠ1, ZŠ2, SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (52, 31, 2, 'ZŠ1, ZŠ2, SŠ', 'Nevyplněno', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (53, 31, 8, 'ZŠ1, ZŠ2, SŠ', 'Nevyplněno', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (54, 32, 2, 'ZŠ1, ZŠ2', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (55, 34, 2, 'ZŠ1, ZŠ2, SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (56, 36, 1, 'ZŠ1, ZŠ2, SŠ', 'Nevyplněno', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (57, 36, 12, 'ZŠ1, ZŠ2, SŠ', 'Nevyplněno', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (58, 36, 2, 'ZŠ1, ZŠ2, SŠ', 'Nevyplněno', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (59, 36, 8, 'ZŠ1, ZŠ2', 'Nevyplněno', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (60, 38, 1, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (61, 39, 8, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (62, 41, 1, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (63, 41, 8, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (64, 41, 2, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (65, 42, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (66, 42, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (67, 43, 2, 'SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (68, 43, 13, 'SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (69, 43, 6, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (70, 43, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (71, 44, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (72, 45, 7, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (73, 46, 17, 'ZŠ1, ZŠ2', 'Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (74, 46, 4, 'ZŠ1, ZŠ2', 'Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (76, 47, 9, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (77, 48, 8, 'ZŠ1, ZŠ2, SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (78, 48, 2, 'ZŠ1, ZŠ2, SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (79, 48, 1, 'ZŠ1', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (80, 48, 7, 'ZŠ1', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (81, 48, 18, 'ZŠ1', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (82, 49, 1, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (83, 49, 19, 'ZŠ1, ZŠ2, SŠ, VŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (84, 49, 20, 'ZŠ1, ZŠ2, SŠ, VŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (88, 50, 1, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (89, 50, 3, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (90, 50, 2, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (91, 51, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (92, 51, 2, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (93, 52, 1, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (94, 52, 8, 'ZŠ1, ZŠ3', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (95, 52, 2, 'ZŠ1, ZŠ4', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (96, 53, 1, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (97, 53, 21, 'ZŠ1, ZŠ2, SŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (98, 54, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (99, 54, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (100, 54, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (101, 54, 12, 'ZŠ1, ZŠ3', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (102, 54, 9, 'ZŠ1, ZŠ4', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (103, 54, 7, 'ZŠ1, ZŠ5', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (104, 55, 1, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (105, 55, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (106, 55, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (107, 55, 6, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (108, 56, 2, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (109, 57, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (110, 57, 3, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (111, 57, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (112, 57, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (113, 58, 2, 'ZŠ1, ZŠ2, SŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (114, 58, 9, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (115, 58, 4, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (116, 58, 8, 'ZŠ1, ZŠ2, SŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (117, 58, 1, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (118, 59, 1, 'ZŠ1, ZŠ2', 'Offline/online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (119, 59, 8, 'ZŠ1, ZŠ2', 'Offline/online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (120, 60, 10, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (121, 61, 10, 'VŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (122, 61, 22, 'VŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (123, 62, 8, 'ZŠ1, ZŠ2, SŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (124, 62, 23, 'ZŠ1', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (125, 65, 1, 'ZŠ1, ZŠ2, SŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (126, 65, 2, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (131, 66, 13, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (132, 66, 6, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (133, 66, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (134, 66, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (140, 67, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (141, 67, 9, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (142, 67, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (143, 67, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (144, 67, 24, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (
    145,
    68,
    6,
    'ZŠ1, ZŠ2, SŠ, VŠ (dle oboru)',
    'Online/Offline',
    2
  );
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (146, 68, 1, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (147, 69, 2, 'ZŠ1, ZŠ2, SŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (148, 69, 8, 'ZŠ1, ZŠ2, SŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (149, 69, 11, 'ZŠ1, ZŠ2, SŠ, VŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (150, 70, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (151, 70, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (152, 70, 1, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (153, 71, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (154, 71, 7, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (155, 72, 1, 'ZŠ2, ZŠ2, SŠ, VŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (156, 73, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (157, 73, 8, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (158, 73, 1, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (159, 74, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (160, 74, 1, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (161, 74, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (162, 74, 25, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (163, 74, 18, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (164, 74, 13, 'SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (165, 74, 26, 'SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (166, 75, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (167, 75, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (168, 75, 7, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (169, 75, 16, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (170, 77, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (
    171,
    77,
    8,
    'SŠ (příprava k maturitě)',
    'Online/Offline',
    2
  );
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (172, 78, 2, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (173, 78, 8, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (174, 78, 1, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (175, 79, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (176, 79, 7, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (177, 79, 18, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (178, 79, 9, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (179, 79, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (187, 80, 8, 'ZŠ1, ZŠ2', 'Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (188, 80, 1, 'ZŠ1, ZŠ2', 'Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (189, 80, 27, 'ZŠ1', 'Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (190, 80, 13, 'ZŠ2', 'Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (191, 80, 6, 'ZŠ2', 'Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (192, 80, 7, 'ZŠ2', 'Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (193, 80, 16, 'ZŠ2', 'Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (194, 81, 9, 'ZŠ1, ZŠ2, SŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (195, 81, 8, 'ZŠ1, ZŠ2, SŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (196, 81, 1, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (197, 81, 13, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (198, 82, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (199, 82, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (200, 82, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (201, 82, 28, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (202, 82, 16, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (203, 82, 6, 'ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (204, 82, 12, 'ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (205, 83, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (206, 83, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (207, 84, 1, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (208, 84, 12, 'ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (209, 85, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (210, 85, 15, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (211, 86, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 4);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (212, 86, 7, 'ZŠ2, SŠ', 'Online/Offline', 4);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (213, 86, 18, 'ZŠ2, SŠ', 'Online/Offline', 4);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (214, 86, 16, 'ZŠ2, SŠ', 'Online/Offline', 4);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (215, 86, 1, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 4);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (216, 86, 12, 'ZŠ2, SŠ', 'Online/Offline', 4);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (217, 87, 1, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 5);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (218, 87, 12, 'ZŠ1, ZŠ2', 'Online/Offline', 5);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (219, 88, 2, 'ZŠ1, ZŠ2', 'Online', 6);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (220, 88, 1, 'ZŠ1, ZŠ2', 'Online', 6);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (221, 88, 7, 'ZŠ1, ZŠ2', 'Online', 6);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (222, 88, 28, 'ZŠ1', 'Online', 6);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (223, 89, 1, 'ZŠ1, ZŠ2, SŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (224, 89, 8, 'ZŠ1, ZŠ2, SŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (225, 89, 29, 'ZŠ1, ZŠ2, SŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (226, 89, 12, 'ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (227, 89, 6, 'ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (228, 90, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 7);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (229, 90, 7, 'ZŠ1', 'Online/Offline', 7);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (230, 90, 1, 'ZŠ1', 'Online/Offline', 7);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (231, 91, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (232, 91, 18, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (233, 91, 25, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (234, 91, 16, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (235, 91, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (236, 92, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (237, 92, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (238, 92, 6, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (239, 92, 13, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (240, 92, 12, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (241, 93, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (243, 93, 1, 'ZŠ1', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (244, 93, 8, 'ZŠ1', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (252, 94, 2, 'ZŠ1, ZŠ2, SŠ', 'Online', 8);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (253, 94, 9, 'ZŠ1, ZŠ2, SŠ', 'Online', 8);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (254, 94, 6, 'ZŠ2, SŠ', 'Online', 8);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (255, 94, 8, 'ZŠ1, ZŠ2, SŠ', 'Online', 8);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (256, 94, 18, 'ZŠ1, ZŠ2, SŠ', 'Online', 8);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (257, 94, 13, 'ZŠ1, ZŠ2, SŠ', 'Online', 8);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (258, 94, 12, 'ZŠ2', 'Online', 8);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (259, 96, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (260, 96, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (261, 97, 2, 'ZŠ2, SŠ', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (262, 97, 16, 'ZŠ2', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (263, 98, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (264, 98, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (265, 98, 18, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (266, 98, 13, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (267, 98, 7, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (268, 98, 12, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (269, 98, 16, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (270, 98, 6, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (271, 98, 2, 'ZŠ1', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (272, 99, 1, 'ZŠ2', 'Online/Offline\r\n', 9);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (273, 99, 6, 'ZŠ2', 'Online/Offline\r\n', 9);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (274, 99, 8, 'ZŠ2, SŠ', 'Online/Offline', 9);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (275, 99, 2, 'ZŠ2, SŠ', 'Online/Offline', 9);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (276, 99, 12, 'ZŠ2', 'Online/Offline', 9);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (277, 99, 15, 'ZŠ2, SŠ', 'Online/Offline', 9);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (311, 2151, 51, 'ZŠ2, SŠ', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (321, 2151, 1, 'ZŠ2', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (331, 2151, 12, 'ZŠ2', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (341, 2151, 2, 'ZŠ2', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (351, 2161, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (361, 2161, 7, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (371, 2161, 14, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (381, 2161, 1, 'ZŠ1', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (391, 2161, 2, 'ZŠ1', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (401, 2171, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (411, 2171, 24, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (421, 2171, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (431, 2171, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (441, 2171, 12, 'ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (451, 2181, 9, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (461, 2181, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (471, 2181, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (481, 2181, 6, 'ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (501, 2191, 2, 'ZŠ1, ZŠ2', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (511, 2191, 1, 'ZŠ1, ZŠ2', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (521, 2191, 12, 'ZŠ1, ZŠ2', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (531, 2191, 6, 'ZŠ1, ZŠ2', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (541, 2191, 8, 'ZŠ1, ZŠ2', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (551, 2201, 15, 'SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (561, 2201, 1, 'SŠ, VŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (571, 2201, 12, 'SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (601, 2211, 1, 'ZŠ1', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (611, 2211, 2, 'ZŠ1', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (621, 2211, 8, 'ZŠ1', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (651, 2221, 1, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (661, 2221, 8, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (711, 921, 2, 'ZŠ', 'Online', 4);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (721, 921, 1, 'ZŠ, SŠ', 'Online', 4);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (731, 921, 4, 'ZŠ, SŠ', 'Online', 4);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (761, 2651, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (771, 2651, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (781, 2651, 2, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (791, 2661, 1, 'SŠ, VŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (812, 2672, 8, 'zš1, zš2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (822, 2672, 9, 'zš1, zš2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (832, 2672, 7, 'zš1, zš2, sš', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (842, 2682, 1, 'sš', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (852, 2682, 12, 'zš2', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (862, 2692, 2, 'zš1, zš2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (872, 2692, 8, 'zš1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (882, 2692, 28, 'zš1, zš2, sš', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (892, 2692, 7, 'zš1, zš2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (
    902,
    2702,
    2,
    'ZŠ1, ZŠ2, SŠ - konverzace',
    'Online/Offline',
    2
  );
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (912, 2712, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (922, 2712, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (932, 2722, 2, 'ZŠ1, ZŠ2, sš', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (942, 2732, 2, 'ZŠ1, ZŠ2, sš', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (952, 2732, 10, 'ZŠ1, ZŠ2, sš', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (962, 2732, 3, 'ZŠ1, ZŠ2, sš', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (972, 2732, 7, 'ZŠ2, sš', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (982, 2732, 16, 'ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (992, 2742, 2, 'sš, vš', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1002, 3062, 2, 'zš1, zš2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1012, 3062, 8, 'zš1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1022, 3072, 2, 'zš1, zš2, sš', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1032, 3072, 1, 'zš1, zš2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1042, 3072, 102, 'zš1, zš2, sš', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1052, 2221, 72, 'zš2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1062, 2722, 82, 'sš', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1072, 2722, 92, 'ZŠ1, ZŠ2, sš', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1082, 3082, 9, 'zš1, zš2, sš', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1092, 3082, 2, 'zš1, zš2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1102, 3082, 8, 'zš1, zš2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1112, 3092, 6, 'sš, vš', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1122, 3092, 12, 'sš', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1132, 3092, 1, 'sš', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1152, 3112, 2, 'ZŠ, SŠ, VŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1162, 3112, 8, 'ZŠ, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1172, 3112, 1, 'ZŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1182, 3122, 8, 'ZŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1192, 3122, 2, 'ZŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1202, 3122, 1, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1212, 3132, 1, 'zš, sš', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1222, 3132, 12, 'zš2', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1241, 3951, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1251, 3951, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1261, 3951, 1, 'ZŠ1', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1271, 3951, 6, 'ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1281, 3961, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1291, 3961, 7, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1301, 3961, 25, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1311, 3971, 1, 'ZŠ1', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1321, 3971, 2, 'ZŠ1', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1331, 3981, 4, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1341, 3981, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1351, 3981, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1361, 3981, 82, 'SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1381, 3991, 12, 'ZŠ1, ZŠ2, SŠ, VŠ', 'Online', 71);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1391, 3991, 1, 'ZŠ1, ZŠ2, SŠ, VŠ', 'Online', 71);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1401, 4001, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1411, 4001, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1421, 4011, 13, 'ZŠ2, SŠ', 'Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1431, 4011, 6, 'ZŠ2, SŠ', 'Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1441, 4011, 2, 'ZŠ1, ZŠ2, SŠ', 'Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1451, 4011, 8, 'ZŠ1, ZŠ2', 'Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1461, 4021, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1471, 4021, 8, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1481, 4031, 8, 'SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1491, 4031, 5, 'SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1501, 4031, 7, 'ZŠ2, SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1511, 4031, 14, 'SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1521, 4031, 16, 'SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1531, 4041, 7, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1541, 4041, 1, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1551, 4041, 8, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1561, 4041, 2, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1571, 4041, 9, 'ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1581, 4051, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 31);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1591, 4061, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1601, 4061, 2, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1611, 4071, 1, 'ZŠ2, SŠ, VŠ', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1621, 4071, 4, 'ZŠ2, SŠ, VŠ', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1631, 4071, 11, 'A1, A2 pouze základy', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1641, 4081, 7, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1651, 4081, 16, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1661, 4081, 18, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1671, 4081, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1681, 4081, 25, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1691, 4081, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1701, 4091, 8, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1711, 4091, 29, 'SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1721, 4101, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1731, 4101, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1741, 4101, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1751, 4101, 7, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1761, 4111, 2, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1771, 4111, 15, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1781, 4111, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1791, 4111, 8, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1801, 4121, 2, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1811, 4131, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1821, 4131, 12, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1831, 4131, 15, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1841, 4131, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1851, 4131, 8, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1861, 4141, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1871, 4141, 1, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1881, 4151, 8, 'ZŠ1, ZŠ2, SŠ, VŠ', 'Online', 61);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1891, 4151, 11, 'ZŠ1, ZŠ2, SŠ, VŠ', 'Online', 61);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1901, 4151, 7, 'ZŠ2, SŠ', 'Online', 61);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1911, 4161, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1921, 4161, 1, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1931, 4161, 15, 'ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1941, 4161, 12, 'ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1951, 4171, 8, 'ZŠ1, ZŠ2, SŠ', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1961, 4171, 2, 'ZŠ1, ZŠ2, SŠ', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1971, 4171, 26, 'SŠ', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1981, 3981, 121, 'SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (1991, 3991, 131, 'SŠ, VŠ', 'Online', 71);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2001, 3991, 141, 'SŠ, VŠ', 'Online', 71);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2011, 4031, 151, 'VŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2021, 4171, 161, 'SŠ', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2031, 4181, 1, 'ZŠ1, ZŠ2, SŠ', 'Online', 12);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2041, 4181, 12, 'ZŠ2', 'Online', 12);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2051, 4191, 8, 'VŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2061, 4191, 11, 'VŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2071, 4191, 161, 'VŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2081, 4191, 4, 'VŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2091, 4201, 1, 'ZŠ2, SŠ', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2101, 4201, 2, 'ZŠ1, ZŠ2', 'Online', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2111, 4211, 1, 'ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2121, 4211, 12, 'ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2131, 4211, 2, 'ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2141, 4221, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2151, 4221, 6, 'ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2161, 4231, 16, 'ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2171, 4231, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2181, 4231, 18, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2191, 4241, 6, 'SŠ', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2201, 4241, 13, 'SŠ', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2211, 4241, 2, 'ZŠ, SŠ', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2221, 4241, 1, 'ZŠ2', 'Online', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2231, 4251, 1, 'ZŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2241, 4261, 6, 'ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2251, 4261, 1, 'ZŠ, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2261, 4261, 8, 'ZŠ, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2271, 4261, 16, 'ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2281, 4261, 2, 'ZŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2291, 4271, 8, 'ZŠ, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2301, 4271, 2, 'ZŠ, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2311, 4271, 1, 'ZŠ, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2321, 4271, 4, 'ZŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2331, 4271, 13, '0', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2341, 4271, 51, '0', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2351, 4281, 6, 'ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2361, 4281, 13, 'ZŠ ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2371, 4281, 1, 'ZŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2381, 4281, 2, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2391, 4291, 1, 'ZŠ, SŠ, VŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2401, 4301, 2, 'ZŠ, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2411, 4301, 1, 'ZŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2421, 4301, 8, 'ZŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2431, 4311, 8, 'ZŠ, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2441, 4311, 2, 'ZŠ, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2451, 4311, 9, 'ZŠ, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2461, 4311, 29, 'ZŠ, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2471, 4311, 7, 'ZŠ, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2481, 4311, 1, 'ZŠ1', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2491, 4321, 1, 'ZŠ, SŠ, VŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2501, 4321, 12, 'ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2511, 4331, 6, 'ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2521, 4331, 13, 'ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2531, 4331, 1, 'ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2541, 4331, 2, 'ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2551, 4341, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2561, 4341, 8, 'ZŠ1', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2571, 4341, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2581, 4351, 8, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2591, 4361, 8, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2601, 4361, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2611, 4361, 12, 'ZŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2621, 4371, 7, 'ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2631, 4371, 8, 'ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2641, 4371, 10, 'ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2651, 4381, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2661, 4381, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2671, 4381, 9, 'ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2681, 4381, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2691, 4381, 7, 'ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2701, 4391, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2711, 4391, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2721, 4391, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2731, 4401, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2741, 4401, 1, 'ZŠ1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2751, 4401, 4, 'ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2761, 4411, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2771, 4411, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2781, 4411, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2791, 4411, 16, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2801, 4421, 1, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2811, 4421, 6, 'ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2821, 4431, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2831, 4431, 10, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2841, 4441, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2851, 4441, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (
    2861,
    4451,
    7,
    'ZŠ1, ZŠ2, SŠ, VŠ',
    'Online/Offline',
    2
  );
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (
    2871,
    4451,
    29,
    'ZŠ1, ZŠ2, SŠ, VŠ',
    'Online/Offline',
    2
  );
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2881, 4451, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2891, 4451, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2901, 4451, 171, '0', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2911, 4461, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2921, 4471, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2931, 4471, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2941, 4471, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2951, 4481, 29, 'SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2961, 4481, 121, 'VŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2971, 4481, 181, 'VŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2981, 4491, 1, 'SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (2991, 4501, 6, 'SŠ', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3001, 4501, 13, 'SŠ', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3011, 4501, 1, 'ZŠ2', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3021, 4501, 2, 'ZŠ2', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3031, 4501, 191, 'VŠ', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3041, 4511, 13, 'ZŠ1, ZŠ2, SŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3051, 4511, 1, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3061, 4511, 2, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3071, 4511, 8, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3081, 4511, 6, 'ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3091, 4521, 8, 'ZŠ1, ZŠ2', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3101, 4521, 7, 'ZŠ1, ZŠ2', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3111, 4531, 1, 'ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3121, 4531, 13, 'ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3131, 4531, 6, 'ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3141, 4531, 12, 'ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3151, 4531, 2, 'ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3161, 4531, 15, 'ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3171, 4541, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3181, 4551, 1, 'ZŠ1, ZŠ2, SŠ,VŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3191, 4551, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3201, 4551, 6, 'ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3211, 4551, 201, 'SŠ, VŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3221, 4561, 1, 'ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3231, 4561, 12, 'ZŠ2, SŠ, VŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3241, 4561, 6, 'ZŠ2, SŠ, VŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3251, 4561, 211, 'ZŠ2, SŠ, VŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3261, 4571, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3271, 4571, 9, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3281, 4571, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3291, 4581, 9, 'ZŠ1, ZŠ2, SŠ, VŠ', 'Online', 81);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3301, 4591, 8, 'ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3311, 4591, 25, 'ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3321, 4591, 221, 'ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3331, 4591, 231, 'ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3341, 4621, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3351, 4621, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3361, 4631, 8, 'ZŠ 1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3371, 4631, 24, 'ZŠ 1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3381, 4631, 1, 'ZŠ 1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3391, 4631, 27, 'ZŠ 1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3401, 4631, 241, 'ZŠ 1', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3411, 4641, 2, 'ZŠ1, ZŠ2, SŠ', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3421, 4641, 8, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3431, 4641, 1, 'ZŠ1, ZŠ2', 'Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3441, 4651, 11, '0', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3451, 4651, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3461, 4651, 231, 'SŠ, VŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3471, 4651, 221, 'SŠ, VOŠ, VŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3481, 4651, 121, 'VOŠ, VŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3491, 4651, 251, 'VŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3501, 4651, 261, 'SŠ, VOŠ, VŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3511, 4651, 271, 'VŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3521, 4661, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3531, 4661, 8, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3541, 4661, 7, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3551, 4661, 16, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3561, 4661, 29, 'SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3571, 4661, 13, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3581, 4671, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3591, 4671, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3601, 4681, 2, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3611, 4691, 2, 'ZŠ1, ZŠ2', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3621, 4691, 10, 'ZŠ1, ZŠ2', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3631, 4691, 8, 'ZŠ1, ZŠ2, SŠ', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3641, 4691, 1, 'ZŠ1', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3651, 4691, 7, 'ZŠ1', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3661, 4691, 16, 'ZŠ1, ZŠ2', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3671, 4701, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3681, 4701, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3691, 4701, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (
    3701,
    4711,
    10,
    'ZŠ1, ZŠ2, SŠ, VŠ',
    'Online/Offline',
    2
  );
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3711, 4711, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (
    3721,
    4711,
    13,
    'ZŠ1, ZŠ2, SŠ, VŠ',
    'Online/Offline',
    2
  );
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (
    3731,
    4711,
    24,
    'ZŠ1, ZŠ2, SŠ, VŠ',
    'Online/Offline',
    2
  );
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3741, 4721, 2, 'ZŠ1', 'Online', 1);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3751, 4731, 2, 'ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3761, 4731, 7, 'ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3771, 4731, 29, 'ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3781, 4731, 8, 'ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3791, 4731, 4, 'ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3801, 4741, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3811, 4741, 7, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3821, 4741, 29, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3831, 4741, 18, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3841, 4741, 6, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3851, 4751, 1, 'ZŠ1, ZŠ2', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3861, 4751, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 3);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3871, 4761, 8, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3881, 4761, 13, 'ZŠ1, ZŠ2', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3891, 4761, 2, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);
INSERT INTO
  `su_us` (`id_ss`, `id_us`, `id_su`, `level`, `how`, `location`)
VALUES
  (3901, 4761, 7, 'ZŠ1, ZŠ2, SŠ', 'Online/Offline', 2);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: subjects
# ------------------------------------------------------------

INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (0, 'Neurčeno');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (1, 'Matematika');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (2, 'Anglický jazyk');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (3, 'Francouzký jazyk');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (4, 'Ruský jazyk');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (5, 'Latina');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (6, 'Chemie');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (7, 'Dějepis');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (8, 'Český jazyk');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (9, 'Německý jazyk');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (10, 'Španělský jazyk');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (11, 'Čeština pro cizince');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (12, 'Fyzika');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (13, 'Biologie');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (14, 'ZSV');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (15, 'Informatika');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (16, 'Zeměpis');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (17, 'Flétna');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (18, 'Přírodopis');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (19, 'Ekonomika');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (20, 'Makroekonomika');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (21, 'Figurální kresba');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (22, 'Předměty v 1.roč.Právnické fakulty');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (23, 'Všechny předměty 1.stupně ZŠ');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (24, 'Přírodověda');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (25, 'Občasnká výchova');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (26, 'Psycholohie');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (27, 'Prvouka');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (28, 'Hudební výchova');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (29, 'Společenské vědy');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (31, 'Nezáleží');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (51, 'Geografie');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (61, 'Literatura');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (72, 'algebra');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (82, 'účetnictví');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (92, 'MS office');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (102, 'italský jazyk');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (121, 'Ekonomie');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (131, 'Elektrotechnika');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (141, 'Programování');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (151, 'Dějiny diplomacie');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (161, 'Pedagogika');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (171, 'Dějiny umění');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (181, 'Filozofie');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (191, 'Biochemie');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (201, 'Deskriptivní geometrie');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (211, 'Technika');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (221, 'Veřejná správa');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (231, 'Právo');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (241, 'Vlastivěda');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (251, 'Zdravotnická legislativa');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (261, 'Pracovní právo');
INSERT INTO
  `subjects` (`id_su`, `title`)
VALUES
  (271, 'Občanské právo');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: types
# ------------------------------------------------------------

INSERT INTO
  `types` (`id_ty`, `type`, `price`)
VALUES
  (1, 'Základní škola', 350);
INSERT INTO
  `types` (`id_ty`, `type`, `price`)
VALUES
  (3, 'Střední škola', 450);
INSERT INTO
  `types` (`id_ty`, `type`, `price`)
VALUES
  (4, 'Vysoká škola', 650);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: users
# ------------------------------------------------------------

INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2,
    'Ondřej Koriťák',
    '202cb962ac59075b964b07152d234b70',
    1,
    NULL,
    1,
    'ondrakoritak@seznam.cz',
    '606190464',
    1,
    '2001-12-06',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3,
    'Daria Yukhymenko',
    '',
    4,
    1,
    0,
    'ahimenko.dasha369@gmail.com',
    '774964672',
    2,
    '2003-01-01',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4,
    'Michal Buriánek',
    '',
    4,
    2,
    0,
    'miburianek@gmail.com',
    '777052753',
    1,
    '1899-11-30',
    0
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    5,
    'Klára Elefantová',
    '',
    4,
    3,
    0,
    '',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    6,
    'Lucie Hánová',
    '',
    4,
    5,
    0,
    '',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    7,
    'Petra Přibilová (Venská)',
    '',
    4,
    6,
    0,
    'venska.petra@seznam.cz',
    '721194048',
    2,
    '1993-03-01',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    8,
    'Dominik Krasula',
    '',
    4,
    7,
    0,
    '',
    '0',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    9,
    'Lenka Klimešová',
    '',
    4,
    8,
    0,
    '',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    10,
    'Nela Brelová',
    '',
    4,
    9,
    0,
    '',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    11,
    'Markéta Putnová',
    '',
    4,
    10,
    0,
    'marketaputnova@seznam.cz',
    '774232344',
    1,
    '2003-09-23',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    12,
    'Halija Vrbíková',
    '',
    4,
    11,
    0,
    '',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    13,
    'Kateřina Havránková',
    '',
    4,
    12,
    0,
    '',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    14,
    'Klára Fialková',
    '',
    4,
    13,
    0,
    'klarka.fialkova@volny.cz',
    '606271434',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    15,
    'František Hájek',
    '',
    4,
    14,
    0,
    'frantisek.hajek29@seznam.cz',
    '731044919',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    16,
    'Alvin Hofmann',
    '',
    4,
    15,
    0,
    '',
    '0',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    17,
    'Zuzana Kratochvílová',
    '',
    4,
    16,
    0,
    '',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    18,
    'Gabriela Švejdová',
    '',
    4,
    17,
    0,
    'gabisvejdova@seznam.cz',
    '774890597',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    19,
    'Matyáš Šikl',
    '',
    4,
    18,
    0,
    '',
    '0',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    20,
    'Jana Amadou',
    '',
    4,
    19,
    0,
    '',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    21,
    'Jan Slovioček',
    '',
    4,
    20,
    0,
    '',
    '0',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    22,
    'Zuzana Španková',
    '',
    4,
    21,
    0,
    '',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    23,
    'Karolína Laňková',
    '',
    4,
    22,
    0,
    'k.lankova@seznam.cz',
    '777046716',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    24,
    'Karolína Štandová',
    '',
    4,
    23,
    0,
    '',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    25,
    'Viktor Šimov',
    '',
    4,
    24,
    0,
    '',
    '0',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    26,
    'Michaela Tučková',
    '',
    4,
    25,
    0,
    'michaelatuckova51@seznam.cz',
    '725556330',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    27,
    'David Kadlec',
    '',
    4,
    26,
    0,
    '',
    '0',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    28,
    'Aneta Procházková',
    '',
    4,
    27,
    0,
    'proch.aneta@seznam.cz',
    '731382179',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    29,
    'Zuzana Mocková',
    '',
    4,
    28,
    0,
    'zmockova8@seznam.cz',
    '778480567',
    2,
    '2006-01-10',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    30,
    'Gabriela Tůmová',
    '',
    4,
    29,
    0,
    '',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    31,
    'Muriel Dominů\n',
    '',
    4,
    30,
    0,
    '',
    '0',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    32,
    'Lukáš Daněk',
    '',
    4,
    31,
    0,
    'lukas.danek05@seznam.cz',
    '721910451',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    33,
    'Zina Vykypělová',
    '',
    4,
    32,
    0,
    '',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    34,
    'Lukáš Daněk',
    '',
    4,
    33,
    0,
    '',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    35,
    'Kristýna Kratochvílová',
    '68204e2b73a393cb4bb357a6a246a25a',
    2,
    34,
    1,
    'kristyna.kratochvilova@dobest.cz',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    36,
    'Helena Nováková',
    '',
    4,
    35,
    0,
    '',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    37,
    'Jan Jehlička',
    '',
    4,
    36,
    0,
    '',
    '0',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    38,
    'Vendula Kadlecová',
    '',
    4,
    37,
    0,
    '',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    39,
    'Magdaléna Kvasničková',
    '',
    4,
    38,
    0,
    'kvasnickova.magdalena@gmail.com',
    '733758050',
    2,
    '2021-10-01',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    40,
    'Renata Kafoňková',
    '',
    4,
    39,
    0,
    'renatakafonkova156@seznam.cz',
    '605784793',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    41,
    'Karel Hynek',
    '',
    4,
    40,
    0,
    'kareljarov@gmail.com',
    '608529276',
    1,
    '2004-03-20',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    42,
    'Tomáš Kasal',
    '',
    4,
    41,
    0,
    'tomikkasal@seznam.cz',
    '723415213',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    43,
    'Simona Malaková',
    '',
    4,
    42,
    0,
    'simona.praha@gmail.com',
    '608613037',
    2,
    '2005-05-14',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    44,
    'Radek Zíka',
    '',
    4,
    43,
    0,
    'radek.zika22@seznam.cz',
    '721655236',
    1,
    '2000-05-22',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    45,
    'Ludmila Pokorná ',
    '',
    4,
    44,
    0,
    'pokorna.ludmila@volny.cz',
    '732303429',
    2,
    '1947-08-17',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    46,
    'Olesia Matva',
    '',
    4,
    45,
    0,
    'avtam461@rambler.ru',
    '792832730',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    47,
    'Klára Dědáčková',
    '',
    4,
    46,
    0,
    'klara.dedackova@gmail.com',
    '720119393',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    48,
    'Denisa Viktorie Laurynová',
    '',
    4,
    47,
    0,
    'denalaurynova@gmail.com',
    '607224892',
    2,
    '1997-11-10',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    49,
    'Petra Lišková',
    '',
    4,
    48,
    0,
    'petra.liskova.016@gmail.com',
    '421902878047',
    2,
    '1999-06-05',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    50,
    'Šimon Horák',
    '',
    4,
    49,
    0,
    'feelsbanmam@email.cz',
    '602825925',
    1,
    '2004-10-31',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    51,
    'Karolína Biniová',
    '',
    4,
    50,
    0,
    'Karolinabiniova@seznam.cz',
    '607174861',
    2,
    '1991-04-26',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    52,
    'Žaneta Herzlová',
    '',
    4,
    51,
    0,
    'zherzlova@icloud.com',
    '774270212',
    2,
    '2005-04-02',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    53,
    'Daniel Fusek',
    '',
    4,
    52,
    0,
    'Fusekdaniel@seznam.cz',
    '778484498',
    1,
    '2000-06-12',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    54,
    'Marcela Hančová',
    '',
    4,
    53,
    0,
    'MarcelkaHancova@seznam.cz',
    '721946313',
    2,
    '2004-11-11',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    55,
    'Kateřina Vilímová',
    '',
    4,
    54,
    0,
    'katerina.vilimovaa@gmail.com',
    '773523912',
    2,
    '2004-02-15',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    56,
    'Jolana Bezoušková',
    '',
    4,
    55,
    0,
    'jolana.bezouskova@gmail.com',
    '774993565',
    2,
    '2005-02-27',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    57,
    'Anna-Marie Vondráková',
    '',
    4,
    56,
    0,
    'anna.vondrakovaa@gmail.com',
    '704100168',
    2,
    '2003-12-02',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    58,
    'Lukáš Flek',
    '',
    4,
    57,
    0,
    'fleklukas@seznam.cz',
    '792486650',
    1,
    '1997-06-06',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    59,
    'Evelina Lozovaja',
    '',
    4,
    58,
    0,
    'evelinalozovaya@gmail.com',
    '792322848',
    2,
    '2005-01-28',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    60,
    'Damián Marcel Vlasič',
    '',
    4,
    59,
    0,
    'jupien@hotmail.com',
    '601365009',
    1,
    '1977-07-14',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    61,
    'Tereza Trnovská',
    '',
    4,
    60,
    0,
    'terka.trnovska@gmail.com',
    '774774067',
    2,
    '2001-05-10',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    62,
    'Tamara Míšková',
    '',
    4,
    61,
    0,
    'tamara.miskova@seznam.cz',
    '607510795',
    2,
    '1953-10-14',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    63,
    'Richard Ryška',
    '',
    3,
    NULL,
    0,
    '',
    '0',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    65,
    'Anna Žáková',
    '',
    4,
    62,
    0,
    'annis.zak@seznam.cz',
    '776231538',
    2,
    '2001-09-05',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    66,
    'Marek Sýkora',
    '',
    4,
    63,
    0,
    'sykoramarek.10@gmail.com',
    '702043984',
    1,
    '2002-02-12',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    67,
    'Veronika Matějková',
    '',
    4,
    64,
    0,
    'veronika.matejkova@icloud.com',
    '602244020',
    2,
    '2004-04-22',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    68,
    'Vojtěch Vilím',
    '',
    4,
    65,
    0,
    'vilim.vojtech@seznam.cz',
    '775686090',
    1,
    '1998-07-15',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    69,
    'Kateřina Loužilová',
    '',
    4,
    66,
    0,
    'katerina174@post.cz',
    '605501324',
    2,
    '1976-07-24',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    70,
    'Šimon Tomek',
    '',
    4,
    67,
    0,
    'simon.tomek@post.cz',
    '731136629',
    1,
    '2004-12-30',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    71,
    'Alexandra Šulcová',
    '',
    4,
    68,
    0,
    'sasa.sulcova@outlook.cz',
    '777738439',
    2,
    '2000-10-26',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    72,
    'Tomáš Vaněk',
    '',
    4,
    69,
    0,
    'Tomas.Vanekxx@gmail.com',
    '604834978',
    1,
    '1949-10-16',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    73,
    'Alžběta Ottová',
    '',
    4,
    70,
    0,
    'lizaottova@gmail.com',
    '733301921',
    2,
    '2001-12-20',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    74,
    'Lea Uherková',
    '',
    4,
    71,
    0,
    'leauherkova@seznam.cz',
    '733214795',
    2,
    '2000-11-28',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    75,
    'Vanessa Azemi',
    '',
    4,
    72,
    0,
    'vanessaazemi@seznam.cz',
    '773186326',
    2,
    '2000-01-08',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    77,
    'Kateřina Wimmerová',
    '',
    4,
    74,
    0,
    'wimmekat@icloud.com',
    '736459655',
    2,
    '1999-09-27',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    78,
    'Linda Hůrková',
    '',
    4,
    75,
    0,
    'l.hurkova@email.cz',
    '773400839',
    2,
    '2001-07-18',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    79,
    'Tomáš Pokorný',
    '',
    4,
    76,
    0,
    'topomipo@seznam.cz',
    '606046044',
    1,
    '2005-08-11',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    80,
    'Tomáš Pokorný',
    '',
    4,
    77,
    0,
    'tomaspokorny711@gmail.com',
    '773961140',
    1,
    '1998-11-07',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    81,
    'Anna Linhartová',
    '',
    4,
    78,
    0,
    'ancalinhartova@seznam.cz',
    '776295684',
    2,
    '2004-08-13',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    82,
    'Alexandra Hamplová',
    '',
    4,
    79,
    0,
    'alexandrahamplova@seznam.cz',
    '608422210',
    2,
    '2005-10-20',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    83,
    'Tereza Davidová',
    '',
    4,
    80,
    0,
    'davidova.terez@gmail.com',
    '773467663',
    2,
    '2005-04-10',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    84,
    'Anežka Červená',
    '',
    4,
    81,
    0,
    'anezkacervenaa@gmail.com',
    '773601997',
    2,
    '2001-11-06',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    85,
    'Tomáš Protiva',
    '',
    4,
    82,
    0,
    'protitom@gmail.com',
    '735120530',
    1,
    '2006-05-23',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    86,
    'Matěj Trýzna',
    '',
    4,
    83,
    0,
    'matytryzna@seznam.cz',
    '702035997',
    1,
    '2002-11-09',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    87,
    'Jan Kluz',
    '',
    4,
    84,
    0,
    'johny.12@email.cz',
    '739951479',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    88,
    'Karolína Čechová',
    '',
    4,
    85,
    0,
    'kaja.cechova16@gmail.com',
    '601392323',
    2,
    '2003-11-07',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    89,
    'Lukáš Burian',
    '',
    4,
    86,
    0,
    'lukyburian1@gmail.com',
    '608947486',
    1,
    '2003-05-25',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    90,
    'Tereza Pefková',
    '',
    4,
    87,
    0,
    'terezapef@seznam.cz',
    '775030354',
    2,
    '2005-04-20',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    91,
    'Karolína Zídková',
    '',
    4,
    88,
    0,
    'zidkovakaja@seznam.cz',
    '727825285',
    2,
    '2005-06-25',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    92,
    'Tereza Sotáková',
    '',
    4,
    89,
    0,
    'sotakovatereza@seznam.cz',
    '773453153',
    2,
    '1998-01-22',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    93,
    'Dominika Vašíčková',
    '',
    4,
    90,
    0,
    'vasickovadominika@seznam.cz',
    '605541571',
    2,
    '1997-10-27',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    94,
    'Anna Urbanová',
    '',
    4,
    91,
    0,
    'annaurbanovah@seznam.cz',
    '733309006',
    2,
    '2001-07-24',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    96,
    'Vendula Harmáčková',
    '',
    4,
    93,
    0,
    'vendyharmackova@gmail.com',
    '730928611',
    2,
    '2001-12-24',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    97,
    'Barbora Váňová',
    '',
    4,
    94,
    0,
    'barca.vanova@gmail.com',
    '722292762',
    2,
    '1999-08-12',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    98,
    'Jan Kostiha',
    '',
    4,
    95,
    0,
    'jkostiha1@seznam.cz',
    '723504376',
    1,
    '2005-12-13',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    99,
    'Jitka Stritzlová',
    '',
    4,
    96,
    0,
    'jitkastritzlova@seznam.cz',
    '776885615',
    2,
    '2005-09-23',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    111,
    'Růžena Patočková',
    'e217157422d5e6b55a206e606e2b568f',
    5,
    NULL,
    1,
    'ruzenah@gmail.com',
    '',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    141,
    'Robert  Nosil',
    '',
    3,
    NULL,
    0,
    'rnosil@seznam.cz',
    '602609539',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    151,
    'Filip  Svoboda ',
    '',
    3,
    NULL,
    0,
    'p.avasyr@seznam.cz',
    '604347552',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    161,
    'Nela Šitinová',
    '',
    3,
    NULL,
    0,
    'nela.sitinova@gmail.com',
    '778549998',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    171,
    'Victoriya  Jakoubková ',
    '',
    3,
    NULL,
    0,
    'vika.mat@seznam.cz',
    '608981275',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    181,
    'Nela  Dostálová ',
    '',
    3,
    NULL,
    0,
    'e.dost@seznam.cz',
    '725735239',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    191,
    'Veronika  Měšťanová ',
    '',
    3,
    NULL,
    0,
    'veronika.mestanova@seznam.cz@',
    '603506682',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    201,
    'Barbora  Bláhová ',
    '',
    3,
    NULL,
    0,
    'barunka.105@seznam.cz',
    '728366265',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    211,
    'Richard  Juráček ',
    '',
    3,
    NULL,
    0,
    '12101@seznam.cz',
    '724866808',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    221,
    'Kateřina  Vidurková ',
    '',
    3,
    NULL,
    0,
    'mareckova29@seznam.cz',
    '604717164',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    231,
    'Monika  Murdychová ',
    '',
    3,
    NULL,
    0,
    'bannyjana@seznam.cz',
    '775907441',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    241,
    'Salome  Skalová ',
    '',
    3,
    NULL,
    0,
    'rabuna@luskabara.cz@',
    '608125932',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    251,
    'Oliver Kněžík ',
    '',
    3,
    NULL,
    0,
    'pavlinaknezikova@seznam.cz',
    '601378334',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    261,
    'Tobiáš  Hejl ',
    '',
    3,
    NULL,
    0,
    'info@spokojenaplet.cz',
    '777656336',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    271,
    'Gabriela  Žáková ',
    '',
    3,
    NULL,
    0,
    'gzakova@seznam.cz',
    '776668736',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    281,
    'Alena  Malcová ',
    '',
    3,
    NULL,
    0,
    'malcovaalena@seznam.cz',
    '604322595',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    291,
    'Matyáš  Kadlec',
    '',
    3,
    NULL,
    0,
    'kadlecova@novoborska.cz',
    '777857594',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    301,
    'Andrea  Mendlíková ',
    '',
    3,
    NULL,
    0,
    'menandra@email.cz',
    '607099044',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    321,
    'Oskar  Synek ',
    '',
    3,
    NULL,
    0,
    'm.synkovam@seznam.cz',
    '774959059',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    331,
    'Žaneta  Hejnyšová',
    '',
    3,
    NULL,
    0,
    'hejnysova.zanet@gmail.com',
    '739020358',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    341,
    'Lucie  Collina ',
    '',
    3,
    NULL,
    0,
    'luciecollina@seznam.cz',
    '722935999',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    351,
    'Kateřina  Křečková ',
    '',
    3,
    NULL,
    0,
    'katrinka@centrum.cz',
    '603585864',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    361,
    'Ivana  Rejzková',
    '',
    3,
    NULL,
    0,
    'rejzkovaivana@seznam.cz',
    '606542736',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    371,
    'Renata  Vránová ',
    '',
    3,
    NULL,
    0,
    'renatvranova@gmail.com',
    '776192128',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    381,
    'Matyáš  Červinka ',
    '',
    3,
    NULL,
    0,
    'dianahanc@hotmail.com',
    '736620529',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    551,
    'Jožko  Mrva',
    '',
    3,
    NULL,
    0,
    'jozko.mrva@gmail.com',
    '702129642',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    561,
    'Jana  Daňová ',
    '',
    3,
    NULL,
    0,
    '25jana11@seznam.cz',
    '603527449',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    571,
    'Keko Bursac',
    '',
    3,
    NULL,
    0,
    'sanela2808@hotmail.com',
    '734145186',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    581,
    'Matyáš  Frajer ',
    '',
    3,
    NULL,
    0,
    'frajerovav@seznam.cz',
    '739053796',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    591,
    'Helena  Hangurová ',
    '',
    3,
    NULL,
    0,
    'helenahangurova@seznam.cz',
    '721362926',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    601,
    'Matěj  Menšík ',
    '',
    3,
    NULL,
    0,
    'cerna.katrin@seznam.cz',
    '604142526',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    611,
    'Filip  Hejl ',
    '',
    3,
    NULL,
    0,
    'info@spokojenaplet.cz',
    '777656336',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    621,
    'Marek  Gottwald ',
    '',
    3,
    NULL,
    0,
    'petra@brumla.cz',
    '603158457',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    641,
    'Michaela  Floriánová ',
    '',
    3,
    NULL,
    0,
    'michaelaflorianova@post.cz',
    '734140867',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    651,
    'Hana  Kaňková',
    '',
    3,
    NULL,
    0,
    'hana.fibi@post.cz',
    '774144246',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    661,
    'Valerie  Vlčková ',
    '',
    3,
    NULL,
    0,
    'petrasoberova@centrum.cz',
    '721200583',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    671,
    'Helena  Zímová ',
    '',
    3,
    NULL,
    0,
    'helenazimova@email.cz',
    '737640483',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    681,
    'Dagmar  McLin ',
    '',
    3,
    NULL,
    0,
    'pragdag@yahoo.com',
    '735173783',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    691,
    'Patrik  Rakušan ',
    '',
    3,
    NULL,
    0,
    'dianka11@seznam.cz',
    '606582117',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    701,
    'Monika  Stepanec ',
    '',
    3,
    NULL,
    0,
    'buskos@seznam.cz',
    '774213746',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    711,
    'Julius  Žiga ',
    '',
    3,
    NULL,
    0,
    'kovalovapetra@seznam.cz',
    '606325503',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    721,
    'Jana  Rytířová ',
    '',
    3,
    NULL,
    0,
    'sjeza@seznam.cz',
    '731526180',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    731,
    'Konstantin Eroshkevich ',
    '',
    3,
    NULL,
    0,
    'innaeroshkewich@gmail.com',
    '776401064',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    741,
    'Kateřina  Přibíková',
    '',
    3,
    NULL,
    0,
    'magda.pribikova@seznam.cz',
    '603700261',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    751,
    'Ondřej  Charvát ',
    '',
    3,
    NULL,
    0,
    'ondra.ch.888@seznam.cz',
    '778086521',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    761,
    'Hana  Abbasova ',
    '',
    3,
    NULL,
    0,
    'abbasmilan@seznam.cz',
    '725399213',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    771,
    'Eduard  Pára ',
    '',
    3,
    NULL,
    0,
    'maja.parova@seznam.cz',
    '603836526',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    781,
    'Tereza  Kadlecová ',
    '',
    3,
    NULL,
    0,
    'mkotalova134@gmail.com',
    '602252347',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    791,
    'Jana  Pawlasova ',
    '',
    3,
    NULL,
    0,
    'jpawlasova@email.cz',
    '737909951',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    801,
    'Artur  Shynalskyy ',
    '',
    3,
    NULL,
    0,
    'shunalskao@seznam.cz',
    '775374072',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    811,
    'Marie  Sedláková ',
    '',
    3,
    NULL,
    0,
    'roonny@tiscali.cz',
    '739445091',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    821,
    'Paní  Složilová',
    '',
    3,
    NULL,
    0,
    'aslozilova@vario-therm.cz',
    '724023237',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    831,
    'Adéla  Vykouková ',
    '',
    3,
    NULL,
    0,
    'p.vykoukova@seznam.cz',
    '723138954',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    841,
    'Markéta  Prokešová ',
    '',
    3,
    NULL,
    0,
    'prokesova.marketa@seznam.cz',
    '777799609',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    851,
    'Viktorie  Burešová ',
    '',
    3,
    NULL,
    0,
    'karol.bure007@gmail.com',
    '736768699',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    861,
    'Viktorie  Burešová ',
    '',
    3,
    NULL,
    0,
    'karol.bure007@gmail.com',
    '736768699',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    871,
    'Tereza  Fidlerová ',
    '',
    3,
    NULL,
    0,
    'fidlerovaterka@icloud.com',
    '608456116',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    881,
    'Renata  Hrabalová ',
    '',
    3,
    NULL,
    0,
    'renatanehybova@seznam.cz',
    '608904858',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    891,
    'Irena Pačesová',
    '',
    3,
    NULL,
    0,
    'zdenekirca@seznam.cz',
    '734145186',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    901,
    'Vadym Bentsa ',
    '',
    3,
    NULL,
    0,
    'marinabentsa@seznam.cz',
    '773566946',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    911,
    'Test_Klient Testovací',
    '48b68d54a57877dbb4076345ebc1e63f',
    3,
    NULL,
    1,
    'klient@test.cz',
    '0',
    1,
    '0000-00-00',
    0
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    921,
    'Test_Lektor Test',
    '724aab2653b99711340e66023f089013',
    4,
    131,
    1,
    'lektor@test.cz',
    '1',
    2,
    '1899-11-30',
    2
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    931,
    'Lenka  Chmelařová',
    '',
    3,
    NULL,
    0,
    'lenkaroznov@seznam.cz',
    '732327778',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    941,
    'Marie  Hanušová ',
    '',
    3,
    NULL,
    0,
    'janazrub@seznam.cz',
    '777245032',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    951,
    'Kamila  Fajfrová ',
    '',
    3,
    NULL,
    0,
    'milafaj@seznam.cz',
    '736431870',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    961,
    'Nikol  Střihavková ',
    '',
    3,
    NULL,
    0,
    'pitrova.anna@seznam.cz',
    '736604147',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    971,
    'Michaela  Nováková ',
    '',
    3,
    NULL,
    0,
    'michaelkann@seznam.cz',
    '777042132',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    981,
    'Jaroslav  Maňas ',
    '',
    3,
    NULL,
    0,
    'jaravasa@email.cz',
    '604703370',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    991,
    'Natalia  Kadobná',
    '',
    3,
    NULL,
    0,
    'nataliia82@seznam.cz',
    '774623698',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1001,
    'Gabriela  Honzíková ',
    '',
    3,
    NULL,
    0,
    'gabrielahonzikova@seznam.cz',
    '724267982',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1011,
    'Barbora  Krylová ',
    '',
    3,
    NULL,
    0,
    'krylovabara@gmail.com',
    '705006209',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1021,
    'Stella  Navrátilová ',
    '',
    3,
    NULL,
    0,
    'na.zuza@email.cz',
    '773020200',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1031,
    'Manas  Karabekov',
    '',
    3,
    NULL,
    0,
    'anarzan@seznam.cz',
    '776884125',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1041,
    'Bogdan  Phillipov',
    '',
    3,
    NULL,
    0,
    'rodina2003@gmail.com',
    '725458175',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1051,
    'Martin  Vedral ',
    '',
    3,
    NULL,
    0,
    'vedralovamarketa@seznam.cz',
    '607033822',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1061,
    'Nella  Nováková ',
    '',
    3,
    NULL,
    0,
    'hornackafarma@centrum.cz',
    '723167756',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1071,
    'Matyas  Ulrich',
    '',
    3,
    NULL,
    0,
    'janacova.lenka@seznam.cz',
    '731651802',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1081,
    'David  Janus',
    '',
    3,
    NULL,
    0,
    'stepanka.janusova@danone.com',
    '777937608',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1091,
    'Marek Dudek ',
    '',
    3,
    NULL,
    0,
    'madudek@seznam.cz',
    '731244105',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1101,
    'Lukáš, Marek  Boukal',
    '',
    3,
    NULL,
    0,
    'petra.boukalova@centrum.cz',
    '602648333',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1111,
    'Daniel  Komenda ',
    '',
    3,
    NULL,
    0,
    'n.komenda@seznam.cz',
    '724334095',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1121,
    'Adéla  Zapletalová ',
    '',
    3,
    NULL,
    0,
    'silviezapl@gmail.com',
    '733782253',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1131,
    'Vesna Šupichová',
    '',
    3,
    NULL,
    0,
    'baru73@email.cz',
    '604301424',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1141,
    'Zdeňka  Bláhová ',
    '',
    3,
    NULL,
    0,
    'zdenka.bilkova@email.cz',
    '777043564',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1151,
    'Zdeňka  Bláhová ',
    '',
    3,
    NULL,
    0,
    'zdenka.bilkova@email.cz',
    '777043564',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1161,
    'Michaela  Machálková ',
    '',
    3,
    NULL,
    0,
    'jaroslava.machalkova@lab.agel.cz',
    '777035398',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1171,
    'Aliona  Matei ',
    '',
    3,
    NULL,
    0,
    'alionamatei@gmail.com',
    '773063716',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1181,
    'Simona Šímová',
    '',
    3,
    NULL,
    0,
    'simonka10092004@post.cz',
    '721094756',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1191,
    'Jan Jelínek',
    '',
    3,
    NULL,
    0,
    'janakrejzy68@gmail.com',
    '774894110',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1201,
    'Eva Klempererová',
    '',
    3,
    NULL,
    0,
    'e.klempererova@email.cz',
    '774927667',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1211,
    'Lucie Malinikova',
    '',
    3,
    NULL,
    0,
    'lucie@festivalpark.cz',
    '774405961',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1221,
    'Michal  Karanděj ',
    '',
    3,
    NULL,
    0,
    'lenakarandej@seznam.cz',
    '608212082',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1231,
    'Sára  Pintířová',
    '',
    3,
    NULL,
    0,
    'petrapin@seznam.cz',
    '602143151',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1241,
    'Kateřina  Veselá ',
    '',
    3,
    NULL,
    0,
    'katavesela@email.cz',
    '603285620',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1251,
    'Dana  Dražanová ',
    '',
    3,
    NULL,
    0,
    'danadrazanova74@gmail.com',
    '608136402',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1261,
    'Ines Votavová',
    '',
    3,
    NULL,
    0,
    'dira.votavova@gmail.com',
    '607113898',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1271,
    'Jaryna  Vargatiuk ',
    '',
    3,
    NULL,
    0,
    'olya2408@seznam.cz',
    '777686179',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1281,
    'Adriana  Lauková ',
    '',
    3,
    NULL,
    0,
    'monika.laukova@centrum.cz',
    '602835175',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1291,
    'Jan  Šusta ',
    '',
    3,
    NULL,
    0,
    'p.sakul@post.cz',
    '605430811',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1301,
    'Laura  Biško ',
    '',
    3,
    NULL,
    0,
    'lenka.strasilova@seznam.cz',
    '774330592',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1311,
    'Sofie  Horynová',
    '',
    3,
    NULL,
    0,
    'otas.h@seznam.cz',
    '774919258',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1321,
    'Anna Baghdasarjan ',
    '',
    3,
    NULL,
    0,
    'anicko26@seznam.cz',
    '775473782',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1331,
    'Natalie  Lešková',
    '',
    3,
    NULL,
    0,
    'natalia.lesko@gmail.com',
    '720226750',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1341,
    'Daniela  Stoyka ',
    '',
    3,
    NULL,
    0,
    'stoykadaniela@gmail.com',
    '775930738',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1351,
    'Irena  Skalníková ',
    '',
    3,
    NULL,
    0,
    'irena-sk@seznam.cz',
    '774296749',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1361,
    'Jiřina  Alhjahjh',
    '',
    3,
    NULL,
    0,
    'ginavanesa@seznam.cz',
    '776375057',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1371,
    'Helena  Hajná ',
    '',
    3,
    NULL,
    0,
    'hajnahelena74@gmail.com',
    '704040329',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1381,
    'Ivana  Cupaková',
    '',
    3,
    NULL,
    0,
    'cupakivanka@gmail.com',
    '778587631',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1391,
    'Michal Holák',
    '',
    3,
    NULL,
    0,
    'o.holakova@seznam.cz',
    '602821433',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1401,
    'Veronika  Křížová ',
    '',
    3,
    NULL,
    0,
    'veru.krizova@seznam.cz',
    '774625051',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1411,
    'Tereza  Fraňková ',
    '',
    3,
    NULL,
    0,
    'frankova.tera@seznam.cz',
    '731269750',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1421,
    'Karolína  Teslevych ',
    '',
    3,
    NULL,
    0,
    'oksanka29@seznam.cz',
    '608181249',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1431,
    'Lucie  Illešová',
    '',
    3,
    NULL,
    0,
    'priserazhlubin@email.cz',
    '777234288',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1441,
    'Liliana  Moskalenko ',
    '',
    3,
    NULL,
    0,
    'lilianamoskalenko@email.cz',
    '774211023',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1451,
    'Danka  Čmejrekova ',
    '',
    3,
    NULL,
    0,
    'danielkahavlatova@seznam.cz',
    '775941476',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1461,
    'Lucie  Mugan ',
    '',
    3,
    NULL,
    0,
    'lucmugan@gmail.com',
    '773207903',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1471,
    'Monika  Jiříčková',
    '',
    3,
    NULL,
    0,
    'monika77@email.cz',
    '774581210',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1481,
    'Milu Nitsche ',
    '',
    3,
    NULL,
    0,
    'milu.n@post.cz',
    '720051019',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1491,
    'Sofie  Hejlová ',
    '',
    3,
    NULL,
    0,
    'info@spokojenaplet.cz',
    '777656336',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1501,
    'Paní  Nývltová ',
    '',
    3,
    NULL,
    0,
    'brcko.mark@centrum.cz',
    '603445499',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1511,
    'Martin  Janke ',
    '',
    3,
    NULL,
    0,
    'stanislavajanke@seznam.cz',
    '737626930',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1521,
    'Natálie  Dunak ',
    '',
    3,
    NULL,
    0,
    'natadunak@seznsm.cz',
    '0',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1531,
    'Viktorie  Křížková ',
    '',
    3,
    NULL,
    0,
    'vikipiki209@gmail.com',
    '720021909',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1541,
    'Bára  Hladíková ',
    '',
    3,
    NULL,
    0,
    'bara.hladikova@seznam.cz',
    '604264479',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1551,
    'Nikol Neckářová ',
    '',
    3,
    NULL,
    0,
    'nikolneckarova@seznam.cz',
    '604902909',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1561,
    'Kristýna  Suchánková ',
    '',
    3,
    NULL,
    0,
    'kristynasuchankova@seznam.cz',
    '604833722',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1571,
    'Tomáš  Tesař ',
    '',
    3,
    NULL,
    0,
    '71zuzik@seznam.cz',
    '605741373',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1581,
    'Vojtěch  Lindauer ',
    '',
    3,
    NULL,
    0,
    'plindauerova@gmail.com',
    '777272274',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1591,
    'Viktor  Buršíček ',
    '',
    3,
    NULL,
    0,
    'v.bursicek@gmail.com',
    '605174152',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1601,
    'Lucie  Horáková ',
    '',
    3,
    NULL,
    0,
    '1radkahorakova@seznam.cz',
    '602976272',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1611,
    'Jakub Jenčík ',
    '',
    3,
    NULL,
    0,
    'sarka.jencikova@seznam.cz',
    '777787407',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1621,
    'Veronika  Marešová ',
    '',
    3,
    NULL,
    0,
    'veronika.kazova@seznam.cz',
    '777330086',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1631,
    'Nela  Dvořáková ',
    '',
    3,
    NULL,
    0,
    'kaca.dvorak@seznam.cz',
    '775351960',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1641,
    'Claudie  Harnová ',
    '',
    3,
    NULL,
    0,
    'sylva.rsrobot@gmail.com',
    '776012653',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1651,
    'Erika  Vrbková ',
    '',
    3,
    NULL,
    0,
    'erikavrbkova@seznam.cz',
    '608876918',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1661,
    'Šárka  Pincová ',
    '',
    3,
    NULL,
    0,
    'sarka.pincova@seznam.cz',
    '605736431',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1671,
    'Jana Burdová ',
    '',
    3,
    NULL,
    0,
    'uauinka@seznam.cz',
    '608044000',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1681,
    'Samuel  Sliško ',
    '',
    3,
    NULL,
    0,
    'kasavaros@azet.sk',
    '792746994',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1691,
    'Denisa  Malona',
    '',
    3,
    NULL,
    0,
    'malonan@email.cz',
    '777779195',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1701,
    'Alan  Giotto',
    '',
    3,
    NULL,
    0,
    'zoezen@seznam.cz',
    '774217131',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1711,
    'Barbora  Hejsková ',
    '',
    3,
    NULL,
    0,
    'hejskovabara@seznam.cz',
    '605976299',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1721,
    'Markéta  Dudová ',
    '',
    3,
    NULL,
    0,
    'marketa28@gmail.com',
    '734381071',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1731,
    'Petra  Křížková ',
    '',
    3,
    NULL,
    0,
    'petra.krizkova@century21.cz',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1741,
    'Pavlína  Kapicová ',
    '',
    3,
    NULL,
    0,
    'ziri@email.cz',
    '777615719',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1751,
    'Alžběta  Kubátová ',
    '',
    3,
    NULL,
    0,
    'okridlenyandel@seznam.cz',
    '608712737',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1761,
    'Barbora  Hrdinová',
    '',
    3,
    NULL,
    0,
    'barbora.hrdinova79@gmail.com',
    '776091757',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1771,
    'Kateřina  Kejdová ',
    '',
    3,
    NULL,
    0,
    'b.bastecka@icloud.com',
    '606616335',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1781,
    'Simona  Šrailová',
    '',
    3,
    NULL,
    0,
    'z.kovacova2201@seznam.cz',
    '776301448',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1791,
    'Kyrill  Kostraba ',
    '',
    3,
    NULL,
    0,
    'marjanakostraba@seznam.cz',
    '608426253',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1801,
    'Marcela  Švondrková',
    '',
    3,
    NULL,
    0,
    'svondrkova@seznam.cz',
    '604389020',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1811,
    'Paní  Ramešová',
    '',
    3,
    NULL,
    0,
    'k.ramesova@seznam.cz',
    '730148408',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1821,
    'Kateřina  Kopecká ',
    '',
    3,
    NULL,
    0,
    'katerina.kopecka@vossp.cz',
    '777632068',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1831,
    'Monika  Ptáčková ',
    '',
    3,
    NULL,
    0,
    'mp3martina@seznam.cz',
    '777922763',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1841,
    'Daniel  Němec ',
    '',
    3,
    NULL,
    0,
    'agnes.vlasta@seznam.cz',
    '792256802',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1851,
    'Tereza  Rybová ',
    '',
    3,
    NULL,
    0,
    'terezarybova@centrum.cz',
    '605282922',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1861,
    'Jan Švesták',
    '',
    3,
    NULL,
    0,
    'jasvestak@seznam.cz',
    '734713633',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1871,
    'Kateřina  Zídková ',
    '',
    3,
    NULL,
    0,
    'rokaad@seznam.cz',
    '608159633',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1881,
    'Olga  Malinovska',
    '',
    3,
    NULL,
    0,
    'muckamalina@seznam.cz',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1891,
    'Zuzana  Mikulec ',
    '',
    3,
    NULL,
    0,
    '2207.zuzka@seznam.cz',
    '724730529',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1901,
    'Filip  Lafek ',
    '',
    3,
    NULL,
    0,
    'zuzka.lafkova@gmail.com',
    '604831670',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1921,
    'Nela  Straková ',
    NULL,
    3,
    NULL,
    0,
    'sona.stankova@seznam.cz',
    '608938568',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1931,
    'Michaela  Špaldoňová',
    NULL,
    3,
    NULL,
    0,
    'navratilovamichaela@seznam.cz',
    '603353996',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1941,
    'Kateřina  Bastová ',
    NULL,
    3,
    NULL,
    0,
    'katka.nevedelova@seznam.cz',
    '607631212',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1951,
    'Maria Popovych ',
    NULL,
    3,
    NULL,
    0,
    'popovi4@seznam.cz',
    '608817982',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1961,
    'Kateřina  Blažková ',
    NULL,
    3,
    NULL,
    0,
    'katka.blaz@seznam.cz',
    '775116842',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1971,
    'Jaroslav  Vlašic ',
    NULL,
    3,
    NULL,
    0,
    'jaroslav.vlasic@gmail.com',
    '721954645',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1981,
    'Nikola  Hluchá ',
    NULL,
    3,
    NULL,
    0,
    'kristynahlucha@seznam.cz',
    '777339212',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    1991,
    'Robert  Slejška ',
    NULL,
    3,
    NULL,
    0,
    'rslejska@seznam.cz',
    '725442185',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2001,
    'Tobiáš  Alinger ',
    NULL,
    3,
    NULL,
    0,
    'buresova.jitka@centrum.cz',
    '731145908',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2011,
    'Paní  Rybníčková ',
    NULL,
    3,
    NULL,
    0,
    'jrybnickova@gmail.com',
    '608961178',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2021,
    'Lucie  Brown ',
    NULL,
    3,
    NULL,
    0,
    'luc.belohlavkova@seznam.cz',
    '724724229',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2031,
    'Ivana  Marková ',
    NULL,
    3,
    NULL,
    0,
    'loket@seznam.cz',
    '720121698',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2041,
    'Jaroslav  Humbatov ',
    NULL,
    3,
    NULL,
    0,
    'avicenna-dent@email.cz',
    '776884400',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2051,
    'Emma  Hálová ',
    NULL,
    3,
    NULL,
    0,
    'halovatereza@gmail.com',
    '774397927',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2061,
    'Martina  Brindová ',
    NULL,
    3,
    NULL,
    0,
    'martina.brindova@seznam.cz',
    '608060070',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2071,
    'Vasylyna  Klochko ',
    NULL,
    3,
    NULL,
    0,
    'valentyna.kl@seznam.cz',
    '736763638',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2081,
    'Gabriela  Švejdová',
    NULL,
    3,
    NULL,
    0,
    'gabisvejdova@seznam.cz',
    '774890597',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2091,
    'Tereza  Tůmová ',
    NULL,
    3,
    NULL,
    0,
    'terytumca@gmail.com',
    '776694974',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2101,
    'Marie  Křepelová ',
    NULL,
    3,
    NULL,
    0,
    'martina.krepelova@seznam.cz',
    '608729996',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2111,
    'Marie  Sedláková ',
    NULL,
    3,
    NULL,
    0,
    'roonny@tiscali.cz',
    '739445091',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2151,
    'Miroslav Zubaj',
    '',
    4,
    171,
    0,
    'mzubaj@gmail.com',
    '735776736',
    1,
    '2023-02-11',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2161,
    'Matouš  Korčák',
    '',
    4,
    181,
    0,
    'korcakmk@seznam.cz',
    '608559516',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2171,
    'Kristian Oliver Beneš',
    '',
    4,
    191,
    0,
    'krisbenes@gmail.com',
    '733303655',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2181,
    'Kateřina Kalová',
    '',
    4,
    201,
    0,
    'k.kalova@email.cz',
    '721739013',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2191,
    'Lucie Šrámková',
    '',
    4,
    211,
    0,
    'lu.sram@email.cz',
    '603534070',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2201,
    'Dominik Melkovič',
    '',
    4,
    221,
    0,
    'dmelkovic@gmail.com',
    '421949110173',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2211,
    'Katarína Svobodová',
    '',
    4,
    231,
    0,
    'skatka399@gmail.com',
    '702822173',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2221,
    'Barbora Kitlerová',
    '',
    4,
    241,
    0,
    'bara.kitlerova@gmail.com',
    '773404122',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2231,
    'Marcela  Fialová ',
    NULL,
    3,
    NULL,
    0,
    'marcelakalas@email.cz',
    '721907915',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2241,
    'Marie  Andreiši ',
    NULL,
    3,
    NULL,
    0,
    'marenka82@volny.cz',
    '739214888',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2251,
    'Marcela  Havelková ',
    NULL,
    3,
    NULL,
    0,
    'marcela.havelkova@seznam.cz',
    '602974528',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2261,
    'Klára  Janouchová ',
    NULL,
    3,
    NULL,
    0,
    'kajinadan@gmail.com',
    '775283400',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2271,
    'Kamila  Kopecká ',
    NULL,
    3,
    NULL,
    0,
    'KailaK@seznam.cz',
    '721721731',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2281,
    'Gabriela  Puchálková ',
    NULL,
    3,
    NULL,
    0,
    'gapu@centrum.cz',
    '731572569',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2291,
    'Marcela  Nováková ',
    NULL,
    3,
    NULL,
    0,
    'm.novakova@centrum.cz',
    '736132432',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2301,
    'Gabriela  Havajikova ',
    NULL,
    3,
    NULL,
    0,
    'gabriela.hv@seznam.cz',
    '608972389',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2311,
    'Pan  Tveritinov',
    NULL,
    3,
    NULL,
    0,
    'tveritinov@gchd.cz',
    '777266072',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2321,
    'Matyáš  Ungr ',
    NULL,
    3,
    NULL,
    0,
    'silanovamichaela@gmail.com',
    '604890778',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2331,
    'Tina Dolejšová ',
    NULL,
    3,
    NULL,
    0,
    'dolejsovam@gmail.com',
    '737477350',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2341,
    'Filip  Vlastník ',
    NULL,
    3,
    NULL,
    0,
    'jana.galikova@seznam.cz',
    '775220277',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2351,
    'Marina Gažovská',
    NULL,
    3,
    NULL,
    0,
    'marina.gazovska@gmail.com',
    '606796425',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2361,
    'Josef  Bouda ',
    NULL,
    3,
    NULL,
    0,
    'boudova.josefina@gmail.com',
    '773942675',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2371,
    'Lenka  Perinova ',
    NULL,
    3,
    NULL,
    0,
    'Lenkaigarova@centrum.sk',
    '702134473',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2381,
    'Max Obešlo ',
    NULL,
    3,
    NULL,
    0,
    'marcela_obeslo@atlas.cz',
    '774147720',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2391,
    'Filip  Štengl',
    NULL,
    3,
    NULL,
    0,
    'helisova86@email.cz',
    '728548285',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2401,
    'Pavla  Fialová ',
    NULL,
    3,
    NULL,
    0,
    'fialova.pavla@mppraha.cz',
    '222025127',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2411,
    'Eva  Srbová ',
    NULL,
    3,
    NULL,
    0,
    'eva.srbova2@gmail.com',
    '605720827',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2421,
    'Veronika  Gajdošová ',
    NULL,
    3,
    NULL,
    0,
    'alenakuba@seznam.cz',
    '734592090',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2431,
    'Renáta  Kapicova ',
    NULL,
    3,
    NULL,
    0,
    'kapire@seznam.cz',
    '731648034',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2441,
    'Kateřina  Kašparová ',
    NULL,
    3,
    NULL,
    0,
    'katerinakasparova@seznam.cz',
    '725448091',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2451,
    'Paní  Kořínková ',
    NULL,
    3,
    NULL,
    0,
    'andreaamichalka@seznam.cz',
    '607395649',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2461,
    'Denise  Strnad ',
    NULL,
    3,
    NULL,
    0,
    'denisestrnad@seznam.cz',
    '739717076',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2471,
    'Monika  Zelenková ',
    NULL,
    3,
    NULL,
    0,
    'zelenkova.monika@seznam.cz',
    '739615995',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2481,
    'Alena  Oplíštilová',
    NULL,
    3,
    NULL,
    0,
    'alenaopl@seznam.cz',
    '724308462',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2491,
    'Linda  Vaňková ',
    NULL,
    3,
    NULL,
    0,
    'jitkazborilka@seznam.cz',
    '737511122',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2501,
    'Karolína  Šimková ',
    NULL,
    3,
    NULL,
    0,
    'maru.mau@seznam.cz',
    '603367596',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2511,
    'Simona  Pamio ',
    NULL,
    3,
    NULL,
    0,
    'spamio@seznam.cz',
    '777127479',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2521,
    'Darja  Lašáková ',
    NULL,
    3,
    NULL,
    0,
    'darja.lasakova@gmail.com',
    '724257141',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2531,
    'Jiřina  Troníčková',
    NULL,
    3,
    NULL,
    0,
    'tronickovaj@seznam.cz',
    '734515550',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2541,
    'Fabian  Amar',
    NULL,
    3,
    NULL,
    0,
    'fabiananar2009@yahoo.com',
    '721465559',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2551,
    'Anastasia Kushnirová ',
    NULL,
    3,
    NULL,
    0,
    'nataliiakushnir@post.cz',
    '734311717',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2561,
    'Marek  Čuma',
    NULL,
    3,
    NULL,
    0,
    'mcuma@seznam.cz',
    '603843047',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2571,
    'Maryna  Lanchii ',
    NULL,
    3,
    NULL,
    0,
    '2609mdar@gmail.com',
    '775698191',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2581,
    'Rudolf  Pažout ',
    NULL,
    3,
    NULL,
    0,
    'hjitusa@seznam.cz',
    '728945613',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2591,
    'Barbora  Tůmová ',
    NULL,
    3,
    NULL,
    0,
    'btumova@email.cz',
    '737970315',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2601,
    'Paní  Stejskalová ',
    NULL,
    3,
    NULL,
    0,
    'pjstejskalovi@seznam.cz',
    '606657526',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2611,
    'Paní  Michnová ',
    NULL,
    3,
    NULL,
    0,
    'miunka.h@seznam.cz',
    '604379226',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2621,
    'Iveta Tůmová ',
    NULL,
    3,
    NULL,
    0,
    'iveta.tumova20@seznam.cz',
    '603783720',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2651,
    'Natálie Hrubešová',
    '',
    4,
    271,
    0,
    'natalhr07@gmail.com',
    '737059049',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2661,
    'Marek Patočka',
    '',
    4,
    281,
    0,
    'PATOCKA8@GMAIL.COM',
    '739034531',
    1,
    '1899-11-30',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2672,
    'Valentýna Hájková',
    '',
    4,
    292,
    0,
    'hajkova.valda@gmail.com',
    '737161532',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2682,
    'Jiří Pražák',
    '',
    4,
    302,
    0,
    'jiri.prazak98@gmail.com',
    '728325623',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2692,
    'Ludmila Polanská',
    '',
    4,
    312,
    0,
    'ludmila.polanska@seznam.cz',
    '604927457',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2702,
    'Anna Rytířová',
    '',
    4,
    322,
    0,
    'rytirova06@gmail.com',
    '703339997',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2712,
    'Vendula Rychtářová',
    '',
    4,
    332,
    0,
    'rychtarova.vendula@gmail.com',
    '775659069',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2722,
    'Vladimíra Šímová',
    '',
    4,
    342,
    0,
    'vl.simova@seznam.cz',
    '720780228',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2732,
    'Marian Jerinic',
    '',
    4,
    352,
    0,
    'marian.jerinic@seznam.cz',
    '702284342',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2742,
    'Jana Pelikánová',
    '',
    4,
    362,
    0,
    'jana.vda@seznam.cz',
    '602556081',
    2,
    '1981-02-09',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2752,
    'Lucie  Horáčková ',
    NULL,
    3,
    NULL,
    0,
    'lenka-d@seznam.cz',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2762,
    'Lucie  Beránková ',
    NULL,
    3,
    NULL,
    0,
    'luciezeli@yahoo.com',
    '724271263',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2772,
    'Jana  Vintrochová ',
    NULL,
    3,
    NULL,
    0,
    'vintrjana@centrum.cz',
    '604843121',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2782,
    'Tereza  Vítová ',
    NULL,
    3,
    NULL,
    0,
    'martinabrixiova@seznam.cz',
    '774257721',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2792,
    'Kateřina  Lipavská ',
    NULL,
    3,
    NULL,
    0,
    'katerina.lipavskakralova@centrum.cz',
    '774862270',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2802,
    'Veronika  Mlčúchová ',
    NULL,
    3,
    NULL,
    0,
    'ADAMEKSKOUPY@post.cz',
    '604649520',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2812,
    'Lenka  Hroníková',
    NULL,
    3,
    NULL,
    0,
    'lsls@seznam.cz',
    '777678122',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2822,
    'Lucie  Pechtorová ',
    NULL,
    3,
    NULL,
    0,
    'lucia.pechtorova@seznam.cz',
    '773108776',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2832,
    'Klára  Wilde ',
    NULL,
    3,
    NULL,
    0,
    'hanavosa@hotmail.com',
    '737047241',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2842,
    'Adam  Vrabec ',
    NULL,
    3,
    NULL,
    0,
    'gabinasvojanovska@seznam.cz',
    '603437698',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2852,
    'Anežka  Tamelová',
    NULL,
    3,
    NULL,
    0,
    'anezkatamelova@seznam.cz',
    '603806158',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2862,
    'Myroslava Oros ',
    NULL,
    3,
    NULL,
    0,
    'myroslava127@gmail.com',
    '774481363',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2872,
    'Hana  Matlasová ',
    NULL,
    3,
    NULL,
    0,
    'hmatlasova@seznam.cz',
    '777242676',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2882,
    'Petra  Krejbichová',
    NULL,
    3,
    NULL,
    0,
    'pk001@email.cz',
    '777302831',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2892,
    'Monika  Podubecká ',
    NULL,
    3,
    NULL,
    0,
    'mpodubecka@centrum.cz',
    '606565799',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2902,
    'Ivana  Röckel ',
    NULL,
    3,
    NULL,
    0,
    'ivana.roeckel@seznam.cz',
    '604525465',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2912,
    'Tereza  Ašverová',
    NULL,
    3,
    NULL,
    0,
    'vlcr@seznam.cz',
    '604417651',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2922,
    'Eliška  Chlpková',
    NULL,
    3,
    NULL,
    0,
    'chlpkova.jana@gmail.com',
    '775633889',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2932,
    'Marcela  Nová ',
    NULL,
    3,
    NULL,
    0,
    'marcela.nova@yahoo.com',
    '720366632',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2942,
    'Karolína  Kamberská ',
    NULL,
    3,
    NULL,
    0,
    'martina.kamberska@centrum.cz',
    '776425845',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2952,
    'Silvia  Malinska ',
    NULL,
    3,
    NULL,
    0,
    'sil.malinska@email.cz',
    '721209245',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2962,
    'Marie  Blahovská',
    NULL,
    3,
    NULL,
    0,
    'blahovskamarie@gmail.com',
    '792301759',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2972,
    'Andrea  Domin',
    NULL,
    3,
    NULL,
    0,
    'andrea.cervova@gmail.com',
    '739654147',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2982,
    'Kristýna  Hejlová ',
    NULL,
    3,
    NULL,
    0,
    'kristyna2455@gmail.com',
    '732100012',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    2992,
    'Natálie  Macková ',
    NULL,
    3,
    NULL,
    0,
    'renatamackova@seznam.cz',
    '604307020',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3002,
    'Petra  Šrámková ',
    NULL,
    3,
    NULL,
    0,
    'petrasramkova@email.cz',
    '603589278',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3012,
    'Anabella Hisem ',
    NULL,
    3,
    NULL,
    0,
    'hisemp@email.cz',
    '773022639',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3022,
    'Lenka  Havlíková ',
    NULL,
    3,
    NULL,
    0,
    'lenka-havlik@seznam.cz',
    '725582733',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3032,
    'Martina  Kašparová ',
    NULL,
    3,
    NULL,
    0,
    'martass.k@seznam.cz',
    '603969123',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3042,
    'Julia  Redko ',
    NULL,
    3,
    NULL,
    0,
    'Llozhani@seznam.cz',
    '727819739',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3052,
    'Markéta  Zimová',
    NULL,
    3,
    NULL,
    0,
    'marketazimova@email.cz',
    '606886440',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3062,
    'Anežka Syrová',
    '',
    4,
    372,
    0,
    'anezkasyrovas@seznam.cz',
    '737767699',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3072,
    'Antonio Federico Iorio',
    '',
    4,
    382,
    0,
    'antofed.iorio@gmail.com',
    '775099567',
    1,
    '2005-04-07',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3082,
    'Kristýna Valášková',
    '',
    4,
    392,
    0,
    'kikaadominik@seznam.cz',
    '739947662',
    2,
    '1899-11-30',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3092,
    'Filip Babčický',
    '',
    4,
    402,
    0,
    'babcicky.filip@seznam.cz',
    '734161825',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3112,
    'Ondřej Skála',
    '',
    4,
    422,
    0,
    'a.ondrej.skala@gmail.com',
    '724799033',
    1,
    '1994-07-29',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3122,
    'Růžena Szaková',
    '',
    4,
    432,
    0,
    'szakovaruzena@gmail.com',
    '792348247',
    2,
    '2007-09-18',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3132,
    'Dana Šipulová',
    '',
    4,
    442,
    0,
    'd.sipulova@centrum.cz',
    '724726768',
    2,
    '1968-01-15',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3142,
    'Denisa  Faltová ',
    NULL,
    3,
    NULL,
    0,
    'falta.denis@gmail.com',
    '776216729',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3202,
    'Denisa  Faltová ',
    NULL,
    3,
    NULL,
    0,
    'falta.denis@gmail.com',
    '776216729',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3352,
    'Eva  Krahulikova ',
    NULL,
    3,
    NULL,
    0,
    'eva.krahulikova@email.cz',
    '777314459',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3362,
    'Taťána  Sonsbeekova',
    NULL,
    3,
    NULL,
    0,
    'sonsbeekova.tatana@seznam.cz',
    '731489176',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3372,
    'Pavlína  Sýkorová ',
    NULL,
    3,
    NULL,
    0,
    'pavlasyka@seznam.cz',
    '604172962',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3382,
    'Filip  Nebenführ',
    NULL,
    3,
    NULL,
    0,
    'jarmilanebe@gmail.com',
    '603206928',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3392,
    'Alena  Kingham ',
    NULL,
    3,
    NULL,
    0,
    'alena.kingham@seznam.cz',
    '773663695',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3402,
    'Zoe Mária  Janočková',
    NULL,
    3,
    NULL,
    0,
    'janockovci@seznam.cz',
    '601551269',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3412,
    'Marie  Slabíková ',
    NULL,
    3,
    NULL,
    0,
    'david.slabik@seznam.cz',
    '728838005',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3422,
    'Diana  Loferďuková ',
    NULL,
    3,
    NULL,
    0,
    'dianaloferduk@seznam.cz',
    '777122584',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3432,
    'Eliza  Sirghi ',
    NULL,
    3,
    NULL,
    0,
    'evgenia29@seznam.cz',
    '732809999',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3442,
    'Amélie  Kubla ',
    NULL,
    3,
    NULL,
    0,
    'i.jemelkova@centrum.cz',
    '730510900',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3452,
    'Alena  Keronyak ',
    NULL,
    3,
    NULL,
    0,
    'a.keronyak@seznam.cz',
    '733382214',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3462,
    'Lucie  Capoušková ',
    NULL,
    3,
    NULL,
    0,
    'lbabickova@seznam.cz',
    '606669096',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3472,
    'Lukáš  Mareš ',
    NULL,
    3,
    NULL,
    0,
    'harajdinka@seznam.cz',
    '724833535',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3482,
    'Filip  Boháček ',
    NULL,
    3,
    NULL,
    0,
    'filipbohy33@gmail.com',
    '731671825',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3492,
    'Lenka  Dunová',
    NULL,
    3,
    NULL,
    0,
    'lenkaduna93@gmail.com',
    '734146600',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3502,
    'Zdenka  Pfefferová ',
    NULL,
    3,
    NULL,
    0,
    'vevesimon@seznam.cz',
    '724977974',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3512,
    'Zdenka  Pfefferová ',
    NULL,
    3,
    NULL,
    0,
    'vevesimon@seznam.cz',
    '724977974',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3522,
    'Christin  Rosenboom ',
    NULL,
    3,
    NULL,
    0,
    'I.Rosenboom@seznam.cz',
    '777604504',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3532,
    'Marcela  Kernerová ',
    NULL,
    3,
    NULL,
    0,
    'kernerovamarcela@seznam.cz',
    '602319653',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3542,
    'Marie  Fortinová ',
    NULL,
    3,
    NULL,
    0,
    'eva.fortinova@seznam.cz',
    '771166212',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3552,
    'Antonín  Šmejdíř',
    NULL,
    3,
    NULL,
    0,
    'nikasme@seznam.cz',
    '776697879',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3562,
    'Olga  Jánská ',
    NULL,
    3,
    NULL,
    0,
    'janska.olga@email.cz',
    '777055573',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3572,
    'Eva  Novotná ',
    NULL,
    3,
    NULL,
    0,
    'evahornofova@seznam.cz',
    '604631071',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3582,
    'Mária  Plačková',
    NULL,
    3,
    NULL,
    0,
    'majkaplackova@gmail.com',
    '774445779',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3592,
    'Michaela  Mlejnková ',
    NULL,
    3,
    NULL,
    0,
    'misa.mlejnkova@gmail.com',
    '724005689',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3602,
    'Veronika  Hroudová ',
    NULL,
    3,
    NULL,
    0,
    'veronika.hroudova@gmail.com',
    '722471671',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3612,
    'Karolína  Burešová ',
    NULL,
    3,
    NULL,
    0,
    'buresova@odolovskastavebni.cz',
    '775575572',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3622,
    'Sabina  Quast ',
    NULL,
    3,
    NULL,
    0,
    'sabina.spundova@gmail.com',
    '603168291',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3632,
    'Luisa  Vávrová ',
    NULL,
    3,
    NULL,
    0,
    'luisavavrova@seznam.cz',
    '732765569',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3652,
    'Jana Blahusová',
    '202cb962ac59075b964b07152d234b70',
    11,
    NULL,
    1,
    'janablahusova@seznam.cz',
    '',
    2,
    '2023-03-06',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3671,
    'Adélin  Bauerová ',
    NULL,
    3,
    NULL,
    0,
    'bauer.h@volny.cz',
    '728897928',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3681,
    'Elizabeth  Zocherová',
    NULL,
    3,
    NULL,
    0,
    'katerinazocherova@gmail.com',
    '601362352',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3691,
    'Radka  Pokorná ',
    NULL,
    3,
    NULL,
    0,
    'radka1529@seznam.cz',
    '739577550',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3701,
    'Monika  Biháry ',
    NULL,
    3,
    NULL,
    0,
    'akinom705@seznam.cz',
    '607890034',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3711,
    'Simona  Baková ',
    NULL,
    3,
    NULL,
    0,
    'simonabakova@seznam.cz',
    '776805943',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3721,
    'Irena  Illová ',
    NULL,
    3,
    NULL,
    0,
    'irena.illova@seznam.cz',
    '737982546',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3731,
    'Jana  Faltusová Orucoglu ',
    NULL,
    3,
    NULL,
    0,
    'janafaltusova67@gmail.com',
    '777605694',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3741,
    'Zuzana  Moravcová ',
    NULL,
    3,
    NULL,
    0,
    'zuzkamora@seznam.cz',
    '604440627',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3751,
    'Jana  Kostenková ',
    NULL,
    3,
    NULL,
    0,
    'janakostenkova@seznam.cz',
    '737686801',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3761,
    'Vladimír  Uruba ',
    NULL,
    3,
    NULL,
    0,
    'vladimiruruba@seznam.cz',
    '776210050',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3771,
    'Yana Rubleuscaya',
    NULL,
    3,
    NULL,
    0,
    'ryblikyana07@gmail.com',
    '608962507',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3781,
    'Tereza  Veverková ',
    NULL,
    3,
    NULL,
    0,
    'assario@volny.cz',
    '602187927',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3791,
    'Dominik Chaychevskyj ',
    NULL,
    3,
    NULL,
    0,
    'babyak@seznam.cz',
    '704004759',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3801,
    'Lenka  Dvorská ',
    NULL,
    3,
    NULL,
    0,
    'Lenka168@seznam.cz',
    '602384038',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3811,
    'Irena  Krsak ',
    NULL,
    3,
    NULL,
    0,
    'krsakirena@gmail.com',
    '731522331',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3821,
    'Lada  Niederhafnerová',
    NULL,
    3,
    NULL,
    0,
    'pruskova.l@seznam.cz',
    '721504301',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3831,
    'Tobiáš  Pospíšil ',
    NULL,
    3,
    NULL,
    0,
    'kakamilapospisilova@seznam.cz',
    '606107951',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3841,
    'Alena  Svatoňová',
    NULL,
    3,
    NULL,
    0,
    'abartisova@seznam.cz',
    '720286214',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3851,
    'Denisa  Moses ',
    NULL,
    3,
    NULL,
    0,
    'bede@seznam.cz',
    '732787088',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3861,
    'Marie  Hladíková ',
    NULL,
    3,
    NULL,
    0,
    'maru.hladikova@gmail.com',
    '607009595',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3871,
    'Viola  Gladišová ',
    NULL,
    3,
    NULL,
    0,
    'viola.gladisova@gmail.com',
    '606244251',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3881,
    'Dominik  Skwarla ',
    NULL,
    3,
    NULL,
    0,
    'dskwarla1@gmail.com',
    '732329107',
    1,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3891,
    'Petra  Ságnerová',
    NULL,
    3,
    NULL,
    0,
    'petrasagnerova@seznam.cz',
    '608478117',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3901,
    'Ivana  Kovarnikova ',
    NULL,
    3,
    NULL,
    0,
    'ivetakovarnikova@seznam.cz',
    '604675871',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3911,
    'Irena  Štáblová ',
    NULL,
    3,
    NULL,
    0,
    'irena.majerova@centrum.cz',
    '724744502',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3921,
    'Laura  Jarošová ',
    NULL,
    3,
    NULL,
    0,
    'olin.jaros@seznam.cz',
    '607068088',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3931,
    'Petra  Hlaváčová ',
    NULL,
    3,
    NULL,
    0,
    'hlavacovapetra@seznam.cz',
    '736240830',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3941,
    'Helena  Michálková ',
    NULL,
    3,
    NULL,
    0,
    'michalkova.hela@seznam.cz',
    '777337995',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3951,
    'Šimon Drábek',
    '',
    4,
    461,
    0,
    'drabeksimon4@gmail.com',
    '608319663',
    1,
    '2006-06-06',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3961,
    'Jan Konečný',
    '',
    4,
    471,
    0,
    'honzakonecny1@seznam.cz',
    '775554295',
    1,
    '1998-04-10',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3971,
    'Natálie Vavrušová',
    '',
    4,
    481,
    0,
    'nate.vavrusova@gmail.com',
    '777290908',
    2,
    '2006-09-10',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3981,
    'Adéla Pokorná',
    '',
    4,
    491,
    0,
    'pokorna.adela@email.cz',
    '733587716',
    2,
    '1999-12-20',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    3991,
    'Luboš Vidner',
    '',
    4,
    501,
    0,
    'vidnerl@seznam.cz',
    '774576567',
    1,
    '1986-05-04',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4001,
    'Kristýna Mašková',
    '',
    4,
    511,
    0,
    'tyna.maskova02@gmail.com',
    '739950474',
    2,
    '2002-11-22',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4011,
    'Barbora Konečná',
    '',
    4,
    521,
    0,
    'barakonecna@email.cz',
    '607060907',
    2,
    '2004-08-04',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4021,
    'Ayesha Iman',
    '',
    4,
    531,
    0,
    'ayeshaiman775@gmail.com',
    '776485217',
    2,
    '2003-11-09',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4031,
    'Zuzana Žáčková',
    '',
    4,
    541,
    0,
    'phdrzz@seznam.cz',
    '722608614',
    2,
    '1964-09-15',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4041,
    'Matěj Müller',
    '',
    4,
    551,
    0,
    'mullermat07@gmail.com',
    '608036091',
    1,
    '2007-02-05',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4051,
    'Jakub Paštika',
    '',
    4,
    561,
    0,
    'kulobo19@gmail.com',
    '737364333',
    1,
    '1992-09-01',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4061,
    'Kateřina Bothová',
    '',
    4,
    571,
    0,
    'katabothova@seznam.cz',
    '778002876',
    2,
    '1999-04-10',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4071,
    'Anton Morozov',
    '',
    4,
    581,
    0,
    'morozovantonin@gmail.com',
    '776753996',
    1,
    '1997-05-27',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4081,
    'Anna Mašková',
    '',
    4,
    591,
    0,
    'maskova.ani@gmail.com',
    '603713613',
    2,
    '2005-12-17',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4091,
    'Martin Lichý',
    '',
    4,
    601,
    0,
    'lichy.martin2@gmail.com',
    '704700150',
    1,
    '2002-06-29',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4101,
    'Eva Hermanová',
    '',
    4,
    611,
    0,
    'eva.hermanova@hotmail.com',
    '771150022',
    2,
    '2005-07-17',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4111,
    'Veronika Brožová',
    '',
    4,
    621,
    0,
    'brozovaveronika83@gmail.com',
    '604154539',
    2,
    '2006-10-12',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4121,
    'Kateřina Míšková',
    '',
    4,
    631,
    0,
    'katkamisek@seznam.cz',
    '776292918',
    2,
    '2006-09-22',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4131,
    'Adam Pitro',
    '',
    4,
    641,
    0,
    'adam01.pitro@gmail.com',
    '725406886',
    1,
    '2006-07-27',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4141,
    'Adéla Pirošová',
    '',
    4,
    651,
    0,
    'pirosova.adela@gmail.com',
    '732429099',
    2,
    '2007-02-06',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4151,
    'Petr Ryšlavý',
    '',
    4,
    661,
    0,
    'ryslavypetr@seznam.cz',
    '606547278',
    1,
    '1970-04-02',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4161,
    'Václav Petráň',
    '',
    4,
    671,
    0,
    'vasike22@gmail.com',
    '776807900',
    1,
    '2003-06-17',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4171,
    'Taťána Kadlecová',
    '',
    4,
    681,
    0,
    'tanaskadlecova@gmail.com',
    '722965486',
    2,
    '2002-02-05',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4181,
    'Dana Šipulová',
    '',
    4,
    691,
    0,
    'd.sipulova@centrum.cz',
    '724726768',
    2,
    '1968-01-15',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4191,
    'Josef Zemek',
    '',
    4,
    701,
    0,
    'zemkuv@seznam.cz',
    '',
    1,
    '1974-01-02',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4201,
    'Miroslav Balík',
    '',
    4,
    711,
    0,
    'mirecek.balik@seznam.cz',
    '734362064',
    1,
    '1997-05-06',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4211,
    'David Kopčan',
    '',
    4,
    721,
    0,
    'kopcda@gmail.com',
    '732236374',
    1,
    '2004-05-09',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4221,
    'Jana Krůtová',
    '',
    4,
    731,
    0,
    'janakrutova2004@gmail.com',
    '728823304',
    2,
    '2004-12-16',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4231,
    'Jiří Šlaj',
    '',
    4,
    741,
    0,
    'slajjiri@gmail.com',
    '737317163',
    1,
    '1984-04-15',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4241,
    'Lucie Klasová',
    '',
    4,
    751,
    0,
    'lucie.klasova@seznam.cz',
    '776873611',
    2,
    '2003-07-17',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4251,
    'Sanzhar Nurakunov',
    '',
    4,
    761,
    0,
    'sanzharnurakunov01@gmail.com',
    '773729892',
    1,
    '2001-03-01',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4261,
    'David Hrdina',
    '',
    4,
    771,
    0,
    'hrdinadave@seznam.cz',
    '608701802',
    1,
    '2003-02-18',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4271,
    'Kristina Rossi',
    '',
    4,
    781,
    0,
    'kristina.rossi@seznam.cz',
    '702635918',
    2,
    '2002-05-10',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4281,
    'Adéla Dondová',
    '',
    4,
    791,
    0,
    'adeladondova@gmail.com',
    '608949983',
    2,
    '2005-04-26',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4291,
    'Natália Talábová',
    '',
    4,
    801,
    0,
    'nana.talabova@gmail.com',
    '421910350546',
    2,
    '2000-11-26',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4301,
    'Agáta Lorencová',
    '',
    4,
    811,
    0,
    'lorencovaagata@novyporg.cz',
    '773316337',
    2,
    '2006-10-24',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4311,
    'Karolína Jírová',
    '',
    4,
    821,
    0,
    'kaja.jirova@seznam.cz',
    '737130496',
    2,
    '2002-11-11',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4321,
    'Tomáš Nečesaný',
    '',
    4,
    831,
    0,
    'thomas.necesany@gmail.com',
    '720358987',
    1,
    '2000-04-15',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4331,
    'Jakub Hrubý',
    '',
    4,
    841,
    0,
    'hruby.jakoubek@seznam.cz',
    '774708541',
    1,
    '2002-12-13',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4341,
    'Marie Venerová',
    '',
    4,
    851,
    0,
    'maruska.venerova@gmail.com',
    '608109556',
    2,
    '2005-11-21',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4351,
    'Marie Holopírková',
    '',
    4,
    861,
    0,
    'm.holopirkova@seznam.cz',
    '730176439',
    2,
    '2006-05-04',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4361,
    'Antonín Terber',
    '',
    4,
    871,
    0,
    'antonin@teteam.cz',
    '603426147',
    1,
    '1962-04-27',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4371,
    'Ondřej Feikl',
    '',
    4,
    881,
    0,
    'o.feikl@seznam.cz',
    '725030392',
    1,
    '2001-11-21',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4381,
    'Anna Nováková',
    '',
    4,
    891,
    0,
    'a.novakova@centrum.cz',
    '733241213',
    2,
    '2003-07-06',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4391,
    'Ondřej Zahálka',
    '',
    4,
    901,
    0,
    'ondrejzahalkainfo@gmail.com',
    '602685122',
    1,
    '2007-02-13',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4401,
    'Anna Němcová',
    '',
    4,
    911,
    0,
    'Anickanemcov@gmail.com',
    '723883465',
    2,
    '2007-03-08',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4411,
    'Adéla Vlčková',
    '',
    4,
    921,
    0,
    'adelvlckova@seznam.cz',
    '777162006',
    2,
    '2003-04-21',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4421,
    'Agáta Šedivá',
    '',
    4,
    931,
    0,
    'agata.sediva@volny.cz',
    '737460630',
    2,
    '2005-12-12',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4431,
    'Lucie Vaňková',
    '',
    4,
    941,
    0,
    'hrad.luc@seznam.cz',
    '774537830',
    2,
    '1974-07-12',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4441,
    'Alexandr Vondra',
    '',
    4,
    951,
    0,
    'vondraago@gmail.com',
    '775187456',
    1,
    '2003-06-30',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4451,
    'Ondřej Peleška',
    '',
    4,
    961,
    0,
    'peleska.ondrej@seznam.cz',
    '608263755',
    1,
    '2000-07-25',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4461,
    'Eliška Baudišová',
    '',
    4,
    971,
    0,
    'eliskabaudisova@seznam.cz',
    '722291654',
    2,
    '2004-04-26',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4471,
    'Sára Malingerová',
    '',
    4,
    981,
    0,
    'sara.malingerova@seznam.cz',
    '606119088',
    2,
    '2005-10-08',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4481,
    'Jan Krist',
    '',
    4,
    991,
    0,
    'jankrist@volny.cz',
    '723835972',
    1,
    '1964-11-06',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4491,
    'Filip Šlosárek',
    '',
    4,
    1001,
    0,
    'filipek.slosarek@seznam.cz',
    '775065030',
    1,
    '2003-03-09',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4501,
    'Eliška Podoláková',
    '',
    4,
    1011,
    0,
    'podolake@vscht.cz',
    '607102889',
    2,
    '1998-05-04',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4511,
    'Anna Lechnýřová',
    '',
    4,
    1021,
    0,
    'a.lechnyrova@gmail.com',
    '724933011',
    2,
    '2000-12-17',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4521,
    'Veronika Bišková',
    '',
    4,
    1031,
    0,
    'verca.biskova@gmail.com',
    '779970005',
    2,
    '2007-08-19',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4531,
    'Martin Engst',
    '',
    4,
    1041,
    0,
    'martin.engst@seznam.cz',
    '725985718',
    1,
    '1998-08-31',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4541,
    'Matěj Vondrák',
    '',
    4,
    1051,
    0,
    'matej.vondrak@icloud.com',
    '704011560',
    1,
    '2005-09-11',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4551,
    'Klára Štepánková',
    '',
    4,
    1061,
    0,
    'klarastepankova59@volny.cz',
    '606465549',
    2,
    '2003-06-04',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4561,
    'Jakub Kamenický',
    '',
    4,
    1071,
    0,
    'ja.kamenicky@centrum.cz',
    '730957978',
    1,
    '1998-10-06',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4571,
    'Jana Neužilová',
    '',
    4,
    1081,
    0,
    'neuzilovaja@seznam.cz',
    '736673434',
    2,
    '1997-11-03',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4581,
    'Sofiya Shevtsova',
    '',
    4,
    1091,
    0,
    'sofiya.shevtsova95@gmail.com',
    '771163551',
    2,
    '1995-10-01',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4591,
    'Matěj Bodiš',
    '',
    4,
    1101,
    0,
    'matejbodis@email.cz',
    '736109798',
    1,
    '2000-12-29',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4601,
    'Adriana Vachková',
    '',
    11,
    NULL,
    0,
    'vachkova.adri@gmail.com',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4611,
    'Hana Kalinová Dobest',
    '',
    11,
    NULL,
    0,
    'dobest.jobs@seznam.cz',
    '0',
    2,
    '0000-00-00',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4621,
    'Anežka Geislerová',
    '34e623babce1ac0daa36b43dc9cfbb75',
    4,
    1111,
    0,
    'anezkageislerova@gmail.com',
    '702279469',
    2,
    '2004-08-13',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4631,
    'Marie Jurenová',
    '34e623babce1ac0daa36b43dc9cfbb75',
    4,
    1121,
    0,
    'marie.jurenova110702@gmail.com',
    '773685391',
    2,
    '2002-07-11',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4641,
    'Anna Šaffková',
    '34e623babce1ac0daa36b43dc9cfbb75',
    4,
    1131,
    0,
    'anna.saffkova.tbs21@gmail.com',
    '734282585',
    2,
    '2004-05-27',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4651,
    'Ludmila Bukovič Orságová',
    '34e623babce1ac0daa36b43dc9cfbb75',
    4,
    1141,
    0,
    'lhabova@gmail.com',
    '739017371',
    2,
    '1968-02-03',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4661,
    'Světlana Štrajtová',
    '34e623babce1ac0daa36b43dc9cfbb75',
    4,
    1151,
    0,
    'sstrajtova@seznam.cz',
    '730176384',
    2,
    '1970-09-08',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4671,
    'Marcela Hamplová',
    '34e623babce1ac0daa36b43dc9cfbb75',
    4,
    1161,
    0,
    'macihamplova@gmail.com',
    '775925056',
    2,
    '2002-12-24',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4681,
    'Erdenetegsh Dulamjav',
    '34e623babce1ac0daa36b43dc9cfbb75',
    4,
    1171,
    0,
    'erdenetegsh@seznam.cz',
    '720688827',
    1,
    '2006-11-08',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4691,
    'Lucie Budáková',
    '34e623babce1ac0daa36b43dc9cfbb75',
    4,
    1181,
    0,
    'budakova.lucinka@seznam.cz',
    '734322899',
    2,
    '2004-02-17',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4701,
    'Šárka Kopencová',
    '34e623babce1ac0daa36b43dc9cfbb75',
    4,
    1191,
    0,
    'kosarisko@seznam.cz',
    '728875282',
    2,
    '1987-01-06',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4711,
    'Erika Maliníková',
    '34e623babce1ac0daa36b43dc9cfbb75',
    4,
    1201,
    0,
    'pavlinacj@gmail.com',
    '704606980',
    2,
    '1977-03-29',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4721,
    'Linda Opočenská',
    '34e623babce1ac0daa36b43dc9cfbb75',
    4,
    1211,
    0,
    'opocenskalinda@gmail.com',
    '737130524',
    2,
    '2007-08-02',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4731,
    'Jakub Kučera',
    '34e623babce1ac0daa36b43dc9cfbb75',
    4,
    1221,
    0,
    'jakub.kucera@gymkren.cz',
    '777883799',
    1,
    '2005-06-22',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4741,
    'Kryštof Cikrle',
    '34e623babce1ac0daa36b43dc9cfbb75',
    4,
    1231,
    0,
    'krystof.cikrle@seznam.cz',
    '737105624',
    1,
    '2005-12-06',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4751,
    'Polina Ryzhova',
    '34e623babce1ac0daa36b43dc9cfbb75',
    4,
    1241,
    0,
    'polinking@gmail.com',
    '773621377',
    2,
    '2006-10-21',
    1
  );
INSERT INTO
  `users` (
    `id_us`,
    `name`,
    `password`,
    `role`,
    `salary`,
    `canLog`,
    `email`,
    `phone`,
    `gender`,
    `birthday`,
    `active`
  )
VALUES
  (
    4761,
    'Štěpánka Forejtová',
    '34e623babce1ac0daa36b43dc9cfbb75',
    4,
    1251,
    0,
    'steph.forejtova@gmail.com',
    '608943962',
    2,
    '2006-06-20',
    1
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
