-- MySQL dump 10.13  Distrib 5.6.32-78.1, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wp_thecloud
-- ------------------------------------------------------
-- Server version	5.6.32-78.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (1,1,'Mr WordPress','','https://wpengine.com/','','2016-04-20 21:46:12','2016-04-20 21:46:12','Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.',0,'1','','',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `wpe_autoload_options_index` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=1779 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'siteurl','http://thecloud.wpengine.com','yes'),(2,'home','http://thecloud.wpengine.com','yes'),(3,'blogname','Alex Zuniga Blog','yes'),(4,'blogdescription','prepare for epic WordPress','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','azuniga0390@gmail.com','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','1','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','1','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','0','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','F j, Y','yes'),(24,'time_format','g:i a','yes'),(25,'links_updated_date_format','F j, Y g:i a','yes'),(26,'comment_moderation','0','yes'),(27,'moderation_notify','1','yes'),(28,'permalink_structure','/%postname%/','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:2:{i:0;s:19:\"rest-api/plugin.php\";i:1;s:29:\"wp-site-migrate/blogvault.php\";}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'comment_max_links','2','yes'),(37,'gmt_offset','0','yes'),(38,'default_email_category','1','yes'),(39,'recently_edited','','no'),(40,'template','genesis','yes'),(41,'stylesheet','nourish','yes'),(42,'comment_whitelist','1','yes'),(43,'blacklist_keys','','no'),(44,'comment_registration','0','yes'),(45,'html_type','text/html','yes'),(46,'use_trackback','0','yes'),(47,'default_role','subscriber','yes'),(48,'db_version','35700','yes'),(49,'uploads_use_yearmonth_folders','1','yes'),(50,'upload_path','/wp-content/uploads/','yes'),(51,'blog_public','1','yes'),(52,'default_link_category','2','yes'),(53,'show_on_front','posts','yes'),(54,'tag_base','','yes'),(55,'show_avatars','1','yes'),(56,'avatar_rating','G','yes'),(57,'upload_url_path','','yes'),(58,'thumbnail_size_w','150','yes'),(59,'thumbnail_size_h','150','yes'),(60,'thumbnail_crop','1','yes'),(61,'medium_size_w','300','yes'),(62,'medium_size_h','300','yes'),(63,'avatar_default','mystery','yes'),(64,'large_size_w','1024','yes'),(65,'large_size_h','1024','yes'),(66,'image_default_link_type','','yes'),(67,'image_default_size','','yes'),(68,'image_default_align','','yes'),(69,'close_comments_for_old_posts','0','yes'),(70,'close_comments_days_old','14','yes'),(71,'thread_comments','1','yes'),(72,'thread_comments_depth','5','yes'),(73,'page_comments','0','yes'),(74,'comments_per_page','50','yes'),(75,'default_comments_page','newest','yes'),(76,'comment_order','asc','yes'),(77,'sticky_posts','a:0:{}','yes'),(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(79,'widget_text','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(80,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(81,'uninstall_plugins','a:0:{}','no'),(82,'timezone_string','','yes'),(83,'page_for_posts','0','yes'),(84,'page_on_front','0','yes'),(85,'default_post_format','0','yes'),(86,'link_manager_enabled','0','yes'),(87,'finished_splitting_shared_terms','1','yes'),(88,'site_icon','0','yes'),(89,'medium_large_size_w','768','yes'),(90,'medium_large_size_h','0','yes'),(91,'initial_db_version','36686','yes'),(92,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(93,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(94,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(95,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(96,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(97,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(98,'sidebars_widgets','a:19:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:10:\"archives-2\";i:1;s:6:\"meta-2\";i:2;s:8:\"search-2\";i:3;s:12:\"categories-2\";i:4;s:14:\"recent-posts-2\";i:5;s:17:\"recent-comments-2\";}s:12:\"header-right\";a:0:{}s:7:\"sidebar\";N;s:18:\"sidebar-split-left\";N;s:19:\"sidebar-split-right\";N;s:20:\"sidebar-split-bottom\";N;s:14:\"before-content\";N;s:11:\"home-slider\";N;s:8:\"home-top\";N;s:18:\"home-triple-bottom\";N;s:18:\"home-double-bottom\";N;s:14:\"category-index\";N;s:19:\"widget-above-header\";N;s:20:\"widget-before-footer\";N;s:11:\"after-entry\";N;s:15:\"nav-social-menu\";N;s:8:\"footer-1\";N;s:8:\"footer-2\";N;s:13:\"array_version\";i:3;}','yes'),(99,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(100,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(101,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(102,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(103,'cron','a:6:{i:1482908880;a:1:{s:20:\"wp_maybe_auto_update\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1482918374;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1482928119;a:1:{s:23:\"bvdailyping_daily_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1482934185;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1482936793;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(115,'current_theme','Nourish Theme','yes'),(116,'theme_switched','','yes'),(117,'widget_widget_news_archive','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(134,'wpe_notices','a:1:{s:4:\"read\";s:0:\"\";}','yes'),(135,'wpe_notices_ttl','1482183272','yes'),(176,'_transient_all_the_cool_cats','1','yes'),(202,'recently_activated','a:0:{}','yes'),(203,'theme_mods_Fruitful','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1468597156;s:4:\"data\";a:5:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";N;s:9:\"sidebar-3\";N;s:9:\"sidebar-4\";N;}}}','yes'),(231,'wpcf7','a:2:{s:7:\"version\";s:3:\"4.5\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1469734353;s:7:\"version\";s:5:\"4.4.2\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}','yes'),(258,'wpephpcompat.test_version','7.0','no'),(259,'wpephpcompat.only_active','no','no'),(261,'wpephpcompat.scan_results','Name: Akismet\n\nPHP 7.0 compatible.\nUpdate Available: 3.1.11; Current Version: 3.1.5;\n\nName: Contact Form 7\n\nPHP 7.0 compatible.\n\nName: Fruitful\n\nPHP 7.0 compatible.\n\nName: Fruitful\n\nPHP 7.0 compatible.\n\nName: Hello Dolly\n\nPHP 7.0 compatible.\n\nName: Parabola\n\nPHP 7.0 compatible.\n\nName: Twenty Fifteen\n\nPHP 7.0 compatible.\n\nName: Twenty Fourteen\n\nPHP 7.0 compatible.\n\nName: Twenty Sixteen\n\nPHP 7.0 compatible.\n\nName: WPE Training Sandboxes\n\nPHP 7.0 compatible.\n\n','no'),(276,'widget_wpe_powered_by_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(311,'json_api_plugin_version','1.2.5','yes'),(360,'_transient_twentysixteen_categories','1','yes'),(681,'db_upgraded','','yes'),(762,'_transient_twentyfifteen_categories','1','yes'),(765,'theme_mods_twentyfifteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1474257203;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes'),(792,'bvActivateTime','1477312119','no'),(793,'bvSecretKey','au23mKZJ9HC2QUcblkmDb8cx5nHotd8D','no'),(794,'bvActivateRedirect','no','no'),(849,'widget_columns_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(854,'theme_mods_parabola','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1478791781;s:4:\"data\";a:10:{s:19:\"wp_inactive_widgets\";a:0:{}s:16:\"left-widget-area\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:17:\"right-widget-area\";N;s:24:\"first-footer-widget-area\";N;s:25:\"second-footer-widget-area\";N;s:24:\"third-footer-widget-area\";N;s:25:\"fourth-footer-widget-area\";N;s:25:\"above-content-widget-area\";N;s:25:\"below-content-widget-area\";N;s:18:\"header-widget-area\";N;}}}','yes'),(858,'theme_mods_twentysixteen','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1478791817;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";N;s:9:\"sidebar-3\";N;}}}','yes'),(859,'theme_mods_genesis','a:2:{i:0;b:0;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1478791832;s:4:\"data\";a:7:{s:19:\"wp_inactive_widgets\";a:0:{}s:12:\"header-right\";a:0:{}s:7:\"sidebar\";N;s:11:\"sidebar-alt\";N;s:8:\"footer-1\";N;s:8:\"footer-2\";N;s:8:\"footer-3\";N;}}}','yes'),(860,'widget_featured-page','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(861,'widget_featured-post','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(862,'widget_user-profile','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(863,'genesis-settings','a:40:{s:13:\"theme_version\";s:5:\"2.4.2\";s:10:\"db_version\";i:2403;s:13:\"first_version\";s:5:\"2.1.3\";s:6:\"update\";i:1;s:20:\"update_email_address\";s:0:\"\";s:8:\"feed_uri\";s:0:\"\";s:17:\"comments_feed_uri\";s:0:\"\";s:11:\"site_layout\";s:18:\"full-width-content\";s:15:\"content_archive\";s:4:\"full\";s:21:\"content_archive_limit\";i:0;s:10:\"image_size\";s:6:\"medium\";s:15:\"image_alignment\";s:0:\"\";s:9:\"posts_nav\";s:7:\"numeric\";s:8:\"blog_cat\";i:0;s:16:\"blog_cat_exclude\";s:0:\"\";s:12:\"blog_cat_num\";i:10;s:14:\"header_scripts\";s:0:\"\";s:14:\"footer_scripts\";s:0:\"\";s:21:\"breadcrumb_front_page\";i:0;s:15:\"breadcrumb_home\";i:0;s:17:\"breadcrumb_single\";i:0;s:15:\"breadcrumb_page\";i:0;s:21:\"breadcrumb_posts_page\";i:0;s:18:\"breadcrumb_archive\";i:0;s:14:\"breadcrumb_404\";i:0;s:21:\"breadcrumb_attachment\";i:0;s:14:\"comments_posts\";i:0;s:14:\"comments_pages\";i:0;s:25:\"content_archive_thumbnail\";i:0;s:9:\"superfish\";i:0;s:13:\"redirect_feed\";i:0;s:22:\"redirect_comments_feed\";i:0;s:16:\"trackbacks_posts\";i:0;s:16:\"trackbacks_pages\";i:0;s:12:\"update_email\";i:0;s:10:\"blog_title\";s:0:\"\";s:10:\"nav_extras\";s:0:\"\";s:21:\"nav_extras_twitter_id\";s:0:\"\";s:15:\"style_selection\";s:0:\"\";s:23:\"nav_extras_twitter_text\";s:0:\"\";}','yes'),(864,'genesis-seo-settings','a:30:{s:17:\"semantic_headings\";i:1;s:13:\"publisher_uri\";s:0:\"\";s:12:\"doctitle_sep\";s:3:\"–\";s:20:\"doctitle_seplocation\";s:5:\"right\";s:23:\"append_description_home\";i:1;s:10:\"home_h1_on\";s:5:\"title\";s:13:\"home_doctitle\";s:0:\"\";s:16:\"home_description\";s:0:\"\";s:13:\"home_keywords\";s:0:\"\";s:19:\"noindex_cat_archive\";i:1;s:19:\"noindex_tag_archive\";i:1;s:22:\"noindex_author_archive\";i:1;s:20:\"noindex_date_archive\";i:1;s:22:\"noindex_search_archive\";i:1;s:5:\"noodp\";i:1;s:6:\"noydir\";i:1;s:17:\"append_site_title\";i:0;s:12:\"home_noindex\";i:0;s:13:\"home_nofollow\";i:0;s:14:\"home_noarchive\";i:0;s:28:\"head_adjacent_posts_rel_link\";i:0;s:21:\"head_wlwmanifest_link\";i:0;s:14:\"head_shortlink\";i:0;s:9:\"noarchive\";i:0;s:21:\"noarchive_cat_archive\";i:0;s:21:\"noarchive_tag_archive\";i:0;s:24:\"noarchive_author_archive\";i:0;s:22:\"noarchive_date_archive\";i:0;s:24:\"noarchive_search_archive\";i:0;s:11:\"home_author\";i:0;}','yes'),(869,'theme_mods_Nourish - Bites to Brand','a:3:{i:0;b:0;s:17:\"btb_primary_color\";s:7:\"#e2e2e2\";s:16:\"btb_accent_color\";s:7:\"#00914b\";}','yes'),(1522,'rewrite_rules','a:75:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','yes'),(1523,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:5:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.7.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.7.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-4.7-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.7-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:3:\"4.7\";s:7:\"version\";s:3:\"4.7\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.7.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:57:\"https://downloads.wordpress.org/release/wordpress-4.7.zip\";s:10:\"no_content\";s:68:\"https://downloads.wordpress.org/release/wordpress-4.7-no-content.zip\";s:11:\"new_bundled\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.7-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:3:\"4.7\";s:7:\"version\";s:3:\"4.7\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.6.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.6.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.6.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.6.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.6.1\";s:7:\"version\";s:5:\"4.6.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:3;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.5.4.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.5.4.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.5.4-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.5.4-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.5.4\";s:7:\"version\";s:5:\"4.5.4\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:4;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.4.5.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.4.5.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.4.5-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.4.5-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.4.5-partial-0.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.4.5-rollback-0.zip\";}s:7:\"current\";s:5:\"4.4.5\";s:7:\"version\";s:5:\"4.4.5\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:3:\"4.4\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1482875226;s:15:\"version_checked\";s:3:\"4.4\";s:12:\"translations\";a:0:{}}','yes'),(1526,'can_compress_scripts','0','yes'),(1760,'_transient_timeout_genesis-update','1482918426','no'),(1761,'_transient_genesis-update','a:4:{s:11:\"new_version\";s:5:\"2.4.2\";s:3:\"url\";s:40:\"http://my.studiopress.com/themes/genesis\";s:7:\"package\";s:60:\"http://www.genesistheme.com/download/?file=genesis.2.4.2.zip\";s:13:\"changelog_url\";s:53:\"http://www.genesistheme.com/changelog/?TB_iframe=true\";}','no'),(1777,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1482875227;s:7:\"checked\";a:9:{s:8:\"Fruitful\";s:5:\"3.3.1\";s:8:\"fruitful\";s:5:\"3.3.1\";s:14:\"genesis-sample\";s:5:\"2.2.4\";s:7:\"genesis\";s:5:\"2.4.2\";s:7:\"nourish\";s:5:\"1.0.0\";s:8:\"parabola\";s:5:\"2.0.7\";s:13:\"twentyfifteen\";s:3:\"1.6\";s:14:\"twentyfourteen\";s:3:\"1.8\";s:13:\"twentysixteen\";s:3:\"1.2\";}s:8:\"response\";a:4:{s:8:\"parabola\";a:4:{s:5:\"theme\";s:8:\"parabola\";s:11:\"new_version\";s:5:\"2.1.0\";s:3:\"url\";s:38:\"https://wordpress.org/themes/parabola/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/theme/parabola.2.1.0.zip\";}s:13:\"twentyfifteen\";a:4:{s:5:\"theme\";s:13:\"twentyfifteen\";s:11:\"new_version\";s:3:\"1.7\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentyfifteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentyfifteen.1.7.zip\";}s:14:\"twentyfourteen\";a:4:{s:5:\"theme\";s:14:\"twentyfourteen\";s:11:\"new_version\";s:3:\"1.9\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentyfourteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentyfourteen.1.9.zip\";}s:13:\"twentysixteen\";a:4:{s:5:\"theme\";s:13:\"twentysixteen\";s:11:\"new_version\";s:3:\"1.3\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentysixteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentysixteen.1.3.zip\";}}s:12:\"translations\";a:0:{}}','yes'),(1778,'_site_transient_update_plugins','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1482875226;s:8:\"response\";a:3:{s:48:\"php-compatibility-checker/wpengine-phpcompat.php\";O:8:\"stdClass\":7:{s:2:\"id\";s:5:\"73431\";s:4:\"slug\";s:25:\"php-compatibility-checker\";s:6:\"plugin\";s:48:\"php-compatibility-checker/wpengine-phpcompat.php\";s:11:\"new_version\";s:5:\"1.3.1\";s:3:\"url\";s:56:\"https://wordpress.org/plugins/php-compatibility-checker/\";s:7:\"package\";s:74:\"https://downloads.wordpress.org/plugin/php-compatibility-checker.1.3.1.zip\";s:14:\"upgrade_notice\";s:32:\"Whitelisted a number of plugins.\";}s:27:\"wp-crontrol/wp-crontrol.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:4:\"1426\";s:4:\"slug\";s:11:\"wp-crontrol\";s:6:\"plugin\";s:27:\"wp-crontrol/wp-crontrol.php\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/wp-crontrol/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/wp-crontrol.1.4.zip\";}s:29:\"wp-site-migrate/blogvault.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"50706\";s:4:\"slug\";s:15:\"wp-site-migrate\";s:6:\"plugin\";s:29:\"wp-site-migrate/blogvault.php\";s:11:\"new_version\";s:4:\"1.41\";s:3:\"url\";s:46:\"https://wordpress.org/plugins/wp-site-migrate/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/wp-site-migrate.zip\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:6:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:2:\"15\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:3:\"3.2\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/akismet.3.2.zip\";}s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:3:\"790\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:3:\"4.6\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/contact-form-7.4.6.zip\";}s:29:\"easy-wp-smtp/easy-wp-smtp.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"40147\";s:4:\"slug\";s:12:\"easy-wp-smtp\";s:6:\"plugin\";s:29:\"easy-wp-smtp/easy-wp-smtp.php\";s:11:\"new_version\";s:5:\"1.2.3\";s:3:\"url\";s:43:\"https://wordpress.org/plugins/easy-wp-smtp/\";s:7:\"package\";s:55:\"https://downloads.wordpress.org/plugin/easy-wp-smtp.zip\";}s:21:\"wp-oauth/wp-oauth.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"54346\";s:4:\"slug\";s:8:\"wp-oauth\";s:6:\"plugin\";s:21:\"wp-oauth/wp-oauth.php\";s:11:\"new_version\";s:5:\"0.4.1\";s:3:\"url\";s:39:\"https://wordpress.org/plugins/wp-oauth/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/wp-oauth.0.4.1.zip\";}s:19:\"rest-api/plugin.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:4:\"7769\";s:4:\"slug\";s:8:\"rest-api\";s:6:\"plugin\";s:19:\"rest-api/plugin.php\";s:11:\"new_version\";s:10:\"2.0-beta15\";s:3:\"url\";s:39:\"https://wordpress.org/plugins/rest-api/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/plugin/rest-api.2.0-beta15.zip\";}s:24:\"json-rest-api/plugin.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:5:\"42054\";s:4:\"slug\";s:13:\"json-rest-api\";s:6:\"plugin\";s:24:\"json-rest-api/plugin.php\";s:11:\"new_version\";s:5:\"1.2.5\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/json-rest-api/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/plugin/json-rest-api.1.2.5.zip\";}}}','yes');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default'),(2,4,'_wp_attached_file','2016/06/wrong.mod_.png'),(3,4,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:566;s:6:\"height\";i:100;s:4:\"file\";s:22:\"2016/06/wrong.mod_.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"wrong.mod_-150x100.png\";s:5:\"width\";i:150;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"wrong.mod_-300x53.png\";s:5:\"width\";i:300;s:6:\"height\";i:53;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(4,5,'_wp_attached_file','2016/06/right.mod_.png'),(5,5,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:578;s:6:\"height\";i:92;s:4:\"file\";s:22:\"2016/06/right.mod_.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:21:\"right.mod_-150x92.png\";s:5:\"width\";i:150;s:6:\"height\";i:92;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:21:\"right.mod_-300x48.png\";s:5:\"width\";i:300;s:6:\"height\";i:48;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(6,6,'_form','<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit \"Send\"]</p>'),(7,6,'_mail','a:8:{s:7:\"subject\";s:33:\"Alex Zuniga Blog \"[your-subject]\"\";s:6:\"sender\";s:45:\"[your-name] <wordpress@thecloud.wpengine.com>\";s:4:\"body\";s:182:\"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Alex Zuniga Blog (http://thecloud.wpengine.com)\";s:9:\"recipient\";s:21:\"azuniga0390@gmail.com\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),(8,6,'_mail_2','a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:33:\"Alex Zuniga Blog \"[your-subject]\"\";s:6:\"sender\";s:50:\"Alex Zuniga Blog <wordpress@thecloud.wpengine.com>\";s:4:\"body\";s:124:\"Message Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Alex Zuniga Blog (http://thecloud.wpengine.com)\";s:9:\"recipient\";s:12:\"[your-email]\";s:18:\"additional_headers\";s:31:\"Reply-To: azuniga0390@gmail.com\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),(9,6,'_messages','a:8:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:22:\"The field is required.\";s:16:\"invalid_too_long\";s:22:\"The field is too long.\";s:17:\"invalid_too_short\";s:23:\"The field is too short.\";}'),(10,6,'_additional_settings',NULL),(11,6,'_locale','en_US'),(24,1,'_edit_lock','1473968139:1'),(25,1,'_edit_last','1'),(28,19,'_edit_lock','1470406326:1'),(29,19,'_edit_last','1'),(30,22,'type','oauth1'),(31,22,'key','l3yR1NsOqtQB'),(32,22,'secret','04mwX99ZsapSqb40WwkPah43svk7zYTRj7DngCQwPnkwhg4v'),(33,24,'_edit_lock','1478565024:2'),(34,24,'_edit_last','2'),(43,27,'_wp_attached_file','2016/09/blue_lantern_flash-copy.jpg'),(44,27,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:900;s:6:\"height\";i:1349;s:4:\"file\";s:35:\"2016/09/blue_lantern_flash-copy.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"blue_lantern_flash-copy-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:35:\"blue_lantern_flash-copy-200x300.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:36:\"blue_lantern_flash-copy-768x1151.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1151;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:36:\"blue_lantern_flash-copy-683x1024.jpg\";s:5:\"width\";i:683;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:35:\"blue_lantern_flash-copy-825x510.jpg\";s:5:\"width\";i:825;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),(45,2,'_edit_lock','1473965979:1'),(51,33,'_wp_attached_file','2016/11/Screen-Shot-2016-10-18-at-12.43.31-PM.png'),(52,33,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:964;s:6:\"height\";i:1200;s:4:\"file\";s:49:\"2016/11/Screen-Shot-2016-10-18-at-12.43.31-PM.png\";s:5:\"sizes\";a:9:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:49:\"Screen-Shot-2016-10-18-at-12.43.31-PM-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:49:\"Screen-Shot-2016-10-18-at-12.43.31-PM-241x300.png\";s:5:\"width\";i:241;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:49:\"Screen-Shot-2016-10-18-at-12.43.31-PM-768x956.png\";s:5:\"width\";i:768;s:6:\"height\";i:956;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:50:\"Screen-Shot-2016-10-18-at-12.43.31-PM-823x1024.png\";s:5:\"width\";i:823;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"custom\";a:4:{s:4:\"file\";s:49:\"Screen-Shot-2016-10-18-at-12.43.31-PM-281x350.png\";s:5:\"width\";i:281;s:6:\"height\";i:350;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:49:\"Screen-Shot-2016-10-18-at-12.43.31-PM-121x150.png\";s:5:\"width\";i:121;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"header\";a:4:{s:4:\"file\";s:49:\"Screen-Shot-2016-10-18-at-12.43.31-PM-964x120.png\";s:5:\"width\";i:964;s:6:\"height\";i:120;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"slider\";a:4:{s:4:\"file\";s:49:\"Screen-Shot-2016-10-18-at-12.43.31-PM-964x500.png\";s:5:\"width\";i:964;s:6:\"height\";i:500;s:9:\"mime-type\";s:9:\"image/png\";}s:16:\"parabola-columns\";a:4:{s:4:\"file\";s:49:\"Screen-Shot-2016-10-18-at-12.43.31-PM-356x278.png\";s:5:\"width\";i:356;s:6:\"height\";i:278;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),(53,34,'_edit_lock','1478565285:2'),(54,34,'_edit_last','2'),(55,34,'_wp_page_template','default'),(56,36,'_edit_last','1'),(57,36,'_edit_lock','1478791313:1');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2016-04-20 21:46:12','2016-04-20 21:46:12','\r\n<p style=\"margin-left:-.5in;text-indent:.5in\">This first line of the post is going to be indented. Edit or delete it, then start writing!another edit</p>\r\n\r\n','Hello world!','','publish','open','open','','hello-world','','','2016-09-15 19:19:08','2016-09-15 19:19:08','',0,'http://thecloud.wpengine.com/?p=1',0,'post','',1),(2,1,'2016-04-20 21:46:12','2016-04-20 21:46:12','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://thecloud.wpengine.com/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Sample Page','','publish','closed','open','','sample-page','','','2016-04-20 21:46:12','2016-04-20 21:46:12','',0,'http://thecloud.wpengine.com/?page_id=2',0,'page','',0),(4,1,'2016-06-13 14:54:24','2016-06-13 14:54:24','','wrong.mod','','inherit','open','closed','','wrong-mod','','','2016-06-13 14:54:24','2016-06-13 14:54:24','',0,'http://thecloud.wpengine.com/wp-content/uploads/2016/06/wrong.mod_.png',0,'attachment','image/png',0),(5,1,'2016-06-13 14:54:36','2016-06-13 14:54:36','','right.mod','','inherit','open','closed','','right-mod','','','2016-06-13 14:54:36','2016-06-13 14:54:36','',0,'http://thecloud.wpengine.com/wp-content/uploads/2016/06/right.mod_.png',0,'attachment','image/png',0),(6,1,'2016-07-28 19:32:33','2016-07-28 19:32:33','<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit \"Send\"]</p>\nAlex Zuniga Blog \"[your-subject]\"\n[your-name] <wordpress@thecloud.wpengine.com>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Alex Zuniga Blog (http://thecloud.wpengine.com)\nazuniga0390@gmail.com\nReply-To: [your-email]\n\n0\n0\n\nAlex Zuniga Blog \"[your-subject]\"\nAlex Zuniga Blog <wordpress@thecloud.wpengine.com>\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Alex Zuniga Blog (http://thecloud.wpengine.com)\n[your-email]\nReply-To: azuniga0390@gmail.com\n\n0\n0\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.','Contact form 1','','publish','closed','closed','','contact-form-1','','','2016-07-28 19:32:33','2016-07-28 19:32:33','',0,'http://thecloud.wpengine.com/?post_type=wpcf7_contact_form&p=6',0,'wpcf7_contact_form','',0),(19,1,'2016-08-05 14:10:05','0000-00-00 00:00:00','this is a test. Adding more text','test draft','','draft','open','open','','','','','2016-08-05 14:10:05','2016-08-05 14:10:05','',0,'http://thecloud.wpengine.com/?p=19',0,'post','',0),(22,1,'2016-08-08 14:17:39','0000-00-00 00:00:00','','','','draft','closed','closed','','','','','2016-08-08 14:17:39','0000-00-00 00:00:00','',0,'http://thecloud.wpengine.com/?post_type=json_consumer&p=22',0,'json_consumer','',0),(24,2,'2016-08-11 14:21:34','2016-08-11 14:21:34','<img class=\"alignnone size-medium wp-image-27\" src=\"http://thecloud.wpengine.com/wp-content/uploads/2016/09/blue_lantern_flash-copy-200x300.jpg\" alt=\"blue_lantern_flash copy\" width=\"200\" height=\"300\" />\r\n\r\n&nbsp;\r\n\r\nThis is an epic pic i took of the flash. IDK what my ISO was set at\r\n\r\n&nbsp;','This is my first post','','publish','open','open','','app-post','','','2016-11-08 00:32:11','2016-11-08 00:32:11','',0,'http://thecloud.wpengine.com/?p=24',0,'post','',0),(27,1,'2016-09-01 14:01:17','2016-09-01 14:01:17','','blue_lantern_flash copy','','inherit','open','closed','','blue_lantern_flash-copy','','','2016-11-08 00:31:46','2016-11-08 00:31:46','',24,'http://thecloud.wpengine.com/wp-content/uploads/2016/09/blue_lantern_flash-copy.jpg',0,'attachment','image/jpeg',0),(31,2,'2016-11-08 00:31:31','2016-11-08 00:31:31','I already said that','This is my first post','','inherit','closed','closed','','24-revision-v1','','','2016-11-08 00:31:31','2016-11-08 00:31:31','',24,'http://thecloud.wpengine.com/?p=31',0,'revision','',0),(32,2,'2016-11-08 00:32:11','2016-11-08 00:32:11','<img class=\"alignnone size-medium wp-image-27\" src=\"http://thecloud.wpengine.com/wp-content/uploads/2016/09/blue_lantern_flash-copy-200x300.jpg\" alt=\"blue_lantern_flash copy\" width=\"200\" height=\"300\" />\r\n\r\n&nbsp;\r\n\r\nThis is an epic pic i took of the flash. IDK what my ISO was set at\r\n\r\n&nbsp;','This is my first post','','inherit','closed','closed','','24-revision-v1','','','2016-11-08 00:32:11','2016-11-08 00:32:11','',24,'http://thecloud.wpengine.com/?p=32',0,'revision','',0),(33,2,'2016-11-08 00:33:17','2016-11-08 00:33:17','','screen-shot-2016-10-18-at-12-43-31-pm','','inherit','open','closed','','screen-shot-2016-10-18-at-12-43-31-pm','','','2016-11-08 00:33:17','2016-11-08 00:33:17','',0,'http://thecloud.wpengine.com/wp-content/uploads/2016/11/Screen-Shot-2016-10-18-at-12.43.31-PM.png',0,'attachment','image/png',0),(34,2,'2016-11-08 00:34:18','2016-11-08 00:34:18','This is a stopy about how i got started\r\n\r\n210-730-1575 holaa','About','','publish','closed','closed','','about','','','2016-11-08 00:34:45','2016-11-08 00:34:45','',0,'http://thecloud.wpengine.com/?page_id=34',0,'page','',0),(35,2,'2016-11-08 00:34:18','2016-11-08 00:34:18','This is a stopy about how i got started\r\n\r\n210-730-1575 holaa','About','','inherit','closed','closed','','34-revision-v1','','','2016-11-08 00:34:18','2016-11-08 00:34:18','',34,'http://thecloud.wpengine.com/?p=35',0,'revision','',0),(36,1,'2016-11-10 15:24:14','2016-11-10 15:24:14','<iframe src=\"https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2FSaddoge%2Fvideos%2F1833885110161176%2F&show_text=0&width=560\" width=\"560\" height=\"315\" style=\"border:none;overflow:hidden\" scrolling=\"no\" frameborder=\"0\" allowTransparency=\"true\" allowFullScreen=\"true\"></iframe>','Do the dog','','publish','open','open','','do-the-dog','','','2016-11-10 15:24:14','2016-11-10 15:24:14','',0,'http://thecloud.wpengine.com/?p=36',0,'post','',0),(37,1,'2016-11-10 15:23:08','2016-11-10 15:23:08','<iframe src=\"https://www.facebook.com/plugins/video.php?href=https%3A%2F%2Fwww.facebook.com%2FSaddoge%2Fvideos%2F1833885110161176%2F&show_text=0&width=560\" width=\"560\" height=\"315\" style=\"border:none;overflow:hidden\" scrolling=\"no\" frameborder=\"0\" allowTransparency=\"true\" allowFullScreen=\"true\"></iframe>','Do the dog','','inherit','closed','closed','','36-revision-v1','','','2016-11-10 15:23:08','2016-11-10 15:23:08','',36,'http://thecloud.wpengine.com/36-revision-v1/',0,'revision','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1,1,0),(19,1,0),(24,1,0),(36,1,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,3);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','wpengine'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description','This is the \"wpengine\" admin user that our staff uses to gain access to your admin area to provide support and troubleshooting. It can only be accessed by a button in our secure log that auto generates a password and dumps that password after the staff member has logged in. We have taken extreme measures to ensure that our own user is not going to be misused to harm any of our clients sites.'),(5,1,'rich_editing','true'),(6,1,'comment_shortcuts','false'),(7,1,'admin_color','fresh'),(8,1,'use_ssl','0'),(9,1,'show_admin_bar_front','true'),(10,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(11,1,'wp_user_level','10'),(12,1,'dismissed_wp_pointers',''),(13,1,'show_welcome_panel','1'),(14,2,'nickname','thecloud'),(15,2,'first_name',''),(16,2,'last_name',''),(17,2,'description',''),(18,2,'rich_editing','true'),(19,2,'comment_shortcuts','false'),(20,2,'admin_color','fresh'),(21,2,'use_ssl','0'),(22,2,'show_admin_bar_front','true'),(23,2,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(24,2,'wp_user_level','10'),(25,1,'session_tokens','a:2:{s:64:\"7002738669a3654b1e76d620d4073bad0e6076e44e1380c29f3a6a9537e3acaf\";a:4:{s:10:\"expiration\";i:1482352460;s:2:\"ip\";s:15:\"192.171.117.234\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.98 Safari/537.36\";s:5:\"login\";i:1482179660;}s:64:\"d8520f97be3d520c5b363ca9c45390954ed69d5b35ad0a74fa6091c731466e47\";a:4:{s:10:\"expiration\";i:1482352460;s:2:\"ip\";s:15:\"192.171.117.234\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.98 Safari/537.36\";s:5:\"login\";i:1482179660;}}'),(26,1,'wp_dashboard_quick_press_last_post_id','38'),(28,2,'wp_dashboard_quick_press_last_post_id','42'),(29,1,'wp_user-settings','editor=html&hidetb=1'),(30,1,'wp_user-settings-time','1473967143'),(31,2,'session_tokens','a:1:{s:64:\"159892c76e62eee86c5d0948a89bcc8d7d4bc5abef75250b3d80e954ffb03550\";a:4:{s:10:\"expiration\";i:1479935800;s:2:\"ip\";s:15:\"192.171.117.234\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36\";s:5:\"login\";i:1479763000;}}'),(32,2,'wp_user-settings','libraryContent=browse'),(33,2,'wp_user-settings-time','1478565127');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'wpengine','$P$Bke.ad0JkHfRGutfULfE4LOGJ2Vnrq1','wpengine','bitbucket@wpengine.com','http://wpengine.com','2016-04-20 21:46:12','',0,'wpengine'),(2,'thecloud','$P$BKIM39KU0PDa.WE.nMYgfwDvYemtl30','thecloud','azuniga0390@gmail.com','http://thecloud.wpengine.com','2016-06-03 15:05:47','',0,'thecloud');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wpe_sandboxes`
--

DROP TABLE IF EXISTS `wp_wpe_sandboxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_wpe_sandboxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wpe_sandboxes`
--

LOCK TABLES `wp_wpe_sandboxes` WRITE;
/*!40000 ALTER TABLE `wp_wpe_sandboxes` DISABLE KEYS */;
INSERT INTO `wp_wpe_sandboxes` VALUES (1,'MDEtb2Vybnh1YnpyLXBiYXMuY3Vj','pending'),(2,'MDItb2Vybnh1YnpyLXFvLmN1Yw==','pending'),(3,'MDMtamZicS1jeWh0dmEuY3Vj','pending'),(4,'MDQtc3Z5cmNyZXpmLmN1Yw==','pending'),(5,'MDUtemwtc3ZlZmctb2VybnguY3Vj','complete');
/*!40000 ALTER TABLE `wp_wpe_sandboxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'wp_thecloud'
--

--
-- Dumping routines for database 'wp_thecloud'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
