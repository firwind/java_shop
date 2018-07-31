/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : b2c

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-07-31 10:20:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for eop_app
-- ----------------------------
DROP TABLE IF EXISTS `eop_app`;
CREATE TABLE `eop_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) DEFAULT NULL,
  `app_name` varchar(50) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `descript` longtext,
  `deployment` int(11) DEFAULT '1',
  `path` varchar(255) DEFAULT NULL,
  `authorizationcode` varchar(50) DEFAULT NULL,
  `installuri` varchar(255) DEFAULT NULL,
  `deleteflag` int(6) DEFAULT '0',
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eop_app
-- ----------------------------
INSERT INTO `eop_app` VALUES ('1', 'base', 'base应用', null, 'base应用', '0', '/core', null, null, '0', '2.2.0');
INSERT INTO `eop_app` VALUES ('2', 'cms', 'cms应用', null, 'cms应用', '0', '/cms', null, null, '0', '2.2.0');
INSERT INTO `eop_app` VALUES ('3', 'shop', 'shop应用', null, 'shop应用', '0', '/shop', null, null, '0', '2.2.0');

-- ----------------------------
-- Table structure for es_access
-- ----------------------------
DROP TABLE IF EXISTS `es_access`;
CREATE TABLE `es_access` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `access_time` int(11) DEFAULT NULL,
  `stay_time` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT '0',
  `membername` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_access
-- ----------------------------

-- ----------------------------
-- Table structure for es_account_log
-- ----------------------------
DROP TABLE IF EXISTS `es_account_log`;
CREATE TABLE `es_account_log` (
  `log_id` int(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) DEFAULT NULL,
  `user_money` decimal(20,2) DEFAULT NULL,
  `frozen_money` decimal(20,2) DEFAULT NULL,
  `rank_points` int(9) DEFAULT NULL,
  `pay_points` decimal(20,2) DEFAULT NULL,
  `friend_points` decimal(20,2) DEFAULT NULL,
  `change_time` bigint(20) DEFAULT NULL,
  `change_desc` varchar(512) DEFAULT NULL,
  `change_type` int(8) DEFAULT NULL,
  `frozen_friend_points` int(10) DEFAULT NULL,
  `add_credit_account_money` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `ind_account_log` (`user_id`,`change_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_account_log
-- ----------------------------

-- ----------------------------
-- Table structure for es_activity
-- ----------------------------
DROP TABLE IF EXISTS `es_activity`;
CREATE TABLE `es_activity` (
  `activity_id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(255) DEFAULT NULL,
  `start_time` bigint(20) DEFAULT NULL,
  `end_time` bigint(20) DEFAULT NULL,
  `description` longtext,
  `range_type` smallint(1) DEFAULT NULL,
  `activity_type` smallint(1) DEFAULT NULL,
  `disabled` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_activity
-- ----------------------------

-- ----------------------------
-- Table structure for es_activity_detail
-- ----------------------------
DROP TABLE IF EXISTS `es_activity_detail`;
CREATE TABLE `es_activity_detail` (
  `detail_id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) DEFAULT NULL,
  `full_money` decimal(20,2) DEFAULT NULL,
  `minus_value` decimal(20,2) DEFAULT NULL,
  `point_value` int(10) DEFAULT NULL,
  `is_full_minus` smallint(1) DEFAULT '0',
  `is_free_ship` smallint(1) DEFAULT '0',
  `is_send_point` smallint(1) DEFAULT '0',
  `is_send_gift` smallint(1) DEFAULT '0',
  `is_send_bonus` smallint(1) DEFAULT '0',
  `gift_id` int(10) DEFAULT NULL,
  `bonus_id` int(10) DEFAULT NULL,
  `is_discount` smallint(1) DEFAULT '0',
  `discount_value` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_activity_detail
-- ----------------------------

-- ----------------------------
-- Table structure for es_activity_gift
-- ----------------------------
DROP TABLE IF EXISTS `es_activity_gift`;
CREATE TABLE `es_activity_gift` (
  `gift_id` int(10) NOT NULL AUTO_INCREMENT,
  `gift_name` varchar(255) DEFAULT NULL,
  `gift_price` decimal(20,2) DEFAULT NULL,
  `gift_img` varchar(255) DEFAULT NULL,
  `gift_type` smallint(1) DEFAULT NULL,
  `actual_store` int(10) DEFAULT NULL,
  `enable_store` int(10) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `disabled` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_activity_gift
-- ----------------------------

-- ----------------------------
-- Table structure for es_activity_goods
-- ----------------------------
DROP TABLE IF EXISTS `es_activity_goods`;
CREATE TABLE `es_activity_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_activity_goods
-- ----------------------------

-- ----------------------------
-- Table structure for es_adcolumn
-- ----------------------------
DROP TABLE IF EXISTS `es_adcolumn`;
CREATE TABLE `es_adcolumn` (
  `acid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  `width` varchar(50) DEFAULT NULL,
  `height` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `anumber` bigint(20) DEFAULT NULL,
  `atype` int(11) DEFAULT NULL,
  `arule` bigint(20) DEFAULT NULL,
  `disabled` varchar(5) DEFAULT 'false',
  PRIMARY KEY (`acid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_adcolumn
-- ----------------------------
INSERT INTO `es_adcolumn` VALUES ('1', '测试', '100px', '100px', null, null, '0', null, 'false');

-- ----------------------------
-- Table structure for es_admin_logs
-- ----------------------------
DROP TABLE IF EXISTS `es_admin_logs`;
CREATE TABLE `es_admin_logs` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(50) DEFAULT NULL,
  `operator_name` varchar(255) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `log_detail` varchar(255) DEFAULT NULL,
  `log_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=439 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_admin_logs
-- ----------------------------
INSERT INTO `es_admin_logs` VALUES ('1', 'setting', 'admin', '1', '更新所有系统设置', '1531733062');
INSERT INTO `es_admin_logs` VALUES ('2', 'adv', 'admin', '1', '添加了一个广告名为测试的新广告', '1531735262');
INSERT INTO `es_admin_logs` VALUES ('3', 'adv', 'admin', '1', '平台广告列表新添加一个广告名为热卖了！广告', '1531735317');
INSERT INTO `es_admin_logs` VALUES ('4', 'adv', 'admin', '1', '修改广告列表中广告名为热卖了！广告的广告信息', '1531735350');
INSERT INTO `es_admin_logs` VALUES ('5', 'adv', 'admin', '1', '平台广告列表新添加一个广告名为贱卖了！广告', '1531735400');
INSERT INTO `es_admin_logs` VALUES ('6', 'goods', 'admin', '1', '添加商品类型名为测试商品类型的商品', '1531735589');
INSERT INTO `es_admin_logs` VALUES ('7', 'goods', 'admin', '1', '添加了一个商品类别名为测试商品分类的商品类别', '1531735602');
INSERT INTO `es_admin_logs` VALUES ('8', 'goods', 'admin', '1', '更新商品类别名为测试商品分类的商品类别', '1531735611');
INSERT INTO `es_admin_logs` VALUES ('9', 'goods', 'admin', '1', '添加了一个商品名为测试商品的商品', '1531735667');
INSERT INTO `es_admin_logs` VALUES ('10', 'goods', 'admin', '1', '修改商品名为测试商品的商品信息', '1531735698');
INSERT INTO `es_admin_logs` VALUES ('11', 'goods', 'admin', '1', '修改商品名为测试商品的商品信息', '1531735728');
INSERT INTO `es_admin_logs` VALUES ('12', 'goods', 'admin', '1', '添加商品类型名为测试商品类型的商品', '1531735740');
INSERT INTO `es_admin_logs` VALUES ('13', 'goods', 'admin', '1', '修改商品名为测试商品的商品信息', '1531735747');
INSERT INTO `es_admin_logs` VALUES ('14', 'goods', 'admin', '1', '添加商品类型名为测试商品类型的商品', '1531736291');
INSERT INTO `es_admin_logs` VALUES ('15', 'goods', 'admin', '1', '添加了一个测试的标签', '1531736318');
INSERT INTO `es_admin_logs` VALUES ('16', 'goods', 'admin', '1', '添加商品类型名为测试商品类型的商品', '1531736331');
INSERT INTO `es_admin_logs` VALUES ('17', 'goods', 'admin', '1', '修改商品名为测试商品的商品信息', '1531736343');
INSERT INTO `es_admin_logs` VALUES ('18', 'goods', 'admin', '1', '商品ID为1的库存维护', '1531736427');
INSERT INTO `es_admin_logs` VALUES ('19', 'goods', 'admin', '1', '修改商品名为测试商品的商品信息', '1531736528');
INSERT INTO `es_admin_logs` VALUES ('20', 'goods', 'admin', '1', '添加商品类型名为测试商品类型的商品', '1531736715');
INSERT INTO `es_admin_logs` VALUES ('21', 'goods', 'admin', '1', '添加商品类型名为测试商品类型的商品', '1531736897');
INSERT INTO `es_admin_logs` VALUES ('22', 'goods', 'admin', '1', '修改商品名为测试商品的商品信息', '1531736911');
INSERT INTO `es_admin_logs` VALUES ('23', 'goods', 'admin', '1', '添加商品类型名为测试商品类型的商品', '1531736953');
INSERT INTO `es_admin_logs` VALUES ('24', 'goods', 'admin', '1', '添加了一个品牌名为阿里达斯的品牌', '1531736997');
INSERT INTO `es_admin_logs` VALUES ('25', 'goods', 'admin', '1', '修改商品名为测试商品的商品信息', '1531737526');
INSERT INTO `es_admin_logs` VALUES ('26', 'setting', 'admin', '1', '更新所有系统设置', '1531793397');
INSERT INTO `es_admin_logs` VALUES ('27', 'member', 'admin', '1', '添加一个test会员', '1531799443');
INSERT INTO `es_admin_logs` VALUES ('28', 'setting', 'admin', '1', '更新所有系统设置', '1531808879');
INSERT INTO `es_admin_logs` VALUES ('29', 'adv', 'admin', '1', '修改广告列表中广告名为贱卖了！广告的广告信息', '1531815021');
INSERT INTO `es_admin_logs` VALUES ('30', 'adv', 'admin', '1', '修改广告列表中广告名为贱卖了！广告的广告信息', '1531815173');
INSERT INTO `es_admin_logs` VALUES ('31', 'adv', 'admin', '1', '修改广告列表中广告名为热卖了！广告的广告信息', '1531815181');
INSERT INTO `es_admin_logs` VALUES ('32', 'goods', 'admin', '1', '添加了一个商品名为无标题的商品', '1531815942');
INSERT INTO `es_admin_logs` VALUES ('33', 'goods', 'admin', '1', '添加了一个商品名为无标题的商品', '1531816066');
INSERT INTO `es_admin_logs` VALUES ('34', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816096');
INSERT INTO `es_admin_logs` VALUES ('35', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816127');
INSERT INTO `es_admin_logs` VALUES ('36', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816157');
INSERT INTO `es_admin_logs` VALUES ('37', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816188');
INSERT INTO `es_admin_logs` VALUES ('38', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816218');
INSERT INTO `es_admin_logs` VALUES ('39', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816249');
INSERT INTO `es_admin_logs` VALUES ('40', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816279');
INSERT INTO `es_admin_logs` VALUES ('41', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816309');
INSERT INTO `es_admin_logs` VALUES ('42', 'goods', 'admin', '1', '添加了一个商品名为无标题的商品', '1531816353');
INSERT INTO `es_admin_logs` VALUES ('43', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816383');
INSERT INTO `es_admin_logs` VALUES ('44', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816413');
INSERT INTO `es_admin_logs` VALUES ('45', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816444');
INSERT INTO `es_admin_logs` VALUES ('46', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816475');
INSERT INTO `es_admin_logs` VALUES ('47', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816506');
INSERT INTO `es_admin_logs` VALUES ('48', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816539');
INSERT INTO `es_admin_logs` VALUES ('49', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816570');
INSERT INTO `es_admin_logs` VALUES ('50', 'goods', 'admin', '1', '添加了一个商品名为无标题的商品', '1531816665');
INSERT INTO `es_admin_logs` VALUES ('51', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816696');
INSERT INTO `es_admin_logs` VALUES ('52', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816727');
INSERT INTO `es_admin_logs` VALUES ('53', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816758');
INSERT INTO `es_admin_logs` VALUES ('54', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816789');
INSERT INTO `es_admin_logs` VALUES ('55', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816824');
INSERT INTO `es_admin_logs` VALUES ('56', 'goods', 'admin', '1', '添加了一个商品名为无标题的商品', '1531816874');
INSERT INTO `es_admin_logs` VALUES ('57', 'goods', 'admin', '1', '添加了一个商品名为无标题的商品', '1531816905');
INSERT INTO `es_admin_logs` VALUES ('58', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816935');
INSERT INTO `es_admin_logs` VALUES ('59', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531816996');
INSERT INTO `es_admin_logs` VALUES ('60', 'goods', 'admin', '1', '添加了一个商品名为无标题的商品', '1531817027');
INSERT INTO `es_admin_logs` VALUES ('61', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817058');
INSERT INTO `es_admin_logs` VALUES ('62', 'goods', 'admin', '1', '添加了一个商品名为无标题的商品', '1531817122');
INSERT INTO `es_admin_logs` VALUES ('63', 'goods', 'admin', '1', '添加了一个商品名为无标题的商品', '1531817260');
INSERT INTO `es_admin_logs` VALUES ('64', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817291');
INSERT INTO `es_admin_logs` VALUES ('65', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817322');
INSERT INTO `es_admin_logs` VALUES ('66', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817353');
INSERT INTO `es_admin_logs` VALUES ('67', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817384');
INSERT INTO `es_admin_logs` VALUES ('68', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817415');
INSERT INTO `es_admin_logs` VALUES ('69', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817446');
INSERT INTO `es_admin_logs` VALUES ('70', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817477');
INSERT INTO `es_admin_logs` VALUES ('71', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817508');
INSERT INTO `es_admin_logs` VALUES ('72', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817539');
INSERT INTO `es_admin_logs` VALUES ('73', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817570');
INSERT INTO `es_admin_logs` VALUES ('74', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817601');
INSERT INTO `es_admin_logs` VALUES ('75', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817632');
INSERT INTO `es_admin_logs` VALUES ('76', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817663');
INSERT INTO `es_admin_logs` VALUES ('77', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817695');
INSERT INTO `es_admin_logs` VALUES ('78', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817726');
INSERT INTO `es_admin_logs` VALUES ('79', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817757');
INSERT INTO `es_admin_logs` VALUES ('80', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817788');
INSERT INTO `es_admin_logs` VALUES ('81', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817819');
INSERT INTO `es_admin_logs` VALUES ('82', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817850');
INSERT INTO `es_admin_logs` VALUES ('83', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817881');
INSERT INTO `es_admin_logs` VALUES ('84', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817912');
INSERT INTO `es_admin_logs` VALUES ('85', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817943');
INSERT INTO `es_admin_logs` VALUES ('86', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531817974');
INSERT INTO `es_admin_logs` VALUES ('87', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818005');
INSERT INTO `es_admin_logs` VALUES ('88', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818036');
INSERT INTO `es_admin_logs` VALUES ('89', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818067');
INSERT INTO `es_admin_logs` VALUES ('90', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818098');
INSERT INTO `es_admin_logs` VALUES ('91', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818129');
INSERT INTO `es_admin_logs` VALUES ('92', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818160');
INSERT INTO `es_admin_logs` VALUES ('93', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818191');
INSERT INTO `es_admin_logs` VALUES ('94', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818222');
INSERT INTO `es_admin_logs` VALUES ('95', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818253');
INSERT INTO `es_admin_logs` VALUES ('96', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818284');
INSERT INTO `es_admin_logs` VALUES ('97', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818315');
INSERT INTO `es_admin_logs` VALUES ('98', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818346');
INSERT INTO `es_admin_logs` VALUES ('99', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818377');
INSERT INTO `es_admin_logs` VALUES ('100', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818408');
INSERT INTO `es_admin_logs` VALUES ('101', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818439');
INSERT INTO `es_admin_logs` VALUES ('102', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818470');
INSERT INTO `es_admin_logs` VALUES ('103', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818501');
INSERT INTO `es_admin_logs` VALUES ('104', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818532');
INSERT INTO `es_admin_logs` VALUES ('105', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818563');
INSERT INTO `es_admin_logs` VALUES ('106', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818594');
INSERT INTO `es_admin_logs` VALUES ('107', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818625');
INSERT INTO `es_admin_logs` VALUES ('108', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818656');
INSERT INTO `es_admin_logs` VALUES ('109', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818687');
INSERT INTO `es_admin_logs` VALUES ('110', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818718');
INSERT INTO `es_admin_logs` VALUES ('111', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818749');
INSERT INTO `es_admin_logs` VALUES ('112', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818780');
INSERT INTO `es_admin_logs` VALUES ('113', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818811');
INSERT INTO `es_admin_logs` VALUES ('114', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818842');
INSERT INTO `es_admin_logs` VALUES ('115', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818873');
INSERT INTO `es_admin_logs` VALUES ('116', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818904');
INSERT INTO `es_admin_logs` VALUES ('117', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818935');
INSERT INTO `es_admin_logs` VALUES ('118', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818966');
INSERT INTO `es_admin_logs` VALUES ('119', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531818997');
INSERT INTO `es_admin_logs` VALUES ('120', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819028');
INSERT INTO `es_admin_logs` VALUES ('121', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819059');
INSERT INTO `es_admin_logs` VALUES ('122', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819090');
INSERT INTO `es_admin_logs` VALUES ('123', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819121');
INSERT INTO `es_admin_logs` VALUES ('124', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819152');
INSERT INTO `es_admin_logs` VALUES ('125', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819183');
INSERT INTO `es_admin_logs` VALUES ('126', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819214');
INSERT INTO `es_admin_logs` VALUES ('127', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819245');
INSERT INTO `es_admin_logs` VALUES ('128', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819276');
INSERT INTO `es_admin_logs` VALUES ('129', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819307');
INSERT INTO `es_admin_logs` VALUES ('130', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819338');
INSERT INTO `es_admin_logs` VALUES ('131', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819369');
INSERT INTO `es_admin_logs` VALUES ('132', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819400');
INSERT INTO `es_admin_logs` VALUES ('133', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819431');
INSERT INTO `es_admin_logs` VALUES ('134', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819462');
INSERT INTO `es_admin_logs` VALUES ('135', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819493');
INSERT INTO `es_admin_logs` VALUES ('136', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819524');
INSERT INTO `es_admin_logs` VALUES ('137', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819555');
INSERT INTO `es_admin_logs` VALUES ('138', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819586');
INSERT INTO `es_admin_logs` VALUES ('139', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819617');
INSERT INTO `es_admin_logs` VALUES ('140', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819648');
INSERT INTO `es_admin_logs` VALUES ('141', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819679');
INSERT INTO `es_admin_logs` VALUES ('142', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819710');
INSERT INTO `es_admin_logs` VALUES ('143', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819741');
INSERT INTO `es_admin_logs` VALUES ('144', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819772');
INSERT INTO `es_admin_logs` VALUES ('145', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819803');
INSERT INTO `es_admin_logs` VALUES ('146', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819834');
INSERT INTO `es_admin_logs` VALUES ('147', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819865');
INSERT INTO `es_admin_logs` VALUES ('148', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819896');
INSERT INTO `es_admin_logs` VALUES ('149', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819927');
INSERT INTO `es_admin_logs` VALUES ('150', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819958');
INSERT INTO `es_admin_logs` VALUES ('151', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531819989');
INSERT INTO `es_admin_logs` VALUES ('152', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820020');
INSERT INTO `es_admin_logs` VALUES ('153', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820051');
INSERT INTO `es_admin_logs` VALUES ('154', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820082');
INSERT INTO `es_admin_logs` VALUES ('155', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820113');
INSERT INTO `es_admin_logs` VALUES ('156', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820144');
INSERT INTO `es_admin_logs` VALUES ('157', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820175');
INSERT INTO `es_admin_logs` VALUES ('158', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820206');
INSERT INTO `es_admin_logs` VALUES ('159', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820237');
INSERT INTO `es_admin_logs` VALUES ('160', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820268');
INSERT INTO `es_admin_logs` VALUES ('161', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820299');
INSERT INTO `es_admin_logs` VALUES ('162', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820330');
INSERT INTO `es_admin_logs` VALUES ('163', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820361');
INSERT INTO `es_admin_logs` VALUES ('164', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820392');
INSERT INTO `es_admin_logs` VALUES ('165', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820423');
INSERT INTO `es_admin_logs` VALUES ('166', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820454');
INSERT INTO `es_admin_logs` VALUES ('167', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820485');
INSERT INTO `es_admin_logs` VALUES ('168', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820516');
INSERT INTO `es_admin_logs` VALUES ('169', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820547');
INSERT INTO `es_admin_logs` VALUES ('170', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820578');
INSERT INTO `es_admin_logs` VALUES ('171', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820609');
INSERT INTO `es_admin_logs` VALUES ('172', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820640');
INSERT INTO `es_admin_logs` VALUES ('173', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820671');
INSERT INTO `es_admin_logs` VALUES ('174', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820702');
INSERT INTO `es_admin_logs` VALUES ('175', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820733');
INSERT INTO `es_admin_logs` VALUES ('176', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820764');
INSERT INTO `es_admin_logs` VALUES ('177', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820795');
INSERT INTO `es_admin_logs` VALUES ('178', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820826');
INSERT INTO `es_admin_logs` VALUES ('179', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820857');
INSERT INTO `es_admin_logs` VALUES ('180', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820888');
INSERT INTO `es_admin_logs` VALUES ('181', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820919');
INSERT INTO `es_admin_logs` VALUES ('182', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820950');
INSERT INTO `es_admin_logs` VALUES ('183', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531820981');
INSERT INTO `es_admin_logs` VALUES ('184', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821012');
INSERT INTO `es_admin_logs` VALUES ('185', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821043');
INSERT INTO `es_admin_logs` VALUES ('186', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821074');
INSERT INTO `es_admin_logs` VALUES ('187', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821105');
INSERT INTO `es_admin_logs` VALUES ('188', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821136');
INSERT INTO `es_admin_logs` VALUES ('189', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821167');
INSERT INTO `es_admin_logs` VALUES ('190', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821198');
INSERT INTO `es_admin_logs` VALUES ('191', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821229');
INSERT INTO `es_admin_logs` VALUES ('192', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821260');
INSERT INTO `es_admin_logs` VALUES ('193', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821291');
INSERT INTO `es_admin_logs` VALUES ('194', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821322');
INSERT INTO `es_admin_logs` VALUES ('195', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821353');
INSERT INTO `es_admin_logs` VALUES ('196', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821384');
INSERT INTO `es_admin_logs` VALUES ('197', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821415');
INSERT INTO `es_admin_logs` VALUES ('198', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821446');
INSERT INTO `es_admin_logs` VALUES ('199', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821477');
INSERT INTO `es_admin_logs` VALUES ('200', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821508');
INSERT INTO `es_admin_logs` VALUES ('201', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821539');
INSERT INTO `es_admin_logs` VALUES ('202', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821570');
INSERT INTO `es_admin_logs` VALUES ('203', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821601');
INSERT INTO `es_admin_logs` VALUES ('204', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821632');
INSERT INTO `es_admin_logs` VALUES ('205', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821663');
INSERT INTO `es_admin_logs` VALUES ('206', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821694');
INSERT INTO `es_admin_logs` VALUES ('207', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821725');
INSERT INTO `es_admin_logs` VALUES ('208', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821756');
INSERT INTO `es_admin_logs` VALUES ('209', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821787');
INSERT INTO `es_admin_logs` VALUES ('210', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821818');
INSERT INTO `es_admin_logs` VALUES ('211', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821849');
INSERT INTO `es_admin_logs` VALUES ('212', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821880');
INSERT INTO `es_admin_logs` VALUES ('213', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821911');
INSERT INTO `es_admin_logs` VALUES ('214', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821942');
INSERT INTO `es_admin_logs` VALUES ('215', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531821973');
INSERT INTO `es_admin_logs` VALUES ('216', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822004');
INSERT INTO `es_admin_logs` VALUES ('217', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822035');
INSERT INTO `es_admin_logs` VALUES ('218', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822066');
INSERT INTO `es_admin_logs` VALUES ('219', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822097');
INSERT INTO `es_admin_logs` VALUES ('220', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822128');
INSERT INTO `es_admin_logs` VALUES ('221', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822159');
INSERT INTO `es_admin_logs` VALUES ('222', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822190');
INSERT INTO `es_admin_logs` VALUES ('223', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822221');
INSERT INTO `es_admin_logs` VALUES ('224', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822252');
INSERT INTO `es_admin_logs` VALUES ('225', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822283');
INSERT INTO `es_admin_logs` VALUES ('226', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822314');
INSERT INTO `es_admin_logs` VALUES ('227', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822345');
INSERT INTO `es_admin_logs` VALUES ('228', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822376');
INSERT INTO `es_admin_logs` VALUES ('229', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822408');
INSERT INTO `es_admin_logs` VALUES ('230', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822439');
INSERT INTO `es_admin_logs` VALUES ('231', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822471');
INSERT INTO `es_admin_logs` VALUES ('232', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822501');
INSERT INTO `es_admin_logs` VALUES ('233', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822532');
INSERT INTO `es_admin_logs` VALUES ('234', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822563');
INSERT INTO `es_admin_logs` VALUES ('235', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822594');
INSERT INTO `es_admin_logs` VALUES ('236', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822624');
INSERT INTO `es_admin_logs` VALUES ('237', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822655');
INSERT INTO `es_admin_logs` VALUES ('238', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822686');
INSERT INTO `es_admin_logs` VALUES ('239', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822717');
INSERT INTO `es_admin_logs` VALUES ('240', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822748');
INSERT INTO `es_admin_logs` VALUES ('241', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822779');
INSERT INTO `es_admin_logs` VALUES ('242', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822810');
INSERT INTO `es_admin_logs` VALUES ('243', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822841');
INSERT INTO `es_admin_logs` VALUES ('244', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822872');
INSERT INTO `es_admin_logs` VALUES ('245', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822903');
INSERT INTO `es_admin_logs` VALUES ('246', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822934');
INSERT INTO `es_admin_logs` VALUES ('247', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822965');
INSERT INTO `es_admin_logs` VALUES ('248', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531822996');
INSERT INTO `es_admin_logs` VALUES ('249', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823028');
INSERT INTO `es_admin_logs` VALUES ('250', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823059');
INSERT INTO `es_admin_logs` VALUES ('251', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823090');
INSERT INTO `es_admin_logs` VALUES ('252', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823121');
INSERT INTO `es_admin_logs` VALUES ('253', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823152');
INSERT INTO `es_admin_logs` VALUES ('254', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823183');
INSERT INTO `es_admin_logs` VALUES ('255', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823214');
INSERT INTO `es_admin_logs` VALUES ('256', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823245');
INSERT INTO `es_admin_logs` VALUES ('257', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823276');
INSERT INTO `es_admin_logs` VALUES ('258', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823307');
INSERT INTO `es_admin_logs` VALUES ('259', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823338');
INSERT INTO `es_admin_logs` VALUES ('260', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823369');
INSERT INTO `es_admin_logs` VALUES ('261', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823400');
INSERT INTO `es_admin_logs` VALUES ('262', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823431');
INSERT INTO `es_admin_logs` VALUES ('263', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823462');
INSERT INTO `es_admin_logs` VALUES ('264', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823493');
INSERT INTO `es_admin_logs` VALUES ('265', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823524');
INSERT INTO `es_admin_logs` VALUES ('266', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823555');
INSERT INTO `es_admin_logs` VALUES ('267', 'goods', 'admin', '1', '修改商品名为无标题的商品信息', '1531823587');
INSERT INTO `es_admin_logs` VALUES ('268', 'goods', 'admin', '1', '商品ID为1的库存维护', '1531982311');
INSERT INTO `es_admin_logs` VALUES ('269', 'edit', 'admin', '1', '订单号为153196963819，添加特殊处理', '1531995630');
INSERT INTO `es_admin_logs` VALUES ('270', 'setting', 'admin', '1', '更新所有系统设置', '1532052772');
INSERT INTO `es_admin_logs` VALUES ('271', 'setting', 'admin', '1', '更新所有系统设置', '1532052806');
INSERT INTO `es_admin_logs` VALUES ('272', 'order', 'admin', '1', '订单ID为23，admin确认收款，金额：90.0', '1532067005');
INSERT INTO `es_admin_logs` VALUES ('273', 'order', 'admin', '1', '订单ID为153197051641由会员[test]申请退款,金额：90.0', '1532067589');
INSERT INTO `es_admin_logs` VALUES ('274', 'edit', 'admin', '1', '订单号为153197051641，添加特殊处理', '1532067691');
INSERT INTO `es_admin_logs` VALUES ('275', 'order', 'admin', '1', '平台售后已审核', '1532067769');
INSERT INTO `es_admin_logs` VALUES ('276', 'order', 'admin', '1', '订单ID为153197051641由会员[test]申请退款,金额：90.0', '1532070758');
INSERT INTO `es_admin_logs` VALUES ('277', 'order', 'admin', '1', '订单ID为24，admin确认收款，金额：16010.0', '1532073637');
INSERT INTO `es_admin_logs` VALUES ('278', 'order', 'admin', '1', '订单ID为153198300886由会员[test0011]申请退款,金额：16010.0', '1532073659');
INSERT INTO `es_admin_logs` VALUES ('279', 'order', 'admin', '1', '平台售后已审核', '1532073692');
INSERT INTO `es_admin_logs` VALUES ('280', 'order', 'admin', '1', '平台售后已审核', '1532073957');
INSERT INTO `es_admin_logs` VALUES ('281', 'order', 'admin', '1', '订单ID为153197051641由会员[test]申请退款,金额：90.0', '1532074013');
INSERT INTO `es_admin_logs` VALUES ('282', 'order', 'admin', '1', '平台售后已审核', '1532074071');
INSERT INTO `es_admin_logs` VALUES ('283', 'order', 'admin', '1', '订单ID为153197051641由会员[test]申请退款,金额：90.0', '1532074115');
INSERT INTO `es_admin_logs` VALUES ('284', 'order', 'admin', '1', '平台售后已审核', '1532074182');
INSERT INTO `es_admin_logs` VALUES ('285', 'order', 'admin', '1', '订单ID为153197051641由会员[test]申请退款,金额：90.0', '1532074206');
INSERT INTO `es_admin_logs` VALUES ('286', 'order', 'admin', '1', '平台售后已审核', '1532074271');
INSERT INTO `es_admin_logs` VALUES ('287', 'order', 'admin', '1', '订单ID为153197051641由会员[test]申请退款,金额：90.0', '1532074385');
INSERT INTO `es_admin_logs` VALUES ('288', 'order', 'admin', '1', '平台售后已审核', '1532074396');
INSERT INTO `es_admin_logs` VALUES ('289', 'order', 'admin', '1', '平台售后已审核', '1532074414');
INSERT INTO `es_admin_logs` VALUES ('290', 'order', 'admin', '1', '平台售后已审核', '1532074678');
INSERT INTO `es_admin_logs` VALUES ('291', 'order', 'admin', '1', '订单ID为153198300886由会员[test0011]申请退款,金额：16010.0', '1532074804');
INSERT INTO `es_admin_logs` VALUES ('292', 'order', 'admin', '1', '平台售后已审核', '1532074881');
INSERT INTO `es_admin_logs` VALUES ('293', 'order', 'admin', '1', '订单ID为153198300886由会员[test0011]申请退款,金额：16010.0', '1532075025');
INSERT INTO `es_admin_logs` VALUES ('294', 'order', 'admin', '1', '平台售后已审核', '1532075035');
INSERT INTO `es_admin_logs` VALUES ('295', 'order', 'admin', '1', '订单ID为153198300886由会员[test0011]申请退款,金额：16010.0', '1532075164');
INSERT INTO `es_admin_logs` VALUES ('296', 'order', 'admin', '1', '平台售后已审核', '1532075304');
INSERT INTO `es_admin_logs` VALUES ('297', 'order', 'admin', '1', '订单ID为153198300886由会员[test0011]申请退款,金额：16010.0', '1532075579');
INSERT INTO `es_admin_logs` VALUES ('298', 'order', 'admin', '1', '平台售后已审核', '1532075622');
INSERT INTO `es_admin_logs` VALUES ('299', 'order', 'admin', '1', '订单ID为153198300886由会员[test0011]申请退款,金额：16010.0', '1532075687');
INSERT INTO `es_admin_logs` VALUES ('300', 'order', 'admin', '1', '平台售后已审核', '1532075697');
INSERT INTO `es_admin_logs` VALUES ('301', 'order', 'admin', '1', '订单ID为153198300886由会员[test0011]申请退款,金额：16010.0', '1532075800');
INSERT INTO `es_admin_logs` VALUES ('302', 'order', 'admin', '1', '平台售后已审核', '1532075954');
INSERT INTO `es_admin_logs` VALUES ('303', 'order', 'admin', '1', '订单ID为153198300886由会员[test0011]申请退款,金额：16010.0', '1532076021');
INSERT INTO `es_admin_logs` VALUES ('304', 'order', 'admin', '1', '平台售后已审核', '1532076030');
INSERT INTO `es_admin_logs` VALUES ('305', 'order', 'admin', '1', '订单号为153196963819由会员[test0011]退货申请，申请退款金额：330.0', '1532077300');
INSERT INTO `es_admin_logs` VALUES ('306', 'order', 'admin', '1', '退货单ID为17的退货审核', '1532077328');
INSERT INTO `es_admin_logs` VALUES ('307', 'order', 'admin', '1', '订单ID为15退货商品入库', '1532077355');
INSERT INTO `es_admin_logs` VALUES ('308', 'order', 'admin', '1', '订单号为153196963819申请退货,金额：330.0', '1532077355');
INSERT INTO `es_admin_logs` VALUES ('309', 'order', 'admin', '1', '退货单ID为18的退货审核', '1532078290');
INSERT INTO `es_admin_logs` VALUES ('310', 'order', 'admin', '1', '平台售后已审核', '1532078705');
INSERT INTO `es_admin_logs` VALUES ('311', 'setting', 'admin', '1', '添加一个名为我的销量的菜单项', '1532080369');
INSERT INTO `es_admin_logs` VALUES ('312', 'setting', 'admin', '1', '修改了名为我的销量的菜单项信息', '1532080395');
INSERT INTO `es_admin_logs` VALUES ('313', 'setting', 'admin', '1', '修改了名为销量管理的菜单项信息', '1532080712');
INSERT INTO `es_admin_logs` VALUES ('314', 'setting', 'admin', '1', '修改了名为销量管理的菜单项信息', '1532083486');
INSERT INTO `es_admin_logs` VALUES ('315', 'setting', 'admin', '1', '更新所有系统设置', '1532312846');
INSERT INTO `es_admin_logs` VALUES ('316', 'setting', 'admin', '1', '更新所有系统设置', '1532330528');
INSERT INTO `es_admin_logs` VALUES ('317', 'setting', 'admin', '1', '更新所有系统设置', '1532330546');
INSERT INTO `es_admin_logs` VALUES ('318', 'setting', 'admin', '1', '更新所有系统设置', '1532339427');
INSERT INTO `es_admin_logs` VALUES ('319', 'setting', 'admin', '1', '更新所有系统设置', '1532339655');
INSERT INTO `es_admin_logs` VALUES ('320', 'setting', 'admin', '1', '更新所有系统设置', '1532340511');
INSERT INTO `es_admin_logs` VALUES ('321', 'setting', 'admin', '1', '修改了alipayDirectPlugin支付类型的支付宝支付方式信息', '1532398782');
INSERT INTO `es_admin_logs` VALUES ('322', 'setting', 'admin', '1', '新安装了一个alipayWapPlugin支付类型的支付宝Wap支付接口支付方式', '1532419450');
INSERT INTO `es_admin_logs` VALUES ('323', 'setting', 'admin', '1', '修改了alipayWapPlugin支付类型的支付宝Wap支付接口支付方式信息', '1532419869');
INSERT INTO `es_admin_logs` VALUES ('324', 'setting', 'admin', '1', '更新所有系统设置', '1532422155');
INSERT INTO `es_admin_logs` VALUES ('325', 'setting', 'admin', '1', '修改了alipayWapPlugin支付类型的支付宝Wap支付接口支付方式信息', '1532422176');
INSERT INTO `es_admin_logs` VALUES ('326', 'setting', 'admin', '1', '修改了alipayWapPlugin支付类型的支付宝Wap支付接口支付方式信息', '1532486651');
INSERT INTO `es_admin_logs` VALUES ('327', 'setting', 'admin', '1', '修改了alipayWapPlugin支付类型的支付宝Wap支付接口支付方式信息', '1532487067');
INSERT INTO `es_admin_logs` VALUES ('328', 'setting', 'admin', '1', '更新所有系统设置', '1532488109');
INSERT INTO `es_admin_logs` VALUES ('329', 'setting', 'admin', '1', '更新所有系统设置', '1532488135');
INSERT INTO `es_admin_logs` VALUES ('330', 'setting', 'admin', '1', '修改了alipayWapPlugin支付类型的支付宝Wap支付接口支付方式信息', '1532488259');
INSERT INTO `es_admin_logs` VALUES ('331', 'setting', 'admin', '1', '修改了alipayWapPlugin支付类型的支付宝Wap支付接口支付方式信息', '1532488323');
INSERT INTO `es_admin_logs` VALUES ('332', 'goods', 'admin', '1', '修改商品名为测试商品的商品信息', '1532489113');
INSERT INTO `es_admin_logs` VALUES ('333', 'setting', 'admin', '1', '修改名为圆通速递的配送方式', '1532489206');
INSERT INTO `es_admin_logs` VALUES ('334', 'setting', 'admin', '1', '修改了alipayWapPlugin支付类型的支付宝Wap支付接口支付方式信息', '1532490101');
INSERT INTO `es_admin_logs` VALUES ('335', 'setting', 'admin', '1', '更新所有系统设置', '1532496592');
INSERT INTO `es_admin_logs` VALUES ('336', 'setting', 'admin', '1', '更新所有系统设置', '1532496628');
INSERT INTO `es_admin_logs` VALUES ('337', 'setting', 'admin', '1', '更新所有系统设置', '1532496682');
INSERT INTO `es_admin_logs` VALUES ('338', 'setting', 'admin', '1', '更新所有系统设置', '1532496711');
INSERT INTO `es_admin_logs` VALUES ('339', 'setting', 'admin', '1', '更新所有系统设置', '1532496758');
INSERT INTO `es_admin_logs` VALUES ('340', 'setting', 'admin', '1', '更新所有系统设置', '1532496789');
INSERT INTO `es_admin_logs` VALUES ('341', 'setting', 'admin', '1', '更新所有系统设置', '1532496804');
INSERT INTO `es_admin_logs` VALUES ('342', 'setting', 'admin', '1', '更新所有系统设置', '1532496831');
INSERT INTO `es_admin_logs` VALUES ('343', 'setting', 'admin', '1', '更新所有系统设置', '1532496835');
INSERT INTO `es_admin_logs` VALUES ('344', 'setting', 'admin', '1', '更新所有系统设置', '1532496911');
INSERT INTO `es_admin_logs` VALUES ('345', 'setting', 'admin', '1', '修改了alipayWapPlugin支付类型的支付宝Wap支付接口支付方式信息', '1532502008');
INSERT INTO `es_admin_logs` VALUES ('346', 'order', 'admin', '1', '平台售后已审核', '1532506188');
INSERT INTO `es_admin_logs` VALUES ('347', 'order', 'admin', '1', '订单ID为153250160685由会员[test]申请退款,金额：0.01', '1532506285');
INSERT INTO `es_admin_logs` VALUES ('348', 'order', 'admin', '1', '平台售后已审核', '1532506294');
INSERT INTO `es_admin_logs` VALUES ('349', 'order', 'admin', '1', '退款单ID为19的退款单由admin已确认退款,退款金额：0.01', '1532506780');
INSERT INTO `es_admin_logs` VALUES ('350', 'order', 'admin', '1', '订单ID为153250182042由会员[test]申请退款,金额：0.01', '1532507311');
INSERT INTO `es_admin_logs` VALUES ('351', 'order', 'admin', '1', '退款单ID为18的退款单由admin已确认退款,退款金额：0.01', '1532507356');
INSERT INTO `es_admin_logs` VALUES ('352', 'order', 'admin', '1', '平台售后已审核', '1532507408');
INSERT INTO `es_admin_logs` VALUES ('353', 'order', 'admin', '1', '订单ID为153250182042由会员[test]申请退款,金额：0.01', '1532507436');
INSERT INTO `es_admin_logs` VALUES ('354', 'order', 'admin', '1', '订单ID为153250111686由会员[test]申请退款,金额：0.01', '1532507452');
INSERT INTO `es_admin_logs` VALUES ('355', 'order', 'admin', '1', '订单ID为153250160685由会员[test]申请退款,金额：0.01', '1532507465');
INSERT INTO `es_admin_logs` VALUES ('356', 'order', 'admin', '1', '平台售后已审核', '1532507597');
INSERT INTO `es_admin_logs` VALUES ('357', 'order', 'admin', '1', '平台售后已审核', '1532507602');
INSERT INTO `es_admin_logs` VALUES ('358', 'order', 'admin', '1', '平台售后已审核', '1532507612');
INSERT INTO `es_admin_logs` VALUES ('359', 'order', 'admin', '1', '退款单ID为22的退款单由admin已确认退款,退款金额：0.01', '1532507621');
INSERT INTO `es_admin_logs` VALUES ('360', 'order', 'admin', '1', '退款单ID为21的退款单由admin已确认退款,退款金额：0.01', '1532507631');
INSERT INTO `es_admin_logs` VALUES ('361', 'order', 'admin', '1', '退款单ID为20的退款单由admin已确认退款,退款金额：0.01', '1532507646');
INSERT INTO `es_admin_logs` VALUES ('362', 'order', 'admin', '1', '平台售后已审核', '1532508323');
INSERT INTO `es_admin_logs` VALUES ('363', 'order', 'admin', '1', '平台售后已审核', '1532508334');
INSERT INTO `es_admin_logs` VALUES ('364', 'order', 'admin', '1', '退款单ID为24的退款单由admin已确认退款,退款金额：0.01', '1532508371');
INSERT INTO `es_admin_logs` VALUES ('365', 'order', 'admin', '1', '退款单ID为23的退款单由admin已确认退款,退款金额：0.01', '1532508790');
INSERT INTO `es_admin_logs` VALUES ('366', 'order', 'admin', '1', '订单ID为153250893553由会员[test]申请退款,金额：0.01', '1532508979');
INSERT INTO `es_admin_logs` VALUES ('367', 'order', 'admin', '1', '平台售后已审核', '1532508991');
INSERT INTO `es_admin_logs` VALUES ('368', 'order', 'admin', '1', '退款单ID为25的退款单由admin已确认退款,退款金额：0.01', '1532509190');
INSERT INTO `es_admin_logs` VALUES ('369', 'order', 'admin', '1', '订单ID为153250923111由会员[test]申请退款,金额：0.01', '1532509304');
INSERT INTO `es_admin_logs` VALUES ('370', 'order', 'admin', '1', '平台售后已审核', '1532509315');
INSERT INTO `es_admin_logs` VALUES ('371', 'order', 'admin', '1', '退款单ID为26的退款单由admin已确认退款,退款金额：0.01', '1532509368');
INSERT INTO `es_admin_logs` VALUES ('372', 'order', 'admin', '1', '平台售后已审核', '1532509730');
INSERT INTO `es_admin_logs` VALUES ('373', 'order', 'admin', '1', '退款单ID为27的退款单由admin已确认退款,退款金额：0.01', '1532509754');
INSERT INTO `es_admin_logs` VALUES ('374', 'order', 'admin', '1', '平台售后已审核', '1532510014');
INSERT INTO `es_admin_logs` VALUES ('375', 'order', 'admin', '1', '退款单ID为28的退款单由admin已确认退款,退款金额：0.01', '1532510025');
INSERT INTO `es_admin_logs` VALUES ('376', 'order', 'admin', '1', '订单ID为153251007081由会员[test]申请退款,金额：0.01', '1532510094');
INSERT INTO `es_admin_logs` VALUES ('377', 'order', 'admin', '1', '平台售后已审核', '1532510107');
INSERT INTO `es_admin_logs` VALUES ('378', 'order', 'admin', '1', '退款单ID为29的退款单由admin已确认退款,退款金额：0.01', '1532510114');
INSERT INTO `es_admin_logs` VALUES ('379', 'order', 'admin', '1', '订单ID为153251038819由会员[test]申请退款,金额：0.01', '1532510457');
INSERT INTO `es_admin_logs` VALUES ('380', 'order', 'admin', '1', '平台售后已审核', '1532510471');
INSERT INTO `es_admin_logs` VALUES ('381', 'order', 'admin', '1', '退款单ID为30的退款单由admin已确认退款,退款金额：0.01', '1532510496');
INSERT INTO `es_admin_logs` VALUES ('382', 'order', 'admin', '1', '订单ID为153251066383由会员[test]申请退款,金额：0.02', '1532510878');
INSERT INTO `es_admin_logs` VALUES ('383', 'order', 'admin', '1', '平台售后已审核', '1532510891');
INSERT INTO `es_admin_logs` VALUES ('384', 'order', 'admin', '1', '退款单ID为31的退款单由admin已确认退款,退款金额：0.02', '1532510931');
INSERT INTO `es_admin_logs` VALUES ('385', 'order', 'admin', '1', '订单ID为153251103488由会员[test]申请退款,金额：0.01', '1532511087');
INSERT INTO `es_admin_logs` VALUES ('386', 'order', 'admin', '1', '平台售后已审核', '1532511097');
INSERT INTO `es_admin_logs` VALUES ('387', 'order', 'admin', '1', '退款单ID为32的退款单由admin已确认退款,退款金额：0.01', '1532511117');
INSERT INTO `es_admin_logs` VALUES ('388', 'order', 'admin', '1', '订单ID为153251161594由会员[test]申请退款,金额：0.01', '1532511692');
INSERT INTO `es_admin_logs` VALUES ('389', 'order', 'admin', '1', '平台售后已审核', '1532511701');
INSERT INTO `es_admin_logs` VALUES ('390', 'order', 'admin', '1', '退款单ID为33的退款单由admin已确认退款,退款金额：0.01', '1532511718');
INSERT INTO `es_admin_logs` VALUES ('391', 'order', 'admin', '1', '订单ID为153251270915由会员[test]申请退款,金额：0.01', '1532512792');
INSERT INTO `es_admin_logs` VALUES ('392', 'order', 'admin', '1', '平台售后已审核', '1532512799');
INSERT INTO `es_admin_logs` VALUES ('393', 'order', 'admin', '1', '退款单ID为34的退款单由admin已确认退款,退款金额：0.01', '1532513107');
INSERT INTO `es_admin_logs` VALUES ('394', 'order', 'admin', '1', '订单ID为153251316134由会员[test]申请退款,金额：0.02', '1532513214');
INSERT INTO `es_admin_logs` VALUES ('395', 'order', 'admin', '1', '平台售后已审核', '1532513235');
INSERT INTO `es_admin_logs` VALUES ('396', 'order', 'admin', '1', '退款单ID为35的退款单由admin已确认退款,退款金额：0.02', '1532513382');
INSERT INTO `es_admin_logs` VALUES ('397', 'goods', 'admin', '1', '添加了一个商品类别名为lv2的商品类别', '1532515326');
INSERT INTO `es_admin_logs` VALUES ('398', 'goods', 'admin', '1', '添加了一个商品类别名为lv3的商品类别', '1532515332');
INSERT INTO `es_admin_logs` VALUES ('399', 'goods', 'admin', '1', '更新商品类别名为lv3的商品类别', '1532515486');
INSERT INTO `es_admin_logs` VALUES ('400', 'setting', 'admin', '1', '更新所有系统设置', '1532577436');
INSERT INTO `es_admin_logs` VALUES ('401', 'setting', 'admin', '1', '更新所有系统设置', '1532583349');
INSERT INTO `es_admin_logs` VALUES ('402', 'setting', 'admin', '1', '更新所有系统设置', '1532583495');
INSERT INTO `es_admin_logs` VALUES ('403', 'setting', 'admin', '1', '更新所有系统设置', '1532583625');
INSERT INTO `es_admin_logs` VALUES ('404', 'setting', 'admin', '1', '更新所有系统设置', '1532583660');
INSERT INTO `es_admin_logs` VALUES ('405', 'setting', 'admin', '1', '更新所有系统设置', '1532583673');
INSERT INTO `es_admin_logs` VALUES ('406', 'setting', 'admin', '1', '添加一个名为代加工的菜单项', '1532584048');
INSERT INTO `es_admin_logs` VALUES ('407', 'setting', 'admin', '1', '添加一个名为客户管理的菜单项', '1532584236');
INSERT INTO `es_admin_logs` VALUES ('408', 'setting', 'admin', '1', '修改了名为客户管理的菜单项信息', '1532584258');
INSERT INTO `es_admin_logs` VALUES ('409', 'setting', 'admin', '1', '修改了名为商品管理的菜单项信息', '1532584307');
INSERT INTO `es_admin_logs` VALUES ('410', 'setting', 'admin', '1', '修改了名为客户管理的菜单项信息', '1532584345');
INSERT INTO `es_admin_logs` VALUES ('411', 'setting', 'admin', '1', '修改了名为代加工的菜单项信息', '1532584352');
INSERT INTO `es_admin_logs` VALUES ('412', 'setting', 'admin', '1', '修改了名为代加工的菜单项信息', '1532584369');
INSERT INTO `es_admin_logs` VALUES ('413', 'setting', 'admin', '1', '修改了名为客户管理的菜单项信息', '1532584378');
INSERT INTO `es_admin_logs` VALUES ('414', 'setting', 'admin', '1', '添加一个名为客户列表的菜单项', '1532584524');
INSERT INTO `es_admin_logs` VALUES ('415', 'setting', 'admin', '1', '修改了名为客户管理的菜单项信息', '1532584532');
INSERT INTO `es_admin_logs` VALUES ('416', 'setting', 'admin', '1', '添加一个名为商品管理的菜单项', '1532584621');
INSERT INTO `es_admin_logs` VALUES ('417', 'setting', 'admin', '1', '添加一个名为商品列表的菜单项', '1532584660');
INSERT INTO `es_admin_logs` VALUES ('418', 'setting', 'admin', '1', '修改了名为商品管理的菜单项信息', '1532584667');
INSERT INTO `es_admin_logs` VALUES ('419', 'setting', 'admin', '1', '添加一个名为订单管理的菜单项', '1532584692');
INSERT INTO `es_admin_logs` VALUES ('420', 'setting', 'admin', '1', '添加一个名为未发货订单列表的菜单项', '1532584743');
INSERT INTO `es_admin_logs` VALUES ('421', 'setting', 'admin', '1', '添加一个名为已发货订单列表的菜单项', '1532584915');
INSERT INTO `es_admin_logs` VALUES ('422', 'setting', 'admin', '1', '修改了名为客户列表的菜单项信息', '1532584932');
INSERT INTO `es_admin_logs` VALUES ('423', 'setting', 'admin', '1', '修改了名为商品列表的菜单项信息', '1532584940');
INSERT INTO `es_admin_logs` VALUES ('424', 'setting', 'admin', '1', '修改了名为未发货订单列表的菜单项信息', '1532584948');
INSERT INTO `es_admin_logs` VALUES ('425', 'setting', 'admin', '1', '修改了名为已发货订单列表的菜单项信息', '1532584956');
INSERT INTO `es_admin_logs` VALUES ('426', 'order', 'admin', '1', '平台售后已审核', '1532587048');
INSERT INTO `es_admin_logs` VALUES ('427', 'order', 'admin', '1', '订单ID为153258747819由会员[llll]申请退款,金额：0.01', '1532587523');
INSERT INTO `es_admin_logs` VALUES ('428', 'order', 'admin', '1', '平台售后已审核', '1532587533');
INSERT INTO `es_admin_logs` VALUES ('429', 'order', 'admin', '1', '退款单ID为36的退款单由admin已确认退款,退款金额：0.17', '1532591100');
INSERT INTO `es_admin_logs` VALUES ('430', 'order', 'admin', '1', '退款单ID为37的退款单由admin已确认退款,退款金额：0.01', '1532591115');
INSERT INTO `es_admin_logs` VALUES ('431', 'setting', 'admin', '1', '更新所有系统设置', '1532599937');
INSERT INTO `es_admin_logs` VALUES ('432', 'setting', 'admin', '1', '修改了名为已发货订单列表的菜单项信息', '1532671265');
INSERT INTO `es_admin_logs` VALUES ('433', 'setting', 'admin', '1', '添加一个名为快递配置管理的菜单项', '1532683853');
INSERT INTO `es_admin_logs` VALUES ('434', 'setting', 'admin', '1', '修改了名为快递配置管理的菜单项信息', '1532683885');
INSERT INTO `es_admin_logs` VALUES ('435', 'setting', 'admin', '1', '添加一个名为快递配置列表的菜单项', '1532683919');
INSERT INTO `es_admin_logs` VALUES ('436', 'setting', 'admin', '1', '修改了名为快递配置管理的菜单项信息', '1532683928');
INSERT INTO `es_admin_logs` VALUES ('437', 'setting', 'admin', '1', '更新所有系统设置', '1532917175');
INSERT INTO `es_admin_logs` VALUES ('438', 'goods', 'admin', '1', '添加了一个商品名为测试商品11的商品', '1532948037');

-- ----------------------------
-- Table structure for es_admintheme
-- ----------------------------
DROP TABLE IF EXISTS `es_admintheme`;
CREATE TABLE `es_admintheme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) DEFAULT NULL,
  `siteid` int(11) DEFAULT NULL,
  `themename` varchar(50) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `framemode` int(6) DEFAULT '0',
  `deleteflag` int(6) DEFAULT '0',
  `thumb` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_admintheme
-- ----------------------------
INSERT INTO `es_admintheme` VALUES ('1', null, null, '新模板', 'version3', null, null, null, '0', '0', 'preview.png');

-- ----------------------------
-- Table structure for es_adminuser
-- ----------------------------
DROP TABLE IF EXISTS `es_adminuser`;
CREATE TABLE `es_adminuser` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `state` int(6) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `userno` varchar(255) DEFAULT NULL,
  `userdept` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `dateline` int(11) DEFAULT NULL,
  `founder` int(8) DEFAULT NULL,
  `siteid` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_adminuser
-- ----------------------------
INSERT INTO `es_adminuser` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1', null, null, null, null, null, '1', null);
INSERT INTO `es_adminuser` VALUES ('2', 'chanpin', 'e10adc3949ba59abbe56e057f20f883e', '1', null, null, null, null, null, '0', null);
INSERT INTO `es_adminuser` VALUES ('3', 'kuguan', 'e10adc3949ba59abbe56e057f20f883e', '1', null, null, null, null, null, '0', null);
INSERT INTO `es_adminuser` VALUES ('4', 'caiwu', 'e10adc3949ba59abbe56e057f20f883e', '1', null, null, null, null, null, '0', null);
INSERT INTO `es_adminuser` VALUES ('5', 'kefu', 'e10adc3949ba59abbe56e057f20f883e', '1', null, null, null, null, null, '0', null);

-- ----------------------------
-- Table structure for es_adv
-- ----------------------------
DROP TABLE IF EXISTS `es_adv`;
CREATE TABLE `es_adv` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `acid` bigint(20) DEFAULT NULL,
  `atype` int(11) DEFAULT NULL,
  `begintime` bigint(20) DEFAULT NULL,
  `endtime` bigint(20) DEFAULT NULL,
  `isclose` int(11) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `atturl` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `aname` varchar(255) DEFAULT NULL,
  `clickcount` int(11) DEFAULT '0',
  `linkman` varchar(50) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `disabled` varchar(5) DEFAULT 'false',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_adv
-- ----------------------------
INSERT INTO `es_adv` VALUES ('1', '1', null, null, null, '0', null, 'fs:/attachment/adv/2018/7/17/16//13014591.png', 'search-cat-86.html', '热卖了！', '0', null, null, null, 'false');
INSERT INTO `es_adv` VALUES ('2', '1', null, null, null, '0', null, 'fs:/attachment/adv/2018/7/17/16//12538899.jpg', 'index.html', '贱卖了！', '0', null, null, null, 'false');

-- ----------------------------
-- Table structure for es_advance_logs
-- ----------------------------
DROP TABLE IF EXISTS `es_advance_logs`;
CREATE TABLE `es_advance_logs` (
  `log_id` int(8) NOT NULL AUTO_INCREMENT,
  `member_id` int(8) NOT NULL,
  `money` decimal(20,2) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `mtime` bigint(20) NOT NULL,
  `payment_id` varchar(20) DEFAULT NULL,
  `order_id` varchar(20) DEFAULT NULL,
  `paymethod` varchar(100) DEFAULT NULL,
  `memo` varchar(100) DEFAULT NULL,
  `import_money` decimal(20,2) NOT NULL DEFAULT '0.00',
  `explode_money` decimal(20,2) NOT NULL DEFAULT '0.00',
  `member_advance` decimal(20,2) NOT NULL DEFAULT '0.00',
  `shop_advance` decimal(20,2) NOT NULL DEFAULT '0.00',
  `disabled` varchar(5) NOT NULL DEFAULT 'false',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_advance_logs
-- ----------------------------

-- ----------------------------
-- Table structure for es_agent
-- ----------------------------
DROP TABLE IF EXISTS `es_agent`;
CREATE TABLE `es_agent` (
  `agentid` int(10) NOT NULL AUTO_INCREMENT,
  `parentid` int(10) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `sex` int(6) DEFAULT '0',
  `zip` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `ww` varchar(50) DEFAULT NULL,
  `msn` varchar(50) DEFAULT NULL,
  `id_card` varchar(50) DEFAULT NULL,
  `bank_account` varchar(50) DEFAULT NULL,
  `bank_username` varchar(50) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `bank_city` varchar(50) DEFAULT NULL,
  `shop_url` varchar(50) DEFAULT NULL,
  `state` int(6) DEFAULT '0',
  `dateline` int(10) DEFAULT NULL,
  PRIMARY KEY (`agentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_agent
-- ----------------------------

-- ----------------------------
-- Table structure for es_agent_transfer
-- ----------------------------
DROP TABLE IF EXISTS `es_agent_transfer`;
CREATE TABLE `es_agent_transfer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `memberid` int(10) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `is_transfer` int(8) DEFAULT NULL,
  `blank_account` varchar(50) DEFAULT NULL,
  `blank_username` varchar(50) DEFAULT NULL,
  `blank_name` varchar(50) DEFAULT NULL,
  `blank_city` varchar(50) DEFAULT NULL,
  `apply_time` int(11) DEFAULT NULL,
  `transfer_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_agent_transfer
-- ----------------------------

-- ----------------------------
-- Table structure for es_allocation_item
-- ----------------------------
DROP TABLE IF EXISTS `es_allocation_item`;
CREATE TABLE `es_allocation_item` (
  `allocationid` int(10) NOT NULL AUTO_INCREMENT,
  `itemid` int(10) DEFAULT NULL,
  `orderid` int(10) DEFAULT NULL,
  `depotid` int(10) DEFAULT NULL,
  `goodsid` int(10) DEFAULT NULL,
  `productid` int(10) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  `other` longtext,
  `iscmpl` int(8) DEFAULT '0',
  PRIMARY KEY (`allocationid`),
  KEY `es_allocation_item` (`orderid`,`itemid`,`depotid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_allocation_item
-- ----------------------------

-- ----------------------------
-- Table structure for es_article
-- ----------------------------
DROP TABLE IF EXISTS `es_article`;
CREATE TABLE `es_article` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `create_time` bigint(20) DEFAULT NULL,
  `cat_id` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_article
-- ----------------------------

-- ----------------------------
-- Table structure for es_article_cat
-- ----------------------------
DROP TABLE IF EXISTS `es_article_cat`;
CREATE TABLE `es_article_cat` (
  `cat_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `parent_id` int(8) DEFAULT NULL,
  `cat_path` varchar(200) DEFAULT NULL,
  `cat_order` int(5) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_article_cat
-- ----------------------------

-- ----------------------------
-- Table structure for es_auth_action
-- ----------------------------
DROP TABLE IF EXISTS `es_auth_action`;
CREATE TABLE `es_auth_action` (
  `actid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `objvalue` longtext,
  `choose` int(11) DEFAULT NULL,
  PRIMARY KEY (`actid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_auth_action
-- ----------------------------
INSERT INTO `es_auth_action` VALUES ('1', '超级管理员', 'menu', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,127,128,129,31,32,33,34,35,36,37,38,39,40,41,42,43,44,133,134,45,46,47,48,49,50,51,52,130,131,132,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,135,136,137,138,139,140,141,142', '1');
INSERT INTO `es_auth_action` VALUES ('2', '商品管理权限', 'menu', '1,2,3,4,5,6,7,8,9,10,11,12,13,14', '1');
INSERT INTO `es_auth_action` VALUES ('3', '订单管理权限', 'menu', '15,16,17,18,19,20,21,22,23,24,25', '1');
INSERT INTO `es_auth_action` VALUES ('4', '库管权限', 'menu', '1,2,3,5,6,15,16,19,23', '1');
INSERT INTO `es_auth_action` VALUES ('5', '财务权限', 'menu', '2,17,18,19', '1');
INSERT INTO `es_auth_action` VALUES ('6', '客服权限', 'menu', '1,13,14,16,17,28,29,30,31,32,33,34', '1');

-- ----------------------------
-- Table structure for es_bonus_goods
-- ----------------------------
DROP TABLE IF EXISTS `es_bonus_goods`;
CREATE TABLE `es_bonus_goods` (
  `rel_id` int(10) NOT NULL AUTO_INCREMENT,
  `bonus_type_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_bonus_goods
-- ----------------------------

-- ----------------------------
-- Table structure for es_bonus_rule
-- ----------------------------
DROP TABLE IF EXISTS `es_bonus_rule`;
CREATE TABLE `es_bonus_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `begin_money` decimal(10,2) DEFAULT NULL,
  `end_money` decimal(10,2) DEFAULT NULL,
  `percentage` decimal(8,4) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_bonus_rule
-- ----------------------------
INSERT INTO `es_bonus_rule` VALUES ('1', '1000.00', '2000.00', '0.0300', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('2', '35000.00', '50000.00', '0.1400', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('3', '50000.00', '70000.00', '0.1600', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('4', '70000.00', '95000.00', '0.1800', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('5', '95000.00', '125000.00', '0.2000', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('6', '125000.00', '250000.00', '0.2400', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('7', '250000.00', '500000.00', '0.2450', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('8', '500000.00', '1000000.00', '0.2500', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('9', '1000000.00', '2000000.00', '0.2550', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('10', '2000000.00', '4000000.00', '0.2600', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('11', '4000000.00', '8000000.00', '0.2650', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('12', '2000.00', '4000.00', '0.0400', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('13', '8000000.00', '16000000.00', '0.2700', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('14', '16000000.00', '32000000.00', '0.2750', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('15', '32000000.00', '64000000.00', '0.2800', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('16', '4000.00', '6000.00', '0.0500', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('17', '6000.00', '8000.00', '0.0600', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('18', '8000.00', '10000.00', '0.0700', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('19', '10000.00', '15000.00', '0.0800', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('20', '15000.00', '20000.00', '0.0900', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('21', '20000.00', '25000.00', '0.1000', '2018-07-19 11:48:14', '2018-07-19 11:48:14');
INSERT INTO `es_bonus_rule` VALUES ('22', '25000.00', '35000.00', '0.1200', '2018-07-19 11:48:14', '2018-07-19 11:48:14');

-- ----------------------------
-- Table structure for es_bonus_type
-- ----------------------------
DROP TABLE IF EXISTS `es_bonus_type`;
CREATE TABLE `es_bonus_type` (
  `type_id` int(8) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(60) DEFAULT NULL,
  `type_money` decimal(10,2) DEFAULT NULL,
  `send_type` int(8) DEFAULT NULL,
  `min_amount` decimal(10,2) DEFAULT NULL,
  `max_amount` decimal(10,2) DEFAULT NULL,
  `send_start_date` int(11) DEFAULT NULL,
  `send_end_date` int(11) DEFAULT NULL,
  `use_start_date` int(11) DEFAULT NULL,
  `use_end_date` int(11) DEFAULT NULL,
  `min_goods_amount` decimal(10,2) DEFAULT NULL,
  `recognition` varchar(20) DEFAULT NULL,
  `create_num` int(10) DEFAULT NULL,
  `use_num` int(10) DEFAULT '0',
  `received_num` int(10) DEFAULT '0',
  `belong` int(10) DEFAULT '0',
  `can_be_edit` smallint(1) DEFAULT '0',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_bonus_type
-- ----------------------------

-- ----------------------------
-- Table structure for es_brand
-- ----------------------------
DROP TABLE IF EXISTS `es_brand`;
CREATE TABLE `es_brand` (
  `brand_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `keywords` longtext,
  `brief` longtext,
  `url` varchar(255) DEFAULT NULL,
  `disabled` int(8) DEFAULT NULL,
  `ordernum` int(10) DEFAULT '0',
  PRIMARY KEY (`brand_id`),
  KEY `ind_brand` (`disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_brand
-- ----------------------------
INSERT INTO `es_brand` VALUES ('1', '阿里达斯', 'http://localhost:8080/statics/attachment/brand/2018/7/16/18//29545844.png', null, null, 'http://alidasi.com', '0', '0');

-- ----------------------------
-- Table structure for es_cart
-- ----------------------------
DROP TABLE IF EXISTS `es_cart`;
CREATE TABLE `es_cart` (
  `cart_id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_id` int(9) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `itemtype` int(8) DEFAULT '0',
  `num` int(8) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `session_id` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `addon` longtext,
  `activity_id` int(10) DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `is_check` smallint(1) DEFAULT '0',
  `is_change` smallint(1) DEFAULT '0',
  `activity_end_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `ind_cart_sessionid` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_cart
-- ----------------------------
INSERT INTO `es_cart` VALUES ('1', '1', '1', '0', '1', '0.00', 'C5FD26F339352AB6CD607289A887A311', '测试商品', '0.01', null, null, null, '1', '1', null);
INSERT INTO `es_cart` VALUES ('9', '1', '1', '0', '1', '0.00', '1203210EBA0D194464DFB3426AE283D4', '测试商品', '0.01', null, null, null, '1', '1', null);
INSERT INTO `es_cart` VALUES ('10', '1', '1', '0', '2', '0.00', 'D6A7D295CEEF7490B180D552B828F06C', '测试商品', '0.01', null, null, null, '1', '1', null);
INSERT INTO `es_cart` VALUES ('12', '1', '1', '0', '1', '0.00', 'C560B76CBA48D5F70991D6B4041E5D3B', '测试商品', '0.01', null, null, null, '1', '1', null);

-- ----------------------------
-- Table structure for es_comments
-- ----------------------------
DROP TABLE IF EXISTS `es_comments`;
CREATE TABLE `es_comments` (
  `comment_id` int(8) NOT NULL AUTO_INCREMENT,
  `for_comment_id` int(8) DEFAULT NULL,
  `object_id` int(8) NOT NULL,
  `object_type` varchar(50) NOT NULL DEFAULT 'ask',
  `author_id` int(8) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `levelname` varchar(50) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `mem_read_status` varchar(5) NOT NULL DEFAULT 'false',
  `adm_read_status` varchar(5) NOT NULL DEFAULT 'false',
  `time` bigint(20) DEFAULT NULL,
  `lastreply` bigint(20) DEFAULT NULL,
  `reply_name` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `acomment` longtext,
  `ip` varchar(15) DEFAULT NULL,
  `display` varchar(5) NOT NULL DEFAULT 'false',
  `p_index` varchar(2) DEFAULT NULL,
  `disabled` varchar(5) DEFAULT 'false',
  `commenttype` varchar(50) DEFAULT NULL,
  `grade` int(10) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_comments
-- ----------------------------

-- ----------------------------
-- Table structure for es_component
-- ----------------------------
DROP TABLE IF EXISTS `es_component`;
CREATE TABLE `es_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `componentid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `install_state` int(8) DEFAULT '0',
  `enable_state` int(8) DEFAULT '0',
  `version` varchar(50) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `dmall_version` varchar(50) DEFAULT NULL,
  `description` longtext,
  `error_message` longtext,
  `sort_order` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_component
-- ----------------------------
INSERT INTO `es_component` VALUES ('1', 'goodsCoreComponent', '商品核心组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('2', 'depotComponent', '网店仓库组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('3', 'orderCoreComponent', '订单核心组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('4', 'paymentComponent', '支付组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('5', 'agentComponent', '代理组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('6', 'shopEmailComponent', '网店邮件组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('7', 'receiptComponent', '发票组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('8', 'goodsSearchComponent', '商品搜索过滤器组件', '1', '1', '2.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('9', 'shopShortMsgComponent', '网店短消息组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('10', 'shopMemberComponent', '网店会员组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('11', 'memeberPointComponent', '会员积分组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('12', 'visitedGoodsComponent', '浏览过的商品组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('13', 'cmsCoreComponent', 'CMS核心组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('14', 'galleryComponent', '新相册组件', '1', '1', '1.0', 'Dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('15', 'bonusComponent', '红包组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('16', 'shopExpressComponent', '网店快递组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('17', 'goodsSpecComponent', '商品规格组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('18', 'activityComponent', '网店促销活动组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('19', 'decorateComponent', '装修组件', '1', '1', '1.0', 'Dmall', '3.0.0', '', null, null);
INSERT INTO `es_component` VALUES ('20', 'baseComponent', 'base应用基础组件', '1', '1', '1.0', 'dmall', '3.0.0', '', null, null);

-- ----------------------------
-- Table structure for es_coupons
-- ----------------------------
DROP TABLE IF EXISTS `es_coupons`;
CREATE TABLE `es_coupons` (
  `cpns_id` int(8) NOT NULL AUTO_INCREMENT,
  `cpns_name` varchar(255) DEFAULT NULL,
  `cpns_sn` varchar(50) DEFAULT NULL,
  `cpns_status` varchar(1) DEFAULT '1',
  `cpns_type` varchar(1) DEFAULT '1',
  `disabled` varchar(5) DEFAULT 'false',
  `can_give` int(8) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `member_id_start` int(10) DEFAULT NULL,
  `member_id_end` int(10) DEFAULT NULL,
  `reg_time_start` int(10) DEFAULT NULL,
  `reg_time_end` int(10) DEFAULT NULL,
  `lv_ids` longtext,
  `lv_names` longtext,
  `end_time` int(11) DEFAULT NULL,
  `cat_ids` longtext,
  `cat_names` longtext,
  `goods_price` varchar(22) DEFAULT NULL,
  `discount_price` varchar(22) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `remark` longtext,
  `allcat` int(8) DEFAULT '0',
  PRIMARY KEY (`cpns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_coupons
-- ----------------------------

-- ----------------------------
-- Table structure for es_data_cat
-- ----------------------------
DROP TABLE IF EXISTS `es_data_cat`;
CREATE TABLE `es_data_cat` (
  `cat_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(8) DEFAULT NULL,
  `cat_path` varchar(255) DEFAULT NULL,
  `cat_order` int(5) DEFAULT NULL,
  `model_id` int(8) DEFAULT NULL,
  `if_audit` int(2) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `detail_url` varchar(255) DEFAULT NULL,
  `descript` longtext,
  `tositemap` int(8) DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_data_cat
-- ----------------------------
INSERT INTO `es_data_cat` VALUES ('1', '热门关键字', '0', '0|1|', '1', '1', null, 'newslist-1-1.html', '', null, '0');
INSERT INTO `es_data_cat` VALUES ('2', '帮助中心', '0', '0|2|', '2', '2', null, 'newslist-2-1.html', '', null, '0');
INSERT INTO `es_data_cat` VALUES ('17', '新手上路', '2', '0|2|17|', '500', '2', null, 'newslist-17-1.html', '', null, '0');
INSERT INTO `es_data_cat` VALUES ('18', '购物指南', '2', '0|2|18|', '510', '2', null, 'newslist-18-1.html', '', null, '0');
INSERT INTO `es_data_cat` VALUES ('19', '支付方式', '2', '0|2|19|', '520', '2', null, 'newslist-19-1.html', '', null, '0');
INSERT INTO `es_data_cat` VALUES ('20', '购物条款', '2', '0|2|20|', '530', '2', null, 'newslist-20-1.html', '', null, '0');
INSERT INTO `es_data_cat` VALUES ('21', '关于网站', '2', '0|2|21|', '400', '2', null, 'newslist-21-1.html', '', null, '0');
INSERT INTO `es_data_cat` VALUES ('22', '配送方式', '2', '0|2|22|', '600', '2', null, 'newslist-22-1.html', '', null, '0');
INSERT INTO `es_data_cat` VALUES ('23', '服务', '2', '0|2|23|', '610', '2', null, 'newslist-23-1.html', '', null, '0');
INSERT INTO `es_data_cat` VALUES ('24', '优惠活动', '2', '0|2|24|', '700', '2', null, 'newslist-24-1.html', '', null, '0');
INSERT INTO `es_data_cat` VALUES ('25', '我的订单', '2', '0|2|25|', '750', '2', null, 'newslist-25-1.html', '', null, '0');

-- ----------------------------
-- Table structure for es_data_field
-- ----------------------------
DROP TABLE IF EXISTS `es_data_field`;
CREATE TABLE `es_data_field` (
  `field_id` int(8) NOT NULL AUTO_INCREMENT,
  `china_name` varchar(255) DEFAULT NULL,
  `english_name` varchar(255) DEFAULT NULL,
  `data_type` int(11) DEFAULT NULL,
  `data_size` varchar(20) DEFAULT NULL,
  `show_form` varchar(255) DEFAULT NULL,
  `show_value` varchar(400) DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `model_id` int(8) DEFAULT NULL,
  `save_value` longtext,
  `is_validate` int(8) DEFAULT NULL,
  `taxis` int(4) DEFAULT NULL,
  `dict_id` int(8) DEFAULT NULL,
  `is_show` int(8) DEFAULT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_data_field
-- ----------------------------
INSERT INTO `es_data_field` VALUES ('1', '关键字', 'hot_searchword', null, null, 'input', null, '1330318246806', '1', '', '1', '1', null, '1');
INSERT INTO `es_data_field` VALUES ('2', 'url', 'url', null, null, 'input', null, '1330318278216', '1', '', '1', '2', null, '1');
INSERT INTO `es_data_field` VALUES ('3', '标题', 'title', null, null, 'input', null, '1330402514437', '2', '', '1', '1', null, '1');
INSERT INTO `es_data_field` VALUES ('4', '图片', 'image', null, null, 'image', null, '1330402560750', '2', '', '0', '2', null, '0');
INSERT INTO `es_data_field` VALUES ('5', '内容', 'content', null, null, 'richedit', null, '1330403222956', '2', '', '0', '3', null, '0');

-- ----------------------------
-- Table structure for es_data_model
-- ----------------------------
DROP TABLE IF EXISTS `es_data_model`;
CREATE TABLE `es_data_model` (
  `model_id` int(8) NOT NULL AUTO_INCREMENT,
  `china_name` varchar(255) DEFAULT NULL,
  `english_name` varchar(255) DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `brief` varchar(400) DEFAULT NULL,
  `if_audit` int(8) DEFAULT NULL,
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_data_model
-- ----------------------------
INSERT INTO `es_data_model` VALUES ('1', '热门关键字', 'hot_keyword', '1330317978678', null, '', '0');
INSERT INTO `es_data_model` VALUES ('2', '帮助中心', 'helpcenter', '1330402484834', null, '', '0');

-- ----------------------------
-- Table structure for es_delivery
-- ----------------------------
DROP TABLE IF EXISTS `es_delivery`;
CREATE TABLE `es_delivery` (
  `delivery_id` int(8) NOT NULL AUTO_INCREMENT,
  `type` varchar(1) DEFAULT NULL,
  `order_id` int(8) DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `money` decimal(20,2) DEFAULT NULL,
  `ship_type` varchar(255) DEFAULT NULL,
  `is_protect` varchar(4) DEFAULT NULL,
  `protect_price` decimal(20,2) DEFAULT NULL,
  `logi_id` int(8) DEFAULT NULL,
  `logi_name` varchar(255) DEFAULT NULL,
  `logi_no` varchar(255) DEFAULT NULL,
  `ship_name` varchar(255) DEFAULT NULL,
  `province_id` int(10) DEFAULT NULL,
  `city_id` int(10) DEFAULT NULL,
  `region_id` int(10) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `ship_addr` varchar(255) DEFAULT NULL,
  `ship_zip` varchar(50) DEFAULT NULL,
  `ship_tel` varchar(50) DEFAULT NULL,
  `ship_mobile` varchar(50) DEFAULT NULL,
  `ship_email` varchar(50) DEFAULT NULL,
  `op_name` varchar(255) DEFAULT NULL,
  `remark` longtext,
  `create_time` bigint(20) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `logi_code` varchar(255) DEFAULT NULL,
  `snapshot_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `ind_deliver_orderid` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_delivery
-- ----------------------------

-- ----------------------------
-- Table structure for es_delivery_item
-- ----------------------------
DROP TABLE IF EXISTS `es_delivery_item`;
CREATE TABLE `es_delivery_item` (
  `item_id` int(8) NOT NULL AUTO_INCREMENT,
  `delivery_id` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `sn` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `num` int(8) DEFAULT NULL,
  `itemtype` int(8) DEFAULT '0',
  `order_itemid` int(10) DEFAULT NULL,
  `depotId` int(10) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ind_delivery_item` (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_delivery_item
-- ----------------------------

-- ----------------------------
-- Table structure for es_depot
-- ----------------------------
DROP TABLE IF EXISTS `es_depot`;
CREATE TABLE `es_depot` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `choose` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_depot
-- ----------------------------
INSERT INTO `es_depot` VALUES ('1', '海淀仓库', '1');
INSERT INTO `es_depot` VALUES ('2', '朝阳仓库', '0');
INSERT INTO `es_depot` VALUES ('3', '昌平仓库', '0');

-- ----------------------------
-- Table structure for es_depot_user
-- ----------------------------
DROP TABLE IF EXISTS `es_depot_user`;
CREATE TABLE `es_depot_user` (
  `userid` int(10) NOT NULL,
  `depotid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_depot_user
-- ----------------------------

-- ----------------------------
-- Table structure for es_dly_area
-- ----------------------------
DROP TABLE IF EXISTS `es_dly_area`;
CREATE TABLE `es_dly_area` (
  `area_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_dly_area
-- ----------------------------

-- ----------------------------
-- Table structure for es_dly_center
-- ----------------------------
DROP TABLE IF EXISTS `es_dly_center`;
CREATE TABLE `es_dly_center` (
  `dly_center_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `province_id` int(10) DEFAULT NULL,
  `city_id` int(10) DEFAULT NULL,
  `region_id` int(10) DEFAULT NULL,
  `zip` varchar(6) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `uname` varchar(100) DEFAULT NULL,
  `cellphone` varchar(100) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `memo` longtext,
  `disabled` varchar(5) NOT NULL DEFAULT 'false',
  `choose` varchar(5) NOT NULL,
  PRIMARY KEY (`dly_center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_dly_center
-- ----------------------------

-- ----------------------------
-- Table structure for es_dly_type
-- ----------------------------
DROP TABLE IF EXISTS `es_dly_type`;
CREATE TABLE `es_dly_type` (
  `type_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `protect` int(8) DEFAULT NULL,
  `protect_rate` varchar(6) DEFAULT NULL,
  `has_cod` varchar(1) DEFAULT NULL,
  `min_price` varchar(10) DEFAULT NULL,
  `detail` longtext,
  `corp_id` int(8) DEFAULT NULL,
  `ordernum` int(10) DEFAULT NULL,
  `disabled` int(8) DEFAULT NULL,
  `is_same` int(8) DEFAULT '0',
  `config` longtext,
  `expressions` longtext,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_dly_type
-- ----------------------------
INSERT INTO `es_dly_type` VALUES ('1', '圆通速递', '0', '0.0', '0', '0.0', '<p>\r\n	测试用，请在后台修改</p>', '1', '1', '0', '1', '{\"continueprice\":10,\"continueunit\":1000,\"defAreaFee\":0,\"expression\":\"\",\"firstprice\":0,\"firstunit\":1000,\"have_cod\":0,\"is_same\":0,\"useexp\":0}', '0.0+tint(w-1000)/1000*10.0');
INSERT INTO `es_dly_type` VALUES ('2', '宅急送', '0', null, '0', null, '<p>\n	测试用，请在后台修改.</p>\n', '2', '2', '0', '1', '{\"continueprice\":5,\"continueunit\":1000,\"defAreaFee\":0,\"expression\":\"\",\"firstprice\":15,\"firstunit\":1000,\"have_cod\":0,\"is_same\":0,\"useexp\":0}', '15.0+tint(w-1000)/1000*5.0');

-- ----------------------------
-- Table structure for es_dly_type_area
-- ----------------------------
DROP TABLE IF EXISTS `es_dly_type_area`;
CREATE TABLE `es_dly_type_area` (
  `type_id` int(8) DEFAULT NULL,
  `area_id_group` longtext,
  `area_name_group` longtext,
  `expressions` longtext,
  `has_cod` int(8) DEFAULT NULL,
  `config` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_dly_type_area
-- ----------------------------

-- ----------------------------
-- Table structure for es_email_list
-- ----------------------------
DROP TABLE IF EXISTS `es_email_list`;
CREATE TABLE `es_email_list` (
  `email_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `email_type` varchar(255) DEFAULT NULL,
  `is_success` int(8) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `content` longtext,
  `error_num` int(6) DEFAULT NULL,
  `last_send` int(11) DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_email_list
-- ----------------------------
INSERT INTO `es_email_list` VALUES ('1', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://localhost\"><img src=\"http://localhost:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-18 11:13:10 成功提交了Dmall示例商城的订单 <a href=\"http://localhost/member/order_detail.html?ordersn=153188359010\" style=\"color:#0385DD;text-decoration:underline;\">153188359010</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://localhost/member/order_detail.html?ordersn=153188359010\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://localhost/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1531883590');
INSERT INTO `es_email_list` VALUES ('2', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://localhost\"><img src=\"http://localhost:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-18 15:49:06 成功提交了Dmall示例商城的订单 <a href=\"http://localhost/member/order_detail.html?ordersn=153190014661\" style=\"color:#0385DD;text-decoration:underline;\">153190014661</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://localhost/member/order_detail.html?ordersn=153190014661\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://localhost/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1531900146');
INSERT INTO `es_email_list` VALUES ('3', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://localhost\"><img src=\"http://localhost:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-18 16:29:49 成功提交了Dmall示例商城的订单 <a href=\"http://localhost/member/order_detail.html?ordersn=153190258997\" style=\"color:#0385DD;text-decoration:underline;\">153190258997</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://localhost/member/order_detail.html?ordersn=153190258997\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://localhost/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1531903022');
INSERT INTO `es_email_list` VALUES ('4', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://localhost\"><img src=\"http://localhost:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-19 11:21:56 成功提交了Dmall示例商城的订单 <a href=\"http://localhost/member/order_detail.html?ordersn=153197051641\" style=\"color:#0385DD;text-decoration:underline;\">153197051641</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://localhost/member/order_detail.html?ordersn=153197051641\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://localhost/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1531970516');
INSERT INTO `es_email_list` VALUES ('5', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://localhost\"><img src=\"http://localhost:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-19 15:01:22 成功提交了Dmall示例商城的订单 <a href=\"http://localhost/member/order_detail.html?ordersn=153198368240\" style=\"color:#0385DD;text-decoration:underline;\">153198368240</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://localhost/member/order_detail.html?ordersn=153198368240\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://localhost/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1531983682');
INSERT INTO `es_email_list` VALUES ('6', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://localhost\"><img src=\"http://localhost:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-19 15:02:33 成功提交了Dmall示例商城的订单 <a href=\"http://localhost/member/order_detail.html?ordersn=153198375333\" style=\"color:#0385DD;text-decoration:underline;\">153198375333</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://localhost/member/order_detail.html?ordersn=153198375333\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://localhost/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1531983753');
INSERT INTO `es_email_list` VALUES ('7', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://localhost\"><img src=\"http://localhost:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-19 15:03:28 成功提交了Dmall示例商城的订单 <a href=\"http://localhost/member/order_detail.html?ordersn=153198380875\" style=\"color:#0385DD;text-decoration:underline;\">153198380875</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://localhost/member/order_detail.html?ordersn=153198380875\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://localhost/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1531983808');
INSERT INTO `es_email_list` VALUES ('8', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://localhost\"><img src=\"http://localhost:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-19 15:04:45 成功提交了Dmall示例商城的订单 <a href=\"http://localhost/member/order_detail.html?ordersn=153198388558\" style=\"color:#0385DD;text-decoration:underline;\">153198388558</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://localhost/member/order_detail.html?ordersn=153198388558\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://localhost/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1531983934');
INSERT INTO `es_email_list` VALUES ('9', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://localhost\"><img src=\"http://localhost:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-19 15:06:58 成功提交了Dmall示例商城的订单 <a href=\"http://localhost/member/order_detail.html?ordersn=153198401889\" style=\"color:#0385DD;text-decoration:underline;\">153198401889</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://localhost/member/order_detail.html?ordersn=153198401889\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://localhost/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1531984018');
INSERT INTO `es_email_list` VALUES ('10', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://192.168.2.188\"><img src=\"http://192.168.2.188:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-23 18:00:21 成功提交了Dmall示例商城的订单 <a href=\"http://192.168.2.188/member/order_detail.html?ordersn=153234002117\" style=\"color:#0385DD;text-decoration:underline;\">153234002117</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://192.168.2.188/member/order_detail.html?ordersn=153234002117\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://192.168.2.188/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532340021');
INSERT INTO `es_email_list` VALUES ('11', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://192.168.2.188\"><img src=\"http://localhost:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-23 18:45:13 成功提交了Dmall示例商城的订单 <a href=\"http://192.168.2.188/member/order_detail.html?ordersn=153234271372\" style=\"color:#0385DD;text-decoration:underline;\">153234271372</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://192.168.2.188/member/order_detail.html?ordersn=153234271372\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://192.168.2.188/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532342713');
INSERT INTO `es_email_list` VALUES ('12', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://localhost\"><img src=\"http://localhost:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-24 11:26:23 成功提交了Dmall示例商城的订单 <a href=\"http://localhost/member/order_detail.html?ordersn=153240278372\" style=\"color:#0385DD;text-decoration:underline;\">153240278372</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://localhost/member/order_detail.html?ordersn=153240278372\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://localhost/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532402784');
INSERT INTO `es_email_list` VALUES ('13', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://localhost\"><img src=\"http://localhost:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-24 11:28:42 成功提交了Dmall示例商城的订单 <a href=\"http://localhost/member/order_detail.html?ordersn=153240292257\" style=\"color:#0385DD;text-decoration:underline;\">153240292257</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://localhost/member/order_detail.html?ordersn=153240292257\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://localhost/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532402962');
INSERT INTO `es_email_list` VALUES ('14', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://dmall\"><img src=\"http://localhost:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-24 15:45:24 成功提交了Dmall示例商城的订单 <a href=\"http://dmall/member/order_detail.html?ordersn=153241832443\" style=\"color:#0385DD;text-decoration:underline;\">153241832443</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://dmall/member/order_detail.html?ordersn=153241832443\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://dmall/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532418324');
INSERT INTO `es_email_list` VALUES ('15', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://dmall\"><img src=\"http://localhost:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-24 15:49:05 成功提交了Dmall示例商城的订单 <a href=\"http://dmall/member/order_detail.html?ordersn=153241854525\" style=\"color:#0385DD;text-decoration:underline;\">153241854525</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://dmall/member/order_detail.html?ordersn=153241854525\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://dmall/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532418546');
INSERT INTO `es_email_list` VALUES ('16', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://localhost\"><img src=\"http://localhost:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-24 16:04:39 成功提交了Dmall示例商城的订单 <a href=\"http://localhost/member/order_detail.html?ordersn=153241947968\" style=\"color:#0385DD;text-decoration:underline;\">153241947968</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://localhost/member/order_detail.html?ordersn=153241947968\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://localhost/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532419480');
INSERT INTO `es_email_list` VALUES ('17', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://localhost\"><img src=\"http://localhost:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 11:06:02 成功提交了Dmall示例商城的订单 <a href=\"http://localhost/member/order_detail.html?ordersn=153248796249\" style=\"color:#0385DD;text-decoration:underline;\">153248796249</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://localhost/member/order_detail.html?ordersn=153248796249\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://localhost/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532487963');
INSERT INTO `es_email_list` VALUES ('18', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://192.168.2.164\"><img src=\"http://192.168.2.164:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 11:09:33 成功提交了Dmall示例商城的订单 <a href=\"http://192.168.2.164/member/order_detail.html?ordersn=153248817322\" style=\"color:#0385DD;text-decoration:underline;\">153248817322</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://192.168.2.164/member/order_detail.html?ordersn=153248817322\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://192.168.2.164/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532488173');
INSERT INTO `es_email_list` VALUES ('19', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://192.168.2.164\"><img src=\"http://192.168.2.164:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 11:15:39 成功提交了Dmall示例商城的订单 <a href=\"http://192.168.2.164/member/order_detail.html?ordersn=153248853920\" style=\"color:#0385DD;text-decoration:underline;\">153248853920</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://192.168.2.164/member/order_detail.html?ordersn=153248853920\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://192.168.2.164/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532488539');
INSERT INTO `es_email_list` VALUES ('20', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://192.168.2.164\"><img src=\"http://192.168.2.164:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 11:25:27 成功提交了Dmall示例商城的订单 <a href=\"http://192.168.2.164/member/order_detail.html?ordersn=153248912777\" style=\"color:#0385DD;text-decoration:underline;\">153248912777</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://192.168.2.164/member/order_detail.html?ordersn=153248912777\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://192.168.2.164/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532489128');
INSERT INTO `es_email_list` VALUES ('21', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://192.168.2.164\"><img src=\"http://192.168.2.164:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 11:27:16 成功提交了Dmall示例商城的订单 <a href=\"http://192.168.2.164/member/order_detail.html?ordersn=153248923672\" style=\"color:#0385DD;text-decoration:underline;\">153248923672</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://192.168.2.164/member/order_detail.html?ordersn=153248923672\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://192.168.2.164/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532489236');
INSERT INTO `es_email_list` VALUES ('22', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://192.168.2.164\"><img src=\"http://192.168.2.164:80/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 11:42:50 成功提交了Dmall示例商城的订单 <a href=\"http://192.168.2.164/member/order_detail.html?ordersn=153249017031\" style=\"color:#0385DD;text-decoration:underline;\">153249017031</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://192.168.2.164/member/order_detail.html?ordersn=153249017031\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://192.168.2.164/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532490170');
INSERT INTO `es_email_list` VALUES ('23', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 13:35:50 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153249695075\" style=\"color:#0385DD;text-decoration:underline;\">153249695075</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153249695075\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532496950');
INSERT INTO `es_email_list` VALUES ('24', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 14:03:39 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153249861933\" style=\"color:#0385DD;text-decoration:underline;\">153249861933</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153249861933\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532498619');
INSERT INTO `es_email_list` VALUES ('25', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 14:53:26 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153250160685\" style=\"color:#0385DD;text-decoration:underline;\">153250160685</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153250160685\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532501606');
INSERT INTO `es_email_list` VALUES ('26', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 14:57:00 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153250182042\" style=\"color:#0385DD;text-decoration:underline;\">153250182042</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153250182042\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532501820');
INSERT INTO `es_email_list` VALUES ('27', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 16:55:35 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153250893553\" style=\"color:#0385DD;text-decoration:underline;\">153250893553</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153250893553\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532508936');
INSERT INTO `es_email_list` VALUES ('28', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 17:00:31 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153250923111\" style=\"color:#0385DD;text-decoration:underline;\">153250923111</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153250923111\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532509231');
INSERT INTO `es_email_list` VALUES ('29', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 17:07:39 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153250965936\" style=\"color:#0385DD;text-decoration:underline;\">153250965936</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153250965936\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532509659');
INSERT INTO `es_email_list` VALUES ('30', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 17:12:28 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153250994856\" style=\"color:#0385DD;text-decoration:underline;\">153250994856</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153250994856\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532509949');
INSERT INTO `es_email_list` VALUES ('31', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 17:14:30 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251007081\" style=\"color:#0385DD;text-decoration:underline;\">153251007081</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251007081\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532510070');
INSERT INTO `es_email_list` VALUES ('32', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 17:17:40 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251026057\" style=\"color:#0385DD;text-decoration:underline;\">153251026057</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251026057\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532510260');
INSERT INTO `es_email_list` VALUES ('33', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 17:17:40 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251026086\" style=\"color:#0385DD;text-decoration:underline;\">153251026086</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251026086\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532510275');
INSERT INTO `es_email_list` VALUES ('34', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 17:19:48 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251038819\" style=\"color:#0385DD;text-decoration:underline;\">153251038819</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251038819\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532510388');
INSERT INTO `es_email_list` VALUES ('35', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 17:22:33 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251055316\" style=\"color:#0385DD;text-decoration:underline;\">153251055316</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251055316\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532510553');
INSERT INTO `es_email_list` VALUES ('36', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 17:24:23 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251066383\" style=\"color:#0385DD;text-decoration:underline;\">153251066383</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251066383\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532510663');
INSERT INTO `es_email_list` VALUES ('37', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 17:30:34 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251103488\" style=\"color:#0385DD;text-decoration:underline;\">153251103488</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251103488\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532511034');
INSERT INTO `es_email_list` VALUES ('38', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 17:40:15 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251161594\" style=\"color:#0385DD;text-decoration:underline;\">153251161594</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251161594\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532511615');
INSERT INTO `es_email_list` VALUES ('39', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 17:58:29 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251270915\" style=\"color:#0385DD;text-decoration:underline;\">153251270915</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251270915\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532512709');
INSERT INTO `es_email_list` VALUES ('40', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 18:06:01 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251316134\" style=\"color:#0385DD;text-decoration:underline;\">153251316134</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251316134\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532513161');
INSERT INTO `es_email_list` VALUES ('41', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://pengqi.51vip.biz:20035\"><img src=\"http://pengqi.51vip.biz:20035//statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-25 19:07:02 成功提交了Dmall示例商城的订单 <a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251682238\" style=\"color:#0385DD;text-decoration:underline;\">153251682238</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://pengqi.51vip.biz:20035/member/order_detail.html?ordersn=153251682238\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://pengqi.51vip.biz:20035/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532516822');
INSERT INTO `es_email_list` VALUES ('42', '订单提交成功--Dmall示例商城', '新订单成功提醒', '1', 'xx@mail.com', '<table width=\"832\" border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\" style=\" margin-left:25px;\">\r\n  <tr>\r\n        <td height=\"60\" style=\"border-bottom:1px solid #c8c8c8;\"><a href=\"http://localhost\"><img src=\"http://localhost/statics//images/logo.gif\" border=\"0\" /></a></td>\r\n  </tr>\r\n      <tr>\r\n        <td height=\"10\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" style=\"line-height:30px;\">亲爱的test：</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">您在2018-07-30 11:23:59 成功提交了Dmall示例商城的订单 <a href=\"http://localhost/member/order_detail.html?ordersn=153292103939\" style=\"color:#0385DD;text-decoration:underline;\">153292103939</a>，我们将尽快为您配送发货！</td>\r\n      </tr>\r\n      <tr>\r\n      	<td height=\"15\" align=\"left\" style=\"line-height:30px;\"></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"20\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold;\"><a href=\"http://localhost/member/order_detail.html?ordersn=153292103939\" style=\"color:#da6d00; text-decoration:underline;\">点此查看订单详情</a></td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">如果无法点击此链接，您也可以登录<a href=\"http://localhost/member/member.html\" style=\"color:#bc0404; font-weight:bold;\">会员中心</a>查看订单详情。</td>\r\n      </tr>\r\n\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px;\">本邮件为Dmall示例商城系统发出，请勿直接回复。</td>\r\n      </tr>\r\n      <tr>\r\n        <td height=\"30\" align=\"left\" style=\"line-height:30px; font-size:14px; font-weight:bold; color:#3d3d3d;\">感谢您的信任与支持，祝您购物愉快！</td>\r\n      </tr>\r\n    </table>\r\n', '0', '1532921040');

-- ----------------------------
-- Table structure for es_express_platform
-- ----------------------------
DROP TABLE IF EXISTS `es_express_platform`;
CREATE TABLE `es_express_platform` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `platform_name` varchar(50) DEFAULT NULL,
  `is_open` int(8) DEFAULT NULL,
  `config` longtext,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_express_platform
-- ----------------------------
INSERT INTO `es_express_platform` VALUES ('1', '快递100', '1', '{\'keyid\':\'92a25441fc46fded\',\'user\':\'0\'}', 'kuaidi100Plugin');
INSERT INTO `es_express_platform` VALUES ('2', 'showapi快递', null, null, 'showapiPlugin');

-- ----------------------------
-- Table structure for es_favorite
-- ----------------------------
DROP TABLE IF EXISTS `es_favorite`;
CREATE TABLE `es_favorite` (
  `favorite_id` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `favorite_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`favorite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_favorite
-- ----------------------------
INSERT INTO `es_favorite` VALUES ('1', '1', '1', '1531901949');

-- ----------------------------
-- Table structure for es_floor
-- ----------------------------
DROP TABLE IF EXISTS `es_floor`;
CREATE TABLE `es_floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `type` int(11) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `is_display` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `cat_id` varchar(255) DEFAULT NULL,
  `guid_cat_id` varchar(255) DEFAULT NULL,
  `goods_ids` longtext,
  `props` longtext,
  `brand_ids` longtext,
  `adv_ids` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_floor
-- ----------------------------

-- ----------------------------
-- Table structure for es_flow_log
-- ----------------------------
DROP TABLE IF EXISTS `es_flow_log`;
CREATE TABLE `es_flow_log` (
  `flow_id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_id` int(8) DEFAULT NULL,
  `visit_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`flow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_flow_log
-- ----------------------------
INSERT INTO `es_flow_log` VALUES ('1', '1', '1531736352');
INSERT INTO `es_flow_log` VALUES ('2', '1', '1531793987');
INSERT INTO `es_flow_log` VALUES ('3', '1', '1531811125');
INSERT INTO `es_flow_log` VALUES ('4', '1', '1531815197');
INSERT INTO `es_flow_log` VALUES ('5', '1', '1531824120');
INSERT INTO `es_flow_log` VALUES ('6', '1', '1531880858');
INSERT INTO `es_flow_log` VALUES ('7', '1', '1531883554');
INSERT INTO `es_flow_log` VALUES ('8', '1', '1531900135');
INSERT INTO `es_flow_log` VALUES ('9', '1', '1531901946');
INSERT INTO `es_flow_log` VALUES ('10', '1', '1531906930');
INSERT INTO `es_flow_log` VALUES ('11', '1', '1531909454');
INSERT INTO `es_flow_log` VALUES ('12', '1', '1531910232');
INSERT INTO `es_flow_log` VALUES ('13', '1', '1531969603');
INSERT INTO `es_flow_log` VALUES ('14', '1', '1531969978');
INSERT INTO `es_flow_log` VALUES ('15', '1', '1531982258');
INSERT INTO `es_flow_log` VALUES ('16', '1', '1531983530');
INSERT INTO `es_flow_log` VALUES ('17', '1', '1531983676');
INSERT INTO `es_flow_log` VALUES ('18', '1', '1531992890');
INSERT INTO `es_flow_log` VALUES ('19', '1', '1531995609');
INSERT INTO `es_flow_log` VALUES ('20', '1', '1532066397');
INSERT INTO `es_flow_log` VALUES ('21', '1', '1532077437');
INSERT INTO `es_flow_log` VALUES ('22', '1', '1532078479');
INSERT INTO `es_flow_log` VALUES ('23', '1', '1532082565');
INSERT INTO `es_flow_log` VALUES ('24', '1', '1532082838');
INSERT INTO `es_flow_log` VALUES ('25', '1', '1532340004');
INSERT INTO `es_flow_log` VALUES ('26', '1', '1532340234');
INSERT INTO `es_flow_log` VALUES ('27', '1', '1532342597');
INSERT INTO `es_flow_log` VALUES ('28', '1', '1532342649');
INSERT INTO `es_flow_log` VALUES ('29', '1', '1532343457');
INSERT INTO `es_flow_log` VALUES ('30', '1', '1532402758');
INSERT INTO `es_flow_log` VALUES ('31', '1', '1532403627');
INSERT INTO `es_flow_log` VALUES ('32', '1', '1532410417');
INSERT INTO `es_flow_log` VALUES ('33', '1', '1532414296');
INSERT INTO `es_flow_log` VALUES ('34', '1', '1532417902');
INSERT INTO `es_flow_log` VALUES ('35', '1', '1532418136');
INSERT INTO `es_flow_log` VALUES ('36', '1', '1532418267');
INSERT INTO `es_flow_log` VALUES ('37', '1', '1532418672');
INSERT INTO `es_flow_log` VALUES ('38', '1', '1532487941');
INSERT INTO `es_flow_log` VALUES ('39', '1', '1532488125');
INSERT INTO `es_flow_log` VALUES ('40', '1', '1532488525');
INSERT INTO `es_flow_log` VALUES ('41', '1', '1532490166');
INSERT INTO `es_flow_log` VALUES ('42', '1', '1532496933');
INSERT INTO `es_flow_log` VALUES ('43', '1', '1532498609');
INSERT INTO `es_flow_log` VALUES ('44', '1', '1532501005');
INSERT INTO `es_flow_log` VALUES ('45', '1', '1532501110');
INSERT INTO `es_flow_log` VALUES ('46', '1', '1532501561');
INSERT INTO `es_flow_log` VALUES ('47', '1', '1532502107');
INSERT INTO `es_flow_log` VALUES ('48', '1', '1532508927');
INSERT INTO `es_flow_log` VALUES ('49', '1', '1532509653');
INSERT INTO `es_flow_log` VALUES ('50', '1', '1532509942');
INSERT INTO `es_flow_log` VALUES ('51', '1', '1532512697');
INSERT INTO `es_flow_log` VALUES ('52', '1', '1532516815');
INSERT INTO `es_flow_log` VALUES ('53', '1', '1532585917');
INSERT INTO `es_flow_log` VALUES ('54', '1', '1532585981');
INSERT INTO `es_flow_log` VALUES ('55', '1', '1532587439');
INSERT INTO `es_flow_log` VALUES ('56', '1', '1532919722');
INSERT INTO `es_flow_log` VALUES ('57', '1', '1532919724');
INSERT INTO `es_flow_log` VALUES ('58', '1', '1532919741');
INSERT INTO `es_flow_log` VALUES ('59', '1', '1532920234');
INSERT INTO `es_flow_log` VALUES ('60', '1', '1532920244');
INSERT INTO `es_flow_log` VALUES ('61', '1', '1532920347');
INSERT INTO `es_flow_log` VALUES ('62', '1', '1532920723');
INSERT INTO `es_flow_log` VALUES ('63', '1', '1532920837');
INSERT INTO `es_flow_log` VALUES ('64', '1', '1532920987');
INSERT INTO `es_flow_log` VALUES ('65', '1', '1532921021');

-- ----------------------------
-- Table structure for es_freeoffer
-- ----------------------------
DROP TABLE IF EXISTS `es_freeoffer`;
CREATE TABLE `es_freeoffer` (
  `fo_id` int(8) NOT NULL AUTO_INCREMENT,
  `fo_category_id` int(8) DEFAULT NULL,
  `fo_name` varchar(50) DEFAULT NULL,
  `publishable` int(6) DEFAULT '0',
  `recommend` int(6) DEFAULT '1',
  `sorder` int(6) DEFAULT NULL,
  `limit_purchases` int(6) DEFAULT NULL,
  `startdate` bigint(20) DEFAULT NULL,
  `enddate` bigint(20) DEFAULT NULL,
  `lv_ids` varchar(50) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `synopsis` varchar(255) DEFAULT NULL,
  `list_thumb` longtext,
  `pic` longtext,
  `score` int(8) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `repertory` int(8) DEFAULT NULL,
  `descript` longtext,
  `disabled` int(6) DEFAULT '0',
  PRIMARY KEY (`fo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_freeoffer
-- ----------------------------

-- ----------------------------
-- Table structure for es_freeoffer_category
-- ----------------------------
DROP TABLE IF EXISTS `es_freeoffer_category`;
CREATE TABLE `es_freeoffer_category` (
  `cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) DEFAULT NULL,
  `publishable` int(6) DEFAULT '0',
  `sorder` int(10) DEFAULT NULL,
  `disabled` int(6) DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_freeoffer_category
-- ----------------------------

-- ----------------------------
-- Table structure for es_freeze_point
-- ----------------------------
DROP TABLE IF EXISTS `es_freeze_point`;
CREATE TABLE `es_freeze_point` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `memberid` int(10) DEFAULT NULL,
  `childid` int(10) DEFAULT NULL,
  `point` int(10) DEFAULT NULL,
  `mp` int(10) DEFAULT NULL,
  `orderid` int(10) DEFAULT NULL,
  `dateline` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `es_freeze_point_index` (`memberid`,`type`),
  KEY `es_freeze_point_index1` (`orderid`,`dateline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_freeze_point
-- ----------------------------

-- ----------------------------
-- Table structure for es_friends_link
-- ----------------------------
DROP TABLE IF EXISTS `es_friends_link`;
CREATE TABLE `es_friends_link` (
  `link_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `sort` int(8) DEFAULT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_friends_link
-- ----------------------------

-- ----------------------------
-- Table structure for es_gnotify
-- ----------------------------
DROP TABLE IF EXISTS `es_gnotify`;
CREATE TABLE `es_gnotify` (
  `gnotify_id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_id` int(8) DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'ready',
  `send_time` bigint(20) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `disabled` varchar(5) NOT NULL DEFAULT 'false',
  `remark` longtext,
  PRIMARY KEY (`gnotify_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_gnotify
-- ----------------------------

-- ----------------------------
-- Table structure for es_goods
-- ----------------------------
DROP TABLE IF EXISTS `es_goods`;
CREATE TABLE `es_goods` (
  `goods_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `sn` varchar(200) DEFAULT NULL,
  `brand_id` int(8) DEFAULT NULL,
  `cat_id` int(8) DEFAULT NULL,
  `type_id` int(8) DEFAULT NULL,
  `goods_type` smallint(1) DEFAULT '0',
  `unit` varchar(20) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `market_enable` int(8) DEFAULT NULL,
  `brief` varchar(255) DEFAULT NULL,
  `intro` longtext,
  `price` decimal(20,2) DEFAULT NULL,
  `cost` decimal(20,2) DEFAULT NULL,
  `mktprice` decimal(20,2) DEFAULT NULL,
  `params` longtext,
  `specs` longtext,
  `have_spec` int(8) DEFAULT NULL,
  `adjuncts` longtext,
  `create_time` bigint(20) DEFAULT NULL,
  `last_modify` bigint(20) DEFAULT NULL,
  `view_count` int(10) DEFAULT NULL,
  `buy_count` int(10) DEFAULT NULL,
  `disabled` int(8) DEFAULT NULL,
  `store` int(8) DEFAULT NULL,
  `enable_store` int(8) DEFAULT '0',
  `point` int(8) DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(1000) DEFAULT NULL,
  `meta_description` varchar(1000) DEFAULT NULL,
  `p20` varchar(255) DEFAULT NULL,
  `p19` varchar(255) DEFAULT NULL,
  `p18` varchar(255) DEFAULT NULL,
  `p17` varchar(255) DEFAULT NULL,
  `p16` varchar(255) DEFAULT NULL,
  `p15` varchar(255) DEFAULT NULL,
  `p14` varchar(255) DEFAULT NULL,
  `p13` varchar(255) DEFAULT NULL,
  `p12` varchar(255) DEFAULT NULL,
  `p11` varchar(255) DEFAULT NULL,
  `p10` varchar(255) DEFAULT NULL,
  `p9` varchar(255) DEFAULT NULL,
  `p8` varchar(255) DEFAULT NULL,
  `p7` varchar(255) DEFAULT NULL,
  `p6` varchar(255) DEFAULT NULL,
  `p5` varchar(255) DEFAULT NULL,
  `p4` varchar(255) DEFAULT NULL,
  `p3` varchar(255) DEFAULT NULL,
  `p2` varchar(255) DEFAULT NULL,
  `p1` varchar(255) DEFAULT NULL,
  `sord` int(10) DEFAULT '0',
  `have_field` int(8) DEFAULT '0',
  `grade` int(10) DEFAULT '0',
  `goods_comment` longtext,
  `is_pack` int(8) DEFAULT '0',
  `thumbnail` varchar(255) DEFAULT NULL,
  `big` varchar(255) DEFAULT NULL,
  `small` varchar(255) DEFAULT NULL,
  `original` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  KEY `ind_goods_cat_id` (`cat_id`),
  KEY `ind_goods_brand_id` (`brand_id`),
  KEY `ind_goods_name` (`name`),
  KEY `ind_goods_sn` (`sn`),
  KEY `ind_goods_other` (`goods_type`,`disabled`,`market_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_goods
-- ----------------------------
INSERT INTO `es_goods` VALUES ('1', '测试商品', 'CSSP001', '0', '3', '1', '0', '元', '0.00', '0', null, '<p>sdjfdskljkfdskfjdsk</p><audio controls=\"controls\" style=\"display: none;\"></audio>', '0.01', '5.00', '18.00', '[]', '[{\"cost\":5,\"enable_store\":2897820,\"goodsLvPrices\":[],\"goods_id\":1,\"name\":\"测试商品\",\"price\":0.01,\"product_id\":1,\"sn\":\"CSSP001\",\"specList\":[],\"specs\":\"\",\"specsvIdJson\":\"[]\",\"store\":3000017,\"weight\":0}]', '0', null, '1531735666', '1532489113', '65', '0', '0', '3000017', '0', '0', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '0', 'fs:/attachment//goods/2018/7/16/18//22054803_thumbnail.png', 'fs:/attachment//goods/2018/7/16/18//22054803_big.png', 'fs:/attachment//goods/2018/7/16/18//22054803_small.png', 'fs:/attachment//goods/2018/7/16/18//22054803.png');
INSERT INTO `es_goods` VALUES ('2', '无标题', '', '0', '1', '1', '0', '', '0.00', '2', null, null, '0.00', '0.00', null, '[]', '[{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":2,\"name\":\"无标题\",\"price\":0,\"product_id\":2,\"sn\":\"\",\"specList\":[],\"specs\":\"\",\"specsvIdJson\":\"[]\",\"store\":0,\"weight\":0}]', '0', null, '1531815942', '1531815942', '0', '0', '0', '0', '0', '0', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '0', null, null, null, null);
INSERT INTO `es_goods` VALUES ('3', '无标题', '', '0', '1', '1', '0', '', '0.00', '2', null, null, '0.00', '0.00', null, '[]', '[{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":3,\"name\":\"无标题\",\"price\":0,\"product_id\":3,\"sn\":\"\",\"specList\":[],\"specs\":\"\",\"specsvIdJson\":\"[]\",\"store\":0,\"weight\":0}]', '0', null, '1531816066', '1531816309', '0', '0', '0', '0', '0', '0', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '0', null, null, null, null);
INSERT INTO `es_goods` VALUES ('4', '无标题', '', '0', '1', '1', '0', '', '0.00', '2', null, null, '0.00', '0.00', null, '[]', '[{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":4,\"name\":\"无标题\",\"price\":0,\"product_id\":4,\"sn\":\"\",\"specList\":[],\"specs\":\"\",\"specsvIdJson\":\"[]\",\"store\":0,\"weight\":0}]', '0', null, '1531816353', '1531816569', '0', '0', '0', '0', '0', '0', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '0', null, null, null, null);
INSERT INTO `es_goods` VALUES ('5', '无标题', '', '0', '1', '1', '0', null, '0.00', '2', null, null, '0.00', '0.00', null, '[]', '[{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":5,\"name\":\"无标题\",\"price\":0,\"product_id\":5,\"sn\":\"\",\"specList\":[],\"specs\":\"\",\"specsvIdJson\":\"[]\",\"store\":0,\"weight\":0}]', '0', null, '1531816665', '1531816822', '0', '0', '0', '0', '0', '0', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '0', null, null, null, null);
INSERT INTO `es_goods` VALUES ('6', '无标题', '', '0', '1', '1', '0', null, '0.00', '2', null, null, '0.00', '0.00', null, '[]', '[{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":6,\"name\":\"无标题\",\"price\":0,\"product_id\":6,\"sn\":\"\",\"specList\":[],\"specs\":\"\",\"specsvIdJson\":\"[]\",\"store\":0,\"weight\":0}]', '0', null, '1531816872', '1531816872', '0', '0', '0', '0', '0', '0', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '0', null, null, null, null);
INSERT INTO `es_goods` VALUES ('7', '无标题', '', '0', '1', '1', '0', null, '0.00', '2', null, null, '0.00', '0.00', null, '[]', '[{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":7,\"name\":\"无标题\",\"price\":0,\"product_id\":7,\"sn\":\"\",\"specList\":[],\"specs\":\"\",\"specsvIdJson\":\"[]\",\"store\":0,\"weight\":0}]', '0', null, '1531816905', '1531816995', '0', '0', '0', '0', '0', '0', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '0', null, null, null, null);
INSERT INTO `es_goods` VALUES ('8', '无标题', null, '0', null, null, '0', null, '0.00', '2', null, null, '0.00', '0.00', null, '[]', '[{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":8,\"name\":\"无标题\",\"price\":0,\"product_id\":8,\"sn\":\"\",\"specList\":[],\"specs\":\"\",\"specsvIdJson\":\"[]\",\"store\":0,\"weight\":0}]', '0', null, '1531817027', '1531817058', '0', '0', '0', '0', '0', '0', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '0', null, null, null, null);
INSERT INTO `es_goods` VALUES ('9', '无标题', '', '0', '1', '1', '0', null, '0.00', '2', null, null, '0.00', '0.00', null, '[]', '[{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":9,\"name\":\"无标题\",\"price\":0,\"product_id\":9,\"sn\":\"\",\"specList\":[],\"specs\":\"\",\"specsvIdJson\":\"[]\",\"store\":0,\"weight\":0}]', '0', null, '1531817122', '1531817122', '0', '0', '0', '0', '0', '0', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '0', null, null, null, null);
INSERT INTO `es_goods` VALUES ('10', '无标题', '', '1', '1', '1', '0', '', '0.00', '2', null, null, '0.00', '0.00', null, '[]', '[{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":10,\"name\":\"无标题\",\"price\":0,\"product_id\":10,\"sn\":\"\",\"specList\":[],\"specs\":\"\",\"specsvIdJson\":\"[]\",\"store\":0,\"weight\":0}]', '0', null, '1531817260', '1531823586', '0', '0', '0', '0', '0', '0', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '0', null, null, null, null);

-- ----------------------------
-- Table structure for es_goods_adjunct
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_adjunct`;
CREATE TABLE `es_goods_adjunct` (
  `adjunct_id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT NULL,
  `adjunct_name` varchar(50) DEFAULT NULL,
  `min_num` int(10) DEFAULT NULL,
  `max_num` int(10) DEFAULT NULL,
  `set_price` varchar(8) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `items` longtext,
  PRIMARY KEY (`adjunct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_goods_adjunct
-- ----------------------------

-- ----------------------------
-- Table structure for es_goods_articles
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_articles`;
CREATE TABLE `es_goods_articles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT NULL,
  `articleid` int(10) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_goods_articles
-- ----------------------------

-- ----------------------------
-- Table structure for es_goods_cat
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_cat`;
CREATE TABLE `es_goods_cat` (
  `cat_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `parent_id` int(8) DEFAULT NULL,
  `cat_path` varchar(200) DEFAULT NULL,
  `goods_count` int(8) DEFAULT NULL,
  `cat_order` int(5) DEFAULT NULL,
  `type_id` int(8) DEFAULT NULL,
  `list_show` varchar(1) DEFAULT '1',
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `ind_goods_cat_parentid` (`parent_id`),
  KEY `ind_goods_cat_order` (`cat_order`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_goods_cat
-- ----------------------------
INSERT INTO `es_goods_cat` VALUES ('1', '测试商品分类', '0', '0|1|', '0', '0', '1', '1', 'fs:/attachment/goodscat/2018/7/16/18//06516643.jpg');
INSERT INTO `es_goods_cat` VALUES ('2', 'lv2', '1', '0|1|2|', '0', '0', '1', '1', null);
INSERT INTO `es_goods_cat` VALUES ('3', 'lv3', '2', '0|1|2|3|', '0', '0', '1', '1', 'fs:/attachment/goodscat/2018/7/25/18//44464329.jpg');

-- ----------------------------
-- Table structure for es_goods_complex
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_complex`;
CREATE TABLE `es_goods_complex` (
  `goods_1` int(8) NOT NULL,
  `goods_2` int(8) NOT NULL,
  `manual` varchar(4) DEFAULT NULL,
  `rate` int(8) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_goods_complex
-- ----------------------------

-- ----------------------------
-- Table structure for es_goods_depot
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_depot`;
CREATE TABLE `es_goods_depot` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT NULL,
  `depotid` int(10) DEFAULT NULL,
  `iscmpl` int(8) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `es_goods_room_goods_index2` (`depotid`,`iscmpl`),
  KEY `es_goods_room_goods_index1` (`goodsid`,`depotid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_goods_depot
-- ----------------------------
INSERT INTO `es_goods_depot` VALUES ('1', '1', '1', '0');
INSERT INTO `es_goods_depot` VALUES ('2', '1', '2', '0');
INSERT INTO `es_goods_depot` VALUES ('3', '1', '3', '0');
INSERT INTO `es_goods_depot` VALUES ('4', '2', '1', '0');
INSERT INTO `es_goods_depot` VALUES ('5', '2', '2', '0');
INSERT INTO `es_goods_depot` VALUES ('6', '2', '3', '0');
INSERT INTO `es_goods_depot` VALUES ('7', '3', '1', '0');
INSERT INTO `es_goods_depot` VALUES ('8', '3', '2', '0');
INSERT INTO `es_goods_depot` VALUES ('9', '3', '3', '0');
INSERT INTO `es_goods_depot` VALUES ('10', '4', '1', '0');
INSERT INTO `es_goods_depot` VALUES ('11', '4', '2', '0');
INSERT INTO `es_goods_depot` VALUES ('12', '4', '3', '0');
INSERT INTO `es_goods_depot` VALUES ('13', '5', '1', '0');
INSERT INTO `es_goods_depot` VALUES ('14', '5', '2', '0');
INSERT INTO `es_goods_depot` VALUES ('15', '5', '3', '0');
INSERT INTO `es_goods_depot` VALUES ('16', '6', '1', '0');
INSERT INTO `es_goods_depot` VALUES ('17', '6', '2', '0');
INSERT INTO `es_goods_depot` VALUES ('18', '6', '3', '0');
INSERT INTO `es_goods_depot` VALUES ('19', '7', '1', '0');
INSERT INTO `es_goods_depot` VALUES ('20', '7', '2', '0');
INSERT INTO `es_goods_depot` VALUES ('21', '7', '3', '0');
INSERT INTO `es_goods_depot` VALUES ('22', '8', '1', '0');
INSERT INTO `es_goods_depot` VALUES ('23', '8', '2', '0');
INSERT INTO `es_goods_depot` VALUES ('24', '8', '3', '0');
INSERT INTO `es_goods_depot` VALUES ('25', '9', '1', '0');
INSERT INTO `es_goods_depot` VALUES ('26', '9', '2', '0');
INSERT INTO `es_goods_depot` VALUES ('27', '9', '3', '0');
INSERT INTO `es_goods_depot` VALUES ('28', '10', '1', '0');
INSERT INTO `es_goods_depot` VALUES ('29', '10', '2', '0');
INSERT INTO `es_goods_depot` VALUES ('30', '10', '3', '0');

-- ----------------------------
-- Table structure for es_goods_field
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_field`;
CREATE TABLE `es_goods_field` (
  `field_id` int(10) NOT NULL AUTO_INCREMENT,
  `china_name` varchar(255) DEFAULT NULL,
  `english_name` varchar(255) DEFAULT NULL,
  `pluginid` varchar(255) DEFAULT NULL,
  `config` longtext,
  `add_time` bigint(20) DEFAULT NULL,
  `type_id` int(8) DEFAULT NULL,
  `is_validate` int(8) DEFAULT NULL,
  `field_sort` int(10) DEFAULT NULL,
  `is_show` int(8) DEFAULT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_goods_field
-- ----------------------------

-- ----------------------------
-- Table structure for es_goods_gallery
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_gallery`;
CREATE TABLE `es_goods_gallery` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `small` varchar(255) DEFAULT NULL,
  `big` varchar(255) DEFAULT NULL,
  `original` varchar(255) DEFAULT NULL,
  `tiny` varchar(255) DEFAULT NULL,
  `isdefault` int(11) DEFAULT '0',
  `sort` int(10) DEFAULT '0',
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_goods_gallery
-- ----------------------------
INSERT INTO `es_goods_gallery` VALUES ('3', '1', 'fs:/attachment//goods/2018/7/16/18//22054803_thumbnail.png', 'fs:/attachment//goods/2018/7/16/18//22054803_small.png', 'fs:/attachment//goods/2018/7/16/18//22054803_big.png', 'fs:/attachment//goods/2018/7/16/18//22054803.png', 'fs:/attachment//goods/2018/7/16/18//22054803_tiny.png', '1', '1');

-- ----------------------------
-- Table structure for es_goods_lv_price
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_lv_price`;
CREATE TABLE `es_goods_lv_price` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `productid` int(10) DEFAULT NULL,
  `goodsid` int(10) DEFAULT NULL,
  `lvid` int(10) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_goods_lv_price
-- ----------------------------

-- ----------------------------
-- Table structure for es_goods_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_snapshot`;
CREATE TABLE `es_goods_snapshot` (
  `snapshot_id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_id` int(8) DEFAULT NULL,
  `edit_time` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `sn` varchar(200) DEFAULT NULL,
  `brand_id` int(8) DEFAULT NULL,
  `cat_id` int(8) DEFAULT NULL,
  `type_id` int(8) DEFAULT NULL,
  `goods_type` smallint(1) DEFAULT '0',
  `unit` varchar(20) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `market_enable` int(8) DEFAULT NULL,
  `brief` varchar(255) DEFAULT NULL,
  `intro` longtext,
  `price` decimal(20,2) DEFAULT NULL,
  `cost` decimal(20,2) DEFAULT NULL,
  `mktprice` decimal(20,2) DEFAULT NULL,
  `params` longtext,
  `specs` longtext,
  `have_spec` int(8) DEFAULT NULL,
  `adjuncts` longtext,
  `create_time` bigint(20) DEFAULT NULL,
  `last_modify` bigint(20) DEFAULT NULL,
  `view_count` int(10) DEFAULT NULL,
  `buy_count` int(10) DEFAULT NULL,
  `disabled` int(8) DEFAULT NULL,
  `store` int(8) DEFAULT NULL,
  `enable_store` int(8) DEFAULT '0',
  `point` int(8) DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(1000) DEFAULT NULL,
  `meta_description` varchar(1000) DEFAULT NULL,
  `p20` varchar(255) DEFAULT NULL,
  `p19` varchar(255) DEFAULT NULL,
  `p18` varchar(255) DEFAULT NULL,
  `p17` varchar(255) DEFAULT NULL,
  `p16` varchar(255) DEFAULT NULL,
  `p15` varchar(255) DEFAULT NULL,
  `p14` varchar(255) DEFAULT NULL,
  `p13` varchar(255) DEFAULT NULL,
  `p12` varchar(255) DEFAULT NULL,
  `p11` varchar(255) DEFAULT NULL,
  `p10` varchar(255) DEFAULT NULL,
  `p9` varchar(255) DEFAULT NULL,
  `p8` varchar(255) DEFAULT NULL,
  `p7` varchar(255) DEFAULT NULL,
  `p6` varchar(255) DEFAULT NULL,
  `p5` varchar(255) DEFAULT NULL,
  `p4` varchar(255) DEFAULT NULL,
  `p3` varchar(255) DEFAULT NULL,
  `p2` varchar(255) DEFAULT NULL,
  `p1` varchar(255) DEFAULT NULL,
  `sord` int(10) DEFAULT '0',
  `have_field` int(8) DEFAULT '0',
  `grade` int(10) DEFAULT '0',
  `goods_comment` longtext,
  `is_pack` int(8) DEFAULT '0',
  `thumbnail` varchar(255) DEFAULT NULL,
  `big` varchar(255) DEFAULT NULL,
  `small` varchar(255) DEFAULT NULL,
  `original` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`snapshot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_goods_snapshot
-- ----------------------------
INSERT INTO `es_goods_snapshot` VALUES ('6', '1', '1531812159', '测试商品', 'CSSP001', '0', '1', '1', '0', '元', '0.00', '1', null, '<p>sdjfdskljkfdskfjdsk</p><audio controls=\"controls\" style=\"display: none;\"></audio>', '16.00', '5.00', '18.00', '[]', '[{\"cost\":5,\"enable_store\":666,\"goodsLvPrices\":[],\"goods_id\":1,\"name\":\"测试商品\",\"price\":16,\"product_id\":1,\"sn\":\"CSSP001\",\"specList\":[],\"specs\":\"\",\"specsvIdJson\":\"[]\",\"store\":666,\"weight\":0}]', '0', null, '1531735666', '1531737526', '3', '0', '0', '666', '666', '0', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '0', 'fs:/attachment//goods/2018/7/16/18//22054803_thumbnail.png', 'fs:/attachment//goods/2018/7/16/18//22054803_big.png', 'fs:/attachment//goods/2018/7/16/18//22054803_small.png', 'fs:/attachment//goods/2018/7/16/18//22054803.png');
INSERT INTO `es_goods_snapshot` VALUES ('7', '1', '1532489128', '测试商品', 'CSSP001', '0', '1', '1', '0', '元', '0.00', '1', null, '<p>sdjfdskljkfdskfjdsk</p><audio controls=\"controls\" style=\"display: none;\"></audio>', '0.01', '5.00', '18.00', '[]', '[{\"cost\":5,\"enable_store\":2897820,\"goodsLvPrices\":[],\"goods_id\":1,\"name\":\"测试商品\",\"price\":0.01,\"product_id\":1,\"sn\":\"CSSP001\",\"specList\":[],\"specs\":\"\",\"specsvIdJson\":\"[]\",\"store\":3000017,\"weight\":0}]', '0', null, '1531735666', '1532489113', '40', '0', '0', '3000017', '2897820', '0', '', '', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', '0', null, '0', 'fs:/attachment//goods/2018/7/16/18//22054803_thumbnail.png', 'fs:/attachment//goods/2018/7/16/18//22054803_big.png', 'fs:/attachment//goods/2018/7/16/18//22054803_small.png', 'fs:/attachment//goods/2018/7/16/18//22054803.png');

-- ----------------------------
-- Table structure for es_goods_snapshot_gallery
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_snapshot_gallery`;
CREATE TABLE `es_goods_snapshot_gallery` (
  `img_id` int(11) DEFAULT NULL,
  `snapshot_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `small` varchar(255) DEFAULT NULL,
  `big` varchar(255) DEFAULT NULL,
  `original` varchar(255) DEFAULT NULL,
  `tiny` varchar(255) DEFAULT NULL,
  `isdefault` int(11) DEFAULT '0',
  `sort` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_goods_snapshot_gallery
-- ----------------------------
INSERT INTO `es_goods_snapshot_gallery` VALUES ('3', '6', '1', 'fs:/attachment//goods/2018/7/16/18//22054803_thumbnail.png', 'fs:/attachment//goods/2018/7/16/18//22054803_small.png', 'fs:/attachment//goods/2018/7/16/18//22054803_big.png', 'fs:/attachment//goods/2018/7/16/18//22054803.png', 'fs:/attachment//goods/2018/7/16/18//22054803_tiny.png', '1', '1');
INSERT INTO `es_goods_snapshot_gallery` VALUES ('3', '7', '1', 'fs:/attachment//goods/2018/7/16/18//22054803_thumbnail.png', 'fs:/attachment//goods/2018/7/16/18//22054803_small.png', 'fs:/attachment//goods/2018/7/16/18//22054803_big.png', 'fs:/attachment//goods/2018/7/16/18//22054803.png', 'fs:/attachment//goods/2018/7/16/18//22054803_tiny.png', '1', '1');

-- ----------------------------
-- Table structure for es_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_spec`;
CREATE TABLE `es_goods_spec` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `spec_id` int(8) DEFAULT NULL,
  `spec_value_id` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_spec_goods_index` (`goods_id`),
  KEY `ind_spec_goods_value` (`spec_id`,`spec_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_goods_spec
-- ----------------------------

-- ----------------------------
-- Table structure for es_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `es_goods_type`;
CREATE TABLE `es_goods_type` (
  `type_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `props` longtext,
  `params` longtext,
  `disabled` int(8) DEFAULT NULL,
  `is_physical` int(8) DEFAULT NULL,
  `have_prop` int(8) DEFAULT NULL,
  `have_parm` int(8) DEFAULT NULL,
  `join_brand` int(8) DEFAULT NULL,
  `have_field` int(8) DEFAULT '0',
  `join_spec` int(8) DEFAULT '0',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_goods_type
-- ----------------------------
INSERT INTO `es_goods_type` VALUES ('1', '测试商品类型', null, null, '0', '0', '1', '1', '1', '0', '1');

-- ----------------------------
-- Table structure for es_group_buy_count
-- ----------------------------
DROP TABLE IF EXISTS `es_group_buy_count`;
CREATE TABLE `es_group_buy_count` (
  `ruleid` int(10) NOT NULL AUTO_INCREMENT,
  `groupid` int(10) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  PRIMARY KEY (`ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_group_buy_count
-- ----------------------------

-- ----------------------------
-- Table structure for es_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `es_guestbook`;
CREATE TABLE `es_guestbook` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `parentid` int(8) DEFAULT NULL,
  `dateline` bigint(20) DEFAULT NULL,
  `issubject` int(8) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `sex` int(8) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for es_helpcenter
-- ----------------------------
DROP TABLE IF EXISTS `es_helpcenter`;
CREATE TABLE `es_helpcenter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `lastmodified` bigint(20) DEFAULT NULL,
  `hit` bigint(20) DEFAULT NULL,
  `able_time` bigint(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `cat_id` int(10) DEFAULT NULL,
  `is_commend` int(11) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT '0',
  `page_title` varchar(255) DEFAULT NULL,
  `page_keywords` varchar(255) DEFAULT NULL,
  `page_description` longtext,
  `site_code` int(11) DEFAULT '100000',
  `siteidlist` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`id`),
  KEY `ind_helpcenter_catid` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_helpcenter
-- ----------------------------
INSERT INTO `es_helpcenter` VALUES ('7', '500', '1337815832', '1450586990', '0', null, null, null, '21', null, '0', '关于我们', '', null, '100000', null, '关于我们', '', '<ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>关于我们</strong></p></li><li><p>\n		&nbsp;</p></li><li><p><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">修改本区域内容，请到</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\"> </span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">商店管理后台</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">&gt;&gt;</span> </span></strong></span><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\">页面设置<span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">&gt;&gt; 文章管理</span></span></span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\"> &gt;&gt;</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> </span></strong></span><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">关于网站 </span></strong></span><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\"> &gt;&gt;</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\">&nbsp; 关于我们&nbsp; </span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">进行编辑</span></strong></span></p><p>\n	本商城是新一代专业消费服务网站。我们利用强大的全球化集约采购优势、丰富的电子商务管理服务经验和最先进的互联网技术为您提供最新最好的产品。</p></li><li><p><strong>成立源起</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n	在目前广大购物者渐渐对产品性价比要求越来越高的今天，我们发现必须有一套完善的采购经销体系，才能不断的提高产品质量同时降低产品价格，因此减少产品销 售中间环节成本的增加势在必行。因此我们创办中国网上购物商城网站，让产品在网站上直接面对消费者，一方面网站可以提供比在商店购物中更为详尽的资料、历 史渊源以及顾客评论等信息，顾客可以方便的从琳琅满目的各类商品中快速查询出需要的产品；另一方面也大大的减少商店运营成本，将价格实惠转让给顾客。</p></li><li><p><br/></p></li><li><p><strong>定位</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n	本商城所登录的商品全部是经过我们在千百种产品中精挑细选出的精品，每一件商品都有自己的特色，每件产品在登录之前都经过网站编辑的层层筛选，这个将是我们自始至终所坚定的服务原则。</p></li><li><p><strong>承诺</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n	我们承诺提供权威的资讯、最低的价格和便捷的购物方式，为您打造全新的e时代购物新体验！我们承诺严格按照国家法规政策正规经营，经营的产品皆为正规渠道 引进合法缴税的原装正品，有着完善的保修、退货与售后服务制度。为了让您更准确全面的了解您所需要的商品，我们的每一件商品都提供100%实样的高清晰数 码照片、详尽的技术性能指标和制造厂商的介绍。同时采用多种便捷的支付方式和安全快速的配送体系，通过先进的互联网技术进行订单的实时跟踪，并保证每一位 客户资料的安全与保密。</p></li></ul>');
INSERT INTO `es_helpcenter` VALUES ('8', '490', '1337816076', '1450587000', '0', null, null, null, '21', null, '0', '联系我们', '', null, '100000', null, '联系我们', '', '<ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>联系我们</strong></p></li><li><p>\n		&nbsp;</p></li><li><p><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">修改本区域内容，请到</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\"> </span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">商店管理后台</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">&gt;&gt;</span>&nbsp;页面设置<span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">&gt;&gt; 文章管理</span></span></span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\"> &gt;&gt;</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> </span></strong></span><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">关于网站 &gt;&gt;</span></strong></span><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> 联系我们&nbsp; </span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">进行编辑</span></strong></span></p><p>\n		热心细致的服务态度打造温暖亲切的购物氛围。</p><table class=\"liststyle data\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><th>\n					服务热线：</th><td>\n					010-88888888&nbsp; <span class=\"g\"><span style=\"color:#666666\">(工作时间竭诚为您服务)<br/>\n					热线服务时间：<br/>\n					周一～周五 09：00－18：00<br/>\n					周六、周日以及公共假期 12：00－17：00</span></span></td></tr><tr><th>\n					电子邮箱：</th><td><a href=\"mailto:storesupport@ourstore.com.cn.net\">webmaster@javamall.com</a></td></tr><tr><th>\n					商店留言：</th><td>\n					您可以点击&amp;ldquo;商店留言&amp;rdquo;将您的意见和建议提给我们。</td></tr><tr><th>\n					地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 址：</th><td>\n					北京市朝阳区朝阳大街2001号</td></tr><tr><th>\n					邮政编码：</th><td>\n					100000</td></tr></tbody></table></li></ul>');
INSERT INTO `es_helpcenter` VALUES ('9', '480', '1337816163', '1450587010', '0', null, null, null, '21', null, '0', '业务合作', '', null, '100000', null, '业务合作', '', '<ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><p><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">修改本区域内容，请到</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\"> </span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">商店管理后台</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">&gt;&gt;</span></span></strong></span><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\">页面设置<span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">&gt;&gt; 文章管理</span></span></span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\"> &gt;&gt;</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> </span></strong></span><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">关于网站</span></strong></span><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\"> &gt;&gt;</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\">&nbsp; 业务合作&nbsp; </span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">进行编辑</span></strong></span></p><li><p><strong>媒体/广告合作</strong></p></li><li><p>\n		&nbsp;</p></li><li><p><br/></p></li><ul style=\"list-style-type: square;\" class=\"list list-paddingleft-2\"><li><p>\n			联系人：刘先生</p></li><li><p>\n			联系方式：010-88888888</p></li><li><p>\n			合作范围：媒体互动宣传、内容合作、广告投放、物流、配货、技术合作</p></li></ul><li><p><strong>招商咨询</strong></p></li><li><p>\n		&nbsp;</p></li><li><p><br/></p></li><ul style=\"list-style-type: square;\" class=\"list list-paddingleft-2\"><li><p>\n			联系人：刘先生</p></li><li><p>\n			联系方式：010-88888888</p></li><li><p>\n			合作范围：品牌服饰入驻及在线市场推广服务</p></li></ul></ul>');
INSERT INTO `es_helpcenter` VALUES ('10', '500', '1337816571', '1450587027', '44', null, null, null, '17', null, '0', '顾客必读', '', null, '100000', null, '顾客必读', '', '<ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>如何订购商品？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		您可以首先浏览我们的网站了解商品。看到您满意的商品您可以直接在我们的网站上实现订购。您也可以和我们网站的客服人员联系订购。</p></li><li><p>\n		凭借与国内外多家产品制造商长期的合作关系，以及多家实体连锁店面的支持，本商城汇集了大量最新、最潮、最时尚且品质过硬的产品，并以全网底价的超低价格交付给消费者。</p></li><li><p>\n		为消费者提供高品质产品，是李商城的一贯追求，确保为消费者提供的每一件商品都是精品。</p></li></ul><ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>品牌保障计划</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		本商场的供应商全部是生产厂商或授权的总代理商或经销商，所售出的商品全部为通过正规进货渠道购进的正牌商品，与您亲临商场选购的商品享受同样的质量保证。本商城对销售产品的质量承担所有相应法律责任，发现假货十倍赔偿！</p></li></ul><ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>电话客服中心联系方式</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		电话服务时间：早9:00-晚21:00</p></li><li><p>\n		全国服务热线：4001-234-567（免长途费）</p></li></ul><p>\n	&nbsp;</p><ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>商务/广告合作</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		联系QQ：12345678</p></li><li><p><span style=\"float: left\">联系邮箱：</span><a href=\"mailto:webmaster@yourdomain.com\" style=\"line-height: 18px; float: left; color: #333333\">webmaster@yourdomain.com</a></p></li></ul>');
INSERT INTO `es_helpcenter` VALUES ('11', '490', '1337816630', '1450587616', '5', null, null, null, '17', null, '0', '会员等级折扣', '', null, '100000', null, '会员等级折扣', '', '<p>\n				</p><h2 style=\"color:#999\">积分规则</h2><p>\n				</p><p>当积分已达到某一兑换积分标准时，顾客可将累计积分依照网站相应积分及兑换标准兑换回馈商品，网站将即时从用户会员积分中扣减相应积分。</p><p>\n				</p><p>各项回馈项目（包含各项商品、服务或抵用券等）及兑换标准及兑换规则均以兑换当时最新回馈活动公告或目录为准。</p><p>\n				</p><p>部分兑换商品有数量限制的，兑完为止。</p><p>\n				</p><p>公告或目录如有有效期限的，逾期即不得兑换。</p><p>\n				</p><p>积分兑换区的商品为只可用积分兑换的商品(如积分价格：100积分)</p><p><br/></p><p><br/></p><p>\n			</p><p>\n			</p><p>\n				</p><h2 style=\"color:#999\">积分规则</h2><p>普通会员所需积分：0，可参与网站指定会员活动，并可享受最低100%优惠</p><p>黄金会员所需积分：300，可参与网站指定会员活动，并可享受最低98%优惠</p><p>白金会员所需积分：1200，可参与网站指定会员活动，并可享受最低95%优惠</p><p>钻石卡VIP会员所需积分：5000，可参与网站指定会员活动，并可享受最低92%优惠</p><p>		&nbsp; &nbsp;				\n			</p><ul class=\"help2_right_ul3 list-paddingleft-2\"><br/></ul>');
INSERT INTO `es_helpcenter` VALUES ('12', '480', '1337817665', '1450587327', '7', null, null, null, '25', null, '0', '订单状态', '', null, '100000', null, '订单状态', '', '<ul class=\" list-paddingleft-2\" style=\"width: 687px; display: block; float: left; margin-left: 47px; overflow: hidden; _margin-left: 23px\"><li><p>\n		本商城的订单状态共有10种，下表为详细介绍：</p></li><li><p>\n		&nbsp;</p></li><li><p><span style=\"text-align: center; width: 150px; display: block; background: #999999; float: left; color: #ffffff; font-weight: bold; border-right: #cccccc 1px solid\">订单状态</span> <span style=\"text-align: center; width: 429px; display: block; background: #999999; float: left; color: #ffffff; font-weight: bold\">状态说明</span></p></li><li><p><span style=\"line-height: 86px; width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;1.待付款</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">除支付方式为货到付款的订单,均需要您在下订单后完成支付操作,您的订单才正式生效,本商城才会进行配货发货,由于您付款延迟造成的订单缺货,我们表示抱歉。<br/>\n		注：若您需要修改订单，需要自行取消订单，再重新下订单</span></p></li><li><p><span style=\"line-height: 43px; width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;2.已付款，待确认</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">您已成功提交订单，我们会在工作时间内尽快审核、确认您的订单，如长时间未被确认，请联系本商城客服或拨打客服热线4001-234-567；</span></p></li><li><p><span style=\"width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;3.已付款</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">表示您的订单货款我们已收到并核对。</span></p></li><li><p><span style=\"width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;4.配货中</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">表示您的订单已处于配货环节，最晚将在3天内完成这个环节。</span></p></li><li><p><span style=\"width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;5.配货完成，待发货</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">表示您的订单货物已完成配货待快递发出。</span></p></li><li><p><span style=\"line-height: 43px; width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;6.已发货</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">表示您的订单货物已发出，您可以根据物流号在本站或相关物流公司网站查询您的订单配送状态。</span></p></li><li><p><span style=\"width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;7.已收货</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">表示您已收到、核对您所购买的商品并确认签收，此项订单交易成功。</span></p></li><li><p><span style=\"width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;8.已完成</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">表示您已核对并签收您的商品30天。</span></p></li><li><p><span style=\"width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;9.已取消</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">表示由您自己或委托客服取消的订单。</span></p></li><li><p><span style=\"width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;10.确认订单（货到付款）</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">货到付款的订单需要本商城人员确认。</span></p></li></ul>');
INSERT INTO `es_helpcenter` VALUES ('13', '470', '1337817975', '1450590850', '4', null, null, null, '17', null, '0', '积分规则', '', null, '100000', null, '积分规则', '', '<style type=\"text/css\">.jifenguize{width: 687px; display: block; float: left; margin-left: 47px;_margin-left: 23px; overflow: hidden}\n    .jifenguize a{text-decoration:none; color:#333333;}\n    .jifenguize a:hover{text-decoration:none; color:#333333;}</style><ul class=\"jifenguize list-paddingleft-2\"><li><p><strong>积分定义：</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		积分是本商城针对会员给予的购物奖励；<br/>\n		积分对应商品价格，成功购买1元钱商品可获1个积分；<br/>\n		购物金额如出现非整数，相应的积分取整数部分计算；<br/>\n		获取积分时消费积分等同于会员等级分，但消费积分使用后将被抵扣，会员等级分只做累计。<br/>\n		有效积分是指您通过注册、验证邮箱、完善个人资料、已完成订单、评论晒单、上传试戴图片、推荐好友等获取的消费积分与您的等级积分。</p></li><li><p><strong>获取积分途径：</strong></p></li></ul><p>\n	&nbsp;</p><ul class=\"jifenguize list-paddingleft-2\"><li><p>\n		1.有效购物</p></li><li><p>\n		1）通过在本商城的有效订单获得积分；积分对应商品价格，成功购买1元钱商品可获得1个积分；（积分核算不含订单运费部分）<br/>\n		2）购物金额如出现非整数，相应的积分取整数部分计算；<br/>\n		3）会员购物并生成有效订单后，相应积分将自动计入会员账户，但此时积分状态为冻结；当会员完成此笔订单后，积分将解冻。<br/>\n		&nbsp;&nbsp;&nbsp;您也可以在您确认收货后提前解冻和使用被冻结的积分，但与被冻结积分相关的订单商品，将不能进行退换货操作。此时积分<br/>\n		&nbsp;&nbsp;&nbsp;可兑换礼品或参与网站相关活动。（订单解冻周期见下：）<br/>\n		4）选择并完成网上支付获得10个积分。</p></li><li><p>\n		2. 注册登录：</p></li><li><p>\n		1）成功注册会员即可获得50个积分；<br/>\n		2）完成邮箱验证可获得20个积分；<br/>\n		3）完整填写会员资料可获得20个积分；<br/>\n		4）每天登录1次可获得5个积分。（封顶5分）<br/><a href=\"register.html\" style=\"color: rgb(140, 0, 0);\">马上注册！&gt;&gt;</a></p></li><li><p>\n		3. 评论晒单：</p></li></ul><p><br/></p><p><img style=\"width: 719px; height: 213px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201353535576.jpg\" title=\"show.jpg\" height=\"213\" width=\"719\"/></p><p><br/></p><ul class=\"jifenguize list-paddingleft-2\"><li><p>\n		1）文字评论1次获得10个积分；<br/>\n		2）上传图片评论1次获得30个积分；<br/>\n		3）每个商品ID首次评论额外获50个积分；<br/>\n		4）每个会员ID对于所购每一个商品拥有1次有效计分评论。</p></li><li><p><strong><a name=\"a1\"></a>积分状态：</strong></p></li><li><p>\n		&nbsp;&nbsp;冻结：因购物获得的积分在会员未完成有效购物之前，积分状态为冻结，此时积分暂时不可用，冻结周期为签收后30天。您可以提前解冻和使用被冻结的积分，但与被冻结积分相关的订单商品，将不能进行退换货操作。</p></li><li><p>\n		&nbsp;&nbsp;取消：当订单取消后，相应的购物冻结积分将被扣除。</p></li><li><p>\n		&nbsp;&nbsp;完成：购物产生的冻结积分，在您收到货物后30天将自动解冻。您也可以在确认收货后在会员中心将冻结积分提前解冻，计入会员帐户的可用积分，用于兑换礼品或参与活动，解冻积分对应的商品不能申请退换货。</p></li><li><p><a name=\"use\"></a><strong>积分用途：</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		1）等同于会员升级的等级分，享受会员优惠；<br/>\n		2）可在积分商城兑换指定商品或现金券。</p></li><li><p>\n		本商城积分获得途径：</p></li><li><p>\n		1、购买积分，１元＝１积分，有非整数的取整数部分。<br/>\n		2、选择网上支付１０积分。<br/>\n		3、成功注册５０积分。<br/>\n		4、完成邮箱验证２０积分。<br/>\n		5、完善个人资料２０积分。<br/>\n		6、登录一次５积分，每天封顶５积分。<br/>\n		7、文字评论１次１０积分。<br/>\n		8、上传图片评论３０积分。<br/>\n		9、每个商品首次评论额外５０积分。<br/>\n		10、分享一次５积分，每天封顶１０积分。<br/>\n		11、推荐好友５０消费积分（推荐好友下订单时推荐人获得50冻结消费积分，推荐的好友购买后获得购买奖励积分解冻时，推荐<br/>\n		&nbsp;&nbsp;&nbsp;&nbsp;积分也解冻。） 本商城积分解冻规则： 每个订单的冻结周期都是订单状态为&amp;ldquo;已收货&amp;rdquo;后30天，积分解冻后则不能申请退<br/>\n		&nbsp;&nbsp;&nbsp;&nbsp;换货。 可以在会员中心提前解冻，但是解冻后则不能申请退换货。</p></li></ul>');
INSERT INTO `es_helpcenter` VALUES ('14', '460', '1337818194', '1450587261', '7', null, null, null, '23', null, '0', '商品退换货保障', '', null, '100000', null, '商品退换货保障', '', '<ul class=\" list-paddingleft-2\" style=\"width:687px; float:left; overflow:hidden; display:block; margin-left:47px;_margin-left:23px;\"><li><p>\n		全商品30天无理由退换货保障:</p></li><li><p>\n		&nbsp;</p></li><li><p>\n		在您收到商品后的30天之内，如果对商品不满意、不喜欢，且未拆封使用或质量问题的前提下，您可以无条件退货或置换您满意的其它商品。 注：退换货日期以客户签收日起算。</p></li><li><p>\n		正品原包，假一赔十！</p></li><li><p>\n		&nbsp;</p></li><li><p>\n		本商城的供应商全部是生产厂商或授权的总代理商或经销商，所售出的商品全部为通过正规进货渠道购进的正牌商品，与您亲临商场选购的商品享受同样的质量保证。本商城对销售产品的质量承担所有相应法律责任，发现假货十倍赔偿！</p></li><li><p>\n		送货上门，货到付款！</p></li><li><p>\n		&nbsp;</p></li><li><p>\n		网上下订单，等商品送到您手上，您可以当场验货。 （本商城目前支持全国1052个城市货到付款，其它边远地区暂不支持。）</p></li><li><p>\n		使您购物满意，是我们最大的希望，我们在努力中，欢迎您给我们提出建议！</p></li></ul>');
INSERT INTO `es_helpcenter` VALUES ('15', '500', '1337818334', '1450587090', '0', null, null, null, '18', null, '0', '游客购物通道', '', null, '100000', null, '游客购物通道', '', '<h2>\n		游客购物通道</h2><ol class=\" list-paddingleft-2\"><li><p>\n			我们提供非会员购物功能，在购物车下一步的时候，点击&amp;ldquo;直接购买&amp;rdquo;即可使用此功能。</p></li><li><p>\n			但是由于非会员无法享受购物积分等，所以我们建议您花一分钟时间注册成为会员，这样就能享受整个网站强大的会员功能和多种优惠措施。</p></li></ol><p>\n	&nbsp;</p>');
INSERT INTO `es_helpcenter` VALUES ('16', '490', '1337818390', '1450587240', '5', null, null, null, '23', null, '0', '售后服务', '', null, '100000', null, '售后服务', '', '<ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>体贴的售后服务</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>本网站所售产品均实行三包政策，请顾客保存好有效凭证，以确保我们为您更好服务。本公司的客户除享受国家规定&amp;ldquo;三包&amp;rdquo;。您可以更放心地在这里购物。</p></li><li><p><strong>保修细则</strong></p></li><li><p>\n		&nbsp;</p></li><li><h4>\n		一、在本网站购买的商品，自购买日起(以到货登记为准)7日内出现性能故障，您可以选择退货、换货或修理。</h4><h4>\n		二、在本公司购买的商品，自购日起(以到货登记为准)15日内出现性能故障，您可以选择换货或修理。(享受15天退换货无需理由的商品，按《15天退换货无需理由细则》办理)</h4><h4>\n		三、在本公司购买的商品，自购日起(以到货登记为准)一年之内出现非人为损坏的质量问题，本公司承诺免费保修。</h4></li><ol class=\" list-paddingleft-2\"><li><p>\n			在接到您的产品后，我公司将问题商品送厂商特约维修中心检测；</p></li><li><p>\n			检测报出来后，如非人为损坏的，是产品本身质量问题，我公司会及时按您的要求予以退款、换可或维修。</p></li><li><p>\n			如果检测结果是无故障或是人为因素造成的故障，我公司会及时通知您，并咨询您的处理意见。</p></li></ol><ol class=\" list-paddingleft-2\"><li><p>\n			在接到您的产品后，我公司将问题商品送厂商特约维修中心检测；</p></li><li><p>\n			检测报出来后，如非人为损坏的，是产品本身质量问题，我公司会及时按您的要求予以退款、换可或维修。</p></li><li><p>\n			如果检测结果是无故障或是人为因素造成的故障，我公司会及时通知您，并咨询您的处理意见。</p></li></ol><ol class=\" list-paddingleft-2\"><li><p>\n			在接到您的产品后，我公司将问题商品送厂商特约维修中心检测；</p></li><li><p>\n			检测报出来后，如非人为损坏的，是产品本身质量问题，我公司会及时按您的要求予以退款、换可或维修。</p></li><li><p>\n			如果检测结果是无故障或是人为因素造成的故障，我公司会及时通知您，并咨询您的处理意见。</p></li></ol><li><p><strong>收费维修</strong></p></li><li><p>\n		&nbsp;</p></li><li><h4>\n		一、对于人为造成的故障，本公司将采取收费维修，包括：</h4><h4>\n		二、符合以下条件，可以要求换货：</h4><h4>\n		三、符合以下条件，可以要求退货：</h4><p>\n	客户收到货物后两天之内，	</p></li><ol class=\" list-paddingleft-2\"><li><p>\n			发现商品有明显的制造缺陷的</p></li><li><p>\n			货物经过一次换货但仍然存在质量问题的</p></li><li><p>\n			由于人为原因造成超过我们承诺到货之日三天还没收到货物的</p></li></ol><ol class=\" list-paddingleft-2\"><li><p>\n			客户在收到货物时当面在送货员面前拆包检查，发现货物有质量问题的</p></li><li><p>\n			实际收到货物与网站上描述的有很大的出入的</p></li><li><p>\n			换货流程：客户当面要求送货人员退回货物，然后与我们联系。我们会在一个工作日内为您重新发货，货物到达时间顺延。</p></li></ol><ol class=\" list-paddingleft-2\"><li><p>\n			产品内部被私自拆开或其中任何部分被更替；</p></li><li><p>\n			商品里面的条码不清楚，无法成功判断；</p></li><li><p>\n			有入水、碎裂、损毁或有腐蚀等现象；</p></li><li><p>\n			过了保修期的商品。</p></li></ol><li><p><strong>退货流程</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n	客户在收到货物后两天内与我们联系，我们会在两个工作日内通过银行汇款把您的货款退回。	</p><h4>\n		在以下情况我们有权拒绝客户的退换货要求：</h4></li><ol class=\" list-paddingleft-2\"><li><p>\n			货物出现破损，但没有在收货时当场要求送货人员换货的</p></li><li><p>\n			超过退换货期限的退换货要求</p></li><li><p>\n			退换货物不全或者外观受损</p></li><li><p>\n			客户发货单据丢失或者不全</p></li><li><p>\n			产品并非我们提供</p></li><li><p>\n			货物本身不存在质量问题的</p></li></ol></ul>');
INSERT INTO `es_helpcenter` VALUES ('17', '480', '1337818441', '1450587100', '0', null, null, null, '18', null, '0', '网站使用条款', '', null, '100000', null, '网站使用条款', '', '<h2>\n	网站使用条款</h2><p>\n	如果您在本网站访问或购物，您便接受了以下条件。</p><h4>\n	版权</h4><p>\n	本网站上的所有内容诸如文字、图表、标识、按钮图标、图像、声音文件片段、数字下载、数据编辑和软件都是本网站提供者的财产，受中国和国际版权法的保护。 本网站上所有内容的汇编是本网站的排他财产，受中国和国际版权法的保护。本网站上所使用的所有软件都是本网站或其关联公司或其软件供应商的财产，受中国和 国际版权法的保护。</p><h4>\n	许可和网站进入</h4><p>\n	本网站授予您有限的许可进入和个人使用本网站，未经本网站的明确书面同意不许下载（除了页面缓存）或修改网站或其任何部分。这一许可不包括对本网站或其内 容的转售或商业利用、任何收集和利用产品目录、说明和价格、任何对本网站或其内容的衍生利用、任何为其他商业利益而下载或拷贝账户信息或使用任何数据采 集、 robots或类似的数据收集和摘录工具。未经本网站的书面许可，严禁对本网站的内容进行系统获取以直接或间接创建或编辑文集、汇编、数据库或人名地址录 （无论是否通过robots、spiders、自动仪器或手工操作）。另外，严禁为任何未经本使用条件明确允许的目的而使用本网站上的内容和材料。 未经本网站明确书面同意，不得以任何商业目的对本网站或其任何部分进行复制、复印、仿造、出售、转售、访问、或以其他方式加以利用。未经本网站明确书面同 意，您不得用设计或运用设计技巧把本网站或其关联公司的商标、标识或其他专有信息（包括图像、文字、网页设计或形式）据为己有。未经本网站明确书面同意， 您不可以meta tags或任何其他&amp;ldquo;隐藏文本&amp;rdquo;方式使用本网站的名字和商标。任何未经授权的使用都会终止本网站所授予的允许或许可。您被授予有限的、可撤销的和非独家的 权利建立链接到本网站主页的超链接，只要这个链接不以虚假、误导、贬毁或其他侵犯性方式描写本网站、其关联公司或它们的产品和服务。</p><h4>\n	评论、意见、消息和其他内容</h4><p>\n	访问者可以张贴评论、意见及其他内容，以及提出建议、主意、意见、问题或其他信息，只要内容不是非法、淫秽、威胁、诽谤、侵犯隐私、侵犯知识产权或以其他 形式对第三者构成伤害或侵犯或令公众讨厌，也不包含软件病毒、政治宣传、商业招揽、连锁信、大宗邮件或任何形式的&amp;ldquo;垃圾邮件&amp;rdquo;。您不可以使用虚假的电子邮 件地址、冒充任何他人或实体或以其它方式对卡片或其他内容的来源进行误导。本网站保留清除或编辑这些内容的权利（但非义务），但不对所张贴的内容进行经常 性的审查。如果您确实张贴了内容或提交了材料，除非我们有相反指示，您授予本网站及其关联公司非排他的、免费的、永久的、不可撤销的和完全的再许可权而在 全世界范围内任何媒体上使用、复制、修改、改写、出版、翻译、创作衍生作品、分发和展示这样的内容。您授予本网站及其关联公司和被转许可人使用您所提交的 与这些内容有关的名字的权利，如果他们选择这样做的话。您声明并担保您拥有或以其它方式控制您所张贴内容的权利，内容是准确的，对您所提供内容的使用不违 反本政策并不会对任何人和实体造成伤害。您声明并保证对于因您所提供的内容引起的对本网站或其关联公司损害进行赔偿。本网站有权监控和编辑或清除任何活动 或内容。本网站对您或任何第三方所张贴的内容不承担责任。</p><h4>\n	产品说明</h4><p>\n	本网站及其关联公司努力使产品说明尽可能准确。不过，由于实际条件限制，本网站并不保证产品说明或本网站上的其他内容是准确的、完整的、可靠的、最新的或无任何错误的。</p><h4>\n	电子通讯</h4><p>\n	当您访问本网站或给我们发送电子邮件时，您与我们用电子方式进行联系。您同意以电子方式接受我们的信息。我们将用电子邮件或通过在本网站上发布通知的方式 与您进行联系。您同意我们用电子方式提供给您的所有协议、通知、披露和其他信息是符合此类通讯必须是书面形式的法定要求的。如果并且当本网站能够证明以电 子形式的信息已经发送给您或者在本网站张贴这样的通知，将被视为您已收到所有协议、声明、披露和其他信息。</p>');
INSERT INTO `es_helpcenter` VALUES ('18', '470', '1337818563', '1450587250', '5', null, null, null, '23', null, '0', '免责条款', '', null, '100000', null, '免责条款', '', '<ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>免责声明</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n\n	如因不可抗力或其他无法控制的原因造成网站销售系统崩溃或无法正常使用，从而导致网上交易无法完成或丢失有关的信息、记录等，网站将不承担责任。但是我们将会尽合理的可能协助处理善后事宜，并努力使客户减少可能遭受的经济损失。<br/>\n	本 店可以按买方的要求代办相关运输手续，但我们的责任义务仅限于按时发货，遇到物流（邮政）意外时协助买方查询，不承担任何物流（邮政）提供给顾客之外的赔 偿，一切查询索赔事宜均按照物流（邮政）的规定办理。在物流（邮政）全程查询期限未满之前，买方不得要求赔偿。提醒买方一定核实好收货详细地址和收货人电 话，以免耽误投递。凡在本店购物，均视为如同意此声明。</p></li><li><p><strong>客户监督</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n	我们希望通过不懈努力，为客户提供最佳服务，我们在给客户提供服务的全程中接受客户的监督。</p></li><li><p><strong>争议处理</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n\n	如果客户与网站之间发生任何争议，可依据当时双方所认定的协议或相关法律来解决。</p></li></ul>');
INSERT INTO `es_helpcenter` VALUES ('19', '460', '1337818664', '1450587108', '0', null, null, null, '18', null, '0', '购物流程', '', null, '100000', null, '购物流程', '', '<h2>\n		简单的购物流程</h2><h4>\n		怎样注册？</h4><p>\n		答：您可以直接点击&quot;会员注册&quot;进行注册。注册很简单，您只需按注册向导的要求输入一些基本信息即可。为了准确地为您服务，请务必在注册时填写您的真实信息，我们会为您保密。输入的帐号要4-10位，仅可使用英文字母、数字&quot;-&quot;。</p><h4>\n		怎样成为会员?</h4><p>\n		答：您可以直接点击&quot;会员登录与注册&quot;进行注册。注册很简单，您只需根据系统提示输入相关资料即可，请您填写完毕时，务必核对填写内容的准确性，并谨记您的会员账号和密码，以便您查询订单或是希望网站提供予您更多的服务时用以核对您的身份。</p><h4>\n		如何在网上下单购买，怎么一个操作流程呢？</h4><p>\n		答：这种方式和您逛商场的方式十分相似，您只要按照我们的商品分类页面或进入&quot;钻石珠宝&quot;、&quot;个性定制&quot;等逐页按照链接指明的路径浏览就可以了。 一旦看中了您喜欢的商品，您可以随时点击&quot;放入购物篮&quot;按钮将它放入&quot;购物篮&quot;。随后，您可以按&quot;去收银台&quot;。我们的商品十分丰富，不过您别担心，我们在 每一页中都设立了详细明白的导航条，您是不会迷路的。</p><p>\n	&nbsp;</p>');
INSERT INTO `es_helpcenter` VALUES ('20', '500', '1337819564', '1450591087', '7', null, null, null, '19', null, '0', '支付方式', '', null, '100000', null, '支付方式', '', '<p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;货到付款：</strong></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;指商品送到您手上后，您当场付款给送货人员（快递员）本商城开通全国2000多个城市货到付款，全部支持当场开箱验货再付款！</p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第三方支付</p><p><br/></p><p><img style=\"width: 660px; height: 92px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201357092474.jpg\" title=\"show.jpg\" height=\"92\" width=\"660\"/></p><p>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</p><h3>&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 16px;\">支持国内二十多家主流银行机构的储蓄卡</span></h3><p><br/></p><p><img style=\"width: 680px; height: 497px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201357442927.jpg\" title=\"show.jpg\" height=\"497\" width=\"680\"/></p><p><br/></p><p><br/></p><p><br/></p>');
INSERT INTO `es_helpcenter` VALUES ('21', '490', '1337819705', '1450591209', '4', null, null, null, '22', null, '0', '配送方式', '', null, '100000', null, '配送方式', '', '<h2><span style=\"font-size: 16px;\">配送方式</span></h2><p>本网购物采用第三方快递配送。<br/>\n 用户可以在我的订单里查询分配的订单的快递，从而及时查阅物流信息。<br/>\n 用户可以登录第三方快递公司相应网站：</p><p><br/></p><h3>第三方配送公司</h3><p>登录相关物流网站，输入相应单号，即可查询货物配送状态。</p><p><br/></p><p><img style=\"width: 721px; height: 332px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201400010326.jpg\" title=\"show.jpg\" height=\"332\" width=\"721\"/></p><p><br/></p><p><br/></p>');
INSERT INTO `es_helpcenter` VALUES ('23', '460', '1337819885', '1450587216', '3', null, null, null, '22', null, '0', '关于收货与验货', '', null, '100000', null, '关于收货与验货', '', '<ul style=\" margin-bottom:0px;\" class=\"help2_right_ul3 list-paddingleft-2\"><li><p><strong>签收商品时需要注意的问题</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>1、送货上门、货到付款订单：快递员送货上门时，请您务必当面对照发货单核对商品，如果出现商品数量缺少、商品破损，请您当场办理整单商品的退货。若订单中含有赠品，请一并退回。一旦您确认签字，我们将无法为您办理退换或补发。	\n	2、 邮局邮寄订单：请您在领取包裹时务必检查外包装，如果发现包裹破损，请您不要签收，随后请及时将包裹单原件邮寄给我们，您的包裹单原件将作为我们为您办理 补发或退款的唯一证明。收到包裹单后，我们将为您办理相关手续。如您未拆开外包装箱，也可以当场全部退货。平邮订单，在收到包裹时，如发现包裹破损，请您 要求邮局出具包裹破损证明。<span style=\"color: rgb(255, 0, 0);\">注：敬请您在验货签收时仔细核对发票，如果出现发票开错或漏开，请您及时联系我们，注明订单号、邮寄地址和收信人姓名，我们接到您的信息后会尽快为您开具，并邮寄给您。</span></p></li><ol class=\" list-paddingleft-2\"><li><p>\n		特别提示：		</p></li><li><p>\n			如果您的订单使用帐户余额或礼券支付，只有退货商品的金额小于实际应付款金额时才可办理。</p></li><li><p>\n			如果您的订单中含有赠品，将无法提供此项服务；如果是成套商品，您只能整套退货。如果是捆绑商品，您在退主商品的同时需要将赠品一起退回。</p></li></ol></ul>');
INSERT INTO `es_helpcenter` VALUES ('24', '500', '1337820081', '1450587167', '0', null, null, null, '20', null, '0', '注册服务条款', '', null, '100000', null, '注册服务条款', '', '<p style=\"text-align:center;\"><strong>注册服务条款</strong></p><p>\n	尊敬的用户，欢迎您注册成为本网站用户。在注册前请您仔细阅读如下服务条款：<br/>\n	本服务协议双方为本网站与本网站用户，本服务协议具有合同效力。<br/>\n	您确认本服务协议后，本服务协议即在您和本网站之间产生法律效力。请您务必在注册之前认真阅读全部服务协议内容，如有任何疑问，可向本网站咨询。<br/>\n	无论您事实上是否在注册之前认真阅读了本服务协议，只要您点击协议正本下方的&quot;注册&quot;按钮并按照本网站注册程序成功注册为用户，您的行为仍然表示您同意并签署了本服务协议。</p><h4>\n	1．本网站服务条款的确认和接纳</h4><p>\n	本网站各项服务的所有权和运作权归本网站拥有。</p><h4>\n	2．用户必须：</h4><p>\n	(1)自行配备上网的所需设备， 包括个人电脑、调制解调器或其他必备上网装置。<br/>\n	(2)自行负担个人上网所支付的与此服务有关的电话费用、 网络费用。</p><h4>\n	3．用户在本网站上交易平台上不得发布下列违法信息：</h4><p>\n	(1)反对宪法所确定的基本原则的；<br/>\n	(2).危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<br/>\n	(3).损害国家荣誉和利益的；<br/>\n	(4).煽动民族仇恨、民族歧视，破坏民族团结的；<br/>\n	(5).破坏国家宗教政策，宣扬邪教和封建迷信的；<br/>\n	(6).散布谣言，扰乱社会秩序，破坏社会稳定的；<br/>\n	(7).散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br/>\n	(8).侮辱或者诽谤他人，侵害他人合法权益的；<br/>\n	(9).含有法律、行政法规禁止的其他内容的。</p><h4>\n	4． 有关个人资料</h4><p>\n	用户同意：<br/>\n	(1) 提供及时、详尽及准确的个人资料。<br/>\n	(2).同意接收来自本网站的信息。<br/>\n	(3) 不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。<br/>\n	(4)本网站不公开用户的姓名、地址、电子邮箱和笔名，以下情况除外：<br/>\n	（a）用户授权本网站透露这些信息。<br/>\n	（b）相应的法律及程序要求本网站提供用户的个人资料。如果用户提供的资料包含有不正确的信息，本网站保留结束用户使用本网站信息服务资格的权利。</p><h4>\n	5. 用户在注册时应当选择稳定性及安全性相对较好的电子邮箱，并且同意接受并阅读本网站发往用户的各类电子邮件。如用户未及时从自己的电子邮箱接受电子邮件或 因用户电子邮箱或用户电子邮件接收及阅读程序本身的问题使电子邮件无法正常接收或阅读的，只要本网站成功发送了电子邮件，应当视为用户已经接收到相关的电 子邮件。电子邮件在发信服务器上所记录的发出时间视为送达时间。</h4><h4>\n	6． 服务条款的修��</h4><p>\n	本网站有权在必要时修改服务条款，本 网站服务条款一旦发生变动，将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以主动取消获得的本网站信息服务。如果用户继续享用本网站信息 服务，则视为接受服务条款的变动。本网站保留随时修改或中断服务而不需通知用户的权利。本网站行使修改或中断服务的权利，不需对用户或第三方负责。</p><h4>\n	7． 用户隐私制度</h4><p>\n	尊重用户个人隐私是本网站的一项基本政策。所以，本网站一定不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本网站中的非公开内容，除非有法律许可要求或本网站在诚信的基础上认为透露这些信息在以下四种情况是必要的：<br/>\n	(1) 遵守有关法律规定，遵从本网站合法服务程序。<br/>\n	(2) 保持维护本网站的商标所有权。<br/>\n	(3) 在紧急情况下竭力维护用户个人和社会大众的隐私安全。<br/>\n	(4)符合其他相关的要求。<br/>\n	本网站保留发布会员人口分析资询的权利。</p><h4>\n	8．用户的帐号、密码和安全性</h4><p>\n	你 一旦注册成功成为用户，你将得到一个密码和帐号。如果你不保管好自己的帐号和密码安全，将负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全 责。你可随时根据指示改变你的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，请立即通告本网站。</p><h4>\n	9． 拒绝提供担保</h4><p>\n	用户明确同意信息服务的使用由用户个人承担风险。 本网站不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保，但会在能力范围内，避免出错。</p><h4>\n	10．有限责任</h4><p>\n	本网站对任何直接、间接、偶然、特殊及继起的损害不负责任，这些损害来自：不正当使用本网站服务，或用户传送的信息不符合规定等。这些行为都有可能导致本网站形象受损，所以本网站事先提出这种损害的可能性，同时会尽量避免这种损害的发生。</p><h4>\n	11．信息的储存及限制</h4><p>\n	本网站有判定用户的行为是否符合本网站服务条款的要求和精神的权利，如果用户违背本网站服务条款的规定，本网站有权中断其服务的帐号。</p><h4>\n	12．用户管理</h4><p><strong>用户必须遵循</strong>：<br/>\n	(1) 使用信息服务不作非法用途。<br/>\n	(2) 不干扰或混乱网络服务。<br/>\n	(3) 遵守所有使用服务的网络协议、规定、程序和惯例。用户的行为准则是以因特网法规，政策、程序和惯例为根据的。</p><h4>\n	13．保障</h4><p>\n	用户同意保障和维护本网站全体成员的利益，负责支付由用户使用超出服务范围引起的律师费用，违反服务条款的损害补偿费用，其它人使用用户的电脑、帐号和其它知识产权的追索费。</p><h4>\n	14．结束服务</h4><p>\n	用户或本网站可随时根据实际情况中断一项或多项服务。本网站不需对任何个人或第三方负责而随时中断服务。用户若反对任何服务条款的建议或对后来的条款修改有异议，或对本网站服务不满，用户可以行使如下权利：<br/>\n	(1) 不再使用本网站信息服务。<br/>\n	(2) 通知本网站停止对该用户的服务。<br/>\n	结束用户服务后，用户使用本网站服务的权利马上中止。从那时起，用户没有权利，本网站也没有义务传送任何未处理的信息或未完成的服务给用户或第三方。</p><h4>\n	15．通告</h4><p>\n	所有发给用户的通告都可通过重要页面的公告或电子邮件或常规的信件传送。服务条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。</p><h4>\n	16．信息内容的所有权</h4><p>\n	本 网站定义的信息内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；本网站为用户提供的其它信息。所有这些内容受版权、商标、标签和其它财 产所有权法律的保护。所以，用户只能在本网站和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。</p><h4>\n	17．法律</h4><p>\n	本网站信息服务条款要与中华人民共和国的法律解释一致。用户和本网站一致同意服从本网站所在地有管辖权的法院管辖。如发生本网站服务条款与中华人民共和国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它条款则依旧保持对用户的约束力。</p><p>\n	&nbsp;</p>');
INSERT INTO `es_helpcenter` VALUES ('25', '490', '1337820127', '1450587176', '0', null, null, null, '20', null, '0', '隐私保护政策', '', null, '100000', null, '隐私保护政策', '', '<h2>\n		隐私保护政策</h2><h4>\n		个人信息</h4><p>\n	一般情况下，您无须提供您的姓名或其它个人信息即可访问我们的站点。但有时我们可能需要您提供一些信息，例如为了处理订单、与您联系、提供预订服务或处理工作应聘。我们可能需要这些信息完成以上事务的处理或提供更好的服务。	</p><h4>\n		用途</h4><ol class=\" list-paddingleft-2\"><li><p>\n			供我们网站交易和沟通等相关方使用，以满足您的订单等购物服务；</p></li><li><p>\n			用于与您保持联系，以开展客户满意度调查、市场研究或某些事务的处理；</p></li><li><p>\n			用于不记名的数据分析（例如点击流量数据）；</p></li><li><p>\n			帮助发展我们的业务关系（如果您是我们网站的业务合作伙伴或批发商）；</p></li></ol><p>\n	&nbsp;</p>');
INSERT INTO `es_helpcenter` VALUES ('26', '200', '1337911618', '1450588984', '1', null, null, null, '24', null, '0', '满百免运费', '', null, '100000', null, '满百免运费', '', '<p></p><ul class=\" list-paddingleft-2\" style=\"width: 687px; float: left; overflow: hidden; display: block; margin-left: 47px;\"><li><p>\n		在本商城购物，使用款到发货支付方式（网上支付，银行转账）即可享受购物满100元免邮费优惠。<br/>\n		货到付款满180元免运费。<br/>\n		愿您购物愉快！！</p></li></ul>');
INSERT INTO `es_helpcenter` VALUES ('27', '190', '1337911855', '1450589119', '2', null, null, null, '24', null, '0', '晒单免单', '', null, '100000', null, '晒单免单', '', '<p style=\"PADDING-BOTTOM: 20px; LINE-HEIGHT: 20px; PADDING-LEFT: 20px; PADDING-RIGHT: 20px\"><strong>一、 参与条件</strong><br/><span style=\"color:#333333\">只要您在本商城购买产品后就能参与晒分享。一个订单只有一次晒分享机会，多买多得。</span><br/><br/><strong>二、 参与流程</strong></p><p style=\"padding-bottom: 20px; line-height: 20px; padding-left: 20px; padding-right: 20px;\"><strong>三、 晒分享规则</strong><br/><span style=\"color:#333333\">1.分享内容需包含本商城字样以及提供链接</span><span style=\"color:#333333\">或者产品相应页面的链接。<br/>\n	2. 分享审核通过后不可擅自删除您的分享内容，否则我们有权取消您获得的奖励。<br/>\n	3. 使用优惠类礼券的订单不再享受免单奖励。</span><br/><br/><strong>四、 常见问题</strong><br/><span style=\"color:#333333\">1. 如何参与晒分享<br/>\n	如果您是本商城会员（不是会员？请先注册），成功购买产品后只要把您在本商城的购物经验或使用心得，分享到您的开心网、人人网、豆瓣、新浪微博、腾讯微博、QQ空间、豆瓣等平台，并向我们提交分享页面网址，即可获得免单机会！</span><br/><br/><span style=\"color:#333333\">2. 什么样的内容才能获得晒分享高额免单<br/>\n	（1）标题准确。标题表述清楚、能准确反映参与本商城晒分享活动主题内容。例如：本商城买的香水效果还真不错~晒下。<br/>\n	（2）主题明确、内容丰富。完整介绍在本商城的购买经历，并且内容表达合理，条理清晰。<br/>\n	（3）图片多彩。提供使用本商城产品后的自拍靓眼照、晒自己购买记录图片，增加说服力，达到图文并茂。<br/>\n	（4）评论数或转发数越高，则您获得的奖金也相应增加。</span><br/><br/><span style=\"color:#333333\">3. 参与晒分享后，需要多少时间审核？<br/>\n	在一个工作日内，本商城管理员会审核并给予回复。（工作日：上午9:00~下午5:30，节假日除外）<br/><br/>\n	4. 晒分享获得的会员账户款可以提现吗？<br/>\n	不可以。会员晒分享得到的免单奖励，本商城管理员会直接充值到您的会员帐户上，在您下次购买商品时，可用会员帐户上的余额进行支付货款。（例如：您在本商城帐户余额原有200元，通过晒分享活动获赠30元，帐户余额将有230元。）<br/><br/>\n	5. 为什么提交分享后却没有免单奖励？<br/>\n	（1）凡是通过购物返利类论坛发的晒单都没有现金奖励，涉及返利的平台有：51返利、易购、返还、比购等。<br/>\n	（2）在QQ、开心网等需互加好友或者需通过密码才能看见的晒分享，请先把密码取消并加本商城为好友，这样小编才能看到您的晒单，否则将作为无效分享。<br/>\n	（3）提交的网址有误。<br/>\n	（4）分享内容非自己原创。</span></p>');
INSERT INTO `es_helpcenter` VALUES ('28', '490', '1337913013', '1450587140', '5', null, null, null, '19', null, '0', '付款常见问题', '', null, '100000', null, '付款常见问题', '', '<ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>1.我没有支付宝帐号可以用支付宝付款吗？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		如您还没有支付宝帐号，尽量不要选择支付宝在线支付。推荐使用快钱或网上银行进行在线支付。</p></li><li><p><strong>2.本商城的支付宝跟我在淘宝买东西用的支付宝操作一样吗？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		操作基本相同。本商城是支付宝信任商家。请放心使用!</p></li><li><p><strong>3.我的订单付完款了，怎么通知你们？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		1.可以直接通过在线客服告知。<br/>\n		2.如果是银行转账请您在完成支付页面提交支付凭证，以便我们核实。<br/>\n		3.请工作时间拨打我们的服务热线：4001-234-567 告知我们：订单号、付款银行帐号及付款金额即可。</p></li><li><p><strong>4.为什么我通过在线支付完成付款了，订单还是显示：未支付？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		可能是由于网络信号传输问题造成订单未能收到成功付款的信息，你不用着急，我们会手动帮您确认付款信息。 下面两种操作都可以通知我们：<br/>\n		1.通过客服告知我们：订单号、支付平台（指：快钱或支付宝）。<br/>\n		2.请工作时间拨打我们的服务热线：4001-234-567 告知我们：订单号、支付平台（快钱或支付宝）。</p></li><li><p><strong>5.我没有开通网上银行，可以让我的朋友帮我在线付款吗？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		可以，成功付款后下面两种操作都可以通知我们：<br/>\n		1. 通过客服告知我们：订单号、支付平台（指：快钱或支付宝）。<br/>\n		2.请工作时间拨打我们的服务热线：4001-234-567 告知我们：订单号、支付平台（指：快钱或支付宝）。</p></li><li><p><strong>6.退货或换货差价，你们的退款流程是怎么做的？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		本商城售后服务部在收到您的退、换货商品后，会及时电话联系您，确定退款金额及帐号后，3个工作日内完成退款。</p></li><li><p><strong>7.我下了订单，选择款到发货（银行卡汇款或在线支付），不方便马上付款，可以等我几天再付吗？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		完全可以。查询我的订单完成支付操作。我们为每张订单提供7天的等待付款期。若您需要延长时间请电话通知我们客服人员。</p></li><li><p><strong>8.我在下单的时候选择了工商银行付款，已经提交订单，我还可以换成其他银行来支付吗？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		可以，完成付款后请通知我们您的订单号与实际付款银行。</p></li><li><p><strong>9.我的订单选择了款到发货，可以换成货到付款的方式吗？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		不可以。但您另下一张货到付款的订单即可。请别忘了取消原来已经下好的款到发货的订单哦!</p></li><li><p><strong>10.我的订单已经付款，还想修改订单怎么办？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		请工作时间联系在线客服或拨打我们的服务热线：4001-234-567 我们的客服会帮助您处理订单。</p></li><li><p><strong>11.我能用信用卡付款吗？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		我们目前已经开通信用卡在线支付，国内大多数银行的信用卡都支持。 信用卡在线支付无需开通网银。支付成功后需(1工作日内)由人工审核受理订单。</p></li></ul>');
INSERT INTO `es_helpcenter` VALUES ('29', '470', '1337913200', '1450591160', '4', null, null, null, '19', null, '0', '索取发票', '', null, '100000', null, '索取发票', '', '<ul class=\" list-paddingleft-2\" style=\"width: 687px; display: block; float: left; margin-left: 23px; overflow: hidden;\"><li><p>\n		如何索取发票：</p></li><li><p>\n		&nbsp;</p></li><li><p>\n		1）在结算页面点击索取发票。</p></li></ul><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><img alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201358374659.jpg\" title=\"show.jpg\"/></p><p><br/></p><ul class=\" list-paddingleft-2\" style=\"width: 687px; display: block; float: left; margin-left: 23px; overflow: hidden;\"><li><p>\n		2）选择发票抬头，个人或单位，单位需要填写单位完整名称。</p></li></ul><p><br/></p><p><br/></p><p><br/></p><p><img alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201358530136.jpg\" title=\"show.jpg\"/></p><p><br/></p><ul class=\" list-paddingleft-2\" style=\"width: 687px; display: block; float: left; margin-left: 23px; overflow: hidden;\"><li><p>\n		3）提交订单</p></li></ul><p><br/></p><p><br/></p><p><br/></p><p><img style=\"width: 715px; height: 407px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201358597128.jpg\" title=\"show.jpg\" height=\"407\" width=\"715\"/></p><ul class=\" list-paddingleft-2\" style=\"width: 687px; display: block; float: left; margin-left: 23px; overflow: hidden;\"><li><p>\n		发票开具说明：</p></li><li><p>\n		&nbsp;</p></li><li><p>\n		本商城所有商品均可提供正规商业发票，此发票可用作单位报销使用。发票内容只能以您所实际购买的商品开具，发票金额为商品实际支付的金额（不包括促销折扣券所抵扣的部分及运费）。<br/><br/>\n		注：发票在您收到货后30天后通过平邮寄出，请注意查收。由于涉及退换货流程问题发票不能随商品一起发出，给你造成的不便尽请谅解，如需提交索取发票其联系在线客服或拨打客服热线4001-234-567。<br/><br/>\n		注：索取发票后请您妥善保管，如发生退换货的情况，须将相应发票一并寄回。</p></li></ul>');
INSERT INTO `es_helpcenter` VALUES ('30', '500', '1337914746', '1450588596', '3', null, null, null, '22', null, '0', '配送范围', '', null, '100000', null, '配送范围', '', '<p><br/></p><ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"margin-bottom: 0px;\"><li><p><strong>本商城配送范围：</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		本商城支持全国省、直辖市在内的2000多个城市的款到发货，1000多个城市的货到付款业务 <br/>您可以查询您所在城市是否在我们的配送范围之内， 如对配送范围有任何疑问，欢迎您致电本商城客户服务热线4001-234-567进行咨询</p></li></ul>');
INSERT INTO `es_helpcenter` VALUES ('31', '450', '1337916717', '1450587073', '1', null, null, null, '17', null, '0', '常见问题', '', null, '100000', null, '常见问题', '', '<ul style=\"_margin-left: 23px\" class=\"help2_right_ul3 list-paddingleft-2\"><li><p><strong>1、本商城所售商品都是正品行货吗？售后服务怎样？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：本商城所售商品都是正品行货，免费提供发票。凭本商城销售凭证，所有商品都可以享受售后服务保障，本商城将严格针对所售商品履行换货和退货的义务。</p></li><li><p><strong>2、本商城的价格和实体店的售价为什么相差那么多？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：一件商品从生产商到总代理商、大小批发商、到租金昂贵装修豪华的实体店，每个环节层层加价，消费者只能被动接受虚高的价格，而本商城是厂家直供。</p></li><li><p><strong>3、如何在本商城购买下单？ </strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：在本商城下单与大多数购物网站是一样的，如果您对网络购物不太了解可以点击<a style=\"color: #007eff\" href=\"help-17-32.html\">本商城购物流程</a>。</p></li><li><p><strong>4、运输造成损坏怎么办？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：因路上运输造成商品损坏或者丢件由我们承担商品损失，所以您无需担心运输问题。（经过长途运输产品外包装可能会有轻微的碰撞是正常的，但并不会损坏包装盒内的商品，本商城的包装是有名的强壮哦）</p></li><li><p><strong>5、请问运费是多少？ </strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：（1）您可以点击→配送服务→运费说明。<br/>\n		&nbsp;&nbsp;&nbsp; （2）您点击商品购买后，提交订单过程中系统会告知您具体的运费运时。</p></li><li><p><strong>6、多少时间可以送到？ </strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：通常我们仓库都有现货，每天16：30之前的订单当天就可以通过快递发货,普通快递全国范围内除云南、甘肃、海南、西藏、新疆、青海，约1-4天送达，货到付款约3-7天送达（快递上门送货前可能会与您电话联系），您也可以到会员中心&gt;我的订单查询快递情况。</p></li><li><p><strong>7、我收到商品不满意怎么办？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：在您收到商品后的30天之内，如果对商品不满意、不喜欢，且未拆封使用或质量问题的前提下，您可以无条件退货或置换您满意的其它商品。</p></li><li><p><strong>8、 给不给开发票？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：我们销售的所有商品都是免费提供正规发票的，在您下订单时结算时勾选索取发票，填写相关信息，我们会在您收到货后30天（因涉及退换货流程，发票不能随商品一起发出，给您造成不便尽请谅解）以平邮的方式将发票邮寄给您，如需提前索取发票请联系在线客服或拨打客服电话：4001-234-567。</p></li><li><p><strong>9、本商城都有哪些支付方式？ </strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：我们目前支持的付款方式包括网上支付，银行转账和活到付款，详情见：<a style=\"color: #007eff\" href=\"help-19-20.html\">支付方式</a>。</p></li><li><p><strong>10、退货换货的运费怎么算？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：（1）购买商品30天内(商品未拆封使用)，由于顾客自身原因退、换等值或超值的商品时，由顾客承担退回货物至本商城时所需的运费和本商城发送的运费。邮费通过支付宝支付到<span style=\"color: #007eff\">pay@yourdomain.com</span>或者银行转账到我们的银行卡号即可。<br/>\n		&nbsp;&nbsp;&nbsp; （2）购买商品30天内且由于商品的质量问题退换货时，由本商城补贴顾客退回货物的运费（已购物券的形式返还）及本商城承担再次发送的运费。</p></li><li><p><strong>11、我是在校学生，学校的地址可以货到付款吗？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：大学以下等级的学校不支持货到付款服务。但您可以选择款到发货。</p></li></ul>');
INSERT INTO `es_helpcenter` VALUES ('32', '455', '1337916899', '1450590990', '4', null, null, null, '17', null, '0', '购物流程', '', null, '100000', null, '购物流程', '', '<ul class=\" list-paddingleft-2\" style=\"width: 687px; float: left; overflow: hidden; display: block; margin-left: 47px;\"><li><p>\n		商品订购流程</p><p><br/></p><p><br/></p><p>一、选择商品</p></li></ul><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><img style=\"width: 849px; height: 377px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201354357820.jpg\" title=\"show.jpg\" height=\"377\" width=\"849\"/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二、放入购物车</p><p><br/></p><p><br/></p><p><br/></p><p><img style=\"width: 699px; height: 237px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201355224770.jpg\" title=\"show.jpg\" height=\"237\" width=\"699\"/></p><p><br/></p><p><br/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三、填写收货人信息</p><p><br/></p><p><img alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201355539676.jpg\" title=\"show.jpg\"/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;四、确认送货方式和付款方式</p><p><br/></p><p><img alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201356016913.jpg\" title=\"show.jpg\"/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;五、提交订单，完成支付</p><p><br/></p><p><br/></p><p><img style=\"width: 791px; height: 281px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201356157133.jpg\" title=\"show.jpg\" height=\"281\" width=\"791\"/></p>');
INSERT INTO `es_helpcenter` VALUES ('33', '500', '1337918193', '1450591293', '1', null, null, null, '25', null, '0', '订单查询', '', null, '100000', null, '订单查询', '', '<ul class=\" list-paddingleft-2\" style=\"width: 687px; display: block; float: left; margin-left: 23px; overflow: hidden;\"><li><p>\n		订单查询方式：</p></li><li><p>\n		会员订单查询：</p></li></ul><p><br/></p><p><br/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登陆会员中心后，在我的订单中可以看到订单列表</p><p><br/></p><p><img style=\"width: 749px; height: 312px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201401041805.jpg\" title=\"show.jpg\" height=\"312\" width=\"749\"/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 在右侧的订单状态后面的订单状态查询输入框中输入要查询的订单号后，点击“查询（放大镜）”，就可用查询到相关订单</p><p><br/></p><p><img alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201401276815.jpg\" title=\"show.jpg\"/></p><p><br/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单签收须知：</p><ul class=\" list-paddingleft-2\" style=\"width: 687px; display: block; float: left; margin-left: 23px; overflow: hidden;\"><li><p><br/></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		1. 验货说明： 请您收到商品后务必先对商品的外包装进行检查，如包裹外包装完好无损，请您放心签收；本商城不提供验货再付<br/>\n		&nbsp;&nbsp; 款收货的服务，这是由于物流合作方规定，本商城对此将会尽力改进，请您谅解。如有疑虑请及时联系在线客服或本商城客服<br/>\n		&nbsp;&nbsp; 中心4001-234-567进行查询，客服会及时为您处理。<br/>\n		2. 签收说明： 需要您先签收后验货。您签收后发现商品有破损，可以直接联系本商城在线客服或客服电话4001-234-567，我们可<br/>\n		&nbsp;&nbsp; 以为您做相关处理。</p></li><li><p>\n		配送异常情况说明：</p></li><li><p>\n		&nbsp;</p></li><li><p>\n		1. 快递配送：由于配送前不会与收件人电话联系，而是直接按收件地址进行配送，所以会出现未妥投（地址无人接收），或者他<br/>\n		&nbsp;&nbsp; 人代签收的情况。如果您一直没有收到商品，请及时查询订单快递详情，或联系本商城在线客服、本商城客服电话4001-234-<br/>\n		&nbsp;&nbsp;&nbsp;567进行查询。<br/>\n		2. 延迟投递：您的货物已经到达当地的配送点，但由于时间原因需延迟到第二天派件。请您再耐心等待一天。<br/>\n		3. 宅急送：由于宅急送有些地区的货到付款款项交接，所以时间会有延时，如出现任何配送问题请及时与本商城在线客服联系或<br/>\n		&nbsp;&nbsp;&nbsp;拨打客服电话4001-234-567。</p></li></ul>');
INSERT INTO `es_helpcenter` VALUES ('34', '450', '1337919451', '1450587340', '2', null, null, null, '25', null, '0', '订单常见问题', '', null, '100000', null, '订单常见问题', '', '<ul class=\" list-paddingleft-2\" style=\"width: 687px; display: block; float: left; color: #333333; margin-left: 23px; overflow: hidden\"><li><p>\n		订单状态说明</p></li><li><p>\n		&nbsp;</p></li><li><p>\n		1、等待付款：除支付方式为货到付款的订单,均需要您在下订单后完成支付操作,您的订单才正式生效,本商城才会进行配货发<br/>\n		&nbsp;&nbsp;&nbsp;货,由于您付款延迟造成的订单缺货,我们表示抱歉。（注：若您需要修改订单，需要自行取消订单，再重新下订单）<br/>\n		2、已付款待确认：您已成功提交订单，我们会在工作时间内尽快审核、确认您的订单，如长时间未被确认，请联系商城客服或<br/>\n		&nbsp;&nbsp;&nbsp;拨打客服热线4001-234-567；<br/>\n		3、已付款：表示您的订单货款我们已收到并核对。<br/>\n		4、配货中：表示您的订单已处于配货环节，最晚将在3天内完成这个环节。<br/>\n		5、配货完成待发货：表示您的订单货物已完成配货待快递发出。<br/>\n		6、已发货：表示您的订单货物已发出，您可以根据物流号在本站或相关物流公司网站查询您的订单配送状态。<br/>\n		7、已收货：表示您已收到、核对您所购买的商品并确认签收，此项订单交易成功。<br/>\n		8、已完成：表示您已核对并签收您的商品30天。<br/>\n		9、已取消：表示由您自己或委托客户取消的订单。<br/>\n		10、已确认（货到付款）：货到付款的订单需要本商城人员确认。</p></li><li><p>\n		修改订单</p></li><li><p>\n		&nbsp;</p></li><li><p>\n		1、订单成功提交后，您在未支付前随时可修改或取消您的订单，如果您的订单已完成支付手续，请联络我们的客服人员为您修<br/>\n		&nbsp;&nbsp;&nbsp;改。<br/>\n		2、选择货到付款的客户，在订单状态为已确认之前随时可修改或取消您的订单，如果您的订单已确认请联络我们的客服人员为<br/>\n		&nbsp;&nbsp;&nbsp;您修改。<br/>\n		3、您可以进入&quot;在线客服&quot;向客服人员咨询,客服离线情况下可以给客服留言。或者通过拨打我们的客服热线4001-234-567来修<br/>\n		&nbsp;&nbsp;&nbsp;改您的订单。 &nbsp;</p></li><li><p>\n		Q：如何快速找到我喜欢的商品？<br/><span style=\"color: #808080\">A：除了通过导航栏的按钮、主页左侧的商品分类来浏览相关商品外，还可通过每页上部侧的搜索框来查找商品。</span><br/><br/>\n		Q: 我不清楚邮编号码怎么办？<br/><span style=\"color: #808080\">A: 请尽量填写，正确的邮编信息您可以通过拨打当地的邮政11185热线查询 。</span><br/><br/>\n		Q：我的订单选择了款到发货，可以换成货到付款的方式吗？<br/><span style=\"color: #808080\">A：您只需另下一张货到付款的订单即可。但别忘了取消原来已经下好的款到发货的订单哦!</span><br/><br/>\n		Q：我的订单已经付款，还想修改订单怎么办？<br/><span style=\"color: #808080\">A：请立即拨打服务热线：4001-234-567，我们的客服会帮助您修改订单。</span><br/><br/>\n		Q: 我没有固定的收货地址怎么办？<br/><span style=\"color: #808080\">A: 如您可以到离您最近的快递公司去取货也可以下订单，但需电话联系我们的客服。</span><br/><br/>\n		Q：我如何在本商城下订单购买？<br/><span style=\"color: #808080\">A：在本商城购物非常简单快捷。如果您还不是本商城的会员，可以直接购买或请您先注册成为我们的会员（可享受会员优惠和购<br/>\n		&nbsp;&nbsp;&nbsp;物礼券等优惠活动），如果您已经注册成为我们的会员请您先登录我们网站。然后在您所选择的商品页面选择您所要商品的规<br/>\n		&nbsp;&nbsp;&nbsp;格和数量，然后点击立刻购买按钮即可。然后就是按照你所选择的支付方式操作，本商城的工作人员会在后台看到您的<br/>\n		&nbsp;&nbsp;&nbsp;订单后尽快和您确认，我们在确认收到您的款项后会根据您在购物订单填写的地址和收件人给您配送货物。<br/>\n		&nbsp;&nbsp;&nbsp;如果您还有不明白的地方，请点击</span><a style=\"color: #000000\" href=\"help-17-32.html\">本商城购买流程</a>。<br/><br/><a name=\"order_merger\"></a>Q:我下了两张订单怎么合并订单？<br/><span style=\"color: #808080\">A:1.若两张订单均处于“待审核”状态，请直接删除两张订单后再重新下订单即可。<br/>\n		&nbsp;&nbsp;&nbsp;2.若其中一张订单已被受理，请工作时间联系本商城在线客服或拨打我们的服务热线：4001-234-567 ，我们的客服会帮助您处<br/>\n		&nbsp;&nbsp;&nbsp;理。</span></p></li></ul>');

-- ----------------------------
-- Table structure for es_hot_keyword
-- ----------------------------
DROP TABLE IF EXISTS `es_hot_keyword`;
CREATE TABLE `es_hot_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `lastmodified` bigint(20) DEFAULT NULL,
  `hit` bigint(20) DEFAULT NULL,
  `able_time` bigint(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `is_commend` int(11) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT '0',
  `page_title` varchar(255) DEFAULT NULL,
  `page_keywords` varchar(255) DEFAULT NULL,
  `page_description` longtext,
  `site_code` int(11) DEFAULT '100000',
  `siteidlist` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `hot_searchword` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_hot_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for es_index_item
-- ----------------------------
DROP TABLE IF EXISTS `es_index_item`;
CREATE TABLE `es_index_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_index_item
-- ----------------------------
INSERT INTO `es_index_item` VALUES ('1', '站点统计信息', '/core/admin/indexItem/base.do', '1');
INSERT INTO `es_index_item` VALUES ('2', '订单统计信息', '/shop/admin/indexItem/order.do', '2');
INSERT INTO `es_index_item` VALUES ('3', '商品统计信息', '/shop/admin/indexItem/goods.do', '3');

-- ----------------------------
-- Table structure for es_limitbuy
-- ----------------------------
DROP TABLE IF EXISTS `es_limitbuy`;
CREATE TABLE `es_limitbuy` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `is_index` int(8) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_limitbuy
-- ----------------------------

-- ----------------------------
-- Table structure for es_limitbuy_goods
-- ----------------------------
DROP TABLE IF EXISTS `es_limitbuy_goods`;
CREATE TABLE `es_limitbuy_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `limitbuyid` int(10) DEFAULT NULL,
  `goodsid` int(10) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_limitbuy_goods
-- ----------------------------

-- ----------------------------
-- Table structure for es_logi_company
-- ----------------------------
DROP TABLE IF EXISTS `es_logi_company`;
CREATE TABLE `es_logi_company` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_logi_company
-- ----------------------------
INSERT INTO `es_logi_company` VALUES ('1', '圆通速递', 'yuantong');
INSERT INTO `es_logi_company` VALUES ('2', '宅急送', 'zhaijisong');
INSERT INTO `es_logi_company` VALUES ('3', '中通速递', 'zhongtong');
INSERT INTO `es_logi_company` VALUES ('4', '申通快递', 'shentong');
INSERT INTO `es_logi_company` VALUES ('5', '顺丰速递', 'shunfeng');

-- ----------------------------
-- Table structure for es_member
-- ----------------------------
DROP TABLE IF EXISTS `es_member`;
CREATE TABLE `es_member` (
  `member_id` int(8) NOT NULL AUTO_INCREMENT,
  `agentid` int(10) DEFAULT NULL,
  `parentid` int(10) DEFAULT '0',
  `parentids` varchar(8000) DEFAULT NULL,
  `lv_id` int(8) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `regtime` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` int(8) DEFAULT NULL,
  `birthday` bigint(20) DEFAULT NULL,
  `advance` decimal(20,2) DEFAULT '0.00',
  `province_id` int(10) DEFAULT NULL,
  `city_id` int(10) DEFAULT NULL,
  `region_id` int(10) DEFAULT NULL,
  `town_id` int(10) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `point` int(10) DEFAULT '0',
  `mp` int(10) DEFAULT '0',
  `QQ` varchar(50) DEFAULT NULL,
  `msn` varchar(50) DEFAULT NULL,
  `remark` longtext,
  `lastlogin` bigint(20) DEFAULT '1280629569',
  `is_agent` int(8) DEFAULT '0',
  `agent_code` varchar(32) DEFAULT NULL,
  `agent_status` int(8) DEFAULT '0',
  `agent_remark` varchar(512) DEFAULT NULL,
  `review_time` bigint(20) DEFAULT NULL,
  `logincount` int(10) DEFAULT '0',
  `is_cheked` int(8) DEFAULT '0',
  `registerip` varchar(255) DEFAULT NULL,
  `recommend_point_state` int(8) DEFAULT '0',
  `last_send_email` int(10) DEFAULT NULL,
  `info_full` int(8) DEFAULT '0',
  `find_code` varchar(255) DEFAULT NULL,
  `face` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `midentity` int(8) DEFAULT NULL,
  `disabled` smallint(1) DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `ind_member_uname` (`uname`,`email`),
  KEY `ind_member_lvid` (`lv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_member
-- ----------------------------
INSERT INTO `es_member` VALUES ('1', null, null, '', '1', 'test', 'xx@mail.com', 'e10adc3949ba59abbe56e057f20f883e', null, 'tao xiang', '1', '0', '0.00', '1', '2800', '2848', null, '北京', '海淀区', '三环以内', '', 'on the world', null, null, '18161178527', '45', '45', null, null, null, '1532937353', '0', 'TEST0001', '0', null, null, '660', '0', null, '0', null, '0', null, 'fs:/attachment/faceFile/2018/7/17/13//31518581.png', null, '0', '0');
INSERT INTO `es_member` VALUES ('30', null, '1', '[1]', '1', 'test001', null, 'fa820cc1ad39a4e99283e9fa555035ec', '1531909397', 'test001', '1', null, '0.00', null, null, null, null, null, null, null, null, null, null, '13502510234', null, '5', '5', null, null, null, '1531994758', '1', 'ojwj6d86', '0', null, null, '7', '0', '127.0.0.1', '0', null, '0', null, '', 'test001', '0', '0');
INSERT INTO `es_member` VALUES ('31', null, '30', '[1],[30]', '1', 'test0011', null, '9a3f4ed8653d64a2a5c7881b4339a64e', '1531910228', 'test0011', '1', null, '0.00', null, null, null, null, null, null, null, null, null, null, '13515152156', null, '10', '10', null, null, null, '1532082547', '1', 'lpdwcpxg', '0', null, null, '19', '0', '127.0.0.1', '0', null, '0', null, '', 'test0011', '0', '0');
INSERT INTO `es_member` VALUES ('32', null, '30', '[1],[30]', '1', 'test0012', null, '55baf0d2ab0bc5a6927b4b97b975e170', '1531990576', 'test0012', '1', null, '0.00', null, null, null, null, null, null, null, null, null, null, '13544445555', null, '0', '0', null, null, null, '1531990576', '1', 'tadzag1p', '0', null, null, '1', '0', '127.0.0.1', '0', null, '0', null, '', 'test0012', '0', '0');
INSERT INTO `es_member` VALUES ('33', null, '1', ',[1]', '1', 'test123', null, 'e10adc3949ba59abbe56e057f20f883e', '1532585046', 'test123', '1', null, '0.00', null, null, null, null, null, null, null, null, null, null, '18161178527', null, '0', '0', null, null, null, '1532585689', '1', 'tb75qx1e', '0', null, null, '1', '0', '192.168.2.194', '0', null, '0', null, '', 'test123', '0', '0');
INSERT INTO `es_member` VALUES ('34', null, '1', ',[1]', '1', 'testces', null, 'e10adc3949ba59abbe56e057f20f883e', '1532585091', 'testces', '1', null, '0.00', null, null, null, null, null, null, null, null, null, null, '18161178526', null, '0', '0', null, null, null, '1532585091', '1', 'fyfag23s', '0', null, null, '0', '0', '192.168.2.194', '0', null, '0', null, '', 'testces', '0', '0');
INSERT INTO `es_member` VALUES ('35', null, '1', ',[1]', '1', 'xx11', null, '96e79218965eb72c92a549dd5a330112', '1532585257', 'xx11', '1', null, '0.00', null, null, null, null, null, null, null, null, null, null, '15228959828', null, '0', '0', null, null, null, '1532585257', '1', '6uvuise1', '0', null, null, '0', '0', '192.168.2.155', '0', null, '0', null, '', 'xx11', '0', '0');
INSERT INTO `es_member` VALUES ('36', null, '1', ',[1]', '1', 'xx22', null, '96e79218965eb72c92a549dd5a330112', '1532585567', 'xx22', '1', null, '0.00', null, null, null, null, null, null, null, null, null, null, '15228959829', null, '0', '0', null, null, null, '1532585567', '1', 'awya8vhw', '0', null, null, '1', '0', '192.168.2.155', '0', null, '0', null, '', 'xx22', '0', '0');
INSERT INTO `es_member` VALUES ('37', null, '1', ',[1]', '1', 'llll', null, 'e10adc3949ba59abbe56e057f20f883e', '1532585841', 'llll', '1', null, '0.00', null, null, null, null, null, null, null, null, null, null, '13333333333', null, '0', '0', null, null, null, '1532587473', '1', 'ygesnid5', '0', null, null, '2', '0', '192.168.2.194', '0', null, '0', null, '', 'llll', '0', '0');

-- ----------------------------
-- Table structure for es_member_address
-- ----------------------------
DROP TABLE IF EXISTS `es_member_address`;
CREATE TABLE `es_member_address` (
  `addr_id` int(8) NOT NULL AUTO_INCREMENT,
  `member_id` int(8) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `province_id` int(10) DEFAULT NULL,
  `city_id` int(10) DEFAULT NULL,
  `region_id` int(10) DEFAULT NULL,
  `town_id` int(10) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `def_addr` int(10) DEFAULT '0',
  `isDel` int(10) DEFAULT '0',
  `shipAddressName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`addr_id`),
  KEY `ind_mem_addr` (`member_id`,`isDel`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_member_address
-- ----------------------------
INSERT INTO `es_member_address` VALUES ('1', '2', '向涛', null, '1', '2800', '2848', null, '三环以内', '海淀区', '北京', '', 'on the world', null, null, '18161178527', '1', '0', '公司');
INSERT INTO `es_member_address` VALUES ('2', '1', 'tao xiang', null, '1', '2800', '2848', null, '三环以内', '海淀区', '北京', '', 'on the world', null, null, '18161178527', '1', '0', '公司');
INSERT INTO `es_member_address` VALUES ('3', '19', 'xiangtao', null, '1', '2800', '2848', '-1', '三环以内', '海淀区', '北京', '', 'on the world', null, null, '18161178527', '1', '0', '公司');
INSERT INTO `es_member_address` VALUES ('4', '30', 'xaingtao', null, '1', '2800', '2848', '-1', '三环以内', '海淀区', '北京', '', 'on the world', null, null, '18161178527', '1', '0', '公司');
INSERT INTO `es_member_address` VALUES ('5', '31', 'test', null, '1', '2800', '2848', '-1', '三环以内', '海淀区', '北京', '', 'on the world', null, null, '18161178527', '1', '0', '公司');
INSERT INTO `es_member_address` VALUES ('6', '37', '2', null, '1', '2805', '2832', null, '四环到五环之间', '丰台区', '北京', '', '626', null, null, '13223232232', '1', '0', '2');

-- ----------------------------
-- Table structure for es_member_bank
-- ----------------------------
DROP TABLE IF EXISTS `es_member_bank`;
CREATE TABLE `es_member_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(8) NOT NULL,
  `bankname` varchar(255) NOT NULL,
  `bankaccount` varchar(255) NOT NULL,
  `bankno` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_member_bank
-- ----------------------------
INSERT INTO `es_member_bank` VALUES ('1', '1', '中国农业银行', '王五2', '6228241234657890124');

-- ----------------------------
-- Table structure for es_member_bonus
-- ----------------------------
DROP TABLE IF EXISTS `es_member_bonus`;
CREATE TABLE `es_member_bonus` (
  `bonus_id` int(8) NOT NULL AUTO_INCREMENT,
  `bonus_type_id` int(10) DEFAULT NULL,
  `bonus_sn` varchar(30) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `used_time` bigint(20) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `emailed` int(8) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `binding` int(10) DEFAULT NULL,
  `member_name` varchar(100) DEFAULT NULL,
  `order_sn` varchar(100) DEFAULT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `bonus_type` int(8) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `used` int(2) DEFAULT '0',
  PRIMARY KEY (`bonus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_member_bonus
-- ----------------------------

-- ----------------------------
-- Table structure for es_member_comment
-- ----------------------------
DROP TABLE IF EXISTS `es_member_comment`;
CREATE TABLE `es_member_comment` (
  `comment_id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `content` longtext,
  `img` varchar(255) DEFAULT NULL,
  `dateline` bigint(20) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reply` longtext,
  `replytime` bigint(20) DEFAULT NULL,
  `status` int(8) DEFAULT NULL,
  `type` int(8) DEFAULT NULL,
  `replystatus` int(8) DEFAULT NULL,
  `grade` int(10) DEFAULT NULL,
  `is_top` int(8) NOT NULL DEFAULT '0',
  `product_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_member_comment
-- ----------------------------

-- ----------------------------
-- Table structure for es_member_comment_gallery
-- ----------------------------
DROP TABLE IF EXISTS `es_member_comment_gallery`;
CREATE TABLE `es_member_comment_gallery` (
  `img_id` int(10) NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) DEFAULT NULL,
  `original` varchar(255) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_member_comment_gallery
-- ----------------------------

-- ----------------------------
-- Table structure for es_member_coupon
-- ----------------------------
DROP TABLE IF EXISTS `es_member_coupon`;
CREATE TABLE `es_member_coupon` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cpnsid` int(10) DEFAULT NULL,
  `memberid` int(10) DEFAULT NULL,
  `used` int(8) DEFAULT NULL,
  `get_time` int(11) DEFAULT NULL,
  `cpns_sn` varchar(255) DEFAULT NULL,
  `cpns_name` varchar(255) DEFAULT NULL,
  `cat_ids` varchar(1000) DEFAULT NULL,
  `cat_names` varchar(1000) DEFAULT NULL,
  `goods_price` varchar(22) DEFAULT NULL,
  `discount_price` varchar(22) DEFAULT NULL,
  `allcat` int(8) DEFAULT '0',
  `end_time` int(11) DEFAULT NULL,
  `can_give` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_member_coupon` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_member_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for es_member_lv
-- ----------------------------
DROP TABLE IF EXISTS `es_member_lv`;
CREATE TABLE `es_member_lv` (
  `lv_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `default_lv` int(8) DEFAULT NULL,
  `discount` int(10) DEFAULT NULL,
  `point` int(10) DEFAULT '0',
  PRIMARY KEY (`lv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_member_lv
-- ----------------------------
INSERT INTO `es_member_lv` VALUES ('1', '普通会员', '1', '100', '0');
INSERT INTO `es_member_lv` VALUES ('2', '黄金会员', '0', '98', '300');
INSERT INTO `es_member_lv` VALUES ('3', '白金会员', '0', '95', '1200');
INSERT INTO `es_member_lv` VALUES ('4', '钻石卡VIP会员', '0', '92', '5000');

-- ----------------------------
-- Table structure for es_member_lv_discount
-- ----------------------------
DROP TABLE IF EXISTS `es_member_lv_discount`;
CREATE TABLE `es_member_lv_discount` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `lv_id` int(8) DEFAULT NULL,
  `cat_id` int(8) DEFAULT NULL,
  `discount` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `es_ind_mem_lv_dis` (`lv_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_member_lv_discount
-- ----------------------------

-- ----------------------------
-- Table structure for es_member_order_item
-- ----------------------------
DROP TABLE IF EXISTS `es_member_order_item`;
CREATE TABLE `es_member_order_item` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `item_id` int(10) DEFAULT NULL,
  `commented` varchar(4) DEFAULT NULL,
  `comment_time` bigint(20) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_member_order_item_index` (`member_id`,`goods_id`,`order_id`,`item_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_member_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for es_menu
-- ----------------------------
DROP TABLE IF EXISTS `es_menu`;
CREATE TABLE `es_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `sorder` int(11) DEFAULT '50',
  `menutype` int(11) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `selected` int(6) DEFAULT '0',
  `deleteflag` int(6) DEFAULT '0',
  `canexp` int(6) DEFAULT '0',
  `icon` varchar(255) DEFAULT NULL,
  `icon_hover` varchar(255) DEFAULT NULL,
  `is_display` int(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_menu
-- ----------------------------
INSERT INTO `es_menu` VALUES ('1', '', '0', '商品', '/shop/admin/goods/list.do', '', '50', '2', null, '1', '0', '1', '/adminthemes/new/images/menu_01.gif', null, '0');
INSERT INTO `es_menu` VALUES ('2', '', '1', '商品管理', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('3', '', '2', '商品列表', '/shop/admin/goods/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('4', '', '2', '添加商品', '/shop/admin/goods/select-cat.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('5', '', '2', '进货', '/shop/admin/goods-store/list-goods-store.do?optype=purchase', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('6', '', '2', '库存维护', '/shop/admin/goods-store/list-goods-store.do?optype=view', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('7', '', '2', '预警货品', '/shop/admin/goods-warning-store/list-goods-warningstore.do?optype=view', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('8', '', '1', '商品设置', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('9', '', '8', '分类列表', '/shop/admin/cat/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('10', '', '8', '品牌列表', '/shop/admin/brand/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('11', '', '8', '类型列表', '/shop/admin/type/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('12', '', '8', '规格列表', '/shop/admin/spec/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('13', '', '1', '商品评论', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('14', '', '13', '商品评论列表', '/shop/admin/comments/list.do?type=1', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('15', '', '13', '购买咨询列表', '/shop/admin/comments/list.do?type=2', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('16', '', '1', '标签管理', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('17', '', '16', '标签列表', '/shop/admin/tag/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('18', '', '16', '标签商品设置', '/shop/admin/goods-show/tag-list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('19', '', '16', '标签品牌设置', '/shop/admin/brands-show/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('20', '', '0', '订单', '/shop/admin/order/list.do', 'ajax', '50', '2', null, '0', '0', '1', '/adminthemes/new/images/menu_default.gif', null, '0');
INSERT INTO `es_menu` VALUES ('21', '', '20', '订单管理', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('22', '', '21', '订单列表', '/shop/admin/order/list.do', 'ajax', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('23', '', '21', '待结算订单', '/shop/admin/order/not-pay-order.do', 'ajax', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('24', '', '21', '待发货订单', '/shop/admin/order/not-ship-order.do', 'ajax', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('25', '', '21', '待收货订单', '/shop/admin/order/not-rog-order.do', 'ajax', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('26', '', '20', '单据管理', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('27', '', '26', '收款单', '/shop/admin/order-report/payment-list.do', 'ajax', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('28', '', '26', '发货单', '/shop/admin/order-report/shipping-list.do', 'ajax', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('29', '', '26', '退货单', '/shop/admin/order-report/returned-list.do', 'ajax', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('30', '', '26', '退款单', '/shop/admin/order-report/refund-list.do', 'ajax', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('31', '', '20', '订单申请', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('32', '', '31', '退款申请', '/shop/admin/sell-back/refund-list.do', 'ajax', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('33', '', '31', '退货申请', '/shop/admin/order-report/returned-list.do?status=0', 'ajax', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('34', '', '20', '发票管理', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('35', '', '34', '历史发票 ', '/shop/admin/receipt/history-list.do', 'ajax', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('36', '', '0', '会员', '/shop/admin/member/member-list.do', '', '50', '2', null, '0', '0', '1', '/adminthemes/new/images/menu_03.gif', null, '0');
INSERT INTO `es_menu` VALUES ('37', '', '36', '会员管理', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('38', '', '37', '会员列表', '/shop/admin/member/member-list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('39', '', '37', '会员等级', '/shop/admin/member/list-lv.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('40', '', '37', '会员回收站', '/shop/admin/member/list-recycle.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('41', '', '36', '会员短消息', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('42', '', '41', '历史消息', '/shop/admin/message/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('43', '', '0', '促销', '/shop/admin/activities/index.jsp', '', '50', '2', null, '0', '0', '1', '/adminthemes/new/images/menu_04.gif', null, '0');
INSERT INTO `es_menu` VALUES ('44', '', '43', '促销活动管理', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('45', '', '44', '促销活动列表', '/shop/admin/activity/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('46', '', '43', '赠品管理', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('47', '', '46', '赠品列表', '/shop/admin/gift/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('48', '', '43', '优惠券管理', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('49', '', '48', '优惠券列表', '/shop/admin/bonus-type/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('50', '', '0', '页面', '/core/admin/user/siteTheme.do', '', '50', '2', null, '0', '0', '1', '/adminthemes/new/images/menu_05.gif', null, '0');
INSERT INTO `es_menu` VALUES ('51', '', '50', '装修', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('52', '', '51', '首页楼层管理', '/core/admin/floor/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('53', '', '51', '橱窗管理', '/core/admin/showcase/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('54', '', '51', '专题管理', '/core/admin/subject/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('55', '', '50', '广告管理', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('56', '', '55', '广告位', '/core/admin/adColumn/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('57', '', '55', '广告列表', '/core/admin/adv/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('58', '', '50', '页面设置', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('59', '', '58', '导航栏管理', '/core/admin/site-menu/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('60', '', '58', '热门关键字', '/cms/admin/data/list.do?catid=1', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('61', '', '58', '帮助中心', '/cms/admin/data/help-list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('62', '', '0', '统计', '', '', '50', '2', null, '0', '0', '1', '/adminthemes/new/images/menu_05.gif', null, '0');
INSERT INTO `es_menu` VALUES ('63', '', '62', '会员分析', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('64', '', '63', '会员下单量统计', '/shop/admin/memberStatistics/member-analysis-html.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('65', '', '63', '新增会员统计', '/shop/admin/memberStatistics/add-member-num-html.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('66', '', '62', '商品统计', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('67', '', '66', '价格销量', '/shop/admin/goodsStatis/price-sales.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('68', '', '66', '热卖商品统计', '/shop/admin/goodsStatis/hot-goods.do?statis_type=1', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('69', '', '66', '商品销售明细', '/shop/admin/goodsStatis/goods-sales-detail.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('70', '', '66', '商品收藏统计', '/shop/admin/goodsStatis/goods-collect.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('71', '', '62', '行业分析', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('72', '', '71', '行业规模', '/shop/admin/industryStatistics/show-page.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('73', '', '71', '概括总览', '/shop/admin/industryStatistics/show-collect.do?cat_id=0', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('74', '', '62', '流量分析', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('75', '', '74', '流量分析', '/shop/admin/flowStatistics/flow-statistics-html.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('76', '', '74', '商品流量分析', '/shop/admin/flowStatistics/goods-flow-statistics-html.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('77', '', '62', '其他统计', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('78', '', '77', '订单统计', '/shop/admin/salesStatis/order-statis.do?order_statis_type=1', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('79', '', '77', '销售收入统计', '/shop/admin/salesStatis/sale-income.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('80', '', '77', '区域分析', '/shop/admin/regionOrderStatistics/region-list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('81', '', '77', '客单价分布图', '/shop/admin/memberStatistics/buy-analysis-html.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('82', '', '77', '退款统计', '/shop/admin/orderReturnedStatistics/returned-statistics.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('83', '', '62', '日志管理', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('84', '', '83', '日志管理', '/shop/admin/logs/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('85', '', '0', '设置', '/core/admin/setting/edit_input.do', '', '50', '2', null, '0', '0', '1', '/adminthemes/new/images/menu_06.gif', null, '0');
INSERT INTO `es_menu` VALUES ('86', '', '85', '网店设置', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('87', '', '86', '系统设置', '/core/admin/setting/edit-input.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('88', '', '86', 'smtp设置', '/core/admin/smtp/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('89', '', '86', '短信网关设置', '/core/admin/sms/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('90', '', '86', '快递平台设置', '/shop/admin/express/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('91', '', '86', '发票设置', '/shop/admin/receipt/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('92', '', '85', '配送和支付', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('93', '', '92', '支付方式', '/shop/admin/payCfg/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('94', '', '92', '配送方式', '/shop/admin/dly-type/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('95', '', '92', '物流公司', '/shop/admin/logi/list-logi.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('96', '', '92', '地区管理', '/shop/admin/region/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('97', '', '92', '仓库管理', '/shop/admin/depot/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('98', '', '85', '快递单管理', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('99', '', '98', '快递单模板管理', '/shop/admin/print-tmpl/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('100', '', '98', '发货信息管理', '/shop/admin/dly-center/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('101', '', '85', '权限管理', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('102', '', '101', '管理员管理', '/core/admin/userAdmin/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('103', '', '101', '角色管理', '/core/admin/role/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('104', '', '101', '权限点管理', '/core/admin/auth/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('105', '', '0', '开发者', '/admin/setting/setting/edit_input.do', '', '50', '2', null, '0', '0', '1', '/adminthemes/new/images/menu_07.gif', null, '0');
INSERT INTO `es_menu` VALUES ('106', '', '105', '工具', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('107', '', '106', 'URL映射', '/core/admin/themeUri/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('108', '', '106', '菜单管理', '/core/admin/menu/tree.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('109', '', '106', '数据导出', '/core/admin/data-export/export.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('110', '', '105', '主题管理', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('111', '', '110', '站点前台主题', '/core/admin/user/siteTheme/info.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('112', '', '110', '站点后台主题', '/core/admin/user/siteAdminTheme/info.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('113', '', '105', '页面管理', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('114', '', '113', '文章模型', '/cms/admin/model/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('115', '', '113', '文章管理', '/cms/admin/cat/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('116', '', '105', '组件', '', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('117', '', '116', '组件管理', '/core/admin/component/list.do', '', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('118', '', '0', '浏览网站', '../', '_blank', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('119', '', '0', '退出', '/admin/logout.do', '_self', '50', '2', null, '0', '0', '1', '', null, '0');
INSERT INTO `es_menu` VALUES ('120', null, '37', '销量管理', '/shop/admin/sale/list.do', '', '50', '2', null, '0', '0', '1', 'default.png', null, '0');
INSERT INTO `es_menu` VALUES ('121', null, '0', '代加工', '', '', '60', '2', null, '0', '0', '1', 'default.png', null, '0');
INSERT INTO `es_menu` VALUES ('122', null, '121', '客户管理', '', '', '10', '2', null, '0', '0', '1', 'default.png', null, '0');
INSERT INTO `es_menu` VALUES ('123', null, '122', '客户列表', '/shop/admin/oem/customer/list.do', '', '10', '2', null, '0', '0', '1', 'default.png', null, '0');
INSERT INTO `es_menu` VALUES ('124', null, '121', '商品管理', '', '', '20', '2', null, '0', '0', '1', 'default.png', null, '0');
INSERT INTO `es_menu` VALUES ('125', null, '124', '商品列表', '/shop/admin/oem/goods/list.do', '', '10', '2', null, '0', '0', '1', 'default.png', null, '0');
INSERT INTO `es_menu` VALUES ('126', null, '121', '订单管理', '/', '', '30', '2', null, '0', '0', '1', 'default.png', null, '0');
INSERT INTO `es_menu` VALUES ('127', null, '126', '未发货订单列表', '/shop/admin/oem/order/unshipList.do', '', '10', '2', null, '0', '0', '1', 'default.png', null, '0');
INSERT INTO `es_menu` VALUES ('128', null, '126', '已发货订单列表', '/shop/admin/oem/order/shipList.do', '', '20', '2', null, '0', '0', '1', 'default.png', null, '0');
INSERT INTO `es_menu` VALUES ('129', null, '121', '快递配置管理', '', '', '40', '2', null, '0', '0', '1', 'default.png', null, '0');
INSERT INTO `es_menu` VALUES ('130', null, '129', '快递配置列表', '/shop/admin/oem/express/list.do', '', '10', '2', null, '0', '0', '1', 'default.png', null, '0');

-- ----------------------------
-- Table structure for es_message
-- ----------------------------
DROP TABLE IF EXISTS `es_message`;
CREATE TABLE `es_message` (
  `msg_id` int(8) NOT NULL AUTO_INCREMENT,
  `for_id` int(8) NOT NULL DEFAULT '0',
  `msg_from` varchar(30) NOT NULL DEFAULT 'anonymous',
  `from_id` int(8) DEFAULT '0',
  `from_type` int(5) NOT NULL DEFAULT '0',
  `to_id` int(8) NOT NULL DEFAULT '0',
  `msg_to` varchar(50) DEFAULT NULL,
  `to_type` int(5) NOT NULL DEFAULT '0',
  `unread` varchar(1) NOT NULL DEFAULT '0',
  `folder` varchar(6) NOT NULL DEFAULT 'inbox',
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `subject` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `rel_order` bigint(20) DEFAULT '0',
  `date_line` bigint(20) NOT NULL DEFAULT '0',
  `is_sec` varchar(5) NOT NULL DEFAULT 'true',
  `del_status` varchar(1) DEFAULT '0',
  `disabled` varchar(5) NOT NULL DEFAULT 'false',
  `msg_ip` varchar(20) NOT NULL DEFAULT '',
  `msg_type` varchar(7) NOT NULL DEFAULT 'default',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_message
-- ----------------------------

-- ----------------------------
-- Table structure for es_message_bg
-- ----------------------------
DROP TABLE IF EXISTS `es_message_bg`;
CREATE TABLE `es_message_bg` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `msg_content` longtext NOT NULL,
  `msg_title` varchar(100) NOT NULL,
  `member_ids` varchar(255) DEFAULT NULL,
  `adminuser_id` int(10) NOT NULL,
  `send_time` bigint(20) NOT NULL,
  `send_type` int(10) NOT NULL,
  `adminuser_name` varchar(255) NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_message_bg
-- ----------------------------

-- ----------------------------
-- Table structure for es_message_front
-- ----------------------------
DROP TABLE IF EXISTS `es_message_front`;
CREATE TABLE `es_message_front` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `msg_content` longtext NOT NULL,
  `msg_title` varchar(100) NOT NULL,
  `member_id` int(10) NOT NULL,
  `adminuser_id` int(10) NOT NULL,
  `send_time` bigint(20) NOT NULL,
  `is_delete` int(10) NOT NULL,
  `is_read` int(10) NOT NULL,
  `adminuser_name` varchar(255) NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_message_front
-- ----------------------------

-- ----------------------------
-- Table structure for es_month_bonus
-- ----------------------------
DROP TABLE IF EXISTS `es_month_bonus`;
CREATE TABLE `es_month_bonus` (
  `member_id` int(11) NOT NULL,
  `month` varchar(20) NOT NULL,
  `person_bonus` decimal(10,2) DEFAULT '0.00',
  `team_bonus` decimal(10,2) DEFAULT '0.00',
  `person_sale` decimal(10,2) DEFAULT '0.00',
  `team_sale` decimal(10,2) DEFAULT '0.00',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `recount` tinyint(1) DEFAULT '1' COMMENT '是否需要重新计算。1.需要,0.不需要',
  PRIMARY KEY (`member_id`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_month_bonus
-- ----------------------------
INSERT INTO `es_month_bonus` VALUES ('1', '201806', '383.13', '383.13', '1500.00', '6385.65', '2018-07-23 13:58:16', '0');
INSERT INTO `es_month_bonus` VALUES ('1', '201807', '412643.34', '412643.34', '1617894.18', '1618209.18', '2018-07-25 19:07:24', '0');
INSERT INTO `es_month_bonus` VALUES ('30', '201807', '37.08', '1505.88', '412.00', '16732.00', '2018-07-19 17:58:40', '0');
INSERT INTO `es_month_bonus` VALUES ('31', '201807', '0.00', '0.00', '625.00', '625.00', '2018-07-23 13:46:33', '0');

-- ----------------------------
-- Table structure for es_month_sale
-- ----------------------------
DROP TABLE IF EXISTS `es_month_sale`;
CREATE TABLE `es_month_sale` (
  `member_id` int(11) NOT NULL,
  `month` varchar(20) NOT NULL,
  `person_sale` decimal(10,2) DEFAULT '0.00',
  `team_sale` decimal(10,2) DEFAULT '0.00',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_month_sale
-- ----------------------------
INSERT INTO `es_month_sale` VALUES ('1', '201806', '1500.00', '6385.65', '2018-07-23 13:48:29');
INSERT INTO `es_month_sale` VALUES ('1', '201807', '1617894.18', '1618209.00', '2018-07-26 15:45:15');
INSERT INTO `es_month_sale` VALUES ('30', '201807', '412.00', '315.00', '2018-07-20 18:29:39');
INSERT INTO `es_month_sale` VALUES ('31', '201807', '625.00', '625.00', '2018-07-20 18:29:39');
INSERT INTO `es_month_sale` VALUES ('37', '201807', '0.00', '0.00', '2018-07-26 15:45:15');

-- ----------------------------
-- Table structure for es_order
-- ----------------------------
DROP TABLE IF EXISTS `es_order`;
CREATE TABLE `es_order` (
  `order_id` int(8) NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `status` int(8) DEFAULT NULL,
  `pay_status` int(8) DEFAULT NULL,
  `ship_status` int(8) DEFAULT NULL,
  `shipping_id` int(8) DEFAULT NULL,
  `shipping_type` varchar(255) DEFAULT NULL,
  `shipping_area` varchar(255) DEFAULT NULL,
  `payment_id` int(8) DEFAULT NULL,
  `payment_name` varchar(50) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment_account` varchar(50) DEFAULT NULL,
  `paymoney` decimal(20,2) DEFAULT NULL,
  `goods` longtext,
  `create_time` bigint(20) DEFAULT NULL,
  `ship_name` varchar(255) DEFAULT NULL,
  `ship_addr` varchar(255) DEFAULT NULL,
  `ship_zip` varchar(20) DEFAULT NULL,
  `ship_email` varchar(50) DEFAULT NULL,
  `ship_mobile` varchar(50) DEFAULT NULL,
  `ship_tel` varchar(50) DEFAULT NULL,
  `ship_day` varchar(255) DEFAULT NULL,
  `ship_time` varchar(255) DEFAULT NULL,
  `is_protect` varchar(1) DEFAULT NULL,
  `protect_price` decimal(20,2) DEFAULT NULL,
  `goods_amount` decimal(20,2) DEFAULT NULL,
  `shipping_amount` decimal(20,2) DEFAULT NULL,
  `order_amount` decimal(20,2) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `goods_num` int(8) DEFAULT NULL,
  `gainedpoint` int(10) DEFAULT '0',
  `consumepoint` int(10) DEFAULT '0',
  `remark` longtext,
  `disabled` varchar(1) DEFAULT NULL,
  `discount` decimal(20,2) DEFAULT NULL,
  `imported` int(8) DEFAULT '0',
  `pimported` int(8) DEFAULT '0',
  `complete_time` int(11) DEFAULT '0',
  `cancel_reason` varchar(255) DEFAULT NULL,
  `signing_time` int(10) DEFAULT NULL,
  `the_sign` varchar(255) DEFAULT NULL,
  `allocation_time` int(10) DEFAULT NULL,
  `ship_provinceid` int(10) DEFAULT NULL,
  `ship_cityid` int(10) DEFAULT NULL,
  `ship_regionid` int(10) DEFAULT NULL,
  `ship_townid` int(10) DEFAULT NULL,
  `sale_cmpl` int(8) DEFAULT NULL,
  `sale_cmpl_time` int(11) DEFAULT NULL,
  `depotid` int(10) DEFAULT NULL,
  `admin_remark` varchar(1000) DEFAULT NULL,
  `need_pay_money` decimal(20,2) DEFAULT NULL,
  `ship_no` varchar(255) DEFAULT NULL,
  `address_id` int(10) DEFAULT NULL,
  `items_json` longtext,
  `logi_id` int(10) DEFAULT NULL,
  `logi_name` varchar(255) DEFAULT NULL,
  `gift_id` int(10) DEFAULT '0',
  `bonus_id` int(10) DEFAULT '0',
  `act_discount` decimal(20,2) DEFAULT NULL,
  `activity_point` int(10) DEFAULT '0',
  `is_cancel` int(10) DEFAULT '0',
  `is_online` int(10) DEFAULT '0',
  `receipt_content` varchar(50) DEFAULT NULL,
  `receipt_title` varchar(50) DEFAULT NULL,
  `receipt_duty` varchar(50) DEFAULT NULL,
  `receipt_type` int(10) DEFAULT NULL,
  `receipt` int(10) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `ind_order_sn` (`sn`),
  KEY `ind_order_state` (`status`,`pay_status`,`ship_status`),
  KEY `ind_order_memberid` (`member_id`),
  KEY `ind_order_term` (`disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_order
-- ----------------------------
INSERT INTO `es_order` VALUES ('12', '153190949060', '30', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1531909490', 'xaingtao', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '128.00', '10.00', '138.00', '0.00', null, '138', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '138.00', null, '4', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":12,\"name\":\"测试商品\",\"num\":8,\"order_id\":12,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('13', '153190983087', '30', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1531909830', 'xaingtao', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '32.00', '10.00', '42.00', '0.00', null, '42', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '42.00', null, '4', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":13,\"name\":\"测试商品\",\"num\":2,\"order_id\":13,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('14', '153191016149', '30', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1531910161', 'xaingtao', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '80.00', '10.00', '90.00', '0.00', null, '90', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '90.00', null, '4', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":14,\"name\":\"测试商品\",\"num\":5,\"order_id\":14,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('15', '153196963819', '31', '2', '2', '2', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '330.00', null, '1532069638', 'test', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '320.00', '10.00', '330.00', '0.00', null, '330', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', '', '330.00', null, '5', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":15,\"name\":\"测试商品\",\"num\":20,\"order_id\":15,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('23', '153197051641', '1', '7', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '90.00', null, '1531970516', 'tao xiang', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '80.00', '10.00', '90.00', '0.00', null, '90', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', '', '90.00', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":23,\"name\":\"测试商品\",\"num\":5,\"order_id\":23,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('24', '153198300886', '31', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '16010.00', null, '1531983008', 'test', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '16000.00', '10.00', '16010.00', '0.00', null, '16010', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '16010.00', null, '5', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":24,\"name\":\"测试商品\",\"num\":1000,\"order_id\":24,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('25', '153198353888', '30', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1531983538', 'xaingtao', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '16.00', '10.00', '26.00', '0.00', null, '26', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '26.00', null, '4', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":25,\"name\":\"测试商品\",\"num\":1,\"order_id\":25,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('30', '153198401889', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '1', '支付宝', 'alipayDirectPlugin', null, '0.00', null, '1531984018', 'tao xiang', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '16.00', '10.00', '26.00', '0.00', null, '26', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '26.00', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":30,\"name\":\"测试商品\",\"num\":1,\"order_id\":30,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('35', '153199432032', '30', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1531994320', 'xaingtao', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '80.00', '10.00', '90.00', '0.00', null, '90', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '90.00', null, '4', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":35,\"name\":\"测试商品\",\"num\":5,\"order_id\":35,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('36', '153199474113', '30', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1531994741', 'xaingtao', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '16.00', '10.00', '26.00', '0.00', null, '26', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '26.00', null, '4', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":36,\"name\":\"测试商品\",\"num\":1,\"order_id\":36,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('38', '153207849026', '31', '7', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '333.00', null, '1532078490', 'test', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '80.00', '10.00', '90.00', '0.00', null, '90', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '90.00', null, '5', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://192.168.2.184:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":37,\"name\":\"测试商品\",\"num\":5,\"order_id\":38,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('39', '153207852327', '31', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1532078523', 'test', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '160.00', '10.00', '170.00', '0.00', null, '170', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '170.00', null, '5', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://192.168.2.184:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":38,\"name\":\"测试商品\",\"num\":10,\"order_id\":39,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('40', '153208257880', '31', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1532082578', 'test', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '16.00', '10.00', '26.00', '0.00', null, '26', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '26.00', null, '5', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://192.168.2.184:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":39,\"name\":\"测试商品\",\"num\":1,\"order_id\":40,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('41', '153234002117', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '1', '支付宝', 'alipayDirectPlugin', null, '0.00', null, '1532340021', 'tao xiang', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '32.00', '10.00', '42.00', '0.00', null, '42', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '42.00', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://192.168.2.188:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":40,\"name\":\"测试商品\",\"num\":2,\"order_id\":41,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('42', '153234271372', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1532342713', 'tao xiang', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '1615968.00', '10.00', '1615978.00', '0.00', null, '1615978', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '1615978.00', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":41,\"name\":\"测试商品\",\"num\":100998,\"order_id\":42,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('43', '153240278372', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1532402783', 'tao xiang', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '1472.00', '10.00', '1482.00', '0.00', null, '1482', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '1482.00', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":42,\"name\":\"测试商品\",\"num\":92,\"order_id\":43,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('44', '153240292257', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1532402922', 'tao xiang', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '80.00', '10.00', '90.00', '0.00', null, '90', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '90.00', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":43,\"name\":\"测试商品\",\"num\":5,\"order_id\":44,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('45', '153241832443', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '2', '快钱', 'billPlugin', null, '0.00', null, '1532418324', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '176.00', '10.00', '186.00', '0.00', null, '186', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '186.00', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":44,\"name\":\"测试商品\",\"num\":11,\"order_id\":45,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('46', '153241854525', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1532418545', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '32.00', '10.00', '42.00', '0.00', null, '42', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '42.00', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":45,\"name\":\"测试商品\",\"num\":2,\"order_id\":46,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('47', '153241947968', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', null, '0.00', null, '1532419479', 'tao xiang', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '16.00', '10.00', '26.00', '0.00', null, '26', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '26.00', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":46,\"name\":\"测试商品\",\"num\":1,\"order_id\":47,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('48', '153248796249', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', null, '0.00', null, '1532487962', 'tao xiang', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '16.00', '10.00', '26.00', '0.00', null, '26', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '26.00', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":47,\"name\":\"测试商品\",\"num\":1,\"order_id\":48,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('49', '153248817322', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', null, '0.00', null, '1532488173', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '16.00', '10.00', '26.00', '0.00', null, '26', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '26.00', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://192.168.2.164:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":48,\"name\":\"测试商品\",\"num\":1,\"order_id\":49,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('50', '153248853920', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', null, '0.00', null, '1532488539', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '16.00', '10.00', '26.00', '0.00', null, '26', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '26.00', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://192.168.2.164:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":49,\"name\":\"测试商品\",\"num\":1,\"order_id\":50,\"other\":\"\",\"price\":16,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":6,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('51', '153248912777', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1532489127', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '10.00', '10.01', '0.00', null, '10', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '10.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://192.168.2.164:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":50,\"name\":\"测试商品\",\"num\":1,\"order_id\":51,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('52', '153248923672', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', null, '0.00', null, '1532489236', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://192.168.2.164:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":51,\"name\":\"测试商品\",\"num\":1,\"order_id\":52,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('53', '153249017031', '1', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '支付宝wap在线支付单号2018072521001004580564590559', '0.01', null, '1532490170', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://192.168.2.164:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":52,\"name\":\"测试商品\",\"num\":1,\"order_id\":53,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('54', '153249695075', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', null, '0.00', null, '1532496950', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":53,\"name\":\"测试商品\",\"num\":1,\"order_id\":54,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('55', '153249861933', '1', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '支付宝wap在线支付单号2018072521001004580566319364', '0.01', null, '1532498619', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":54,\"name\":\"测试商品\",\"num\":1,\"order_id\":55,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('56', '153250101210', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1532501012', 'tao xiang', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":55,\"name\":\"测试商品\",\"num\":1,\"order_id\":56,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('57', '153250111686', '1', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '支付宝wap在线支付单号2018072521001004580567731564', '0.01', null, '1532501116', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":56,\"name\":\"测试商品\",\"num\":1,\"order_id\":57,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('58', '153250160685', '1', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '249***@qq.com', '0.01', null, '1532501606', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":57,\"name\":\"测试商品\",\"num\":1,\"order_id\":58,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('59', '153250182042', '1', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '249***@qq.com', '0.01', null, '1532501820', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":58,\"name\":\"测试商品\",\"num\":1,\"order_id\":59,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('60', '153250893553', '1', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '249***@qq.com', '0.01', null, '1532508935', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":59,\"name\":\"测试商品\",\"num\":1,\"order_id\":60,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('61', '153250923111', '1', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '249***@qq.com', '0.01', null, '1532509231', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":60,\"name\":\"测试商品\",\"num\":1,\"order_id\":61,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('62', '153250965936', '1', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '249***@qq.com', '0.01', null, '1532509659', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":61,\"name\":\"测试商品\",\"num\":1,\"order_id\":62,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('63', '153250994856', '1', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '249***@qq.com', '0.01', null, '1532509948', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":62,\"name\":\"测试商品\",\"num\":1,\"order_id\":63,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('64', '153251007081', '1', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '249***@qq.com', '0.01', null, '1532510070', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":63,\"name\":\"测试商品\",\"num\":1,\"order_id\":64,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('65', '153251026057', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1532510260', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":64,\"name\":\"测试商品\",\"num\":1,\"order_id\":65,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('66', '153251026086', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1532510260', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":65,\"name\":\"测试商品\",\"num\":1,\"order_id\":66,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('67', '153251038819', '1', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '249***@qq.com', '0.01', null, '1532510388', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":66,\"name\":\"测试商品\",\"num\":1,\"order_id\":67,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('68', '153251055316', '1', '2', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '249***@qq.com', '0.01', null, '1532510553', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":67,\"name\":\"测试商品\",\"num\":1,\"order_id\":68,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('69', '153251066383', '1', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '249***@qq.com', '0.02', null, '1532510663', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":68,\"name\":\"测试商品\",\"num\":1,\"order_id\":69,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('70', '153251103488', '1', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '249***@qq.com', '0.01', null, '1532511034', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":69,\"name\":\"测试商品\",\"num\":1,\"order_id\":70,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('71', '153251161594', '1', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '249***@qq.com', '0.01', null, '1532511615', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":70,\"name\":\"测试商品\",\"num\":1,\"order_id\":71,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('72', '153251270915', '1', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '249***@qq.com', '0.01', null, '1532512709', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":71,\"name\":\"测试商品\",\"num\":1,\"order_id\":72,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('73', '153251316134', '1', '7', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '249***@qq.com', '0.02', null, '1532513161', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":1,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":72,\"name\":\"测试商品\",\"num\":1,\"order_id\":73,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('74', '153251682238', '1', '2', '2', '0', '1', '圆通速递', '北京-海淀区-三环以内', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '249***@qq.com', '0.01', null, '1532516822', 'tao xiang', 'on the world', null, null, '18161178527', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '0.01', null, '2', '[{\"addon\":\"\",\"cat_id\":3,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":73,\"name\":\"测试商品\",\"num\":1,\"order_id\":74,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('75', '153258603370', '37', '7', '2', '0', '1', '圆通速递', '北京-丰台区-四环到五环之间', '5', '支付宝Wap支付接口', 'alipayWapPlugin', null, '0.17', null, '1532586033', '2', '626', '', null, '13223232232', '', '任意时间', null, '0', '0.00', '0.17', '0.17', '0.17', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2805', '2832', null, '0', null, '1', null, '0.17', null, '6', '[{\"addon\":\"\",\"cat_id\":3,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":74,\"name\":\"测试商品\",\"num\":17,\"order_id\":75,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');
INSERT INTO `es_order` VALUES ('76', '153258747819', '37', '7', '2', '0', '1', '圆通速递', '北京-丰台区-四环到五环之间', '5', '支付宝Wap支付接口', 'alipayWapPlugin', '135****2935', '0.01', null, '1532587478', '2', '626', null, null, '13223232232', null, '任意日期', null, '0', '0.00', '0.01', '0.00', '0.01', '0.00', null, '0', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2805', '2832', null, '0', null, '1', null, '0.01', null, '6', '[{\"addon\":\"\",\"cat_id\":3,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://pengqi.51vip.biz:20035/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":75,\"name\":\"测试商品\",\"num\":1,\"order_id\":76,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '0');
INSERT INTO `es_order` VALUES ('77', '153292103939', '1', '1', '0', '0', '1', '圆通速递', '北京-海淀区-三环以内', '0', '在线支付', 'onlinePay', null, '0.00', null, '1532921039', 'tao xiang', 'on the world', '', null, '18161178527', '', '任意时间', null, '0', '0.00', '28977.78', '0.00', '28977.78', '0.00', null, '28978', '0', '', '0', '0.00', '0', '0', '0', null, null, null, null, '1', '2800', '2848', null, '0', null, '1', null, '28977.78', null, '2', '[{\"addon\":\"\",\"cat_id\":3,\"change_goods_id\":0,\"change_goods_name\":\"\",\"depotId\":\"\",\"exchange\":\"\",\"exchange_point\":0,\"fields\":{},\"gainedpoint\":0,\"goods_id\":1,\"goods_type\":0,\"image\":\"http://localhost/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png\",\"item_id\":76,\"name\":\"测试商品\",\"num\":2897778,\"order_id\":77,\"other\":\"\",\"price\":0.01,\"product_id\":1,\"ship_num\":0,\"sn\":\"CSSP001\",\"snapshot_id\":7,\"snapshot_switch\":0,\"state\":0,\"store\":0,\"unit\":\"元\"}]', null, null, '0', '0', '0.00', '0', '0', '1', null, null, null, null, '2');

-- ----------------------------
-- Table structure for es_order_bonus
-- ----------------------------
DROP TABLE IF EXISTS `es_order_bonus`;
CREATE TABLE `es_order_bonus` (
  `ob_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `order_sn` varchar(255) DEFAULT NULL,
  `bonus_id` int(10) DEFAULT NULL,
  `bonus_name` varchar(255) DEFAULT NULL,
  `bonus_money` decimal(20,2) DEFAULT NULL,
  `use_start_date` bigint(20) DEFAULT NULL,
  `use_end_date` bigint(20) DEFAULT NULL,
  `min_goods_amount` decimal(20,2) DEFAULT NULL,
  `send_type` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`ob_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_order_bonus
-- ----------------------------

-- ----------------------------
-- Table structure for es_order_gift
-- ----------------------------
DROP TABLE IF EXISTS `es_order_gift`;
CREATE TABLE `es_order_gift` (
  `og_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `order_sn` varchar(255) DEFAULT NULL,
  `gift_id` int(10) DEFAULT NULL,
  `gift_name` varchar(255) DEFAULT NULL,
  `gift_price` decimal(20,2) DEFAULT NULL,
  `gift_img` varchar(255) DEFAULT NULL,
  `gift_type` smallint(1) DEFAULT NULL,
  `gift_status` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`og_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_order_gift
-- ----------------------------

-- ----------------------------
-- Table structure for es_order_items
-- ----------------------------
DROP TABLE IF EXISTS `es_order_items`;
CREATE TABLE `es_order_items` (
  `item_id` int(8) NOT NULL AUTO_INCREMENT,
  `order_id` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `cat_id` int(8) DEFAULT NULL,
  `num` int(8) DEFAULT NULL,
  `ship_num` int(8) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `image` longtext,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `gainedpoint` int(10) DEFAULT '0',
  `addon` longtext,
  `state` int(8) DEFAULT '0',
  `change_goods_name` varchar(255) DEFAULT NULL,
  `change_goods_id` int(8) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `goods_type` smallint(1) DEFAULT '0',
  `snapshot_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `es_order_item` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_order_items
-- ----------------------------
INSERT INTO `es_order_items` VALUES ('6', '6', '1', '1', '1', '1', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('7', '7', '1', '1', '1', '1', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('8', '8', '1', '1', '1', '1', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('9', '9', '1', '1', '1', '3', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('10', '10', '1', '1', '1', '1', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('11', '11', '1', '1', '1', '8', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('12', '12', '1', '1', '1', '8', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('13', '13', '1', '1', '1', '2', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('14', '14', '1', '1', '1', '5', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('15', '15', '1', '1', '1', '20', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('23', '23', '1', '1', '1', '5', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('24', '24', '1', '1', '1', '1000', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('25', '25', '1', '1', '1', '1', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('26', '26', '1', '1', '1', '1', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('27', '27', '1', '1', '1', '1', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('28', '28', '1', '1', '1', '1', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('29', '29', '1', '1', '1', '1', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('30', '30', '1', '1', '1', '1', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('35', '35', '1', '1', '1', '5', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('36', '36', '1', '1', '1', '1', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('37', '38', '1', '1', '1', '5', '0', 'CSSP001', 'http://192.168.2.184:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('38', '39', '1', '1', '1', '10', '0', 'CSSP001', 'http://192.168.2.184:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('39', '40', '1', '1', '1', '1', '0', 'CSSP001', 'http://192.168.2.184:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('40', '41', '1', '1', '1', '2', '0', 'CSSP001', 'http://192.168.2.188:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('41', '42', '1', '1', '1', '100998', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('42', '43', '1', '1', '1', '92', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('43', '44', '1', '1', '1', '5', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('44', '45', '1', '1', '1', '11', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('45', '46', '1', '1', '1', '2', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('46', '47', '1', '1', '1', '1', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('47', '48', '1', '1', '1', '1', '0', 'CSSP001', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('48', '49', '1', '1', '1', '1', '0', 'CSSP001', 'http://192.168.2.164:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('49', '50', '1', '1', '1', '1', '0', 'CSSP001', 'http://192.168.2.164:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '16.00', '0', null, '0', null, null, '元', '0', '6');
INSERT INTO `es_order_items` VALUES ('50', '51', '1', '1', '1', '1', '0', 'CSSP001', 'http://192.168.2.164:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('51', '52', '1', '1', '1', '1', '0', 'CSSP001', 'http://192.168.2.164:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('52', '53', '1', '1', '1', '1', '0', 'CSSP001', 'http://192.168.2.164:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('53', '54', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('54', '55', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('55', '56', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('56', '57', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('57', '58', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('58', '59', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('59', '60', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('60', '61', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('61', '62', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('62', '63', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('63', '64', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('64', '65', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('65', '66', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('66', '67', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('67', '68', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('68', '69', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('69', '70', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('70', '71', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('71', '72', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('72', '73', '1', '1', '1', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('73', '74', '1', '1', '3', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('74', '75', '1', '1', '3', '17', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('75', '76', '1', '1', '3', '1', '0', 'CSSP001', 'http://pengqi.51vip.biz:20035/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');
INSERT INTO `es_order_items` VALUES ('76', '77', '1', '1', '3', '2897778', '0', 'CSSP001', 'http://localhost/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', '测试商品', '0.01', '0', null, '0', null, null, '元', '0', '7');

-- ----------------------------
-- Table structure for es_order_log
-- ----------------------------
DROP TABLE IF EXISTS `es_order_log`;
CREATE TABLE `es_order_log` (
  `log_id` int(8) NOT NULL AUTO_INCREMENT,
  `order_id` int(8) DEFAULT NULL,
  `op_id` int(8) DEFAULT NULL,
  `op_name` varchar(50) DEFAULT NULL,
  `message` longtext,
  `op_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `ind_order_log` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_order_log
-- ----------------------------
INSERT INTO `es_order_log` VALUES ('6', '6', '0', 'test002', '订单创建', '1531812159');
INSERT INTO `es_order_log` VALUES ('7', '6', '0', '系统检测', '订单确认', '1531812165');
INSERT INTO `es_order_log` VALUES ('8', '7', '0', 'test002', '订单创建', '1531814471');
INSERT INTO `es_order_log` VALUES ('9', '7', '0', '系统检测', '订单确认', '1531814511');
INSERT INTO `es_order_log` VALUES ('10', '8', '0', 'test', '订单创建', '1531883590');
INSERT INTO `es_order_log` VALUES ('11', '8', '0', 'admin', '订单确认', '1531883590');
INSERT INTO `es_order_log` VALUES ('12', '9', '0', 'test', '订单创建', '1531900146');
INSERT INTO `es_order_log` VALUES ('13', '9', '0', '系统检测', '订单确认', '1531900146');
INSERT INTO `es_order_log` VALUES ('14', '10', '0', 'test', '订单创建', '1531902590');
INSERT INTO `es_order_log` VALUES ('15', '10', '0', '系统检测', '订单确认', '1531903022');
INSERT INTO `es_order_log` VALUES ('16', '11', '0', 'test001', '订单创建', '1531906983');
INSERT INTO `es_order_log` VALUES ('17', '11', '0', '系统检测', '订单确认', '1531906986');
INSERT INTO `es_order_log` VALUES ('18', '12', '0', 'test001', '订单创建', '1531909490');
INSERT INTO `es_order_log` VALUES ('19', '12', '0', '系统检测', '订单确认', '1531909490');
INSERT INTO `es_order_log` VALUES ('20', '13', '0', 'test001', '订单创建', '1531909840');
INSERT INTO `es_order_log` VALUES ('21', '13', '0', '系统检测', '订单确认', '1531910094');
INSERT INTO `es_order_log` VALUES ('22', '14', '0', 'test001', '订单创建', '1531910161');
INSERT INTO `es_order_log` VALUES ('23', '14', '0', '系统检测', '订单确认', '1531910161');
INSERT INTO `es_order_log` VALUES ('24', '15', '0', 'test0011', '订单创建', '1531969638');
INSERT INTO `es_order_log` VALUES ('25', '15', '0', '系统检测', '订单确认', '1531969638');
INSERT INTO `es_order_log` VALUES ('33', '23', '0', 'test', '订单创建', '1531970516');
INSERT INTO `es_order_log` VALUES ('34', '23', '0', '系统检测', '订单确认', '1531970516');
INSERT INTO `es_order_log` VALUES ('35', '24', '0', 'test0011', '订单创建', '1531983008');
INSERT INTO `es_order_log` VALUES ('36', '24', '0', 'admin', '订单确认', '1531983008');
INSERT INTO `es_order_log` VALUES ('37', '25', '0', 'test001', '订单创建', '1531983539');
INSERT INTO `es_order_log` VALUES ('38', '25', '0', '系统检测', '订单确认', '1531983539');
INSERT INTO `es_order_log` VALUES ('39', '26', '0', 'test', '订单创建', '1531983682');
INSERT INTO `es_order_log` VALUES ('40', '26', '0', '系统检测', '订单确认', '1531983682');
INSERT INTO `es_order_log` VALUES ('41', '27', '0', 'test', '订单创建', '1531983753');
INSERT INTO `es_order_log` VALUES ('42', '27', '0', '系统检测', '订单确认', '1531983753');
INSERT INTO `es_order_log` VALUES ('43', '28', '0', 'test', '订单创建', '1531983808');
INSERT INTO `es_order_log` VALUES ('44', '28', '0', '系统检测', '订单确认', '1531983808');
INSERT INTO `es_order_log` VALUES ('45', '29', '0', 'test', '订单创建', '1531983885');
INSERT INTO `es_order_log` VALUES ('46', '29', '0', '系统检测', '订单确认', '1531983934');
INSERT INTO `es_order_log` VALUES ('47', '30', '0', 'test', '订单创建', '1531984018');
INSERT INTO `es_order_log` VALUES ('48', '30', '0', '系统检测', '订单确认', '1531984018');
INSERT INTO `es_order_log` VALUES ('53', '35', '0', 'test001', '订单创建', '1531994320');
INSERT INTO `es_order_log` VALUES ('54', '35', '0', '系统检测', '订单确认', '1531994320');
INSERT INTO `es_order_log` VALUES ('55', '36', '0', 'test001', '订单创建', '1531994741');
INSERT INTO `es_order_log` VALUES ('56', '36', '0', '系统检测', '订单确认', '1531994741');
INSERT INTO `es_order_log` VALUES ('57', '23', '0', 'admin', '确认付款', '1532067005');
INSERT INTO `es_order_log` VALUES ('58', '23', '0', 'admin', '申请退款,金额:90.0', '1532067589');
INSERT INTO `es_order_log` VALUES ('59', '23', '0', 'admin', '申请退款，通过，申请退款金额：90.0', '1532067769');
INSERT INTO `es_order_log` VALUES ('60', '23', '0', 'admin', '申请退款,金额:90.0', '1532070758');
INSERT INTO `es_order_log` VALUES ('61', '24', '0', 'admin', '确认付款', '1532073637');
INSERT INTO `es_order_log` VALUES ('62', '24', '0', 'admin', '申请退款,金额:16010.0', '1532073659');
INSERT INTO `es_order_log` VALUES ('63', '23', '0', 'admin', '申请退款，拒绝通过', '1532073692');
INSERT INTO `es_order_log` VALUES ('64', '23', '0', '系统检测', '申请退款,金额:90.0', '1532073793');
INSERT INTO `es_order_log` VALUES ('65', '23', '0', 'admin', '申请退款，通过，申请退款金额：90.0', '1532073957');
INSERT INTO `es_order_log` VALUES ('66', '23', '0', 'admin', '申请退款,金额:90.0', '1532074013');
INSERT INTO `es_order_log` VALUES ('67', '23', '0', 'admin', '申请退款，通过，申请退款金额：90.0', '1532074071');
INSERT INTO `es_order_log` VALUES ('68', '23', '0', 'admin', '申请退款,金额:90.0', '1532074115');
INSERT INTO `es_order_log` VALUES ('69', '23', '0', 'admin', '申请退款，通过，申请退款金额：90.0', '1532074178');
INSERT INTO `es_order_log` VALUES ('70', '23', '0', 'admin', '申请退款,金额:90.0', '1532074206');
INSERT INTO `es_order_log` VALUES ('71', '23', '0', 'admin', '申请退款，通过，申请退款金额：90.0', '1532074271');
INSERT INTO `es_order_log` VALUES ('72', '23', '0', 'admin', '申请退款,金额:90.0', '1532074385');
INSERT INTO `es_order_log` VALUES ('73', '23', '0', 'admin', '申请退款，通过，申请退款金额：90.0', '1532074396');
INSERT INTO `es_order_log` VALUES ('74', '24', '0', 'admin', '申请退款，通过，申请退款金额：16010.0', '1532074414');
INSERT INTO `es_order_log` VALUES ('75', '24', '0', '系统检测', '申请退款,金额:16010.0', '1532074655');
INSERT INTO `es_order_log` VALUES ('76', '24', '0', 'admin', '申请退款，通过，申请退款金额：16010.0', '1532074678');
INSERT INTO `es_order_log` VALUES ('77', '24', '0', 'admin', '申请退款,金额:16010.0', '1532074804');
INSERT INTO `es_order_log` VALUES ('78', '24', '0', 'admin', '申请退款，通过，申请退款金额：16010.0', '1532074881');
INSERT INTO `es_order_log` VALUES ('79', '24', '0', 'admin', '申请退款,金额:16010.0', '1532075025');
INSERT INTO `es_order_log` VALUES ('80', '24', '0', 'admin', '申请退款，通过，申请退款金额：16010.0', '1532075035');
INSERT INTO `es_order_log` VALUES ('81', '24', '0', 'admin', '申请退款,金额:16010.0', '1532075164');
INSERT INTO `es_order_log` VALUES ('82', '24', '0', 'admin', '申请退款，通过，申请退款金额：16010.0', '1532075304');
INSERT INTO `es_order_log` VALUES ('83', '24', '0', 'admin', '申请退款,金额:16010.0', '1532075579');
INSERT INTO `es_order_log` VALUES ('84', '24', '0', 'admin', '申请退款，通过，申请退款金额：16010.0', '1532075622');
INSERT INTO `es_order_log` VALUES ('85', '24', '0', 'admin', '申请退款,金额:16010.0', '1532075687');
INSERT INTO `es_order_log` VALUES ('86', '24', '0', 'admin', '申请退款，通过，申请退款金额：16010.0', '1532075697');
INSERT INTO `es_order_log` VALUES ('87', '24', '0', 'admin', '申请退款,金额:16010.0', '1532075800');
INSERT INTO `es_order_log` VALUES ('88', '24', '0', 'admin', '申请退款，通过，申请退款金额：16010.0', '1532075904');
INSERT INTO `es_order_log` VALUES ('89', '24', '0', 'admin', '申请退款,金额:16010.0', '1532076021');
INSERT INTO `es_order_log` VALUES ('90', '24', '0', 'admin', '申请退款，通过，申请退款金额：16010.0', '1532076030');
INSERT INTO `es_order_log` VALUES ('91', '15', '0', 'admin', '申请退货', '1532077300');
INSERT INTO `es_order_log` VALUES ('92', '15', '0', 'admin', '通过退货申请', '1532077328');
INSERT INTO `es_order_log` VALUES ('93', '15', '0', 'admin', '订单商品入库', '1532077355');
INSERT INTO `es_order_log` VALUES ('94', '15', '0', '系统检测', '申请退货', '1532077667');
INSERT INTO `es_order_log` VALUES ('95', '15', '0', 'admin', '通过退货申请', '1532078286');
INSERT INTO `es_order_log` VALUES ('96', '38', '0', 'test0011', '订单创建', '1532078490');
INSERT INTO `es_order_log` VALUES ('97', '38', '0', '系统检测', '订单确认', '1532078490');
INSERT INTO `es_order_log` VALUES ('98', '39', '0', 'test0011', '订单创建', '1532078523');
INSERT INTO `es_order_log` VALUES ('99', '39', '0', '系统检测', '订单确认', '1532078523');
INSERT INTO `es_order_log` VALUES ('100', '38', '0', '系统检测', '申请退款,金额:333.0', '1532078681');
INSERT INTO `es_order_log` VALUES ('101', '38', '0', 'admin', '申请退款，通过，申请退款金额：333.0', '1532078705');
INSERT INTO `es_order_log` VALUES ('102', '40', '0', 'test0011', '订单创建', '1532082579');
INSERT INTO `es_order_log` VALUES ('103', '40', '0', 'admin', '订单确认', '1532082579');
INSERT INTO `es_order_log` VALUES ('104', '41', '0', 'test', '订单创建', '1532340021');
INSERT INTO `es_order_log` VALUES ('105', '41', '0', '系统检测', '订单确认', '1532340021');
INSERT INTO `es_order_log` VALUES ('106', '42', '0', 'test', '订单创建', '1532342713');
INSERT INTO `es_order_log` VALUES ('107', '42', '0', '系统检测', '订单确认', '1532342713');
INSERT INTO `es_order_log` VALUES ('108', '43', '0', 'test', '订单创建', '1532402784');
INSERT INTO `es_order_log` VALUES ('109', '43', '0', '系统检测', '订单确认', '1532402784');
INSERT INTO `es_order_log` VALUES ('110', '44', '0', 'test', '订单创建', '1532402922');
INSERT INTO `es_order_log` VALUES ('111', '44', '0', 'admin', '订单确认', '1532402962');
INSERT INTO `es_order_log` VALUES ('112', '45', '0', 'test', '订单创建', '1532418324');
INSERT INTO `es_order_log` VALUES ('113', '45', '0', '系统检测', '订单确认', '1532418324');
INSERT INTO `es_order_log` VALUES ('114', '46', '0', 'test', '订单创建', '1532418546');
INSERT INTO `es_order_log` VALUES ('115', '46', '0', '系统检测', '订单确认', '1532418546');
INSERT INTO `es_order_log` VALUES ('116', '47', '0', 'test', '订单创建', '1532419480');
INSERT INTO `es_order_log` VALUES ('117', '47', '0', 'admin', '订单确认', '1532419480');
INSERT INTO `es_order_log` VALUES ('118', '48', '0', 'test', '订单创建', '1532487963');
INSERT INTO `es_order_log` VALUES ('119', '48', '0', '系统检测', '订单确认', '1532487963');
INSERT INTO `es_order_log` VALUES ('120', '49', '0', 'test', '订单创建', '1532488173');
INSERT INTO `es_order_log` VALUES ('121', '49', '0', '系统检测', '订单确认', '1532488173');
INSERT INTO `es_order_log` VALUES ('122', '50', '0', 'test', '订单创建', '1532488539');
INSERT INTO `es_order_log` VALUES ('123', '50', '0', '系统检测', '订单确认', '1532488539');
INSERT INTO `es_order_log` VALUES ('124', '51', '0', 'test', '订单创建', '1532489128');
INSERT INTO `es_order_log` VALUES ('125', '51', '0', '系统检测', '订单确认', '1532489128');
INSERT INTO `es_order_log` VALUES ('126', '52', '0', 'test', '订单创建', '1532489236');
INSERT INTO `es_order_log` VALUES ('127', '52', '0', '系统检测', '订单确认', '1532489236');
INSERT INTO `es_order_log` VALUES ('128', '53', '0', 'test', '订单创建', '1532490170');
INSERT INTO `es_order_log` VALUES ('129', '53', '0', '系统检测', '订单确认', '1532490170');
INSERT INTO `es_order_log` VALUES ('130', '53', '0', '系统', '确认付款', '1532490308');
INSERT INTO `es_order_log` VALUES ('131', '54', '0', 'test', '订单创建', '1532496950');
INSERT INTO `es_order_log` VALUES ('132', '54', '0', '系统检测', '订单确认', '1532496950');
INSERT INTO `es_order_log` VALUES ('133', '55', '0', 'test', '订单创建', '1532498619');
INSERT INTO `es_order_log` VALUES ('134', '55', '0', '系统检测', '订单确认', '1532498619');
INSERT INTO `es_order_log` VALUES ('135', '55', '0', '系统', '确认付款', '1532498701');
INSERT INTO `es_order_log` VALUES ('136', '56', '0', 'test', '订单创建', '1532501013');
INSERT INTO `es_order_log` VALUES ('137', '56', '0', '系统检测', '订单确认', '1532501013');
INSERT INTO `es_order_log` VALUES ('138', '57', '0', 'test', '订单创建', '1532501116');
INSERT INTO `es_order_log` VALUES ('139', '57', '0', '系统检测', '订单确认', '1532501116');
INSERT INTO `es_order_log` VALUES ('140', '57', '0', '系统', '确认付款', '1532501155');
INSERT INTO `es_order_log` VALUES ('141', '58', '0', 'test', '订单创建', '1532501606');
INSERT INTO `es_order_log` VALUES ('142', '58', '0', '系统检测', '订单确认', '1532501606');
INSERT INTO `es_order_log` VALUES ('143', '58', '0', '系统', '确认付款', '1532501637');
INSERT INTO `es_order_log` VALUES ('144', '59', '0', 'test', '订单创建', '1532501820');
INSERT INTO `es_order_log` VALUES ('145', '59', '0', '系统检测', '订单确认', '1532501820');
INSERT INTO `es_order_log` VALUES ('146', '59', '0', '系统', '确认付款', '1532501830');
INSERT INTO `es_order_log` VALUES ('147', '59', '0', '系统检测', '申请退款,金额:0.01', '1532506157');
INSERT INTO `es_order_log` VALUES ('148', '59', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532506188');
INSERT INTO `es_order_log` VALUES ('149', '58', '0', 'admin', '申请退款,金额:0.01', '1532506285');
INSERT INTO `es_order_log` VALUES ('150', '58', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532506294');
INSERT INTO `es_order_log` VALUES ('151', '58', '0', 'admin', '退款中，金额：0.01', '1532506780');
INSERT INTO `es_order_log` VALUES ('152', '59', '0', 'admin', '申请退款,金额:0.01', '1532507311');
INSERT INTO `es_order_log` VALUES ('153', '59', '0', 'admin', '退款中，金额：0.01', '1532507356');
INSERT INTO `es_order_log` VALUES ('154', '59', '0', 'admin', '申请退款，拒绝通过', '1532507407');
INSERT INTO `es_order_log` VALUES ('155', '59', '0', 'admin', '申请退款,金额:0.01', '1532507436');
INSERT INTO `es_order_log` VALUES ('156', '57', '0', 'admin', '申请退款,金额:0.01', '1532507452');
INSERT INTO `es_order_log` VALUES ('157', '58', '0', 'admin', '申请退款,金额:0.01', '1532507465');
INSERT INTO `es_order_log` VALUES ('158', '58', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532507597');
INSERT INTO `es_order_log` VALUES ('159', '57', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532507602');
INSERT INTO `es_order_log` VALUES ('160', '59', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532507612');
INSERT INTO `es_order_log` VALUES ('161', '59', '0', 'admin', '退款中，金额：0.01', '1532507621');
INSERT INTO `es_order_log` VALUES ('162', '57', '0', 'admin', '退款中，金额：0.01', '1532507631');
INSERT INTO `es_order_log` VALUES ('163', '58', '0', 'admin', '退款中，金额：0.01', '1532507646');
INSERT INTO `es_order_log` VALUES ('164', '55', '0', '系统检测', '申请退款,金额:0.01', '1532508271');
INSERT INTO `es_order_log` VALUES ('165', '53', '0', '系统检测', '申请退款,金额:0.01', '1532508293');
INSERT INTO `es_order_log` VALUES ('166', '53', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532508323');
INSERT INTO `es_order_log` VALUES ('167', '55', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532508334');
INSERT INTO `es_order_log` VALUES ('168', '55', '0', 'admin', '退款中，金额：0.01', '1532508371');
INSERT INTO `es_order_log` VALUES ('169', '53', '0', 'admin', '退款中，金额：0.01', '1532508790');
INSERT INTO `es_order_log` VALUES ('170', '60', '0', 'test', '订单创建', '1532508935');
INSERT INTO `es_order_log` VALUES ('171', '60', '0', '系统检测', '订单确认', '1532508936');
INSERT INTO `es_order_log` VALUES ('172', '60', '0', '系统', '确认付款', '1532508945');
INSERT INTO `es_order_log` VALUES ('173', '60', '0', 'admin', '申请退款,金额:0.01', '1532508978');
INSERT INTO `es_order_log` VALUES ('174', '60', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532508991');
INSERT INTO `es_order_log` VALUES ('175', '60', '0', 'admin', '退款中，金额：0.01', '1532509172');
INSERT INTO `es_order_log` VALUES ('176', '61', '0', 'test', '订单创建', '1532509231');
INSERT INTO `es_order_log` VALUES ('177', '61', '0', '系统检测', '订单确认', '1532509231');
INSERT INTO `es_order_log` VALUES ('178', '61', '0', '系统', '确认付款', '1532509240');
INSERT INTO `es_order_log` VALUES ('179', '61', '0', 'admin', '申请退款,金额:0.01', '1532509304');
INSERT INTO `es_order_log` VALUES ('180', '61', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532509315');
INSERT INTO `es_order_log` VALUES ('181', '61', '0', 'admin', '退款中，金额：0.01', '1532509367');
INSERT INTO `es_order_log` VALUES ('182', '62', '0', 'test', '订单创建', '1532509659');
INSERT INTO `es_order_log` VALUES ('183', '62', '0', '系统检测', '订单确认', '1532509659');
INSERT INTO `es_order_log` VALUES ('184', '62', '0', '系统', '确认付款', '1532509669');
INSERT INTO `es_order_log` VALUES ('185', '62', '0', '系统检测', '申请退款,金额:0.01', '1532509701');
INSERT INTO `es_order_log` VALUES ('186', '62', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532509730');
INSERT INTO `es_order_log` VALUES ('187', '62', '0', 'admin', '退款中，金额：0.01', '1532509754');
INSERT INTO `es_order_log` VALUES ('188', '63', '0', 'test', '订单创建', '1532509949');
INSERT INTO `es_order_log` VALUES ('189', '63', '0', '系统检测', '订单确认', '1532509949');
INSERT INTO `es_order_log` VALUES ('190', '63', '0', '系统', '确认付款', '1532509960');
INSERT INTO `es_order_log` VALUES ('191', '63', '0', '系统检测', '申请退款,金额:0.01', '1532509981');
INSERT INTO `es_order_log` VALUES ('192', '63', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532510014');
INSERT INTO `es_order_log` VALUES ('193', '63', '0', 'admin', '退款中，金额：0.01', '1532510025');
INSERT INTO `es_order_log` VALUES ('194', '64', '0', 'test', '订单创建', '1532510070');
INSERT INTO `es_order_log` VALUES ('195', '64', '0', '系统检测', '订单确认', '1532510070');
INSERT INTO `es_order_log` VALUES ('196', '64', '0', '系统', '确认付款', '1532510079');
INSERT INTO `es_order_log` VALUES ('197', '64', '0', 'admin', '申请退款,金额:0.01', '1532510094');
INSERT INTO `es_order_log` VALUES ('198', '64', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532510107');
INSERT INTO `es_order_log` VALUES ('199', '64', '0', 'admin', '退款中，金额：0.01', '1532510114');
INSERT INTO `es_order_log` VALUES ('200', '65', '0', 'test', '订单创建', '1532510260');
INSERT INTO `es_order_log` VALUES ('201', '65', '0', '系统检测', '订单确认', '1532510260');
INSERT INTO `es_order_log` VALUES ('202', '66', '0', 'test', '订单创建', '1532510260');
INSERT INTO `es_order_log` VALUES ('203', '66', '0', '系统检测', '订单确认', '1532510260');
INSERT INTO `es_order_log` VALUES ('204', '67', '0', 'test', '订单创建', '1532510388');
INSERT INTO `es_order_log` VALUES ('205', '67', '0', '系统检测', '订单确认', '1532510389');
INSERT INTO `es_order_log` VALUES ('206', '67', '0', '系统', '确认付款', '1532510405');
INSERT INTO `es_order_log` VALUES ('207', '67', '0', 'admin', '申请退款,金额:0.01', '1532510457');
INSERT INTO `es_order_log` VALUES ('208', '67', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532510471');
INSERT INTO `es_order_log` VALUES ('209', '67', '0', 'admin', '退款中，金额：0.01', '1532510495');
INSERT INTO `es_order_log` VALUES ('210', '68', '0', 'test', '订单创建', '1532510553');
INSERT INTO `es_order_log` VALUES ('211', '68', '0', '系统检测', '订单确认', '1532510553');
INSERT INTO `es_order_log` VALUES ('212', '68', '0', '系统', '确认付款', '1532510562');
INSERT INTO `es_order_log` VALUES ('213', '69', '0', 'test', '订单创建', '1532510663');
INSERT INTO `es_order_log` VALUES ('214', '69', '0', '系统检测', '订单确认', '1532510663');
INSERT INTO `es_order_log` VALUES ('215', '69', '0', '系统', '确认付款', '1532510681');
INSERT INTO `es_order_log` VALUES ('216', '69', '0', '系统', '确认付款', '1532510681');
INSERT INTO `es_order_log` VALUES ('217', '69', '0', 'admin', '申请退款,金额:0.02', '1532510878');
INSERT INTO `es_order_log` VALUES ('218', '69', '0', 'admin', '申请退款，通过，申请退款金额：0.02', '1532510891');
INSERT INTO `es_order_log` VALUES ('219', '69', '0', 'admin', '退款中，金额：0.02', '1532510931');
INSERT INTO `es_order_log` VALUES ('220', '70', '0', 'test', '订单创建', '1532511034');
INSERT INTO `es_order_log` VALUES ('221', '70', '0', '系统检测', '订单确认', '1532511034');
INSERT INTO `es_order_log` VALUES ('222', '70', '0', '系统', '确认付款', '1532511047');
INSERT INTO `es_order_log` VALUES ('223', '70', '0', 'admin', '申请退款,金额:0.01', '1532511087');
INSERT INTO `es_order_log` VALUES ('224', '70', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532511097');
INSERT INTO `es_order_log` VALUES ('225', '70', '0', 'admin', '退款中，金额：0.01', '1532511117');
INSERT INTO `es_order_log` VALUES ('226', '71', '0', 'test', '订单创建', '1532511615');
INSERT INTO `es_order_log` VALUES ('227', '71', '0', '系统检测', '订单确认', '1532511615');
INSERT INTO `es_order_log` VALUES ('228', '71', '0', '系统', '确认付款', '1532511625');
INSERT INTO `es_order_log` VALUES ('229', '71', '0', 'admin', '申请退款,金额:0.01', '1532511692');
INSERT INTO `es_order_log` VALUES ('230', '71', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532511701');
INSERT INTO `es_order_log` VALUES ('231', '71', '0', 'admin', '退款中，金额：0.01', '1532511718');
INSERT INTO `es_order_log` VALUES ('232', '72', '0', 'test', '订单创建', '1532512709');
INSERT INTO `es_order_log` VALUES ('233', '72', '0', '系统检测', '订单确认', '1532512709');
INSERT INTO `es_order_log` VALUES ('234', '72', '0', '系统', '确认付款', '1532512753');
INSERT INTO `es_order_log` VALUES ('235', '72', '0', 'admin', '申请退款,金额:0.01', '1532512792');
INSERT INTO `es_order_log` VALUES ('236', '72', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532512799');
INSERT INTO `es_order_log` VALUES ('237', '72', '0', 'admin', '退款中，金额：0.01', '1532513107');
INSERT INTO `es_order_log` VALUES ('238', '73', '0', 'test', '订单创建', '1532513161');
INSERT INTO `es_order_log` VALUES ('239', '73', '0', '系统检测', '订单确认', '1532513161');
INSERT INTO `es_order_log` VALUES ('240', '73', '0', '系统', '确认付款', '1532513182');
INSERT INTO `es_order_log` VALUES ('241', '73', '0', '系统', '确认付款', '1532513182');
INSERT INTO `es_order_log` VALUES ('242', '73', '0', 'admin', '申请退款,金额:0.02', '1532513214');
INSERT INTO `es_order_log` VALUES ('243', '73', '0', 'admin', '申请退款，通过，申请退款金额：0.02', '1532513235');
INSERT INTO `es_order_log` VALUES ('244', '73', '0', 'admin', '退款中，金额：0.02', '1532513382');
INSERT INTO `es_order_log` VALUES ('245', '74', '0', 'test', '订单创建', '1532516822');
INSERT INTO `es_order_log` VALUES ('246', '74', '0', '系统检测', '订单确认', '1532516822');
INSERT INTO `es_order_log` VALUES ('247', '74', '0', '系统', '确认付款', '1532516844');
INSERT INTO `es_order_log` VALUES ('248', '75', '0', 'llll', '订单创建', '1532586033');
INSERT INTO `es_order_log` VALUES ('249', '75', '0', '系统检测', '订单确认', '1532586033');
INSERT INTO `es_order_log` VALUES ('250', '75', '0', '系统检测', '申请退款,金额:0.17', '1532587001');
INSERT INTO `es_order_log` VALUES ('251', '75', '0', 'admin', '申请退款，通过，申请退款金额：0.17', '1532587048');
INSERT INTO `es_order_log` VALUES ('252', '76', '0', 'llll', '订单创建', '1532587478');
INSERT INTO `es_order_log` VALUES ('253', '76', '0', '系统检测', '订单确认', '1532587478');
INSERT INTO `es_order_log` VALUES ('254', '76', '0', '系统', '确认付款', '1532587491');
INSERT INTO `es_order_log` VALUES ('255', '76', '0', 'admin', '申请退款,金额:0.01', '1532587523');
INSERT INTO `es_order_log` VALUES ('256', '76', '0', 'admin', '申请退款，通过，申请退款金额：0.01', '1532587533');
INSERT INTO `es_order_log` VALUES ('257', '75', '0', 'admin', '退款中，金额：0.17', '1532591100');
INSERT INTO `es_order_log` VALUES ('258', '76', '0', 'admin', '退款中，金额：0.01', '1532591115');
INSERT INTO `es_order_log` VALUES ('259', '77', '0', 'test', '订单创建', '1532921039');
INSERT INTO `es_order_log` VALUES ('260', '77', '0', '系统检测', '订单确认', '1532921039');

-- ----------------------------
-- Table structure for es_order_meta
-- ----------------------------
DROP TABLE IF EXISTS `es_order_meta`;
CREATE TABLE `es_order_meta` (
  `metaid` int(10) NOT NULL AUTO_INCREMENT,
  `orderid` int(10) DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`metaid`),
  KEY `es_ind_orderex_orderid` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_order_meta
-- ----------------------------

-- ----------------------------
-- Table structure for es_order_pmt
-- ----------------------------
DROP TABLE IF EXISTS `es_order_pmt`;
CREATE TABLE `es_order_pmt` (
  `pmt_id` int(8) DEFAULT NULL,
  `order_id` int(8) DEFAULT NULL,
  `pmt_amount` decimal(20,2) DEFAULT NULL,
  `pmt_describe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_order_pmt
-- ----------------------------

-- ----------------------------
-- Table structure for es_page
-- ----------------------------
DROP TABLE IF EXISTS `es_page`;
CREATE TABLE `es_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `page_html` longtext,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_page
-- ----------------------------
INSERT INTO `es_page` VALUES ('1', 'PC首页', '/index.html', null, '0');

-- ----------------------------
-- Table structure for es_payment_cfg
-- ----------------------------
DROP TABLE IF EXISTS `es_payment_cfg`;
CREATE TABLE `es_payment_cfg` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `config` longtext,
  `biref` longtext,
  `pay_fee` decimal(20,2) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `pay_img` varchar(255) DEFAULT NULL,
  `is_online` int(8) DEFAULT '1',
  `is_retrace` int(8) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_payment_cfg
-- ----------------------------
INSERT INTO `es_payment_cfg` VALUES ('1', '支付宝', '{\"isRetrace\":\"1\",\"seller_email\":\"test\",\"file\":\"\",\"partner\":\"2017122101048371\",\"content_encoding\":\"\",\"key\":\"MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQ\",\"param_encoding\":\"\"}', '<p>\r\n	相关参数请到后台修改</p>', null, 'alipayDirectPlugin', '', '1', '1');
INSERT INTO `es_payment_cfg` VALUES ('2', '快钱', '{\"callback_encoding\":\"UTF-8\",\"ajax\":\"yes\",\"return_encoding\":\"UTF-8\",\"privateKey\":\"123456\",\"keyPwd\":\"123456\",\"partner\":\"test\",\"key\":\"test\",\"url\":\"http://baidu.com\"}', '<p>   keyPwd\n	请到后台修改相关参数</p>\n', null, 'billPlugin', 'fs:/attachment/payment/kuaiqian.png', '1', '0');
INSERT INTO `es_payment_cfg` VALUES ('3', '货到付款', '{}', '<p>\n	请到后台修改相应参数</p>\n', null, 'cod', null, '0', '0');
INSERT INTO `es_payment_cfg` VALUES ('4', '银行汇款', '{}', '<p>\n	工商银行：8888888，户名test</p>\n', null, 'offline', null, '0', '0');
INSERT INTO `es_payment_cfg` VALUES ('5', '支付宝Wap支付接口', '{\"public_key\":\"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjARolrGTe1oOtdO1lNszeA0csbcGWMV6pd8szbCgdUjVt2lxc9WxWAh4eUPS6FJUT2rPjs7FEPzAwYcYv7By9nHu0pVHxl8CM8jMaxcsXZHNtcZCpyU+9f+UrSfByDtNPgY3m5BcspxsM7HDSax44eC9mHEDa0lp1gvWwOWqq19B2UdZAPRRSqv3HQP7n1hFi6WZht03FLmgeRTMi2nZhQX05R1gqjA+OMgegTfPeuruce52/X04EJBrgPdmGv3jNuX9BnXuBdh0KYmgOGSZVTw2FxD2Yebnda4ZuOoobS33JkKJK6pUovKDhaHHFv77kl3qmyoMP1DPjGQ/k0emKQIDAQAB\",\"isRetrace\":\"1\",\"file\":\"\",\"payImg\":\"http://pengqi.51vip.biz:20035//statics/attachment/payment/2018/7/24/16//49355588.jpg\",\"private_key\":\"MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDVmhwZcQ4GoYdbT8b/PUobRx9LgMTAzTcVr1kV1iXqaYgG7XAuFImc8nhe9CnxizgLaKXM/IHLxWTswHhUPQ/prEEAAhlHTzR2czaDI5DMKPbuv6yS28aokYIPWRNwLvYguUJndqLcnHf0A5M9z/uZtzhIlYA9PpknD9kWhaXINlytY8gFbauGatc840tNfNyAyZYOv8Le1WzZE4Uk83eP6c5H2WjPBz24HsX1uvA/qZqWDkVteCEBEuSnLzXj5uP2I3hpSLQorsWe3t8q+rPizgakQo1BPacsCqW0uS7UsP/x5eKYcpwPmMGGZ7c2TwOZirGZMlqTO05fttGQKyvnAgMBAAECggEAOeW/4BWI27tE2TdSlTSjtakdjnWk3y3A1Jvm5chaFqPsPxR058ihVG1Uu0grZlF6K31+E4YOGJG0vYeeFhdHDOun4ryu5WlOqxynlfw571zbMfO6b0QrIN3wBwD6B9py1IPiv/CkTHANA5NEgeiyJgRHuUTssa0aDkB5c2VeflnfDdqbYaY4g5vyml9RlOyWWf4gTHuclZCA/q9pSB5auzux8Urv6lr7WJhSpP2MIuqajTKqbCFl/BkCzQCMcIoIonrVHVP7LPj2Ew1HwkfXz5DPEeZBzaOlq7bkHSX1Vru4c1LDDBkxXC6b9C9RHoKojntn8YuQfyU7e3JW5fX+AQKBgQDv0Daskm2oWcdt6GGDXEBj51SgLZ+MapFlcqhnjj/gsJ3dPR9rGpM81qfEMv7HT6Cfcx14dNT0BLsWzO7zRZg8bX2hRn/9DsHh6HUlUglyRhpCPyMrB/+egNURo9MJ/s9Id2XnE2He0GHbAQq6jYzmaCjmENp6/2ZXPwcwCETFJwKBgQDkBPwXaQ/kIpn7xZP/VdpBR/C/il8z9V/G2Ydram+HDgLyS7yu1A7thKlmN2exuMWhgHr6/TGkk6y7CAe/Z0dRDzK61Hyd9FbL57Vfd4dVOEa5HYI/o2ck+0UHldr7jUqzDbxcJhBBz1ObBhgj8lDp0KegHMkO3VyQva8UEQYbQQKBgQDb2yS0083KwPxP6/KyTnoN3UA9VXZnci/4NMTlo4k2glVIRkgulf+UkCrgeewQaBUW+Z90FpBBYrDu91S+HPiztaGuoIaoRsZDSS1U2MAmTtS2FVI1mjCkbPJqKKpLCJuakTQQRDm+34ZHFM50N1+MwMN2IM9cYhe+Nt9tDreVkwKBgQDO4Ebn5oZocYxLhaMVEouGlwKyhZSCy6kt/MaEinjNi8TYmCaEaBlzHd2jw7js4btNIAh0F6wmqWUZ+9srqURnIubf41F87eah8YP5LbU3eGuSIFe/7TzzrJWgoDGh8TtI4Ll40YAGdVhhWlIkqwEGYizzc6pnNid5mt9x0VA9AQKBgEtuNBt/3EhSI6H1D2h2jR5DhPOA+0DoIL5YVbvco8rBBeFvD5m+4TaUVQc4FORx/7vG+q4DNiawy9ljZWVYRGyujpYrBsiHogGWBirIFBQz9ZQr/sTuwDKteQbKBGYz0E354q5EozgyYAuf3LiYZ4AT0hIaw7lUvbHwIwX1kotK\",\"app_id\":\"2017122101048371\",\"param_encoding\":\" \"}', null, null, 'alipayWapPlugin', 'fs:/attachment/payment/2018/7/24/16//49355588.jpg', '1', '1');

-- ----------------------------
-- Table structure for es_payment_detail
-- ----------------------------
DROP TABLE IF EXISTS `es_payment_detail`;
CREATE TABLE `es_payment_detail` (
  `detail_id` int(8) NOT NULL AUTO_INCREMENT,
  `payment_id` int(8) DEFAULT NULL,
  `pay_money` decimal(20,2) DEFAULT NULL,
  `pay_date` bigint(20) DEFAULT NULL,
  `admin_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_payment_detail
-- ----------------------------
INSERT INTO `es_payment_detail` VALUES ('1', '11', '90.00', '1532067005', 'admin');
INSERT INTO `es_payment_detail` VALUES ('2', '12', '16010.00', '1532073637', 'admin');
INSERT INTO `es_payment_detail` VALUES ('3', '36', '0.01', '1532490308828', '系统');
INSERT INTO `es_payment_detail` VALUES ('4', '38', '0.01', '1532498703309', '系统');
INSERT INTO `es_payment_detail` VALUES ('5', '40', '0.01', '1532501155340', '系统');
INSERT INTO `es_payment_detail` VALUES ('6', '41', '0.01', '1532501637755', '系统');
INSERT INTO `es_payment_detail` VALUES ('7', '42', '0.01', '1532501831003', '系统');
INSERT INTO `es_payment_detail` VALUES ('8', '43', '0.01', '1532508945527', '系统');
INSERT INTO `es_payment_detail` VALUES ('9', '44', '0.01', '1532509240584', '系统');
INSERT INTO `es_payment_detail` VALUES ('10', '45', '0.01', '1532509669577', '系统');
INSERT INTO `es_payment_detail` VALUES ('11', '46', '0.01', '1532509960132', '系统');
INSERT INTO `es_payment_detail` VALUES ('12', '47', '0.01', '1532510079457', '系统');
INSERT INTO `es_payment_detail` VALUES ('13', '50', '0.01', '1532510405406', '系统');
INSERT INTO `es_payment_detail` VALUES ('14', '51', '0.01', '1532510562925', '系统');
INSERT INTO `es_payment_detail` VALUES ('15', '52', '0.01', '1532510681308', '系统');
INSERT INTO `es_payment_detail` VALUES ('16', '52', '0.01', '1532510681538', '系统');
INSERT INTO `es_payment_detail` VALUES ('17', '53', '0.01', '1532511047665', '系统');
INSERT INTO `es_payment_detail` VALUES ('18', '54', '0.01', '1532511625894', '系统');
INSERT INTO `es_payment_detail` VALUES ('19', '55', '0.01', '1532512753563', '系统');
INSERT INTO `es_payment_detail` VALUES ('20', '56', '0.01', '1532513182159', '系统');
INSERT INTO `es_payment_detail` VALUES ('21', '56', '0.01', '1532513182336', '系统');
INSERT INTO `es_payment_detail` VALUES ('22', '57', '0.01', '1532516844597', '系统');
INSERT INTO `es_payment_detail` VALUES ('23', '59', '0.01', '1532587491601', '系统');

-- ----------------------------
-- Table structure for es_payment_logs
-- ----------------------------
DROP TABLE IF EXISTS `es_payment_logs`;
CREATE TABLE `es_payment_logs` (
  `payment_id` int(8) NOT NULL AUTO_INCREMENT,
  `order_id` int(8) DEFAULT NULL,
  `order_sn` varchar(255) DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `pay_method` varchar(50) DEFAULT NULL,
  `sn` varchar(50) DEFAULT NULL,
  `pay_user` varchar(50) DEFAULT NULL,
  `money` decimal(20,2) DEFAULT NULL,
  `pay_date` bigint(20) DEFAULT NULL,
  `remark` longtext,
  `type` int(8) DEFAULT NULL,
  `status` int(8) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `admin_user` varchar(50) DEFAULT NULL,
  `paymoney` decimal(20,2) DEFAULT '0.00',
  `market_point` decimal(20,2) DEFAULT '0.00',
  `credit` decimal(20,2) DEFAULT '0.00',
  `trasaction_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `ind_pay_log` (`order_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_payment_logs
-- ----------------------------
INSERT INTO `es_payment_logs` VALUES ('1', '6', '153181215988', '2', '在线支付', '', 'test002', '26.00', '0', null, '1', '0', '1531812165', 'test002', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('2', '7', '153181445985', '2', '在线支付', '', 'test002', '26.00', '0', null, '1', '0', '1531814511', 'test002', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('3', '8', '153188359010', '1', '在线支付', '', 'test', '26.00', '0', null, '1', '0', '1531883590', 'null[admin]', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('4', '9', '153190014661', '1', '在线支付', '', 'test', '58.00', '0', null, '1', '0', '1531900146', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('5', '10', '153190258997', '1', '在线支付', '', 'test', '26.00', '0', null, '1', '0', '1531903022', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('6', '11', '153190698374', '19', '在线支付', '', 'test001', '138.00', '0', null, '1', '0', '1531906986', 'test001', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('7', '12', '153190949060', '30', '在线支付', '', 'test001', '138.00', '0', null, '1', '0', '1531909490', 'test001', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('8', '13', '153190983087', '30', '在线支付', '', 'test001', '42.00', '0', null, '1', '0', '1531910094', 'test001', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('9', '14', '153191016149', '30', '在线支付', '', 'test001', '90.00', '0', null, '1', '0', '1531910161', 'test001', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('10', '15', '153196963819', '31', '在线支付', '', 'test0011', '330.00', '0', null, '1', '0', '1531969638', 'test0011', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('11', '23', '153197051641', '1', '在线支付', '', 'test', '90.00', '1532067005', null, '1', '2', '1531970516', 'admin[null]', '90.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('12', '24', '153198300886', '31', '在线支付', '', 'test0011', '16010.00', '1532073637', null, '1', '2', '1531983008', 'admin[null]', '16010.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('13', '25', '153198353888', '30', '在线支付', '', 'test001', '26.00', '0', null, '1', '0', '1531983539', 'test001', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('14', '26', '153198368240', '1', '在线支付', '', 'test', '26.00', '0', null, '1', '0', '1531983682', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('15', '27', '153198375333', '1', '在线支付', '', 'test', '26.00', '0', null, '1', '0', '1531983753', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('16', '28', '153198380875', '1', '在线支付', '', 'test', '26.00', '0', null, '1', '0', '1531983808', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('17', '29', '153198388558', '1', '在线支付', '', 'test', '26.00', '0', null, '1', '0', '1531983934', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('18', '30', '153198401889', '1', '在线支付', '', 'test', '26.00', '0', null, '1', '0', '1531984018', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('19', '35', '153199432032', '30', '在线支付', '', 'test001', '90.00', '0', null, '1', '0', '1531994320', 'test001', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('20', '36', '153199474113', '30', '在线支付', '', 'test001', '26.00', '0', null, '1', '0', '1531994741', 'test001', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('21', '38', '153207849026', '31', '在线支付', '', 'test0011', '90.00', '0', null, '1', '0', '1532078490', 'test0011', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('22', '39', '153207852327', '31', '在线支付', '', 'test0011', '170.00', '0', null, '1', '0', '1532078523', 'test0011', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('23', '40', '153208257880', '31', '在线支付', '', 'test0011', '26.00', '0', null, '1', '0', '1532082579', 'null[admin]', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('24', '41', '153234002117', '1', '在线支付', '', 'test', '42.00', '0', null, '1', '0', '1532340021', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('25', '42', '153234271372', '1', '在线支付', '', 'test', '1615978.00', '0', null, '1', '0', '1532342713', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('26', '43', '153240278372', '1', '在线支付', '', 'test', '1482.00', '0', null, '1', '0', '1532402784', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('27', '44', '153240292257', '1', '在线支付', '', 'test', '90.00', '0', null, '1', '0', '1532402962', 'null[admin]', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('28', '45', '153241832443', '1', '在线支付', '', 'test', '186.00', '0', null, '1', '0', '1532418324', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('29', '46', '153241854525', '1', '在线支付', '', 'test', '42.00', '0', null, '1', '0', '1532418546', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('30', '47', '153241947968', '1', '在线支付', '', 'test', '26.00', '0', null, '1', '0', '1532419480', 'null[admin]', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('31', '48', '153248796249', '1', '在线支付', '', 'test', '26.00', '0', null, '1', '0', '1532487963', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('32', '49', '153248817322', '1', '在线支付', '', 'test', '26.00', '0', null, '1', '0', '1532488173', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('33', '50', '153248853920', '1', '在线支付', '', 'test', '26.00', '0', null, '1', '0', '1532488539', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('34', '51', '153248912777', '1', '在线支付', '', 'test', '10.01', '0', null, '1', '0', '1532489128', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('35', '52', '153248923672', '1', '在线支付', '', 'test', '0.01', '0', null, '1', '0', '1532489236', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('36', '53', '153249017031', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532490308', null, '1', '2', '1532490170', '系统', '0.01', '0.00', '0.00', '2018072521001004580564590559');
INSERT INTO `es_payment_logs` VALUES ('37', '54', '153249695075', '1', '在线支付', '', 'test', '0.01', '0', null, '1', '0', '1532496950', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('38', '55', '153249861933', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532498700', null, '1', '2', '1532498619', '系统', '0.01', '0.00', '0.00', '2018072521001004580566319364');
INSERT INTO `es_payment_logs` VALUES ('39', '56', '153250101210', '1', '在线支付', '', 'test', '0.01', '0', null, '1', '0', '1532501013', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('40', '57', '153250111686', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532501139', null, '1', '2', '1532501116', '系统', '0.01', '0.00', '0.00', '2018072521001004580567731564');
INSERT INTO `es_payment_logs` VALUES ('41', '58', '153250160685', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532501637', null, '1', '2', '1532501606', '系统', '0.01', '0.00', '0.00', '2018072521001004580566052866');
INSERT INTO `es_payment_logs` VALUES ('42', '59', '153250182042', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532501830', null, '1', '2', '1532501820', '系统', '0.01', '0.00', '0.00', '2018072521001004580566320232');
INSERT INTO `es_payment_logs` VALUES ('43', '60', '153250893553', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532508945', null, '1', '2', '1532508936', '系统', '0.01', '0.00', '0.00', '2018072521001004580568405218');
INSERT INTO `es_payment_logs` VALUES ('44', '61', '153250923111', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532509240', null, '1', '2', '1532509231', '系统', '0.01', '0.00', '0.00', '2018072521001004580568676604');
INSERT INTO `es_payment_logs` VALUES ('45', '62', '153250965936', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532509669', null, '1', '2', '1532509659', '系统', '0.01', '0.00', '0.00', '2018072521001004580566056842');
INSERT INTO `es_payment_logs` VALUES ('46', '63', '153250994856', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532509960', null, '1', '2', '1532509949', '系统', '0.01', '0.00', '0.00', '2018072521001004580568893073');
INSERT INTO `es_payment_logs` VALUES ('47', '64', '153251007081', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532510079', null, '1', '2', '1532510070', '系统', '0.01', '0.00', '0.00', '2018072521001004580568677036');
INSERT INTO `es_payment_logs` VALUES ('48', '65', '153251026057', '1', '在线支付', '', 'test', '0.01', '0', null, '1', '0', '1532510260', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('49', '66', '153251026086', '1', '在线支付', '', 'test', '0.01', '0', null, '1', '0', '1532510260', 'tao xiang', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('50', '67', '153251038819', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532510405', null, '1', '2', '1532510389', '系统', '0.01', '0.00', '0.00', '2018072521001004580568406048');
INSERT INTO `es_payment_logs` VALUES ('51', '68', '153251055316', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532510562', null, '1', '2', '1532510553', '系统', '0.01', '0.00', '0.00', '2018072521001004580567689538');
INSERT INTO `es_payment_logs` VALUES ('52', '69', '153251066383', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532510681', null, '1', '2', '1532510663', '系统', '0.02', '0.00', '0.00', '2018072521001004580568893498');
INSERT INTO `es_payment_logs` VALUES ('53', '70', '153251103488', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532511047', null, '1', '2', '1532511034', '系统', '0.01', '0.00', '0.00', '2018072521001004580568639913');
INSERT INTO `es_payment_logs` VALUES ('54', '71', '153251161594', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532511625', null, '1', '2', '1532511615', '系统', '0.01', '0.00', '0.00', '2018072521001004580568406788');
INSERT INTO `es_payment_logs` VALUES ('55', '72', '153251270915', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532512753', null, '1', '2', '1532512709', '系统', '0.01', '0.00', '0.00', '2018072521001004580568210680');
INSERT INTO `es_payment_logs` VALUES ('56', '73', '153251316134', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532513182', null, '1', '2', '1532513161', '系统', '0.02', '0.00', '0.00', '2018072521001004580566475453');
INSERT INTO `es_payment_logs` VALUES ('57', '74', '153251682238', '1', '支付宝Wap支付接口', '', 'test', '0.01', '1532516844', null, '1', '2', '1532516822', '系统', '0.01', '0.00', '0.00', '2018072521001004580569941025');
INSERT INTO `es_payment_logs` VALUES ('58', '75', '153258603370', '37', '在线支付', '', 'llll', '0.17', '0', null, '1', '0', '1532586033', 'llll', '0.00', '0.00', '0.00', null);
INSERT INTO `es_payment_logs` VALUES ('59', '76', '153258747819', '37', '支付宝Wap支付接口', '', 'llll', '0.01', '1532587491', null, '1', '2', '1532587478', '系统', '0.01', '0.00', '0.00', '2018072621001004490581576860');
INSERT INTO `es_payment_logs` VALUES ('60', '77', '153292103939', '1', '在线支付', '', 'test', '28977.78', '0', null, '1', '0', '1532921039', 'tao xiang', '0.00', '0.00', '0.00', null);

-- ----------------------------
-- Table structure for es_pmt_goods
-- ----------------------------
DROP TABLE IF EXISTS `es_pmt_goods`;
CREATE TABLE `es_pmt_goods` (
  `pmt_id` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_pmt_goods
-- ----------------------------

-- ----------------------------
-- Table structure for es_pmt_member_lv
-- ----------------------------
DROP TABLE IF EXISTS `es_pmt_member_lv`;
CREATE TABLE `es_pmt_member_lv` (
  `pmt_id` int(8) DEFAULT NULL,
  `lv_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_pmt_member_lv
-- ----------------------------

-- ----------------------------
-- Table structure for es_point_history
-- ----------------------------
DROP TABLE IF EXISTS `es_point_history`;
CREATE TABLE `es_point_history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `member_id` int(9) NOT NULL,
  `point` int(10) NOT NULL,
  `time` bigint(20) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `related_id` bigint(20) DEFAULT NULL,
  `type` int(8) NOT NULL,
  `operator` varchar(50) DEFAULT NULL,
  `point_type` int(8) DEFAULT '0',
  `mp` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_ponit_history` (`member_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_point_history
-- ----------------------------
INSERT INTO `es_point_history` VALUES ('1', '1', '5', '1531799853', '2018年07月17日登录', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('2', '1', '0', '1531799853', '2018年07月17日登录', null, '1', 'member', '1', '5');
INSERT INTO `es_point_history` VALUES ('3', '2', '50', '1531811044', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('4', '2', '0', '1531811044', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('5', '2', '5', '1531880676', '2018年07月18日登录', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('6', '2', '0', '1531880676', '2018年07月18日登录', null, '1', 'member', '1', '5');
INSERT INTO `es_point_history` VALUES ('7', '2', '5', '1531880676', '2018年07月18日登录', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('8', '2', '0', '1531880676', '2018年07月18日登录', null, '1', 'member', '1', '5');
INSERT INTO `es_point_history` VALUES ('9', '3', '50', '1531880806', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('10', '3', '0', '1531880806', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('11', '1', '5', '1531883570', '2018年07月18日登录', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('12', '1', '0', '1531883570', '2018年07月18日登录', null, '1', 'member', '1', '5');
INSERT INTO `es_point_history` VALUES ('13', '4', '50', '1531883914', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('14', '4', '0', '1531883914', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('15', '5', '50', '1531896989', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('16', '5', '0', '1531896989', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('17', '6', '50', '1531898191', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('18', '6', '0', '1531898191', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('19', '7', '50', '1531898496', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('20', '7', '0', '1531898496', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('21', '8', '50', '1531905041', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('22', '8', '0', '1531905041', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('23', '9', '50', '1531905145', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('24', '9', '0', '1531905145', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('25', '10', '50', '1531905549', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('26', '10', '0', '1531905549', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('27', '11', '50', '1531905813', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('28', '11', '0', '1531905813', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('29', '12', '50', '1531906041', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('30', '12', '0', '1531906041', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('31', '13', '50', '1531906111', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('32', '13', '0', '1531906111', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('33', '14', '50', '1531906214', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('34', '14', '0', '1531906214', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('35', '15', '50', '1531906286', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('36', '15', '0', '1531906286', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('37', '16', '50', '1531906339', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('38', '16', '0', '1531906339', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('39', '17', '50', '1531906587', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('40', '17', '0', '1531906686', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('41', '18', '50', '1531906778', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('42', '18', '0', '1531906778', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('43', '40', '50', '1531906884', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('44', '40', '0', '1531906884', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('45', '0', '50', '1531907181', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('46', '0', '0', '1531907181', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('47', '46', '50', '1531907499', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('48', '46', '0', '1531907499', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('49', '0', '50', '1531907659', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('50', '0', '0', '1531907659', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('51', '0', '50', '1531907867', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('52', '0', '0', '1531907867', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('53', '50', '50', '1531908315', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('54', '50', '0', '1531908318', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('55', '54', '50', '1531908566', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('56', '54', '0', '1531908566', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('57', '0', '50', '1531908719', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('58', '0', '0', '1531908719', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('59', '0', '50', '1531909151', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('60', '0', '0', '1531909155', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('61', '60', '50', '1531909275', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('62', '60', '0', '1531909275', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('63', '62', '50', '1531909397', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('64', '62', '0', '1531909397', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('65', '23', '50', '1531910228', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('66', '23', '0', '1531910228', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('67', '31', '5', '1531969633', '2018年07月19日登录', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('68', '31', '0', '1531969633', '2018年07月19日登录', null, '1', 'member', '1', '5');
INSERT INTO `es_point_history` VALUES ('69', '1', '5', '1531969845', '2018年07月19日登录', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('70', '1', '0', '1531969845', '2018年07月19日登录', null, '1', 'member', '1', '5');
INSERT INTO `es_point_history` VALUES ('71', '30', '5', '1531983521', '2018年07月19日登录', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('72', '30', '0', '1531983521', '2018年07月19日登录', null, '1', 'member', '1', '5');
INSERT INTO `es_point_history` VALUES ('73', '0', '50', '1531990576', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('74', '0', '0', '1531990576', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('75', '1', '5', '1532052910', '2018年07月20日登录', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('76', '1', '0', '1532052910', '2018年07月20日登录', null, '1', 'member', '1', '5');
INSERT INTO `es_point_history` VALUES ('77', '31', '5', '1532073477', '2018年07月20日登录', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('78', '31', '0', '1532073477', '2018年07月20日登录', null, '1', 'member', '1', '5');
INSERT INTO `es_point_history` VALUES ('79', '1', '5', '1532332818', '2018年07月23日登录', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('80', '1', '0', '1532332818', '2018年07月23日登录', null, '1', 'member', '1', '5');
INSERT INTO `es_point_history` VALUES ('81', '1', '5', '1532397863', '2018年07月24日登录', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('82', '1', '0', '1532397863', '2018年07月24日登录', null, '1', 'member', '1', '5');
INSERT INTO `es_point_history` VALUES ('83', '1', '5', '1532487957', '2018年07月25日登录', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('84', '1', '0', '1532487957', '2018年07月25日登录', null, '1', 'member', '1', '5');
INSERT INTO `es_point_history` VALUES ('85', '1', '0', '1532506780', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('86', '1', '0', '1532506780', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('87', '1', '0', '1532507356', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('88', '1', '0', '1532507356', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('89', '1', '0', '1532507621', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('90', '1', '0', '1532507621', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('91', '1', '0', '1532507631', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('92', '1', '0', '1532507631', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('93', '1', '0', '1532507646', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('94', '1', '0', '1532507646', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('95', '1', '0', '1532508371', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('96', '1', '0', '1532508371', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('97', '1', '0', '1532508790', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('98', '1', '0', '1532508790', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('99', '1', '0', '1532509183', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('100', '1', '0', '1532509188', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('101', '1', '0', '1532509367', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('102', '1', '0', '1532509367', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('103', '1', '0', '1532509754', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('104', '1', '0', '1532509754', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('105', '1', '0', '1532510025', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('106', '1', '0', '1532510025', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('107', '1', '0', '1532510114', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('108', '1', '0', '1532510114', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('109', '1', '0', '1532510496', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('110', '1', '0', '1532510496', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('111', '1', '0', '1532510931', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('112', '1', '0', '1532510931', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('113', '1', '0', '1532511117', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('114', '1', '0', '1532511117', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('115', '1', '0', '1532511718', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('116', '1', '0', '1532511718', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('117', '1', '0', '1532513107', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('118', '1', '0', '1532513107', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('119', '1', '0', '1532513382', '退货退还积分', '1', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('120', '1', '0', '1532513382', '退货退还积分', '1', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('121', '1', '5', '1532571665', '2018年07月26日登录', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('122', '1', '0', '1532571665', '2018年07月26日登录', null, '1', 'member', '1', '5');
INSERT INTO `es_point_history` VALUES ('123', '0', '50', '1532585046', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('124', '0', '0', '1532585046', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('125', '0', '50', '1532585091', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('126', '0', '0', '1532585091', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('127', '0', '50', '1532585257', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('128', '0', '0', '1532585257', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('129', '0', '50', '1532585567', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('130', '0', '0', '1532585567', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('131', '0', '50', '1532585841', '成功注册', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('132', '0', '0', '1532585841', '成功注册', null, '1', 'member', '1', '50');
INSERT INTO `es_point_history` VALUES ('133', '37', '0', '1532591100', '退货退还积分', '37', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('134', '37', '0', '1532591100', '退货退还积分', '37', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('135', '37', '0', '1532591115', '退货退还积分', '37', '1', 'member', '1', '0');
INSERT INTO `es_point_history` VALUES ('136', '37', '0', '1532591115', '退货退还积分', '37', '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('137', '1', '5', '1532921015', '2018年07月30日登录', null, '1', 'member', '0', '0');
INSERT INTO `es_point_history` VALUES ('138', '1', '0', '1532921015', '2018年07月30日登录', null, '1', 'member', '1', '5');

-- ----------------------------
-- Table structure for es_print_tmpl
-- ----------------------------
DROP TABLE IF EXISTS `es_print_tmpl`;
CREATE TABLE `es_print_tmpl` (
  `prt_tmpl_id` int(10) NOT NULL AUTO_INCREMENT,
  `prt_tmpl_title` varchar(100) NOT NULL,
  `shortcut` varchar(5) DEFAULT 'false',
  `disabled` varchar(5) DEFAULT 'false',
  `prt_tmpl_width` varchar(10) NOT NULL DEFAULT '100',
  `prt_tmpl_height` varchar(10) NOT NULL DEFAULT '100',
  `prt_tmpl_data` longtext,
  `bgimage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`prt_tmpl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_print_tmpl
-- ----------------------------
INSERT INTO `es_print_tmpl` VALUES ('1', '宅急送', 'true', 'false', '1250', '2300', 'data', 'fs:/attachment/printTmpl/zhaijisong.jpg');
INSERT INTO `es_print_tmpl` VALUES ('2', '圆通速递', 'true', 'false', '1250', '2300', 'data', 'fs:/attachment/printTmpl/yuantong.jpg');

-- ----------------------------
-- Table structure for es_product
-- ----------------------------
DROP TABLE IF EXISTS `es_product`;
CREATE TABLE `es_product` (
  `product_id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_id` int(8) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sn` varchar(50) DEFAULT NULL,
  `store` int(8) DEFAULT '0',
  `enable_store` int(8) DEFAULT '0',
  `price` decimal(20,2) DEFAULT NULL,
  `specs` longtext,
  `cost` decimal(20,2) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `is_pack` int(8) DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `ind_product_goodsid` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_product
-- ----------------------------
INSERT INTO `es_product` VALUES ('1', '1', '测试商品', 'CSSP001', '3000017', '0', '0.01', null, '5.00', '0.00', '0');
INSERT INTO `es_product` VALUES ('2', '2', '无标题', '', '0', '0', '0.00', null, '0.00', '0.00', '0');
INSERT INTO `es_product` VALUES ('3', '3', '无标题', '', '0', '0', '0.00', null, '0.00', '0.00', '0');
INSERT INTO `es_product` VALUES ('4', '4', '无标题', '', '0', '0', '0.00', null, '0.00', '0.00', '0');
INSERT INTO `es_product` VALUES ('5', '5', '无标题', '', '0', '0', '0.00', null, '0.00', '0.00', '0');
INSERT INTO `es_product` VALUES ('6', '6', '无标题', '', '0', '0', '0.00', null, '0.00', '0.00', '0');
INSERT INTO `es_product` VALUES ('7', '7', '无标题', '', '0', '0', '0.00', null, '0.00', '0.00', '0');
INSERT INTO `es_product` VALUES ('8', '8', '无标题', null, '0', '0', '0.00', null, '0.00', '0.00', '0');
INSERT INTO `es_product` VALUES ('9', '9', '无标题', '', '0', '0', '0.00', null, '0.00', '0.00', '0');
INSERT INTO `es_product` VALUES ('10', '10', '无标题', '', '0', '0', '0.00', null, '0.00', '0.00', '0');

-- ----------------------------
-- Table structure for es_product_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `es_product_snapshot`;
CREATE TABLE `es_product_snapshot` (
  `snapshot_id` int(11) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sn` varchar(50) DEFAULT NULL,
  `store` int(8) DEFAULT '0',
  `enable_store` int(8) DEFAULT '0',
  `price` decimal(20,2) DEFAULT NULL,
  `specs` longtext,
  `cost` decimal(20,2) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `is_pack` int(8) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_product_snapshot
-- ----------------------------
INSERT INTO `es_product_snapshot` VALUES ('6', '1', '1', '测试商品', 'CSSP001', '666', '666', '16.00', null, '5.00', '0.00', '0');
INSERT INTO `es_product_snapshot` VALUES ('7', '1', '1', '测试商品', 'CSSP001', '3000017', '2897820', '0.01', null, '5.00', '0.00', '0');

-- ----------------------------
-- Table structure for es_product_store
-- ----------------------------
DROP TABLE IF EXISTS `es_product_store`;
CREATE TABLE `es_product_store` (
  `storeid` int(8) NOT NULL AUTO_INCREMENT,
  `goodsid` int(8) DEFAULT NULL,
  `productid` int(8) DEFAULT NULL,
  `depotid` int(8) DEFAULT NULL,
  `store` int(8) DEFAULT NULL,
  `enable_store` int(8) DEFAULT '0',
  PRIMARY KEY (`storeid`),
  KEY `ind_product_store_proid` (`productid`),
  KEY `ind_product_store_roomid` (`depotid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_product_store
-- ----------------------------
INSERT INTO `es_product_store` VALUES ('1', '1', '1', '1', '1000019', '-1990922');
INSERT INTO `es_product_store` VALUES ('2', '1', '1', '2', '999999', '999999');
INSERT INTO `es_product_store` VALUES ('3', '1', '1', '3', '999999', '999999');

-- ----------------------------
-- Table structure for es_promotion
-- ----------------------------
DROP TABLE IF EXISTS `es_promotion`;
CREATE TABLE `es_promotion` (
  `pmt_id` int(8) NOT NULL AUTO_INCREMENT,
  `pmts_id` varchar(255) NOT NULL,
  `pmta_id` int(8) DEFAULT NULL,
  `pmt_time_begin` bigint(20) DEFAULT NULL,
  `pmt_time_end` bigint(20) DEFAULT NULL,
  `order_money_from` decimal(20,2) NOT NULL DEFAULT '0.00',
  `order_money_to` decimal(20,2) NOT NULL DEFAULT '9999999.00',
  `seq` int(3) NOT NULL DEFAULT '0',
  `pmt_type` varchar(1) NOT NULL DEFAULT '0',
  `pmt_belong` varchar(1) NOT NULL DEFAULT '0',
  `pmt_bond_type` varchar(1) NOT NULL,
  `pmt_describe` longtext,
  `pmt_solution` longtext,
  `pmt_ifcoupon` int(3) NOT NULL DEFAULT '1',
  `pmt_update_time` bigint(20) DEFAULT '0',
  `pmt_basic_type` varchar(5) DEFAULT 'goods',
  `disabled` varchar(5) DEFAULT 'false',
  `pmt_ifsale` varchar(5) NOT NULL DEFAULT 'true',
  `pmt_distype` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_promotion
-- ----------------------------

-- ----------------------------
-- Table structure for es_promotion_activity
-- ----------------------------
DROP TABLE IF EXISTS `es_promotion_activity`;
CREATE TABLE `es_promotion_activity` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `enable` int(8) DEFAULT NULL,
  `begin_time` bigint(20) DEFAULT NULL,
  `end_time` bigint(20) DEFAULT NULL,
  `brief` longtext,
  `disabled` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_promotion_activity
-- ----------------------------

-- ----------------------------
-- Table structure for es_receipt
-- ----------------------------
DROP TABLE IF EXISTS `es_receipt`;
CREATE TABLE `es_receipt` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT NULL,
  `title` varchar(50) DEFAULT '',
  `content` varchar(50) DEFAULT '',
  `is_default` smallint(1) DEFAULT '0',
  `add_time` bigint(20) DEFAULT NULL,
  `duty` varchar(50) DEFAULT '',
  `type` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_receipt
-- ----------------------------

-- ----------------------------
-- Table structure for es_receipt_content
-- ----------------------------
DROP TABLE IF EXISTS `es_receipt_content`;
CREATE TABLE `es_receipt_content` (
  `contentid` int(10) NOT NULL AUTO_INCREMENT,
  `receipt_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_receipt_content
-- ----------------------------
INSERT INTO `es_receipt_content` VALUES ('1', '办公用品');
INSERT INTO `es_receipt_content` VALUES ('2', '劳保用品');
INSERT INTO `es_receipt_content` VALUES ('3', '耗材');

-- ----------------------------
-- Table structure for es_refund
-- ----------------------------
DROP TABLE IF EXISTS `es_refund`;
CREATE TABLE `es_refund` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) DEFAULT NULL,
  `sellback_id` int(10) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `refund_time` bigint(20) DEFAULT NULL,
  `refund_money` decimal(20,2) DEFAULT NULL,
  `refund_way` varchar(255) DEFAULT NULL,
  `return_account` varchar(255) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `sndto` varchar(255) DEFAULT NULL,
  `member_name` varchar(255) DEFAULT NULL,
  `refund_user` varchar(255) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `refund_type` varchar(255) DEFAULT NULL,
  `txn_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_refund
-- ----------------------------
INSERT INTO `es_refund` VALUES ('1', '180720022249', '1', '23', '1532067769', null, '90.00', '在线支付', '110', '1', 'tao xiang', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('2', '180720040557', '4', '23', '1532073957', null, '90.00', '在线支付', 'test', '1', 'tao xiang', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('3', '180720040751', '5', '23', '1532074071', null, '90.00', '在线支付', 'test', '1', 'tao xiang', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('4', '180720040938', '6', '23', '1532074178', null, '90.00', '在线支付', 'test', '1', 'tao xiang', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('5', '180720041111', '7', '23', '1532074271', null, '90.00', '在线支付', 'test', '1', 'tao xiang', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('6', '180720041316', '8', '23', '1532074396', null, '90.00', '在线支付', 'test', '1', 'tao xiang', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('7', '180720041334', '3', '24', '1532074414', null, '16010.00', '在线支付', 'test', '31', 'test0011', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('8', '180720041758', '9', '24', '1532074678', null, '16010.00', '在线支付', 'test', '31', 'test0011', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('9', '180720042121', '10', '24', '1532074881', null, '16010.00', '在线支付', 'test', '31', 'test0011', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('10', '180720042355', '11', '24', '1532075035', null, '16010.00', '在线支付', 'test', '31', 'test0011', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('11', '180720042824', '12', '24', '1532075304', null, '16010.00', '在线支付', 'test', '31', 'test0011', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('12', '180720043342', '13', '24', '1532075622', null, '16010.00', '在线支付', 'test', '31', 'test0011', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('13', '180720043457', '14', '24', '1532075697', null, '16010.00', '在线支付', 'test', '31', 'test0011', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('14', '180720043818', '15', '24', '1532075898', null, '16010.00', '在线支付', 'test', '31', 'test0011', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('15', '180720044030', '16', '24', '1532076030', null, '16010.00', '在线支付', 'test', '31', 'test0011', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('16', '180720050235', '17', '15', '1532077355', null, '330.00', '支付宝', 'test', '31', 'test0011', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('17', '180720052505', '19', '38', '1532078705', null, '333.00', '在线支付', 'test', '31', 'test0011', null, null, '0', 'onlinePay', null);
INSERT INTO `es_refund` VALUES ('18', '180725040948', '20', '59', '1532506188', '1532507356', '0.01', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('19', '180725041134', '21', '58', '1532506294', '1532506780', '0.01', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('20', '180725043317', '25', '58', '1532507597', '1532507646', '0.01', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('21', '180725043322', '24', '57', '1532507602', '1532507631', '0.01', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('22', '180725043332', '23', '59', '1532507612', '1532507621', '0.01', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('23', '180725044523', '27', '53', '1532508323', '1532508711', '0.01', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('24', '180725044534', '26', '55', '1532508334', '1532508371', '0.01', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('25', '180725045631', '28', '60', '1532508991', '1532509019', '0.01', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('26', '180725050155', '29', '61', '1532509315', '1532509324', '0.01', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('27', '180725050850', '30', '62', '1532509730', '1532509748', '0.01', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('28', '180725051334', '31', '63', '1532510014', '1532510025', '0.01', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('29', '180725051507', '32', '64', '1532510107', '1532510114', '0.01', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('30', '180725052110', '33', '67', '1532510470', '1532510495', '0.01', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('31', '180725052811', '34', '69', '1532510891', '1532510931', '0.02', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('32', '180725053137', '35', '70', '1532511097', '1532511117', '0.01', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('33', '180725054141', '36', '71', '1532511701', '1532511708', '0.01', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('34', '180725055959', '37', '72', '1532512799', '1532513103', '0.01', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('35', '180725060715', '38', '73', '1532513235', '1532513379', '0.02', '原支付方式退款', null, '1', 'tao xiang', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('36', '180726023728', '39', '75', '1532587048', '1532591088', '0.17', '原支付方式退款', null, '37', 'llll', null, 'admin', '2', 'alipayWapPlugin', null);
INSERT INTO `es_refund` VALUES ('37', '180726024533', '40', '76', '1532587533', '1532591115', '0.01', '原支付方式退款', null, '37', 'llll', null, 'admin', '2', 'alipayWapPlugin', null);

-- ----------------------------
-- Table structure for es_refund_logs
-- ----------------------------
DROP TABLE IF EXISTS `es_refund_logs`;
CREATE TABLE `es_refund_logs` (
  `refund_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `order_sn` varchar(255) DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `type` int(8) DEFAULT NULL,
  `pay_method` varchar(50) DEFAULT NULL,
  `pay_user` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `sn` varchar(50) DEFAULT NULL,
  `money` decimal(20,2) DEFAULT NULL,
  `op_user` varchar(10) DEFAULT NULL,
  `pay_date` bigint(20) DEFAULT NULL,
  `remark` longtext,
  `create_time` bigint(20) DEFAULT NULL,
  `txn_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`refund_id`),
  KEY `es_ind_refund_log` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_refund_logs
-- ----------------------------

-- ----------------------------
-- Table structure for es_regions
-- ----------------------------
DROP TABLE IF EXISTS `es_regions`;
CREATE TABLE `es_regions` (
  `region_id` int(10) NOT NULL AUTO_INCREMENT,
  `p_region_id` int(10) DEFAULT NULL,
  `region_path` varchar(255) DEFAULT NULL,
  `region_grade` int(8) DEFAULT NULL,
  `local_name` varchar(100) NOT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `cod` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51983 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_regions
-- ----------------------------
INSERT INTO `es_regions` VALUES ('1', '0', ',1,', '1', '北京', '', '1');
INSERT INTO `es_regions` VALUES ('2', '0', ',2,', '1', '上海', '', '1');
INSERT INTO `es_regions` VALUES ('78', '2', ',2,78,', '2', '黄浦区', null, '1');
INSERT INTO `es_regions` VALUES ('452', '34', ',1,34,452,', '3', '燕郊', '101601', '1');
INSERT INTO `es_regions` VALUES ('967', '965', ',12,965,967,', '3', '通州区', null, '1');
INSERT INTO `es_regions` VALUES ('2799', '72', ',1,72,2799,', '3', '三环以内', null, '1');
INSERT INTO `es_regions` VALUES ('2800', '1', ',1,2800,', '2', '海淀区', '', '1');
INSERT INTO `es_regions` VALUES ('2801', '1', ',1,2801,', '2', '西城区', null, '1');
INSERT INTO `es_regions` VALUES ('2802', '1', ',1,2802,', '2', '东城区', null, '1');
INSERT INTO `es_regions` VALUES ('2803', '1', ',1,2803,', '2', '崇文区', null, '1');
INSERT INTO `es_regions` VALUES ('2804', '1', ',1,2804,', '2', '宣武区', null, '1');
INSERT INTO `es_regions` VALUES ('2805', '1', ',1,2805,', '2', '丰台区', '', '1');
INSERT INTO `es_regions` VALUES ('2806', '1', ',1,2806,', '2', '石景山区', null, '1');
INSERT INTO `es_regions` VALUES ('2807', '1', ',1,2807,', '2', '门头沟', null, '1');
INSERT INTO `es_regions` VALUES ('2808', '1', ',1,2808,', '2', '房山区', null, '1');
INSERT INTO `es_regions` VALUES ('2810', '1', ',1,2810,', '2', '大兴区', null, '1');
INSERT INTO `es_regions` VALUES ('2812', '1', ',1,2812,', '2', '顺义区', null, '1');
INSERT INTO `es_regions` VALUES ('2813', '2', ',2,2813,', '2', '徐汇区', null, '1');
INSERT INTO `es_regions` VALUES ('2814', '1', ',1,2814,', '2', '怀柔区', null, '1');
INSERT INTO `es_regions` VALUES ('2815', '2', ',2,2815,', '2', '长宁区', null, '1');
INSERT INTO `es_regions` VALUES ('2816', '1', ',1,2816,', '2', '密云区', '', '1');
INSERT INTO `es_regions` VALUES ('2817', '2', ',2,2817,', '2', '静安区', null, '1');
INSERT INTO `es_regions` VALUES ('2820', '2', ',2,2820,', '2', '闸北区', null, '1');
INSERT INTO `es_regions` VALUES ('2821', '2802', ',1,2802,2821,', '3', '内环到三环里', null, '1');
INSERT INTO `es_regions` VALUES ('2822', '2', ',2,2822,', '2', '虹口区', null, '1');
INSERT INTO `es_regions` VALUES ('2823', '2', ',2,2823,', '2', '杨浦区', null, '1');
INSERT INTO `es_regions` VALUES ('2825', '2', ',2,2825,', '2', '闵行区', null, '1');
INSERT INTO `es_regions` VALUES ('2826', '2', ',2,2826,', '2', '嘉定区', null, '1');
INSERT INTO `es_regions` VALUES ('2827', '2801', ',1,2801,2827,', '3', '内环到二环里', null, '1');
INSERT INTO `es_regions` VALUES ('2828', '2804', ',1,2804,2828,', '3', '内环到三环里', null, '1');
INSERT INTO `es_regions` VALUES ('2829', '2803', ',1,2803,2829,', '3', '一环到二环', null, '1');
INSERT INTO `es_regions` VALUES ('2830', '2', ',2,2830,', '2', '浦东新区', null, '1');
INSERT INTO `es_regions` VALUES ('2831', '2806', ',1,2806,2831,', '3', '四环到五环内', null, '1');
INSERT INTO `es_regions` VALUES ('2832', '2805', ',1,2805,2832,', '3', '四环到五环之间', null, '1');
INSERT INTO `es_regions` VALUES ('2833', '2', ',2,2833,', '2', '青浦区', null, '1');
INSERT INTO `es_regions` VALUES ('2834', '2', ',2,2834,', '2', '松江区', null, '1');
INSERT INTO `es_regions` VALUES ('2835', '2', ',2,2835,', '2', '金山区', null, '1');
INSERT INTO `es_regions` VALUES ('2837', '2', ',2,2837,', '2', '奉贤区', null, '1');
INSERT INTO `es_regions` VALUES ('2841', '2', ',2,2841,', '2', '普陀区', null, '1');
INSERT INTO `es_regions` VALUES ('2848', '2800', ',1,2800,2848,', '3', '三环以内', null, '1');
INSERT INTO `es_regions` VALUES ('2862', '2816', ',1,2816,2862,', '3', '城区以外', '', '1');
INSERT INTO `es_regions` VALUES ('2901', '1', ',1,2901,', '2', '昌平区', null, '1');
INSERT INTO `es_regions` VALUES ('2906', '2901', ',1,2901,2906,', '3', '城区以外', null, '1');
INSERT INTO `es_regions` VALUES ('2919', '2', ',2,2919,', '2', '崇明县', null, '1');
INSERT INTO `es_regions` VALUES ('2953', '1', ',1,2953,', '2', '平谷区', null, '1');
INSERT INTO `es_regions` VALUES ('3065', '1', ',1,3065,', '2', '延庆县', null, '1');
INSERT INTO `es_regions` VALUES ('3343', '731', ',10,731,3343,', '3', '宝山区', null, '1');
INSERT INTO `es_regions` VALUES ('4194', '2810', ',1,2810,4194,', '3', '四环至五环之间', null, '1');
INSERT INTO `es_regions` VALUES ('6115', '2814', ',1,2814,6115,', '3', '城区以内', null, '1');
INSERT INTO `es_regions` VALUES ('6666', '2953', ',1,2953,6666,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('6667', '2816', ',1,2816,6667,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('33993', '785', ',10,782,785,33993,', '4', '朝阳区', null, '1');
INSERT INTO `es_regions` VALUES ('49707', '274', ',5,274,49707,', '3', '三河市', '', '1');
INSERT INTO `es_regions` VALUES ('50779', '2919', ',2,2919,50779,', '3', '堡镇', null, '1');
INSERT INTO `es_regions` VALUES ('51125', '2812', ',1,2812,51125,', '3', '北石槽镇', null, '1');
INSERT INTO `es_regions` VALUES ('51216', '2809', ',1,2809,51216,', '3', '六环内（马驹桥镇）', null, '1');
INSERT INTO `es_regions` VALUES ('51505', '3065', ',1,3065,51505,', '3', '延庆镇', null, '1');
INSERT INTO `es_regions` VALUES ('51528', '2808', ',1,2808,51528,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('51552', '2807', ',1,2807,51552,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('51800', '2830', ',2,2830,51800,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('51911', '2824', ',2,2824,51911,', '3', '罗店镇', null, '1');
INSERT INTO `es_regions` VALUES ('51928', '2837', ',2,2837,51928,', '3', '南桥镇', null, '1');
INSERT INTO `es_regions` VALUES ('51931', '2825', ',2,2825,51931,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('51941', '2826', ',2,2826,51941,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('51959', '2833', ',2,2833,51959,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('51960', '2835', ',2,2835,51960,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('51972', '2820', ',2,2820,51972,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('51973', '2817', ',2,2817,51973,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('51974', '2823', ',2,2823,51974,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('51975', '2815', ',2,2815,51975,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('51976', '2813', ',2,2813,51976,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('51978', '78', ',2,78,51978,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('51979', '2822', ',2,2822,51979,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('51980', '2841', ',2,2841,51980,', '3', '城区', null, '1');
INSERT INTO `es_regions` VALUES ('51982', '2834', ',2,2834,51982,', '3', '城区', null, '1');

-- ----------------------------
-- Table structure for es_returns_order
-- ----------------------------
DROP TABLE IF EXISTS `es_returns_order`;
CREATE TABLE `es_returns_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ordersn` varchar(50) DEFAULT NULL,
  `memberid` int(10) DEFAULT NULL,
  `state` int(6) DEFAULT NULL,
  `goodsns` longtext,
  `type` int(6) DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `refuse_reason` varchar(200) DEFAULT NULL,
  `apply_reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_returns_order
-- ----------------------------

-- ----------------------------
-- Table structure for es_role
-- ----------------------------
DROP TABLE IF EXISTS `es_role`;
CREATE TABLE `es_role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) DEFAULT NULL,
  `rolememo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_role
-- ----------------------------
INSERT INTO `es_role` VALUES ('1', '超级管理员', '超级管理员');
INSERT INTO `es_role` VALUES ('2', '产品部', '产品部');
INSERT INTO `es_role` VALUES ('3', '库管', '库管');
INSERT INTO `es_role` VALUES ('4', '财务部', '财务部');
INSERT INTO `es_role` VALUES ('5', '客服', '客服');

-- ----------------------------
-- Table structure for es_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `es_role_auth`;
CREATE TABLE `es_role_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `authid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_role_auth
-- ----------------------------
INSERT INTO `es_role_auth` VALUES ('1', '1', '1');
INSERT INTO `es_role_auth` VALUES ('2', '3', '4');
INSERT INTO `es_role_auth` VALUES ('3', '4', '5');
INSERT INTO `es_role_auth` VALUES ('4', '5', '6');
INSERT INTO `es_role_auth` VALUES ('5', '2', '2');

-- ----------------------------
-- Table structure for es_second_half_activity_detail
-- ----------------------------
DROP TABLE IF EXISTS `es_second_half_activity_detail`;
CREATE TABLE `es_second_half_activity_detail` (
  `detail_id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_second_half_activity_detail
-- ----------------------------

-- ----------------------------
-- Table structure for es_sellback_goodslist
-- ----------------------------
DROP TABLE IF EXISTS `es_sellback_goodslist`;
CREATE TABLE `es_sellback_goodslist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(8) DEFAULT NULL,
  `recid` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `ship_num` int(8) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `return_num` int(8) DEFAULT NULL,
  `storage_num` int(8) DEFAULT '0',
  `goods_remark` varchar(255) DEFAULT NULL,
  `goods_sn` varchar(100) DEFAULT NULL,
  `goods_name` varchar(100) DEFAULT NULL,
  `goods_image` varchar(255) DEFAULT NULL,
  `spec_json` varchar(255) DEFAULT NULL,
  `return_type` int(8) DEFAULT NULL,
  `item_type` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_sellback_goodslist
-- ----------------------------
INSERT INTO `es_sellback_goodslist` VALUES ('1', '23', '1', '1', '1', '5', '16.00', '5', '0', '商品质量有问题', null, '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('2', '23', '2', '1', '1', '5', '16.00', '5', '0', '商品质量有问题', null, '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('3', '24', '3', '1', '1', '1000', '16.00', '1000', '0', '商品质量有问题', null, '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('4', '23', '4', '1', '1', '5', '16.00', '5', '0', '商品质量有问题', null, '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('5', '23', '5', '1', '1', '5', '16.00', '5', '0', '商品质量有问题', null, '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('6', '23', '6', '1', '1', '5', '16.00', '5', '0', '商品质量有问题', null, '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('7', '23', '7', '1', '1', '5', '16.00', '5', '0', '商品质量有问题', null, '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('8', '23', '8', '1', '1', '5', '16.00', '5', '0', '商品质量有问题', null, '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('9', '24', '9', '1', '1', '1000', '16.00', '1000', '0', '未按照时间发货', null, '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('10', '24', '10', '1', '1', '1000', '16.00', '1000', '0', '买错/不想要', null, '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('11', '24', '292', '1', '1', '1000', '16.00', '1000', '0', '商品质量有问题', null, '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('12', '24', '12', '1', '1', '1000', '16.00', '1000', '0', '商品质量有问题', null, '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('13', '24', '0', '1', '1', '1000', '16.00', '1000', '0', '商品质量有问题', null, '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('14', '24', '0', '1', '1', '1000', '16.00', '1000', '0', '未按照时间发货', null, '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('15', '24', '15', '1', '1', '1000', '16.00', '1000', '0', '快递一直没有收到', null, '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('16', '24', '16', '1', '1', '1000', '16.00', '1000', '0', '未按照时间发货', null, '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('17', '15', '17', '1', '1', '20', '16.00', '20', '20', '', 'CSSP001', '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('18', '15', '18', '1', '1', '20', '16.00', '20', '0', '', 'CSSP001', '测试商品', 'http://localhost:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('19', '37', '19', '1', '1', '5', '16.00', '5', '0', '商品质量有问题', null, '测试商品', 'http://192.168.2.184:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('20', '58', '20', '1', '1', '1', '0.01', '1', '0', '买错/不想要', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('21', '57', '21', '1', '1', '1', '0.01', '1', '0', '其他', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('22', '58', '22', '1', '1', '1', '0.01', '1', '0', '收到商品与描述不符', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('23', '58', '23', '1', '1', '1', '0.01', '1', '0', '商品质量有问题', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('24', '56', '24', '1', '1', '1', '0.01', '1', '0', '未按照时间发货', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('25', '57', '25', '1', '1', '1', '0.01', '1', '0', '商品质量有问题', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('26', '54', '27', '1', '1', '1', '0.01', '1', '0', '不喜欢/不想要', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('27', '52', '0', '1', '1', '1', '0.01', '1', '0', '商品质量有问题', null, '测试商品', 'http://192.168.2.164:80/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('28', '59', '28', '1', '1', '1', '0.01', '1', '0', '商品质量有问题', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('29', '60', '29', '1', '1', '1', '0.01', '1', '0', '商品质量有问题', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('30', '61', '30', '1', '1', '1', '0.01', '1', '0', '商品质量有问题', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('31', '62', '31', '1', '1', '1', '0.01', '1', '0', '收到商品与描述不符', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('32', '63', '32', '1', '1', '1', '0.01', '1', '0', '商品质量有问题', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('33', '66', '33', '1', '1', '1', '0.01', '1', '0', '收到商品与描述不符', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('34', '68', '34', '1', '1', '1', '0.01', '1', '0', '商品质量有问题', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('35', '69', '35', '1', '1', '1', '0.01', '1', '0', '商品质量有问题', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('36', '70', '36', '1', '1', '1', '0.01', '1', '0', '商品质量有问题', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('37', '71', '37', '1', '1', '1', '0.01', '1', '0', '商品质量有问题', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('38', '72', '38', '1', '1', '1', '0.01', '1', '0', '商品质量有问题', null, '测试商品', 'http://pengqi.51vip.biz:20035//statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('39', '74', '39', '1', '1', '17', '0.01', '17', '0', '不喜欢/不想要', null, '测试商品', 'http://pengqi.51vip.biz:20035/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);
INSERT INTO `es_sellback_goodslist` VALUES ('40', '75', '40', '1', '1', '1', '0.01', '1', '0', '发票问题', null, '测试商品', 'http://pengqi.51vip.biz:20035/statics/attachment//goods/2018/7/16/18//22054803_thumbnail.png', null, '0', null);

-- ----------------------------
-- Table structure for es_sellback_list
-- ----------------------------
DROP TABLE IF EXISTS `es_sellback_list`;
CREATE TABLE `es_sellback_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orderid` int(10) DEFAULT NULL,
  `tradeno` varchar(100) DEFAULT NULL,
  `tradestatus` int(8) DEFAULT NULL,
  `ordersn` varchar(100) DEFAULT NULL,
  `regoperator` varchar(100) DEFAULT NULL,
  `regtime` bigint(20) DEFAULT NULL,
  `alltotal_pay` decimal(20,2) DEFAULT NULL,
  `apply_alltotal` decimal(20,2) DEFAULT NULL,
  `goodslist` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `seller_remark` varchar(255) DEFAULT NULL,
  `warehouse_remark` varchar(255) DEFAULT NULL,
  `finance_remark` varchar(255) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `sndto` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `adr` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `refund_way` varchar(255) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL,
  `depotid` int(10) DEFAULT NULL,
  `return_account` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `type` int(10) DEFAULT NULL,
  `confirm_time` bigint(20) DEFAULT NULL,
  `gift_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_sellback_list
-- ----------------------------
INSERT INTO `es_sellback_list` VALUES ('1', '23', '180720021949', '1', '153197051641', '会员[test]', '1532067589', '90.00', '90.00', null, '', '', null, null, '1', 'tao xiang', null, null, null, '在线支付', null, null, '110', '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('2', '23', '180720031238', '2', '153197051641', '会员[test]', '1532070758', '90.00', '90.00', null, '', '', null, null, '1', 'tao xiang', null, null, null, '在线支付', null, null, 'test', '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('3', '24', '180720040059', '1', '153198300886', '会员[test0011]', '1532073659', '16010.00', '16010.00', null, '', '', null, null, '31', 'test0011', null, null, null, '在线支付', null, null, 'test', '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('4', '23', '180720040313', '1', '153197051641', '会员[test]', '1532073793', '90.00', '90.00', null, '', '', null, null, '1', 'tao xiang', null, null, null, '在线支付', null, null, 'test', '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('5', '23', '180720040653', '1', '153197051641', '会员[test]', '1532074013', '90.00', '90.00', null, '', '', null, null, '1', 'tao xiang', null, null, null, '在线支付', null, null, 'test', '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('6', '23', '180720040835', '1', '153197051641', '会员[test]', '1532074115', '90.00', '90.00', null, '', '', null, null, '1', 'tao xiang', null, null, null, '在线支付', null, null, 'test', '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('7', '23', '180720041004', '1', '153197051641', '会员[test]', '1532074204', '90.00', '90.00', null, '', '', null, null, '1', 'tao xiang', null, null, null, '在线支付', null, null, 'test', '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('8', '23', '180720041305', '1', '153197051641', '会员[test]', '1532074385', '90.00', '90.00', null, '', '', null, null, '1', 'tao xiang', null, null, null, '在线支付', null, null, 'test', '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('9', '24', '180720041734', '1', '153198300886', '会员[test0011]', '1532074654', '16010.00', '16010.00', null, '', '', null, null, '31', 'test0011', null, null, null, '在线支付', null, null, 'test', '未按照时间发货', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('10', '24', '180720042002', '1', '153198300886', '会员[test0011]', '1532074802', '16010.00', '16010.00', null, '', '', null, null, '31', 'test0011', null, null, null, '在线支付', null, null, 'test', '买错/不想要', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('11', '24', '180720042345', '1', '153198300886', '会员[test0011]', '1532075025', '16010.00', '16010.00', null, '', '', null, null, '31', 'test0011', null, null, null, '在线支付', null, null, 'test', '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('12', '24', '180720042604', '1', '153198300886', '会员[test0011]', '1532075164', '16010.00', '16010.00', null, '', '', null, null, '31', 'test0011', null, null, null, '在线支付', null, null, 'test', '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('13', '24', '180720043259', '1', '153198300886', '会员[test0011]', '1532075579', '16010.00', '16010.00', null, '', '', null, null, '31', 'test0011', null, null, null, '在线支付', null, null, 'test', '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('14', '24', '180720043447', '1', '153198300886', '会员[test0011]', '1532075687', '16010.00', '16010.00', null, '', '', null, null, '31', 'test0011', null, null, null, '在线支付', null, null, 'test', '未按照时间发货', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('15', '24', '180720043640', '1', '153198300886', '会员[test0011]', '1532075800', '16010.00', '16010.00', null, '', '', null, null, '31', 'test0011', null, null, null, '在线支付', null, null, 'test', '快递一直没有收到', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('16', '24', '180720044021', '1', '153198300886', '会员[test0011]', '1532076021', '16010.00', '16010.00', null, '', '', null, null, '31', 'test0011', null, null, null, '在线支付', null, null, 'test', '未按照时间发货', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('17', '15', '180720050140', '4', '153196963819', '会员[test0011]', '1532077300', '330.00', '330.00', '', '', '', '', null, '31', 'test0011', null, null, null, '支付宝', null, '1', 'test', '商品质量有问题', '2', '1532077328', null);
INSERT INTO `es_sellback_list` VALUES ('18', '15', '180720050747', '1', '153196963819', '会员[test0011]', '1532077667', '330.00', '330.00', null, '', '', null, null, '31', 'test0011', null, null, null, '支付宝', null, '1', 'test', '未按照时间发货', '2', '1532078286', null);
INSERT INTO `es_sellback_list` VALUES ('19', '38', '180720052441', '1', '153207849026', '会员[test0011]', '1532078681', '333.00', '333.00', null, 'test', '', null, null, '31', 'test0011', null, null, null, '在线支付', null, null, 'test', '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('20', '59', '180725040917', '7', '153250182042', '会员[test]', '1532506157', '0.01', '0.01', null, '123', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '买错/不想要', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('21', '58', '180725041125', '7', '153250160685', '会员[test]', '1532506285', '0.01', '0.01', null, '222', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '其他', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('22', '59', '180725042831', '2', '153250182042', '会员[test]', '1532507311', '0.01', '0.01', null, '', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '收到商品与描述不符', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('23', '59', '180725043036', '7', '153250182042', '会员[test]', '1532507436', '0.01', '0.01', null, '', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('24', '57', '180725043052', '7', '153250111686', '会员[test]', '1532507452', '0.01', '0.01', null, '', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '未按照时间发货', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('25', '58', '180725043105', '7', '153250160685', '会员[test]', '1532507465', '0.01', '0.01', null, '', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('26', '55', '180725044431', '7', '153249861933', '会员[test]', '1532508271', '0.01', '0.01', null, '', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '不喜欢/不想要', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('27', '53', '180725044453', '7', '153249017031', '会员[test]', '1532508293', '0.01', '0.01', null, '', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('28', '60', '180725045618', '7', '153250893553', '会员[test]', '1532508978', '0.01', '0.01', null, '', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('29', '61', '180725050143', '7', '153250923111', '会员[test]', '1532509303', '0.01', '0.01', null, '', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('30', '62', '180725050821', '7', '153250965936', '会员[test]', '1532509701', '0.01', '0.01', null, '123', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('31', '63', '180725051301', '7', '153250994856', '会员[test]', '1532509981', '0.01', '0.01', null, '', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '收到商品与描述不符', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('32', '64', '180725051454', '7', '153251007081', '会员[test]', '1532510094', '0.01', '0.01', null, '', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('33', '67', '180725052057', '7', '153251038819', '会员[test]', '1532510457', '0.01', '0.01', null, '', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '收到商品与描述不符', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('34', '69', '180725052757', '7', '153251066383', '会员[test]', '1532510877', '0.02', '0.02', null, '', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('35', '70', '180725053127', '7', '153251103488', '会员[test]', '1532511087', '0.01', '0.01', null, '', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('36', '71', '180725054132', '7', '153251161594', '会员[test]', '1532511692', '0.01', '0.01', null, '', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('37', '72', '180725055952', '7', '153251270915', '会员[test]', '1532512792', '0.01', '0.01', null, '', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('38', '73', '180725060654', '7', '153251316134', '会员[test]', '1532513214', '0.02', '0.02', null, '', '', null, null, '1', 'tao xiang', null, null, null, '原支付方式退款', null, null, null, '商品质量有问题', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('39', '75', '180726023641', '7', '153258603370', '会员[llll]', '1532587001', '0.17', '0.17', null, '', '', null, null, '37', 'llll', null, null, null, '原支付方式退款', null, null, null, '不喜欢/不想要', '1', null, null);
INSERT INTO `es_sellback_list` VALUES ('40', '76', '180726024522', '7', '153258747819', '会员[llll]', '1532587522', '0.01', '0.01', null, '', '', null, null, '37', 'llll', null, null, null, '原支付方式退款', null, null, null, '发票问题', '1', null, null);

-- ----------------------------
-- Table structure for es_sellback_log
-- ----------------------------
DROP TABLE IF EXISTS `es_sellback_log`;
CREATE TABLE `es_sellback_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `recid` int(10) DEFAULT NULL,
  `logtime` bigint(20) DEFAULT NULL,
  `logdetail` varchar(255) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_sellback_log
-- ----------------------------
INSERT INTO `es_sellback_log` VALUES ('1', '1', '1532067769', '申请退款，通过，申请退款金额：90.0', 'admin');
INSERT INTO `es_sellback_log` VALUES ('2', '2', '1532073692', '申请退款，拒绝通过', 'admin');
INSERT INTO `es_sellback_log` VALUES ('3', '4', '1532073957', '申请退款，通过，申请退款金额：90.0', 'admin');
INSERT INTO `es_sellback_log` VALUES ('4', '5', '1532074071', '申请退款，通过，申请退款金额：90.0', 'admin');
INSERT INTO `es_sellback_log` VALUES ('5', '6', '1532074182', '申请退款，通过，申请退款金额：90.0', 'admin');
INSERT INTO `es_sellback_log` VALUES ('6', '7', '1532074271', '申请退款，通过，申请退款金额：90.0', 'admin');
INSERT INTO `es_sellback_log` VALUES ('7', '8', '1532074396', '申请退款，通过，申请退款金额：90.0', 'admin');
INSERT INTO `es_sellback_log` VALUES ('8', '3', '1532074414', '申请退款，通过，申请退款金额：16010.0', 'admin');
INSERT INTO `es_sellback_log` VALUES ('9', '9', '1532074678', '申请退款，通过，申请退款金额：16010.0', 'admin');
INSERT INTO `es_sellback_log` VALUES ('10', '10', '1532074881', '申请退款，通过，申请退款金额：16010.0', 'admin');
INSERT INTO `es_sellback_log` VALUES ('11', '11', '1532075035', '申请退款，通过，申请退款金额：16010.0', 'admin');
INSERT INTO `es_sellback_log` VALUES ('12', '12', '1532075304', '申请退款，通过，申请退款金额：16010.0', 'admin');
INSERT INTO `es_sellback_log` VALUES ('13', '13', '1532075622', '申请退款，通过，申请退款金额：16010.0', 'admin');
INSERT INTO `es_sellback_log` VALUES ('14', '14', '1532075697', '申请退款，通过，申请退款金额：16010.0', 'admin');
INSERT INTO `es_sellback_log` VALUES ('15', '15', '1532075954', '申请退款，通过，申请退款金额：16010.0', 'admin');
INSERT INTO `es_sellback_log` VALUES ('16', '16', '1532076030', '申请退款，通过，申请退款金额：16010.0', 'admin');
INSERT INTO `es_sellback_log` VALUES ('17', '17', '1532077328', '审核退货申请', 'admin');
INSERT INTO `es_sellback_log` VALUES ('18', '17', '1532077355', '商品入库', 'admin');
INSERT INTO `es_sellback_log` VALUES ('19', '17', '1532077355', '退货入库', 'admin');
INSERT INTO `es_sellback_log` VALUES ('20', '18', '1532078290', '审核退货申请', 'admin');
INSERT INTO `es_sellback_log` VALUES ('21', '19', '1532078705', '申请退款，通过，申请退款金额：333.0', 'admin');
INSERT INTO `es_sellback_log` VALUES ('22', '20', '1532506188', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('23', '21', '1532506294', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('24', '21', '1532506780', '退款中，金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('25', '20', '1532507356', '退款中，金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('26', '22', '1532507407', '申请退款，拒绝通过', 'admin');
INSERT INTO `es_sellback_log` VALUES ('27', '25', '1532507597', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('28', '24', '1532507602', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('29', '23', '1532507612', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('30', '23', '1532507621', '退款中，金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('31', '24', '1532507631', '退款中，金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('32', '25', '1532507646', '退款中，金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('33', '27', '1532508323', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('34', '26', '1532508334', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('35', '26', '1532508371', '退款中，金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('36', '27', '1532508790', '退款中，金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('37', '28', '1532508991', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('38', '28', '1532509172', '退款中，金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('39', '29', '1532509315', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('40', '29', '1532509367', '退款中，金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('41', '30', '1532509730', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('42', '30', '1532509754', '退款中，金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('43', '31', '1532510014', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('44', '31', '1532510025', '退款中，金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('45', '32', '1532510107', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('46', '32', '1532510114', '退款中，金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('47', '33', '1532510471', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('48', '33', '1532510495', '退款中，金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('49', '34', '1532510891', '申请退款，通过，申请退款金额：0.02', 'admin');
INSERT INTO `es_sellback_log` VALUES ('50', '34', '1532510931', '退款中，金额：0.02', 'admin');
INSERT INTO `es_sellback_log` VALUES ('51', '35', '1532511097', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('52', '35', '1532511117', '退款中，金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('53', '36', '1532511701', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('54', '36', '1532511718', '退款中，金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('55', '37', '1532512799', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('56', '37', '1532513107', '退款中，金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('57', '38', '1532513235', '申请退款，通过，申请退款金额：0.02', 'admin');
INSERT INTO `es_sellback_log` VALUES ('58', '38', '1532513382', '退款中，金额：0.02', 'admin');
INSERT INTO `es_sellback_log` VALUES ('59', '39', '1532587048', '申请退款，通过，申请退款金额：0.17', 'admin');
INSERT INTO `es_sellback_log` VALUES ('60', '40', '1532587533', '申请退款，通过，申请退款金额：0.01', 'admin');
INSERT INTO `es_sellback_log` VALUES ('61', '39', '1532591100', '退款中，金额：0.17', 'admin');
INSERT INTO `es_sellback_log` VALUES ('62', '40', '1532591115', '退款中，金额：0.01', 'admin');

-- ----------------------------
-- Table structure for es_settings
-- ----------------------------
DROP TABLE IF EXISTS `es_settings`;
CREATE TABLE `es_settings` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `cfg_value` varchar(1000) DEFAULT NULL,
  `cfg_group` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_settings
-- ----------------------------
INSERT INTO `es_settings` VALUES ('1', null, '{\"closereson\":\"\",\"keywords\":\"最好的Java网店系统,Java多用户商城,Java商城定制开发\",\"logofile\":\"fs://images/logo.gif\",\"sitename\":\"Dmall示例商城\",\"themeid\":\"2\",\"themepath\":\"kaben\",\"title\":\"Dmall示例商城\",\"descript\":\"Dmall提供优质的电子商务解决方案，提供最好的Java网店系统、Java多用户商城、Java商城定制开发。\",\"siteon\":\"1\",\"adminthemeid\":\"1\"}', 'site_seting');
INSERT INTO `es_settings` VALUES ('2', null, '{\"inventory_warning_count\":\"5\"}', 'inventory');
INSERT INTO `es_settings` VALUES ('3', null, '{\"cancel_order_day\":\"2\",\"rog_order_day\":\"14\",\"comment_order_day\":\"14\",\"cancel_sellback_day\":\"14\"}', 'order');
INSERT INTO `es_settings` VALUES ('4', null, '{\"thumbnail_pic_width\":\"180\",\"small_pic_height\":\"310\",\"big_pic_height\":\"800\",\"tiny_pic_width\":\"60\",\"small_pic_width\":\"310\",\"big_pic_width\":\"800\",\"tiny_pic_height\":\"60\",\"thumbnail_pic_height\":\"180\"}', 'photo');
INSERT INTO `es_settings` VALUES ('5', null, '{\"comment_num\":\"10\",\"register_num_mp\":\"50\",\"comment_img\":\"1\",\"login\":\"1\",\"onlinepay\":\"1\",\"first_comment\":\"1\",\"email_check\":\"1\",\"register_num\":\"50\",\"login_num_mp\":\"5\",\"comment_num_mp\":\"10\",\"buygoods\":\"1\",\"finish_profile_num\":\"20\",\"finish_profile\":\"1\",\"first_comment_num\":\"50\",\"parities_num_mp\":\"0\",\"email_check_num_mp\":\"20\",\"onlinepay_num\":\"10\",\"email_check_num\":\"20\",\"onlinepay_num_mp\":\"10\",\"comment_img_num_mp\":\"30\",\"buygoods_num\":\"1\",\"comment_img_num\":\"30\",\"first_comment_num_mp\":\"50\",\"login_num\":\"5\",\"comment\":\"1\",\"buygoods_num_mp\":\"1\",\"finish_profile_num_mp\":\"20\",\"register\":\"1\"}', 'point');
INSERT INTO `es_settings` VALUES ('6', null, '{\"backend_pagesize\":\"10\",\"default_img_url\":\"http://localhost:8080/statics/images/no_picture.jpg\",\"context_path\":\"\",\"wap_domain\":\"pengqi.51vip.biz\",\"wap_folder\":\"/wap\",\"sms_reg_open\":\"0\",\"lucene\":\"0\",\"global_auth_key\":\"5a7ebe7b4e0c0145e67daa10e8c02a50\",\"test_mode\":\"0\",\"wap_open\":\"1\",\"static_server_path\":\"D:\\\\project\\\\baigu-dmall\\\\dmall\\\\b2c\\\\target\\\\b2c\\\\statics\",\"static_server_domain\":\"http://localhost/statics\",\"static_page_open\":\"0\"}', 'system');

-- ----------------------------
-- Table structure for es_showcase
-- ----------------------------
DROP TABLE IF EXISTS `es_showcase`;
CREATE TABLE `es_showcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `is_display` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_showcase
-- ----------------------------

-- ----------------------------
-- Table structure for es_single_reduction_activity_detail
-- ----------------------------
DROP TABLE IF EXISTS `es_single_reduction_activity_detail`;
CREATE TABLE `es_single_reduction_activity_detail` (
  `detail_id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) DEFAULT NULL,
  `single_reduction_value` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_single_reduction_activity_detail
-- ----------------------------

-- ----------------------------
-- Table structure for es_site
-- ----------------------------
DROP TABLE IF EXISTS `es_site`;
CREATE TABLE `es_site` (
  `siteid` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `themeid` int(11) DEFAULT NULL,
  `sitelevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_site
-- ----------------------------

-- ----------------------------
-- Table structure for es_site_menu
-- ----------------------------
DROP TABLE IF EXISTS `es_site_menu`;
CREATE TABLE `es_site_menu` (
  `menuid` int(8) NOT NULL AUTO_INCREMENT,
  `parentid` int(8) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_site_menu
-- ----------------------------
INSERT INTO `es_site_menu` VALUES ('1', '0', '代理管理', 'agent/agent-index.html', '', '5');
INSERT INTO `es_site_menu` VALUES ('2', '0', '商城首页', 'index.html', '', '1');

-- ----------------------------
-- Table structure for es_sms_platform
-- ----------------------------
DROP TABLE IF EXISTS `es_sms_platform`;
CREATE TABLE `es_sms_platform` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `platform_name` varchar(50) DEFAULT NULL,
  `is_open` int(8) DEFAULT NULL,
  `config` longtext,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_sms_platform
-- ----------------------------

-- ----------------------------
-- Table structure for es_smtp
-- ----------------------------
DROP TABLE IF EXISTS `es_smtp`;
CREATE TABLE `es_smtp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(50) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `last_send_time` bigint(20) DEFAULT NULL,
  `send_count` int(11) DEFAULT '0',
  `max_count` int(11) DEFAULT NULL,
  `mail_from` varchar(255) DEFAULT NULL,
  `port` int(10) DEFAULT '0',
  `open_ssl` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_smtp
-- ----------------------------
INSERT INTO `es_smtp` VALUES ('1', 'smtp.exmail.qq.com', 'service1@dmall.cn', 'baigu752513', '1330404357', '1', '100', 'service1@dmall.cn', '0', '0');
INSERT INTO `es_smtp` VALUES ('2', 'smtp.exmail.qq.com', 'service2@dmall.cn', 'baigu752513', '0', '0', '100', 'service2@dmall.cn', '0', '0');

-- ----------------------------
-- Table structure for es_spec_values
-- ----------------------------
DROP TABLE IF EXISTS `es_spec_values`;
CREATE TABLE `es_spec_values` (
  `spec_value_id` int(8) NOT NULL AUTO_INCREMENT,
  `spec_id` int(8) DEFAULT NULL,
  `spec_value` varchar(100) DEFAULT NULL,
  `spec_image` varchar(255) DEFAULT NULL,
  `spec_order` int(8) DEFAULT NULL,
  `spec_type` int(8) DEFAULT NULL,
  `inherent_or_add` int(8) DEFAULT NULL,
  PRIMARY KEY (`spec_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_spec_values
-- ----------------------------
INSERT INTO `es_spec_values` VALUES ('9', '2', '均码', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('10', '2', 'XXS', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('11', '2', 'XS', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('12', '2', 'S', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('13', '2', 'M', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('14', '2', 'L', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('15', '2', 'XL', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('16', '2', 'XXL', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('17', '2', 'XXXL', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('29', '2', '70B', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('30', '2', '70C', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('31', '2', '70D', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('32', '2', '75B', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('33', '2', '75C', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('34', '2', '75D', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('35', '2', '80C', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('36', '2', '80D', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('37', '2', '80E', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('38', '2', '85C', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('39', '2', '85D', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('40', '2', '85E', 'http://static.v4.javamall.com.cn/spec/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('41', '1', '黄色', 'http://static.v4.javamall.com.cn/spec/201003231752553633.gif', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('42', '1', '绿色', 'http://static.v4.javamall.com.cn/spec/201003231753027271.gif', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('43', '1', '黑色', 'http://static.v4.javamall.com.cn/spec/201003231758466829.gif', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('44', '1', '红色', 'http://static.v4.javamall.com.cn/spec/201003231758540529.gif', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('45', '1', '蓝色', 'http://static.v4.javamall.com.cn/spec/201003231759056186.gif', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('46', '1', '白色', 'http://static.v4.javamall.com.cn/spec/201003231759165477.gif', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('47', '1', '花色', 'http://static.v4.javamall.com.cn/spec/201003231759251588.gif', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('48', '1', '灰色', 'http://static.v4.javamall.com.cn/spec/201003231759361219.gif', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('49', '1', '肤色', 'http://static.v4.javamall.com.cn/spec/201003231752553635.gif', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('50', '1', '粉黄色', 'http://static.v4.javamall.com.cn/spec/201005191140150035.jpg', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('51', '1', '橙色', 'http://static.v4.javamall.com.cn/spec/201005191141088633.jpg', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('52', '1', '浅绿', 'http://static.v4.javamall.com.cn/spec/201005191142251911.jpg', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('53', '1', '浅蓝', 'http://static.v4.javamall.com.cn/spec/201005191143231991.jpg', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('54', '1', '粉红色', 'http://static.v4.javamall.com.cn/spec/201005191144208127.jpg', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('55', '1', '浅玫红', 'http://static.v4.javamall.com.cn/spec/201005191145294591.jpg', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('56', '1', '西瓜红', 'http://static.v4.javamall.com.cn/spec/201005191146439979.jpg', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('57', '1', '粉紫色', 'http://static.v4.javamall.com.cn/spec/201005191147384601.jpg', null, '1', '0');
INSERT INTO `es_spec_values` VALUES ('58', '3', '1GB', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('59', '3', '2GB', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('60', '3', '4GB', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('61', '3', '8GB', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('62', '3', '16GB', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('63', '3', '32GB', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('64', '3', '64GB', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('65', '4', '35', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('66', '4', '35.5', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('67', '4', '36', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('68', '4', '36.5', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('69', '4', '37', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('70', '4', '37.5', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('71', '4', '39.5', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('72', '4', '40', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('73', '4', '41', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('74', '4', '42', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');
INSERT INTO `es_spec_values` VALUES ('75', '4', '43', 'http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif', null, '0', '0');

-- ----------------------------
-- Table structure for es_specification
-- ----------------------------
DROP TABLE IF EXISTS `es_specification`;
CREATE TABLE `es_specification` (
  `spec_id` int(8) NOT NULL AUTO_INCREMENT,
  `spec_name` varchar(50) DEFAULT NULL,
  `spec_show_type` int(8) DEFAULT NULL,
  `spec_type` int(8) DEFAULT NULL,
  `spec_memo` varchar(50) DEFAULT NULL,
  `spec_order` int(8) DEFAULT NULL,
  `disabled` int(8) DEFAULT NULL,
  PRIMARY KEY (`spec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_specification
-- ----------------------------
INSERT INTO `es_specification` VALUES ('1', '颜色', null, '1', 'type_color', null, null);
INSERT INTO `es_specification` VALUES ('2', '尺寸', null, '0', '', null, null);
INSERT INTO `es_specification` VALUES ('3', '容量', null, '0', 'U盘存储容量', null, null);
INSERT INTO `es_specification` VALUES ('4', '选择尺码', null, '0', '', null, null);

-- ----------------------------
-- Table structure for es_store_log
-- ----------------------------
DROP TABLE IF EXISTS `es_store_log`;
CREATE TABLE `es_store_log` (
  `logid` int(10) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT NULL,
  `productid` int(10) DEFAULT NULL,
  `goodsname` varchar(255) DEFAULT NULL,
  `depot_type` int(8) DEFAULT NULL,
  `op_type` int(2) DEFAULT '0',
  `num` int(10) DEFAULT NULL,
  `enable_store` int(10) DEFAULT '0',
  `remark` longtext,
  `dateline` int(10) DEFAULT NULL,
  `userid` int(10) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `depotid` int(10) DEFAULT NULL,
  PRIMARY KEY (`logid`),
  KEY `ind_store_log_goodsid` (`goodsid`,`productid`),
  KEY `ind_store_log_depot` (`op_type`,`depotid`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_store_log
-- ----------------------------
INSERT INTO `es_store_log` VALUES ('1', '1', null, '测试商品', '0', '1', '666', '0', null, '1531736427', '1', 'admin', '1');
INSERT INTO `es_store_log` VALUES ('2', '1', null, '测试商品', '0', '1', '666', '0', null, '1531736427', '1', 'admin', '2');
INSERT INTO `es_store_log` VALUES ('3', '1', null, '测试商品', '0', '1', '666', '0', null, '1531736427', '1', 'admin', '3');
INSERT INTO `es_store_log` VALUES ('9', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153181215988]，减少可用库存', '1531812159', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('10', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153181445985]，减少可用库存', '1531814471', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('11', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153188359010]，减少可用库存', '1531883590', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('12', '1', '1', '测试商品', '0', '1', '0', '-3', '创建订单[153190014661]，减少可用库存', '1531900146', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('13', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153190258997]，减少可用库存', '1531902589', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('14', '1', '1', '测试商品', '0', '1', '0', '-8', '创建订单[153190698374]，减少可用库存', '1531906983', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('15', '1', '1', '测试商品', '0', '1', '0', '-8', '创建订单[153190949060]，减少可用库存', '1531909490', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('16', '1', '1', '测试商品', '0', '1', '0', '-2', '创建订单[153190983087]，减少可用库存', '1531909838', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('17', '1', '1', '测试商品', '0', '1', '0', '-5', '创建订单[153191016149]，减少可用库存', '1531910161', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('18', '1', '1', '测试商品', '0', '1', '0', '-20', '创建订单[153196963819]，减少可用库存', '1531969638', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('26', '1', '1', '测试商品', '0', '1', '0', '-5', '创建订单[153197051641]，减少可用库存', '1531970516', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('27', '1', null, '测试商品', '0', '1', '2999997', '0', null, '1531982311', '1', 'admin', '1');
INSERT INTO `es_store_log` VALUES ('28', '1', null, '测试商品', '0', '1', '2999997', '0', null, '1531982311', '1', 'admin', '2');
INSERT INTO `es_store_log` VALUES ('29', '1', null, '测试商品', '0', '1', '2999997', '0', null, '1531982311', '1', 'admin', '3');
INSERT INTO `es_store_log` VALUES ('30', '1', '1', '测试商品', '0', '1', '0', '-1000', '创建订单[153198300886]，减少可用库存', '1531983008', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('31', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153198353888]，减少可用库存', '1531983539', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('32', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153198368240]，减少可用库存', '1531983682', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('33', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153198375333]，减少可用库存', '1531983753', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('34', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153198380875]，减少可用库存', '1531983808', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('35', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153198388558]，减少可用库存', '1531983885', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('36', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153198401889]，减少可用库存', '1531984018', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('41', '1', '1', '测试商品', '0', '1', '0', '-5', '创建订单[153199432032]，减少可用库存', '1531994320', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('42', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153199474113]，减少可用库存', '1531994741', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('43', '1', '1', '测试商品', '0', '1', '0', '-5', '创建订单[153207849026]，减少可用库存', '1532078490', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('44', '1', '1', '测试商品', '0', '1', '0', '-10', '创建订单[153207852327]，减少可用库存', '1532078523', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('45', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153208257880]，减少可用库存', '1532082579', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('46', '1', '1', '测试商品', '0', '1', '0', '-2', '创建订单[153234002117]，减少可用库存', '1532340021', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('47', '1', '1', '测试商品', '0', '1', '0', '-100998', '创建订单[153234271372]，减少可用库存', '1532342713', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('48', '1', '1', '测试商品', '0', '1', '0', '-92', '创建订单[153240278372]，减少可用库存', '1532402783', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('49', '1', '1', '测试商品', '0', '1', '0', '-5', '创建订单[153240292257]，减少可用库存', '1532402922', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('50', '1', '1', '测试商品', '0', '1', '0', '-11', '创建订单[153241832443]，减少可用库存', '1532418324', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('51', '1', '1', '测试商品', '0', '1', '0', '-2', '创建订单[153241854525]，减少可用库存', '1532418545', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('52', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153241947968]，减少可用库存', '1532419480', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('53', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153248796249]，减少可用库存', '1532487962', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('54', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153248817322]，减少可用库存', '1532488173', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('55', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153248853920]，减少可用库存', '1532488539', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('56', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153248912777]，减少可用库存', '1532489128', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('57', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153248923672]，减少可用库存', '1532489236', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('58', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153249017031]，减少可用库存', '1532490170', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('59', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153249695075]，减少可用库存', '1532496950', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('60', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153249861933]，减少可用库存', '1532498619', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('61', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153250101210]，减少可用库存', '1532501013', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('62', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153250111686]，减少可用库存', '1532501116', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('63', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153250160685]，减少可用库存', '1532501606', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('64', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153250182042]，减少可用库存', '1532501820', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('65', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153250893553]，减少可用库存', '1532508935', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('66', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153250923111]，减少可用库存', '1532509231', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('67', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153250965936]，减少可用库存', '1532509659', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('68', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153250994856]，减少可用库存', '1532509949', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('69', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153251007081]，减少可用库存', '1532510070', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('70', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153251026057]，减少可用库存', '1532510260', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('71', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153251026086]，减少可用库存', '1532510260', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('72', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153251038819]，减少可用库存', '1532510388', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('73', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153251055316]，减少可用库存', '1532510553', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('74', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153251066383]，减少可用库存', '1532510663', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('75', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153251103488]，减少可用库存', '1532511034', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('76', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153251161594]，减少可用库存', '1532511615', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('77', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153251270915]，减少可用库存', '1532512709', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('78', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153251316134]，减少可用库存', '1532513161', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('79', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153251682238]，减少可用库存', '1532516822', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('80', '1', '1', '测试商品', '0', '1', '0', '-17', '创建订单[153258603370]，减少可用库存', '1532586033', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('81', '1', '1', '测试商品', '0', '1', '0', '-1', '创建订单[153258747819]，减少可用库存', '1532587478', '0', '系统', '1');
INSERT INTO `es_store_log` VALUES ('82', '1', '1', '测试商品', '0', '1', '0', '-2897778', '创建订单[153292103939]，减少可用库存', '1532921039', '0', '系统', '1');

-- ----------------------------
-- Table structure for es_style
-- ----------------------------
DROP TABLE IF EXISTS `es_style`;
CREATE TABLE `es_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `is_top_style` int(11) DEFAULT NULL,
  `is_default_style` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_style
-- ----------------------------
INSERT INTO `es_style` VALUES ('1', 'new_storey', '/floorstyle/new_style.html', '1', '1', '1');
INSERT INTO `es_style` VALUES ('2', 'style1', '/floorstyle/style1.html', '0', '1', '1');
INSERT INTO `es_style` VALUES ('3', 'style2', '/floorstyle/style2.html', '0', '0', '1');

-- ----------------------------
-- Table structure for es_subject
-- ----------------------------
DROP TABLE IF EXISTS `es_subject`;
CREATE TABLE `es_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_display` int(11) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `goods_ids` longtext,
  `picture_path` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_subject
-- ----------------------------

-- ----------------------------
-- Table structure for es_tag_rel
-- ----------------------------
DROP TABLE IF EXISTS `es_tag_rel`;
CREATE TABLE `es_tag_rel` (
  `tag_id` int(8) DEFAULT NULL,
  `rel_id` int(8) DEFAULT NULL,
  `ordernum` int(10) DEFAULT NULL,
  KEY `ind_tag_rel_1` (`tag_id`,`rel_id`),
  KEY `ind_tag_rel_2` (`ordernum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_tag_rel
-- ----------------------------
INSERT INTO `es_tag_rel` VALUES ('1', '1', null);

-- ----------------------------
-- Table structure for es_tag_relb
-- ----------------------------
DROP TABLE IF EXISTS `es_tag_relb`;
CREATE TABLE `es_tag_relb` (
  `tag_id` int(8) DEFAULT NULL,
  `rel_id` int(8) DEFAULT NULL,
  `ordernum` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_tag_relb
-- ----------------------------

-- ----------------------------
-- Table structure for es_tags
-- ----------------------------
DROP TABLE IF EXISTS `es_tags`;
CREATE TABLE `es_tags` (
  `tag_id` int(8) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) DEFAULT NULL,
  `rel_count` int(8) DEFAULT NULL,
  `type` int(8) DEFAULT '0',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_tags
-- ----------------------------
INSERT INTO `es_tags` VALUES ('1', '测试', '0', '1');

-- ----------------------------
-- Table structure for es_theme
-- ----------------------------
DROP TABLE IF EXISTS `es_theme`;
CREATE TABLE `es_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) DEFAULT NULL,
  `themename` varchar(50) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `deleteflag` int(6) DEFAULT '0',
  `thumb` varchar(50) DEFAULT NULL,
  `siteid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_theme
-- ----------------------------
INSERT INTO `es_theme` VALUES ('1', null, '模板v1', 'default', null, null, '0', 'preview.png', '0');
INSERT INTO `es_theme` VALUES ('2', null, '模板v2', 'kaben', null, null, '0', 'preview.png', '0');

-- ----------------------------
-- Table structure for es_themeuri
-- ----------------------------
DROP TABLE IF EXISTS `es_themeuri`;
CREATE TABLE `es_themeuri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `themeid` int(11) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `deleteflag` int(6) DEFAULT '0',
  `pagename` varchar(255) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `sitemaptype` int(11) DEFAULT '0',
  `keywords` varchar(255) DEFAULT NULL,
  `description` longtext,
  `httpcache` int(8) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_themeuri
-- ----------------------------
INSERT INTO `es_themeuri` VALUES ('1', null, '/index.jsp', '/index.html', '0', '首页', '0', '0', null, null, '1');
INSERT INTO `es_themeuri` VALUES ('2', null, '/index.html', '/index.html', '0', '首页', '0', '1', null, null, '1');
INSERT INTO `es_themeuri` VALUES ('3', null, '/goods-(\\d+).html', '/goods.html', '0', '商品详情', '0', '0', null, null, '1');
INSERT INTO `es_themeuri` VALUES ('4', null, '/snapshot-(\\d+).html', '/snapshot.html', '0', '商品快照', '0', '0', null, null, '1');
INSERT INTO `es_themeuri` VALUES ('5', null, '/search-(.*).html', '/goods_list.html', '0', '商品搜索', '0', '0', null, null, '1');
INSERT INTO `es_themeuri` VALUES ('6', null, '/help-(\\d+)-(\\d+).html', '/help.html', '0', '帮助', '0', '0', null, null, '1');
INSERT INTO `es_themeuri` VALUES ('7', null, '/(.*)_payment-result.html', '/payment_result.html', '0', ' 支付结果', '0', '0', null, null, '0');
INSERT INTO `es_themeuri` VALUES ('8', null, '/(.*)_payment-wap-result.html', '/payment_wap_result.html', '0', 'app支付结果', '0', '0', null, null, '0');
INSERT INTO `es_themeuri` VALUES ('9', null, '/subject-(\\d+).html', '/subject/subject.html', '0', '专题页面', '0', '0', null, null, '0');
INSERT INTO `es_themeuri` VALUES ('10', null, '/subject-index.html', '/subject/subject-index.html', '0', '专题首页', '0', '0', null, null, '0');

-- ----------------------------
-- Table structure for es_transaction_record
-- ----------------------------
DROP TABLE IF EXISTS `es_transaction_record`;
CREATE TABLE `es_transaction_record` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `goods_num` int(10) DEFAULT NULL,
  `rog_time` bigint(20) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `index_goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_transaction_record
-- ----------------------------

-- ----------------------------
-- Table structure for es_type_brand
-- ----------------------------
DROP TABLE IF EXISTS `es_type_brand`;
CREATE TABLE `es_type_brand` (
  `type_id` int(8) DEFAULT NULL,
  `brand_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_type_brand
-- ----------------------------

-- ----------------------------
-- Table structure for es_type_spec
-- ----------------------------
DROP TABLE IF EXISTS `es_type_spec`;
CREATE TABLE `es_type_spec` (
  `type_id` int(8) DEFAULT NULL,
  `spec_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_type_spec
-- ----------------------------

-- ----------------------------
-- Table structure for es_url_server
-- ----------------------------
DROP TABLE IF EXISTS `es_url_server`;
CREATE TABLE `es_url_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_url_server
-- ----------------------------

-- ----------------------------
-- Table structure for es_user_role
-- ----------------------------
DROP TABLE IF EXISTS `es_user_role`;
CREATE TABLE `es_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_user_role
-- ----------------------------
INSERT INTO `es_user_role` VALUES ('7', '6', '3');
INSERT INTO `es_user_role` VALUES ('16', '2', '2');
INSERT INTO `es_user_role` VALUES ('17', '3', '3');
INSERT INTO `es_user_role` VALUES ('18', '4', '4');
INSERT INTO `es_user_role` VALUES ('19', '5', '5');

-- ----------------------------
-- Table structure for es_warn_num
-- ----------------------------
DROP TABLE IF EXISTS `es_warn_num`;
CREATE TABLE `es_warn_num` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `warn_num` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of es_warn_num
-- ----------------------------

-- ----------------------------
-- Table structure for oem_customer
-- ----------------------------
DROP TABLE IF EXISTS `oem_customer`;
CREATE TABLE `oem_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '公司名',
  `leadername` varchar(100) DEFAULT NULL COMMENT '负责人姓名',
  `phone` varchar(11) NOT NULL COMMENT '负责人手机',
  `address` varchar(255) NOT NULL COMMENT '公司地址',
  `updatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oem_customer
-- ----------------------------
INSERT INTO `oem_customer` VALUES ('1', '深远科技', '张三三', '18153312341', '四川省成都高新区', '2018-07-26 17:24:08');
INSERT INTO `oem_customer` VALUES ('2', '环球1', '张三', '18162278227', '地球', '2018-07-27 16:35:25');
INSERT INTO `oem_customer` VALUES ('3', '环球2', '张三', '18162278227', '地球', '2018-07-27 16:35:26');
INSERT INTO `oem_customer` VALUES ('4', '环球3', '张三', '18162278227', '地球', '2018-07-27 16:35:27');
INSERT INTO `oem_customer` VALUES ('5', '环球4', 'tao xiang', '18161178527', 'on the world', '2018-07-27 16:35:28');
INSERT INTO `oem_customer` VALUES ('7', '环球5', '3', '4', '2', '2018-07-27 16:35:34');
INSERT INTO `oem_customer` VALUES ('8', '环球6', '3', '45', '2', '2018-07-27 16:35:36');
INSERT INTO `oem_customer` VALUES ('9', '环球7', '6', '6', '6', '2018-07-27 16:35:38');

-- ----------------------------
-- Table structure for oem_express
-- ----------------------------
DROP TABLE IF EXISTS `oem_express`;
CREATE TABLE `oem_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expname` varchar(255) NOT NULL COMMENT '快递名',
  `province` varchar(100) DEFAULT NULL,
  `fweight` decimal(10,2) NOT NULL COMMENT '首重',
  `sweight` decimal(10,2) NOT NULL COMMENT '续重',
  `fmoney` decimal(10,2) NOT NULL COMMENT '首重金额',
  `smoney` decimal(10,2) NOT NULL COMMENT '续重金额',
  `updatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oem_express
-- ----------------------------
INSERT INTO `oem_express` VALUES ('1', '顺丰空运', '江西省', '1000.00', '1000.00', '23.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('2', '顺丰陆运', '江西省', '1000.00', '1000.00', '18.00', '5.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('3', '顺丰空运', '吉林省', '1000.00', '1000.00', '23.00', '18.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('4', '顺丰陆运', '吉林省', '1000.00', '1000.00', '18.00', '9.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('5', '顺丰空运', '山东省', '1000.00', '1000.00', '23.00', '13.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('6', '顺丰陆运', '山东省', '1000.00', '1000.00', '18.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('7', 'EMS', null, '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('8', '顺丰空运', '甘肃省', '1000.00', '1000.00', '23.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('9', '顺丰陆运', '甘肃省', '1000.00', '1000.00', '18.00', '5.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('10', '顺丰空运', '广东省', '1000.00', '1000.00', '23.00', '13.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('11', '顺丰陆运', '广东省', '1000.00', '1000.00', '18.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('12', 'EMS', '山西省', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('13', '顺丰空运', '浙江省', '1000.00', '1000.00', '23.00', '13.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('14', '顺丰陆运', '浙江省', '1000.00', '1000.00', '18.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('15', 'EMS', '安徽省', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('16', '圆通快递', null, '1000.00', '1000.00', '5.00', '2.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('17', '中通快递', null, '1000.00', '1000.00', '5.00', '2.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('18', '默认快递', null, '1000.00', '1000.00', '5.00', '2.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('19', '韵达快递', null, '1000.00', '1000.00', '5.00', '2.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('20', '顺丰空运', '河南省', '1000.00', '1000.00', '23.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('21', '顺丰陆运', '河南省', '1000.00', '1000.00', '18.00', '5.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('22', 'EMS', '四川省', '500.00', '500.00', '20.00', '4.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('23', '顺丰空运', '河北省', '1000.00', '1000.00', '23.00', '13.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('24', '顺丰陆运', '河北省', '1000.00', '1000.00', '18.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('25', 'EMS', '湖南省', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('26', '顺丰空运', '安徽省', '1000.00', '1000.00', '23.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('27', '顺丰陆运', '安徽省', '1000.00', '1000.00', '18.00', '5.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('28', '邮政陆运', '西藏自治区', '1000.00', '1000.00', '15.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('29', 'EMS', '陕西省', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('30', 'EMS', '上海市', '500.00', '500.00', '20.00', '9.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('31', 'EMS', '云南省', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('32', '顺丰空运', '青海省', '1000.00', '1000.00', '23.00', '13.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('33', '顺丰陆运', '青海省', '1000.00', '1000.00', '18.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('34', '圆通快递', '内蒙古自治区', '1000.00', '1000.00', '8.00', '3.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('35', '中通快递', '内蒙古自治区', '1000.00', '1000.00', '8.00', '3.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('36', '默认快递', '内蒙古自治区', '1000.00', '1000.00', '8.00', '3.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('37', '韵达快递', '内蒙古自治区', '1000.00', '1000.00', '12.00', '8.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('38', 'EMS', '广西壮族自治区', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('39', '顺丰空运', '广西壮族自治区', '1000.00', '1000.00', '23.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('40', '顺丰陆运', '广西壮族自治区', '1000.00', '1000.00', '18.00', '5.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('41', 'EMS', '湖北省', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('42', 'EMS', '河南省', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('43', 'EMS', '西藏自治区', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('44', '顺丰空运', '重庆市', '1000.00', '1000.00', '15.00', '2.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('45', '顺丰陆运', '重庆市', '1000.00', '1000.00', '14.00', '2.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('46', 'EMS', '吉林省', '500.00', '500.00', '20.00', '17.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('47', 'EMS', '海南省', '500.00', '500.00', '20.00', '9.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('48', '圆通快递', '新疆维吾尔自治区', '1000.00', '1000.00', '12.00', '8.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('49', '中通快递', '新疆维吾尔自治区', '1000.00', '1000.00', '12.00', '8.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('50', '默认快递', '新疆维吾尔自治区', '1000.00', '1000.00', '12.00', '8.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('51', '韵达快递', '新疆维吾尔自治区', '1000.00', '1000.00', '12.00', '8.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('52', 'EMS', '江西省', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('53', 'EMS', '黑龙江省', '500.00', '500.00', '20.00', '17.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('54', 'EMS', '辽宁省', '500.00', '500.00', '20.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('55', '顺丰空运', '西藏自治区', '1000.00', '1000.00', '23.00', '16.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('56', '顺丰陆运', '西藏自治区', '1000.00', '1000.00', '23.00', '16.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('57', 'EMS', '山东省', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('58', 'EMS', '甘肃省', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('59', 'EMS', '内蒙古自治区', '500.00', '500.00', '20.00', '9.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('60', '顺丰空运', '湖北省', '1000.00', '1000.00', '23.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('61', '顺丰陆运', '湖北省', '1000.00', '1000.00', '18.00', '5.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('62', 'EMS', '宁夏回族自治区', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('63', '顺丰空运', '海南省', '1000.00', '1000.00', '23.00', '13.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('64', '顺丰陆运', '海南省', '1000.00', '1000.00', '18.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('65', '顺丰空运', '福建省', '1000.00', '1000.00', '23.00', '13.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('66', '顺丰陆运', '福建省', '1000.00', '1000.00', '18.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('67', '邮政陆运', '新疆维吾尔自治区', '1000.00', '1000.00', '12.00', '8.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('68', '圆通快递', '西藏自治区', '1000.00', '1000.00', '15.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('69', '中通快递', '西藏自治区', '1000.00', '1000.00', '15.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('70', '默认快递', '西藏自治区', '1000.00', '1000.00', '15.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('71', '韵达快递', '西藏自治区', '1000.00', '1000.00', '15.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('72', '顺丰空运', '云南省', '1000.00', '1000.00', '23.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('73', '顺丰陆运', '云南省', '1000.00', '1000.00', '18.00', '5.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('74', '顺丰空运', '北京市', '1000.00', '1000.00', '23.00', '13.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('75', '顺丰陆运', '北京市', '1000.00', '1000.00', '18.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('76', '邮政陆运', null, '1000.00', '1000.00', '5.00', '2.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('77', 'EMS', '北京市', '500.00', '500.00', '20.00', '9.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('78', '顺丰空运', '湖南省', '1000.00', '1000.00', '23.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('79', '顺丰陆运', '湖南省', '1000.00', '1000.00', '18.00', '5.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('80', '顺丰空运', '黑龙江省', '1000.00', '1000.00', '23.00', '18.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('81', '顺丰陆运', '黑龙江省', '1000.00', '1000.00', '18.00', '9.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('82', '顺丰空运', '贵州省', '1000.00', '1000.00', '22.00', '8.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('83', '顺丰陆运', '贵州省', '1000.00', '1000.00', '18.00', '5.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('84', '顺丰空运', '江苏省', '1000.00', '1000.00', '23.00', '13.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('85', '顺丰陆运', '江苏省', '1000.00', '1000.00', '18.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('86', 'EMS', '江苏省', '500.00', '500.00', '20.00', '9.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('87', 'EMS', '贵州省', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('88', 'EMS', '重庆市', '500.00', '500.00', '20.00', '4.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('89', '顺丰空运', '陕西省', '1000.00', '1000.00', '22.00', '8.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('90', '顺丰陆运', '陕西省', '1000.00', '1000.00', '18.00', '5.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('91', 'EMS', '广东省', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('92', 'EMS', '青海省', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('93', '顺丰空运', '宁夏回族自治区', '1000.00', '1000.00', '23.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('94', '顺丰陆运', '宁夏回族自治区', '1000.00', '1000.00', '18.00', '5.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('95', 'EMS', '福建省', '500.00', '500.00', '20.00', '9.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('96', 'EMS', '河北省', '500.00', '500.00', '20.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('97', '顺丰空运', '辽宁省', '1000.00', '1000.00', '23.00', '13.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('98', '顺丰陆运', '辽宁省', '1000.00', '1000.00', '18.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('99', 'EMS', '天津市', '500.00', '500.00', '20.00', '9.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('100', 'EMS', '浙江省', '500.00', '500.00', '20.00', '9.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('101', '顺丰空运', '山西省', '1000.00', '1000.00', '23.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('102', '顺丰陆运', '山西省', '1000.00', '1000.00', '18.00', '5.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('103', '顺丰空运', '四川省', '1000.00', '1000.00', '13.00', '2.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('104', '顺丰陆运', '四川省', '1000.00', '1000.00', '13.00', '2.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('105', 'EMS', '新疆维吾尔自治区', '500.00', '500.00', '20.00', '10.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('106', '顺丰空运', '天津市', '1000.00', '1000.00', '23.00', '13.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('107', '顺丰陆运', '天津市', '1000.00', '1000.00', '18.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('108', '顺丰空运', null, '1000.00', '1000.00', '23.00', '8.00', '2018-07-30 10:24:35');
INSERT INTO `oem_express` VALUES ('109', '顺丰陆运', null, '1000.00', '1000.00', '18.00', '5.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('110', '顺丰空运', '内蒙古自治区', '1000.00', '1000.00', '23.00', '13.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('111', '顺丰陆运', '内蒙古自治区', '1000.00', '1000.00', '18.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('112', '顺丰空运', '新疆维吾尔自治区', '1000.00', '1000.00', '23.00', '18.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('113', '顺丰陆运', '新疆维吾尔自治区', '1000.00', '1000.00', '18.00', '9.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('114', '顺丰空运', '上海市', '1000.00', '1000.00', '23.00', '13.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('115', '顺丰陆运', '上海市', '1000.00', '1000.00', '18.00', '6.00', '2018-07-27 17:39:05');
INSERT INTO `oem_express` VALUES ('116', '邮政陆运', '内蒙古自治区', '1000.00', '1000.00', '8.00', '3.00', '2018-07-27 17:39:05');

-- ----------------------------
-- Table structure for oem_goods
-- ----------------------------
DROP TABLE IF EXISTS `oem_goods`;
CREATE TABLE `oem_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '商品名',
  `code` varchar(10) NOT NULL COMMENT '商品唯一编号',
  `sku` varchar(255) NOT NULL COMMENT '商品规格',
  `weight` decimal(10,2) NOT NULL COMMENT '商品重量,单位克',
  `price` decimal(10,2) NOT NULL COMMENT '商品单价',
  `updatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oem_goods
-- ----------------------------
INSERT INTO `oem_goods` VALUES ('4', '冷吃兔', 'GOODS001', '100g/d', '100.00', '666.00', '2018-07-27 14:12:46');
INSERT INTO `oem_goods` VALUES ('5', '冷吃兔', 'GOODS003', '500g/d', '500.00', '888.00', '2018-07-27 14:13:13');
INSERT INTO `oem_goods` VALUES ('6', '冷吃兔丁', 'GOODS002', '500g/d', '500.00', '100.00', '2018-07-27 14:13:44');
INSERT INTO `oem_goods` VALUES ('7', '招牌牛肉', 'GOODS011', '500g/d', '500.00', '36.00', '2018-07-27 14:14:00');

-- ----------------------------
-- Table structure for oem_order
-- ----------------------------
DROP TABLE IF EXISTS `oem_order`;
CREATE TABLE `oem_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderno` varchar(50) NOT NULL COMMENT '订单号',
  `status` int(11) NOT NULL COMMENT '状态 10，未发货；20，已发货',
  `expname` varchar(255) NOT NULL COMMENT '快递名',
  `freight` decimal(10,2) NOT NULL COMMENT '运费',
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `price` decimal(10,2) NOT NULL COMMENT '订单价格',
  `cneename` varchar(100) NOT NULL COMMENT '收货人姓名',
  `cneephone` varchar(11) NOT NULL COMMENT '收货人手机',
  `cneeprovince` varchar(100) NOT NULL COMMENT '省',
  `cneecity` varchar(100) NOT NULL COMMENT '市',
  `cneedistrict` varchar(100) NOT NULL COMMENT '区',
  `cneeaddr` varchar(1000) NOT NULL COMMENT '收货人地址',
  `updatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderno` (`orderno`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oem_order
-- ----------------------------
INSERT INTO `oem_order` VALUES ('1', '1', '20', '1', '1.00', '1', '1.00', '1', '1', '1', '11', '1', '1', '2018-07-27 13:58:46');
INSERT INTO `oem_order` VALUES ('40', 'ORDER001', '20', '中通快递', '5.00', '1', '1332.00', '张三', '13530316793', '四川省', '绵阳市', '游仙区', '四川省绵阳市游仙区九华山', '2018-07-27 18:37:41');
INSERT INTO `oem_order` VALUES ('41', 'ORDER002', '20', '中通快递', '33.00', '1', '108.00', '李四', '13608655312', '四川省', '成都市', '青羊区', '四川省成都市锦晖西一街布鲁明顿广场', '2018-07-27 18:37:39');
INSERT INTO `oem_order` VALUES ('58', 'ORDER001_GJECMO89', '10', '中通快递', '5.00', '1', '1332.00', '张三', '13530316793', '四川省', '绵阳市', '游仙区', '四川省绵阳市游仙区九华山', '2018-07-30 10:09:24');
INSERT INTO `oem_order` VALUES ('59', 'ORDER002_0C64XEYG', '10', '中通快递', '33.00', '1', '108.00', '李四', '13608655312', '四川省', '成都市', '青羊区', '四川省成都市锦晖西一街布鲁明顿广场', '2018-07-30 10:09:24');
INSERT INTO `oem_order` VALUES ('60', 'ORDER001_EDZCYCVL', '20', '中通快递', '5.00', '1', '1332.00', '张三', '13530316793', '四川省', '绵阳市', '游仙区', '四川省绵阳市游仙区九华山', '2018-07-30 10:17:47');
INSERT INTO `oem_order` VALUES ('61', 'ORDER002_BXQPRHVJ', '20', '中通快递', '33.00', '1', '108.00', '李四', '13608655312', '四川省', '成都市', '青羊区', '四川省成都市锦晖西一街布鲁明顿广场', '2018-07-30 10:17:45');

-- ----------------------------
-- Table structure for oem_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `oem_order_detail`;
CREATE TABLE `oem_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderno` varchar(50) DEFAULT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `num` int(11) NOT NULL COMMENT '商品个数',
  `updatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oem_order_detail
-- ----------------------------
INSERT INTO `oem_order_detail` VALUES ('1', 'ORDER001', '4', '2', '2018-07-27 18:16:15');
INSERT INTO `oem_order_detail` VALUES ('2', 'ORDER001', '6', '1', '2018-07-27 18:16:15');
INSERT INTO `oem_order_detail` VALUES ('3', 'ORDER002', '7', '3', '2018-07-27 18:16:15');
INSERT INTO `oem_order_detail` VALUES ('4', 'ORDER002', '4', '6', '2018-07-27 18:16:15');
INSERT INTO `oem_order_detail` VALUES ('5', 'ORDER002', '5', '6', '2018-07-27 18:16:15');
INSERT INTO `oem_order_detail` VALUES ('6', 'ORDER001', '4', '2', '2018-07-27 18:18:41');
INSERT INTO `oem_order_detail` VALUES ('7', 'ORDER001', '6', '1', '2018-07-27 18:18:41');
INSERT INTO `oem_order_detail` VALUES ('8', 'ORDER002', '7', '3', '2018-07-27 18:18:41');
INSERT INTO `oem_order_detail` VALUES ('9', 'ORDER002', '4', '6', '2018-07-27 18:18:41');
INSERT INTO `oem_order_detail` VALUES ('10', 'ORDER002', '5', '6', '2018-07-27 18:18:41');
INSERT INTO `oem_order_detail` VALUES ('11', 'ORDER001', '4', '2', '2018-07-27 18:21:53');
INSERT INTO `oem_order_detail` VALUES ('12', 'ORDER001', '6', '1', '2018-07-27 18:21:53');
INSERT INTO `oem_order_detail` VALUES ('13', 'ORDER002', '7', '3', '2018-07-27 18:21:53');
INSERT INTO `oem_order_detail` VALUES ('14', 'ORDER002', '4', '6', '2018-07-27 18:21:54');
INSERT INTO `oem_order_detail` VALUES ('15', 'ORDER002', '5', '6', '2018-07-27 18:21:54');
INSERT INTO `oem_order_detail` VALUES ('16', 'ORDER001', '4', '2', '2018-07-27 18:29:42');
INSERT INTO `oem_order_detail` VALUES ('17', 'ORDER001', '6', '1', '2018-07-27 18:29:42');
INSERT INTO `oem_order_detail` VALUES ('18', 'ORDER002', '7', '3', '2018-07-27 18:29:42');
INSERT INTO `oem_order_detail` VALUES ('19', 'ORDER002', '4', '6', '2018-07-27 18:29:42');
INSERT INTO `oem_order_detail` VALUES ('20', 'ORDER002', '5', '6', '2018-07-27 18:29:42');
INSERT INTO `oem_order_detail` VALUES ('21', 'ORDER001', '4', '2', '2018-07-27 18:30:51');
INSERT INTO `oem_order_detail` VALUES ('22', 'ORDER001', '6', '1', '2018-07-27 18:30:51');
INSERT INTO `oem_order_detail` VALUES ('23', 'ORDER002', '7', '3', '2018-07-27 18:30:52');
INSERT INTO `oem_order_detail` VALUES ('24', 'ORDER002', '4', '6', '2018-07-27 18:30:52');
INSERT INTO `oem_order_detail` VALUES ('25', 'ORDER002', '5', '6', '2018-07-27 18:30:52');
INSERT INTO `oem_order_detail` VALUES ('26', 'ORDER001', '4', '2', '2018-07-27 18:31:24');
INSERT INTO `oem_order_detail` VALUES ('27', 'ORDER001', '6', '1', '2018-07-27 18:31:24');
INSERT INTO `oem_order_detail` VALUES ('28', 'ORDER002', '7', '3', '2018-07-27 18:31:24');
INSERT INTO `oem_order_detail` VALUES ('29', 'ORDER002', '4', '6', '2018-07-27 18:31:25');
INSERT INTO `oem_order_detail` VALUES ('30', 'ORDER002', '5', '6', '2018-07-27 18:31:25');
INSERT INTO `oem_order_detail` VALUES ('31', 'ORDER001', '4', '2', '2018-07-27 18:32:04');
INSERT INTO `oem_order_detail` VALUES ('32', 'ORDER001', '6', '1', '2018-07-27 18:32:04');
INSERT INTO `oem_order_detail` VALUES ('33', 'ORDER002', '7', '3', '2018-07-27 18:32:04');
INSERT INTO `oem_order_detail` VALUES ('34', 'ORDER002', '4', '6', '2018-07-27 18:32:04');
INSERT INTO `oem_order_detail` VALUES ('35', 'ORDER002', '5', '6', '2018-07-27 18:32:04');
INSERT INTO `oem_order_detail` VALUES ('36', 'ORDER001', '4', '2', '2018-07-27 18:32:56');
INSERT INTO `oem_order_detail` VALUES ('37', 'ORDER001', '6', '1', '2018-07-27 18:32:56');
INSERT INTO `oem_order_detail` VALUES ('38', 'ORDER002', '7', '3', '2018-07-27 18:32:57');
INSERT INTO `oem_order_detail` VALUES ('39', 'ORDER002', '4', '6', '2018-07-27 18:32:57');
INSERT INTO `oem_order_detail` VALUES ('40', 'ORDER002', '5', '6', '2018-07-27 18:32:57');
INSERT INTO `oem_order_detail` VALUES ('41', 'ORDER001', '4', '2', '2018-07-27 18:34:38');
INSERT INTO `oem_order_detail` VALUES ('42', 'ORDER001', '6', '1', '2018-07-27 18:34:38');
INSERT INTO `oem_order_detail` VALUES ('43', 'ORDER002', '7', '3', '2018-07-27 18:34:38');
INSERT INTO `oem_order_detail` VALUES ('44', 'ORDER002', '4', '6', '2018-07-27 18:34:38');
INSERT INTO `oem_order_detail` VALUES ('45', 'ORDER002', '5', '6', '2018-07-27 18:34:38');
INSERT INTO `oem_order_detail` VALUES ('46', 'ORDER001', '4', '2', '2018-07-27 18:37:45');
INSERT INTO `oem_order_detail` VALUES ('47', 'ORDER001', '6', '1', '2018-07-27 18:37:45');
INSERT INTO `oem_order_detail` VALUES ('48', 'ORDER002', '7', '3', '2018-07-27 18:37:45');
INSERT INTO `oem_order_detail` VALUES ('49', 'ORDER002', '4', '6', '2018-07-27 18:37:45');
INSERT INTO `oem_order_detail` VALUES ('50', 'ORDER002', '5', '6', '2018-07-27 18:37:45');
INSERT INTO `oem_order_detail` VALUES ('51', 'ORDER001_277b12a1-a576-491d-93d0-aa7215ac9174', '4', '2', '2018-07-30 10:07:53');
INSERT INTO `oem_order_detail` VALUES ('52', 'ORDER001_a5492150-8e9e-4f6d-8e38-47876fc5602d', '6', '1', '2018-07-30 10:07:53');
INSERT INTO `oem_order_detail` VALUES ('53', 'ORDER002_8e091624-1a76-4175-acb9-80bc3745366c', '7', '3', '2018-07-30 10:07:53');
INSERT INTO `oem_order_detail` VALUES ('54', 'ORDER002_0e50c231-c5ad-43aa-8b05-58d081aab332', '4', '6', '2018-07-30 10:07:53');
INSERT INTO `oem_order_detail` VALUES ('55', 'ORDER002_25657c84-72db-44bd-9773-5f3042961bd3', '5', '6', '2018-07-30 10:07:53');
INSERT INTO `oem_order_detail` VALUES ('56', 'ORDER001_qEjVF6eq', '4', '2', '2018-07-30 10:08:54');
INSERT INTO `oem_order_detail` VALUES ('57', 'ORDER001_Dm8SXnV6', '6', '1', '2018-07-30 10:08:54');
INSERT INTO `oem_order_detail` VALUES ('58', 'ORDER002_nUZVe6FA', '7', '3', '2018-07-30 10:08:54');
INSERT INTO `oem_order_detail` VALUES ('59', 'ORDER002_DKaTTBSV', '4', '6', '2018-07-30 10:08:54');
INSERT INTO `oem_order_detail` VALUES ('60', 'ORDER002_J7xZ4NFO', '5', '6', '2018-07-30 10:08:54');
INSERT INTO `oem_order_detail` VALUES ('61', 'ORDER001_GJECMO89', '4', '2', '2018-07-30 10:09:24');
INSERT INTO `oem_order_detail` VALUES ('62', 'ORDER001_PDBEF97D', '6', '1', '2018-07-30 10:09:24');
INSERT INTO `oem_order_detail` VALUES ('63', 'ORDER002_0C64XEYG', '7', '3', '2018-07-30 10:09:24');
INSERT INTO `oem_order_detail` VALUES ('64', 'ORDER002_YIW7DMED', '4', '6', '2018-07-30 10:09:24');
INSERT INTO `oem_order_detail` VALUES ('65', 'ORDER002_3ONST4DE', '5', '6', '2018-07-30 10:09:24');
INSERT INTO `oem_order_detail` VALUES ('66', 'ORDER001_EDZCYCVL', '4', '2', '2018-07-30 10:15:04');
INSERT INTO `oem_order_detail` VALUES ('67', 'ORDER001_7N43CHSQ', '6', '1', '2018-07-30 10:15:04');
INSERT INTO `oem_order_detail` VALUES ('68', 'ORDER002_BXQPRHVJ', '7', '3', '2018-07-30 10:15:04');
INSERT INTO `oem_order_detail` VALUES ('69', 'ORDER002_UFVKP4BY', '4', '6', '2018-07-30 10:15:04');
INSERT INTO `oem_order_detail` VALUES ('70', 'ORDER002_DYNZHOZU', '5', '6', '2018-07-30 10:15:04');

-- ----------------------------
-- Table structure for sys_express
-- ----------------------------
DROP TABLE IF EXISTS `sys_express`;
CREATE TABLE `sys_express` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `express_group` varchar(255) NOT NULL DEFAULT '0' COMMENT '所属快递规则组',
  `area_id` varchar(64) DEFAULT NULL COMMENT '区域id',
  `area_name` varchar(64) DEFAULT '' COMMENT '区域名称',
  `express_name` varchar(64) DEFAULT NULL COMMENT '快递名称',
  `expmoney_f` decimal(10,2) DEFAULT NULL COMMENT '首重金额',
  `f_weight` decimal(10,2) DEFAULT NULL COMMENT '首重重量（g）',
  `expmoney_s` decimal(10,2) DEFAULT NULL COMMENT '续重价格',
  `s_weight` decimal(10,2) DEFAULT NULL COMMENT '续重单位重量（g）',
  `service_charge` decimal(10,2) DEFAULT '0.00' COMMENT '发货手续费',
  `is_unidefied` int(20) DEFAULT '1' COMMENT '是否全国统一快递费（1-是 0-否）',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `is_show` int(11) DEFAULT '0' COMMENT '是否显示：0 显示  1不显示',
  `notChoose` varchar(500) DEFAULT NULL COMMENT '不能发此快递的产品ID集合',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` int(1) DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `area_name` (`area_name`,`express_name`,`express_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_express
-- ----------------------------
INSERT INTO `sys_express` VALUES ('0510188adfd348c5bfbd2870459907d2', '2', '360000', '江西省', '顺丰空运', '23.00', '1000.00', '10.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:01', '', '2018-05-28 12:05:01', null, '0');
INSERT INTO `sys_express` VALUES ('0510188adfd348c5bfbd2870459907d2sfly', '8', '360000', '江西省', '顺丰陆运', '18.00', '1000.00', '5.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:01', '', '2018-05-28 12:05:01', null, '0');
INSERT INTO `sys_express` VALUES ('12fbed0d07184efd98ec600d10e6c91e', '2', '220000', '吉林省', '顺丰空运', '23.00', '1000.00', '18.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:01', '', '2018-05-28 12:05:01', null, '0');
INSERT INTO `sys_express` VALUES ('12fbed0d07184efd98ec600d10e6c91esfly', '8', '220000', '吉林省', '顺丰陆运', '18.00', '1000.00', '9.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:01', '', '2018-05-28 12:05:01', null, '0');
INSERT INTO `sys_express` VALUES ('1499bcce4ea34629beba063e782e3785', '2', '370000', '山东省', '顺丰空运', '23.00', '1000.00', '13.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:01', '', '2018-05-28 12:05:01', null, '0');
INSERT INTO `sys_express` VALUES ('1499bcce4ea34629beba063e782e3785sfly', '8', '370000', '山东省', '顺丰陆运', '18.00', '1000.00', '6.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:01', '', '2018-05-28 12:05:01', null, '0');
INSERT INTO `sys_express` VALUES ('176fac4cc2c748c291c1f6c8709144fd', '3', null, null, 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '1', '9', '0', null, '', '2018-05-28 12:05:02', '', '2018-05-28 12:05:02', null, '0');
INSERT INTO `sys_express` VALUES ('18765e06205d4e649b1c27fe995fda2b', '2', '620000', '甘肃省', '顺丰空运', '23.00', '1000.00', '10.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:02', '', '2018-05-28 12:05:02', null, '0');
INSERT INTO `sys_express` VALUES ('18765e06205d4e649b1c27fe995fda2bsfly', '8', '620000', '甘肃省', '顺丰陆运', '18.00', '1000.00', '5.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:02', '', '2018-05-28 12:05:02', null, '0');
INSERT INTO `sys_express` VALUES ('1c3c81d558454b699d33fce1859e6703', '2', '440000', '广东省', '顺丰空运', '23.00', '1000.00', '13.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:02', '', '2018-05-28 12:05:02', null, '0');
INSERT INTO `sys_express` VALUES ('1c3c81d558454b699d33fce1859e6703sfly', '8', '440000', '广东省', '顺丰陆运', '18.00', '1000.00', '6.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:02', '', '2018-05-28 12:05:02', null, '0');
INSERT INTO `sys_express` VALUES ('1c873cc4ff6b480ba8ac6f57ba01f37a', '3', '140000', '山西省', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:02', '', '2018-05-28 12:05:02', null, '0');
INSERT INTO `sys_express` VALUES ('1ca5623778ff452d833b1a98fb6bc15f', '2', '330000', '浙江省', '顺丰空运', '23.00', '1000.00', '13.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:02', '', '2018-05-28 12:05:02', null, '0');
INSERT INTO `sys_express` VALUES ('1ca5623778ff452d833b1a98fb6bc15fsfly', '8', '330000', '浙江省', '顺丰陆运', '18.00', '1000.00', '6.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:03', '', '2018-05-28 12:05:03', null, '0');
INSERT INTO `sys_express` VALUES ('1d58e36d4e25407d9e905b707c44fd76', '3', '340000', '安徽省', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:03', '', '2018-05-28 12:05:03', null, '0');
INSERT INTO `sys_express` VALUES ('20f1e2fffa7140d49d0b78ed6ea568891', '5', null, null, '圆通快递', '5.00', '1000.00', '2.00', '1000.00', '0.00', '1', '2', '0', null, '', '2018-05-28 12:05:03', '', '2018-05-28 12:05:03', '', '0');
INSERT INTO `sys_express` VALUES ('20f1e2fffa7140d49d0b78ed6ea568893', '6', null, null, '中通快递', '5.00', '1000.00', '2.00', '1000.00', '0.00', '1', '4', '0', null, '', '2018-05-28 12:05:03', '', '2018-05-28 12:05:03', '', '0');
INSERT INTO `sys_express` VALUES ('20f1e2fffa7140d49d0b78ed6ea568893_MR', '9', null, null, '默认快递', '5.00', '1000.00', '2.00', '1000.00', '0.00', '1', '4', '0', '', '', '2018-05-28 12:05:03', '', '2018-05-28 12:05:03', '', '0');
INSERT INTO `sys_express` VALUES ('20f1e2fffa7140d49d0b78ed6ea568894', '7', null, null, '韵达快递', '5.00', '1000.00', '2.00', '1000.00', '0.00', '1', '5', '0', null, '', '2018-05-28 12:05:03', '', '2018-05-28 12:05:03', '', '0');
INSERT INTO `sys_express` VALUES ('228e70fdbcad4248bab0d39f7cfd3f2e', '2', '410000', '河南省', '顺丰空运', '23.00', '1000.00', '10.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:04', '', '2018-05-28 12:05:04', null, '0');
INSERT INTO `sys_express` VALUES ('228e70fdbcad4248bab0d39f7cfd3f2esfly', '8', '410000', '河南省', '顺丰陆运', '18.00', '1000.00', '5.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:04', '', '2018-05-28 12:05:04', null, '0');
INSERT INTO `sys_express` VALUES ('2581b4b964994446a9aeea98d2a75944', '3', '510000', '四川省', 'EMS', '20.00', '500.00', '4.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:04', '', '2018-05-28 12:05:04', null, '0');
INSERT INTO `sys_express` VALUES ('2b99bbc40dde422abb4fce7bfd773bc2', '2', '130000', '河北省', '顺丰空运', '23.00', '1000.00', '13.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:04', '', '2018-05-28 12:05:04', null, '0');
INSERT INTO `sys_express` VALUES ('2b99bbc40dde422abb4fce7bfd773bc2sfly', '8', '130000', '河北省', '顺丰陆运', '18.00', '1000.00', '6.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:04', '', '2018-05-28 12:05:04', null, '0');
INSERT INTO `sys_express` VALUES ('2bf6fca868a84417bcacaa74466e2722', '3', '430000', '湖南省', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:04', '', '2018-05-28 12:05:04', null, '0');
INSERT INTO `sys_express` VALUES ('318ab6733e2b4a9280bc77b0c78308dc', '2', '340000', '安徽省', '顺丰空运', '23.00', '1000.00', '10.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:04', '', '2018-05-28 12:05:04', null, '0');
INSERT INTO `sys_express` VALUES ('318ab6733e2b4a9280bc77b0c78308dcsfly', '8', '340000', '安徽省', '顺丰陆运', '18.00', '1000.00', '5.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:05', '', '2018-05-28 12:05:05', null, '0');
INSERT INTO `sys_express` VALUES ('3195484dec254379ba99f8d0fe1df34f', '1', '540000', '西藏自治区', '邮政陆运', '15.00', '1000.00', '10.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:05', '', '2018-05-28 12:05:05', null, '0');
INSERT INTO `sys_express` VALUES ('377279c132ea40efbed8755825bd8a8f', '3', '610000', '陕西省', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:05', '', '2018-05-28 12:05:05', null, '0');
INSERT INTO `sys_express` VALUES ('3b9bf2b2c06e4456909d36357f77cfad', '3', '310000', '上海市', 'EMS', '20.00', '500.00', '9.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:05', '', '2018-05-28 12:05:05', null, '0');
INSERT INTO `sys_express` VALUES ('4582714ced884e548f4f1e28c9c6d00b', '3', '530000', '云南省', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:05', '', '2018-05-28 12:05:05', null, '0');
INSERT INTO `sys_express` VALUES ('471515973cba4e1b9101290dce28eef3', '2', '630000', '青海省', '顺丰空运', '23.00', '1000.00', '13.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:05', '', '2018-05-28 12:05:05', null, '0');
INSERT INTO `sys_express` VALUES ('471515973cba4e1b9101290dce28eef3sfly', '8', '630000', '青海省', '顺丰陆运', '18.00', '1000.00', '6.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:05', '', '2018-05-28 12:05:05', null, '0');
INSERT INTO `sys_express` VALUES ('4b9472aa129b409880dcb345424b72851', '5', '150000', '内蒙古自治区', '圆通快递', '8.00', '1000.00', '3.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:06', '', '2018-05-28 12:05:06', '', '0');
INSERT INTO `sys_express` VALUES ('4b9472aa129b409880dcb345424b72853', '6', '150000', '内蒙古自治区', '中通快递', '8.00', '1000.00', '3.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:06', '', '2018-05-28 12:05:06', '', '0');
INSERT INTO `sys_express` VALUES ('4b9472aa129b409880dcb345424b72853_MR', '9', '150000', '内蒙古自治区', '默认快递', '8.00', '1000.00', '3.00', '1000.00', '0.00', '0', null, '0', '1', '', '2018-05-28 12:05:06', '', '2018-05-28 12:05:06', '', '0');
INSERT INTO `sys_express` VALUES ('4b9472aa129b409880dcb345424b72854', '7', '150000', '内蒙古自治区', '韵达快递', '12.00', '1000.00', '8.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:06', '', '2018-05-28 12:05:06', '', '0');
INSERT INTO `sys_express` VALUES ('4df97d3261ec4315834b633409527d3b', '3', '450000', '广西壮族自治区', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:06', '', '2018-05-28 12:05:06', null, '0');
INSERT INTO `sys_express` VALUES ('502bcac001094444a147edf4b981ee83', '2', '450000', '广西壮族自治区', '顺丰空运', '23.00', '1000.00', '10.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:06', '', '2018-05-28 12:05:06', null, '0');
INSERT INTO `sys_express` VALUES ('502bcac001094444a147edf4b981ee83sfly', '8', '450000', '广西壮族自治区', '顺丰陆运', '18.00', '1000.00', '5.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:07', '', '2018-05-28 12:05:07', null, '0');
INSERT INTO `sys_express` VALUES ('54294642d21849a0bd6ec89d34f7aa52', '3', '420000', '湖北省', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:07', '', '2018-05-28 12:05:07', null, '0');
INSERT INTO `sys_express` VALUES ('5d05bc226f0745aa8e91ffba99429443', '3', '410000', '河南省', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:07', '', '2018-05-28 12:05:07', null, '0');
INSERT INTO `sys_express` VALUES ('5e96cce1e09348bebdfc41174ede4330', '3', '540000', '西藏自治区', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:07', '', '2018-05-28 12:05:07', null, '0');
INSERT INTO `sys_express` VALUES ('614b82179e1b4ab6b4925e6317f578aa', '2', '500000', '重庆市', '顺丰空运', '15.00', '1000.00', '2.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:07', '', '2018-05-28 12:05:07', null, '0');
INSERT INTO `sys_express` VALUES ('614b82179e1b4ab6b4925e6317f578aasfly', '8', '500000', '重庆市', '顺丰陆运', '14.00', '1000.00', '2.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:07', '', '2018-05-28 12:05:07', null, '0');
INSERT INTO `sys_express` VALUES ('62dc539a0b6742a8a224573f36abc77a', '3', '220000', '吉林省', 'EMS', '20.00', '500.00', '17.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:07', '', '2018-05-28 12:05:07', null, '0');
INSERT INTO `sys_express` VALUES ('632d45485dc14184869bf244c60b9ba9', '3', '460000', '海南省', 'EMS', '20.00', '500.00', '9.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:07', '', '2018-05-28 12:05:07', null, '0');
INSERT INTO `sys_express` VALUES ('66b5a265f5f54b18a7d76e2b483fd5091', '5', '650000', '新疆维吾尔自治区', '圆通快递', '12.00', '1000.00', '8.00', '1000.00', '0.00', '0', null, '0', '1', '', '2018-05-28 12:05:08', '', '2018-05-28 12:05:08', '', '0');
INSERT INTO `sys_express` VALUES ('66b5a265f5f54b18a7d76e2b483fd5093', '6', '650000', '新疆维吾尔自治区', '中通快递', '12.00', '1000.00', '8.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:08', '', '2018-05-28 12:05:08', '', '0');
INSERT INTO `sys_express` VALUES ('66b5a265f5f54b18a7d76e2b483fd5093_MR', '9', '650000', '新疆维吾尔自治区', '默认快递', '12.00', '1000.00', '8.00', '1000.00', '0.00', '0', null, '0', '1', '', '2018-05-28 12:05:08', '', '2018-05-28 12:05:08', '', '0');
INSERT INTO `sys_express` VALUES ('66b5a265f5f54b18a7d76e2b483fd5094', '7', '650000', '新疆维吾尔自治区', '韵达快递', '12.00', '1000.00', '8.00', '1000.00', '0.00', '0', null, '0', '1', '', '2018-05-28 12:05:08', '', '2018-05-28 12:05:08', '', '0');
INSERT INTO `sys_express` VALUES ('6b56c414464942d7b2f2dbb7a3c16000', '3', '360000', '江西省', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:08', '', '2018-05-28 12:05:08', null, '0');
INSERT INTO `sys_express` VALUES ('703df0bafa15401dbbadff127cb4a106', '3', '230000', '黑龙江省', 'EMS', '20.00', '500.00', '17.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:09', '', '2018-05-28 12:05:09', null, '0');
INSERT INTO `sys_express` VALUES ('72ee7cec750d4ad18e9c24803f7194c1', '3', '210000', '辽宁省', 'EMS', '20.00', '500.00', '10.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:09', '', '2018-05-28 12:05:09', null, '0');
INSERT INTO `sys_express` VALUES ('74fcde502fe14d698902125132cd3ff2', '2', '540000', '西藏自治区', '顺丰空运', '23.00', '1000.00', '16.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:09', '', '2018-05-28 12:05:09', null, '0');
INSERT INTO `sys_express` VALUES ('74fcde502fe14d698902125132cd3ff2sfly', '8', '540000', '西藏自治区', '顺丰陆运', '23.00', '1000.00', '16.00', '1000.00', '0.00', '0', null, '0', '1', '', '2018-05-28 12:05:09', '', '2018-05-28 12:05:09', null, '0');
INSERT INTO `sys_express` VALUES ('754f08aa0b5345828852b290eb061c3f', '3', '370000', '山东省', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:09', '', '2018-05-28 12:05:09', null, '0');
INSERT INTO `sys_express` VALUES ('812f2fa684454362903e7abeb94d6348', '3', '620000', '甘肃省', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:09', '', '2018-05-28 12:05:09', null, '0');
INSERT INTO `sys_express` VALUES ('82c00e7e913d48619488b29a0c1ee013', '3', '150000', '内蒙古自治区', 'EMS', '20.00', '500.00', '9.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:10', '', '2018-05-28 12:05:10', null, '0');
INSERT INTO `sys_express` VALUES ('844c6619c3fb418bbded74ac8aab80a6', '2', '420000', '湖北省', '顺丰空运', '23.00', '1000.00', '10.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:10', '', '2018-05-28 12:05:10', null, '0');
INSERT INTO `sys_express` VALUES ('844c6619c3fb418bbded74ac8aab80a6sfly', '8', '420000', '湖北省', '顺丰陆运', '18.00', '1000.00', '5.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:10', '', '2018-05-28 12:05:10', null, '0');
INSERT INTO `sys_express` VALUES ('8a319f400f3d4245a6dbb984387bd809', '3', '640000', '宁夏回族自治区', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:10', '', '2018-05-28 12:05:10', null, '0');
INSERT INTO `sys_express` VALUES ('99fa3da39ea84cddb1642ea8ce0b8a16', '2', '460000', '海南省', '顺丰空运', '23.00', '1000.00', '13.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:10', '', '2018-05-28 12:05:10', null, '0');
INSERT INTO `sys_express` VALUES ('99fa3da39ea84cddb1642ea8ce0b8a16sfly', '8', '460000', '海南省', '顺丰陆运', '18.00', '1000.00', '6.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:10', '', '2018-05-28 12:05:10', null, '0');
INSERT INTO `sys_express` VALUES ('9b102fc36dc248dfabfbb6a9153ffeb7', '2', '350000', '福建省', '顺丰空运', '23.00', '1000.00', '13.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:11', '', '2018-05-28 12:05:11', null, '0');
INSERT INTO `sys_express` VALUES ('9b102fc36dc248dfabfbb6a9153ffeb7sfly', '8', '350000', '福建省', '顺丰陆运', '18.00', '1000.00', '6.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:11', '', '2018-05-28 12:05:11', null, '0');
INSERT INTO `sys_express` VALUES ('a18e5fd278744fda93e116b2bb9c8bae', '1', '650000', '新疆维吾尔自治区', '邮政陆运', '12.00', '1000.00', '8.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:11', '', '2018-05-28 12:05:11', null, '0');
INSERT INTO `sys_express` VALUES ('a2e9b28395b341edbe40d15b9a0618941', '5', '540000', '西藏自治区', '圆通快递', '15.00', '1000.00', '10.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:11', '', '2018-05-28 12:05:11', '', '0');
INSERT INTO `sys_express` VALUES ('a2e9b28395b341edbe40d15b9a0618943', '6', '540000', '西藏自治区', '中通快递', '15.00', '1000.00', '10.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:12', '', '2018-05-28 12:05:12', '', '0');
INSERT INTO `sys_express` VALUES ('a2e9b28395b341edbe40d15b9a0618943_MR', '9', '540000', '西藏自治区', '默认快递', '15.00', '1000.00', '10.00', '1000.00', '0.00', '0', null, '0', '1', '', '2018-05-28 12:05:12', '', '2018-05-28 12:05:12', '', '0');
INSERT INTO `sys_express` VALUES ('a2e9b28395b341edbe40d15b9a0618944', '7', '540000', '西藏自治区', '韵达快递', '15.00', '1000.00', '10.00', '1000.00', '0.00', '0', null, '0', '1', '', '2018-05-28 12:05:12', '', '2018-05-28 12:05:12', '', '0');
INSERT INTO `sys_express` VALUES ('a76e9c99ff634d2794e0878b580af1a5', '2', '530000', '云南省', '顺丰空运', '23.00', '1000.00', '10.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:12', '', '2018-05-28 12:05:12', null, '0');
INSERT INTO `sys_express` VALUES ('a76e9c99ff634d2794e0878b580af1a5sfly', '8', '530000', '云南省', '顺丰陆运', '18.00', '1000.00', '5.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:12', '', '2018-05-28 12:05:12', null, '0');
INSERT INTO `sys_express` VALUES ('a8c116e8b2dd47da87f772634b8d867a', '2', '110000', '北京市', '顺丰空运', '23.00', '1000.00', '13.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:12', '', '2018-05-28 12:05:12', null, '0');
INSERT INTO `sys_express` VALUES ('a8c116e8b2dd47da87f772634b8d867asfly', '8', '110000', '北京市', '顺丰陆运', '18.00', '1000.00', '6.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:13', '', '2018-05-28 12:05:13', null, '0');
INSERT INTO `sys_express` VALUES ('aa0fb666e5ee4c9ab3ad6f7b3c1b4771', '1', null, null, '邮政陆运', '5.00', '1000.00', '2.00', '1000.00', '0.00', '1', '7', '0', null, '', '2018-05-28 12:05:13', '', '2018-05-28 12:05:13', null, '0');
INSERT INTO `sys_express` VALUES ('af3e9322e1934203b81d01b9e46af3f4', '3', '110000', '北京市', 'EMS', '20.00', '500.00', '9.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:13', '', '2018-05-28 12:05:13', null, '0');
INSERT INTO `sys_express` VALUES ('b0e37fc33640431f89313fb497ea4fb3', '2', '430000', '湖南省', '顺丰空运', '23.00', '1000.00', '10.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:13', '', '2018-05-28 12:05:13', null, '0');
INSERT INTO `sys_express` VALUES ('b0e37fc33640431f89313fb497ea4fb3sfly', '8', '430000', '湖南省', '顺丰陆运', '18.00', '1000.00', '5.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:13', '', '2018-05-28 12:05:13', null, '0');
INSERT INTO `sys_express` VALUES ('b2ee7323d4804c4d9a1595f052c30cf8', '2', '230000', '黑龙江省', '顺丰空运', '23.00', '1000.00', '18.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:13', '', '2018-05-28 12:05:13', null, '0');
INSERT INTO `sys_express` VALUES ('b2ee7323d4804c4d9a1595f052c30cf8sfly', '8', '230000', '黑龙江省', '顺丰陆运', '18.00', '1000.00', '9.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:13', '', '2018-05-28 12:05:13', null, '0');
INSERT INTO `sys_express` VALUES ('b54676512c084e43af65a78c516ee7d3', '2', '520000', '贵州省', '顺丰空运', '22.00', '1000.00', '8.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:14', '', '2018-05-28 12:05:14', null, '0');
INSERT INTO `sys_express` VALUES ('b54676512c084e43af65a78c516ee7d3sfly', '8', '520000', '贵州省', '顺丰陆运', '18.00', '1000.00', '5.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:14', '', '2018-05-28 12:05:14', null, '0');
INSERT INTO `sys_express` VALUES ('b70b06edee4d4d3d989403d17b0cbd8f', '2', '320000', '江苏省', '顺丰空运', '23.00', '1000.00', '13.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:14', '', '2018-05-28 12:05:14', null, '0');
INSERT INTO `sys_express` VALUES ('b70b06edee4d4d3d989403d17b0cbd8fsfly', '8', '320000', '江苏省', '顺丰陆运', '18.00', '1000.00', '6.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:14', '', '2018-05-28 12:05:14', null, '0');
INSERT INTO `sys_express` VALUES ('bbd5aee0dc054fc49cdbb031f4965856', '3', '320000', '江苏省', 'EMS', '20.00', '500.00', '9.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:14', '', '2018-05-28 12:05:14', null, '0');
INSERT INTO `sys_express` VALUES ('bcd90bbe61b14b3e8d50d1fe2ffa73ce', '3', '520000', '贵州省', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:14', '', '2018-05-28 12:05:14', null, '0');
INSERT INTO `sys_express` VALUES ('bfacdd9b74e247088755483322dfe352', '3', '500000', '重庆市', 'EMS', '20.00', '500.00', '4.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:14', '', '2018-05-28 12:05:14', null, '0');
INSERT INTO `sys_express` VALUES ('c1e82399a3f149c1b31404a6e08a5a0d', '2', '610000', '陕西省', '顺丰空运', '22.00', '1000.00', '8.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:15', '', '2018-05-28 12:05:15', null, '0');
INSERT INTO `sys_express` VALUES ('c1e82399a3f149c1b31404a6e08a5a0dsfly', '8', '610000', '陕西省', '顺丰陆运', '18.00', '1000.00', '5.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:15', '', '2018-05-28 12:05:15', null, '0');
INSERT INTO `sys_express` VALUES ('c4e8b7705d764fb89692c723d8cd1fd0', '3', '440000', '广东省', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:15', '', '2018-05-28 12:05:15', null, '0');
INSERT INTO `sys_express` VALUES ('cd325caf92de4c0d9eb4438fda87eece', '3', '630000', '青海省', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:15', '', '2018-05-28 12:05:15', null, '0');
INSERT INTO `sys_express` VALUES ('d5c25a6800744a6682bbcd53526ddd4b', '2', '640000', '宁夏回族自治区', '顺丰空运', '23.00', '1000.00', '10.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:15', '', '2018-05-28 12:05:15', null, '0');
INSERT INTO `sys_express` VALUES ('d5c25a6800744a6682bbcd53526ddd4bsfly', '8', '640000', '宁夏回族自治区', '顺丰陆运', '18.00', '1000.00', '5.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:15', '', '2018-05-28 12:05:15', null, '0');
INSERT INTO `sys_express` VALUES ('d74a751cfb834e8abe7263647c0bd891', '3', '350000', '福建省', 'EMS', '20.00', '500.00', '9.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:15', '', '2018-05-28 12:05:15', null, '0');
INSERT INTO `sys_express` VALUES ('d79c8338301646148e9ea27ec53608de', '3', '130000', '河北省', 'EMS', '20.00', '500.00', '6.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:16', '', '2018-05-28 12:05:16', null, '0');
INSERT INTO `sys_express` VALUES ('da123ed2e97f416d8a6f7df2693dff79', '2', '210000', '辽宁省', '顺丰空运', '23.00', '1000.00', '13.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:16', '', '2018-05-28 12:05:16', null, '0');
INSERT INTO `sys_express` VALUES ('da123ed2e97f416d8a6f7df2693dff79sfly', '8', '210000', '辽宁省', '顺丰陆运', '18.00', '1000.00', '6.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:16', '', '2018-05-28 12:05:16', null, '0');
INSERT INTO `sys_express` VALUES ('da1b27567ca24fb88b35a1661dfc96e0', '3', '120000', '天津市', 'EMS', '20.00', '500.00', '9.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:16', '', '2018-05-28 12:05:16', null, '0');
INSERT INTO `sys_express` VALUES ('ec55c7c323fe42cd95d743a14725d405', '3', '330000', '浙江省', 'EMS', '20.00', '500.00', '9.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:16', '', '2018-05-28 12:05:16', null, '0');
INSERT INTO `sys_express` VALUES ('ecca5931242f47f79b11a143020dacef', '2', '140000', '山西省', '顺丰空运', '23.00', '1000.00', '10.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:16', '', '2018-05-28 12:05:16', null, '0');
INSERT INTO `sys_express` VALUES ('ecca5931242f47f79b11a143020dacefsfly', '8', '140000', '山西省', '顺丰陆运', '18.00', '1000.00', '5.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:16', '', '2018-05-28 12:05:16', null, '0');
INSERT INTO `sys_express` VALUES ('f0ed6e253172414f9adce7e8b55dfad1', '2', '510000', '四川省', '顺丰空运', '13.00', '1000.00', '2.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:17', '', '2018-05-28 12:05:17', null, '0');
INSERT INTO `sys_express` VALUES ('f0ed6e253172414f9adce7e8b55dfad1sfly', '8', '510000', '四川省', '顺丰陆运', '13.00', '1000.00', '2.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:17', '', '2018-05-28 12:05:17', null, '0');
INSERT INTO `sys_express` VALUES ('f3915ac2f1434a16a0947c1418f09a7c', '3', '650000', '新疆维吾尔自治区', 'EMS', '20.00', '500.00', '10.00', '500.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:17', '', '2018-05-28 12:05:17', null, '0');
INSERT INTO `sys_express` VALUES ('f78e353205e747b4921320e3826b8115', '2', '120000', '天津市', '顺丰空运', '23.00', '1000.00', '13.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:17', '', '2018-05-28 12:05:17', null, '0');
INSERT INTO `sys_express` VALUES ('f78e353205e747b4921320e3826b8115sfly', '8', '120000', '天津市', '顺丰陆运', '18.00', '1000.00', '6.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:17', '', '2018-05-28 12:05:17', null, '0');
INSERT INTO `sys_express` VALUES ('f86c20c2129a4fb3b4250cd5b4e7f36e', '2', null, null, '顺丰空运', '23.00', '1000.00', '8.00', '1000.00', '0.00', '1', '8', '0', null, '', '2018-05-28 12:05:17', '', '2018-05-28 12:05:17', null, '0');
INSERT INTO `sys_express` VALUES ('f86c20c2129a4fb3b4250cd5b4e7f36esfly', '8', null, null, '顺丰陆运', '18.00', '1000.00', '5.00', '1000.00', '0.00', '1', '8', '0', null, '', '2018-05-28 12:05:17', '', '2018-05-28 12:05:17', null, '0');
INSERT INTO `sys_express` VALUES ('f9d74377948c411e9f4e2798766ba661', '2', '150000', '内蒙古自治区', '顺丰空运', '23.00', '1000.00', '13.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:18', '', '2018-05-28 12:05:18', null, '0');
INSERT INTO `sys_express` VALUES ('f9d74377948c411e9f4e2798766ba661sfly', '8', '150000', '内蒙古自治区', '顺丰陆运', '18.00', '1000.00', '6.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:18', '', '2018-05-28 12:05:18', null, '0');
INSERT INTO `sys_express` VALUES ('fcb13597f230492ebc4ca1d0c4e90bee', '2', '650000', '新疆维吾尔自治区', '顺丰空运', '23.00', '1000.00', '18.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:18', '', '2018-05-28 12:05:18', null, '0');
INSERT INTO `sys_express` VALUES ('fcb13597f230492ebc4ca1d0c4e90beesfly', '8', '650000', '新疆维吾尔自治区', '顺丰陆运', '18.00', '1000.00', '9.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:18', '', '2018-05-28 12:05:18', null, '0');
INSERT INTO `sys_express` VALUES ('fe4c88f1011c4b48ac7f763aeda9eb2b', '2', '310000', '上海市', '顺丰空运', '23.00', '1000.00', '13.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:18', '', '2018-05-28 12:05:18', null, '0');
INSERT INTO `sys_express` VALUES ('fe4c88f1011c4b48ac7f763aeda9eb2bsfly', '8', '310000', '上海市', '顺丰陆运', '18.00', '1000.00', '6.00', '1000.00', '0.00', '0', null, '0', null, '', '2018-05-28 12:05:18', '', '2018-05-28 12:05:18', null, '0');
INSERT INTO `sys_express` VALUES ('ff4e9cf33e5749568db7dfe725cf4d66', '1', '150000', '内蒙古自治区', '邮政陆运', '8.00', '1000.00', '3.00', '1000.00', '0.00', '0', null, '0', '1', '', '2018-05-28 12:05:18', '', '2018-05-28 12:05:18', null, '0');
