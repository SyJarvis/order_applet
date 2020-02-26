-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: food_db
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `app_access_log`
--

DROP TABLE IF EXISTS `app_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_access_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT 'uid',
  `referer_url` varchar(255) NOT NULL DEFAULT '' COMMENT '当前访问的refer',
  `target_url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问的url',
  `query_params` text NOT NULL COMMENT 'get和post参数',
  `ua` varchar(255) NOT NULL DEFAULT '' COMMENT '访问ua',
  `ip` varchar(32) NOT NULL DEFAULT '' COMMENT '访问ip',
  `note` varchar(1000) NOT NULL DEFAULT '' COMMENT 'json格式备注字段',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COMMENT='用户访问记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_access_log`
--

LOCK TABLES `app_access_log` WRITE;
/*!40000 ALTER TABLE `app_access_log` DISABLE KEYS */;
INSERT INTO `app_access_log` VALUES (1,1,'','http://127.0.0.1:5000/account/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-08 07:05:54'),(2,1,'http://127.0.0.1:5000/account/index','http://127.0.0.1:5000/account/set?id=2','{\"id\": \"2\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-08 07:05:59'),(3,1,'http://127.0.0.1:5000/account/index','http://127.0.0.1:5000/account/set','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-08 07:06:03'),(4,1,'http://127.0.0.1:5000/account/index','http://127.0.0.1:5000/','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-08 07:06:06'),(5,1,'http://127.0.0.1:5000/','http://127.0.0.1:5000/finance/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-08 07:06:33'),(6,1,'http://127.0.0.1:5000/','http://127.0.0.1:5000/stat/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-08 07:06:41'),(7,1,'','http://127.0.0.1:5000/register.html','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-08 07:11:50'),(8,1,'','http://127.0.0.1:5000/','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-08 07:11:53'),(9,1,'http://127.0.0.1:5000/','http://127.0.0.1:5000/account/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-08 07:11:55'),(10,1,'http://127.0.0.1:5000/account/index','http://127.0.0.1:5000/account/info?id=2','{\"id\": \"2\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-08 07:11:57'),(11,1,'','http://127.0.0.1:5000/account/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-08 07:17:09'),(12,1,'','http://127.0.0.1:5000/account/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-08 07:18:17'),(13,1,'http://127.0.0.1:5000/account/index','http://127.0.0.1:5000/account/info?id=2','{\"id\": \"2\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-08 07:18:19'),(14,0,'','http://192.168.153.148:5000/','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','192.168.153.148','','2020-02-09 03:50:54'),(15,0,'','http://192.168.153.148:5000/user/login','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','192.168.153.148','','2020-02-09 03:50:55'),(16,0,'','http://192.168.153.148:5000/api/','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','192.168.153.148','','2020-02-09 03:53:19'),(17,0,'','http://192.168.153.148:5000/user/login','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','192.168.153.148','','2020-02-09 03:53:19'),(18,0,'','http://192.168.153.148:5000/api','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','192.168.153.148','','2020-02-09 03:56:24'),(19,0,'','http://192.168.153.148:5000/api/','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','192.168.153.148','','2020-02-09 03:56:24'),(20,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 05:24:37'),(21,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 05:26:59'),(22,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 05:27:10'),(23,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 05:27:12'),(24,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 05:30:05'),(25,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 05:31:43'),(26,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 05:31:57'),(27,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 05:36:49'),(28,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 05:37:18'),(29,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 05:39:24'),(30,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 05:39:46'),(31,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 05:47:03'),(32,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 06:06:18'),(33,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 06:07:01'),(34,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 06:24:41'),(35,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 06:26:28'),(36,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 06:26:33'),(37,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 06:32:51'),(38,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 06:34:44'),(39,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 06:37:34'),(40,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 12:11:06'),(41,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 12:11:52'),(42,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 12:23:02'),(43,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 12:24:27'),(44,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 12:24:56'),(45,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 12:25:24'),(46,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 12:26:04'),(47,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 12:26:23'),(48,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 12:26:35'),(49,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 12:26:52'),(50,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 12:26:54'),(51,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 12:26:57'),(52,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 13:05:33'),(53,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.148:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-09 13:06:39'),(54,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:02:58'),(55,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:05:23'),(56,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:06:54'),(57,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:09:20'),(58,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:09:48'),(59,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:10:05'),(60,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:10:41'),(61,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:11:46'),(62,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:11:59'),(63,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:12:25'),(64,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:12:47'),(65,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:13:01'),(66,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:13:49'),(67,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:13:59'),(68,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:18:30'),(69,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:19:02'),(70,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:19:42'),(71,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:21:32'),(72,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:21:36'),(73,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:23:35'),(74,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:25:17'),(75,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/login','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:25:23'),(76,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:29:26'),(77,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:29:53'),(78,0,'https://servicewechat.com/wx47b5911f64e0c8b1/devtools/page-frame.html','http://192.168.153.149:5000/api/member/check-reg','{}','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1 wechatdevtools/1.02.1911180 MicroMessenger/7.0.4 Language/zh_CN webview/','192.168.153.1','','2020-02-10 02:48:24'),(79,0,'','http://192.168.153.150:5000/user/','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','192.168.153.150','','2020-02-10 12:37:45'),(80,0,'','http://192.168.153.150:5000/user/login','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','192.168.153.150','','2020-02-10 12:37:52'),(81,0,'http://192.168.153.150:5000/user/login','http://192.168.153.150:5000/user/login','{\"login_name\": \"54php.cn\", \"login_pwd\": \"12345678\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','192.168.153.150','','2020-02-10 12:38:03'),(82,1,'http://192.168.153.150:5000/user/login','http://192.168.153.150:5000/','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','192.168.153.150','','2020-02-10 12:38:07'),(83,1,'http://192.168.153.150:5000/','http://192.168.153.150:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','192.168.153.150','','2020-02-10 12:38:25'),(84,1,'','http://192.168.153.150:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','192.168.153.150','','2020-02-10 13:06:25'),(85,1,'','http://192.168.153.150:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','192.168.153.150','','2020-02-10 13:14:40'),(86,1,'','http://192.168.153.150:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','192.168.153.150','','2020-02-10 13:20:12'),(87,1,'','http://192.168.153.150:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','192.168.153.150','','2020-02-10 13:20:32'),(88,1,'','http://192.168.153.150:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','192.168.153.150','','2020-02-10 13:31:05'),(89,1,'','http://127.0.0.1:5000/','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:01:33'),(90,1,'http://127.0.0.1:5000/','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:01:37'),(91,1,'','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:02:09'),(92,1,'','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:04:44'),(93,1,'','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:04:52'),(94,1,'','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:09:59'),(95,1,'','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:10:55'),(96,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/index?status=0&mix_kw=','{\"status\": \"0\", \"mix_kw\": \"\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:11:09'),(97,1,'http://127.0.0.1:5000/member/index?status=0&mix_kw=','http://127.0.0.1:5000/member/index?status=1&mix_kw=','{\"status\": \"1\", \"mix_kw\": \"\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:11:12'),(98,1,'','http://127.0.0.1:5000/member/index?status=1&mix_kw=','{\"status\": \"1\", \"mix_kw\": \"\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:14:10'),(99,1,'','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:14:15'),(100,1,'','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:14:18'),(101,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/index?status=0&mix_kw=','{\"status\": \"0\", \"mix_kw\": \"\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:14:21'),(102,1,'http://127.0.0.1:5000/member/index?status=0&mix_kw=','http://127.0.0.1:5000/member/index?status=1&mix_kw=','{\"status\": \"1\", \"mix_kw\": \"\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:14:24'),(103,1,'http://127.0.0.1:5000/member/index?status=1&mix_kw=','http://127.0.0.1:5000/member/index?status=1&mix_kw=jarvis','{\"status\": \"1\", \"mix_kw\": \"jarvis\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:16:21'),(104,1,'http://127.0.0.1:5000/member/index?status=1&mix_kw=jarvis','http://127.0.0.1:5000/member/index?status=1&mix_kw=上邪','{\"status\": \"1\", \"mix_kw\": \"\\u4e0a\\u90aa\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:16:28'),(105,1,'http://127.0.0.1:5000/member/index?status=1&mix_kw=%E4%B8%8A%E9%82%AA','http://127.0.0.1:5000/member/index?status=1&mix_kw=上','{\"status\": \"1\", \"mix_kw\": \"\\u4e0a\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:16:34'),(106,1,'http://127.0.0.1:5000/member/index?status=1&mix_kw=%E4%B8%8A','http://127.0.0.1:5000/member/index?status=1&mix_kw=邪','{\"status\": \"1\", \"mix_kw\": \"\\u90aa\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:16:50'),(107,1,'','http://127.0.0.1:5000/member/index?status=1&mix_kw=邪','{\"status\": \"1\", \"mix_kw\": \"\\u90aa\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:18:53'),(108,1,'http://127.0.0.1:5000/member/index?status=1&mix_kw=%E9%82%AA','http://127.0.0.1:5000/member/index?status=1&mix_kw=上邪','{\"status\": \"1\", \"mix_kw\": \"\\u4e0a\\u90aa\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:19:00'),(109,1,'','http://127.0.0.1:5000/member/index?status=1&mix_kw=上邪','{\"status\": \"1\", \"mix_kw\": \"\\u4e0a\\u90aa\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:41:58'),(110,1,'http://127.0.0.1:5000/member/index?status=1&mix_kw=%E4%B8%8A%E9%82%AA','http://127.0.0.1:5000/member/info?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:42:00'),(111,1,'http://127.0.0.1:5000/member/info?id=5','http://127.0.0.1:5000/member/set?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-11 03:42:37'),(112,1,'','http://127.0.0.1:5000/member/set?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 05:57:19'),(113,1,'','http://127.0.0.1:5000/member/set?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:12:28'),(114,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/set','{\"nickname\": \"\\u4e0a\\u90aa\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:12:31'),(115,1,'','http://127.0.0.1:5000/member/set?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:21:06'),(116,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/set','{\"nickname\": \"\\u4e0a\\u90aa\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:21:07'),(117,1,'','http://127.0.0.1:5000/member/set?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:21:44'),(118,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/set','{\"nickname\": \"\\u4e0a\\u90aa\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:21:46'),(119,1,'','http://127.0.0.1:5000/member/set?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:22:00'),(120,1,'','http://127.0.0.1:5000/member/set?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:22:02'),(121,1,'','http://127.0.0.1:5000/member/set?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:22:19'),(122,1,'','http://127.0.0.1:5000/member/set?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:22:21'),(123,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/set','{\"nickname\": \"\\u4e0a\\u90aa\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:22:23'),(124,1,'','http://127.0.0.1:5000/member/set?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:22:49'),(125,1,'','http://127.0.0.1:5000/member/set?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:24:02'),(126,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/set','{\"nickname\": \"\\u4e0a\\u90aa\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:24:03'),(127,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/comment','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:25:15'),(128,1,'http://127.0.0.1:5000/member/comment','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:25:16'),(129,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/comment','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:25:19'),(130,1,'http://127.0.0.1:5000/member/comment','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:25:20'),(131,1,'','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:25:22'),(132,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/info?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:25:25'),(133,1,'http://127.0.0.1:5000/member/info?id=5','http://127.0.0.1:5000/member/set?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:25:26'),(134,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/set','{\"nickname\": \"\\u4e0a\\u90aa\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:25:29'),(135,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/set','{\"nickname\": \"\\u4e0a\\u90aa\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:25:30'),(136,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/set','{\"nickname\": \"\\u4e0a\\u90aa\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:25:31'),(137,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/set','{\"nickname\": \"\\u4e0a\\u90aa\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:25:31'),(138,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/set','{\"nickname\": \"\\u4e0a\\u90aa\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:25:31'),(139,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/set','{\"nickname\": \"\\u4e0a\\u90aa\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:25:32'),(140,1,'','http://127.0.0.1:5000/member/info?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:29:06'),(141,1,'','http://127.0.0.1:5000/member/info?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:29:10'),(142,1,'http://127.0.0.1:5000/member/info?id=5','http://127.0.0.1:5000/member/set?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:29:12'),(143,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/set','{\"nickname\": \"\\u4e0a\\u90aa111\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:29:18'),(144,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/set','{\"nickname\": \"\\u4e0a\\u90aa111\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:29:21'),(145,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/set','{\"nickname\": \"\\u4e0a\\u90aa111\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:29:24'),(146,1,'','http://127.0.0.1:5000/member/set?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:29:46'),(147,1,'','http://127.0.0.1:5000/','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:29:51'),(148,1,'http://127.0.0.1:5000/','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:29:54'),(149,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/info?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:29:56'),(150,1,'http://127.0.0.1:5000/member/info?id=5','http://127.0.0.1:5000/member/set?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:29:58'),(151,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/set','{\"nickname\": \"\\u4e0a\\u90aa111\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:29:59'),(152,1,'http://127.0.0.1:5000/member/set?id=5','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:30:01'),(153,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/account/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:30:23'),(154,1,'http://127.0.0.1:5000/account/index','http://127.0.0.1:5000/account/ops','{\"act\": \"remove\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:30:46'),(155,1,'','http://127.0.0.1:5000/account/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:33:39'),(156,1,'http://127.0.0.1:5000/account/index','http://127.0.0.1:5000/finance/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:33:41'),(157,1,'http://127.0.0.1:5000/account/index','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:33:44'),(158,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/account/ops','{\"act\": \"remove\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:33:47'),(159,1,'','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:34:20'),(160,1,'','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:34:20'),(161,0,'','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:34:35'),(162,0,'','http://127.0.0.1:5000/user/login','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:34:35'),(163,0,'http://127.0.0.1:5000/user/login','http://127.0.0.1:5000/user/login','{\"login_name\": \"54php.cn\", \"login_pwd\": \"12345678\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:34:40'),(164,1,'http://127.0.0.1:5000/user/login','http://127.0.0.1:5000/','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:34:42'),(165,1,'http://127.0.0.1:5000/','http://127.0.0.1:5000/account/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:34:44'),(166,1,'http://127.0.0.1:5000/account/index','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:34:44'),(167,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/ops','{\"act\": \"remove\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:34:48'),(168,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/finance/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:34:57'),(169,1,'','http://127.0.0.1:5000/finance/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:39:36'),(170,1,'http://127.0.0.1:5000/finance/index','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:41:58'),(171,1,'','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:42:11'),(172,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/ops','{\"act\": \"remove\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:42:17'),(173,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/finance/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:48:54'),(174,1,'','http://127.0.0.1:5000/finance/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:52:12'),(175,1,'http://127.0.0.1:5000/finance/index','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:52:13'),(176,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/ops','{\"act\": \"remove\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:52:17'),(177,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:52:18'),(178,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/ops','{\"act\": \"recover\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:52:22'),(179,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:52:23'),(180,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/set?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:52:29'),(181,1,'','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:53:52'),(182,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/ops','{\"act\": \"remove\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:53:55'),(183,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:53:56'),(184,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/info?id=5','{\"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:53:58'),(185,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/ops','{\"act\": \"recover\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:54:02'),(186,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:54:03'),(187,1,'','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:54:26'),(188,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/ops','{\"act\": \"remove\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:54:29'),(189,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:54:30'),(190,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/ops','{\"act\": \"recover\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:54:47'),(191,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:54:48'),(192,0,'','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:55:05'),(193,0,'','http://127.0.0.1:5000/user/login','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:55:05'),(194,0,'http://127.0.0.1:5000/user/login','http://127.0.0.1:5000/user/login','{\"login_name\": \"54php.cn\", \"login_pwd\": \"12345678\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:55:10'),(195,1,'http://127.0.0.1:5000/user/login','http://127.0.0.1:5000/','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:55:12'),(196,1,'http://127.0.0.1:5000/','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:55:13'),(197,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/ops','{\"act\": \"remove\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:55:16'),(198,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:55:17'),(199,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/ops','{\"act\": \"recover\", \"id\": \"5\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:55:33'),(200,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:55:35'),(201,1,'','http://127.0.0.1:5000/member/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:57:15'),(202,1,'http://127.0.0.1:5000/member/index','http://127.0.0.1:5000/account/index','{}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:57:27'),(203,1,'http://127.0.0.1:5000/account/index','http://127.0.0.1:5000/account/ops','{\"act\": \"remove\"}','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','127.0.0.1','','2020-02-12 06:57:31');
/*!40000 ALTER TABLE `app_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_error_log`
--

DROP TABLE IF EXISTS `app_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_error_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `referer_url` varchar(255) NOT NULL DEFAULT '' COMMENT '当前访问的refer',
  `target_url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问的url',
  `query_params` text NOT NULL COMMENT 'get和post参数',
  `content` longtext NOT NULL COMMENT '日志内容',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='app错误日表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_error_log`
--

LOCK TABLES `app_error_log` WRITE;
/*!40000 ALTER TABLE `app_error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类id',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '书籍名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售卖金额',
  `main_image` varchar(100) NOT NULL DEFAULT '' COMMENT '主图',
  `summary` varchar(10000) NOT NULL DEFAULT '' COMMENT '描述',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
  `tags` varchar(200) NOT NULL DEFAULT '' COMMENT 'tag关键字，以","连接',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：有效 0：无效',
  `month_count` int(11) NOT NULL DEFAULT '0' COMMENT '月销售数量',
  `total_count` int(11) NOT NULL DEFAULT '0' COMMENT '总销售量',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '总浏览次数',
  `comment_count` int(11) NOT NULL DEFAULT '0' COMMENT '总评论量',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='食品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,1,'黄焖鸡米饭',36.00,'20200220/a954a75c37ec47f8a139dfefdf0b064e.jpg','<p><span style=\"font-family: 宋体, SimSun; color: rgb(227, 108, 9);\"><em><span style=\"font-family: 宋体, SimSun; font-size: 18px;\">店家推荐，非常好吃，价格美丽。</span></em><em><span style=\"font-family: 宋体, SimSun; font-size: 18px;\"></span></em></span></p>',50,'黄焖鸡,好吃,店家推荐',1,0,0,0,0,'2020-02-20 06:07:58','2020-02-20 02:33:36'),(2,1,'红烧肉',54.00,'20200220/6bfb0f264ea44b14a4f358d1f1110b33.jpg','<p>正宗红烧肉</p>',32,'红烧肉',1,0,0,0,0,'2020-02-20 06:14:19','2020-02-20 06:14:19');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_cat`
--

DROP TABLE IF EXISTS `food_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_cat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '类别名称',
  `weight` tinyint(4) NOT NULL DEFAULT '1' COMMENT '权重',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：有效 0：无效',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='食品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_cat`
--

LOCK TABLES `food_cat` WRITE;
/*!40000 ALTER TABLE `food_cat` DISABLE KEYS */;
INSERT INTO `food_cat` VALUES (1,'东北菜',1,1,'2020-02-19 06:38:34','2020-02-19 05:58:50'),(2,'粤菜',2,1,'2020-02-20 06:21:49','2020-02-20 06:21:49'),(3,'湘菜',3,1,'2020-02-20 06:22:07','2020-02-20 06:22:07');
/*!40000 ALTER TABLE `food_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_sale_change_log`
--

DROP TABLE IF EXISTS `food_sale_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_sale_change_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `food_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `quantity` int(11) NOT NULL DEFAULT '0' COMMENT '售卖数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售卖金额',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '售卖时间',
  PRIMARY KEY (`id`),
  KEY `idx_food_id_id` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品销售情况';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_sale_change_log`
--

LOCK TABLES `food_sale_change_log` WRITE;
/*!40000 ALTER TABLE `food_sale_change_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_sale_change_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_stock_change_log`
--

DROP TABLE IF EXISTS `food_stock_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_stock_change_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `food_id` int(11) NOT NULL COMMENT '商品id',
  `unit` int(11) NOT NULL DEFAULT '0' COMMENT '变更多少',
  `total_stock` int(11) NOT NULL DEFAULT '0' COMMENT '变更之后总量',
  `note` varchar(100) NOT NULL DEFAULT '' COMMENT '备注字段',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_food_id` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='数据库存变更表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_stock_change_log`
--

LOCK TABLES `food_stock_change_log` WRITE;
/*!40000 ALTER TABLE `food_stock_change_log` DISABLE KEYS */;
INSERT INTO `food_stock_change_log` VALUES (1,1,50,50,'','2020-02-20 10:33:36'),(2,1,0,50,'','2020-02-20 10:49:45'),(3,1,0,50,'','2020-02-20 14:07:58'),(4,2,32,32,'','2020-02-20 14:14:20');
/*!40000 ALTER TABLE `food_stock_change_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file_key` varchar(60) NOT NULL DEFAULT '' COMMENT '文件名',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'20200220/4cea59a56d754083a2418d926b085f50.png','2020-02-19 17:01:35'),(2,'20200220/9b61a7967de3466ebc1a776ac7a870bb.png','2020-02-19 17:20:19'),(3,'20200220/1f9eee218d504606adb76238537d960c.png','2020-02-20 01:13:59'),(4,'20200220/10b67b6858a1463abe6fa01163363a5e.png','2020-02-20 01:18:02'),(5,'20200220/025ef6117e9f49ee86fbc30d085383f7.png','2020-02-20 01:18:09'),(6,'20200220/8fc4efc276f34f47b4ea04ab38eda2b3.png','2020-02-20 01:18:14'),(7,'20200220/f991daf9df634ac9b6e093b68a99e9b1.jpg','2020-02-20 02:32:36'),(8,'20200220/a954a75c37ec47f8a139dfefdf0b064e.jpg','2020-02-20 02:49:04'),(9,'20200220/a9c9088610f94033a1a94e4df20e39e0.jpg','2020-02-20 03:41:10'),(10,'20200220/6bfb0f264ea44b14a4f358d1f1110b33.jpg','2020-02-20 06:08:57'),(11,'20200220/a579d1ec78db433bbb5e50eef65fdfc6.jpg','2020-02-20 07:34:35');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '会员名',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '会员手机号码',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别 1：男 2：女',
  `avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '会员头像',
  `salt` varchar(32) NOT NULL DEFAULT '' COMMENT '随机salt',
  `reg_ip` varchar(100) NOT NULL DEFAULT '' COMMENT '注册ip',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：有效 0：无效',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (5,'上邪','',1,'https://wx.qlogo.cn/mmopen/vi_32/Ntu9fwwtR57BELQ0wzT4Gia1pIAC82pwqSOoppt0ps6B9PIuW9aqVj9zYLofAAbZJqUb5nnS6Z15IFn7QwFYaHQ/132','crrKKgvirNRGZ6WX','',1,'2020-02-12 06:55:33','2020-02-10 02:25:23');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_address`
--

DROP TABLE IF EXISTS `member_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `nickname` varchar(20) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '收货人手机号码',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省id',
  `province_str` varchar(50) NOT NULL DEFAULT '' COMMENT '省名称',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市id',
  `city_str` varchar(50) NOT NULL DEFAULT '' COMMENT '市名称',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域id',
  `area_str` varchar(50) NOT NULL DEFAULT '' COMMENT '区域名称',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地址',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1：有效 0：无效',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认地址',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_member_id_status` (`member_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员收货地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_address`
--

LOCK TABLES `member_address` WRITE;
/*!40000 ALTER TABLE `member_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_cart`
--

DROP TABLE IF EXISTS `member_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '会员id',
  `food_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `quantity` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_cart`
--

LOCK TABLES `member_cart` WRITE;
/*!40000 ALTER TABLE `member_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_comments`
--

DROP TABLE IF EXISTS `member_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `food_ids` varchar(200) NOT NULL DEFAULT '' COMMENT '商品ids',
  `pay_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评分',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '评论内容',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_comments`
--

LOCK TABLES `member_comments` WRITE;
/*!40000 ALTER TABLE `member_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_token`
--

DROP TABLE IF EXISTS `oauth_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `access_token` varchar(600) NOT NULL DEFAULT '',
  `expired_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_expired_time` (`expired_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信的access_token 用户调用其他接口的';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token`
--

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_member_bind`
--

DROP TABLE IF EXISTS `oauth_member_bind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_member_bind` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `client_type` varchar(20) NOT NULL DEFAULT '' COMMENT '客户端来源类型。qq,weibo,weixin',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '类型 type 1:wechat ',
  `openid` varchar(80) NOT NULL DEFAULT '' COMMENT '第三方id',
  `unionid` varchar(100) NOT NULL DEFAULT '',
  `extra` text NOT NULL COMMENT '额外字段',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_type_openid` (`type`,`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='第三方登录绑定关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_member_bind`
--

LOCK TABLES `oauth_member_bind` WRITE;
/*!40000 ALTER TABLE `oauth_member_bind` DISABLE KEYS */;
INSERT INTO `oauth_member_bind` VALUES (5,5,'',1,'oesTl5ZSMGOOY6lvlZijsxmPtowU','','','2020-02-10 02:25:23','2020-02-10 02:25:23');
/*!40000 ALTER TABLE `oauth_member_bind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_order`
--

DROP TABLE IF EXISTS `pay_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(40) NOT NULL DEFAULT '' COMMENT '随机订单号',
  `member_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单应付金额',
  `yun_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费金额',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单实付金额',
  `pay_sn` varchar(128) NOT NULL DEFAULT '' COMMENT '第三方流水号',
  `prepay_id` varchar(128) NOT NULL DEFAULT '' COMMENT '第三方预付id',
  `note` text NOT NULL COMMENT '备注信息',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1：支付完成 0 无效 -1 申请退款 -2 退款中 -9 退款成功  -8 待支付  -7 完成支付待确认',
  `express_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '快递状态，-8 待支付 -7 已付款待发货 1：确认收货 0：失败',
  `express_address_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递地址id',
  `express_info` varchar(1000) NOT NULL DEFAULT '' COMMENT '快递信息',
  `comment_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评论状态',
  `pay_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '付款到账时间',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_sn` (`order_sn`),
  KEY `idx_member_id_status` (`member_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='在线购买订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_order`
--

LOCK TABLES `pay_order` WRITE;
/*!40000 ALTER TABLE `pay_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_order_callback_data`
--

DROP TABLE IF EXISTS `pay_order_callback_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_order_callback_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '支付订单id',
  `pay_data` text NOT NULL COMMENT '支付回调信息',
  `refund_data` text NOT NULL COMMENT '退款回调信息',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pay_order_id` (`pay_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_order_callback_data`
--

LOCK TABLES `pay_order_callback_data` WRITE;
/*!40000 ALTER TABLE `pay_order_callback_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_order_callback_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_order_item`
--

DROP TABLE IF EXISTS `pay_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_order_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pay_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `member_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `quantity` int(11) NOT NULL DEFAULT '1' COMMENT '购买数量 默认1份',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价格，售价 * 数量',
  `food_id` int(11) NOT NULL DEFAULT '0' COMMENT '美食表id',
  `note` text NOT NULL COMMENT '备注信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1：成功 0 失败',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `id_order_id` (`pay_order_id`),
  KEY `idx_food_id` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_order_item`
--

LOCK TABLES `pay_order_item` WRITE;
/*!40000 ALTER TABLE `pay_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_list`
--

DROP TABLE IF EXISTS `queue_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `queue_name` varchar(30) NOT NULL DEFAULT '' COMMENT '队列名字',
  `data` varchar(500) NOT NULL DEFAULT '' COMMENT '队列数据',
  `status` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '状态 -1 待处理 1 已处理',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='事件队列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_list`
--

LOCK TABLES `queue_list` WRITE;
/*!40000 ALTER TABLE `queue_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_daily_food`
--

DROP TABLE IF EXISTS `stat_daily_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_daily_food` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `food_id` int(11) NOT NULL DEFAULT '0' COMMENT '菜品id',
  `total_count` int(11) NOT NULL DEFAULT '0' COMMENT '售卖总数量',
  `total_pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总售卖金额',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `date_food_id` (`date`,`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='书籍售卖日统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_daily_food`
--

LOCK TABLES `stat_daily_food` WRITE;
/*!40000 ALTER TABLE `stat_daily_food` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_daily_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_daily_member`
--

DROP TABLE IF EXISTS `stat_daily_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_daily_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL COMMENT '日期',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `total_shared_count` int(11) NOT NULL DEFAULT '0' COMMENT '当日分享总次数',
  `total_pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当日付款总金额',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_date_member_id` (`date`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员日统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_daily_member`
--

LOCK TABLES `stat_daily_member` WRITE;
/*!40000 ALTER TABLE `stat_daily_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_daily_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_daily_site`
--

DROP TABLE IF EXISTS `stat_daily_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_daily_site` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL COMMENT '日期',
  `total_pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当日应收总金额',
  `total_member_count` int(11) NOT NULL COMMENT '会员总数',
  `total_new_member_count` int(11) NOT NULL COMMENT '当日新增会员数',
  `total_order_count` int(11) NOT NULL COMMENT '当日订单数',
  `total_shared_count` int(11) NOT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`id`),
  KEY `idx_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='全站日统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_daily_site`
--

LOCK TABLES `stat_daily_site` WRITE;
/*!40000 ALTER TABLE `stat_daily_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_daily_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户uid',
  `nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：男 2：女 0：没填写',
  `avatar` varchar(64) NOT NULL DEFAULT '' COMMENT '头像',
  `login_name` varchar(20) NOT NULL DEFAULT '' COMMENT '登录用户名',
  `login_pwd` varchar(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `login_salt` varchar(32) NOT NULL DEFAULT '' COMMENT '登录密码的随机加密秘钥',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：有效 0：无效',
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='用户表（管理员）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'syjarvis','11012345679','1755115828@qq.com',1,'','54php.cn','e47183bc854dba564945cd91d555579b','zrk0220',1,'2020-03-14 22:08:48','2020-03-14 22:08:48'),(2,'jarvis','13824555872','1755115828@qq.com',0,'','syjarvis','cb47a4a50c3d45baeb0bb9a2895a2ee9','in1FKTRzcMR8SfyL',1,'2020-02-08 02:33:16','2020-02-07 14:24:23'),(3,'jarvis','18219059685','1755115828@qq.com',0,'','jarvis','41f74e986a52dcd6df27e56e320233d6','o',0,'2020-02-15 09:53:43','2020-02-15 09:53:43'),(4,'jarvis','18219059685','1755115828@qq.com',0,'','jarvis1','','u',0,'2020-02-15 10:53:12','2020-02-15 10:53:12'),(5,'jarvis','18219059685','1755115828@qq.com',0,'','admin','','N',0,'2020-02-16 08:34:27','2020-02-15 10:55:25');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_share_history`
--

DROP TABLE IF EXISTS `wx_share_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wx_share_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `share_url` varchar(200) NOT NULL DEFAULT '' COMMENT '分享的页面url',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信分享记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wx_share_history`
--

LOCK TABLES `wx_share_history` WRITE;
/*!40000 ALTER TABLE `wx_share_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_share_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-20 16:07:05
