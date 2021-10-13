/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50710
 Source Host           : localhost:3306
 Source Schema         : cbuc_homestay

 Target Server Type    : MySQL
 Target Server Version : 50710
 File Encoding         : 65001

 Date: 13/10/2021 09:38:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ms_apply
-- ----------------------------
DROP TABLE IF EXISTS `ms_apply`;
CREATE TABLE `ms_apply` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `OPEN_ID` varchar(32) NOT NULL COMMENT '申请人ID',
  `MNAME` varchar(16) DEFAULT NULL COMMENT '商家名称',
  `MPHONE` varchar(16) DEFAULT NULL COMMENT '商家号码',
  `MCARDNO` varchar(32) DEFAULT NULL COMMENT '商家身份证号',
  `MADDR` varchar(32) DEFAULT NULL COMMENT '商家地址',
  `MLICENSE` varchar(255) DEFAULT NULL COMMENT '商家营业执照图片URL',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `REMARK` varchar(64) DEFAULT NULL COMMENT '申请说明',
  `AUDIT_STATUS` varchar(4) DEFAULT 'WA' COMMENT '状态    WA：待审核   SA：审核通过   FA：审核不通过',
  `STATUS` varchar(2) DEFAULT 'E' COMMENT '状态    E：生效中   D：已失效',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ms_apply
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ms_audit_log
-- ----------------------------
DROP TABLE IF EXISTS `ms_audit_log`;
CREATE TABLE `ms_audit_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '受审ID',
  `TYPE` varchar(8) DEFAULT NULL COMMENT '受审类型     MERCHANT：商家   BULLETIN：公告   NEWS：资讯   COMMENT：评论   ROOM：房间',
  `AUDIT_STATUS` varchar(8) DEFAULT NULL COMMENT '审核状态',
  `AUDIT_REMARK` varchar(128) DEFAULT NULL COMMENT '审核说明',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  `STATUS` varchar(8) DEFAULT 'E' COMMENT '状态    E：生效    D：失效',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ms_audit_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ms_bulletin
-- ----------------------------
DROP TABLE IF EXISTS `ms_bulletin`;
CREATE TABLE `ms_bulletin` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `PUBLISH_ID` bigint(20) DEFAULT NULL,
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '公告内容',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `STATUS` varchar(2) DEFAULT 'E' COMMENT '状态     E：生效中    D：已失效',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ms_bulletin
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ms_comment
-- ----------------------------
DROP TABLE IF EXISTS `ms_comment`;
CREATE TABLE `ms_comment` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `OID` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `RID` bigint(20) DEFAULT NULL COMMENT '房源ID',
  `commentor` bigint(20) DEFAULT NULL COMMENT '评论者',
  `TYPE` varchar(2) DEFAULT '1' COMMENT '评论类型    1：一级评论   2：二级评论',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `LIKE_COUNT` int(11) DEFAULT '0' COMMENT '点赞数',
  `COMMENT_COUNT` int(11) DEFAULT '0' COMMENT '评论数',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `STATUS` varchar(2) DEFAULT 'E' COMMENT '评论状态   E：生效    D：失效',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ms_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ms_favorite
-- ----------------------------
DROP TABLE IF EXISTS `ms_favorite`;
CREATE TABLE `ms_favorite` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `RID` bigint(20) DEFAULT NULL COMMENT '房间ID',
  `OPEN_ID` varchar(32) DEFAULT NULL COMMENT '用户标识ID',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `STATUS` varchar(4) DEFAULT 'E' COMMENT '状态  E：生效 D：失效',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ms_favorite
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ms_image
-- ----------------------------
DROP TABLE IF EXISTS `ms_image`;
CREATE TABLE `ms_image` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '所属ID',
  `ORIGIN` varchar(8) DEFAULT NULL COMMENT '图片来源    ROOM ：房间图片    NEWS ：资讯图片   USER：用户头像    LICENSE：营业执照',
  `URL` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `STATUS` varchar(2) DEFAULT 'E' COMMENT '图片状态      D：已失效   E：生效中',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ms_image
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ms_merchant
-- ----------------------------
DROP TABLE IF EXISTS `ms_merchant`;
CREATE TABLE `ms_merchant` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `AUDIT_ID` bigint(20) DEFAULT NULL COMMENT '申请表ID',
  `MNAME` varchar(8) DEFAULT NULL COMMENT '商家名称',
  `MPHONE` varchar(16) DEFAULT NULL COMMENT '商家联系电话',
  `MACCOUNT` varchar(16) DEFAULT NULL COMMENT '商家账号',
  `MPWD` varchar(32) DEFAULT NULL COMMENT '商家密码',
  `MLEVEL` varchar(8) DEFAULT NULL COMMENT '商家等级    ADMIN: 超级管理员  GOLD：金牌商家   SLIVER：银牌商家   COPPER：铜牌商家    NORMAL：普通商家',
  `MDESC` varchar(512) DEFAULT NULL COMMENT '房东介绍',
  `AVATAR_URL` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `STATUS` varchar(2) DEFAULT 'E' COMMENT '状态      D：已失效   E：生效中',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ms_merchant
-- ----------------------------
BEGIN;
INSERT INTO `ms_merchant` VALUES (1, 1, '系统管理员', '17315032831', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'ADMIN', NULL, '', '2020-01-02 17:07:30', '2021-10-13 09:32:13', 'E');
INSERT INTO `ms_merchant` VALUES (8, 1, '听香4号小屋', '17689400062', '123456', '123456789', 'COPPER', '这是房东描述。这是房东描述。这是房东描述。这是房东描述。这是房东描述。这是房东描述。这是房东描述。', '', '2020-01-11 23:11:12', '2021-10-13 09:32:01', 'E');
INSERT INTO `ms_merchant` VALUES (9, 3, '11', '17689400062', '663566', '734369', 'NORMAL', NULL, NULL, '2021-09-22 14:09:57', '2021-09-22 14:09:57', 'E');
COMMIT;

-- ----------------------------
-- Table structure for ms_message
-- ----------------------------
DROP TABLE IF EXISTS `ms_message`;
CREATE TABLE `ms_message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `SEND_ID` bigint(20) DEFAULT NULL COMMENT '发送方',
  `SEND_TYPE` varchar(8) DEFAULT NULL COMMENT '发送方类型      ADMIN：超级管理员   MERCHANT：商户    USER：用户',
  `RECEIVE_ID` bigint(20) DEFAULT NULL COMMENT '通知方',
  `RECEIVE_TYPE` varchar(8) DEFAULT NULL COMMENT '接收方类型        ADMIN：超级管理员   MERCHANT：商户    USER：用户',
  `CONTENT` varchar(128) DEFAULT NULL COMMENT '通知内容',
  `READ_STATUS` varchar(4) DEFAULT 'WR' COMMENT '读取状态     WR：未读   YR：已读   D：删除',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `STATUS` varchar(4) DEFAULT 'E' COMMENT '状态   E：生效    D：失效',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ms_message
-- ----------------------------
BEGIN;
INSERT INTO `ms_message` VALUES (3, 1, 'ADMIN', 8, 'MERCHANT', '请看公告！', 'YR', '2020-05-18 23:36:49', '2020-05-22 22:51:48', 'E');
INSERT INTO `ms_message` VALUES (4, 1, 'ADMIN', 8, 'MERCHANT', '今晚开会！', 'YR', '2020-05-18 23:37:04', '2020-05-22 22:51:46', 'E');
INSERT INTO `ms_message` VALUES (8, 8, 'MERCHANT', 1, 'ADMIN', '收到！', 'WR', '2020-05-23 00:03:14', '2020-05-23 00:03:18', 'E');
COMMIT;

-- ----------------------------
-- Table structure for ms_news
-- ----------------------------
DROP TABLE IF EXISTS `ms_news`;
CREATE TABLE `ms_news` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `PUBLISH_ID` bigint(20) DEFAULT NULL COMMENT '发布人ID',
  `TITLE` varchar(64) DEFAULT NULL COMMENT '文章标题',
  `SUMMARY` varchar(255) DEFAULT NULL COMMENT '文章摘要',
  `CONTENT` text COMMENT '文章内容',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `BEGIN_TIME` datetime DEFAULT NULL COMMENT '开始展示时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '结束展示时间',
  `AUDIT_STATUS` varchar(4) DEFAULT 'WA' COMMENT '审核状态   WA：待审核   SA：审核通过   FA：审核不通过',
  `STATUS` varchar(2) DEFAULT 'E' COMMENT '状态    E：生效中   D：已失效',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ms_news
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ms_order
-- ----------------------------
DROP TABLE IF EXISTS `ms_order`;
CREATE TABLE `ms_order` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `RID` bigint(20) DEFAULT NULL COMMENT '房间ID',
  `OPEN_ID` varchar(32) DEFAULT NULL COMMENT '用户标识ID',
  `NAME` varchar(16) DEFAULT NULL COMMENT '入住用户名称',
  `CARDNO` varchar(32) DEFAULT NULL COMMENT '用户身份证号',
  `PHONE` varchar(16) DEFAULT NULL COMMENT '用户号码',
  `ORDER_CODE` varchar(16) DEFAULT NULL COMMENT '订单编号',
  `DAY_COUNT` varchar(4) DEFAULT NULL COMMENT '居住时长',
  `PRICE` float DEFAULT NULL COMMENT '价格',
  `COMMENT` varchar(128) DEFAULT NULL COMMENT '订单留言',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `PAY_TIME` datetime DEFAULT NULL COMMENT '付款时间',
  `CONFIRM_TIME` datetime DEFAULT NULL COMMENT '收货时间',
  `BEGIN_TIME` datetime DEFAULT NULL COMMENT '入住时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '退房时间',
  `STATUS` varchar(4) DEFAULT 'WP' COMMENT '订单状态    WP：待付款   WR：待评价  YR：已评价  WDD：退款中  SDD：退款成功  FDD：退款失败  D：删除',
  `READ_STATUS` varchar(2) DEFAULT 'N' COMMENT '已读状态  Y：已读  N：未读',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ms_order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ms_property
-- ----------------------------
DROP TABLE IF EXISTS `ms_property`;
CREATE TABLE `ms_property` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `RID` bigint(20) DEFAULT NULL COMMENT '房间ID',
  `PRO_KEY` varchar(8) DEFAULT NULL COMMENT '属性名',
  `PRO_VALUE` varchar(8) DEFAULT NULL COMMENT '属性值',
  `STATUS` varchar(2) DEFAULT 'E' COMMENT '状态    E：生效中   D：已失效',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ms_property
-- ----------------------------
BEGIN;
INSERT INTO `ms_property` VALUES (1, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (2, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (3, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (4, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (5, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (6, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (7, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (8, 12, '人可住', '3', 'D');
INSERT INTO `ms_property` VALUES (9, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (10, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (11, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (12, 12, '人可住', '3', 'D');
INSERT INTO `ms_property` VALUES (13, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (14, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (15, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (16, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (17, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (18, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (19, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (20, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (21, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (22, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (23, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (24, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (25, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (26, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (27, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (28, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (37, 9, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (38, 9, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (39, 9, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (40, 9, '人可住', '3', 'D');
INSERT INTO `ms_property` VALUES (41, 8, '间卧室', '1', 'E');
INSERT INTO `ms_property` VALUES (42, 8, '张床', '2', 'E');
INSERT INTO `ms_property` VALUES (43, 8, '间卫生间', '1', 'E');
INSERT INTO `ms_property` VALUES (44, 8, '人可住', '3', 'E');
INSERT INTO `ms_property` VALUES (45, 7, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (46, 7, '张床', '1', 'D');
INSERT INTO `ms_property` VALUES (47, 7, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (48, 7, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (49, 6, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (50, 6, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (51, 6, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (52, 6, '人可住', '3', 'D');
INSERT INTO `ms_property` VALUES (53, 5, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (54, 5, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (55, 5, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (56, 5, '人可住', '3', 'D');
INSERT INTO `ms_property` VALUES (57, 3, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (58, 3, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (59, 3, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (60, 3, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (61, 2, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (62, 2, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (63, 2, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (64, 2, '人可住', '3', 'D');
INSERT INTO `ms_property` VALUES (65, 1, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (66, 1, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (67, 1, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (68, 1, '人可住', '3', 'D');
INSERT INTO `ms_property` VALUES (69, 4, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (70, 4, '张床', '1', 'D');
INSERT INTO `ms_property` VALUES (71, 4, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (72, 4, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (73, 4, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (74, 4, '张床', '1', 'D');
INSERT INTO `ms_property` VALUES (75, 4, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (76, 4, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (77, 13, '间卧室', '5', 'D');
INSERT INTO `ms_property` VALUES (78, 13, '张床', '1', 'D');
INSERT INTO `ms_property` VALUES (79, 13, '间卫生间', '5', 'D');
INSERT INTO `ms_property` VALUES (80, 13, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (81, 13, '间卧室', '5', 'D');
INSERT INTO `ms_property` VALUES (82, 13, '张床', '1', 'D');
INSERT INTO `ms_property` VALUES (83, 13, '间卫生间', '5', 'D');
INSERT INTO `ms_property` VALUES (84, 13, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (85, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (86, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (87, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (88, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (89, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (90, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (91, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (92, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (93, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (94, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (95, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (96, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (97, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (98, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (99, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (100, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (101, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (102, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (103, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (104, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (105, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (106, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (107, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (108, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (109, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (110, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (111, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (112, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (113, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (114, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (115, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (116, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (117, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (118, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (119, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (120, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (121, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (122, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (123, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (124, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (125, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (126, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (127, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (128, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (129, 15, '间卧室', '1', 'E');
INSERT INTO `ms_property` VALUES (130, 15, '张床', '1', 'E');
INSERT INTO `ms_property` VALUES (131, 15, '间卫生间', '1', 'E');
INSERT INTO `ms_property` VALUES (132, 15, '人可住', '1', 'E');
INSERT INTO `ms_property` VALUES (133, 16, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (134, 16, '张床', '1', 'D');
INSERT INTO `ms_property` VALUES (135, 16, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (136, 16, '人可住', '1', 'D');
INSERT INTO `ms_property` VALUES (137, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (138, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (139, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (140, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (141, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (142, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (143, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (144, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (145, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (146, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (147, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (148, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (149, 16, '间卧室', '1', 'E');
INSERT INTO `ms_property` VALUES (150, 16, '张床', '1', 'E');
INSERT INTO `ms_property` VALUES (151, 16, '间卫生间', '1', 'E');
INSERT INTO `ms_property` VALUES (152, 16, '人可住', '1', 'E');
INSERT INTO `ms_property` VALUES (153, 1, '间卧室', '1', 'E');
INSERT INTO `ms_property` VALUES (154, 1, '张床', '2', 'E');
INSERT INTO `ms_property` VALUES (155, 1, '间卫生间', '1', 'E');
INSERT INTO `ms_property` VALUES (156, 1, '人可住', '3', 'E');
INSERT INTO `ms_property` VALUES (157, 2, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (158, 2, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (159, 2, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (160, 2, '人可住', '3', 'D');
INSERT INTO `ms_property` VALUES (161, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (162, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (163, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (164, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (165, 9, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (166, 9, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (167, 9, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (168, 9, '人可住', '3', 'D');
INSERT INTO `ms_property` VALUES (169, 7, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (170, 7, '张床', '1', 'D');
INSERT INTO `ms_property` VALUES (171, 7, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (172, 7, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (173, 6, '间卧室', '1', 'E');
INSERT INTO `ms_property` VALUES (174, 6, '张床', '2', 'E');
INSERT INTO `ms_property` VALUES (175, 6, '间卫生间', '1', 'E');
INSERT INTO `ms_property` VALUES (176, 6, '人可住', '3', 'E');
INSERT INTO `ms_property` VALUES (177, 5, '间卧室', '1', 'E');
INSERT INTO `ms_property` VALUES (178, 5, '张床', '2', 'E');
INSERT INTO `ms_property` VALUES (179, 5, '间卫生间', '1', 'E');
INSERT INTO `ms_property` VALUES (180, 5, '人可住', '3', 'E');
INSERT INTO `ms_property` VALUES (181, 4, '间卧室', '1', 'E');
INSERT INTO `ms_property` VALUES (182, 4, '张床', '1', 'E');
INSERT INTO `ms_property` VALUES (183, 4, '间卫生间', '1', 'E');
INSERT INTO `ms_property` VALUES (184, 4, '人可住', '2', 'E');
INSERT INTO `ms_property` VALUES (185, 3, '间卧室', '1', 'E');
INSERT INTO `ms_property` VALUES (186, 3, '张床', '2', 'E');
INSERT INTO `ms_property` VALUES (187, 3, '间卫生间', '1', 'E');
INSERT INTO `ms_property` VALUES (188, 3, '人可住', '2', 'E');
INSERT INTO `ms_property` VALUES (189, 9, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (190, 9, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (191, 9, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (192, 9, '人可住', '3', 'D');
INSERT INTO `ms_property` VALUES (193, 9, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (194, 9, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (195, 9, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (196, 9, '人可住', '3', 'D');
INSERT INTO `ms_property` VALUES (197, 9, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (198, 9, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (199, 9, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (200, 9, '人可住', '3', 'D');
INSERT INTO `ms_property` VALUES (201, 9, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (202, 9, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (203, 9, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (204, 9, '人可住', '3', 'D');
INSERT INTO `ms_property` VALUES (205, 9, '间卧室', '1', 'E');
INSERT INTO `ms_property` VALUES (206, 9, '张床', '2', 'E');
INSERT INTO `ms_property` VALUES (207, 9, '间卫生间', '1', 'E');
INSERT INTO `ms_property` VALUES (208, 9, '人可住', '3', 'E');
INSERT INTO `ms_property` VALUES (209, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (210, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (211, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (212, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (213, 12, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (214, 12, '张床', '2', 'D');
INSERT INTO `ms_property` VALUES (215, 12, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (216, 12, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (217, 12, '间卧室', '1', 'E');
INSERT INTO `ms_property` VALUES (218, 12, '张床', '2', 'E');
INSERT INTO `ms_property` VALUES (219, 12, '间卫生间', '1', 'E');
INSERT INTO `ms_property` VALUES (220, 12, '人可住', '2', 'E');
INSERT INTO `ms_property` VALUES (221, 13, '间卧室', '5', 'D');
INSERT INTO `ms_property` VALUES (222, 13, '张床', '1', 'D');
INSERT INTO `ms_property` VALUES (223, 13, '间卫生间', '5', 'D');
INSERT INTO `ms_property` VALUES (224, 13, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (225, 13, '间卧室', '5', 'D');
INSERT INTO `ms_property` VALUES (226, 13, '张床', '1', 'D');
INSERT INTO `ms_property` VALUES (227, 13, '间卫生间', '5', 'D');
INSERT INTO `ms_property` VALUES (228, 13, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (229, 13, '间卧室', '5', 'D');
INSERT INTO `ms_property` VALUES (230, 13, '张床', '1', 'D');
INSERT INTO `ms_property` VALUES (231, 13, '间卫生间', '5', 'D');
INSERT INTO `ms_property` VALUES (232, 13, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (233, 13, '间卧室', '5', 'D');
INSERT INTO `ms_property` VALUES (234, 13, '张床', '1', 'D');
INSERT INTO `ms_property` VALUES (235, 13, '间卫生间', '5', 'D');
INSERT INTO `ms_property` VALUES (236, 13, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (237, 13, '间卧室', '5', 'D');
INSERT INTO `ms_property` VALUES (238, 13, '张床', '1', 'D');
INSERT INTO `ms_property` VALUES (239, 13, '间卫生间', '5', 'D');
INSERT INTO `ms_property` VALUES (240, 13, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (241, 13, '间卧室', '5', 'D');
INSERT INTO `ms_property` VALUES (242, 13, '张床', '1', 'D');
INSERT INTO `ms_property` VALUES (243, 13, '间卫生间', '5', 'D');
INSERT INTO `ms_property` VALUES (244, 13, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (245, 13, '间卧室', '5', 'D');
INSERT INTO `ms_property` VALUES (246, 13, '张床', '1', 'D');
INSERT INTO `ms_property` VALUES (247, 13, '间卫生间', '5', 'D');
INSERT INTO `ms_property` VALUES (248, 13, '人可住', '2', 'D');
INSERT INTO `ms_property` VALUES (249, 13, '间卧室', '5', 'E');
INSERT INTO `ms_property` VALUES (250, 13, '张床', '1', 'E');
INSERT INTO `ms_property` VALUES (251, 13, '间卫生间', '5', 'E');
INSERT INTO `ms_property` VALUES (252, 13, '人可住', '2', 'E');
INSERT INTO `ms_property` VALUES (253, 7, '间卧室', '1', 'E');
INSERT INTO `ms_property` VALUES (254, 7, '张床', '1', 'E');
INSERT INTO `ms_property` VALUES (255, 7, '间卫生间', '1', 'E');
INSERT INTO `ms_property` VALUES (256, 7, '人可住', '2', 'E');
INSERT INTO `ms_property` VALUES (257, 2, '间卧室', '1', 'E');
INSERT INTO `ms_property` VALUES (258, 2, '张床', '2', 'E');
INSERT INTO `ms_property` VALUES (259, 2, '间卫生间', '1', 'E');
INSERT INTO `ms_property` VALUES (260, 2, '人可住', '3', 'E');
INSERT INTO `ms_property` VALUES (261, 18, '间卧室', '1', 'E');
INSERT INTO `ms_property` VALUES (262, 18, '张床', '1', 'E');
INSERT INTO `ms_property` VALUES (263, 18, '间卫生间', '1', 'E');
INSERT INTO `ms_property` VALUES (264, 18, '人可住', '2', 'E');
INSERT INTO `ms_property` VALUES (265, 14, '间卧室', '1', 'D');
INSERT INTO `ms_property` VALUES (266, 14, '张床', '1', 'D');
INSERT INTO `ms_property` VALUES (267, 14, '间卫生间', '1', 'D');
INSERT INTO `ms_property` VALUES (268, 14, '人可住', '1', 'D');
INSERT INTO `ms_property` VALUES (269, 14, '间卧室', '1', 'E');
INSERT INTO `ms_property` VALUES (270, 14, '张床', '1', 'E');
INSERT INTO `ms_property` VALUES (271, 14, '间卫生间', '1', 'E');
INSERT INTO `ms_property` VALUES (272, 14, '人可住', '1', 'E');
INSERT INTO `ms_property` VALUES (273, 15, '间卧室', '2', 'E');
INSERT INTO `ms_property` VALUES (274, 15, '张床', '2', 'E');
INSERT INTO `ms_property` VALUES (275, 15, '间卫生间', '2', 'E');
INSERT INTO `ms_property` VALUES (276, 16, '间卧室', '3', 'E');
INSERT INTO `ms_property` VALUES (277, 16, '张床', '3', 'E');
INSERT INTO `ms_property` VALUES (278, 16, '间卫生间', '3', 'E');
INSERT INTO `ms_property` VALUES (279, 16, '人可住', '3', 'E');
INSERT INTO `ms_property` VALUES (280, 17, '间卧室', '4', 'E');
INSERT INTO `ms_property` VALUES (281, 17, '张床', '4', 'E');
INSERT INTO `ms_property` VALUES (282, 17, '间卫生间', '4', 'E');
INSERT INTO `ms_property` VALUES (283, 17, '人可住', '4', 'E');
INSERT INTO `ms_property` VALUES (284, 18, '间卧室', '4', 'E');
INSERT INTO `ms_property` VALUES (285, 18, '张床', '4', 'E');
INSERT INTO `ms_property` VALUES (286, 18, '间卫生间', '4', 'E');
INSERT INTO `ms_property` VALUES (287, 18, '人可住', '4', 'E');
INSERT INTO `ms_property` VALUES (288, 19, '间卧室', '5', 'E');
INSERT INTO `ms_property` VALUES (289, 19, '张床', '5', 'E');
INSERT INTO `ms_property` VALUES (290, 19, '间卫生间', '5', 'E');
INSERT INTO `ms_property` VALUES (291, 19, '人可住', '5', 'E');
COMMIT;

-- ----------------------------
-- Table structure for ms_roominfo
-- ----------------------------
DROP TABLE IF EXISTS `ms_roominfo`;
CREATE TABLE `ms_roominfo` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `MID` bigint(20) DEFAULT NULL COMMENT '商家ID',
  `TITLE` varchar(16) DEFAULT NULL COMMENT '房间标题',
  `DES` varchar(128) DEFAULT NULL COMMENT '房间描述',
  `PRICE` float DEFAULT NULL COMMENT '价格',
  `IS_ACTIVE` varchar(2) DEFAULT 'N' COMMENT '是否参加活动     Y：是    N：否',
  `SALES` int(11) DEFAULT '0' COMMENT '销售数量',
  `TYPE` varchar(4) DEFAULT NULL COMMENT '房间类型    大床房，单人间，双人间，三人间',
  `LIKE_COUNT` int(11) DEFAULT '0' COMMENT '收藏数',
  `COMMENT_COUNT` int(11) DEFAULT '0' COMMENT '评论数',
  `BEGIN_TIME` date DEFAULT NULL COMMENT '开始预订时间',
  `END_TIME` date DEFAULT NULL COMMENT '结束预订时间',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `AUDIT_STATUS` varchar(4) DEFAULT 'WA' COMMENT '审核状态  WA：待审核  SA：审核通过 ',
  `STATUS` varchar(2) DEFAULT 'FR' COMMENT '房间状态   D：已下架   FR：空闲中   B：已预订',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ms_roominfo
-- ----------------------------
BEGIN;
INSERT INTO `ms_roominfo` VALUES (1, 8, '傍山屋', '过雨看松色，随山到水源。溪花与禅意，相对亦忘言。禅意之于民宿，可静可动，让人获得精神惬意和心理满足。', 150, 'Y', 1, '双人间', 20, 2, '2020-05-18', '2020-05-19', '2020-01-13 17:19:16', '2020-05-22 23:14:17', 'SA', 'FR');
INSERT INTO `ms_roominfo` VALUES (2, 8, '北屋', '偶遇民宿，初见即一见钟情。远远望去，颇有古代山水画的意境。蓝天白云，或日出日落，大自然馈赠的美景犹如一幅挂画。民宿与这里的“风、花、雪、月”完美融合，却又出类拔萃。', 125, 'Y', 0, '单人间', 1, 5, '2020-05-01', '2020-05-02', '2020-01-13 17:19:16', '2020-05-22 23:15:17', 'SA', 'FR');
INSERT INTO `ms_roominfo` VALUES (3, 8, '东屋', '山水边的民宿有着得天独厚的景色。客人静坐在阳台，看窗外落霞与孤鹜齐飞 ，秋水共长天一色，也是引人入胜。', 112, 'N', 0, '双人间', 2, 2, '2020-04-21', '2020-04-22', '2020-01-13 17:19:16', '2020-05-22 23:14:08', 'SA', 'FR');
INSERT INTO `ms_roominfo` VALUES (4, 8, '西屋', '怀旧风格的民宿，不仅能让客人体验到像童年时光的逍遥自在，在客人玩累的时候，更像温馨舒适的家。', 96, 'N', 0, '双人间', 0, 0, '2020-03-23', '2020-03-24', '2020-01-13 17:19:16', '2020-05-22 23:14:03', 'SA', 'FR');
INSERT INTO `ms_roominfo` VALUES (5, 8, '南屋', '民宿不是旅馆不是饭店，但是比旅馆更温馨，比饭店更回味。没有奢华的设施，却有别样风景和当地特色，让你发觉诗意生活正如此。', 150, 'N', 0, '双人间', 0, 0, NULL, NULL, '2020-01-13 17:19:16', '2020-05-22 23:13:55', 'SA', 'FR');
INSERT INTO `ms_roominfo` VALUES (6, 8, '东北屋', '从幽溪深涧的陶冶中得到超悟，从摇曳的野花静静观照中，自在恬然的心境与清幽静谧的物象交融为一。愿所有人都能获得乘兴而来，兴尽而返的惬意自得的感受。', 159, 'N', 0, '双人间', 5, 0, NULL, NULL, '2020-01-13 17:19:16', '2020-05-22 23:13:49', 'SA', 'FR');
INSERT INTO `ms_roominfo` VALUES (7, 8, '堡垒屋', '一角斜阳照来，感受一种隐约的侘寂美，连空间都被赋予了一种宁静、质朴的气质。每个房间，展现出的新禅意之美，给住客带来独一无二的私密体验；', 119, 'Y', 0, '单人间', 1, 4, '2020-03-27', '2020-03-28', '2020-01-13 17:19:16', '2020-05-22 23:15:10', 'SA', 'FR');
INSERT INTO `ms_roominfo` VALUES (8, 8, '西北屋', '非常舒适非常舒适非常舒适非常舒适非常舒适非常舒适非常舒适非常舒适非常舒适非常舒适非常舒适非常舒适非常舒适非常舒适', 118, 'N', 0, '大床房', 8, 0, '2020-03-18', '2020-03-19', '2020-01-13 17:19:16', '2020-05-22 23:13:16', 'SA', 'FR');
INSERT INTO `ms_roominfo` VALUES (9, 8, '东南屋', '禅意花器、茶壶，餐厅陈列了许多禅意的枯山水元素，窗外望去，也是一番和谐的朴素景象，置身其中，仿佛参与了一幅动态画作，实在是一种享受。', 150, 'Y', 0, '双人间', 3, 0, '2020-02-28', '2020-02-29', '2020-01-13 17:19:16', '2020-05-22 23:11:53', 'SA', 'FR');
INSERT INTO `ms_roominfo` VALUES (12, 8, '安定坊', '新式建筑与老房子的巧妙结合，宛如天成，精美别致。从紧张忙碌的工作、生活中抽离出来，千里迢迢来民宿遇见有趣的人，一起发呆、冥想、思考人生，宁静、自然，享受当下。', 123, 'Y', 0, '双人间', 0, 1, '2020-02-14', '2020-02-15', '2020-02-13 16:11:33', '2020-05-22 23:08:44', 'SA', 'FR');
INSERT INTO `ms_roominfo` VALUES (13, 8, '东街房', '很好的房子很舒适', 112, 'Y', 1, '双人间', 1, 1, '2020-05-22', '2020-05-23', '2020-02-27 17:46:29', '2020-05-22 23:14:54', 'SA', 'FR');
INSERT INTO `ms_roominfo` VALUES (14, 1, '1', '1', 1, 'Y', 0, '大床房', 0, 0, NULL, NULL, '2021-09-22 14:24:01', '2021-09-22 15:45:05', 'SA', 'D');
INSERT INTO `ms_roominfo` VALUES (15, 1, '2', '2', 2, 'Y', 0, '大床房', 0, 0, NULL, NULL, '2021-09-22 15:45:18', '2021-09-22 15:45:18', 'WA', 'FR');
INSERT INTO `ms_roominfo` VALUES (16, 1, '3', '3', 3, 'Y', 0, '大床房', 0, 0, NULL, NULL, '2021-09-22 15:46:49', '2021-09-22 15:47:29', 'SA', 'FR');
INSERT INTO `ms_roominfo` VALUES (17, 1, '4', '4', 4, 'Y', 0, '大床房', 0, 0, NULL, NULL, '2021-09-22 15:50:07', '2021-09-22 15:50:07', 'WA', 'FR');
INSERT INTO `ms_roominfo` VALUES (18, 1, '4', '4', 4, 'Y', 0, '大床房', 0, 0, NULL, NULL, '2021-09-22 16:00:45', '2021-09-22 16:00:45', 'WA', 'FR');
INSERT INTO `ms_roominfo` VALUES (19, 1, '5', '5', 5, 'Y', 0, '大床房', 0, 0, NULL, NULL, '2021-09-22 16:14:51', '2021-09-22 16:14:51', 'WA', 'FR');
COMMIT;

-- ----------------------------
-- Table structure for ms_user
-- ----------------------------
DROP TABLE IF EXISTS `ms_user`;
CREATE TABLE `ms_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `OPEN_ID` varchar(32) DEFAULT NULL COMMENT '用户OPEN_ID',
  `UNAME` varchar(16) DEFAULT NULL COMMENT '用户名称',
  `UPHONE` varchar(16) DEFAULT NULL COMMENT '用户号码',
  `AVATAR_URL` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `STATUS` varchar(2) DEFAULT 'E' COMMENT '状态    E：生效中    D：已失效',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ms_user
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
