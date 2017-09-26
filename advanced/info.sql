/*
Navicat MySQL Data Transfer

Source Server         : 121.41.82.144
Source Server Version : 50634
Source Host           : 121.41.82.144:3306
Source Database       : info

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2017-09-26 10:22:07
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
-- Table structure for java
-- ----------------------------
DROP TABLE IF EXISTS `java`;
CREATE TABLE `java` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '漏洞类型',
  `url` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '地址',
  `notice` text COLLATE utf8_unicode_ci COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of java
-- ----------------------------
INSERT INTO `java` VALUES ('2', 'weblogic', 'http://218.29.140.214:7001', '');
INSERT INTO `java` VALUES ('3', 'weblogic', 'http://218.29.138.114:7001', '');
INSERT INTO `java` VALUES ('4', 'jboss', 'http://114.251.150.88:9999', '16H\r\n* Ip:114.251.150.88\r\n* User: Administrator\r\n* Domain: WIN-21EHBT1UV2A\r\n* Password: huatie,!A123456');
INSERT INTO `java` VALUES ('5', 'jboss', 'http://114.55.234.130:8888/', '');
INSERT INTO `java` VALUES ('6', 'jboss', 'http://114.215.45.206:8888/', '');
INSERT INTO `java` VALUES ('7', 'jboss', 'http://114.80.224.43:8081/', '短信系统\r\n* Ip:114.80.224.43:14899\r\n\r\n* User: flashy\r\n* Domain: WIN-GTL52J8OEVU\r\n* Password: koma123!;#\r\n\r\n* User: Administrator\r\n* Domain: WIN-GTL52J8OEVU\r\n* Password: 14yhl9tAA');
INSERT INTO `java` VALUES ('8', 'jboss', 'http://114.95.239.4:7070/', '');
INSERT INTO `java` VALUES ('9', 'jboss', 'http://114.55.5.254:8001/', '* Ip:114.55.5.254:8215\r\n\r\n* User: Administrator\r\n* Domain: iZ2324ato8bZ\r\n* Password: [Whest;qaz]');
INSERT INTO `java` VALUES ('10', 'jboss', 'http://114.215.108.105:7070/', '* Ip:114.215.108.105:1880\r\n\r\n* User: Administrator\r\n* Domain: iZ28gq6lj20Z\r\n* Password: Enterbrt20161aw7');
INSERT INTO `java` VALUES ('11', 'jboss', 'http://114.231.112.245:7070', '');
INSERT INTO `java` VALUES ('12', 'jboss', 'http://114.215.83.140:8888', '* Ip:114.215.83.140\r\n\r\n* User: Administrator\r\n* Domain: iZ28u3yhr0vZ\r\n* Password: jw-779905');
INSERT INTO `java` VALUES ('13', 'jboss', 'http://114.215.65.78:8888/', '* Ip:114.215.65.78\r\n\r\n* User: Guest\r\n* Domain: iZ2811f9pbjZ\r\n* Password: nyabik\r\n\r\n* User: Administrator\r\n* Domain: iZ2811f9pbjZ\r\n* Password: Ehaicheng123;');
INSERT INTO `java` VALUES ('14', 'jboss', 'http://220.248.116.246:8080', '');
INSERT INTO `java` VALUES ('15', 'jboss', 'http://www.lbtoo.com', '* Ip:www.lbtoo.com:1880\r\n* User: Administrator\r\n* Domain: iZ0af87tprxhefZ\r\n* Password: QDqjgm201622!1d');
INSERT INTO `java` VALUES ('16', 'jboss', 'http://wanrooe.gnway.cc:1680', '');
INSERT INTO `java` VALUES ('17', 'jboss', 'http://winsure.oicp.net:7060', '使用搜索引擎关键字“欢迎使用浙大恩特客户资源管理系统”\r\n用 【schtasks /create /sc minute /mo 1 /tn \"finaltest\" /ru system /tr  \"calc.exe\"】执行定时任务运行木马\r\n');
INSERT INTO `java` VALUES ('18', 'jboss', 'http://www.shunerjie.com', '使用搜索引擎关键字“欢迎使用浙大恩特客户资源管理系统”\r\n* Ip:www.shunerjie.com:3389\r\n\r\n* User: admin\r\n* Domain: iZ23rdm0x0yZ\r\n* Password: a123456..\r\n\r\n* User: flashy\r\n* Domain: iZ23rdm0x0yZ\r\n* Password: koma123!@#\r\n\r\n* User: Administrator\r\n* Domain: iZ23rdm0x0yZ\r\n* Password: 103197JMRjmr\r\n');
INSERT INTO `java` VALUES ('19', 'jboss', 'http://www.bodywater.cn/', '使用搜索引擎关键字“欢迎使用浙大恩特客户资源管理系统”\r\n* IP:www.bodywater.cn:2688\r\n* User: Administrator\r\n* Domain: iZqhrngtdebcz3Z\r\n* Password: Sophia&791308');
INSERT INTO `java` VALUES ('20', 'jboss', 'http://oa.bodor.com:7070/', '64G 内存');
INSERT INTO `java` VALUES ('21', 'jboss', 'http://kingdomtile1.gnway.cc:7060/', '外网 里面有360');
INSERT INTO `java` VALUES ('22', 'jboss', 'http://www.yunkf100.net/', '\r\n* IP:www.yunkf100.net:8970\r\n* User: Administrator\r\n* Domain: iZwz9a6qokebflZ\r\n* Password: SZhxr2016331A7');
INSERT INTO `java` VALUES ('23', 'jboss', 'http://101.71.246.242/', '');
INSERT INTO `java` VALUES ('24', 'jboss', 'https://218.38.15.41/', '韩国jboss主机\r\n能通过代理远程链接');

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
-- Table structure for rdp
-- ----------------------------
DROP TABLE IF EXISTS `rdp`;
CREATE TABLE `rdp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ip地址',
  `port` int(5) NOT NULL COMMENT '端口',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `all_user_info` text COLLATE utf8_unicode_ci COMMENT '所有用户信息',
  `notice` text COLLATE utf8_unicode_ci COMMENT '备注',
  `type` int(5) DEFAULT NULL COMMENT '服务器类型',
  `add_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=818 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rdp
-- ----------------------------
INSERT INTO `rdp` VALUES ('3', '61.160.222.193', '2015', 'administrator', '123', null, null, '1', '2017-07-16 11:19:03');
INSERT INTO `rdp` VALUES ('4', '61.164.184.154', '2015', 'administrator', '123456', null, null, '1', '2017-07-16 11:19:03');
INSERT INTO `rdp` VALUES ('5', '218.28.0.107', '2015', 'administrator', '123456', null, null, '1', '2017-07-16 11:19:03');
INSERT INTO `rdp` VALUES ('6', '218.58.76.20', '13389', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 19:50:46');
INSERT INTO `rdp` VALUES ('7', '220.189.216.77', '13389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 19:50:46');
INSERT INTO `rdp` VALUES ('8', '222.76.49.13', '13389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 19:50:46');
INSERT INTO `rdp` VALUES ('9', '58.213.117.82', '13389', 'administrator', 'admin@123', null, null, null, '2017-07-15 19:50:46');
INSERT INTO `rdp` VALUES ('10', '58.215.3.90', '13389', 'administrator', 'admin@123', null, null, null, '2017-07-15 19:50:46');
INSERT INTO `rdp` VALUES ('11', '58.56.174.107', '13389', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 19:50:46');
INSERT INTO `rdp` VALUES ('12', '60.29.53.78', '13389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 19:50:46');
INSERT INTO `rdp` VALUES ('13', '61.131.208.43', '13389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 19:50:46');
INSERT INTO `rdp` VALUES ('14', '61.157.226.70', '13389', 'administrator', 'admin@123', null, null, null, '2017-07-15 19:50:46');
INSERT INTO `rdp` VALUES ('15', '61.50.115.102', '13389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 19:50:46');
INSERT INTO `rdp` VALUES ('16', '222.223.116.237', '13389', 'administrator', 'admin@123', null, null, null, '2017-07-15 19:50:46');
INSERT INTO `rdp` VALUES ('17', '118.123.247.185', '13389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 19:51:11');
INSERT INTO `rdp` VALUES ('18', '116.55.251.10', '13389', 'administrator', '1', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('19', '115.29.98.225', '13389', 'administrator', '111', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('20', '116.228.90.8', '13389', 'admin', 'admin', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('21', '222.175.185.194', '13389', 'administrator', '111111', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('22', '60.190.180.244', '13389', 'administrator', '123456789', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('23', '60.30.254.38', '13389', 'administrator', '123456', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('24', '119.145.137.117', '13389', 'administrator', '1', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('25', '61.172.57.171', '13389', 'admin', 'admin', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('26', '59.61.237.90', '13389', 'admin', '123456', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('27', '118.123.247.185', '13389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('28', '218.65.149.97', '13389', 'administrator', '1', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('29', '218.56.37.234', '13389', 'administrator', '11111111', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('30', '218.77.119.11', '13389', 'admin', 'admin', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('31', '61.50.115.102', '13389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('32', '211.141.127.186', '13389', 'administrator', '123456', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('33', '222.223.150.196', '13389', 'administrator', '1', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('34', '114.80.156.7', '13389', 'administrator', '1234', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('35', '112.65.242.161', '13389', 'administrator', '1234', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('36', '222.86.159.82', '13389', 'administrator', '123456', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('37', '222.223.123.141', '13389', 'administrator', '12345', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('38', '58.56.20.106', '13389', 'administrator', '123456', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('39', '202.101.116.80', '13389', 'admin', 'admin', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('40', '114.215.183.190', '13389', 'admin', 'admin', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('41', '202.107.200.131', '13389', 'administrator', '1q2w3e4r', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('42', '222.77.69.102', '13389', 'administrator', '12345678', null, null, null, '2017-07-15 19:52:59');
INSERT INTO `rdp` VALUES ('43', '60.29.53.78', '13389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 19:53:00');
INSERT INTO `rdp` VALUES ('44', '114.80.82.199', '13389', 'administrator', '123456789', null, null, null, '2017-07-15 19:53:20');
INSERT INTO `rdp` VALUES ('45', '202.100.179.159', '23389', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('46', '202.100.179.148', '23389', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('47', '202.100.179.147', '23389', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('48', '117.79.230.148', '23389', 'administrator', '2wsx@WSX', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('49', '60.191.113.182', '23389', 'administrator', '123!@#qwe', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('50', '121.8.155.226', '23389', 'administrator', 'abc123!@#', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('51', '14.18.158.106', '23389', 'administrator', 'abc123!@#', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('52', '183.62.242.34', '23389', 'administrator', 'abc123!@#', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('53', '183.63.141.170', '23389', 'administrator', 'abc123!@#', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('54', '61.136.101.228', '23389', 'administrator', '6yhn&UJM', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('55', '218.19.168.146', '23389', 'administrator', 'abc123!@#', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('56', '14.18.154.45', '23389', 'administrator', '1qaz@WSX3edc', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('57', '59.61.92.150', '23389', 'administrator', 'admin!@#123', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('58', '58.56.32.238', '23389', 'administrator', 'chenwei1123!!', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('59', '222.178.157.237', '23389', 'administrator', 'hao123.com', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('60', '125.89.17.217', '23389', 'administrator', 'abc123!@#', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('61', '222.86.159.82', '23389', 'administrator', 'admin@123', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('62', '121.33.205.118', '23389', 'administrator', '1qaz@WSX3edc', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('63', '221.10.101.31', '23389', 'administrator', 'admin@123', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('64', '221.226.39.46', '23389', 'administrator', 'admin123!@#', null, null, null, '2017-07-15 19:56:05');
INSERT INTO `rdp` VALUES ('65', '180.169.46.158', '23389', 'administrator', '123456', null, null, null, '2017-07-15 19:57:59');
INSERT INTO `rdp` VALUES ('66', '211.141.53.35', '23389', 'admin', 'admin', null, null, null, '2017-07-15 19:57:59');
INSERT INTO `rdp` VALUES ('67', '218.56.234.53', '23389', 'administrator', '123456', null, null, null, '2017-07-15 19:57:59');
INSERT INTO `rdp` VALUES ('68', '218.90.155.226', '23389', 'administrator', 'Passw0rd', null, null, null, '2017-07-15 19:57:59');
INSERT INTO `rdp` VALUES ('69', '60.190.81.92', '23389', 'administrator', '123456 ', null, null, null, '2017-07-15 19:57:59');
INSERT INTO `rdp` VALUES ('70', '116.228.98.19', '23389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 19:57:59');
INSERT INTO `rdp` VALUES ('71', '220.178.36.101', '23389', 'administrator', '123', null, null, null, '2017-07-15 19:57:59');
INSERT INTO `rdp` VALUES ('72', '110.189.109.223', '33890', 'administrator', '123456', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('73', '115.238.80.253', '33890', 'administrator', '123', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('74', '122.114.55.83', '33890', 'administrator', 'admin', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('75', '122.114.58.10', '33890', 'admin', '123456', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('76', '122.114.96.29', '33890', 'administrator', '123456', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('77', '123.131.16.238', '33890', 'administrator', '123', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('78', '211.103.216.94', '33890', 'administrator', '123456', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('79', '211.149.160.36', '33890', 'administrator', '123456', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('80', '211.149.154.133', '33890', 'admin', 'admin', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('81', '211.149.190.98', '33890', 'admin', '123456', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('82', '211.149.202.202', '33890', 'administrator', '123456', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('83', '211.149.228.214', '33890', 'administrator', '123', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('84', '218.94.6.84', '33890', 'administrator', 'password', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('85', '222.173.216.186', '33890', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('86', '221.215.137.36', '33890', 'administrator', '123456', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('87', '222.191.229.202', '33890', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('88', '221.224.89.154', '33890', 'admin', '123456', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('89', '60.174.206.23', '33890', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('90', '61.130.0.146', '33890', 'administrator', '123456', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('91', '121.8.157.233', '33890', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('92', '111.75.161.41', '33890', 'administrator', 'admin', null, null, null, '2017-07-15 19:59:03');
INSERT INTO `rdp` VALUES ('93', '221.224.195.102', '33891', 'administrator', 'hik12345+', null, null, null, '2017-07-15 20:00:10');
INSERT INTO `rdp` VALUES ('94', '220.191.224.73', '33891', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 20:00:10');
INSERT INTO `rdp` VALUES ('95', '60.29.193.194', '33891', 'administrator', 'hik12345+', null, null, null, '2017-07-15 20:00:10');
INSERT INTO `rdp` VALUES ('96', '61.157.140.16', '33891', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 20:00:10');
INSERT INTO `rdp` VALUES ('97', '113.105.101.55', '33891', 'administrator', '123', null, null, null, '2017-07-15 20:01:32');
INSERT INTO `rdp` VALUES ('98', '111.75.161.41', '33891', 'administrator', '123456', null, null, null, '2017-07-15 20:01:32');
INSERT INTO `rdp` VALUES ('99', '119.145.68.14', '33891', 'administrator', '111111', null, null, null, '2017-07-15 20:01:32');
INSERT INTO `rdp` VALUES ('100', '202.104.174.250', '33891', 'administrator', '123.com', null, null, null, '2017-07-15 20:01:32');
INSERT INTO `rdp` VALUES ('101', '221.4.215.11', '33891', 'administrator', '111111', null, null, null, '2017-07-15 20:01:32');
INSERT INTO `rdp` VALUES ('102', '218.58.195.26', '33891', 'administrator', '1', null, null, null, '2017-07-15 20:01:32');
INSERT INTO `rdp` VALUES ('103', '218.88.85.153', '33891', 'administrator', '123456', null, null, null, '2017-07-15 20:01:32');
INSERT INTO `rdp` VALUES ('104', '119.6.104.101', '33891', 'administrator', 'admin', null, null, null, '2017-07-15 20:01:32');
INSERT INTO `rdp` VALUES ('105', '218.63.116.30', '33891', 'administrator', 'aaa', null, null, null, '2017-07-15 20:01:32');
INSERT INTO `rdp` VALUES ('106', '61.142.177.162', '33891', 'admin', 'admin', null, null, null, '2017-07-15 20:01:32');
INSERT INTO `rdp` VALUES ('107', '58.211.62.114', '33891', 'admin', '123', null, null, null, '2017-07-15 20:01:32');
INSERT INTO `rdp` VALUES ('108', '117.41.187.140', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('109', '117.41.183.220', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('110', '117.41.185.244', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('111', '117.41.183.211', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('112', '117.41.183.190', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('113', '117.41.186.31', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('114', '117.41.183.224', '2015', 'administrator', '123456', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('115', '117.41.187.45', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('116', '122.193.108.54', '2015', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('117', '139.159.35.50', '2015', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('118', '218.28.0.107', '2015', 'administrator', '123456', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('119', '222.186.25.177', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('120', '222.186.25.144', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('121', '222.186.27.120', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('122', '222.186.27.140', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('123', '222.186.23.100', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('124', '222.186.26.84', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('125', '222.186.26.124', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('126', '222.186.25.176', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('127', '60.169.80.94', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('128', '60.169.80.94', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('129', '61.160.211.62', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('130', '61.160.221.176', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('131', '61.164.184.154', '2015', 'administrator', '123456', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('132', '219.145.168.141', '2015', 'administrator', 'admin', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('133', '222.186.27.252', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('134', '222.186.27.43', '2015', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:54:25');
INSERT INTO `rdp` VALUES ('135', '111.204.193.81', '13389', 'admin', 'admin', null, null, null, '2017-07-15 20:55:50');
INSERT INTO `rdp` VALUES ('136', '115.29.109.73', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:50');
INSERT INTO `rdp` VALUES ('137', '118.123.247.185', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:50');
INSERT INTO `rdp` VALUES ('138', '118.144.41.181', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:50');
INSERT INTO `rdp` VALUES ('139', '118.26.64.50', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:50');
INSERT INTO `rdp` VALUES ('140', '119.57.110.205', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:50');
INSERT INTO `rdp` VALUES ('141', '122.141.234.194', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:50');
INSERT INTO `rdp` VALUES ('142', '124.160.194.113', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('143', '202.104.182.18', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('144', '203.156.242.158', '13389', 'admin', 'admin', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('145', '218.202.54.249', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('146', '218.4.176.244', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('147', '218.58.76.20', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('148', '218.89.36.139', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('149', '218.91.51.10', '13389', 'admin', 'admin', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('150', '219.146.14.41', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('151', '218.77.119.11', '13389', 'admin', 'admin', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('152', '218.4.173.34', '13389', 'admin', 'admin', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('153', '222.171.72.113', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('154', '222.222.38.42', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('155', '222.223.123.141', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('156', '223.112.75.52', '13389', 'admin', 'admin', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('157', '27.17.54.138', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('158', '43.243.60.75', '13389', 'admin', 'admin', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('159', '60.166.62.162', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('160', '60.216.1.170', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('161', '60.175.224.158', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('162', '60.30.254.38', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('163', '61.187.87.8', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('164', '69.165.166.229', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('165', '61.172.57.171', '13389', 'admin', 'admin', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('166', '203.88.210.39', '13389', 'admin', 'admin', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('167', '61.163.192.222', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('168', '114.215.183.190', '13389', 'admin', 'admin', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('169', '218.6.55.46', '13389', 'admin', 'admin', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('170', '220.165.9.204', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('171', '220.178.37.7', '13389', 'administrator', 'administrator', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('172', '203.88.210.38', '13389', 'admin', 'admin', null, null, null, '2017-07-15 20:55:51');
INSERT INTO `rdp` VALUES ('173', '101.95.130.54', '23389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 20:57:41');
INSERT INTO `rdp` VALUES ('174', '103.24.118.145', '23389', 'administrator', '123', null, null, null, '2017-07-15 20:57:41');
INSERT INTO `rdp` VALUES ('175', '111.200.195.240', '23389', 'administrator', '123456', null, null, null, '2017-07-15 20:57:41');
INSERT INTO `rdp` VALUES ('176', '113.108.137.82', '23389', 'administrator', '123qwe!@#', null, null, null, '2017-07-15 20:57:41');
INSERT INTO `rdp` VALUES ('177', '122.227.209.114', '23389', 'administrator', '123456', null, null, null, '2017-07-15 20:57:41');
INSERT INTO `rdp` VALUES ('178', '123.56.67.184', '23389', 'administrator', '1qaz@WSX', null, null, null, '2017-07-15 20:57:41');
INSERT INTO `rdp` VALUES ('179', '202.100.179.148', '23389', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 20:57:41');
INSERT INTO `rdp` VALUES ('180', '202.100.179.159', '23389', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 20:57:41');
INSERT INTO `rdp` VALUES ('181', '202.100.179.147', '23389', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 20:57:41');
INSERT INTO `rdp` VALUES ('182', '218.90.155.226', '23389', 'administrator', 'Passw0rd', null, null, null, '2017-07-15 20:57:42');
INSERT INTO `rdp` VALUES ('183', '220.178.36.101', '23389', 'administrator', '123', null, null, null, '2017-07-15 20:57:42');
INSERT INTO `rdp` VALUES ('184', '222.74.4.71', '23389', 'administrator', '1234', null, null, null, '2017-07-15 20:57:42');
INSERT INTO `rdp` VALUES ('185', '60.166.62.162', '23389', 'administrator', '123456', null, null, null, '2017-07-15 20:57:42');
INSERT INTO `rdp` VALUES ('186', '60.191.113.182', '23389', 'administrator', '123!@#qwe', null, null, null, '2017-07-15 20:57:42');
INSERT INTO `rdp` VALUES ('187', '116.228.98.19', '23389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 20:57:42');
INSERT INTO `rdp` VALUES ('188', '116.204.99.218', '23389', 'administrator', '123qwe!@#', null, null, null, '2017-07-15 20:57:42');
INSERT INTO `rdp` VALUES ('189', '61.172.254.180', '23389', 'administrator', '1qaz@WSX', null, null, null, '2017-07-15 20:57:42');
INSERT INTO `rdp` VALUES ('190', '101.95.96.118', '33389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('191', '103.15.132.42', '33389', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('192', '103.15.132.26', '33389', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('193', '103.247.165.6', '33389', 'administrator', 'password', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('194', '114.55.108.150', '33389', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('195', '117.27.89.209', '33389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('196', '120.26.53.144', '33389', 'admin', '123', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('197', '121.10.252.85', '33389', 'admin', '123', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('198', '171.8.5.8', '33389', 'administrator', '123', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('199', '183.62.199.165', '33389', 'administrator', 'admin', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('200', '202.6.154.170', '33389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('201', '218.90.156.106', '33389', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('202', '220.171.52.19', '33389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('203', '221.122.37.72', '33389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('204', '221.122.37.71', '33389', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('205', '222.187.126.74', '33389', 'administrator', 'Passw0rd', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('206', '36.110.74.86', '33389', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('207', '58.214.8.210', '33389', 'administrator', '123456', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('208', '59.125.1.83', '33389', 'administrator', '1qaz@WSX', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('209', '60.175.166.182', '33389', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('210', '60.191.113.182', '33389', 'administrator', '123!@#qwe', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('211', '61.160.201.92', '33389', 'administrator', '123qwe!@#', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('212', '101.226.176.181', '33389', 'administrator', '1qaz@WSX', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('213', '59.125.66.221', '33389', 'administrator', 'admin', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('214', '61.152.91.12', '33389', 'administrator', '1qaz@WSX', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('215', '123.126.159.152', '33389', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 20:58:54');
INSERT INTO `rdp` VALUES ('216', '103.26.251.74', '33890', 'administrator', 'Passw0rd', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('217', '111.75.161.41', '33890', 'administrator', 'admin', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('218', '111.1.126.110', '33890', 'administrator', 'admin', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('219', '111.40.226.248', '33890', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('220', '111.40.226.246', '33890', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('221', '111.40.226.245', '33890', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('222', '111.40.226.247', '33890', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('223', '113.107.137.83', '33890', 'administrator', '123456', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('224', '116.255.235.96', '33890', 'administrator', '123456', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('225', '118.122.251.6', '33890', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('226', '122.10.8.74', '33890', 'administrator', '123456', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('227', '122.224.88.34', '33890', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('228', '123.131.16.238', '33890', 'administrator', '123', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('229', '123.60.48.92', '33890', 'administrator', '123456', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('230', '192.161.81.78', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('231', '192.161.81.77', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('232', '192.161.81.74', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('233', '192.161.81.76', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('234', '192.161.81.75', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('235', '211.149.154.133', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('236', '211.149.162.219', '33890', 'administrator', '123456', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('237', '211.149.187.121', '33890', 'administrator', '123qwe!@#', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('238', '211.149.187.52', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('239', '211.155.31.50', '33890', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('240', '211.152.38.106', '33890', 'administrator', '1qaz@WSX', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('241', '218.94.6.84', '33890', 'administrator', 'password', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('242', '222.173.216.186', '33890', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('243', '222.223.3.198', '33890', 'administrator', '123456', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('244', '23.80.75.3', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('245', '23.80.75.4', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:40');
INSERT INTO `rdp` VALUES ('246', '23.80.75.11', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('247', '23.80.75.21', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('248', '23.80.75.2', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('249', '23.80.75.7', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('250', '23.80.75.10', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('251', '23.80.75.28', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('252', '23.80.75.17', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('253', '23.80.75.62', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('254', '23.80.75.9', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('255', '23.80.75.16', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('256', '23.80.75.14', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('257', '23.80.75.47', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('258', '23.80.75.6', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('259', '23.80.75.26', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('260', '23.80.75.29', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('261', '23.80.75.31', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('262', '23.80.75.24', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('263', '23.80.75.30', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('264', '23.80.75.12', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('265', '23.80.75.25', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('266', '23.80.75.15', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('267', '23.80.75.64', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('268', '23.80.75.45', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('269', '23.80.75.23', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('270', '23.80.75.54', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('271', '23.80.75.8', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('272', '23.80.75.13', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('273', '23.80.75.72', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('274', '23.80.75.5', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('275', '23.80.75.89', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('276', '23.80.75.48', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('277', '23.80.75.49', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('278', '23.80.75.86', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('279', '23.80.75.80', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('280', '23.80.75.65', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('281', '23.80.75.68', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('282', '23.80.75.76', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('283', '23.80.75.20', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('284', '23.80.75.41', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('285', '23.80.75.19', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('286', '23.80.75.108', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('287', '60.174.206.23', '33890', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('288', '61.143.33.99', '33890', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('289', '61.158.99.167', '33890', 'administrator', '123', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('290', '23.247.10.103', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('291', '23.247.10.126', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('292', '116.11.253.94', '33890', 'administrator', '!QAZ1qaz', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('293', '23.80.75.66', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('294', '23.80.75.79', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('295', '23.80.75.27', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('296', '23.80.75.46', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:41');
INSERT INTO `rdp` VALUES ('297', '23.80.75.53', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('298', '23.80.75.102', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('299', '23.80.75.60', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('300', '23.80.75.70', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('301', '23.80.75.35', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('302', '23.80.75.33', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('303', '23.80.75.43', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('304', '23.80.75.50', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('305', '23.80.75.113', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('306', '23.80.75.83', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('307', '23.80.75.44', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('308', '23.80.75.104', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('309', '23.80.75.37', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('310', '23.80.75.99', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('311', '23.80.75.101', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('312', '23.80.75.118', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('313', '23.80.75.40', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('314', '23.80.75.22', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('315', '23.80.75.51', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('316', '23.80.75.77', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('317', '23.80.75.42', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('318', '23.80.75.18', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('319', '23.80.75.124', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('320', '23.80.75.52', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('321', '23.80.75.90', '33890', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('322', '23.247.10.117', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('323', '23.247.10.105', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('324', '23.247.10.115', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('325', '23.247.10.101', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('326', '23.247.10.109', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('327', '107.179.36.112', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('328', '23.247.10.98', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('329', '23.247.10.111', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('330', '104.223.202.84', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('331', '104.223.202.89', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('332', '104.223.202.85', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('333', '104.223.209.107', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('334', '104.223.209.110', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('335', '104.223.202.70', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('336', '104.223.208.239', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('337', '104.223.209.124', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('338', '104.223.208.245', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('339', '104.223.208.254', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('340', '104.223.209.111', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('341', '104.223.202.79', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('342', '104.223.209.120', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('343', '104.223.209.104', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('344', '104.223.202.68', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('345', '104.223.208.240', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('346', '104.223.208.236', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('347', '104.223.208.234', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('348', '104.223.209.99', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:42');
INSERT INTO `rdp` VALUES ('349', '104.223.208.229', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('350', '104.223.208.242', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('351', '104.223.209.115', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('352', '104.223.209.123', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('353', '104.223.202.74', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('354', '104.223.208.231', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('355', '104.223.209.105', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('356', '104.223.209.113', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('357', '104.223.208.232', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('358', '104.223.208.227', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('359', '104.223.209.103', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('360', '104.223.208.248', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('361', '104.223.202.73', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('362', '104.223.202.75', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('363', '104.223.202.66', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('364', '104.223.208.228', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('365', '104.223.202.82', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('366', '104.223.202.76', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('367', '104.223.202.81', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('368', '104.223.209.98', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('369', '104.223.202.87', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('370', '104.223.202.72', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('371', '104.223.202.88', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:01:43');
INSERT INTO `rdp` VALUES ('372', '103.224.235.149', '33891', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 21:03:27');
INSERT INTO `rdp` VALUES ('373', '218.88.86.3', '33891', 'administrator', '123456', null, null, null, '2017-07-15 21:03:27');
INSERT INTO `rdp` VALUES ('374', '218.94.43.98', '33891', 'administrator', '123', null, null, null, '2017-07-15 21:03:27');
INSERT INTO `rdp` VALUES ('375', '220.191.224.73', '33891', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 21:03:27');
INSERT INTO `rdp` VALUES ('376', '221.192.230.90', '33891', 'administrator', 'Passw0rd', null, null, null, '2017-07-15 21:03:27');
INSERT INTO `rdp` VALUES ('377', '222.68.180.154', '33891', 'admin', 'admin', null, null, null, '2017-07-15 21:03:27');
INSERT INTO `rdp` VALUES ('378', '58.211.62.114', '33891', 'admin', '123', null, null, null, '2017-07-15 21:03:27');
INSERT INTO `rdp` VALUES ('379', '59.125.177.97', '33891', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 21:03:27');
INSERT INTO `rdp` VALUES ('380', '61.157.132.23', '33891', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 21:03:27');
INSERT INTO `rdp` VALUES ('381', '182.101.206.132', '33891', 'administrator', '123456', null, null, null, '2017-07-15 21:03:27');
INSERT INTO `rdp` VALUES ('382', '218.28.102.126', '33891', 'administrator', '123456', null, null, null, '2017-07-15 21:03:27');
INSERT INTO `rdp` VALUES ('383', '119.145.68.14', '33898', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 21:04:11');
INSERT INTO `rdp` VALUES ('384', '119.97.224.99', '33898', 'administrator', 'admin', null, null, null, '2017-07-15 21:04:11');
INSERT INTO `rdp` VALUES ('385', '123.108.109.239', '33898', 'admin', 'admin', null, null, null, '2017-07-15 21:04:11');
INSERT INTO `rdp` VALUES ('386', '59.125.32.229', '33898', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 21:04:11');
INSERT INTO `rdp` VALUES ('387', '115.238.50.218', '33898', 'admin', 'admin', null, null, null, '2017-07-15 21:04:11');
INSERT INTO `rdp` VALUES ('388', '111.206.169.30', '33899', 'administrator', '!@#123qwe', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('389', '115.29.245.77', '33899', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('390', '116.255.204.237', '33899', 'admin', 'admin', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('391', '118.193.139.160', '33899', 'administrator', '123456', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('392', '118.193.198.19', '33899', 'administrator', '123456', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('393', '119.10.4.217', '33899', 'administrator', '123456', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('394', '119.10.0.221', '33899', 'administrator', '123qwe!@#', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('395', '119.10.3.146', '33899', 'administrator', '123qwe!@#', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('396', '119.10.4.41', '33899', 'administrator', '123qwe!@#', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('397', '119.10.27.207', '33899', 'administrator', '!@#123qwe', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('398', '119.10.29.143', '33899', 'administrator', '1qaz@WSX', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('399', '119.10.46.23', '33899', 'administrator', '123qwe!@#', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('400', '119.10.51.84', '33899', 'administrator', '123qwe!@#', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('401', '119.10.51.164', '33899', 'administrator', '123qwe!@#', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('402', '119.10.50.161', '33899', 'administrator', '123qwe!@#', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('403', '119.10.53.63', '33899', 'administrator', '123qwe!@#', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('404', '119.10.57.105', '33899', 'administrator', '123qwe!@#', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('405', '119.10.58.206', '33899', 'administrator', '123qwe!@#', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('406', '119.10.67.134', '33899', 'administrator', '123!@#qwe', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('407', '122.9.45.4', '33899', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('408', '122.225.43.85', '33899', 'admin', '123456', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('409', '122.225.43.82', '33899', 'admin', '123456', null, null, null, '2017-07-15 21:06:35');
INSERT INTO `rdp` VALUES ('410', '122.225.43.83', '33899', 'admin', '123456', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('411', '122.225.43.86', '33899', 'admin', '123456', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('412', '122.225.43.84', '33899', 'admin', '123456', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('413', '171.8.71.231', '33899', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('414', '180.178.38.242', '33899', 'administrator', '123!@#qwe', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('415', '183.56.148.81', '33899', 'administrator', '1qaz@WSX', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('416', '218.2.227.86', '33899', 'administrator', '123', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('417', '220.178.76.51', '33899', 'administrator', '123', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('418', '222.173.68.166', '33899', 'administrator', '123456', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('419', '58.215.198.162', '33899', 'administrator', '123456', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('420', '61.129.251.5', '33899', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('421', '60.191.54.27', '33899', 'administrator', '123456', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('422', '61.155.202.69', '33899', 'administrator', '123qwe!@#', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('423', '61.155.173.148', '33899', 'administrator', '123456', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('424', '119.10.4.176', '33899', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('425', '119.10.53.234', '33899', 'administrator', 'qwe123!@#', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('426', '171.8.71.230', '33899', 'administrator', 'passw0rd', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('427', '222.215.68.228', '33899', 'administrator', '123456', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('428', '122.10.99.45', '33899', 'administrator', '!@#qwe123', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('429', '60.12.220.151', '33899', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('430', '218.25.161.220', '33899', 'admin', 'P@ssw0rd', null, null, null, '2017-07-15 21:06:36');
INSERT INTO `rdp` VALUES ('462', '112.65.242.161', '13389', 'administrator', '1234', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('463', '115.29.98.225', '13389', 'administrator', '000', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('464', '114.80.156.7', '13389', 'administrator', '1234', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('465', '119.145.137.117', '13389', 'administrator', '1', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('466', '221.226.18.50', '13389', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('467', '218.56.37.234', '13389', 'administrator', '11111111', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('468', '218.94.2.145', '13389', 'administrator', '1', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('469', '222.223.150.196', '13389', 'administrator', '1', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('470', '222.175.185.194', '13389', 'administrator', '111111', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('471', '202.107.200.131', '13389', 'administrator', '1q2w3e4r', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('472', '60.190.180.244', '13389', 'administrator', '123456789', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('473', '61.131.64.118', '13389', 'administrator', '123456', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('474', '211.143.128.140', '13389', 'administrator', 'ad', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('475', '61.177.28.190', '13389', 'administrator', '.', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('476', '116.228.31.106', '13389', 'administrator', 'bp', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('477', '220.179.61.131', '13389', 'administrator', 'dawning', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('478', '116.236.214.86', '13389', 'administrator', 'test1234', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('479', '58.215.18.159', '13389', 'administrator', 'root@123', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('480', '58.57.165.153', '13389', 'administrator', 'sifu@123', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('481', '60.190.19.89', '13389', 'administrator', 'ruijie', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('482', '61.132.31.15', '13389', 'administrator', 'sa123456', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('483', '218.65.251.173', '13389', 'administrator', 'uijk', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('484', '222.86.159.82', '13389', 'administrator', '123456', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('485', '222.92.212.106', '13389', 'administrator', 'qq123456', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('486', '124.93.42.91', '13389', 'administrator', '...', null, null, null, '2017-07-15 21:50:59');
INSERT INTO `rdp` VALUES ('487', '116.55.251.10', '13389', 'administrator', '1', null, null, null, '2017-07-15 21:51:00');
INSERT INTO `rdp` VALUES ('488', '221.234.52.81', '13389', 'administrator', '8888888888', null, null, null, '2017-07-15 21:51:00');
INSERT INTO `rdp` VALUES ('489', '58.220.237.168', '13389', 'administrator', 'rootroot', null, null, null, '2017-07-15 21:51:00');
INSERT INTO `rdp` VALUES ('490', '222.223.123.141', '13389', 'administrator', '12345', null, null, null, '2017-07-15 21:51:00');
INSERT INTO `rdp` VALUES ('491', '58.215.219.122', '13389', 'administrator', '~', null, null, null, '2017-07-15 21:51:00');
INSERT INTO `rdp` VALUES ('492', '110.249.70.23', '33389', 'administrator', '123', null, null, null, '2017-07-15 21:51:57');
INSERT INTO `rdp` VALUES ('493', '110.90.114.129', '33389', 'administrator', '!@#$%^', null, null, null, '2017-07-15 21:51:58');
INSERT INTO `rdp` VALUES ('494', '115.236.45.2', '33389', 'administrator', '111', null, null, null, '2017-07-15 21:51:58');
INSERT INTO `rdp` VALUES ('495', '58.216.197.146', '33389', 'administrator', '', null, null, null, '2017-07-15 21:51:58');
INSERT INTO `rdp` VALUES ('496', '61.178.66.32', '33389', 'administrator', '', null, null, null, '2017-07-15 21:51:58');
INSERT INTO `rdp` VALUES ('497', '218.5.3.206', '33389', 'administrator', '/8520', null, null, null, '2017-07-15 21:51:58');
INSERT INTO `rdp` VALUES ('498', '218.5.250.47', '33389', 'administrator', '123.com', null, null, null, '2017-07-15 21:51:58');
INSERT INTO `rdp` VALUES ('499', '183.62.241.118', '33389', 'administrator', 'admin!@#123', null, null, null, '2017-07-15 21:51:58');
INSERT INTO `rdp` VALUES ('500', '58.211.170.86', '33389', 'administrator', '8888888888', null, null, null, '2017-07-15 21:51:58');
INSERT INTO `rdp` VALUES ('501', '218.5.177.75', '33389', 'administrator', '123', null, null, null, '2017-07-15 21:51:58');
INSERT INTO `rdp` VALUES ('502', '122.224.65.102', '33389', 'administrator', 'q123456', null, null, null, '2017-07-15 21:51:58');
INSERT INTO `rdp` VALUES ('503', '123.233.207.88', '33389', 'administrator', '5', null, null, null, '2017-07-15 21:51:58');
INSERT INTO `rdp` VALUES ('504', '110.189.109.223', '33890', 'administrator', '123456', null, null, null, '2017-07-15 21:52:38');
INSERT INTO `rdp` VALUES ('505', '115.238.80.253', '33890', 'administrator', '123', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('506', '122.114.55.83', '33890', 'administrator', 'admin', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('507', '122.114.58.10', '33890', 'admin', '123456', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('508', '122.114.96.29', '33890', 'administrator', '123456', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('509', '123.131.16.238', '33890', 'administrator', '123', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('510', '211.103.216.94', '33890', 'administrator', '123456', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('511', '211.149.160.36', '33890', 'administrator', '123456', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('512', '211.149.154.133', '33890', 'admin', 'admin', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('513', '211.149.190.98', '33890', 'admin', '123456', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('514', '211.149.202.202', '33890', 'administrator', '123456', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('515', '211.149.228.214', '33890', 'administrator', '123', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('516', '218.94.6.84', '33890', 'administrator', 'password', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('517', '222.173.216.186', '33890', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('518', '221.215.137.36', '33890', 'administrator', '123456', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('519', '222.191.229.202', '33890', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('520', '221.224.89.154', '33890', 'admin', '123456', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('521', '60.174.206.23', '33890', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('522', '61.130.0.146', '33890', 'administrator', '123456', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('523', '121.8.157.233', '33890', 'administrator', 'p@ssw0rd', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('524', '111.75.161.41', '33890', 'administrator', 'admin', null, null, null, '2017-07-15 21:52:39');
INSERT INTO `rdp` VALUES ('525', '111.75.72.173', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('526', '116.11.186.169', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('527', '118.244.130.203', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('528', '118.244.158.159', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('529', '120.194.4.58', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('530', '121.11.76.118', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('531', '121.28.130.118', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('532', '211.141.155.174', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('533', '218.94.136.138', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('534', '222.188.100.70', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('535', '222.69.92.235', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('536', '58.221.19.10', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('537', '61.157.206.8', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('538', '61.185.210.74', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('539', '222.222.235.103', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('540', '61.157.206.5', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('541', '111.17.198.86', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('542', '119.6.121.77', '3389', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:55:19');
INSERT INTO `rdp` VALUES ('543', '121.28.32.34', '13389', 'administrator', '123', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('544', '112.65.242.161', '13389', 'administrator', '1234', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('545', '115.29.98.225', '13389', 'administrator', '000', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('546', '114.80.156.7', '13389', 'administrator', '1234', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('547', '119.145.137.117', '13389', 'administrator', '1', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('548', '221.226.18.50', '13389', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('549', '218.56.37.234', '13389', 'administrator', '11111111', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('550', '218.94.2.145', '13389', 'administrator', '1', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('551', '222.223.150.196', '13389', 'administrator', '1', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('552', '222.175.185.194', '13389', 'administrator', '111111', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('553', '202.107.200.131', '13389', 'administrator', '1q2w3e4r', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('554', '60.190.180.244', '13389', 'administrator', '123456789', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('555', '61.131.64.118', '13389', 'administrator', '123456', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('556', '211.143.128.140', '13389', 'administrator', 'ad', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('557', '61.177.28.190', '13389', 'administrator', '.', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('558', '116.228.31.106', '13389', 'administrator', 'bp', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('559', '220.179.61.131', '13389', 'administrator', 'dawning', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('560', '116.236.214.86', '13389', 'administrator', 'test1234', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('561', '58.215.18.159', '13389', 'administrator', 'root@123', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('562', '58.57.165.153', '13389', 'administrator', 'sifu@123', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('563', '60.190.19.89', '13389', 'administrator', 'ruijie', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('564', '61.132.31.15', '13389', 'administrator', 'sa123456', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('565', '218.65.251.173', '13389', 'administrator', 'uijk', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('566', '222.86.159.82', '13389', 'administrator', '123456', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('567', '222.92.212.106', '13389', 'administrator', 'qq123456', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('568', '124.93.42.91', '13389', 'administrator', '...', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('569', '116.55.251.10', '13389', 'administrator', '1', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('570', '221.234.52.81', '13389', 'administrator', '8888888888', null, null, null, '2017-07-15 21:56:23');
INSERT INTO `rdp` VALUES ('571', '58.220.237.168', '13389', 'administrator', 'rootroot', null, null, null, '2017-07-15 21:56:24');
INSERT INTO `rdp` VALUES ('572', '222.223.123.141', '13389', 'administrator', '12345', null, null, null, '2017-07-15 21:56:24');
INSERT INTO `rdp` VALUES ('573', '58.215.219.122', '13389', 'administrator', '~', null, null, null, '2017-07-15 21:56:24');
INSERT INTO `rdp` VALUES ('574', '110.249.70.23', '33389', 'administrator', '123', null, null, null, '2017-07-15 21:57:13');
INSERT INTO `rdp` VALUES ('575', '110.90.114.129', '33389', 'administrator', '!@#$%^', null, null, null, '2017-07-15 21:57:13');
INSERT INTO `rdp` VALUES ('576', '115.236.45.2', '33389', 'administrator', '111', null, null, null, '2017-07-15 21:57:13');
INSERT INTO `rdp` VALUES ('577', '58.216.197.146', '33389', 'administrator', '', null, null, null, '2017-07-15 21:57:13');
INSERT INTO `rdp` VALUES ('578', '61.178.66.32', '33389', 'administrator', '', null, null, null, '2017-07-15 21:57:13');
INSERT INTO `rdp` VALUES ('579', '218.5.3.206', '33389', 'administrator', '/8520', null, null, null, '2017-07-15 21:57:13');
INSERT INTO `rdp` VALUES ('580', '218.5.250.47', '33389', 'administrator', '123.com', null, null, null, '2017-07-15 21:57:13');
INSERT INTO `rdp` VALUES ('581', '183.62.241.118', '33389', 'administrator', 'admin!@#123', null, null, null, '2017-07-15 21:57:13');
INSERT INTO `rdp` VALUES ('582', '58.211.170.86', '33389', 'administrator', '8888888888', null, null, null, '2017-07-15 21:57:13');
INSERT INTO `rdp` VALUES ('583', '218.5.177.75', '33389', 'administrator', '123', null, null, null, '2017-07-15 21:57:13');
INSERT INTO `rdp` VALUES ('584', '122.224.65.102', '33389', 'administrator', 'q123456', null, null, null, '2017-07-15 21:57:13');
INSERT INTO `rdp` VALUES ('585', '123.233.207.88', '33389', 'administrator', '5', null, null, null, '2017-07-15 21:57:13');
INSERT INTO `rdp` VALUES ('586', '114.112.52.134', '33899', 'administrator', '123.com', null, null, null, '2017-07-15 21:57:53');
INSERT INTO `rdp` VALUES ('587', '125.65.114.220', '33899', 'administrator', 'password', null, null, null, '2017-07-15 21:57:53');
INSERT INTO `rdp` VALUES ('588', '125.65.114.231', '33899', 'administrator', 'password', null, null, null, '2017-07-15 21:57:53');
INSERT INTO `rdp` VALUES ('589', '180.153.239.95', '33899', 'administrator', '123.com', null, null, null, '2017-07-15 21:57:53');
INSERT INTO `rdp` VALUES ('590', '218.16.133.192', '33899', 'administrator', 'hik12345+', null, null, null, '2017-07-15 21:57:53');
INSERT INTO `rdp` VALUES ('591', '218.25.115.50', '33899', 'administrator', 'admin@123', null, null, null, '2017-07-15 21:57:53');
INSERT INTO `rdp` VALUES ('592', '58.59.133.37', '33899', 'administrator', 'admin@123', null, null, null, '2017-07-15 21:57:53');
INSERT INTO `rdp` VALUES ('593', '220.178.124.181', '33899', 'administrator', 'P@ssw0rd', null, null, null, '2017-07-15 21:57:53');
INSERT INTO `rdp` VALUES ('594', '218.25.161.220', '33899', 'admin', 'P@ssw0rd', null, null, null, '2017-07-15 21:57:53');
INSERT INTO `rdp` VALUES ('595', '106.39.10.234', '33899', 'administrator', '1q2w3e', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('596', '113.108.204.227', '33899', 'administrator', '12345678', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('597', '118.193.235.111', '33899', 'administrator', '123123', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('598', '118.193.235.108', '33899', 'administrator', '123123', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('599', '118.193.235.109', '33899', 'administrator', '123123', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('600', '118.193.235.54', '33899', 'administrator', '123321', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('601', '122.224.168.138', '33899', 'administrator', '123321', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('602', '117.27.89.168', '33899', 'admin', 'admin', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('603', '118.193.139.146', '33899', 'administrator', 'qweqwe', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('604', '125.65.114.220', '33899', 'administrator', '!', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('605', '125.65.114.231', '33899', 'administrator', '!', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('606', '211.139.200.195', '33899', 'administrator', '1234 NO', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('607', '218.2.81.69', '33899', 'administrator', '123', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('608', '218.75.190.153', '33899', 'administrator', '1', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('609', '221.215.87.203', '33899', 'administrator', '0', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('610', '220.162.4.183', '33899', 'administrator', '123456', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('611', '221.226.102.42', '33899', 'administrator', '123456', null, null, null, '2017-07-15 21:58:24');
INSERT INTO `rdp` VALUES ('612', '222.173.68.166', '33899', 'administrator', '123456', null, null, null, '2017-07-15 21:58:25');
INSERT INTO `rdp` VALUES ('613', '221.214.182.180', '33899', 'administrator', '123', null, null, null, '2017-07-15 21:58:25');
INSERT INTO `rdp` VALUES ('614', '218.75.180.54', '33899', 'administrator', 'test', null, null, null, '2017-07-15 21:58:25');
INSERT INTO `rdp` VALUES ('615', '60.191.54.27', '33899', 'administrator', '123456', null, null, null, '2017-07-15 21:58:25');
INSERT INTO `rdp` VALUES ('616', '61.146.246.28', '33899', 'administrator', 'admin', null, null, null, '2017-07-15 21:58:25');
INSERT INTO `rdp` VALUES ('617', '118.193.155.21', '33899', 'administrator', 'aaa', null, null, null, '2017-07-15 21:58:25');
INSERT INTO `rdp` VALUES ('618', '118.193.155.43', '33899', 'administrator', 'asdfghjkl', null, null, null, '2017-07-15 21:58:25');
INSERT INTO `rdp` VALUES ('619', '61.183.190.26', '33899', 'administrator', '11111111', null, null, null, '2017-07-15 21:58:25');
INSERT INTO `rdp` VALUES ('620', '58.215.198.162', '33899', 'administrator', '123456', null, null, null, '2017-07-15 21:58:25');
INSERT INTO `rdp` VALUES ('621', '118.193.235.106', '33899', 'administrator', '123456', null, null, null, '2017-07-15 21:58:25');
INSERT INTO `rdp` VALUES ('622', '121.28.32.34', '13389', 'administrator', '123', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('623', '112.65.242.161', '13389', 'administrator', '1234', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('624', '115.29.98.225', '13389', 'administrator', '000', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('625', '114.80.156.7', '13389', 'administrator', '1234', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('626', '119.145.137.117', '13389', 'administrator', '1', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('627', '221.226.18.50', '13389', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('628', '218.56.37.234', '13389', 'administrator', '11111111', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('629', '218.94.2.145', '13389', 'administrator', '1', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('630', '222.223.150.196', '13389', 'administrator', '1', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('631', '222.175.185.194', '13389', 'administrator', '111111', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('632', '202.107.200.131', '13389', 'administrator', '1q2w3e4r', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('633', '60.190.180.244', '13389', 'administrator', '123456789', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('634', '61.131.64.118', '13389', 'administrator', '123456', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('635', '211.143.128.140', '13389', 'administrator', 'ad', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('636', '61.177.28.190', '13389', 'administrator', '.', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('637', '116.228.31.106', '13389', 'administrator', 'bp', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('638', '220.179.61.131', '13389', 'administrator', 'dawning', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('639', '116.236.214.86', '13389', 'administrator', 'test1234', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('640', '58.215.18.159', '13389', 'administrator', 'root@123', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('641', '58.57.165.153', '13389', 'administrator', 'sifu@123', null, null, null, '2017-07-15 21:59:31');
INSERT INTO `rdp` VALUES ('642', '60.190.19.89', '13389', 'administrator', 'ruijie', null, null, null, '2017-07-15 21:59:32');
INSERT INTO `rdp` VALUES ('643', '61.132.31.15', '13389', 'administrator', 'sa123456', null, null, null, '2017-07-15 21:59:32');
INSERT INTO `rdp` VALUES ('644', '218.65.251.173', '13389', 'administrator', 'uijk', null, null, null, '2017-07-15 21:59:32');
INSERT INTO `rdp` VALUES ('645', '222.86.159.82', '13389', 'administrator', '123456', null, null, null, '2017-07-15 21:59:32');
INSERT INTO `rdp` VALUES ('646', '222.92.212.106', '13389', 'administrator', 'qq123456', null, null, null, '2017-07-15 21:59:32');
INSERT INTO `rdp` VALUES ('647', '124.93.42.91', '13389', 'administrator', '...', null, null, null, '2017-07-15 21:59:32');
INSERT INTO `rdp` VALUES ('648', '116.55.251.10', '13389', 'administrator', '1', null, null, null, '2017-07-15 21:59:32');
INSERT INTO `rdp` VALUES ('649', '221.234.52.81', '13389', 'administrator', '8888888888', null, null, null, '2017-07-15 21:59:32');
INSERT INTO `rdp` VALUES ('650', '58.220.237.168', '13389', 'administrator', 'rootroot', null, null, null, '2017-07-15 21:59:32');
INSERT INTO `rdp` VALUES ('651', '222.223.123.141', '13389', 'administrator', '12345', null, null, null, '2017-07-15 21:59:32');
INSERT INTO `rdp` VALUES ('652', '58.215.219.122', '13389', 'administrator', '~', null, null, null, '2017-07-15 21:59:32');
INSERT INTO `rdp` VALUES ('653', '124.225.61.122', '23389', 'administrator', '123', null, null, null, '2017-07-15 22:00:12');
INSERT INTO `rdp` VALUES ('654', '202.100.179.148', '23389', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 22:00:12');
INSERT INTO `rdp` VALUES ('655', '202.100.179.159', '23389', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 22:00:12');
INSERT INTO `rdp` VALUES ('656', '110.249.70.23', '33389', 'administrator', '123', null, null, null, '2017-07-15 22:00:40');
INSERT INTO `rdp` VALUES ('657', '110.90.114.129', '33389', 'administrator', '!@#$%^', null, null, null, '2017-07-15 22:00:40');
INSERT INTO `rdp` VALUES ('658', '115.236.45.2', '33389', 'administrator', '111', null, null, null, '2017-07-15 22:00:40');
INSERT INTO `rdp` VALUES ('659', '58.216.197.146', '33389', 'administrator', '', null, null, null, '2017-07-15 22:00:40');
INSERT INTO `rdp` VALUES ('660', '61.178.66.32', '33389', 'administrator', '', null, null, null, '2017-07-15 22:00:40');
INSERT INTO `rdp` VALUES ('661', '218.5.3.206', '33389', 'administrator', '/8520', null, null, null, '2017-07-15 22:00:40');
INSERT INTO `rdp` VALUES ('662', '218.5.250.47', '33389', 'administrator', '123.com', null, null, null, '2017-07-15 22:00:40');
INSERT INTO `rdp` VALUES ('663', '183.62.241.118', '33389', 'administrator', 'admin!@#123', null, null, null, '2017-07-15 22:00:40');
INSERT INTO `rdp` VALUES ('664', '58.211.170.86', '33389', 'administrator', '8888888888', null, null, null, '2017-07-15 22:00:40');
INSERT INTO `rdp` VALUES ('665', '218.5.177.75', '33389', 'administrator', '123', null, null, null, '2017-07-15 22:00:40');
INSERT INTO `rdp` VALUES ('666', '122.224.65.102', '33389', 'administrator', 'q123456', null, null, null, '2017-07-15 22:00:40');
INSERT INTO `rdp` VALUES ('667', '123.233.207.88', '33389', 'administrator', '5', null, null, null, '2017-07-15 22:00:40');
INSERT INTO `rdp` VALUES ('668', '113.108.204.227', '33899', 'administrator', '12345678', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('669', '114.112.52.134', '33899', 'administrator', '123.com', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('670', '114.112.52.244', '33899', 'administrator', '1qaz@WSX3edc', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('671', '114.112.52.101', '33899', 'administrator', '1qaz@WSX3edc', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('672', '106.39.10.234', '33899', 'administrator', '1q2w3e', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('673', '114.112.51.175', '33899', 'administrator', '1qaz@WSX3edc', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('674', '118.193.235.111', '33899', 'administrator', '123123', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('675', '118.193.235.109', '33899', 'administrator', '123123', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('676', '114.112.53.188', '33899', 'administrator', '1qaz@WSX3edc', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('677', '118.193.235.108', '33899', 'administrator', '123123', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('678', '118.193.235.54', '33899', 'administrator', '123321', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('679', '122.224.168.138', '33899', 'administrator', '123321', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('680', '118.186.240.139', '33899', 'administrator', '1qaz@WSX3edc', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('681', '118.186.240.31', '33899', 'administrator', '1qaz@WSX3edc', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('682', '118.186.240.76', '33899', 'administrator', '1qaz@WSX3edc', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('683', '125.65.114.220', '33899', 'administrator', '', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('684', '125.65.114.231', '33899', 'administrator', '', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('685', '114.112.51.171', '33899', 'administrator', '321654', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('686', '122.227.219.130', '33899', 'administrator', 'asd123', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('687', '211.139.200.195', '33899', 'administrator', '1234', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('688', '218.2.81.69', '33899', 'administrator', '123', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('689', '218.75.190.153', '33899', 'administrator', '1', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('690', '118.193.218.55', '33899', 'administrator', 'qweqwe', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('691', '221.226.102.42', '33899', 'administrator', '123456', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('692', '222.173.68.166', '33899', 'administrator', '123456', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('693', '118.193.218.12', '33899', 'administrator', 'qwer1234', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('694', '221.214.182.180', '33899', 'administrator', '123', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('695', '175.102.130.19', '33899', 'administrator', 'caonima', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('696', '60.191.54.27', '33899', 'administrator', '123456', null, null, null, '2017-07-15 22:01:09');
INSERT INTO `rdp` VALUES ('697', '218.75.180.54', '33899', 'administrator', 'test', null, null, null, '2017-07-15 22:01:10');
INSERT INTO `rdp` VALUES ('698', '122.227.156.18', '33899', 'administrator', 'windows', null, null, null, '2017-07-15 22:01:10');
INSERT INTO `rdp` VALUES ('699', '61.160.232.69', '33899', 'administrator', '1230.0', null, null, null, '2017-07-15 22:01:10');
INSERT INTO `rdp` VALUES ('700', '117.27.89.168', '33899', 'admin', 'admin', null, null, null, '2017-07-15 22:01:10');
INSERT INTO `rdp` VALUES ('701', '125.64.226.35', '33899', 'administrator', 'w', null, null, null, '2017-07-15 22:01:10');
INSERT INTO `rdp` VALUES ('702', '114.112.51.177', '33899', 'guest', '', null, null, null, '2017-07-15 22:01:10');
INSERT INTO `rdp` VALUES ('703', '221.215.87.203', '33899', 'administrator', '0', null, null, null, '2017-07-15 22:01:10');
INSERT INTO `rdp` VALUES ('704', '210.76.63.207', '33899', 'administrator', '147258', null, null, null, '2017-07-15 22:01:10');
INSERT INTO `rdp` VALUES ('705', '58.59.14.104', '33899', 'guest', '', null, null, null, '2017-07-15 22:01:10');
INSERT INTO `rdp` VALUES ('706', '118.193.155.43', '33899', 'administrator', 'asdfghjkl', null, null, null, '2017-07-15 22:01:10');
INSERT INTO `rdp` VALUES ('707', '60.190.132.2', '33899', 'administrator', 'admin1234', null, null, null, '2017-07-15 22:01:10');
INSERT INTO `rdp` VALUES ('708', '118.184.4.84', '33899', 'admin', 'ju', null, null, null, '2017-07-15 22:01:10');
INSERT INTO `rdp` VALUES ('709', '124.128.62.162', '33899', 'administrator', 'adminroot', null, null, null, '2017-07-15 22:01:10');
INSERT INTO `rdp` VALUES ('710', '61.178.94.80', '33899', 'administrator', '.', null, null, null, '2017-07-15 22:01:10');
INSERT INTO `rdp` VALUES ('711', '123.233.118.90', '33899', 'guest', '', null, null, null, '2017-07-15 22:01:10');
INSERT INTO `rdp` VALUES ('712', '113.200.54.6', '33890', 'Administrator', '123456', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('713', '118.122.115.106', '33890', 'Administrator', '123456', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('714', '112.253.44.6', '33890', 'Administrator', '123', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('715', '121.33.218.174', '33890', 'Administrator', '000000', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('716', '180.168.117.162', '33890', 'Administrator', 'admin', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('717', '120.42.22.60', '33890', 'Administrator', '654321', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('718', '14.18.234.36', '33890', 'Administrator', 'P@ssw0rd', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('719', '183.129.243.250', '33890', 'admin', '123456', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('720', '211.149.154.68', '33890', 'admin', 'ObrALB2B', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('721', '211.149.218.75', '33890', 'Administrator', '1qaz2wsx', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('722', '211.149.221.83', '33890', 'Administrator', '123qwe', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('723', '211.149.216.199', '33890', 'Administrator', 'hx123456', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('724', '211.149.226.138', '33890', 'Administrator', 'asd123', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('725', '211.149.227.197', '33890', 'Administrator', 'qq123456', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('726', '211.149.229.49', '33890', 'Administrator', 'admin123', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('727', '211.149.231.132', '33890', 'Administrator', 'asd123', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('728', '211.149.237.245', '33890', 'Administrator', '1qaz3edc5tgb', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('729', '211.149.239.147', '33890', 'Administrator', 'asd123', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('730', '211.149.240.50', '33890', 'Administrator', 'asd123', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('731', '211.149.235.252', '33890', 'guest', '123456aa', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('732', '211.149.243.51', '33890', 'Administrator', 'asd123', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('733', '211.149.246.55', '33890', 'Administrator', '123456', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('734', '211.149.246.51', '33890', 'Administrator', 'asd123', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('735', '211.149.246.168', '33890', 'Administrator', '123qwe!@#', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('736', '218.24.156.9', '33890', 'Administrator', '123456', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('737', '218.200.233.182', '33890', 'Administrator', '123', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('738', '218.4.45.254', '33890', 'Administrator', '1qaz2wsx', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('739', '218.28.226.98', '33890', 'Administrator', 'zhang', null, null, null, '2017-07-15 22:02:29');
INSERT INTO `rdp` VALUES ('740', '218.90.165.29', '33890', 'Administrator', '1qaz2wsx', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('741', '221.2.148.197', '33890', 'Administrator', '123456', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('742', '222.66.83.226', '33890', 'Administrator', 'admin123', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('743', '58.16.26.60', '33890', 'Administrator', '123456', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('744', '60.10.202.221', '33890', 'Administrator', '123456', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('745', '59.61.237.90', '33890', 'Administrator', '123', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('746', '59.57.15.178', '33890', 'Administrator', '1234567', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('747', '60.2.163.82', '33890', 'Administrator', '123456', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('748', '61.161.208.90', '33890', 'Administrator', '123456', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('749', '61.158.99.167', '33890', 'Administrator', '123', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('750', '61.189.41.162', '33890', 'Administrator', 'www.163.com', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('751', '211.149.174.151', '33890', 'Administrator', '1qaz2wsx3edc', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('752', '211.149.191.117', '33890', 'Administrator', 'asd123', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('753', '211.149.236.164', '33890', 'Administrator', '111111', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('754', '211.149.247.237', '33890', 'Administrator', 'asd123', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('755', '221.224.89.154', '33890', 'admin', '123456', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('756', '125.64.119.210', '33890', 'Administrator', '123123', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('757', '211.149.170.223', '33890', 'Administrator', '963852', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('758', '211.149.196.228', '33890', 'Administrator', '1qaz3edc5tgb', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('759', '211.149.223.89', '33890', 'Administrator', '123456789q', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('760', '211.149.240.233', '33890', 'Administrator', 'asd123', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('761', '211.149.196.94', '33890', 'idc', 'chinaidc', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('762', '211.149.237.252', '33890', 'Administrator', 'asd123', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('763', '211.149.247.22', '33890', 'Administrator', 'asd123', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('764', '218.3.241.24', '33890', 'Administrator', '123.com', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('765', '211.149.238.249', '33890', 'Administrator', 'dg123456', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('766', '112.65.152.142', '33890', 'Administrator', '123.com', null, null, null, '2017-07-15 22:02:30');
INSERT INTO `rdp` VALUES ('767', '58.221.61.109', '33890', 'administrator', '123456', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('768', '122.224.162.174', '33890', 'administrator', '123456', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('769', '59.57.15.178', '33890', 'administrator', '1234567', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('770', '218.207.176.120', '33890', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('771', '211.149.238.150', '33890', 'administrator', '123zxc', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('772', '211.149.241.74', '33890', 'administrator', '147369', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('773', '59.61.237.93', '33890', 'administrator', '123', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('774', '221.215.137.36', '33890', 'administrator', '123456', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('775', '211.149.246.168', '33890', 'administrator', '123qwe!@#', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('776', '121.10.225.122', '33890', 'administrator', 'aa123456', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('777', '211.149.246.55', '33890', 'administrator', '123456', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('778', '220.166.0.33', '33890', 'administrator', 'aaa123', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('779', '111.1.126.110', '33890', 'administrator', 'admin', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('780', '122.10.41.11', '33890', 'administrator', 'qq123456', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('781', '121.201.5.162', '33890', 'administrator', '000', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('782', '180.168.117.162', '33890', 'administrator', 'admin', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('783', '122.10.18.21', '33890', 'administrator', 'qwe123', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('784', '123.125.32.75', '33890', 'administrator', '123.com', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('785', '103.1.43.145', '33890', 'administrator', 'woaini123', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('786', '219.148.58.74', '33890', 'administrator', 'qwer1234', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('787', '122.10.41.11', '33890', 'administrator', 'qq123456', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('788', '122.10.18.21', '33890', 'administrator', 'qwe123', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('789', '220.165.15.53', '33890', 'administrator', 'Abcd1234', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('790', '58.49.147.23', '33890', 'guest', '', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('791', '218.28.226.98', '33890', 'administrator', 'zhang', null, null, null, '2017-07-15 22:03:43');
INSERT INTO `rdp` VALUES ('792', '112.82.223.251', '33891', 'administrator', '!@#$', null, null, null, '2017-07-15 22:04:55');
INSERT INTO `rdp` VALUES ('793', '61.160.251.216', '33891', 'administrator', '!@#$', null, null, null, '2017-07-15 22:04:55');
INSERT INTO `rdp` VALUES ('794', '119.145.68.14', '33891', 'administrator', '111111', null, null, null, '2017-07-15 22:04:55');
INSERT INTO `rdp` VALUES ('795', '67.136.4.146', '33891', 'administrator', '', null, null, null, '2017-07-15 22:04:55');
INSERT INTO `rdp` VALUES ('796', '113.12.65.150', '33891', 'administrator', '123456', null, null, null, '2017-07-15 22:04:55');
INSERT INTO `rdp` VALUES ('797', '118.112.180.235', '33891', 'administrator', '1234567890', null, null, null, '2017-07-15 22:04:55');
INSERT INTO `rdp` VALUES ('798', '116.228.170.122', '33891', 'administrator', '324', null, null, null, '2017-07-15 22:04:55');
INSERT INTO `rdp` VALUES ('799', '123.131.127.141', '33891', 'administrator', '1q2w3e4r5t', null, null, null, '2017-07-15 22:04:55');
INSERT INTO `rdp` VALUES ('800', '123.131.127.153', '33891', 'administrator', '1q2w3e4r5t', null, null, null, '2017-07-15 22:04:55');
INSERT INTO `rdp` VALUES ('801', '202.109.210.161', '33891', 'administrator', 'abc123..', null, null, null, '2017-07-15 22:04:55');
INSERT INTO `rdp` VALUES ('802', '123.131.127.154', '33891', 'administrator', '1q2w3e4r5t', null, null, null, '2017-07-15 22:04:55');
INSERT INTO `rdp` VALUES ('803', '221.2.148.197', '33891', 'administrator', '123456', null, null, null, '2017-07-15 22:04:55');
INSERT INTO `rdp` VALUES ('804', '123.131.127.155', '33891', 'administrator', '1q2w3e4r5t', null, null, null, '2017-07-15 22:04:55');
INSERT INTO `rdp` VALUES ('805', '218.17.232.172', '33891', 'administrator', '123456', null, null, null, '2017-07-15 22:04:56');
INSERT INTO `rdp` VALUES ('806', '114.251.193.155', '33891', 'administrator', '123456', null, null, null, '2017-07-15 22:04:56');
INSERT INTO `rdp` VALUES ('807', '121.8.143.205', '33891', 'administrator', 'ZAQ!xsw2', null, null, null, '2017-07-15 22:04:56');
INSERT INTO `rdp` VALUES ('808', '59.173.0.86', '33891', 'administrator', 'ys123456', null, null, null, '2017-07-15 22:04:56');
INSERT INTO `rdp` VALUES ('809', '58.211.62.114', '33891', 'admin', '123', null, null, null, '2017-07-15 22:04:56');
INSERT INTO `rdp` VALUES ('810', '122.10.97.159', '33899', 'administrator', '!QAZ2wsx', null, null, null, '2017-07-15 22:05:27');
INSERT INTO `rdp` VALUES ('811', '103.22.189.60', '33899', 'administrator', '123456', null, null, null, '2017-07-15 22:05:27');
INSERT INTO `rdp` VALUES ('812', '223.255.31.17', '33899', 'administrator', '000000', null, null, null, '2017-07-15 22:05:27');
INSERT INTO `rdp` VALUES ('813', '122.10.99.117', '33899', 'administrator', '1qaz@WSX3edc', null, null, null, '2017-07-15 22:05:27');
INSERT INTO `rdp` VALUES ('814', '122.10.99.89', '33899', 'administrator', '1qaz@WSX3edc', null, null, null, '2017-07-15 22:05:27');
INSERT INTO `rdp` VALUES ('815', '122.10.97.222', '33899', 'administrator', '1qaz@WSX3edc', null, null, null, '2017-07-15 22:05:27');
INSERT INTO `rdp` VALUES ('816', '122.10.91.253', '33899', 'administrator', 'panshi371', null, null, null, '2017-07-15 22:05:27');

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
