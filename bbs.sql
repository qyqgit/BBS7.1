/*
Navicat MySQL Data Transfer

Source Server         : test1
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-04-28 14:03:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(1) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `invalid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'Admin', '202cb962ac59075b964b07152d234b70', '2018-08-28 16:40:39', '0');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `userId` int(11) unsigned zerofill DEFAULT NULL,
  `url` varchar(511) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for `media`
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` int(1) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `userId` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` tinyint(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `invalid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `replyId` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `text` varchar(1536) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pageId` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `floorNumber` int(1) NOT NULL,
  `haveRead` tinyint(1) NOT NULL DEFAULT '0',
  `invalid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  KEY `pageId` (`pageId`) USING BTREE,
  KEY `message_ibfk_3` (`replyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('0507090e-7517-443a-8f51-5ff7150d3807', null, '2019-04-23 12:43:57', '72652883-9943-4ee4-a7b0-262960335e66', '<p>落脚点卢<span style=\"color:#ff0000\">萨卡法律所<span><span></span></span></span></p>', '4ff66a05-ca81-49d3-82da-4fa849e59f82', '2', '0', '0');
INSERT INTO `message` VALUES ('137a48dd-2fbf-4b31-85c2-3bca4eb8bdd5', null, '2019-04-20 16:42:27', '72652883-9943-4ee4-a7b0-262960335e66', '', '5680d6f0-4509-41ae-9088-68a066b914b2', '1', '0', '0');
INSERT INTO `message` VALUES ('14650ace-e4aa-455d-b612-8228670255a7', null, '2019-04-22 15:41:18', '905dc88b-21c4-48bf-9428-15af06b22c6a', '明天有面试', '64d9e067-efd5-4a75-86ac-8434780b9daa', '5', '0', '0');
INSERT INTO `message` VALUES ('17dcb65e-0115-4f44-9681-344116277bac', null, '2019-04-23 12:44:44', '72652883-9943-4ee4-a7b0-262960335e66', '<p><span style=\"color:#92d050\">涵盖v不能不</span><span style=\"background-color: rgb(255, 0, 0);\"><span style=\"color:#ffff00\">法国</span><span style=\"color: rgb(0, 176, 80);\"><span style=\"color: rgb(255, 255, 0);\"></span></span></span></p>', '4ff66a05-ca81-49d3-82da-4fa849e59f82', '3', '0', '0');
INSERT INTO `message` VALUES ('40bc9c71-25f3-4df9-9809-cbcbbd6f045a', null, '2019-04-22 15:50:04', '905dc88b-21c4-48bf-9428-15af06b22c6a', '拿好公交卡', '64d9e067-efd5-4a75-86ac-8434780b9daa', '6', '0', '0');
INSERT INTO `message` VALUES ('44701249-6739-4efb-b755-d13711242169', null, '2019-04-18 17:49:14', 'c5847375-6a6d-41b3-862e-bc3c7239efc6', '防盗锁琐琐碎碎琐琐碎碎', '1740d9ec-8c24-4fe2-addc-bc1ae9da03a0', '2', '0', '0');
INSERT INTO `message` VALUES ('456b2c26-6fbd-42e0-ac72-6c5b98b3c3ff', null, '2019-04-20 16:45:58', '72652883-9943-4ee4-a7b0-262960335e66', '第三', '64d9e067-efd5-4a75-86ac-8434780b9daa', '4', '0', '0');
INSERT INTO `message` VALUES ('51275422-d36b-4c4e-9eb5-7d2854d0fe18', null, '2019-04-22 19:12:08', '905dc88b-21c4-48bf-9428-15af06b22c6a', '<p><br/><img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/></p>', 'bd11a48a-210e-41e9-8234-78357be32948', '1', '0', '0');
INSERT INTO `message` VALUES ('57f45b73-d2df-4f1b-81f5-d3fa9d1e431e', null, '2019-04-25 18:27:18', '905dc88b-21c4-48bf-9428-15af06b22c6a', '', '290b7ccb-4bbc-4750-b068-c5349386c1c4', '3', '0', '0');
INSERT INTO `message` VALUES ('62d43228-f7b4-48e6-8bf2-212d8914abe5', null, '2019-04-23 17:41:34', '905dc88b-21c4-48bf-9428-15af06b22c6a', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0004.gif\"/></p>', 'f3e7bf97-f26a-4f4a-a551-627dfe8fd930', '13', '0', '0');
INSERT INTO `message` VALUES ('63763f15-ef5c-4899-a8e8-9509cf37141c', null, '2019-04-22 15:52:02', '905dc88b-21c4-48bf-9428-15af06b22c6a', '明天有面试', '93538bb9-f30a-4808-bedb-7b6e7bd21ee4', '1', '0', '0');
INSERT INTO `message` VALUES ('6e1ce822-8050-4e36-86ee-3ace12aa5f53', null, '2019-04-22 19:12:14', '905dc88b-21c4-48bf-9428-15af06b22c6a', '<p><br/><img src=\"http://img.baidu.com/hi/jx2/j_0004.gif\"/></p>', 'bd11a48a-210e-41e9-8234-78357be32948', '2', '0', '0');
INSERT INTO `message` VALUES ('76f7bebf-9a77-43f9-be22-96adb3f5c7dd', null, '2019-04-23 17:48:05', '905dc88b-21c4-48bf-9428-15af06b22c6a', '<p><img src=\"http://localhost:8080/bbs2.1/sys/utf8-jsp/jsp/upload/20190423/24791556012873747.PNG\" style=\"\"/></p><p><img src=\"http://localhost:8080/bbs2.1/sys/utf8-jsp/jsp/upload/20190423/88211556012877253.PNG\" style=\"\"/></p><p><br/></p>', 'f3e7bf97-f26a-4f4a-a551-627dfe8fd930', '14', '0', '0');
INSERT INTO `message` VALUES ('8004d2c2-f2e8-41d3-b184-05fab973f394', null, '2019-04-20 16:29:21', '72652883-9943-4ee4-a7b0-262960335e66', 'dddddddddddddd', '10f90cef-0434-4af3-b8f3-7d22431b8e6b', '1', '0', '0');
INSERT INTO `message` VALUES ('84e577aa-0d19-4173-8b79-47b64d172bc4', null, '2019-04-25 18:27:14', '905dc88b-21c4-48bf-9428-15af06b22c6a', '', '290b7ccb-4bbc-4750-b068-c5349386c1c4', '1', '0', '0');
INSERT INTO `message` VALUES ('8b7e6e05-0f94-4782-8620-5cc49636ced8', null, '2019-04-23 17:39:00', '905dc88b-21c4-48bf-9428-15af06b22c6a', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0004.gif\"/></p>', '4ff66a05-ca81-49d3-82da-4fa849e59f82', '4', '0', '0');
INSERT INTO `message` VALUES ('93b85b11-79d2-4347-a339-d6c4b267190b', null, '2019-04-18 17:49:03', 'c5847375-6a6d-41b3-862e-bc3c7239efc6', 'vvvvvvvvvvvv', '1740d9ec-8c24-4fe2-addc-bc1ae9da03a0', '1', '0', '0');
INSERT INTO `message` VALUES ('9edd8a23-11da-4d82-bf43-0360e3a588d6', null, '2019-04-20 16:45:52', '72652883-9943-4ee4-a7b0-262960335e66', '', '64d9e067-efd5-4a75-86ac-8434780b9daa', '1', '0', '0');
INSERT INTO `message` VALUES ('a007edea-e0ef-4161-a117-eff27a81c0f7', null, '2019-04-18 17:47:03', 'c5847375-6a6d-41b3-862e-bc3c7239efc6', 'vvvvvvvvvvvv', '1740d9ec-8c24-4fe2-addc-bc1ae9da03a0', '1', '0', '0');
INSERT INTO `message` VALUES ('ad0ae2f3-ccc7-4a50-affe-be34a5e6e2cc', null, '2019-04-25 18:27:20', '905dc88b-21c4-48bf-9428-15af06b22c6a', '', '290b7ccb-4bbc-4750-b068-c5349386c1c4', '4', '0', '0');
INSERT INTO `message` VALUES ('bc8de1e5-6281-4dc1-83bd-f1872e66f3c0', null, '2019-04-22 19:22:58', '72652883-9943-4ee4-a7b0-262960335e66', '<p><strong>官方讽刺广告词<em>分寸感法国从法国官</em></strong>方给过错方给<img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/></p>', '4ff66a05-ca81-49d3-82da-4fa849e59f82', '1', '0', '0');
INSERT INTO `message` VALUES ('bf0bd27b-2f16-44f0-86e2-765f97ee5815', null, '2019-04-25 18:27:16', '905dc88b-21c4-48bf-9428-15af06b22c6a', '', '290b7ccb-4bbc-4750-b068-c5349386c1c4', '2', '0', '0');
INSERT INTO `message` VALUES ('d71100eb-04ad-41db-8f2b-94581d94df7c', null, '2019-04-22 19:11:47', '905dc88b-21c4-48bf-9428-15af06b22c6a', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/></p>', '80fbe492-f400-4232-8c73-94e7acc9bae1', '1', '0', '0');
INSERT INTO `message` VALUES ('d7a35d9e-6e2d-46a2-a5ec-c2533a04da48', null, '2019-04-20 16:45:54', '72652883-9943-4ee4-a7b0-262960335e66', '', '64d9e067-efd5-4a75-86ac-8434780b9daa', '3', '0', '0');
INSERT INTO `message` VALUES ('e76176eb-2730-4511-a69f-e71d97981a2d', null, '2019-04-20 16:45:53', '72652883-9943-4ee4-a7b0-262960335e66', '', '64d9e067-efd5-4a75-86ac-8434780b9daa', '2', '0', '0');
INSERT INTO `message` VALUES ('ea6bd710-a664-41f0-b45c-d617523a275c', null, '2019-04-18 17:47:25', 'c5847375-6a6d-41b3-862e-bc3c7239efc6', 'vvvvvvvvvvvv', '1740d9ec-8c24-4fe2-addc-bc1ae9da03a0', '1', '0', '0');
INSERT INTO `message` VALUES ('f6c606de-897b-48a6-afd8-89e059e78d90', null, '2019-04-18 17:49:19', 'c5847375-6a6d-41b3-862e-bc3c7239efc6', '大赛分非凡非凡非凡非凡方法', '1740d9ec-8c24-4fe2-addc-bc1ae9da03a0', '3', '0', '0');
INSERT INTO `message` VALUES ('fd234314-368a-4870-9c64-7773bf6da401', null, '2019-04-22 15:02:45', '905dc88b-21c4-48bf-9428-15af06b22c6a', '明天有面试', '99347b7e-3f24-4671-a834-8f0593bce204', '1', '0', '0');

-- ----------------------------
-- Table structure for `mypage`
-- ----------------------------
DROP TABLE IF EXISTS `mypage`;
CREATE TABLE `mypage` (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` varchar(767) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `userId` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `timeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `messageNumber` int(1) unsigned NOT NULL DEFAULT '0',
  `invalid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mypage
-- ----------------------------
INSERT INTO `mypage` VALUES ('03ca9c1b-d156-49ea-bb2d-c5b350b2eda5', '你是个猪头', '2019-04-18 15:57:46', '哈哈哈哈哈哈', '2d1d4b25-e690-4bc0-b41f-cd710f9ea5fa', '2019-04-18 15:57:46', '0', '0');
INSERT INTO `mypage` VALUES ('0c793988-c021-4d4a-b8b7-af57048f8ec2', '', '2019-04-22 18:41:04', '', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-22 18:41:04', '0', '0');
INSERT INTO `mypage` VALUES ('0dbf2ed7-e965-446f-915f-6d60b3f243d8', '今天是星期三', '2019-04-17 17:48:30', '', '2bd0c304-3b33-40f5-87c7-5081f69c79bf', '2019-04-18 14:26:57', '3', '0');
INSERT INTO `mypage` VALUES ('0f1bb053-211e-4486-864e-6409ea23f481', '今天是星期三', '2019-04-20 16:47:03', '', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-20 16:47:03', '0', '0');
INSERT INTO `mypage` VALUES ('10f90cef-0434-4af3-b8f3-7d22431b8e6b', 'ddddddddddddddd', '2019-04-20 16:29:17', 'dddddd', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-20 16:29:21', '1', '0');
INSERT INTO `mypage` VALUES ('1740d9ec-8c24-4fe2-addc-bc1ae9da03a0', 'vvvvvvvvvvvvvv', '2019-04-18 17:46:36', '', 'c5847375-6a6d-41b3-862e-bc3c7239efc6', '2019-04-18 17:49:19', '3', '0');
INSERT INTO `mypage` VALUES ('290b7ccb-4bbc-4750-b068-c5349386c1c4', '今天是星期三', '2019-04-25 18:27:07', '', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-25 18:27:20', '4', '0');
INSERT INTO `mypage` VALUES ('337c7af1-f80f-4948-b5c6-e4f42707858d', 'bbbbbbbbbbb', '2019-04-18 16:37:55', 'bbbbbbbbbb', '52049734-282a-4635-b848-6116486bb005', '2019-04-18 16:38:03', '2', '0');
INSERT INTO `mypage` VALUES ('4539f44f-a534-4fbe-a5ca-89833ed7c304', '', '2019-04-22 19:00:16', '', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-22 19:00:16', '0', '0');
INSERT INTO `mypage` VALUES ('4ff66a05-ca81-49d3-82da-4fa849e59f82', '今天是星期三', '2019-04-22 18:44:51', '<p>非凡非凡方法</p>', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-23 17:39:00', '4', '0');
INSERT INTO `mypage` VALUES ('5680d6f0-4509-41ae-9088-68a066b914b2', 'xxxxxxxx', '2019-04-17 17:23:22', 'xxxxxxxxxxx', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-20 16:42:27', '1', '0');
INSERT INTO `mypage` VALUES ('56a1c829-133e-48dc-b8a0-28e29eeb7599', '今天是个好天气', '2019-04-16 18:20:51', '你是谁', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-16 18:20:51', '0', '0');
INSERT INTO `mypage` VALUES ('5bcc4a3a-12cd-4e96-85d2-43b6c4f15eba', 'fffffffffffffffffffff', '2019-04-22 18:33:41', '<p>ffffffffffffff</p>', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-22 18:33:41', '0', '0');
INSERT INTO `mypage` VALUES ('5fa961ba-a096-4546-b5d8-c7b423b2ffb1', '555', '2019-04-18 16:24:33', '555', 'c5847375-6a6d-41b3-862e-bc3c7239efc6', '2019-04-18 16:24:51', '3', '0');
INSERT INTO `mypage` VALUES ('64d9e067-efd5-4a75-86ac-8434780b9daa', '弹道弹道弹道dddd', '2019-04-20 16:45:48', 'xxxxxxxxxxx', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-22 15:50:04', '6', '0');
INSERT INTO `mypage` VALUES ('6bfd704e-746c-4a3f-b620-0fd118854ba2', 'f', '2019-04-22 18:41:13', '<p>f</p>', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-22 18:41:13', '0', '0');
INSERT INTO `mypage` VALUES ('6c506ebc-4e53-44b8-a562-07f41c853902', '', '2019-04-20 16:42:35', '', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-20 16:42:35', '0', '0');
INSERT INTO `mypage` VALUES ('6f0c2f49-4a0a-4e70-b9df-9486354cb77b', '开垦开垦开垦开垦开垦开垦坎坎坷坷', '2019-04-22 19:01:01', '<p>开垦开垦开垦开垦开垦开垦开垦开垦坎坎坷</p>', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-22 19:01:01', '0', '0');
INSERT INTO `mypage` VALUES ('7508e51b-6522-4532-a891-a2d859a2dc78', 'xxxxxxxx', '2019-04-17 17:19:17', 'xxxxxxxxxxx', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-17 17:19:17', '0', '0');
INSERT INTO `mypage` VALUES ('7592b0fc-0476-478a-8aac-decedc943475', '你是个猪头', '2019-04-18 15:57:53', '哈哈哈哈哈哈', '2d1d4b25-e690-4bc0-b41f-cd710f9ea5fa', '2019-04-18 15:57:53', '0', '0');
INSERT INTO `mypage` VALUES ('76065d53-2286-45c0-9781-cab039360864', '今天是星期三', '2019-04-20 16:47:02', '', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-20 16:47:02', '0', '0');
INSERT INTO `mypage` VALUES ('78529652-7aa1-4509-a376-e740589853f6', '今天是星期三', '2019-04-22 19:03:04', '<p><em>奋斗规范</em></p>', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-22 19:03:04', '0', '0');
INSERT INTO `mypage` VALUES ('7b7311ed-0f44-495a-afc6-61757a5a808a', '小学校', '2019-04-18 16:06:49', '小学校', 'afc4b792-716d-42fd-8304-697f1b7d6ad5', '2019-04-18 16:06:49', '0', '0');
INSERT INTO `mypage` VALUES ('7d312fac-6e94-475e-9e74-ffa061490e96', '今天是星期三', '2019-04-22 19:03:22', '<p><a href=\"http://undefined\" style=\"font-family: &quot;Microsoft YaHei&quot;; font-size: medium; white-space: normal; text-decoration-line: none;\">你是谁</a></p>', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-22 19:03:22', '0', '0');
INSERT INTO `mypage` VALUES ('80fbe492-f400-4232-8c73-94e7acc9bae1', '今天是星期三', '2019-04-22 19:06:16', '<ol><li><p><img src=\"http://localhost:8080/bbs2.1/sys/utf8-jsp/jsp/upload/20190422/87341555931161725.PNG\"/></p></li></ol>', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-22 19:11:47', '1', '0');
INSERT INTO `mypage` VALUES ('839ce0f7-ca58-4cdf-8520-64c15c0be5bc', '今天是星期三', '2019-04-17 17:48:22', '', '2bd0c304-3b33-40f5-87c7-5081f69c79bf', '2019-04-17 17:48:22', '0', '0');
INSERT INTO `mypage` VALUES ('8b8ab03e-8d86-4566-b31f-195b871eb5f0', 'xxxxxxxxxxx', '2019-04-18 16:27:05', 'xxxxxxxxxx', 'c5847375-6a6d-41b3-862e-bc3c7239efc6', '2019-04-18 16:27:05', '0', '0');
INSERT INTO `mypage` VALUES ('93538bb9-f30a-4808-bedb-7b6e7bd21ee4', '今天是星期三', '2019-04-17 17:38:01', '明天有面试', '2bd0c304-3b33-40f5-87c7-5081f69c79bf', '2019-04-22 15:52:02', '1', '0');
INSERT INTO `mypage` VALUES ('99347b7e-3f24-4671-a834-8f0593bce204', '弹道弹道弹道dddd', '2019-04-22 15:02:41', '', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-22 15:02:45', '1', '0');
INSERT INTO `mypage` VALUES ('a067bcf1-b392-43a7-ba4e-170e2ae56360', '你就是头 猪', '2019-04-16 21:06:33', '你知道吗', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-18 17:31:55', '3', '0');
INSERT INTO `mypage` VALUES ('a2b4438a-d708-435c-ac3d-8b40c4fe1dab', '', '2019-04-20 16:42:17', '', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-20 16:42:17', '0', '0');
INSERT INTO `mypage` VALUES ('a45ecf60-529c-4c3e-ae8d-f1d40a70f8b5', '今天是星期三', '2019-04-22 18:43:40', '<p>不</p>', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-22 18:43:40', '0', '0');
INSERT INTO `mypage` VALUES ('a4a9e941-2def-4c64-9dd6-1126ba4bb50b', '今天是星期三', '2019-04-17 17:48:26', '', '2bd0c304-3b33-40f5-87c7-5081f69c79bf', '2019-04-17 17:48:26', '0', '0');
INSERT INTO `mypage` VALUES ('a5729897-629f-4ce2-a6d6-5d8096671e3b', '今天是星期三', '2019-04-23 17:45:18', '<p><embed type=\"application/x-shockwave-flash\" class=\"edui-faked-video\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"http://player.youku.com/player.php/sid/XNDE0Nzk2ODE4MA==/v.swf\" width=\"420\" height=\"280\" style=\"float:none\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" allowscriptaccess=\"never\" allowfullscreen=\"true\"/></p>', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-23 17:45:18', '0', '0');
INSERT INTO `mypage` VALUES ('a5d7c7b6-7b3b-4ccf-aca8-3bdbc51e5d05', '', '2019-04-20 16:45:02', '', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-20 16:45:02', '0', '0');
INSERT INTO `mypage` VALUES ('b489c17a-b7b4-4bdc-bed5-10ddda93545d', '你是个猪头', '2019-04-18 16:00:05', '哈哈哈哈哈哈', '2d1d4b25-e690-4bc0-b41f-cd710f9ea5fa', '2019-04-18 16:00:05', '0', '0');
INSERT INTO `mypage` VALUES ('b82bf1d6-0994-4891-adba-09f7cdaeb43a', '你是个猪头', '2019-04-18 15:57:19', '哈哈哈哈哈哈', '2d1d4b25-e690-4bc0-b41f-cd710f9ea5fa', '2019-04-18 15:59:56', '3', '0');
INSERT INTO `mypage` VALUES ('bd11a48a-210e-41e9-8234-78357be32948', '开垦开垦开垦开垦开垦开垦坎坎坷坷', '2019-04-22 19:12:03', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/></p>', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-22 19:12:14', '2', '0');
INSERT INTO `mypage` VALUES ('bf06703a-6f82-46e6-8acf-113bc33b99e0', '小学校', '2019-04-18 16:06:53', '小学校', 'afc4b792-716d-42fd-8304-697f1b7d6ad5', '2019-04-18 16:06:53', '0', '0');
INSERT INTO `mypage` VALUES ('c610c85f-b9ee-45cb-afe4-100b64d26c4d', 'vvvvvvvvvvvvvv', '2019-04-22 14:15:44', 'xxxxxxx', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-22 14:15:44', '0', '0');
INSERT INTO `mypage` VALUES ('c83d03b0-cb4e-4b47-8f7a-b6191fd4664b', '你是谁', '2019-04-16 18:21:30', '死对方', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-16 18:21:30', '0', '0');
INSERT INTO `mypage` VALUES ('cf0a9092-8025-4a3c-abac-0919d7624188', '今天是星期三', '2019-04-18 17:37:32', '', 'c5847375-6a6d-41b3-862e-bc3c7239efc6', '2019-04-18 17:37:32', '0', '0');
INSERT INTO `mypage` VALUES ('cfad5bc5-855f-4ba2-88cf-740f7c1e9036', '', '2019-04-20 16:45:06', '', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-20 16:45:06', '0', '0');
INSERT INTO `mypage` VALUES ('d44caa70-7865-4457-b7c9-2c92e817a89a', '今天是 星期2', '2019-04-16 21:04:14', '天气很好', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-16 21:04:14', '0', '0');
INSERT INTO `mypage` VALUES ('dd6baab1-ef96-429a-a4f8-99e7b75d9084', 'jjjjjjjjjjjjjjjjjj', '2019-04-20 16:45:14', 'jjjjjjjjjjjjjjjjj', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-20 16:45:14', '0', '0');
INSERT INTO `mypage` VALUES ('e0eb4bdc-733b-44b6-9d8b-6990c51e9c59', '今天是星期三', '2019-04-18 17:46:29', '', 'c5847375-6a6d-41b3-862e-bc3c7239efc6', '2019-04-18 17:46:29', '0', '0');
INSERT INTO `mypage` VALUES ('e672f468-e458-4ec9-b6ec-46653b62d9e1', '今天是星期三', '2019-04-22 19:04:23', '<p>&lt;script type=&quot;text/javascript&quot; alert(&quot;s&quot;);&gt;&lt;/script&gt;</p>', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-22 19:04:23', '0', '0');
INSERT INTO `mypage` VALUES ('ea505b6f-b87e-46b0-a22a-456eab0d7c59', '今天是星期三', '2019-04-22 18:33:53', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/></p>', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-22 18:33:53', '0', '0');
INSERT INTO `mypage` VALUES ('f105b1bd-1d94-460b-84a1-715cc3fb469c', '', '2019-04-20 16:46:12', '', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-20 16:46:12', '0', '0');
INSERT INTO `mypage` VALUES ('f3e7bf97-f26a-4f4a-a551-627dfe8fd930', 'mmmmmmmm', '2019-04-18 16:50:30', 'mmmmmmmmmmmmmmmm', '9a4ad532-c3b7-4650-9460-6e287ff76d6b', '2019-04-23 17:48:05', '14', '0');
INSERT INTO `mypage` VALUES ('f504091c-5bb6-4f49-9577-e130f5a24aef', '今天是星期三', '2019-04-18 17:41:05', '', 'c5847375-6a6d-41b3-862e-bc3c7239efc6', '2019-04-18 17:42:01', '4', '0');
INSERT INTO `mypage` VALUES ('fa415ccd-5d47-4681-99e7-bdb8ee0b3b7c', '11111111111111', '2019-04-22 18:47:12', '<p>1111111111111</p>', '905dc88b-21c4-48bf-9428-15af06b22c6a', '2019-04-22 18:47:12', '0', '0');
INSERT INTO `mypage` VALUES ('fbcbe170-fb54-4d61-9a81-effaa2452618', 'ddddddddddd', '2019-04-20 16:42:42', 'ddddddddddddd', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-20 16:42:42', '0', '0');
INSERT INTO `mypage` VALUES ('ffc3f14f-23cb-4067-b6c5-4361070f31ce', '', '2019-04-20 16:41:47', '', '72652883-9943-4ee4-a7b0-262960335e66', '2019-04-20 16:41:47', '0', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `invalid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2bd0c304-3b33-40f5-87c7-5081f69c79bf', '小明', '202cb962ac59075b964b07152d234b70', null, '2', '2019-04-17 17:37:46', '0');
INSERT INTO `user` VALUES ('2d1d4b25-e690-4bc0-b41f-cd710f9ea5fa', '大东', '47bce5c74f589f4867dbd57e9ca9f808', null, '2', '2019-04-18 15:56:53', '0');
INSERT INTO `user` VALUES ('32e782bf-ac9c-4c8a-ab64-c271e72b9b25', 'dsfsd', '33e78d60bc1f9dcc7291c891e6f069e4', '2018-08-08', '2', '2019-04-14 17:47:23', '0');
INSERT INTO `user` VALUES ('3d05533a-808d-4d4c-89c8-df8cbe221a13', '内', '696d29e0940a4957748fe3fc9efd22a3', '2018-08-03', '0', '2019-04-23 13:36:55', '0');
INSERT INTO `user` VALUES ('5158e9ec-1082-4a1a-9e1d-82d8e02ee2ca', 'xxx', 'ba248c985ace94863880921d8900c53f', '2018-08-08', '2', '2019-04-14 16:24:09', '0');
INSERT INTO `user` VALUES ('52049734-282a-4635-b848-6116486bb005', 'xxxx', 'ea416ed0759d46a8de58f63a59077499', null, '2', '2019-04-18 16:37:38', '0');
INSERT INTO `user` VALUES ('72652883-9943-4ee4-a7b0-262960335e66', 'dd', '1aabac6d068eef6a7bad3fdf50a05cc8', null, '2', '2019-04-14 15:53:04', '0');
INSERT INTO `user` VALUES ('76e3ce6a-8bf1-42ec-9ad3-2e5240592633', '打响', '698d51a19d8a121ce581499d7b701668', null, '2', '2019-04-14 17:50:18', '0');
INSERT INTO `user` VALUES ('7c0f4a3b-75fd-47f5-82bd-4829c307eb34', '大赛分', '698d51a19d8a121ce581499d7b701668', null, '2', '2019-04-14 16:24:23', '0');
INSERT INTO `user` VALUES ('905dc88b-21c4-48bf-9428-15af06b22c6a', '音乐', 'c4ca4238a0b923820dcc509a6f75849b', '2018-08-11', '2', '2019-04-22 15:02:26', '0');
INSERT INTO `user` VALUES ('9a4ad532-c3b7-4650-9460-6e287ff76d6b', 'mmm', 'c4efd5020cb49b9d3257ffa0fbccc0ae', null, '2', '2019-04-18 16:50:20', '0');
INSERT INTO `user` VALUES ('afc4b792-716d-42fd-8304-697f1b7d6ad5', '111', '698d51a19d8a121ce581499d7b701668', null, '2', '2019-04-18 16:06:21', '0');
INSERT INTO `user` VALUES ('b2a7586b-a896-4083-a282-53502db9b370', 'xxx', '8277e0910d750195b448797616e091ad', '2018-08-08', '2', '2019-04-14 15:47:56', '0');
INSERT INTO `user` VALUES ('ba26652d-aa09-41cf-9bd2-964ab909ad17', '大赛分发', '698d51a19d8a121ce581499d7b701668', null, '2', '2019-04-18 16:01:08', '0');
INSERT INTO `user` VALUES ('c5847375-6a6d-41b3-862e-bc3c7239efc6', '555', '15de21c670ae7c3f6f3f1f37029303c9', null, '2', '2019-04-18 16:24:24', '0');
