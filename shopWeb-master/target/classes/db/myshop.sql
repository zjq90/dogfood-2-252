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
 Description: 商城系统数据库初始化脚本
 Author: shop
 Version: 1.0

 数据库表说明:
 - zk_admin: 管理员表，存储后台管理员信息
 - zk_user: 用户表，存储前台用户信息
 - zk_product: 商品表，存储商品基本信息
 - zk_forder: 订单主表，存储订单基本信息
 - zk_sorder: 订单明细表，存储订单中的商品明细
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- =====================================================
-- 表名: zk_admin
-- 描述: 管理员信息表
-- 功能: 存储后台管理员的登录账号和密码
-- =====================================================
DROP TABLE IF EXISTS `zk_admin`;
CREATE TABLE `zk_admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID，主键自增',
  `username` varchar(255) DEFAULT NULL COMMENT '管理员用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- ----------------------------
-- 管理员初始数据
-- 默认账号: admin / admin
-- ----------------------------
INSERT INTO `zk_admin` VALUES ('1', 'admin', 'admin');

-- =====================================================
-- 表名: zk_user
-- 描述: 用户信息表
-- 功能: 存储前台用户的注册信息
-- =====================================================
DROP TABLE IF EXISTS `zk_user`;
CREATE TABLE `zk_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID，主键自增',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名，登录账号',
  `password` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `addr` varchar(255) DEFAULT NULL COMMENT '收货地址',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- 用户示例数据
-- 测试账号: user / user
-- ----------------------------
INSERT INTO `zk_user` VALUES ('1', 'user', 'user', '普通用户', 'user@test.com', '13800000001', '北京市朝阳区');
INSERT INTO `zk_user` VALUES ('4', 'test', 'test', '测试用户', 'test@test.com', '13800138000', '北京市海淀区');

-- =====================================================
-- 表名: zk_product
-- 描述: 商品信息表
-- 功能: 存储商品的基本信息，包括名称、价格、库存等
-- =====================================================
DROP TABLE IF EXISTS `zk_product`;
CREATE TABLE `zk_product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID，主键自增',
  `pname` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `sprice` double(10,2) DEFAULT NULL COMMENT '市场价（原价）',
  `cprice` double(10,2) DEFAULT NULL COMMENT '销售价（现价）',
  `pic` varchar(255) DEFAULT NULL COMMENT '商品图片路径',
  `pdesc` varchar(500) DEFAULT NULL COMMENT '商品描述',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否热门商品：0-否，1-是',
  `pdate` datetime DEFAULT NULL COMMENT '商品上架时间',
  `number` int(11) DEFAULT '0' COMMENT '库存数量',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

-- ----------------------------
-- 商品示例数据
-- 包含手机、电脑等热门商品
-- ----------------------------
INSERT INTO `zk_product` VALUES ('1', '苹果iPhone 15 Pro', '8999.00', '7999.00', NULL, '最新款苹果手机，A17 Pro芯片，钛金属设计，性能强劲，拍照出色', '1', NOW(), '100');
INSERT INTO `zk_product` VALUES ('2', '华为Mate 60 Pro', '6999.00', '5999.00', NULL, '华为旗舰手机，麒麟9000S芯片，卫星通信，拍照出色', '1', NOW(), '100');
INSERT INTO `zk_product` VALUES ('3', '小米14 Pro', '4999.00', '4499.00', NULL, '小米旗舰手机，骁龙8 Gen3处理器，徕卡影像，性价比之王', '0', NOW(), '150');
INSERT INTO `zk_product` VALUES ('4', '联想ThinkPad X1', '9999.00', '8999.00', NULL, '联想商务笔记本，轻薄便携，性能稳定，商务办公首选', '0', NOW(), '50');
INSERT INTO `zk_product` VALUES ('5', '戴尔XPS 15', '12999.00', '11999.00', NULL, '戴尔高端笔记本，4K OLED屏幕，游戏办公两不误', '1', NOW(), '30');
INSERT INTO `zk_product` VALUES ('6', 'OPPO Find X6 Pro', '5999.00', '5499.00', NULL, 'OPPO旗舰手机，哈苏影像系统，暗光拍摄出色', '1', NOW(), '80');
INSERT INTO `zk_product` VALUES ('7', 'vivo X100 Pro', '5499.00', '4999.00', NULL, 'vivo旗舰手机，蔡司影像系统，人像拍摄专家', '0', NOW(), '60');
INSERT INTO `zk_product` VALUES ('8', 'MacBook Pro 14', '14999.00', '13999.00', NULL, '苹果笔记本，M3 Pro芯片，专业创作利器', '1', NOW(), '40');
INSERT INTO `zk_product` VALUES ('9', 'iPad Pro 12.9', '8999.00', '8499.00', NULL, '苹果平板电脑，M2芯片，专业绘图设计', '0', NOW(), '70');
INSERT INTO `zk_product` VALUES ('10', 'AirPods Pro 2', '1899.00', '1699.00', NULL, '苹果无线耳机，主动降噪，空间音频', '1', NOW(), '200');

-- =====================================================
-- 表名: zk_forder
-- 描述: 订单主表
-- 功能: 存储订单的基本信息，包括收货人、订单金额、状态等
-- 关联: 关联用户表(zk_user)，一个用户可以有多个订单
-- =====================================================
DROP TABLE IF EXISTS `zk_forder`;
CREATE TABLE `zk_forder` (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID，主键自增',
  `name` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `remark` varchar(200) DEFAULT NULL COMMENT '订单备注',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `total` double(10,2) DEFAULT '0.00' COMMENT '订单总金额',
  `post` varchar(20) DEFAULT NULL COMMENT '邮政编码',
  `address` varchar(200) DEFAULT NULL COMMENT '收货地址',
  `status` int(11) DEFAULT '0' COMMENT '订单状态：0-待发货，1-已发货，2-已完成，3-已取消',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID，关联zk_user表',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 COMMENT='订单主表';

-- =====================================================
-- 表名: zk_sorder
-- 描述: 订单明细表
-- 功能: 存储订单中的商品明细信息
-- 关联: 关联订单表(zk_forder)和商品表(zk_product)
-- =====================================================
DROP TABLE IF EXISTS `zk_sorder`;
CREATE TABLE `zk_sorder` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单明细ID，主键自增',
  `name` varchar(100) DEFAULT NULL COMMENT '商品名称（冗余存储）',
  `price` double(10,2) DEFAULT NULL COMMENT '商品单价（下单时的价格）',
  `number` int(11) DEFAULT '1' COMMENT '购买数量',
  `fid` int(11) DEFAULT NULL COMMENT '订单ID，关联zk_forder表',
  `pid` int(11) DEFAULT NULL COMMENT '商品ID，关联zk_product表',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='订单明细表';

-- ----------------------------
-- 订单示例数据
-- 用于测试订单管理功能
-- ----------------------------
INSERT INTO `zk_forder` VALUES ('10001', '张三', '13900000001', '请尽快发货', NOW(), '7999.00', '100000', '北京市朝阳区建国路88号', '0', '1');
INSERT INTO `zk_sorder` VALUES ('1', '苹果iPhone 15 Pro', '7999.00', '1', '10001', '1');

INSERT INTO `zk_forder` VALUES ('10002', '李四', '13900000002', '周末配送', NOW(), '10498.00', '100001', '上海市浦东新区陆家嘴', '1', '1');
INSERT INTO `zk_sorder` VALUES ('2', '华为Mate 60 Pro', '5999.00', '1', '10002', '2');
INSERT INTO `zk_sorder` VALUES ('3', '小米14 Pro', '4499.00', '1', '10002', '3');

SET FOREIGN_KEY_CHECKS = 1;
