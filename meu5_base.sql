# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.1.44)
# Database: meu5_base
# Generation Time: 2012-11-17 18:00:05 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(8) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `user_auth_level_id` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;

INSERT INTO `admin_users` (`ID`, `username`, `password`, `user_auth_level_id`, `email`, `enabled`)
VALUES
	(1,'gmeyer','fef6f971605336724b5e6c0c12dc2534',3,'g@m.com',1),
	(2,'admin','2942D340FE6C6AD0B7994A18C77773B2',1,'admin@m-m-media.com',1),
	(3,'john','81DC9BDB52D04DC20036DBD8313ED055',2,'j@jjj.com',0);

/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) DEFAULT NULL,
  `url_facebook` varchar(100) DEFAULT NULL,
  `url_twitter` varchar(100) DEFAULT NULL,
  `url_blog` varchar(100) DEFAULT NULL,
  `url_linkedin` varchar(100) DEFAULT NULL,
  `email_subscription_ID` int(11) NOT NULL,
  `main_email` varchar(100) DEFAULT NULL,
  `google_analytics_code` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`,`email_subscription_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;

INSERT INTO `company` (`ID`, `company_name`, `url_facebook`, `url_twitter`, `url_blog`, `url_linkedin`, `email_subscription_ID`, `main_email`, `google_analytics_code`)
VALUES
	(1,'test company, inc...','http://www.facebook.com','http://www.twitter.com','http://www.blogspot.com','http://www.linkedin.com',2,'bob@bob.com','asdsdf');

/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table company_locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `company_locations`;

CREATE TABLE `company_locations` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `address_1` varchar(100) DEFAULT NULL,
  `address_2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `postal` varchar(11) DEFAULT NULL,
  `phone_1` varchar(20) DEFAULT NULL,
  `phone_2` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email_1` varchar(100) DEFAULT NULL,
  `email_2` varchar(100) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `priority` smallint(4) DEFAULT NULL,
  `is_primary_location` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `company_locations` WRITE;
/*!40000 ALTER TABLE `company_locations` DISABLE KEYS */;

INSERT INTO `company_locations` (`ID`, `address_1`, `address_2`, `city`, `state`, `postal`, `phone_1`, `phone_2`, `fax`, `email_1`, `email_2`, `enabled`, `priority`, `is_primary_location`)
VALUES
	(5,'246 Main','','Orlando','FL','32803','444.666.7777','444.777.8888','','us@we.com','',1,77,1);

/*!40000 ALTER TABLE `company_locations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table email_subscription
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_subscription`;

CREATE TABLE `email_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `email_subscription` WRITE;
/*!40000 ALTER TABLE `email_subscription` DISABLE KEYS */;

INSERT INTO `email_subscription` (`ID`, `title`, `description`)
VALUES
	(1,'Constant Contact','Constant Contact is a popular email marketing service that helps you keep customers and prospects coming back?by using attractive, professional-looking email communications to stay in regular touch with them and build strong customer relationships. It\'s better and more effective than regular email.'),
	(2,'Mail Chimp','MailChimp helps you design email newsletters, share them on social networks, integrate with services you already use, and track your results. It\'s like your own personal publishing platform. '),
	(3,'Simple','Simple collection of email addresses via email');

/*!40000 ALTER TABLE `email_subscription` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table metadata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `metadata`;

CREATE TABLE `metadata` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ref_tablename` varchar(45) DEFAULT NULL,
  `ref_fieldname` varchar(45) DEFAULT NULL,
  `ref_label` varchar(150) DEFAULT NULL,
  `ref_type` varchar(20) DEFAULT NULL,
  `fkey_table_name` varchar(45) DEFAULT NULL,
  `edit_list_display` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `metadata` WRITE;
/*!40000 ALTER TABLE `metadata` DISABLE KEYS */;

INSERT INTO `metadata` (`ID`, `ref_tablename`, `ref_fieldname`, `ref_label`, `ref_type`, `fkey_table_name`, `edit_list_display`)
VALUES
	(15,'admin_users','username','User Name','text','',1),
	(16,'admin_users','password','Password','text','',0),
	(17,'admin_users','user_auth_level_id','Auth Level','fkey','user_auth_level',1),
	(18,'admin_users','email','Email','text','',1),
	(19,'admin_users','enabled','Enabled?','boolean','',1),
	(20,'company','company_name','Company Name','text','',1),
	(21,'company','url_facebook','Facebook URL','text','',0),
	(22,'company','url_twitter','Twitter URL','text','',0),
	(23,'company','url_blog','Blog URL','text','',0),
	(24,'company','url_linkedin','LinkedIn URL','text','',0),
	(25,'company','email_subscription_ID','Email Subscription','fkey','email_subscription',1),
	(26,'company_locations','address_1','Address 1','text','',1),
	(27,'company_locations','address_2','Address 2','text','',0),
	(28,'company_locations','city','City','text','',1),
	(29,'company_locations','state','State','text','',1),
	(30,'company_locations','postal','Zip Code','text','',0),
	(31,'company_locations','phone_1','Phone 1','text','',0),
	(32,'company_locations','phone_2','Phone 2','text','',0),
	(33,'company_locations','fax','FAX','text','',0),
	(34,'company_locations','email_1','Email 1','text','',0),
	(35,'company_locations','email_2','Email 2','text','',0),
	(36,'company_locations','enabled','Enabled?','boolean','',1),
	(37,'company_locations','priority','Priority','prinum','',1),
	(38,'company_locations','is_primary_location','Primary Location?','boolean','',1),
	(39,'email_subscription','title','Title','text','',1),
	(40,'email_subscription','description','Description','memo','',0),
	(41,'nav_main_sections','title','Title','text','',1),
	(42,'nav_main_sections','enabled','Enabled?','boolean','',1),
	(43,'nav_main_sections','priority','Priority','prinum','',1),
	(44,'nav_sub_sections','title','Title','text','',1),
	(45,'nav_sub_sections','enabled','Enabled?','boolean','',1),
	(46,'nav_sub_sections','priority','Priority','prinum','',1),
	(47,'pages','keyword','Keyword','text','',1),
	(48,'pages','nav_main_id','Main Navigation ID','fkey','nav_sub_sections',0),
	(49,'pages','nav_sub_id','Sub Navigation ID','fkey','tab_sections',0),
	(50,'pages','tab_sections_id','Tab Sections ID','fkey','tab_sections',0),
	(51,'pages','nav_main_priority','Priority','prinum','',0),
	(52,'pages','nav_sub_priority','Priority','prinum','',0),
	(53,'pages','tab_sections_priority','Priority','prinum','',0),
	(54,'pages','img','Image','text','',0),
	(55,'pages','img_alt_splash','Splash Page ALT txt','text','',0),
	(56,'pages','img_alt_page','Detail Page ALT text','text','',0),
	(57,'pages','meta_description','Meta Description','text','',0),
	(58,'pages','meta_keywords','Meta Keywords','text','',0),
	(59,'pages','tag_title','Paget TITLE text','text','',0),
	(60,'pages','headline','Page Main Headline','text','',0),
	(61,'pages','sub_headline','Page Sub Headline','text','',0),
	(62,'pages','body','Page Body Content','memo','',0),
	(63,'pages','enabled','Enabled?','boolean','',0),
	(64,'pages','priority','Priority','prinum','',0),
	(78,'splash_text','body','Body Content','memo','',1),
	(79,'tab_sections','title','Title','text','',1),
	(80,'tab_sections','enabled','Enabled?','boolean','',1),
	(81,'tab_sections','priority','Priority','prinum','',1),
	(82,'user_auth_level','level','Level','prinum','',1),
	(83,'user_auth_level','title','Title','text','',1),
	(92,'company','main_email','Main Corporate Email','text','',1),
	(93,'pages','google_conversion_code','Google Conversion Code Block','memo','',0),
	(94,'pages','google_analytics_code',NULL,NULL,NULL,1),
	(95,'company','google_analytics_code','Google Analytics Code Block','memo','',0);

/*!40000 ALTER TABLE `metadata` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table nav_main_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nav_main_sections`;

CREATE TABLE `nav_main_sections` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `priority` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `nav_main_sections` WRITE;
/*!40000 ALTER TABLE `nav_main_sections` DISABLE KEYS */;

INSERT INTO `nav_main_sections` (`ID`, `title`, `enabled`, `priority`)
VALUES
	(1,'Auto Insurance',1,10),
	(2,'Property',1,20),
	(3,'Life',1,33),
	(4,'Financial Services',1,45),
	(5,'Teacher\'s Corner',1,50),
	(6,'Resources',1,60);

/*!40000 ALTER TABLE `nav_main_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table nav_sub_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nav_sub_sections`;

CREATE TABLE `nav_sub_sections` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `priority` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `nav_sub_sections` WRITE;
/*!40000 ALTER TABLE `nav_sub_sections` DISABLE KEYS */;

INSERT INTO `nav_sub_sections` (`ID`, `title`, `enabled`, `priority`)
VALUES
	(11,'Why Teachers Insurance Specialists?',1,10),
	(12,'About Us',1,20),
	(13,'Careers',1,30);

/*!40000 ALTER TABLE `nav_sub_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) DEFAULT NULL,
  `nav_main_id` int(11) DEFAULT '0',
  `nav_sub_id` int(11) DEFAULT '0',
  `tab_sections_id` int(11) DEFAULT '0',
  `nav_main_priority` smallint(4) DEFAULT NULL,
  `nav_sub_priority` smallint(4) DEFAULT NULL,
  `tab_sections_priority` smallint(4) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `img_alt_splash` varchar(100) DEFAULT NULL,
  `img_alt_page` varchar(100) DEFAULT NULL,
  `meta_description` varchar(100) DEFAULT NULL,
  `meta_keywords` varchar(100) DEFAULT NULL,
  `tag_title` varchar(100) DEFAULT NULL,
  `headline` varchar(100) DEFAULT NULL,
  `sub_headline` varchar(100) DEFAULT NULL,
  `body` text,
  `enabled` tinyint(1) DEFAULT '1',
  `google_conversion_code` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`,`nav_main_id`,`tab_sections_id`,`nav_sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;

INSERT INTO `pages` (`ID`, `keyword`, `nav_main_id`, `nav_sub_id`, `tab_sections_id`, `nav_main_priority`, `nav_sub_priority`, `tab_sections_priority`, `img`, `img_alt_splash`, `img_alt_page`, `meta_description`, `meta_keywords`, `tag_title`, `headline`, `sub_headline`, `body`, `enabled`, `google_conversion_code`)
VALUES
	(1,'test 1',0,0,0,NULL,NULL,2,'yardPanorama.jpg','','','','','','','','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(14,'prop 2',2,NULL,NULL,20,NULL,NULL,'','prop 2','prop 2','prop 2','prop 2','prop 2','prop 2','prop 2','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(19,'Why Teachers Insurance Specialists',NULL,11,NULL,NULL,NULL,NULL,'','Why Teachers Insurance Specialists','Why Teachers Insurance Specialists','Why Teachers Insurance Specialists','Why Teachers Insurance Specialists','Why Teachers Insurance Specialists','Why Teachers Insurance Specialists','Why Teachers Insurance Specialists','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(20,'About Us',NULL,12,NULL,NULL,NULL,NULL,'',' About Us',' About Us',' About Us',' About Us',' About Us',' About Us',' About Us','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br><br>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br><br>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br><br>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(21,'Careers',NULL,13,NULL,NULL,NULL,NULL,'','Careers','Careers','Careers','Careers','Careers','Careers','Careers','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,'sdfasd'),
	(23,'John Doe Wins Teacher of the Year',NULL,NULL,1,NULL,NULL,10,'56529223.jpg','John Doe Wins Teacher of the Year','John Doe Wins Teacher of the Year','John Doe Wins Teacher of the Year','John Doe Wins Teacher of the Year','John Doe Wins Teacher of the Year','John Doe Wins Teacher of the Year','Lorem ipsum dolor sit','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br><br>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br><br>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br><br>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(24,'Mary McGiven Spotlight',NULL,NULL,1,NULL,NULL,20,'57443922.jpg','Mary McGiven Spotlight','Mary McGiven Spotlight','Mary McGiven Spotlight','Mary McGiven Spotlight','Mary McGiven Spotlight','Mary McGiven Spotlight','Mary McGiven Spotlight','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br><br>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br><br>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br><br>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(25,'Lisa Johnson Guides Young Scientists',NULL,NULL,1,NULL,NULL,30,'200525950-001.jpg','Lisa Johnson Guides Young Scientists','Lisa Johnson Guides Young Scientists','Lisa Johnson Guides Young Scientists','Lisa Johnson Guides Young Scientists','Lisa Johnson Guides Young Scientists','Lisa Johnson Guides Young Scientists','A look into the future of science','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br><br>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br><br>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br><br>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(26,'New Legislators and Education',NULL,NULL,1,NULL,NULL,40,'200309833-001.jpg','New Legislators and Education','New Legislators and Education','New Legislators and Education','New Legislators and Education','New Legislators and Education','New Legislators and Education','The New Session in Context','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br><br>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br><br>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br><br>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(29,'Prop 3',2,NULL,NULL,30,NULL,NULL,'','prop 3','prop 3','prop 3','prop 3','prop 3','prop 3','prop 3','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(30,'Prop 4',2,NULL,NULL,40,NULL,NULL,'','Prop 4','Prop 4','Prop 4','Prop 4','Prop 4','Prop 4','Prop 4','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(31,'Prop 5',2,NULL,NULL,50,NULL,NULL,'','Prop 5','Prop 5','Prop 5','Prop 5','Prop 5','Prop 5','Prop 5','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(56,'Auto 4',1,0,0,10,NULL,NULL,'','Auto 4','Auto 4','Auto 4','Auto 4','Auto 4','Auto 4','Auto 4','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(57,'Auto 5',1,0,0,10,NULL,NULL,'','Auto 5','Auto 5','Auto 5','Auto 5','Auto 5','Auto 5','Auto 5','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(58,'Auto 6',1,0,0,10,NULL,NULL,'','Auto 6','Auto 6','Auto 6','Auto 6','Auto 6','Auto 6','Auto 6','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(66,'Life 2',3,0,0,20,NULL,NULL,'','Life 2','Life 2','Life 2','Life 2','Life 2','Life 2','Life 2','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(67,'Life 3',3,0,0,30,NULL,NULL,'','Life 3','Life 3','Life 3','Life 3','Life 3','Life 3','Life 3','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(70,'Life 6',3,0,0,60,NULL,NULL,'','Life 6','Life 6','Life 6','Life 6','Life 6','Life 6','Life 6','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(72,'Financial 2',4,0,0,20,NULL,NULL,'','Financial 2','Financial 2','Financial 2','Financial 2','Financial 2','Financial 2','Financial 2','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(73,'Financial 3',4,0,0,30,NULL,NULL,'','Financial 3','Financial 3','Financial 3','Financial 3','Financial 3','Financial 3','Financial 3','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(74,'Financial 4',4,0,0,40,NULL,NULL,'','Financial 4','Financial 4','Financial 4','Financial 4','Financial 4','Financial 4','Financial 4','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(75,'Financial 5',4,0,0,50,NULL,NULL,'','Financial 5','Financial 5','Financial 5','Financial 5','Financial 5','Financial 5','Financial 5','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(76,'Financial 6',4,0,0,60,NULL,NULL,'','Financial 6','Financial 6','Financial 6','Financial 6','Financial 6','Financial 6','Financial 6','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(77,'Teacher 1',5,0,0,10,NULL,NULL,'','Teacher 1','Teacher 1','Teacher 1','Teacher 1','Teacher 1','Teacher 1','Teacher 1','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(78,'Teacher 2',5,0,0,20,NULL,NULL,'','Teacher 2','Teacher 2','Teacher 2','Teacher 2','Teacher 2','Teacher 2','Teacher 2','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(79,'Teacher 3',5,0,0,30,NULL,NULL,'','Teacher 3','Teacher 3','Teacher 3','Teacher 3','Teacher 3','Teacher 3','Teacher 3','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(80,'Teacher 4',5,0,0,40,NULL,NULL,'','Teacher 4','Teacher 4','Teacher 4','Teacher 4','Teacher 4','Teacher 4','Teacher 4','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(81,'Teacher 5',5,0,0,50,NULL,NULL,'','Teacher 5','Teacher 5','Teacher 5','Teacher 5','Teacher 5','Teacher 5','Teacher 5','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(82,'Teacher 6',5,0,0,60,NULL,NULL,'','Teacher 6','Teacher 6','Teacher 6','Teacher 6','Teacher 6','Teacher 6','Teacher 6','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(83,'Resources 1',6,0,0,10,NULL,NULL,'','Resources 1','Resources 1','Resources 1','Resources 1','Resources 1','Resources 1','Resources 1','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(84,'Resources 2',6,0,0,20,NULL,NULL,'','Resources 2','Resources 2','Resources 2','Resources 2','Resources 2','Resources 2','Resources 2','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(85,'Resources 3',6,0,0,30,NULL,NULL,'','Resources 3','Resources 3','Resources 3','Resources 3','Resources 3','Resources 3','Resources 3','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(86,'Resources 4',6,0,0,40,NULL,NULL,'','Resources 4','Resources 4','Resources 4','Resources 4','Resources 4','Resources 4','Resources 4','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(87,'Resources 5',6,0,0,50,NULL,NULL,'','Resources 5','Resources 5','Resources 5','Resources 5','Resources 5','Resources 5','Resources 5','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(88,'Resources 6',6,0,0,60,NULL,NULL,'','Resources 6','Resources 6','Resources 6','Resources 6','Resources 6','Resources 6','Resources 6','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,''),
	(89,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br/><br/>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. <br/><br/>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. <br/><br/>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.',1,NULL),
	(90,'Mr. Jones Back to Basics',0,0,2,NULL,NULL,10,'AA012859.jpg','jones back to basics','jones back to basics','jones back to basics','jones back to basics','jones back to basics','Mr. Jones Back to Basics','Tom Jones Gets Kids Engaged','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam \r\nnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat \r\nvolutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation \r\nullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br><br>Duis\r\n autem vel eum iriure dolor in hendrerit in vulputate velit esse \r\nmolestie consequat, vel illum dolore eu feugiat nulla facilisis at vero \r\neros et accumsan et iusto odio dignissim qui blandit praesent luptatum \r\nzzril delenit augue duis dolore te feugait nulla facilisi. Nam liber \r\ntempor cum soluta nobis eleifend option congue nihil imperdiet doming id\r\n quod mazim placerat facer possim assum. <br><br>Typi non habent \r\nclaritatem insitam; est usus legentis in iis qui facit eorum claritatem.\r\n Investigationes demonstraverunt lectores legere me lius quod ii legunt \r\nsaepius. Claritas est etiam processus dynamicus, qui sequitur mutationem\r\n consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc\r\n putamus parum claram, anteposuerit litterarum formas humanitatis per \r\nseacula quarta decima et quinta decima. <br><br>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.<br>',1,''),
	(91,'Jane Doe in Charge',0,0,2,NULL,NULL,20,'200157860-004.jpg','jane doe in charge','jane doe in charge','jane doe in charge','jane doe in charge','jane doe in charge','Jane Doe in Charge','Ms. Doe Sets the Record Straight','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam \r\nnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat \r\nvolutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation \r\nullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br><br>Duis\r\n autem vel eum iriure dolor in hendrerit in vulputate velit esse \r\nmolestie consequat, vel illum dolore eu feugiat nulla facilisis at vero \r\neros et accumsan et iusto odio dignissim qui blandit praesent luptatum \r\nzzril delenit augue duis dolore te feugait nulla facilisi. Nam liber \r\ntempor cum soluta nobis eleifend option congue nihil imperdiet doming id\r\n quod mazim placerat facer possim assum. <br><br>Typi non habent \r\nclaritatem insitam; est usus legentis in iis qui facit eorum claritatem.\r\n Investigationes demonstraverunt lectores legere me lius quod ii legunt \r\nsaepius. Claritas est etiam processus dynamicus, qui sequitur mutationem\r\n consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc\r\n putamus parum claram, anteposuerit litterarum formas humanitatis per \r\nseacula quarta decima et quinta decima. <br><br>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.<br>',1,''),
	(92,'Chemistry With Dr. Smith',0,0,2,NULL,NULL,30,'87582713.jpg','Chemistry With Dr. Smith','Chemistry With Dr. Smith','Chemistry With Dr. Smith','Chemistry With Dr. Smith','Chemistry With Dr. Smith','Chemistry With Dr. Smith','A New Way to Learn','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam \r\nnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat \r\nvolutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation \r\nullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br><br>Duis\r\n autem vel eum iriure dolor in hendrerit in vulputate velit esse \r\nmolestie consequat, vel illum dolore eu feugiat nulla facilisis at vero \r\neros et accumsan et iusto odio dignissim qui blandit praesent luptatum \r\nzzril delenit augue duis dolore te feugait nulla facilisi. Nam liber \r\ntempor cum soluta nobis eleifend option congue nihil imperdiet doming id\r\n quod mazim placerat facer possim assum. <br><br>Typi non habent \r\nclaritatem insitam; est usus legentis in iis qui facit eorum claritatem.\r\n Investigationes demonstraverunt lectores legere me lius quod ii legunt \r\nsaepius. Claritas est etiam processus dynamicus, qui sequitur mutationem\r\n consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc\r\n putamus parum claram, anteposuerit litterarum formas humanitatis per \r\nseacula quarta decima et quinta decima. <br><br>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.<br>',1,''),
	(93,'Stacey Keller Wins Again',0,0,2,NULL,NULL,40,'86801828.jpg','Stacey Keller Wins Again','Stacey Keller Wins Again','Stacey Keller Wins Again','Stacey Keller Wins Again','Stacey Keller Wins Again','Stacey Keller Wins Again','Teacher of the Year for the 3rd Time!','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam \r\nnonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat \r\nvolutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation \r\nullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. <br><br>Duis\r\n autem vel eum iriure dolor in hendrerit in vulputate velit esse \r\nmolestie consequat, vel illum dolore eu feugiat nulla facilisis at vero \r\neros et accumsan et iusto odio dignissim qui blandit praesent luptatum \r\nzzril delenit augue duis dolore te feugait nulla facilisi. Nam liber \r\ntempor cum soluta nobis eleifend option congue nihil imperdiet doming id\r\n quod mazim placerat facer possim assum. <br><br>Typi non habent \r\nclaritatem insitam; est usus legentis in iis qui facit eorum claritatem.\r\n Investigationes demonstraverunt lectores legere me lius quod ii legunt \r\nsaepius. Claritas est etiam processus dynamicus, qui sequitur mutationem\r\n consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc\r\n putamus parum claram, anteposuerit litterarum formas humanitatis per \r\nseacula quarta decima et quinta decima. <br><br>Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.<br><br>\r\n	  \r\n	  \r\n    <br>\r\n    <br>',1,'');

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table splash_text
# ------------------------------------------------------------

DROP TABLE IF EXISTS `splash_text`;

CREATE TABLE `splash_text` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `body` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `splash_text` WRITE;
/*!40000 ALTER TABLE `splash_text` DISABLE KEYS */;

INSERT INTO `splash_text` (`ID`, `body`)
VALUES
	(1,'<h1>Text content 1?</h1>Sed ut perspiciatis unde omnis iste natus error sit voluptatem \r\naccusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab\r\n illo inventore veritatis et quasi architecto beatae vitae dicta sunt \r\nexplicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut \r\nodit aut fugit, sed quia consequuntur magni dolores eos qui ratione \r\nvoluptatem sequi nesciunt. <br><h2>Neque porro quisquam</h2>Neque porro quisquam est, qui dolorem ipsum \r\nquia dolor sit amet, consectetur, adipisci velit, sed quia non numquam \r\neius modi tempora incidunt ut labore et dolore magnam aliquam quaerat \r\nvoluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam \r\ncorporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?\r\n Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse \r\nquam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo \r\nvoluptas nulla pariatur?<br>'),
	(2,'<h1>Text content 2?</h1>Sed ut perspiciatis unde omnis iste natus error sit voluptatem \r\naccusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab\r\n illo inventore veritatis et quasi architecto beatae vitae dicta sunt \r\nexplicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut \r\nodit aut fugit, sed quia consequuntur magni dolores eos qui ratione \r\nvoluptatem sequi nesciunt. <br><h2>Neque porro quisquam</h2>Neque porro quisquam est, qui dolorem ipsum \r\nquia dolor sit amet, consectetur, adipisci velit, sed quia non numquam \r\neius modi tempora incidunt ut labore et dolore magnam aliquam quaerat \r\nvoluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam \r\ncorporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?\r\n Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse \r\nquam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo \r\nvoluptas nulla pariatur?<br><br>');

/*!40000 ALTER TABLE `splash_text` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tab_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tab_sections`;

CREATE TABLE `tab_sections` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `priority` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tab_sections` WRITE;
/*!40000 ALTER TABLE `tab_sections` DISABLE KEYS */;

INSERT INTO `tab_sections` (`ID`, `title`, `enabled`, `priority`)
VALUES
	(1,'News & Events',1,10),
	(2,'Teacher Appreciation Events',1,20);

/*!40000 ALTER TABLE `tab_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_auth_level
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_auth_level`;

CREATE TABLE `user_auth_level` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level` smallint(4) DEFAULT '3',
  `title` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `user_auth_level` WRITE;
/*!40000 ALTER TABLE `user_auth_level` DISABLE KEYS */;

INSERT INTO `user_auth_level` (`ID`, `level`, `title`)
VALUES
	(1,1,'superuser'),
	(2,2,'admin'),
	(3,3,'sub admin');

/*!40000 ALTER TABLE `user_auth_level` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
