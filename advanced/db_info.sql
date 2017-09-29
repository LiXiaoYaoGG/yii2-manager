/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : db_info

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-09-29 14:15:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'FoFuK-WrcOayDI0_kLdRwGavKN-6mXs6', '$2y$13$JgyD3/1FaVimvH7bJg/RRuIuiQuIGYcjLwmz4bRXznUHOC4pjp8a.', 'rB40CfDESs-NPPdqX3psJcbgWkkkZgdY_1505609223', '2107898148@qq.com', '10', '1498634445', '1505609223');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `first_img` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '首图',
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '文章标题',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '文章内容',
  `g_id` int(11) NOT NULL COMMENT '文章所属分类',
  `create_at` int(10) NOT NULL COMMENT '创建时间',
  `updated_at` int(10) DEFAULT NULL COMMENT '更新时间',
  `visite_num` int(11) DEFAULT NULL COMMENT '访问次数',
  PRIMARY KEY (`id`),
  KEY `group_key` (`g_id`),
  KEY `index` (`id`,`create_at`,`updated_at`) USING BTREE,
  CONSTRAINT `group_key` FOREIGN KEY (`g_id`) REFERENCES `article_group` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', 'http://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/FullMoon2010.jpg/631px-FullMoon2010.jpg', '2', '123', '1', '1', '1', '1');
INSERT INTO `article` VALUES ('2', 'http://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/FullMoon2010.jpg/631px-FullMoon2010.jpg', 'rttr', 'rtrt', '2', '2', '2', '221');
INSERT INTO `article` VALUES ('3', '../../uploads/201709290926543131.png', 'rrr', 'q', '1', '1', '1', '1');
INSERT INTO `article` VALUES ('4', '../../uploads/201709291027509392.jpg', '222', '123123', '1', '1506652070', null, null);
INSERT INTO `article` VALUES ('5', '../../uploads/201709291335372701.png', '新加文字测试', '新加文字测试', '2', '1506663337', null, null);

-- ----------------------------
-- Table structure for article_group
-- ----------------------------
DROP TABLE IF EXISTS `article_group`;
CREATE TABLE `article_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章分类ID',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '分类名称',
  `created_at` int(10) NOT NULL COMMENT '创建时间',
  `updated_at` int(10) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `index` (`id`,`created_at`,`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of article_group
-- ----------------------------
INSERT INTO `article_group` VALUES ('1', '文章名称9', '1506587080', '1506587415');
INSERT INTO `article_group` VALUES ('2', '尔特人', '1506587673', '1506587681');
INSERT INTO `article_group` VALUES ('3', '斤斤计较', '1506665460', null);

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('管理员', '1', '1506413130');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/*', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/*', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/assignment/revoke', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/permission/assign', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/permission/create', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/permission/delete', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/permission/remove', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/role/remove', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/role/update', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/role/view', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/route/assign', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/route/create', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/route/refresh', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/route/remove', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/user/activate', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/user/change-password', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/user/delete', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/user/login', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/user/logout', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/user/request-password-reset', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/user/reset-password', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/user/signup', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/admin/user/view', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/article-group/*', '2', null, null, null, '1506585967', '1506585967');
INSERT INTO `auth_item` VALUES ('/article-group/create', '2', null, null, null, '1506585967', '1506585967');
INSERT INTO `auth_item` VALUES ('/article-group/delete', '2', null, null, null, '1506585967', '1506585967');
INSERT INTO `auth_item` VALUES ('/article-group/index', '2', null, null, null, '1506585967', '1506585967');
INSERT INTO `auth_item` VALUES ('/article-group/update', '2', null, null, null, '1506585967', '1506585967');
INSERT INTO `auth_item` VALUES ('/article-group/view', '2', null, null, null, '1506585967', '1506585967');
INSERT INTO `auth_item` VALUES ('/article/*', '2', null, null, null, '1506585967', '1506585967');
INSERT INTO `auth_item` VALUES ('/article/create', '2', null, null, null, '1506585967', '1506585967');
INSERT INTO `auth_item` VALUES ('/article/delete', '2', null, null, null, '1506585967', '1506585967');
INSERT INTO `auth_item` VALUES ('/article/index', '2', null, null, null, '1506585967', '1506585967');
INSERT INTO `auth_item` VALUES ('/article/update', '2', null, null, null, '1506585967', '1506585967');
INSERT INTO `auth_item` VALUES ('/article/view', '2', null, null, null, '1506585967', '1506585967');
INSERT INTO `auth_item` VALUES ('/debug/*', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/debug/default/db-explain', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/debug/user/*', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/debug/user/reset-identity', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/debug/user/set-identity', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/gii/*', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/site/*', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/site/error', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/site/index', '2', null, null, null, '1506413028', '1506413028');
INSERT INTO `auth_item` VALUES ('/site/pay', '2', null, null, null, '1506566579', '1506566579');
INSERT INTO `auth_item` VALUES ('/user/*', '2', null, null, null, '1506568017', '1506568017');
INSERT INTO `auth_item` VALUES ('/user/create', '2', null, null, null, '1506568017', '1506568017');
INSERT INTO `auth_item` VALUES ('/user/delete', '2', null, null, null, '1506568017', '1506568017');
INSERT INTO `auth_item` VALUES ('/user/index', '2', null, null, null, '1506568017', '1506568017');
INSERT INTO `auth_item` VALUES ('/user/update', '2', null, null, null, '1506568017', '1506568017');
INSERT INTO `auth_item` VALUES ('/user/view', '2', null, null, null, '1506568017', '1506568017');
INSERT INTO `auth_item` VALUES ('管理员', '1', '后台管理人员', null, null, '1498697175', '1498714888');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('管理员', '/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/assignment/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/assignment/assign');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/assignment/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/assignment/revoke');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/assignment/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/default/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/default/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/menu/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/menu/create');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/menu/delete');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/menu/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/menu/update');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/menu/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/permission/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/permission/assign');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/permission/create');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/permission/delete');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/permission/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/permission/remove');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/permission/update');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/permission/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/role/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/role/assign');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/role/create');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/role/delete');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/role/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/role/remove');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/role/update');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/role/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/route/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/route/assign');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/route/create');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/route/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/route/refresh');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/route/remove');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/rule/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/rule/create');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/rule/delete');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/rule/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/rule/update');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/rule/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/activate');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/change-password');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/delete');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/login');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/logout');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/request-password-reset');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/reset-password');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/signup');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/default/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/default/db-explain');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/default/download-mail');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/default/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/default/toolbar');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/default/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/user/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/user/reset-identity');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/user/set-identity');
INSERT INTO `auth_item_child` VALUES ('管理员', '/gii/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/gii/default/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/gii/default/action');
INSERT INTO `auth_item_child` VALUES ('管理员', '/gii/default/diff');
INSERT INTO `auth_item_child` VALUES ('管理员', '/gii/default/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/gii/default/preview');
INSERT INTO `auth_item_child` VALUES ('管理员', '/gii/default/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/site/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/site/error');
INSERT INTO `auth_item_child` VALUES ('管理员', '/site/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/site/pay');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '权限管理', null, null, '2', 0x7B2269636F6E223A20227772656E6368222C202276697369626C65223A202266616C7365227D);
INSERT INTO `menu` VALUES ('2', '角色列表', '1', '/admin/role/index', '2', 0x7B2269636F6E223A2022757365722D6F222C202276697369626C65223A202266616C7365227D);
INSERT INTO `menu` VALUES ('3', '路由列表', '1', '/admin/route/index', '2', 0x7B2269636F6E223A2022696E626F78222C202276697369626C65223A202266616C7365227D);
INSERT INTO `menu` VALUES ('4', '权限列表', '1', '/admin/permission/index', '2', 0x7B2269636F6E223A202268616E647368616B652D6F222C202276697369626C65223A202266616C7365227D);
INSERT INTO `menu` VALUES ('5', '分配权限', '1', '/admin/assignment/index', '2', 0x7B2269636F6E223A20226173736973746976652D6C697374656E696E672D73797374656D73222C202276697369626C65223A202266616C7365227D);
INSERT INTO `menu` VALUES ('6', '菜单列表', '1', '/admin/menu/index', '2', 0x7B2269636F6E223A20226D61702D6F222C202276697369626C65223A202266616C7365227D);
INSERT INTO `menu` VALUES ('7', '规则列表', '1', '/admin/rule/index', '2', 0x7B2269636F6E223A20226D61676E6574222C202276697369626C65223A202266616C7365227D);
INSERT INTO `menu` VALUES ('8', '用户列表', '1', '/admin/user/index', '1', 0x7B2269636F6E223A20227573657273222C202276697369626C65223A202266616C7365227D);
INSERT INTO `menu` VALUES ('9', '前台用户', null, null, null, 0x7B2269636F6E223A2022756E6976657273697479222C202276697369626C65223A202266616C7365227D);
INSERT INTO `menu` VALUES ('10', '用户列表', '9', '/user/index', null, 0x7B2269636F6E223A20227573657273222C202276697369626C65223A202266616C7365227D);
INSERT INTO `menu` VALUES ('11', '文章管理', null, null, null, null);
INSERT INTO `menu` VALUES ('12', '文章列表', '11', '/article/index', null, null);
INSERT INTO `menu` VALUES ('13', '分类列表', '11', '/article-group/index', null, null);

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1498633414');
INSERT INTO `migration` VALUES ('m140602_111327_create_menu_table', '1498633912');
INSERT INTO `migration` VALUES ('m160312_050000_create_user', '1498633912');
INSERT INTO `migration` VALUES ('m140516_214808_actionlog', '1506561803');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10', 'user123', 'wBLhaHiNt8g6L1CYXSPkd81LIkUN44z8', '$2y$13$wecEzG./2nM0gaPvdt.E..ZBDtUvppx5CWf/bkZ/4sXHa57t0cBYi', null, 'wqeqw@qq.123', '10', '1506578827', '1506665253');
INSERT INTO `user` VALUES ('11', 'ceshia', 'Ee2ayTKq-zoN_n9w4oJVZ5RgliOUCPvJ', '$2y$13$1RJx5F.Jb8Mcg2SO5snWte6nRXUpZiK1e.BBf9iXH/VfdpoXby0MG', null, 'ceshi123@qq.com', '10', '1506665299', '1506665299');
