# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.15)
# Database: OpenAsk
# Generation Time: 2016-11-20 02:41:42 +0000
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
  `body` longtext COLLATE utf8_unicode_ci,
  `body_sanitized` longtext COLLATE utf8_unicode_ci,
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
  `count_interest` int(10) unsigned NOT NULL DEFAULT '0',
  `count_thank` int(10) unsigned NOT NULL DEFAULT '0',
  `count_mark` int(10) unsigned NOT NULL DEFAULT '0',
  `count_no_help` int(10) unsigned NOT NULL DEFAULT '0',
  `is_lock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_anonymous` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `author_id_question_id` (`author_id`,`question_id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `openask_answer` WRITE;
/*!40000 ALTER TABLE `openask_answer` DISABLE KEYS */;

INSERT INTO `openask_answer` (`id`, `body`, `body_sanitized`, `created_at`, `author_id`, `updated_at`, `modified_by`, `modified_at`, `question_id`, `count_comment`, `count_view`, `count_vote_up`, `count_vote_down`, `count_interest`, `count_thank`, `count_mark`, `count_no_help`, `is_lock`, `is_anonymous`)
VALUES
	(1,'<p>会</p>','<p>会</p>',1474343308,4,1474343308,NULL,NULL,67,0,0,0,0,0,0,0,0,0,1),
	(2,'<p>你好你好</p>','<p>你好你好</p>',1474354545,4,1474354545,NULL,NULL,64,0,0,0,0,0,0,0,0,0,0);

/*!40000 ALTER TABLE `openask_answer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table openask_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `openask_comment`;

CREATE TABLE `openask_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `reply_author_id` int(10) unsigned DEFAULT NULL,
  `reply_comment_id` int(10) unsigned DEFAULT NULL,
  `question_id` int(11) unsigned DEFAULT NULL,
  `answer_id` int(10) unsigned DEFAULT NULL,
  `count_like` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



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
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `body` longtext COLLATE utf8_unicode_ci,
  `body_sanitized` longtext COLLATE utf8_unicode_ci,
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
  `count_interest` int(10) unsigned NOT NULL DEFAULT '0',
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

INSERT INTO `openask_question` (`id`, `title`, `body`, `body_sanitized`, `created_at`, `author_id`, `updated_at`, `modified_by`, `modified_at`, `accept_answer_id`, `count_comment`, `count_answer`, `count_view`, `count_vote_up`, `count_vote_down`, `count_interest`, `count_thank`, `count_mark`, `count_no_help`, `is_lock`, `is_anonymous`, `last_active`, `last_answer_id`, `last_answer_by`)
VALUES
	(3,'PHP是最好的语言吗','<p>请问PHP是最好的语言吗</p>',NULL,1472551661,4,1472551661,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472608249,NULL,NULL),
	(4,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609249,4,1472609249,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609249,NULL,NULL),
	(5,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609305,4,1472609305,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609305,NULL,NULL),
	(6,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609311,4,1472609311,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609311,NULL,NULL),
	(7,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609586,4,1472609586,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609586,NULL,NULL),
	(8,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609586,4,1472609586,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609586,NULL,NULL),
	(9,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609588,4,1472609588,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609588,NULL,NULL),
	(10,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609589,4,1472609589,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609589,NULL,NULL),
	(11,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609590,4,1472609590,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609590,NULL,NULL),
	(12,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609591,4,1472609591,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609591,NULL,NULL),
	(13,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609592,4,1472609592,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609592,NULL,NULL),
	(14,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609592,4,1472609592,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609592,NULL,NULL),
	(15,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609593,4,1472609593,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609593,NULL,NULL),
	(16,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609594,4,1472609594,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609594,NULL,NULL),
	(17,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609595,4,1472609595,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609595,NULL,NULL),
	(18,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609595,4,1472609595,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609595,NULL,NULL),
	(19,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609596,4,1472609596,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609596,NULL,NULL),
	(20,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609597,4,1472609597,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609597,NULL,NULL),
	(21,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609598,4,1472609598,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609598,NULL,NULL),
	(22,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609598,4,1472609598,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609598,NULL,NULL),
	(23,'测试 QuestionCreate','<p>测试 QuestionCreate，文章内容</p>',NULL,1472609859,4,1472609859,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,1472609859,NULL,NULL),
	(24,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472634630,4,1472634630,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472634630,NULL,NULL),
	(25,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472634817,4,1472634817,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472634817,NULL,NULL),
	(26,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472634867,4,1472634867,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472634867,NULL,NULL),
	(27,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472634895,4,1472634895,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472634895,NULL,NULL),
	(28,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472635042,4,1472635042,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472635042,NULL,NULL),
	(29,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472639282,4,1472639282,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472639282,NULL,NULL),
	(30,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472639899,4,1472639899,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472639899,NULL,NULL),
	(31,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472640078,4,1472640078,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472640078,NULL,NULL),
	(32,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472654985,4,1472654985,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472654985,NULL,NULL),
	(33,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472655005,4,1472655005,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472655005,NULL,NULL),
	(34,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472655021,4,1472655021,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472655021,NULL,NULL),
	(41,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472656810,4,1472656810,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472656810,NULL,NULL),
	(46,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472657798,4,1472657798,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472657798,NULL,NULL),
	(47,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472657881,4,1472657881,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472657881,NULL,NULL),
	(48,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472657902,4,1472657902,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472657902,NULL,NULL),
	(60,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472685763,4,1472685763,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472685763,NULL,NULL),
	(61,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472685769,4,1472685769,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472685769,NULL,NULL),
	(62,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472685924,4,1472685924,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472685924,NULL,NULL),
	(63,'测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate测试标题 tests\\codeception\\unit\\models\\QuestionTest::testCreate测试标题 tests\\codeception\\unit\\models\\Quest','<p>单元测试内容</p><script>alert(1)</script><a href=\"http://www.qq.com/\">腾讯</a>','<p>单元测试内容</p><a href=\"http://www.qq.com/\">腾讯</a>',1472685929,4,1472685929,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1472685929,NULL,NULL),
	(64,'大家好啊','<p>你们在干什么呢\r\n</p>alert(1)','<p>你们在干什么呢\n</p>alert(1)',1472687180,4,1474355505,NULL,NULL,0,0,1,0,0,0,0,0,0,0,0,1,1474354545,2,4),
	(67,'读写分离到底会带来多大的性能提升？','仅考虑redis或者mysql上的读写分离。','仅考虑redis或者mysql上的读写分离。',1473641197,4,1474343308,NULL,NULL,0,0,1,0,0,0,0,0,0,0,0,0,1474343308,1,4),
	(68,'你好吗','','',1479578075,1,1479578075,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,1,1479578075,NULL,NULL);

/*!40000 ALTER TABLE `openask_question` ENABLE KEYS */;
UNLOCK TABLES;


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
	(67,8,4,1473641197),
	(68,7,1,1479578075);

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
  `uid` int(20) unsigned NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `question_id` int(20) unsigned DEFAULT NULL,
  `answer_id` int(20) unsigned DEFAULT NULL,
  `is_anonymous` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `openask_user_action_history` WRITE;
/*!40000 ALTER TABLE `openask_user_action_history` DISABLE KEYS */;

INSERT INTO `openask_user_action_history` (`id`, `type`, `uid`, `time`, `question_id`, `answer_id`, `is_anonymous`)
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
	(71,2,1,1479578075,68,NULL,1);

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
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `slug` (`slug`),
  CONSTRAINT `openask_user_meta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `openask_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `openask_user_meta` WRITE;
/*!40000 ALTER TABLE `openask_user_meta` DISABLE KEYS */;

INSERT INTO `openask_user_meta` (`user_id`, `last_read_feed`, `count_vote_up`, `count_thank`, `count_ask`, `count_answer`, `count_mark`, `avatar`, `gender`, `headline`, `bio`, `business`, `location`, `display_name`, `slug`)
VALUES
	(1,0,0,0,0,0,0,'',0,'',NULL,'','','超级管理员','admin'),
	(9,0,0,0,0,0,0,'',0,'',NULL,'','','id9','id9'),
	(10,0,0,0,0,0,0,'',0,'',NULL,'','','id10','id10');

/*!40000 ALTER TABLE `openask_user_meta` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
