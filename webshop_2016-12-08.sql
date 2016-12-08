# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.15)
# Database: webshop
# Generation Time: 2016-12-08 14:27:16 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table cart_food
# ------------------------------------------------------------

DROP VIEW IF EXISTS `cart_food`;

CREATE TABLE `cart_food` (
   `id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
   `user_id` INT(11) UNSIGNED NOT NULL,
   `food_id` INT(11) UNSIGNED NOT NULL,
   `food_pic` CHAR(255) NOT NULL DEFAULT '',
   `food_name` CHAR(20) NOT NULL DEFAULT '',
   `food_price` DOUBLE NOT NULL,
   `food_quantity` INT(4) NOT NULL,
   `food_sum` INT(4) NOT NULL
) ENGINE=MyISAM;



# Dump of table carts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `food_id` int(11) unsigned NOT NULL,
  `f_quantity` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_user_id` (`user_id`),
  KEY `cart_food_id` (`food_id`),
  CONSTRAINT `cart_food_id` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table foods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `foods`;

CREATE TABLE `foods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL DEFAULT '',
  `price` double NOT NULL,
  `quantity` int(4) NOT NULL,
  `pic` char(255) NOT NULL DEFAULT '',
  `type_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `food_type_id` (`type_id`),
  CONSTRAINT `food_type_id` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;

INSERT INTO `foods` (`id`, `name`, `price`, `quantity`, `pic`, `type_id`)
VALUES
	(1,'过桥豆腐',11.5,111,'images/caipin/guoqiaodoufu.jpg',1),
	(3,'葵花武昌鱼',32,111,'images/caipin/kuihuawuchangyu.jpg',1),
	(5,'鸡翅焖锅',40,111,'images/caipin/jichimenguo.jpg',1),
	(6,'凉拌黄瓜',8,111,'images/caipin/liangbanhuanggua.jpg',1),
	(7,'可乐鸡翅',29.5,111,'images/caipin/kelejichi.jpg',1),
	(8,'酸奶',14,50,'images/yinpin/suannai.jpg',5),
	(9,'羊肉锅',56,111,'images/caipin/yangrouguo.jpg',1),
	(10,'纸杯蛋糕',7.5,99,'images/tianpin/zhibeidangao.jpg',3),
	(11,'奶昔',13,50,'images/yinpin/naixi.jpg',5),
	(12,'点心',10,99,'images/tianpin/dianxin.jpg',3),
	(14,'小蛋糕',9,99,'images/tianpin/xiaodangao.jpg',3),
	(15,'牛肉面',15,80,'images/zhushi/niuroumian.jpg',2),
	(16,'米线',16.5,80,'images/zhushi/mixian.jpg',2),
	(17,'奶茶',16,50,'images/yinpin/naicha.jpg',5),
	(18,'绿豆粥',9,30,'images/zhoutang/lvdouzhou.jpg',4),
	(19,'酱猪手',33,111,'images/caipin/jiangzhushou.jpg',1),
	(20,'养生粥',13,30,'images/zhoutang/yangshengzhou.jpg',4),
	(21,'鸡汤',18,30,'images/zhoutang/jitang.jpg',4),
	(22,'冰沙',10,50,'images/yinpin/bingsha.jpg',5),
	(23,'红茶',14.5,50,'images/yinpin/hongcha.jpg',5),
	(24,'烘焙拼盘',17,99,'images/tianpin/hongbeipinpan.jpg',3),
	(25,'白切鸡凉菜',26,111,'images/caipin/baiqiejiliangcai.jpg',1),
	(26,'烩面',18,80,'images/zhushi/huimian.jpg',2),
	(27,'蔬菜汁',15,50,'images/yinpin/shucaizhi.jpg',5);

/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_user_id` (`user_id`),
  CONSTRAINT `order_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `user_id`, `total`)
VALUES
	(1,4,256),
	(2,4,210);

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `types`;

CREATE TABLE `types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;

INSERT INTO `types` (`id`, `name`)
VALUES
	(1,'菜品'),
	(2,'主食'),
	(3,'甜品'),
	(4,'粥汤'),
	(5,'饮品');

/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(20) NOT NULL,
  `pwd` char(32) NOT NULL,
  `name` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `account`, `pwd`, `name`)
VALUES
	(1,'123456','098f6bcd4621d373cade4e832627b4f6','123456'),
	(3,'test','e10adc3949ba59abbe56e057f20f883e','test'),
	(4,'pulejin','e10adc3949ba59abbe56e057f20f883e','pulejin');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;




# Replace placeholder table for cart_food with correct view syntax
# ------------------------------------------------------------

DROP TABLE `cart_food`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cart_food`
AS SELECT
   `carts`.`id` AS `id`,
   `carts`.`user_id` AS `user_id`,
   `carts`.`food_id` AS `food_id`,
   `foods`.`pic` AS `food_pic`,
   `foods`.`name` AS `food_name`,
   `foods`.`price` AS `food_price`,
   `carts`.`f_quantity` AS `food_quantity`,
   `foods`.`quantity` AS `food_sum`
FROM (`carts` join `foods`) where (`carts`.`food_id` = `foods`.`id`);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
