/*
Navicat MySQL Data Transfer

Source Server         : aliserver
Source Server Version : 50531
Source Host           : 120.25.237.244:3306
Source Database       : graduation

Target Server Type    : MYSQL
Target Server Version : 50531
File Encoding         : 65001

Date: 2016-01-15 19:17:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_group
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `gid` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gid`),
  UNIQUE KEY `name` USING BTREE (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_paper
-- ----------------------------
DROP TABLE IF EXISTS `t_paper`;
CREATE TABLE `t_paper` (
  `pid` int(5) NOT NULL AUTO_INCREMENT,
  `tid` int(5) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  `state` int(5) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FK_Reference_4` (`tid`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`tid`) REFERENCES `t_teacher` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_paperscore
-- ----------------------------
DROP TABLE IF EXISTS `t_paperscore`;
CREATE TABLE `t_paperscore` (
  `psid` int(5) NOT NULL AUTO_INCREMENT,
  `pid` int(5) DEFAULT NULL,
  `tid` int(5) DEFAULT NULL,
  `score` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`psid`),
  KEY `FK_Reference_8` (`tid`),
  KEY `FK_Reference_7` (`pid`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`pid`) REFERENCES `t_paper` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`tid`) REFERENCES `t_teacher` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_paperstudent
-- ----------------------------
DROP TABLE IF EXISTS `t_paperstudent`;
CREATE TABLE `t_paperstudent` (
  `psid` int(10) NOT NULL AUTO_INCREMENT,
  `sid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `sdid` int(5) NOT NULL,
  `score` double(10,2) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`psid`),
  KEY `sid` (`sid`),
  KEY `sdid` (`sdid`),
  CONSTRAINT `sdid` FOREIGN KEY (`sdid`) REFERENCES `t_sysdate` (`sdid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sid` FOREIGN KEY (`sid`) REFERENCES `t_student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `rid` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `sid` int(5) NOT NULL AUTO_INCREMENT,
  `tid` int(5) DEFAULT NULL,
  `gid` int(5) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `QQ` varchar(255) DEFAULT NULL,
  `classname` varchar(255) DEFAULT NULL,
  `dept` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pid` int(10) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `account` USING BTREE (`account`),
  KEY `FK_Reference_6` (`gid`),
  KEY `FK_Reference_1` (`tid`),
  KEY `pid` (`pid`),
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `t_paper` (`pid`) ON DELETE SET NULL,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`tid`) REFERENCES `t_teacher` (`tid`) ON DELETE SET NULL,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`gid`) REFERENCES `t_group` (`gid`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_student_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_student_grade`;
CREATE TABLE `t_student_grade` (
  `sgid` int(5) NOT NULL AUTO_INCREMENT,
  `tid` int(5) DEFAULT NULL,
  `psid` int(5) DEFAULT NULL,
  `score` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`sgid`),
  KEY `psid` (`psid`),
  KEY `FK_Reference_10` (`tid`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`tid`) REFERENCES `t_teacher` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_student_grade_ibfk_1` FOREIGN KEY (`psid`) REFERENCES `t_paperstudent` (`psid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_suggestion
-- ----------------------------
DROP TABLE IF EXISTS `t_suggestion`;
CREATE TABLE `t_suggestion` (
  `ssid` int(5) NOT NULL AUTO_INCREMENT,
  `tid` int(5) DEFAULT NULL,
  `sid` int(5) DEFAULT NULL,
  `content` text,
  `create_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ssid`),
  KEY `FK_Reference_3` (`sid`),
  KEY `FK_Reference_2` (`tid`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`tid`) REFERENCES `t_teacher` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`sid`) REFERENCES `t_student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sysdate
-- ----------------------------
DROP TABLE IF EXISTS `t_sysdate`;
CREATE TABLE `t_sysdate` (
  `sdid` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `begin_time` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sdid`)
) ENGINE=InnoDB AUTO_INCREMENT=1100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `tid` int(5) NOT NULL AUTO_INCREMENT,
  `gid` int(5) DEFAULT NULL,
  `rid` int(5) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `professional` varchar(255) DEFAULT NULL,
  `dept` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  UNIQUE KEY `account` USING BTREE (`account`),
  KEY `FK_Reference_5` (`gid`),
  KEY `FK_Reference_12` (`rid`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`rid`) REFERENCES `t_role` (`rid`) ON DELETE SET NULL,
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`gid`) REFERENCES `t_group` (`gid`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=1035 DEFAULT CHARSET=utf8;

INSERT INTO `t_role`(rid,name) VALUES (1,'管理员');
INSERT INTO `t_teacher`(tid,rid,account,password,name) VALUES (1,1,'1001','1001','李丹');
