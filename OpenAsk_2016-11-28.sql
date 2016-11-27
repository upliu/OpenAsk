# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.15)
# Database: OpenAsk
# Generation Time: 2016-11-27 17:22:28 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table openask_answer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_answer`;

CREATE TABLE `openask_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `body` longtext COLLATE utf8_unicode_ci,
  `created_at` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `updated_at` int(10) unsigned NOT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `modified_at` int(10) unsigned DEFAULT NULL,
  `question_id` int(10) unsigned NOT NULL DEFAULT '0',
  `count_comment` int(10) unsigned NOT NULL DEFAULT '0',
  `count_view` int(10) unsigned NOT NULL DEFAULT '0',
  `count_vote_up` int(10) unsigned NOT NULL DEFAULT '0',
  `count_vote_down` int(10) unsigned NOT NULL DEFAULT '0',
  `count_follow` int(10) unsigned NOT NULL DEFAULT '0',
  `count_thank` int(10) unsigned NOT NULL DEFAULT '0',
  `count_mark` int(10) unsigned NOT NULL DEFAULT '0',
  `count_no_help` int(10) unsigned NOT NULL DEFAULT '0',
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_anonymous` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `author_id_question_id` (`author_id`,`question_id`),
  KEY `question_id` (`question_id`,`count_vote_up`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `openask_answer` WRITE;
/*!40000 ALTER TABLE `openask_answer` DISABLE KEYS */;

INSERT INTO `openask_answer` (`id`, `uuid`, `body`, `created_at`, `author_id`, `updated_at`, `modified_by`, `modified_at`, `question_id`, `count_comment`, `count_view`, `count_vote_up`, `count_vote_down`, `count_follow`, `count_thank`, `count_mark`, `count_no_help`, `is_lock`, `is_anonymous`)
VALUES
	(1,'09e21080-af82-11e6-b812-f853b79ef0d8','<p>会</p>',1474343308,4,1474343308,NULL,NULL,67,0,0,0,0,0,0,0,0,0,1),
	(2,'09e3c31c-af82-11e6-b812-f853b79ef0d8','<p>你好你好</p>',1474354545,4,1474354545,NULL,NULL,64,0,0,0,0,0,0,0,0,0,0),
	(3,'732d0fc8-b008-11e6-a431-2637a07e9778','<p>我来回答你啦。</p>',1479746101,1,1479746101,NULL,NULL,71,6,0,0,0,0,0,0,0,0,0),
	(4,'78e84b1e-b385-11e6-a431-2637a07e9778','<p>嗯嗯</p>',1480129652,1,1480129652,NULL,NULL,67,0,0,0,0,0,0,0,0,0,0),
	(7,'4bd21ab4-b403-11e6-a431-2637a07e9778','<p>a</p>',1480183693,1,1480183693,NULL,NULL,69,0,0,0,0,0,0,0,0,0,0),
	(8,'405994d6-b40e-11e6-a431-2637a07e9778','<p>单元测试回答内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480188398,1,1480188398,NULL,NULL,108,0,0,0,0,0,0,0,0,0,1),
	(9,'ab9a1c2a-b40e-11e6-a431-2637a07e9778','<p>单元测试回答内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480188578,1,1480188578,NULL,NULL,109,0,0,0,0,0,0,0,0,0,1),
	(10,'c0d6d5c4-b40e-11e6-a431-2637a07e9778','<p>单元测试回答内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480188613,1,1480188613,NULL,NULL,110,0,0,1,0,0,0,0,0,0,1),
	(11,'c464095a-b40e-11e6-a431-2637a07e9778','<p>单元测试回答内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480188619,1,1480188619,NULL,NULL,111,0,0,1,0,0,0,0,0,0,1),
	(12,'e25ed6e4-b452-11e6-a431-2637a07e9778','<p>单元测试回答内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480217875,1,1480217875,NULL,NULL,112,0,0,0,0,0,0,0,0,0,1),
	(13,'9d9828e2-b454-11e6-a431-2637a07e9778','<p>单元测试回答内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480218619,1,1480218619,NULL,NULL,113,0,0,0,0,0,0,0,0,0,1),
	(14,'b3cd2c48-b454-11e6-a431-2637a07e9778','<p>单元测试回答内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480218656,1,1480218656,NULL,NULL,114,0,0,1,0,0,0,0,0,0,1);

/*!40000 ALTER TABLE `openask_answer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table openask_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_comment`;

CREATE TABLE `openask_comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `puuid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `reply_author_id` int(10) unsigned DEFAULT NULL,
  `reply_comment_id` int(10) unsigned DEFAULT NULL,
  `count_vote_up` int(10) unsigned NOT NULL DEFAULT '0',
  `comment_type` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uuid` (`uuid`),
  KEY `puuid` (`puuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `openask_comment` WRITE;
/*!40000 ALTER TABLE `openask_comment` DISABLE KEYS */;

INSERT INTO `openask_comment` (`id`, `uuid`, `puuid`, `body`, `created_at`, `author_id`, `reply_author_id`, `reply_comment_id`, `count_vote_up`, `comment_type`)
VALUES
	(1,'6ad94cac-b39f-11e6-a431-2637a07e9778','1550ee9c-af81-11e6-b812-f853b79ef0d8','测试评论',1480140795,1,NULL,NULL,0,NULL),
	(2,'700f18be-b39f-11e6-a431-2637a07e9778','1550ee9c-af81-11e6-b812-f853b79ef0d8','送㩐',1480140804,1,NULL,NULL,0,NULL),
	(3,'927057ec-b39f-11e6-a431-2637a07e9778','1550ee9c-af81-11e6-b812-f853b79ef0d8','ddd',1480140861,1,NULL,NULL,0,NULL),
	(4,'f6578cd8-b3a1-11e6-a431-2637a07e9778','732d0fc8-b008-11e6-a431-2637a07e9778','1',1480141888,1,NULL,NULL,0,NULL),
	(5,'88a6360c-b3a2-11e6-a431-2637a07e9778','732d0fc8-b008-11e6-a431-2637a07e9778','2',1480142134,1,NULL,NULL,0,NULL),
	(6,'9ea58746-b3a2-11e6-a431-2637a07e9778','732d0fc8-b008-11e6-a431-2637a07e9778','3',1480142170,1,NULL,NULL,0,NULL),
	(7,'c2e41960-b3a2-11e6-a431-2637a07e9778','732d0fc8-b008-11e6-a431-2637a07e9778','4',1480142231,1,NULL,NULL,0,NULL),
	(8,'cd0c3850-b3a2-11e6-a431-2637a07e9778','732d0fc8-b008-11e6-a431-2637a07e9778','5',1480142248,1,NULL,NULL,0,NULL),
	(9,'20562822-b3a3-11e6-a431-2637a07e9778','732d0fc8-b008-11e6-a431-2637a07e9778','6',1480142388,1,NULL,NULL,0,NULL),
	(10,'4c59811c-b3a3-11e6-a431-2637a07e9778','1550ee9c-af81-11e6-b812-f853b79ef0d8','1',1480142462,1,NULL,NULL,0,NULL),
	(11,'73b4e062-b3ad-11e6-a431-2637a07e9778','dfc9ce14-af81-11e6-b812-f853b79ef0d8','asdf',1480146823,1,NULL,NULL,0,NULL),
	(13,'3a6e6f9a-b46a-11e6-a431-2637a07e9778','e2537092-b452-11e6-a431-2637a07e9778','测试评论',1480227902,1,NULL,NULL,0,'question'),
	(15,'4bf0d078-b46a-11e6-a431-2637a07e9778','e2537092-b452-11e6-a431-2637a07e9778','回复你',1480227931,1,1,13,0,'question');

/*!40000 ALTER TABLE `openask_comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table openask_migration
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_migration`;

CREATE TABLE `openask_migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `openask_migration` WRITE;
/*!40000 ALTER TABLE `openask_migration` DISABLE KEYS */;

INSERT INTO `openask_migration` (`version`, `apply_time`)
VALUES
	('m000000_000000_base',1479489600),
	('m140209_132017_init',1479489730),
	('m140403_174025_create_account_table',1479489731),
	('m140504_113157_update_tables',1479489731),
	('m140504_130429_create_token_table',1479489731),
	('m140830_171933_fix_ip_field',1479489731),
	('m140830_172703_change_account_table_name',1479489731),
	('m141222_110026_update_ip_field',1479489731),
	('m141222_135246_alter_username_length',1479489731),
	('m150614_103145_update_social_account_table',1479489731),
	('m150623_212711_fix_username_notnull',1479489731),
	('m151218_234654_add_timezone_to_profile',1479489731);

/*!40000 ALTER TABLE `openask_migration` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table openask_profile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_profile`;

CREATE TABLE `openask_profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `openask_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `openask_profile` WRITE;
/*!40000 ALTER TABLE `openask_profile` DISABLE KEYS */;

INSERT INTO `openask_profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`)
VALUES
	(1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `openask_profile` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table openask_question
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_question`;

CREATE TABLE `openask_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `body` longtext COLLATE utf8_unicode_ci,
  `created_at` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `updated_at` int(10) unsigned NOT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `modified_at` int(10) unsigned DEFAULT NULL,
  `accept_answer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `count_comment` int(10) unsigned NOT NULL DEFAULT '0',
  `count_answer` int(10) unsigned NOT NULL DEFAULT '0',
  `count_view` int(10) unsigned NOT NULL DEFAULT '0',
  `count_vote_up` int(10) unsigned NOT NULL DEFAULT '0',
  `count_vote_down` int(10) unsigned NOT NULL DEFAULT '0',
  `count_follow` int(10) unsigned NOT NULL DEFAULT '0',
  `count_thank` int(10) unsigned NOT NULL DEFAULT '0',
  `count_mark` int(10) unsigned NOT NULL DEFAULT '0',
  `count_no_help` int(10) unsigned NOT NULL DEFAULT '0',
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_anonymous` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `last_active` int(10) unsigned DEFAULT NULL,
  `last_answer_id` int(10) unsigned DEFAULT NULL,
  `last_answer_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `openask_question` WRITE;
/*!40000 ALTER TABLE `openask_question` DISABLE KEYS */;

INSERT INTO `openask_question` (`id`, `uuid`, `title`, `body`, `created_at`, `author_id`, `updated_at`, `modified_by`, `modified_at`, `accept_answer_id`, `count_comment`, `count_answer`, `count_view`, `count_vote_up`, `count_vote_down`, `count_follow`, `count_thank`, `count_mark`, `count_no_help`, `is_lock`, `is_anonymous`, `last_active`, `last_answer_id`, `last_answer_by`)
VALUES
	(3,'df9e74b2-af81-11e6-b812-f853b79ef0d8','PHP是最好的语言吗','<p>请问PHP是最好的语言吗</p>',1472551661,4,1472551661,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472608249,NULL,NULL),
	(4,'dfa112c6-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609249,4,1472609249,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609249,NULL,NULL),
	(5,'dfa250fa-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609305,4,1472609305,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609305,NULL,NULL),
	(6,'dfa2a6a4-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609311,4,1472609311,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609311,NULL,NULL),
	(7,'dfa49d06-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609586,4,1472609586,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609586,NULL,NULL),
	(8,'dfa52e2e-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609586,4,1472609586,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609586,NULL,NULL),
	(9,'dfa5a296-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609588,4,1472609588,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609588,NULL,NULL),
	(10,'dfa5e8f0-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609589,4,1472609589,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609589,NULL,NULL),
	(11,'dfa66154-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609590,4,1472609590,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609590,NULL,NULL),
	(12,'dfa723a0-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609591,4,1472609591,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609591,NULL,NULL),
	(13,'dfa83c54-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609592,4,1472609592,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609592,NULL,NULL),
	(14,'dfa8ee88-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609592,4,1472609592,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609592,NULL,NULL),
	(15,'dfacfb0e-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609593,4,1472609593,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609593,NULL,NULL),
	(16,'dfae9b62-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609594,4,1472609594,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609594,NULL,NULL),
	(17,'dfaf1628-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609595,4,1472609595,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609595,NULL,NULL),
	(18,'dfaf7820-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609595,4,1472609595,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609595,NULL,NULL),
	(19,'dfafe88c-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609596,4,1472609596,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609596,NULL,NULL),
	(20,'dfb02a4a-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609597,4,1472609597,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609597,NULL,NULL),
	(21,'dfb0c77a-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609598,4,1472609598,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609598,NULL,NULL),
	(22,'dfb16432-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609598,4,1472609598,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609598,NULL,NULL),
	(23,'dfb1b36a-af81-11e6-b812-f853b79ef0d8','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1472609859,4,1472609859,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609859,NULL,NULL),
	(24,'dfb2e398-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472634630,4,1472634630,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472634630,NULL,NULL),
	(25,'dfb48fc2-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472634817,4,1472634817,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472634817,NULL,NULL),
	(26,'dfb4fd9a-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472634867,4,1472634867,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472634867,NULL,NULL),
	(27,'dfb54660-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472634895,4,1472634895,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472634895,NULL,NULL),
	(28,'dfb596a6-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472635042,4,1472635042,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472635042,NULL,NULL),
	(29,'dfb70702-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472639282,4,1472639282,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472639282,NULL,NULL),
	(30,'dfb91416-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472639899,4,1472639899,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472639899,NULL,NULL),
	(31,'dfbb14c8-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472640078,4,1472640078,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472640078,NULL,NULL),
	(32,'dfbbb8b0-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472654985,4,1472654985,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472654985,NULL,NULL),
	(33,'dfbc780e-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472655005,4,1472655005,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472655005,NULL,NULL),
	(34,'dfbf3468-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472655021,4,1472655021,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472655021,NULL,NULL),
	(41,'dfbfb23a-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472656810,4,1472656810,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472656810,NULL,NULL),
	(46,'dfc0708a-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472657798,4,1472657798,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472657798,NULL,NULL),
	(47,'dfc17bba-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472657881,4,1472657881,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472657881,NULL,NULL),
	(48,'dfc429a0-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472657902,4,1472657902,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472657902,NULL,NULL),
	(60,'dfc4a86c-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472685763,4,1472685763,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472685763,NULL,NULL),
	(61,'dfc67840-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472685769,4,1472685769,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472685769,NULL,NULL),
	(62,'dfc787a8-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472685924,4,1472685924,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472685924,NULL,NULL),
	(63,'dfc8a7b4-af81-11e6-b812-f853b79ef0d8','测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate测试标题 tests\\codeception\\unit\\models\\Quest','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>',1472685929,4,1472685929,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472685929,NULL,NULL),
	(64,'dfc9ce14-af81-11e6-b812-f853b79ef0d8','大家好啊','<p>你们在干什么呢\r\n</p>alert(1)',1472687180,4,1474355505,NULL,NULL,0,1,1,0,0,0,0,0,0,0,0,1,1474354545,2,4),
	(67,'dfcb1b8e-af81-11e6-b812-f853b79ef0d8','读写分离到底会带来多大的性能提升？','<p>仅考虑redis或者mysql上的读写分离。\n</p>',1473641197,4,1480129652,NULL,NULL,0,0,2,0,0,0,0,0,0,0,0,0,1480129652,4,1),
	(68,'dfcc8cd0-af81-11e6-b812-f853b79ef0d8','你好吗','',1479578075,1,1479578075,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1479578075,NULL,NULL),
	(69,'dfcda9bc-af81-11e6-b812-f853b79ef0d8','测试提问','<p>问题详情</p>',1479687344,1,1480183693,NULL,NULL,0,0,1,0,0,0,0,0,0,0,0,0,1480183693,7,1),
	(70,'dfce02e0-af81-11e6-b812-f853b79ef0d8','测试提问','<p>问题详情</p>',1479687813,1,1479687813,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1479687813,NULL,NULL),
	(71,'1550ee9c-af81-11e6-b812-f853b79ef0d8','测试提问','<p>提问详情</p>',1479687962,1,1479746102,NULL,NULL,0,4,1,0,0,0,0,0,0,0,0,0,1479746102,3,1),
	(72,'5bc11ade-b2ae-11e6-a431-2637a07e9778','sdf','',1480037261,1,1480037261,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1480037261,NULL,NULL),
	(92,'4c5da402-b409-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\models\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480186270,1,1480186270,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1480186270,NULL,NULL),
	(93,'0b7adf3a-b40a-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\models\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480186591,1,1480186591,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1480186591,NULL,NULL),
	(94,'22193c00-b40a-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\models\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480186629,1,1480186629,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1480186629,NULL,NULL),
	(95,'8a97f96a-b40a-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\models\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480186804,1,1480186804,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1480186804,NULL,NULL),
	(96,'ccb3efde-b40a-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\models\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480186915,1,1480186915,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1480186915,NULL,NULL),
	(97,'d92d0f66-b40a-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\models\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480186936,1,1480186936,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1480186936,NULL,NULL),
	(98,'fb562578-b40a-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\models\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480186993,1,1480186993,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1480186993,NULL,NULL),
	(99,'0686c7a4-b40b-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\models\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480187012,1,1480187012,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1480187012,NULL,NULL),
	(100,'35f422e8-b40b-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\models\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480187092,1,1480187092,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1480187092,NULL,NULL),
	(101,'75ea61d2-b40b-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\models\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480187199,1,1480187199,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1480187199,NULL,NULL),
	(102,'57bd1c4e-b40c-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\models\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480187578,1,1480187578,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1480187578,NULL,NULL),
	(103,'af4a17a0-b40c-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\models\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480187725,1,1480187725,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1480187725,NULL,NULL),
	(104,'0940283a-b40d-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\models\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480187876,1,1480187876,NULL,NULL,0,0,0,0,0,1,0,0,0,0,0,1,1480187876,NULL,NULL),
	(105,'7518ddea-b40d-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\models\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480188057,1,1480188057,NULL,NULL,0,0,0,0,0,1,0,0,0,0,0,1,1480188057,NULL,NULL),
	(106,'8cfa4e3a-b40d-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\models\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480188097,1,1480188097,NULL,NULL,0,0,0,0,1,0,0,0,0,0,0,1,1480188097,NULL,NULL),
	(107,'dd29ba12-b40d-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480188231,1,1480188231,NULL,NULL,0,0,0,0,1,0,0,0,0,0,0,1,1480188231,NULL,NULL),
	(108,'40131eca-b40e-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480188397,1,1480188398,NULL,NULL,0,0,1,0,1,0,0,0,0,0,0,1,1480188398,8,1),
	(109,'ab732282-b40e-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480188577,1,1480188578,NULL,NULL,0,0,1,0,0,0,0,0,0,0,0,1,1480188578,9,1),
	(110,'c0bc55a0-b40e-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480188613,1,1480188613,NULL,NULL,0,0,1,0,1,0,0,0,0,0,0,1,1480188613,10,1),
	(111,'c4559b04-b40e-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480188619,1,1480188619,NULL,NULL,0,0,1,0,1,0,0,0,0,0,0,1,1480188619,11,1),
	(112,'e2537092-b452-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480217875,1,1480217875,NULL,NULL,0,2,1,0,0,0,0,0,0,0,0,1,1480217875,12,1),
	(113,'9d85ce40-b454-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480218619,1,1480218619,NULL,NULL,0,0,1,0,1,0,0,0,0,0,0,1,1480218619,13,1),
	(114,'b3bc5684-b454-11e6-a431-2637a07e9778','测试标题 tests\\codeception\\unit\\ModelTest::testQuestionCreate','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1480218656,1,1480218656,NULL,NULL,0,0,1,0,1,0,0,0,0,0,0,1,1480218656,14,1),
	(115,'8658c840-b46c-11e6-a431-2637a07e9778','PHP是最好的语言吗','',1480228888,1,1480228888,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1480228888,NULL,NULL),
	(116,'8c0596b6-b4c0-11e6-a431-2637a07e9778','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1480264975,1,1480264975,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1480264975,NULL,NULL),
	(117,'f485d3dc-b4c4-11e6-a431-2637a07e9778','测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',1480266869,1,1480266869,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1480266869,NULL,NULL);

/*!40000 ALTER TABLE `openask_question` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table openask_question_follow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_question_follow`;

CREATE TABLE `openask_question_follow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `add_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table openask_question_mark
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_question_mark`;

CREATE TABLE `openask_question_mark` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `add_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table openask_question_topic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_question_topic`;

CREATE TABLE `openask_question_topic` (
  `post_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `openask_question_topic` WRITE;
/*!40000 ALTER TABLE `openask_question_topic` DISABLE KEYS */;

INSERT INTO `openask_question_topic` (`post_id`, `topic_id`, `uid`, `add_time`)
VALUES
	(3,7,4,1472551661),
	(5,6,4,1472609306),
	(5,7,4,1472609306),
	(6,6,4,1472609311),
	(6,7,4,1472609311),
	(7,6,4,1472609586),
	(7,7,4,1472609586),
	(8,6,4,1472609586),
	(8,7,4,1472609586),
	(9,6,4,1472609588),
	(9,7,4,1472609588),
	(10,6,4,1472609589),
	(10,7,4,1472609589),
	(11,6,4,1472609590),
	(11,7,4,1472609590),
	(12,6,4,1472609591),
	(12,7,4,1472609591),
	(13,6,4,1472609592),
	(13,7,4,1472609592),
	(14,6,4,1472609592),
	(14,7,4,1472609592),
	(15,6,4,1472609593),
	(15,7,4,1472609593),
	(16,6,4,1472609594),
	(16,7,4,1472609594),
	(17,6,4,1472609595),
	(17,7,4,1472609595),
	(18,6,4,1472609595),
	(18,7,4,1472609595),
	(19,6,4,1472609596),
	(19,7,4,1472609596),
	(20,6,4,1472609597),
	(20,7,4,1472609597),
	(21,6,4,1472609598),
	(21,7,4,1472609598),
	(22,6,4,1472609598),
	(22,7,4,1472609598),
	(23,6,4,1472609859),
	(23,7,4,1472609859),
	(25,6,4,1472634817),
	(25,7,4,1472634817),
	(26,6,4,1472634867),
	(26,7,4,1472634867),
	(27,6,4,1472634896),
	(27,7,4,1472634896),
	(28,6,4,1472635042),
	(28,7,4,1472635042),
	(29,6,4,1472639282),
	(29,7,4,1472639282),
	(30,6,4,1472639899),
	(30,7,4,1472639899),
	(31,6,4,1472640078),
	(31,7,4,1472640078),
	(32,6,4,1472654985),
	(32,7,4,1472654985),
	(33,6,4,1472655005),
	(33,7,4,1472655005),
	(34,6,4,1472655022),
	(34,7,4,1472655021),
	(41,6,4,1472656810),
	(41,7,4,1472656810),
	(46,6,4,1472657798),
	(46,7,4,1472657798),
	(47,6,4,1472657881),
	(47,7,4,1472657881),
	(48,6,4,1472657902),
	(48,7,4,1472657902),
	(60,6,4,1472685763),
	(60,7,4,1472685763),
	(61,6,4,1472685769),
	(61,7,4,1472685769),
	(62,6,4,1472685924),
	(62,7,4,1472685924),
	(63,6,4,1472685929),
	(63,7,4,1472685929),
	(64,3,4,1474355506),
	(64,7,4,1474355506),
	(67,8,1,1480090331),
	(68,7,1,1479578075),
	(69,7,1,1479687344),
	(70,7,1,1479687813),
	(71,7,1,1479687962),
	(72,7,1,1480037261),
	(92,6,1,1480186271),
	(92,7,1,1480186271),
	(93,6,1,1480186591),
	(93,7,1,1480186591),
	(94,6,1,1480186629),
	(94,7,1,1480186629),
	(95,6,1,1480186805),
	(95,7,1,1480186805),
	(96,6,1,1480186915),
	(96,7,1,1480186915),
	(97,6,1,1480186936),
	(97,7,1,1480186936),
	(98,6,1,1480186994),
	(98,7,1,1480186994),
	(99,6,1,1480187012),
	(99,7,1,1480187012),
	(100,6,1,1480187092),
	(100,7,1,1480187092),
	(101,6,1,1480187199),
	(101,7,1,1480187199),
	(103,6,1,1480187725),
	(103,7,1,1480187725),
	(104,6,1,1480187876),
	(104,7,1,1480187876),
	(105,6,1,1480188057),
	(105,7,1,1480188057),
	(106,6,1,1480188097),
	(106,7,1,1480188097),
	(107,6,1,1480188232),
	(107,7,1,1480188232),
	(108,6,1,1480188398),
	(108,7,1,1480188397),
	(109,6,1,1480188578),
	(109,7,1,1480188578),
	(110,6,1,1480188613),
	(110,7,1,1480188613),
	(111,6,1,1480188619),
	(111,7,1,1480188619),
	(112,6,1,1480217875),
	(112,7,1,1480217875),
	(113,6,1,1480218619),
	(113,7,1,1480218619),
	(114,6,1,1480218656),
	(114,7,1,1480218656),
	(115,7,1,1480228888),
	(116,8,1,1480264975),
	(117,8,1,1480266869);

/*!40000 ALTER TABLE `openask_question_topic` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table openask_social_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_social_account`;

CREATE TABLE `openask_social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  UNIQUE KEY `account_unique_code` (`code`),
  KEY `fk_user_account` (`user_id`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `openask_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table openask_token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_token`;

CREATE TABLE `openask_token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `openask_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `openask_token` WRITE;
/*!40000 ALTER TABLE `openask_token` DISABLE KEYS */;

INSERT INTO `openask_token` (`user_id`, `code`, `created_at`, `type`)
VALUES
	(7,'tLyAgsPSswEIf6mZyouOE6mfNUAw4Tv3',1479566882,0),
	(10,'nnu0aobNxHpUw-a2UuOOvqOTy8T7L26L',1479577429,0);

/*!40000 ALTER TABLE `openask_token` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table openask_topic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_topic`;

CREATE TABLE `openask_topic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `icon` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `count_best` int(11) unsigned NOT NULL DEFAULT '0',
  `count_follower` int(11) unsigned NOT NULL DEFAULT '0',
  `count` int(11) unsigned NOT NULL DEFAULT '0',
  `count_last_week` int(10) unsigned NOT NULL DEFAULT '0',
  `count_last_month` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `openask_topic` WRITE;
/*!40000 ALTER TABLE `openask_topic` DISABLE KEYS */;

INSERT INTO `openask_topic` (`id`, `name`, `icon`, `desc`, `count_best`, `count_follower`, `count`, `count_last_week`, `count_last_month`)
VALUES
	(1,'asdf','','',0,0,0,0,0),
	(2,'CSS','','',0,0,2,2,2),
	(3,'Html','','',0,0,1,1,1),
	(4,'Java','','',0,0,3,1,3),
	(5,'Javascript','','',0,0,1,1,1),
	(6,'js','','',0,0,4,1,4),
	(7,'PHP','','',0,0,1,1,1),
	(8,'MySQL',NULL,NULL,0,0,0,0,0);

/*!40000 ALTER TABLE `openask_topic` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table openask_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_user`;

CREATE TABLE `openask_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_email` (`email`),
  UNIQUE KEY `user_unique_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `openask_user` WRITE;
/*!40000 ALTER TABLE `openask_user` DISABLE KEYS */;

INSERT INTO `openask_user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`)
VALUES
	(1,'admin','admin@qq.com','$2y$10$iSMIT6ob5jZEjLK0lhG/YO2pUkwu4923K8YX7HVig7L1oLRGso.Ue','lNSOgrfg71n0AKHozumapkGEdhr5Uv8N',1479490007,NULL,NULL,NULL,1479490007,1479490007,0),
	(2,'id2','id2@qq.com','$2y$10$GfpHBFVVSW/4o019lYL8ye9HM8DH5IOZigDC5htr8DlgQ79KJKCcO','wXRyLWStAe-16owVfTle5sw9pzTTILoo',1479490027,NULL,NULL,NULL,1479490027,1479490027,0),
	(3,'id3','id3@qq.com','$2y$10$6h4bQBeAf/tPptkMLs/EG.Y4QAMN53PrTsF4PwEszlOnm62jyGet2','etG-MSZDZ88hOs1M0YftY70Hgj9C8Y6y',1479490031,NULL,NULL,NULL,1479490031,1479490031,0),
	(4,'id4','id4@qq.com','$2y$10$8ZBw8by2roPNTvzv5y1ubeAKhAGfUbKRbTyV2zBkh9P6wXY7V/X8C','IvDZjh03KNcWsDTqDRlMggd6iUkdoS12',1479490036,NULL,NULL,NULL,1479490036,1479490036,0),
	(5,'id5','id5@qq.com','$2y$10$U5e1r28DVWDqAn.tRGuh8uXkwN6puxJd4VWDraadgG5k0pTx/eJAa','YVo6mRxzGCbxN9YGLjMMDkCBorAVFIid',1479490041,NULL,NULL,NULL,1479490041,1479490041,0),
	(6,'id6','id6@qq.com','$2y$10$16Yrbu/hLf.k.CNCW/Y89uZfxFDwIB8fPykHafwZBNj8cS9Uem0Lq','BU0FRcR5k7KcNYrNA-GLGLhkl54eNLGq',1479490046,NULL,NULL,NULL,1479490046,1479490046,0),
	(7,'id7','id7@qq.com','$2y$10$fFsSRYnDLkQBp/yyQf.roeHsMviHlz8l5DBnYT3dV1.ZkiTDtkJGS','U4STt_V2y1QahRp8J8ZS292DyKwnTiLm',NULL,NULL,NULL,'127.0.0.1',1479566882,1479566882,0),
	(8,'id8','id8@qq.com','$2y$10$PZzOWQ1JlCMdXklPI1Nrb.rcmYJkvnOqm0Rt/TEeYfhJdmhovzBoi','B8MlF-EJlgupk0ac02Yx_4FwWe4qsCzx',1479571351,NULL,NULL,NULL,1479571351,1479571351,0),
	(9,'id9','id9@qq.com','$2y$10$DYfApYgRwUYIiN3fethULOImltoeSWXMEOaSY36rEW9nTLGlmui52','EI2UE0ny-bZ_RB6FbJsfzmUc3mj7hDzc',1479571765,NULL,NULL,NULL,1479571765,1479571765,0),
	(10,'id10','id10@qq.com','$2y$10$JTDpYRqMRDWKrOSQvScbd.PVmmZAU4vtSlLK/Xl9izNtRL2azMeXu','YYgk4LZnjbehNzvzTZ8f1jwF_xI5MYsu',NULL,NULL,NULL,'127.0.0.1',1479577429,1479577429,0);

/*!40000 ALTER TABLE `openask_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table openask_user_action_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_user_action_history`;

CREATE TABLE `openask_user_action_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) unsigned NOT NULL,
  `user_id` int(20) unsigned NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `question_id` int(20) unsigned DEFAULT NULL,
  `answer_id` int(20) unsigned DEFAULT NULL,
  `is_anonymous` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `openask_user_action_history` WRITE;
/*!40000 ALTER TABLE `openask_user_action_history` DISABLE KEYS */;

INSERT INTO `openask_user_action_history` (`id`, `type`, `user_id`, `time`, `question_id`, `answer_id`, `is_anonymous`)
VALUES
	(14,2,4,1472551661,3,NULL,0),
	(15,2,4,1472609305,5,NULL,0),
	(16,2,4,1472609311,6,NULL,0),
	(17,2,4,1472609586,7,NULL,0),
	(18,2,4,1472609586,8,NULL,0),
	(19,2,4,1472609588,9,NULL,0),
	(20,2,4,1472609589,10,NULL,0),
	(21,2,4,1472609590,11,NULL,0),
	(22,2,4,1472609591,12,NULL,0),
	(23,2,4,1472609592,13,NULL,0),
	(24,2,4,1472609592,14,NULL,0),
	(25,2,4,1472609593,15,NULL,0),
	(26,2,4,1472609594,16,NULL,0),
	(27,2,4,1472609595,17,NULL,0),
	(28,2,4,1472609595,18,NULL,0),
	(29,2,4,1472609596,19,NULL,0),
	(30,2,4,1472609597,20,NULL,0),
	(31,2,4,1472609598,21,NULL,0),
	(32,2,4,1472609598,22,NULL,0),
	(33,2,4,1472609859,23,NULL,0),
	(34,2,1,1472634630,24,NULL,1),
	(35,2,1,1472634817,25,NULL,1),
	(36,2,1,1472634867,26,NULL,1),
	(37,2,1,1472634895,27,NULL,1),
	(38,2,4,1472635042,28,NULL,1),
	(39,2,4,1472639282,29,NULL,1),
	(40,2,4,1472639899,30,NULL,1),
	(41,2,4,1472640078,31,NULL,1),
	(42,2,4,1472654985,32,NULL,1),
	(43,2,4,1472655005,33,NULL,1),
	(44,2,4,1472655021,34,NULL,1),
	(45,2,4,1472656087,35,NULL,1),
	(46,2,4,1472656810,41,NULL,1),
	(47,4,4,1472657276,35,44,1),
	(48,4,4,1472657798,35,45,1),
	(49,2,4,1472657798,46,NULL,1),
	(50,2,4,1472657881,47,NULL,1),
	(51,2,4,1472657902,48,NULL,1),
	(52,4,4,1472658631,35,49,1),
	(53,4,4,1472658926,35,51,1),
	(54,4,4,1472658981,35,52,1),
	(55,4,4,1472659005,35,53,1),
	(56,4,4,1472659010,35,54,1),
	(57,4,4,1472659040,35,55,1),
	(58,4,4,1472659057,35,56,1),
	(59,4,4,1472659088,35,57,1),
	(60,2,4,1472685763,60,NULL,1),
	(61,2,4,1472685769,61,NULL,1),
	(62,2,4,1472685924,62,NULL,1),
	(63,2,4,1472685929,63,NULL,1),
	(64,2,4,1472687180,64,NULL,1),
	(65,4,4,1472687497,35,65,1),
	(66,4,4,1472689086,64,66,0),
	(67,2,4,1473641197,67,NULL,0),
	(68,4,4,1473642120,67,68,0),
	(69,4,4,1474343308,67,1,1),
	(70,4,4,1474354545,64,2,0),
	(71,2,1,1479578075,68,NULL,1),
	(72,2,1,1479687344,69,NULL,0),
	(73,2,1,1479687813,70,NULL,0),
	(74,2,1,1479687962,71,NULL,0),
	(75,4,1,1479746102,71,3,0),
	(76,2,1,1480037261,72,NULL,0),
	(77,4,1,1480129652,67,4,0),
	(81,4,1,1480183693,69,7,0),
	(98,2,1,1480186271,92,NULL,1),
	(99,2,1,1480186591,93,NULL,1),
	(100,2,1,1480186629,94,NULL,1),
	(101,2,1,1480186804,95,NULL,1),
	(102,2,1,1480186915,96,NULL,1),
	(103,2,1,1480186936,97,NULL,1),
	(104,2,1,1480186994,98,NULL,1),
	(105,2,1,1480187012,99,NULL,1),
	(106,2,1,1480187092,100,NULL,1),
	(107,2,1,1480187199,101,NULL,1),
	(108,2,1,1480187725,103,NULL,1),
	(109,2,1,1480187876,104,NULL,1),
	(110,2,1,1480188057,105,NULL,1),
	(111,2,1,1480188097,106,NULL,1),
	(112,2,1,1480188231,107,NULL,1),
	(113,2,1,1480188397,108,NULL,1),
	(114,4,1,1480188398,108,8,1),
	(115,2,1,1480188578,109,NULL,1),
	(116,4,1,1480188578,109,9,1),
	(117,2,1,1480188613,110,NULL,1),
	(118,4,1,1480188613,110,10,1),
	(119,2,1,1480188619,111,NULL,1),
	(120,4,1,1480188619,111,11,1),
	(121,2,1,1480217875,112,NULL,1),
	(122,4,1,1480217875,112,12,1),
	(123,2,1,1480218619,113,NULL,1),
	(124,4,1,1480218619,113,13,1),
	(125,2,1,1480218656,114,NULL,1),
	(126,4,1,1480218656,114,14,1),
	(127,2,1,1480228888,115,NULL,0),
	(128,2,1,1480264975,116,NULL,0),
	(129,2,1,1480266869,117,NULL,0);

/*!40000 ALTER TABLE `openask_user_action_history` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table openask_user_action_history_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_user_action_history_data`;

CREATE TABLE `openask_user_action_history_data` (
  `history_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `before_action` longtext COLLATE utf8_unicode_ci,
  `after_action` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table openask_user_follow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_user_follow`;

CREATE TABLE `openask_user_follow` (
  `uid` int(10) unsigned NOT NULL,
  `fans_id` int(10) unsigned NOT NULL,
  `time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uid`,`fans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `openask_user_follow` WRITE;
/*!40000 ALTER TABLE `openask_user_follow` DISABLE KEYS */;

INSERT INTO `openask_user_follow` (`uid`, `fans_id`, `time`)
VALUES
	(4,6,1468217532),
	(6,4,1468218293);

/*!40000 ALTER TABLE `openask_user_follow` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table openask_user_meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_user_meta`;

CREATE TABLE `openask_user_meta` (
  `user_id` int(10) NOT NULL,
  `last_read_feed` int(10) unsigned NOT NULL DEFAULT '0',
  `count_vote_up` int(10) unsigned NOT NULL DEFAULT '0',
  `count_thank` int(10) unsigned NOT NULL DEFAULT '0',
  `count_ask` int(10) unsigned NOT NULL DEFAULT '0',
  `count_answer` int(10) unsigned NOT NULL DEFAULT '0',
  `count_mark` int(10) unsigned NOT NULL DEFAULT '0',
  `avatar` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `gender` tinyint(4) NOT NULL DEFAULT '0',
  `headline` varchar(128) COLLATE utf8_unicode_ci DEFAULT '',
  `bio` text COLLATE utf8_unicode_ci,
  `business` varchar(128) COLLATE utf8_unicode_ci DEFAULT '',
  `location` varchar(128) COLLATE utf8_unicode_ci DEFAULT '',
  `display_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reputation` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `slug` (`slug`),
  CONSTRAINT `openask_user_meta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `openask_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `openask_user_meta` WRITE;
/*!40000 ALTER TABLE `openask_user_meta` DISABLE KEYS */;

INSERT INTO `openask_user_meta` (`user_id`, `last_read_feed`, `count_vote_up`, `count_thank`, `count_ask`, `count_answer`, `count_mark`, `avatar`, `gender`, `headline`, `bio`, `business`, `location`, `display_name`, `slug`, `reputation`)
VALUES
	(1,0,0,0,0,0,0,'/497f57e8327de0159b168fbe865c855c.jpg',0,'',NULL,'','','超级管理员','admin',0),
	(2,0,0,0,0,0,0,'/497f57e8327de0159b168fbe865c855c.jpg',0,'',NULL,'','','昵称-2','slug-0.5356868324202363',0),
	(3,0,0,0,0,0,0,'/497f57e8327de0159b168fbe865c855c.jpg',0,'',NULL,'','','昵称-3','slug-0.2967993712954217',0),
	(4,0,0,0,0,0,0,'/497f57e8327de0159b168fbe865c855c.jpg',0,'',NULL,'','','昵称-4','slug-0.8769363899500449',0),
	(5,0,0,0,0,0,0,'/497f57e8327de0159b168fbe865c855c.jpg',0,'',NULL,'','','昵称-5','slug-0.49428386659760387',0),
	(6,0,0,0,0,0,0,'/497f57e8327de0159b168fbe865c855c.jpg',0,'',NULL,'','','昵称-6','slug-0.8406101938715299',0),
	(7,0,0,0,0,0,0,'/497f57e8327de0159b168fbe865c855c.jpg',0,'',NULL,'','','昵称-7','slug-0.7201994002984831',0),
	(8,0,0,0,0,0,0,'/497f57e8327de0159b168fbe865c855c.jpg',0,'',NULL,'','','昵称-8','slug-0.07916645061147069',0),
	(9,0,0,0,0,0,0,'/497f57e8327de0159b168fbe865c855c.jpg',0,'',NULL,'','','昵称-9','slug-0.2352340828955491',0),
	(10,0,0,0,0,0,0,'/497f57e8327de0159b168fbe865c855c.jpg',0,'',NULL,'','','昵称-10','slug-0.9386710933769784',0);

/*!40000 ALTER TABLE `openask_user_meta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table openask_vote_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_vote_log`;

CREATE TABLE `openask_vote_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`,`user_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `openask_vote_log` WRITE;
/*!40000 ALTER TABLE `openask_vote_log` DISABLE KEYS */;

INSERT INTO `openask_vote_log` (`id`, `uuid`, `user_id`, `type`, `created_at`)
VALUES
	(24,'0b8e4f48-b40a-11e6-a431-2637a07e9778',1,1,1480186591),
	(25,'0b925aa2-b40a-11e6-a431-2637a07e9778',1,1,1480186591),
	(26,'222c7388-b40a-11e6-a431-2637a07e9778',1,1,1480186629),
	(27,'2233bf6c-b40a-11e6-a431-2637a07e9778',1,1,1480186629),
	(28,'8ab679bc-b40a-11e6-a431-2637a07e9778',1,1,1480186805),
	(29,'8ab96f5a-b40a-11e6-a431-2637a07e9778',1,1,1480186805),
	(30,'06944d48-b40b-11e6-a431-2637a07e9778',1,1,1480187012),
	(31,'0697c5c2-b40b-11e6-a431-2637a07e9778',1,1,1480187012),
	(32,'3607d2de-b40b-11e6-a431-2637a07e9778',1,1,1480187092),
	(33,'360b0332-b40b-11e6-a431-2637a07e9778',1,1,1480187092),
	(34,'75fc519e-b40b-11e6-a431-2637a07e9778',1,1,1480187199),
	(35,'75fe219a-b40b-11e6-a431-2637a07e9778',1,1,1480187199),
	(38,'0940283a-b40d-11e6-a431-2637a07e9778',1,2,1480187876),
	(40,'7518ddea-b40d-11e6-a431-2637a07e9778',1,2,1480188057),
	(77,'9d85ce40-b454-11e6-a431-2637a07e9778',1,1,1480218619),
	(81,'b3bc5684-b454-11e6-a431-2637a07e9778',1,1,1480218656),
	(85,'b3cd2c48-b454-11e6-a431-2637a07e9778',1,1,1480218657);

/*!40000 ALTER TABLE `openask_vote_log` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
