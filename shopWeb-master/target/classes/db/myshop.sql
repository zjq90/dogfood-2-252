/*
 * 商城系统数据库初始化脚本
 * 
 * 数据库名称: myshop
 * 字符集: utf8mb4
 * 创建日期: 2024-03-24
 * 
 * 包含表结构:
 * - zk_admin: 管理员表
 * - zk_user: 用户表
 * - zk_product: 商品表
 * - zk_forder: 订单表
 * - zk_sorder: 订单项表
 */

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- =====================================================
-- 表: zk_admin (管理员表)
-- 描述: 存储系统管理员信息
-- =====================================================
DROP TABLE IF EXISTS `zk_admin`;
CREATE TABLE `zk_admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID，主键',
  `username` varchar(50) NOT NULL COMMENT '管理员用户名',
  `password` varchar(50) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `uk_username` (`username`) COMMENT '用户名唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- 插入默认管理员数据
-- 用户名: admin, 密码: admin
INSERT INTO `zk_admin` (`aid`, `username`, `password`) VALUES 
(1, 'admin', 'admin');

-- =====================================================
-- 表: zk_user (用户表)
-- 描述: 存储前台用户信息
-- =====================================================
DROP TABLE IF EXISTS `zk_user`;
CREATE TABLE `zk_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID，主键',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '用户密码',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `addr` varchar(200) DEFAULT NULL COMMENT '收货地址',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uk_username` (`username`) COMMENT '用户名唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 插入测试用户数据
INSERT INTO `zk_user` (`uid`, `username`, `password`, `realname`, `email`, `phone`, `addr`) VALUES 
(1, 'user', 'user', '普通用户', 'user@example.com', '13800138001', '北京市朝阳区'),
(2, 'test', 'test', '测试用户', 'test@test.com', '13800138000', '北京市海淀区');

-- =====================================================
-- 表: zk_product (商品表)
-- 描述: 存储商品信息
-- =====================================================
DROP TABLE IF EXISTS `zk_product`;
CREATE TABLE `zk_product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID，主键',
  `pname` varchar(100) NOT NULL COMMENT '商品名称',
  `sprice` decimal(10,2) DEFAULT '0.00' COMMENT '商品原价',
  `cprice` decimal(10,2) DEFAULT '0.00' COMMENT '商品现价（售价）',
  `pic` varchar(255) DEFAULT NULL COMMENT '商品图片文件名',
  `pdesc` varchar(500) DEFAULT NULL COMMENT '商品描述',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否热门商品（0-否，1-是）',
  `pdate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上架时间',
  `number` int(11) DEFAULT '0' COMMENT '库存数量',
  PRIMARY KEY (`pid`),
  KEY `idx_is_hot` (`is_hot`) COMMENT '热门商品索引',
  KEY `idx_pdate` (`pdate`) COMMENT '上架时间索引'
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

-- 插入测试商品数据
INSERT INTO `zk_product` (`pid`, `pname`, `sprice`, `cprice`, `pic`, `pdesc`, `is_hot`, `pdate`, `number`) VALUES 
(1, '苹果手机 iPhone 15', '6999.00', '5999.00', 'iphone15.jpg', '最新款苹果手机，A17芯片，性能强劲，拍照出色', 1, NOW(), 100),
(2, '华为手机 Mate 60', '5999.00', '4999.00', 'mate60.jpg', '华为旗舰手机，麒麟芯片，鸿蒙系统，拍照出色', 1, NOW(), 80),
(3, '小米手机 14', '3999.00', '3499.00', 'mi14.jpg', '小米数字旗舰，骁龙8 Gen3，性价比之王', 0, NOW(), 150),
(4, '联想笔记本 ThinkPad', '6999.00', '5999.00', 'thinkpad.jpg', '联想商务笔记本，稳定可靠，适合办公', 0, DATE_SUB(NOW(), INTERVAL 1 DAY), 50),
(5, '戴尔笔记本 XPS', '8999.00', '7999.00', 'xps.jpg', '戴尔高端笔记本，4K屏幕，性能强劲', 1, DATE_SUB(NOW(), INTERVAL 2 DAY), 30),
(6, 'iPad Pro', '7999.00', '6999.00', 'ipadpro.jpg', '苹果平板电脑，M2芯片，生产力工具', 1, DATE_SUB(NOW(), INTERVAL 3 DAY), 60),
(7, 'AirPods Pro', '1999.00', '1699.00', 'airpods.jpg', '苹果无线耳机，主动降噪，音质出色', 0, DATE_SUB(NOW(), INTERVAL 4 DAY), 200),
(8, '华为手表 Watch GT4', '1488.00', '1288.00', 'watchgt4.jpg', '华为智能手表，长续航，健康监测', 0, DATE_SUB(NOW(), INTERVAL 5 DAY), 120);

-- =====================================================
-- 表: zk_forder (订单表)
-- 描述: 存储订单主信息
-- =====================================================
DROP TABLE IF EXISTS `zk_forder`;
CREATE TABLE `zk_forder` (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID，主键',
  `name` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `remark` varchar(200) DEFAULT NULL COMMENT '订单备注',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `total` decimal(10,2) DEFAULT '0.00' COMMENT '订单总金额',
  `post` varchar(20) DEFAULT NULL COMMENT '邮政编码',
  `address` varchar(200) DEFAULT NULL COMMENT '收货地址',
  `status` int(11) DEFAULT '0' COMMENT '订单状态（0-未发货，1-已发货，2-已完成）',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID，关联zk_user表',
  PRIMARY KEY (`fid`),
  KEY `idx_uid` (`uid`) COMMENT '用户ID索引',
  KEY `idx_status` (`status`) COMMENT '订单状态索引',
  KEY `idx_date` (`date`) COMMENT '订单时间索引'
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- =====================================================
-- 表: zk_sorder (订单项表)
-- 描述: 存储订单中的商品明细
-- =====================================================
DROP TABLE IF EXISTS `zk_sorder`;
CREATE TABLE `zk_sorder` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单项ID，主键',
  `name` varchar(100) DEFAULT NULL COMMENT '商品名称（快照）',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '商品单价（快照）',
  `number` int(11) DEFAULT '0' COMMENT '购买数量',
  `fid` int(11) DEFAULT NULL COMMENT '订单ID，关联zk_forder表',
  `pid` int(11) DEFAULT NULL COMMENT '商品ID，关联zk_product表',
  PRIMARY KEY (`sid`),
  KEY `idx_fid` (`fid`) COMMENT '订单ID索引',
  KEY `idx_pid` (`pid`) COMMENT '商品ID索引'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='订单项表';

SET FOREIGN_KEY_CHECKS = 1;

-- =====================================================
-- 数据库初始化完成
-- 默认管理员: admin / admin
-- 测试用户: user / user, test / test
-- =====================================================
