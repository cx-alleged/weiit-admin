/*
MySQL Data Transfer
Source Host: 127.0.0.1
Source Database: weiit-admin
Target Host: 127.0.0.1
Target Database: weiit-admin
Date: 2018/9/11 ���ڶ� 10:37:06
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for system_common_logs
-- ----------------------------
DROP TABLE IF EXISTS `system_common_logs`;
CREATE TABLE `system_common_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `log_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '日志等级:0:info,1:warn,2:error',
  `content` text COMMENT '日志内容',
  `service_module` varchar(300) DEFAULT NULL COMMENT '业务模块',
  `log_name` varchar(100) DEFAULT NULL COMMENT '日志名称',
  `status` tinyint(4) DEFAULT '0' COMMENT '预留',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `shop_id` int(11) DEFAULT NULL COMMENT '所属哪个商家，对应weiit_open_shops表',
  `app_id` int(11) DEFAULT NULL COMMENT '所属哪个开发者，对应weiit_open_devoleper表',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for system_frequent_resource
-- ----------------------------
DROP TABLE IF EXISTS `system_frequent_resource`;
CREATE TABLE `system_frequent_resource` (
  `id` int(22) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `manager_id` int(22) DEFAULT NULL COMMENT '管理员id',
  `resource_id` int(22) DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='常用功能配置关系表';

-- ----------------------------
-- Table structure for system_manager
-- ----------------------------
DROP TABLE IF EXISTS `system_manager`;
CREATE TABLE `system_manager` (
  `manager_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `manager_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `account_name` varchar(50) DEFAULT NULL COMMENT '登录账户',
  `password` varchar(64) DEFAULT NULL COMMENT '登录密码',
  `description` varchar(100) DEFAULT NULL COMMENT '账户描述',
  `create_by` varchar(50) DEFAULT NULL COMMENT '账户创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `type` tinyint(2) DEFAULT '11' COMMENT '账户类型：11表示平台方，22表示代理，33表示线上商户，44表示线下商户',
  `parent_id` bigint(20) DEFAULT '-1' COMMENT '上级，-1表示超管',
  `locked` tinyint(2) DEFAULT '0' COMMENT '是否锁住登录，0表示不锁住，-1表示锁住',
  `state` tinyint(2) DEFAULT '0' COMMENT '状态,暂时未用，预留字段',
  `is_deleted` tinyint(2) DEFAULT '0' COMMENT '是否删除 0 正常 -1 以删除',
  PRIMARY KEY (`manager_id`),
  UNIQUE KEY `account_name_unique` (`account_name`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Table structure for system_manager_role
-- ----------------------------
DROP TABLE IF EXISTS `system_manager_role`;
CREATE TABLE `system_manager_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `manager_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户id',
  `role_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户与角色关联表';

-- ----------------------------
-- Table structure for system_resource
-- ----------------------------
DROP TABLE IF EXISTS `system_resource`;
CREATE TABLE `system_resource` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `resource_name` varchar(50) DEFAULT NULL COMMENT '资源名称，即后台管理菜单的名称',
  `parent_id` int(11) DEFAULT '-1' COMMENT '上级菜单id，默认-1表示一级分类',
  `resource_sign` varchar(50) DEFAULT NULL COMMENT '菜单权限访问限制,菜单可与权限结合使用(如system:insert)',
  `type` int(11) DEFAULT '1' COMMENT '菜单类型，1 左侧菜单栏菜单，2,管理员个人信息下拉菜单，3，操作权限',
  `rest_url` varchar(200) DEFAULT NULL COMMENT '资源菜单链接地址',
  `level` int(4) DEFAULT NULL COMMENT '菜单等级，暂时未用',
  `css_icon` varchar(100) DEFAULT NULL,
  `is_show` int(3) DEFAULT '0' COMMENT '是否显示，默认0显示，-1表示不显示',
  `description` varchar(200) DEFAULT NULL COMMENT '菜单描述说明',
  `state` int(11) DEFAULT '0' COMMENT '状态 ',
  `is_deleted` tinyint(2) DEFAULT '0' COMMENT '是否删除 0 正常 -1以删除',
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `role_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名',
  `role_sign` varchar(128) DEFAULT NULL COMMENT '角色标识,程序中判断使用,如"admin"',
  `parent_id` bigint(20) DEFAULT '-1' COMMENT '父id',
  `description` varchar(256) DEFAULT NULL COMMENT '角色描述,UI界面显示使用',
  `is_deleted` tinyint(2) DEFAULT '0' COMMENT '是否删除 0 正常 -1已删除',
  `create_id` int(11) DEFAULT NULL COMMENT '创建者的ID，即这个角色由谁创建',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Table structure for system_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `system_role_resource`;
CREATE TABLE `system_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '权限id',
  `resource_id` int(11) DEFAULT NULL COMMENT '拥有的菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for weiit_open_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `weiit_open_balance_log`;
CREATE TABLE `weiit_open_balance_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID，对应weiit_open_users表',
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名称',
  `balance` decimal(10,2) DEFAULT NULL COMMENT '操作金额',
  `remark` varchar(300) DEFAULT NULL COMMENT '操作备注,如‘用户充值200’',
  `type` int(1) DEFAULT NULL COMMENT '业务类型，预览字段，比如：1表示充值业务，2表示后台赠送业务。',
  `state` tinyint(2) DEFAULT NULL COMMENT '状态，默认0表示奖励金额，即正数；-1表示消耗金额，即负数。',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `shop_id` int(11) DEFAULT NULL COMMENT '所属商户ID，对应weiit_open_shops表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for weiit_open_integral_log
-- ----------------------------
DROP TABLE IF EXISTS `weiit_open_integral_log`;
CREATE TABLE `weiit_open_integral_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID，对应weiit_open_users表',
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名称',
  `integral` int(11) DEFAULT NULL COMMENT '积分数',
  `remark` varchar(300) DEFAULT NULL COMMENT '操作备注,如‘用户签到奖励20积分’',
  `type` int(1) DEFAULT NULL COMMENT '业务类型,预留字段。',
  `state` tinyint(2) DEFAULT NULL COMMENT '状态，默认0表示奖励积分，即正数；-1表示消耗积分，即负数。',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `shop_id` int(11) DEFAULT NULL COMMENT '所属商户ID，对应weiit_open_shops表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for weiit_open_user_address
-- ----------------------------
DROP TABLE IF EXISTS `weiit_open_user_address`;
CREATE TABLE `weiit_open_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID，对应weiit_open_users表',
  `user_name` varchar(45) DEFAULT NULL COMMENT '用户名，对应weiit_open_users表',
  `consignee` varchar(45) DEFAULT NULL COMMENT '收件人',
  `province_id` int(11) DEFAULT NULL COMMENT '省份id',
  `province` varchar(50) DEFAULT NULL COMMENT '省份,这里保存的是省份值，不是ID，方便快速查找。',
  `city_id` int(11) DEFAULT NULL COMMENT '城市id',
  `city` varchar(50) DEFAULT NULL COMMENT '城市,这里保存的是城市名称，不是ID',
  `district_id` int(11) DEFAULT NULL COMMENT '区县id',
  `district` varchar(50) DEFAULT NULL COMMENT '区县,这里保存的是区县名，不是ID',
  `address_detail` varchar(150) DEFAULT NULL COMMENT '详细地址,用户的详细收货地址。',
  `zip_code` varchar(45) DEFAULT NULL COMMENT '邮政编码',
  `tel` varchar(45) DEFAULT NULL COMMENT '收件人座机',
  `phone` varchar(45) DEFAULT NULL COMMENT '收件人手机',
  `is_deleted` int(11) DEFAULT '0' COMMENT '是否删除 0未删除 -1 已删除',
  `is_default` int(11) DEFAULT '-1' COMMENT '是否是默认地址0表示默认-1表示不默认',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `shop_id` int(11) DEFAULT NULL COMMENT '所属哪个店铺,对应weiit_open_shops表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for weiit_open_users
-- ----------------------------
DROP TABLE IF EXISTS `weiit_open_users`;
CREATE TABLE `weiit_open_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID，主键，自动增长',
  `user_account` varchar(45) DEFAULT NULL COMMENT '用户登录账户',
  `user_password` varchar(45) DEFAULT NULL COMMENT '用户登录密码',
  `user_name` varchar(45) DEFAULT NULL COMMENT '用户名',
  `user_nike` varchar(45) DEFAULT NULL COMMENT '用户昵称',
  `user_phone` varchar(20) DEFAULT NULL COMMENT '用户手机',
  `user_img` varchar(200) DEFAULT NULL COMMENT '用户虚拟头像',
  `user_qr_code` varchar(200) DEFAULT NULL COMMENT '用户二维码',
  `user_id_card` varchar(30) DEFAULT NULL COMMENT '用户身份证ID',
  `user_true_name` varchar(45) DEFAULT NULL COMMENT '用户真实姓名',
  `user_true_img` varchar(200) DEFAULT NULL COMMENT '用户真实头像，预留字段，今后做头像识别存储',
  `user_fingerprint` varchar(200) DEFAULT NULL COMMENT '用户指纹，预留字段，今后做指纹识别存储',
  `user_sex` tinyint(2) DEFAULT NULL COMMENT '用户性别',
  `user_email` varchar(45) DEFAULT NULL COMMENT '用户邮箱',
  `user_birthday` varchar(45) DEFAULT NULL COMMENT '用户生日',
  `region` varchar(45) DEFAULT NULL COMMENT '用户所在地区，城市-区县',
  `balance` double DEFAULT NULL COMMENT '用户余额',
  `integral` double DEFAULT NULL COMMENT '用户积分',
  `wx_union_id` varchar(45) DEFAULT NULL COMMENT '微信用户全网唯一表示',
  `wx_open_id` varchar(45) DEFAULT NULL COMMENT '微信用户所在公众号唯一表示',
  `ip` varchar(45) DEFAULT NULL COMMENT '用户注册ip',
  `mac` varchar(45) DEFAULT NULL COMMENT '设备mac地址。任何终端都有mac地址。',
  `parent_id` int(11) DEFAULT '-1' COMMENT '用户的上级,默认-1，表示没有上级',
  `is_disabled` tinyint(2) DEFAULT NULL COMMENT '用户是否被禁用，即是否是黑名单用户，0表示正常用户，-1表示黑名单被禁用的用户',
  `is_deleted` tinyint(2) DEFAULT NULL COMMENT '是否删除，0表示正常数据，-1表示被删除',
  `is_certified` tinyint(2) DEFAULT '0' COMMENT '是否实名制，0表示未实名，1表示已实名,默认0，表示未实名制。',
  `create_time` varchar(45) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(45) DEFAULT NULL COMMENT '修改时间',
  `shop_id` int(11) DEFAULT NULL COMMENT '用户所属哪个店铺,对应weiit_open_shops表',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `system_frequent_resource` VALUES ('1', '1', '3');
INSERT INTO `system_frequent_resource` VALUES ('2', '1', '4');
INSERT INTO `system_manager` VALUES ('1', 'weiit', 'weiit', 'e10adc3949ba59abbe56e057f20f883e', '平台管理员', null, '2014-07-17 12:59:08', '2018-09-06 15:40:18', '1', '-1', null, null, '0');
INSERT INTO `system_manager_role` VALUES ('1', '1', '1');
INSERT INTO `system_resource` VALUES ('1', '系统管理', '-1', 'system', '1', ' ', '1', 'icon-cog6', '0', '系统管理员', '0', '0');
INSERT INTO `system_resource` VALUES ('2', '菜单管理', '1', 'resource', '1', '/center/system/resource/index', null, 'icon-menu5', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('3', '管理员列表', '1', 'manager', '1', '/center/system/manager/list', null, ' icon-user-tie', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('4', '权限管理', '1', 'role', '1', '/center/system/role/list', null, 'icon-lock', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('5', '新增', '2', 'insert', '3', 'button1', null, 'icon-add', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('6', '删除', '2', 'delete', '3', 'button', null, 'icon-trash', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('7', '编辑', '2', 'edit', '3', 'button', null, 'icon-pencil7', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('11', '修改密码', '-1', 'editPassword', '2', '/center/manager/password', null, 'icon-key', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('12', '保存', '2', 'save', '3', 'button', null, 'icon-checkmark3', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('13', '视图加载', '2', 'view', '3', 'button', null, 'icon-table2', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('14', '新增', '3', 'insert', '3', 'button', null, 'icon-add', '0', '', '0', '0');
INSERT INTO `system_resource` VALUES ('15', '编辑', '3', 'edit', '3', 'button', null, 'icon-pencil7', '0', '', '0', '0');
INSERT INTO `system_resource` VALUES ('16', '删除', '3', 'delete', '3', 'button', null, 'icon-trash', '0', '', '0', '0');
INSERT INTO `system_resource` VALUES ('17', '保存', '3', 'save', '3', 'button', null, 'icon-checkmark3', '0', '', '0', '0');
INSERT INTO `system_resource` VALUES ('18', '视图加载', '3', 'view', '3', 'button', null, 'icon-table2', '0', '', '0', '0');
INSERT INTO `system_resource` VALUES ('19', '新增', '4', 'insert', '3', 'button', null, 'icon-add', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('20', '编辑', '4', 'edit', '3', 'button', null, 'icon-pencil7', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('21', '删除', '4', 'delete', '3', 'button', null, 'icon-trash', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('22', '保存', '4', 'save', '3', 'button', null, 'icon-checkmark3', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('23', '视图加载', '4', 'view', '3', 'button', null, 'icon-table2', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('24', '分配权限', '4', 'authorize', '3', 'button', null, 'icon-user-lock', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('25', '退出', '-1', 'logout', '2', '/center/manager/logout', null, 'icon-switch2', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('26', '显示字段', '3', 'showColumns', '3', 'button', null, 'icon-gear', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('27', '会员中心', '-1', 'user', '1', ' ', null, 'icon-file-media', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('28', '会员列表', '27', 'userList', '1', '/center/user/userList', null, 'icon-list', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('29', '编辑', '28', 'edit', '3', 'button', null, 'icon-pencil7', '0', null, '0', '0');
INSERT INTO `system_resource` VALUES ('30', '删除', '28', 'delete', '3', 'button', null, 'icon-trash', '0', null, '0', '0');
INSERT INTO `system_role` VALUES ('1', '平台角色', 'USER', '-1', '属于超级管理员', '0', '1');
INSERT INTO `system_role_resource` VALUES ('30', '1', '1');
INSERT INTO `system_role_resource` VALUES ('31', '1', '2');
INSERT INTO `system_role_resource` VALUES ('32', '1', '5');
INSERT INTO `system_role_resource` VALUES ('33', '1', '6');
INSERT INTO `system_role_resource` VALUES ('34', '1', '7');
INSERT INTO `system_role_resource` VALUES ('35', '1', '12');
INSERT INTO `system_role_resource` VALUES ('36', '1', '13');
INSERT INTO `system_role_resource` VALUES ('37', '1', '3');
INSERT INTO `system_role_resource` VALUES ('38', '1', '14');
INSERT INTO `system_role_resource` VALUES ('39', '1', '15');
INSERT INTO `system_role_resource` VALUES ('40', '1', '16');
INSERT INTO `system_role_resource` VALUES ('41', '1', '17');
INSERT INTO `system_role_resource` VALUES ('42', '1', '18');
INSERT INTO `system_role_resource` VALUES ('43', '1', '26');
INSERT INTO `system_role_resource` VALUES ('44', '1', '4');
INSERT INTO `system_role_resource` VALUES ('45', '1', '19');
INSERT INTO `system_role_resource` VALUES ('46', '1', '20');
INSERT INTO `system_role_resource` VALUES ('47', '1', '21');
INSERT INTO `system_role_resource` VALUES ('48', '1', '22');
INSERT INTO `system_role_resource` VALUES ('49', '1', '23');
INSERT INTO `system_role_resource` VALUES ('50', '1', '24');
INSERT INTO `system_role_resource` VALUES ('51', '1', '11');
INSERT INTO `system_role_resource` VALUES ('52', '1', '25');
INSERT INTO `system_role_resource` VALUES ('53', '1', '27');
INSERT INTO `system_role_resource` VALUES ('54', '1', '28');
INSERT INTO `system_role_resource` VALUES ('55', '1', '29');
INSERT INTO `system_role_resource` VALUES ('56', '1', '30');
INSERT INTO `weiit_open_balance_log` VALUES ('1', '1', '18565660736', '500.00', '充值500', '2', '0', '2017-07-07 15:10:18', '2017-07-08 15:10:22', '8');
INSERT INTO `weiit_open_balance_log` VALUES ('2', '1', '18565660736', '500.00', '充值500', '2', '0', '2018-09-06 17:40:01', '2018-09-08 17:40:04', '8');
INSERT INTO `weiit_open_integral_log` VALUES ('1', '1', '18565660736', '300', '购物建立300积分', null, '0', '2017-07-13 15:00:38', '2017-07-14 15:00:42', '8');
INSERT INTO `weiit_open_integral_log` VALUES ('2', '1', '18565660736', '390', '购物奖励390积分', null, '0', '2017-07-14 15:01:54', '2017-07-14 15:01:58', '8');
INSERT INTO `weiit_open_integral_log` VALUES ('3', '1', '18565660736', '310', '购物奖励310积分', null, '0', '2017-07-14 15:02:47', '2017-07-15 15:02:53', '8');
INSERT INTO `weiit_open_user_address` VALUES ('1', '1', '半个鼠标', '半个鼠标', null, '广东', null, '深圳', null, '龙华', '百利园物流园', '100000', '17644432123', '17644432123', '0', '0', '2017-07-14 11:52:36', '2017-07-14 11:52:36', '8');
INSERT INTO `weiit_open_user_address` VALUES ('3', '1', '张三', '张三', null, '广东', null, '深圳', null, '龙华', '锦绣江南', '210003', '18875462187', '18875462187', '0', '0', '2017-07-09 14:39:05', '2017-07-09 14:39:12', '8');
INSERT INTO `weiit_open_users` VALUES ('1', '18565660736', '123456', '微云时代', null, '18565660736', null, null, null, null, null, null, null, null, null, '深圳龙华新区', '1000', '1000', null, null, null, null, '-1', null, null, '0', '2017-07-14 10:54:01', '2018-09-06 17:47:57', '11');
INSERT INTO `weiit_open_users` VALUES ('2', '18565660736', '123456', '半个鼠标', null, '18565660736', null, null, null, null, null, null, null, null, null, '深圳龙华', '0', '0', null, null, null, null, '-1', null, null, '0', '2017-07-14 10:54:01', '2017-07-14 10:54:01', '9');
