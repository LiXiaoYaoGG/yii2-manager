/*
Navicat MySQL Data Transfer

Source Server         : 121.41.82.144
Source Server Version : 50634
Source Host           : 121.41.82.144:3306
Source Database       : info

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2017-09-26 10:31:06
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'FoFuK-WrcOayDI0_kLdRwGavKN-6mXs6', '$2y$13$JgyD3/1FaVimvH7bJg/RRuIuiQuIGYcjLwmz4bRXznUHOC4pjp8a.', 'rB40CfDESs-NPPdqX3psJcbgWkkkZgdY_1505609223', '2107898148@qq.com', '10', '1498634445', '1505609223');
INSERT INTO `admin` VALUES ('4', 'test', 'fY9HjLDJQL4MbOxAvLcFJehHZs8t8o09', '$2y$13$v2lsSwWUpUaEqQxUJN7GbegpA6VjXFAHlH66dH5LR3sCkxbypYKaK', '', 'test@qq.com', '10', '1499059753', '1499059753');
INSERT INTO `admin` VALUES ('5', 'test1', 'd4JDX3wvKfyi1KixHIeOx60dyYQ_8M_p', '$2y$13$RibepIaZVGqg6dXZ22CqpOVe/npwa0l8sKd5e6TGpxaGVVwglMnAy', null, 'test1@qq.com', '10', '1499158135', '1499158135');

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
INSERT INTO `auth_assignment` VALUES ('基础权限', '2', '1498723193');
INSERT INTO `auth_assignment` VALUES ('用户管理员', '2', '1498719871');
INSERT INTO `auth_assignment` VALUES ('管理员', '1', '1498714916');

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
INSERT INTO `auth_item` VALUES ('/*', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/admin/*', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/assignment/revoke', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/permission/assign', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/permission/create', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/permission/delete', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/permission/remove', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/role/remove', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/role/update', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/role/view', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/route/assign', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/route/create', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/route/refresh', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/route/remove', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/admin/user/activate', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/admin/user/change-password', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/admin/user/delete', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/user/login', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/user/logout', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/user/request-password-reset', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/user/reset-password', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/user/signup', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/admin/user/view', '2', null, null, null, '1502877239', '1502877239');
INSERT INTO `auth_item` VALUES ('/debug/*', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/debug/default/db-explain', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/gii/*', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/java/*', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/java/create', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/java/delete', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/java/index', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/java/update', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/java/view', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/rdp/*', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/rdp/create', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/rdp/delete', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/rdp/index', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/rdp/update', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/rdp/view', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/site/*', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/site/error', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('/site/index', '2', null, null, null, '1502877240', '1502877240');
INSERT INTO `auth_item` VALUES ('基础权限', '1', '基础权限（用户登录退出等常规权限）', null, null, '1498723143', '1498723143');
INSERT INTO `auth_item` VALUES ('普通', '1', '普通', null, null, '1498730484', '1498730484');
INSERT INTO `auth_item` VALUES ('测试权限组', '2', '权限', null, null, '1499048416', '1499048416');
INSERT INTO `auth_item` VALUES ('用户管理员', '1', '用户管理员', null, null, '1498719848', '1498719848');
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
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/assignment/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/assignment/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/assignment/assign');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/assignment/assign');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/assignment/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/assignment/index');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/assignment/revoke');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/assignment/revoke');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/assignment/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/assignment/view');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/default/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/default/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/default/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/default/index');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/menu/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/menu/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/menu/create');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/menu/create');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/menu/delete');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/menu/delete');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/menu/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/menu/index');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/menu/update');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/menu/update');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/menu/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/menu/view');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/permission/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/permission/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/permission/assign');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/permission/assign');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/permission/create');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/permission/create');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/permission/delete');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/permission/delete');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/permission/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/permission/index');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/permission/remove');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/permission/remove');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/permission/update');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/permission/update');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/permission/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/permission/view');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/role/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/role/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/role/assign');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/role/assign');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/role/create');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/role/create');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/role/delete');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/role/delete');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/role/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/role/index');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/role/remove');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/role/remove');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/role/update');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/role/update');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/role/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/role/view');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/route/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/route/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/route/assign');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/route/assign');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/route/create');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/route/create');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/route/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/route/index');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/route/refresh');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/route/refresh');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/route/remove');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/route/remove');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/rule/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/rule/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/rule/create');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/rule/create');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/rule/delete');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/rule/delete');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/rule/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/rule/index');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/rule/update');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/rule/update');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/rule/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/rule/view');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/user/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/user/activate');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/activate');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/user/change-password');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/change-password');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/user/delete');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/delete');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/user/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/index');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/user/login');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/login');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/user/logout');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/logout');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/user/request-password-reset');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/request-password-reset');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/user/reset-password');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/reset-password');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/user/signup');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/signup');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/admin/user/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/admin/user/view');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/debug/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/debug/default/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/default/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/debug/default/db-explain');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/default/db-explain');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/debug/default/download-mail');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/default/download-mail');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/debug/default/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/default/index');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/debug/default/toolbar');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/default/toolbar');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/debug/default/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/debug/default/view');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/gii/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/gii/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/gii/default/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/gii/default/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/gii/default/action');
INSERT INTO `auth_item_child` VALUES ('管理员', '/gii/default/action');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/gii/default/diff');
INSERT INTO `auth_item_child` VALUES ('管理员', '/gii/default/diff');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/gii/default/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/gii/default/index');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/gii/default/preview');
INSERT INTO `auth_item_child` VALUES ('管理员', '/gii/default/preview');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/gii/default/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/gii/default/view');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/java/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/java/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/java/create');
INSERT INTO `auth_item_child` VALUES ('管理员', '/java/create');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/java/delete');
INSERT INTO `auth_item_child` VALUES ('管理员', '/java/delete');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/java/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/java/index');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/java/update');
INSERT INTO `auth_item_child` VALUES ('管理员', '/java/update');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/java/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/java/view');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/rdp/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/rdp/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/rdp/create');
INSERT INTO `auth_item_child` VALUES ('管理员', '/rdp/create');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/rdp/delete');
INSERT INTO `auth_item_child` VALUES ('管理员', '/rdp/delete');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/rdp/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/rdp/index');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/rdp/update');
INSERT INTO `auth_item_child` VALUES ('管理员', '/rdp/update');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/rdp/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '/rdp/view');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/site/*');
INSERT INTO `auth_item_child` VALUES ('管理员', '/site/*');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/site/error');
INSERT INTO `auth_item_child` VALUES ('管理员', '/site/error');
INSERT INTO `auth_item_child` VALUES ('测试权限组', '/site/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '/site/index');
INSERT INTO `auth_item_child` VALUES ('管理员', '基础权限');
INSERT INTO `auth_item_child` VALUES ('管理员', '普通');
INSERT INTO `auth_item_child` VALUES ('管理员', '测试权限组');
INSERT INTO `auth_item_child` VALUES ('管理员', '用户管理员');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

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
INSERT INTO `menu` VALUES ('9', '数据资料', null, null, '2', 0x7B2269636F6E223A2022736C6964657368617265222C202276697369626C65223A202266616C7365227D);
INSERT INTO `menu` VALUES ('10', '远程桌面', '9', '/rdp/index', '2', 0x7B2269636F6E223A2022757365722D6F222C202276697369626C65223A202266616C7365227D);
INSERT INTO `menu` VALUES ('11', '漏洞地址', '9', '/java/index', '2', 0x7B2269636F6E223A2022726562656C222C202276697369626C65223A202266616C7365227D);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'FoFuK-WrcOayDI0_kLdRwGavKN-6mXs6', '$2y$13$KkE/FXcLBT3CzzPN6uMQu.56PtiVySSufmU0i/UAWEXuXWcEMunLu', '3mAzAggYHd-ylXAs9HFqZmXRNFkhjGqI_1499149806', '2107898148@qq.com', '10', '1498634445', '1499149806');
INSERT INTO `user` VALUES ('3', 'www', 'oa3knC7YyYafE5qKxWI2nqZrV3HtYWzf', '$2y$13$OgO5r3GkAPmx6v31NDArrOS2lywshU7TTEGMRmTsM4NoFgXzKsOoK', null, '123456@qq.com', '10', '1503628960', '1503628960');
INSERT INTO `user` VALUES ('4', 'eee', 'gk0uduReP2blHk0K4OEuHvl4r5nrgnRR', '$2y$13$PJidqKnIbxn0wYI75guEC.mfu50FjhEhtaG3BgJVN4/O0H8dfCcIS', null, 'eee@qq.com', '10', '1503628991', '1503628991');
