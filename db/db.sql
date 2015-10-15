/*
SQLyog Community v12.12 (64 bit)
MySQL - 5.6.21 : Database - hike_schedule
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_7c37fa2e5dd3b074_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_7c37fa2e5dd3b074_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_2a4723a9790ec0dc_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_37630e12e3b56de8_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add event type',7,'add_eventtype'),(20,'Can change event type',7,'change_eventtype'),(21,'Can delete event type',7,'delete_eventtype'),(22,'Can add event',8,'add_event'),(23,'Can change event',8,'change_event'),(24,'Can delete event',8,'delete_event');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (1,'pbkdf2_sha256$20000$pgOtDdKWS8ve$Je3FhlZr5D95Fgk6zdYy8LZgC8dGtsFEiQoMYFWWRdQ=','2015-10-15 04:34:14.935372',1,'admin','','','keith.dechant@gmail.com',1,1,'2015-10-15 04:33:37.994640');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_6beaf1b486df372c_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_6beaf1b486df372c_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_2c679fef99cccf03_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_697f24ce551b6745_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_697f24ce551b6745_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_2292f5985b82ec54_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_316f4e9c06d5ddf3_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_6b465f90273233ee_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_316f4e9c06d5ddf3_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_6b465f90273233ee_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values (1,'2015-10-15 04:35:55.710378','1','EventType object',1,'',7,1),(2,'2015-10-15 04:36:02.655366','2','EventType object',1,'',7,1),(3,'2015-10-15 04:36:07.216645','3','EventType object',1,'',7,1),(4,'2015-10-15 04:36:10.912454','4','EventType object',1,'',7,1),(5,'2015-10-15 04:36:15.543472','5','EventType object',1,'',7,1),(6,'2015-10-15 04:36:20.607891','6','EventType object',1,'',7,1),(7,'2015-10-15 04:53:54.717326','1','Hike',1,'',7,1),(8,'2015-10-15 04:54:01.271804','2','Ramble',1,'',7,1),(9,'2015-10-15 04:54:05.474156','3','Snowshoe',1,'',7,1),(10,'2015-10-15 04:54:09.711131','4','XC-Ski',1,'',7,1),(11,'2015-10-15 04:54:14.214135','5','Camping',1,'',7,1),(12,'2015-10-15 04:54:17.031165','6','Pub Night',1,'',7,1),(13,'2015-10-15 04:54:24.778153','7','Rock Climbing',1,'',7,1),(14,'2015-10-15 04:56:26.711072','1','Devil’s Rest',1,'',8,1),(15,'2015-10-15 05:07:39.194292','2','Radio Room',1,'',8,1),(16,'2015-10-15 05:13:31.233694','2','Radio Room',2,'Changed event_date.',8,1),(17,'2015-10-15 05:13:36.972588','1','Devil’s Rest',2,'Changed event_date.',8,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_7a28978d8dcc291d_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'hike_schedule','event'),(7,'hike_schedule','eventtype'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2015-10-15 03:12:31.920894'),(2,'auth','0001_initial','2015-10-15 03:12:32.733390'),(3,'admin','0001_initial','2015-10-15 03:12:32.967769'),(4,'contenttypes','0002_remove_content_type_name','2015-10-15 03:12:33.311523'),(5,'auth','0002_alter_permission_name_max_length','2015-10-15 03:12:33.483412'),(6,'auth','0003_alter_user_email_max_length','2015-10-15 03:12:33.561538'),(7,'auth','0004_alter_user_username_opts','2015-10-15 03:12:33.577151'),(8,'auth','0005_alter_user_last_login_null','2015-10-15 03:12:33.639652'),(9,'auth','0006_require_contenttypes_0002','2015-10-15 03:12:33.639652'),(10,'sessions','0001_initial','2015-10-15 03:12:33.733429'),(12,'hike_schedule','0001_initial','2015-10-15 04:52:07.466716');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

/*Table structure for table `hike_schedule_event` */

DROP TABLE IF EXISTS `hike_schedule_event`;

CREATE TABLE `hike_schedule_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `event_date` datetime(6) DEFAULT NULL,
  `description` longtext,
  `meeting_place` varchar(200) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `route_type` varchar(200) DEFAULT NULL,
  `elevation_gain` int(11) DEFAULT NULL,
  `drive_distance` int(11) DEFAULT NULL,
  `pace` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `event_type_id` int(11),
  PRIMARY KEY (`id`),
  KEY `hike_schedule_event_5e891baf` (`event_type_id`),
  CONSTRAINT `hik_event_type_id_53b30093514ce724_fk_hike_schedule_eventtype_id` FOREIGN KEY (`event_type_id`) REFERENCES `hike_schedule_eventtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `hike_schedule_event` */

insert  into `hike_schedule_event`(`id`,`title`,`event_date`,`description`,`meeting_place`,`notes`,`distance`,`route_type`,`elevation_gain`,`drive_distance`,`pace`,`status`,`event_type_id`) values (1,'Devil’s Rest','2015-10-31 16:00:00.000000','It’s Halloween, so where else would we go but Devil’s Rest? We’ll start at Wahkeena Falls and hike up past rushing streams and two waterfalls up onto the bluffs overlooking the Columbia. If the weather is clear, there is a viewpoint near the summit with one of the Gorge’s rare Mt. Rainier views. Then our mission will be to locate the colony of garden gnomes which inhabit the summit.','Gateway Transit Center','Notes',7.6,'loop',2550,50,'Moderate','scheduled',1),(2,'Radio Room','2015-10-20 02:00:00.000000','Join AYM the third Monday of the month at 7pm for our roaming Pub Night! This month we’ll be at Radio Room, 1101 NE Alberta St. Come join us for an evening of new friends, adventure planning, and malted beverages! This is also a great time to find out what we’re up to, plan your next adventure, and see what the Mazamas are all about in a more informal atmosphere. Bring your stories and photos from your recent adventures; extra points for pics from Mazama events.','Radio Room, 1101 NE Alberta St.','',0,'',0,0,'','scheduled',6);

/*Table structure for table `hike_schedule_event_leaders` */

DROP TABLE IF EXISTS `hike_schedule_event_leaders`;

CREATE TABLE `hike_schedule_event_leaders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_id` (`event_id`,`user_id`),
  KEY `hike_schedule_event_lea_user_id_5415d21e279d61b4_fk_auth_user_id` (`user_id`),
  CONSTRAINT `hike_schedul_event_id_499007f563df34df_fk_hike_schedule_event_id` FOREIGN KEY (`event_id`) REFERENCES `hike_schedule_event` (`id`),
  CONSTRAINT `hike_schedule_event_lea_user_id_5415d21e279d61b4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `hike_schedule_event_leaders` */

insert  into `hike_schedule_event_leaders`(`id`,`event_id`,`user_id`) values (4,1,1),(3,2,1);

/*Table structure for table `hike_schedule_eventtype` */

DROP TABLE IF EXISTS `hike_schedule_eventtype`;

CREATE TABLE `hike_schedule_eventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `hike_schedule_eventtype` */

insert  into `hike_schedule_eventtype`(`id`,`name`) values (1,'Hike'),(2,'Ramble'),(3,'Snowshoe'),(4,'XC-Ski'),(5,'Camping'),(6,'Pub Night'),(7,'Rock Climbing');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
