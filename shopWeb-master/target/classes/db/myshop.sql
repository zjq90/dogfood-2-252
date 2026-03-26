/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50537
Source Host           : localhost:3306
Source Database       : myshop

Target Server Type    : MYSQL
Target Server Version : 50537
File Encoding         : 65001

Date: 2024-03-24
Description: 电商商城系统数据库脚本，包含管理员、用户、商品、订单、订单项等表结构及初始化数据
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- 数据库初始化
-- ----------------------------
DROP DATABASE IF EXISTS `myshop`;
CREATE DATABASE IF NOT EXISTS `myshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `myshop`;

-- ----------------------------
-- Table structure for zk_admin 管理员表
-- ----------------------------
DROP TABLE IF EXISTS `zk_admin`;
CREATE TABLE `zk_admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(255) DEFAULT NULL COMMENT '管理员用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- ----------------------------
-- Records of zk_admin 管理员初始数据
-- ----------------------------
INSERT INTO `zk_admin` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for zk_user 用户表
-- ----------------------------
DROP TABLE IF EXISTS `zk_user`;
CREATE TABLE `zk_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `addr` varchar(255) DEFAULT NULL COMMENT '收货地址',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of zk_user 用户初始数据
-- ----------------------------
INSERT INTO `zk_user` VALUES ('1', 'user', 'user', '普通用户', 'user@shop.com', '13800138001', '北京市朝阳区');
INSERT INTO `zk_user` VALUES ('2', 'zhangsan', '123456', '张三', 'zhangsan@example.com', '13800138002', '上海市浦东新区');
INSERT INTO `zk_user` VALUES ('3', 'lisi', '123456', '李四', 'lisi@example.com', '13800138003', '广州市天河区');
INSERT INTO `zk_user` VALUES ('4', 'test', 'test', '测试用户', 'test@test.com', '13800138000', '北京市');

-- ----------------------------
-- Table structure for zk_product 商品表
-- ----------------------------
DROP TABLE IF EXISTS `zk_product`;
CREATE TABLE `zk_product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `pname` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `sprice` double(10,2) DEFAULT NULL COMMENT '销售价格',
  `cprice` double(10,2) DEFAULT NULL COMMENT '成本价格',
  `pic` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `pdesc` varchar(500) DEFAULT NULL COMMENT '商品描述',
  `is_hot` tinyint(1) DEFAULT NULL COMMENT '是否热门推荐：1是 0否',
  `pdate` datetime DEFAULT NULL COMMENT '上架时间',
  `number` int(11) DEFAULT NULL COMMENT '库存数量',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

-- ----------------------------
-- Records of zk_product 商品初始数据
-- ----------------------------
INSERT INTO `zk_product` VALUES ('1', '苹果手机', '6999.00', '5999.00', '1.jpg', '最新款苹果手机，性能强劲，拍照效果出色', '1', NOW(), '100');
INSERT INTO `zk_product` VALUES ('2', '华为手机', '4999.00', '3999.00', '2.jpg', '华为旗舰手机，拍照出色，续航能力强', '1', NOW(), '100');
INSERT INTO `zk_product` VALUES ('3', '小米手机', '2999.00', '2499.00', '3.jpg', '小米手机，性价比之王，功能齐全', '0', NOW(), '100');
INSERT INTO `zk_product` VALUES ('4', '联想笔记本', '5999.00', '4999.00', '4.jpg', '联想商务笔记本，轻薄便携，办公首选', '0', NOW(), '50');
INSERT INTO `zk_product` VALUES ('5', '戴尔笔记本', '6999.00', '5999.00', '5.jpg', '戴尔游戏笔记本，性能强劲，游戏必备', '1', NOW(), '50');
INSERT INTO `zk_product` VALUES ('6', '惠普打印机', '1299.00', '999.00', '6.jpg', '惠普激光打印机，打印清晰，速度快', '0', NOW(), '30');
INSERT INTO `zk_product` VALUES ('7', '罗技鼠标', '199.00', '129.00', '7.jpg', '罗技无线鼠标，手感舒适，定位准确', '1', NOW(), '200');
INSERT INTO `zk_product` VALUES ('8', '雷蛇键盘', '499.00', '399.00', '8.jpg', '雷蛇机械键盘，RGB背光，游戏神器', '0', NOW(), '100');
INSERT INTO `zk_product` VALUES ('9', '索尼耳机', '899.00', '699.00', '9.jpg', '索尼降噪耳机，音质出色，佩戴舒适', '1', NOW(), '80');
INSERT INTO `zk_product` VALUES ('10', '三星显示器', '1599.00', '1299.00', '10.jpg', '三星曲面显示器，视野宽广，色彩鲜艳', '0', NOW(), '40');
INSERT INTO `zk_product` VALUES ('11', '耐克运动鞋', '599.00', '399.00', '11.jpg', '耐克运动鞋，轻便透气，舒适耐穿', '1', NOW(), '150');
INSERT INTO `zk_product` VALUES ('12', '阿迪达斯T恤', '299.00', '199.00', '12.JPG', '阿迪达斯运动T恤，时尚休闲，舒适透气', '0', NOW(), '200');
INSERT INTO `zk_product` VALUES ('13', '小米手环', '199.00', '129.00', '13.jpg', '小米智能手环，心率监测，运动追踪', '1', NOW(), '300');
INSERT INTO `zk_product` VALUES ('14', '华为手表', '1299.00', '999.00', '14.jpg', '华为智能手表，多功能，续航持久', '0', NOW(), '60');
INSERT INTO `zk_product` VALUES ('15', 'iPad平板', '3299.00', '2899.00', '15.jpg', '苹果iPad，轻薄便携，娱乐办公两相宜', '1', NOW(), '70');

-- ----------------------------
-- Table structure for zk_forder 订单表
-- ----------------------------
DROP TABLE IF EXISTS `zk_forder`;
CREATE TABLE `zk_forder` (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `name` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `remark` varchar(200) DEFAULT NULL COMMENT '订单备注',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `total` double(10,2) DEFAULT NULL COMMENT '订单总金额',
  `post` varchar(20) DEFAULT NULL COMMENT '邮编',
  `address` varchar(200) DEFAULT NULL COMMENT '收货地址',
  `status` int(11) DEFAULT '0' COMMENT '订单状态：0未支付 1已支付 2已发货 3已完成 4已取消',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`fid`),
  KEY `fk_forder_user` (`uid`),
  CONSTRAINT `fk_forder_user` FOREIGN KEY (`uid`) REFERENCES `zk_user` (`uid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- ----------------------------
-- Records of zk_forder 订单初始数据
-- ----------------------------
INSERT INTO `zk_forder` VALUES ('10001', '张三', '13800138002', '请尽快发货', NOW(), '7198.00', '100001', '上海市浦东新区', '1', '2');
INSERT INTO `zk_forder` VALUES ('10002', '李四', '13800138003', '工作日配送', NOW(), '6999.00', '510000', '广州市天河区', '2', '3');

-- ----------------------------
-- Table structure for zk_sorder 订单项表（订单明细）
-- ----------------------------
DROP TABLE IF EXISTS `zk_sorder`;
CREATE TABLE `zk_sorder` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单项ID',
  `name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `price` double(10,2) DEFAULT NULL COMMENT '购买价格',
  `number` int(11) DEFAULT NULL COMMENT '购买数量',
  `fid` int(11) DEFAULT NULL COMMENT '订单ID',
  `pid` int(11) DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`sid`),
  KEY `fk_sorder_forder` (`fid`),
  KEY `fk_sorder_product` (`pid`),
  CONSTRAINT `fk_sorder_forder` FOREIGN KEY (`fid`) REFERENCES `zk_forder` (`fid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sorder_product` FOREIGN KEY (`pid`) REFERENCES `zk_product` (`pid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='订单项表';

-- ----------------------------
-- Records of zk_sorder 订单项初始数据
-- ----------------------------
INSERT INTO `zk_sorder` VALUES ('1', '苹果手机', '6999.00', '1', '10002', '1');
INSERT INTO `zk_sorder` VALUES ('2', '华为手机', '4999.00', '1', '10001', '2');
INSERT INTO `zk_sorder` VALUES ('3', '罗技鼠标', '199.00', '1', '10001', '7');

-- ----------------------------
-- 索引优化
-- ----------------------------
CREATE INDEX `idx_product_is_hot` ON `zk_product`(`is_hot`);
CREATE INDEX `idx_product_pdate` ON `zk_product`(`pdate`);
CREATE INDEX `idx_forder_uid` ON `zk_forder`(`uid`);
CREATE INDEX `idx_forder_status` ON `zk_forder`(`status`);
CREATE INDEX `idx_sorder_fid` ON `zk_sorder`(`fid`);
CREATE INDEX `idx_sorder_pid` ON `zk_sorder`(`pid`);

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- 脚本执行完成
-- ----------------------------