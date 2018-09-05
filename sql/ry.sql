/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50138
Source Host           : localhost:3306
Source Database       : ry

Target Server Type    : MYSQL
Target Server Version : 50138
File Encoding         : 65001

Date: 2018-09-01 09:41:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for custinfo
-- ----------------------------
DROP TABLE IF EXISTS `custinfo`;
CREATE TABLE `custinfo` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(12) CHARACTER SET gbk DEFAULT '',
  `gender` varchar(2) CHARACTER SET gbk DEFAULT '',
  `age` varchar(4) DEFAULT '',
  `address` varchar(50) CHARACTER SET gbk DEFAULT '',
  `phone` varchar(11) DEFAULT '',
  `imageaddr` varchar(100) DEFAULT '',
  `status` varchar(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custinfo
-- ----------------------------
INSERT INTO `custinfo` VALUES ('1', '张三', '男', '23', '杭州', '123456', '123', '0');
INSERT INTO `custinfo` VALUES ('3', '刘正文', '男', '23', '浙江省杭州市滨江区', '13588439394', '123', '0');
INSERT INTO `custinfo` VALUES ('4', '小霞', '女', '21', '湖北省武汉市', '13547892347', '123', '1');
INSERT INTO `custinfo` VALUES ('5', '', '', '', '', '', '', '1');
INSERT INTO `custinfo` VALUES ('6', '', '', '', '', '', '', '1');
INSERT INTO `custinfo` VALUES ('7', '', '', '', '', '', '', '1');
INSERT INTO `custinfo` VALUES ('8', '李四', '2', '12', '杭州滨江区', '13522223333', '123', '0');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '0/10 * * * * ?', 'GMT+08:00');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '0/20 * * * * ?', 'GMT+08:00');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000130740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000130740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'WINDOWS-1AJ0RQQ1535710326372', '1535710344139', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '__TASK_CLASS_NAME__1', 'DEFAULT', null, '1534762090000', '-1', '5', 'PAUSED', 'CRON', '1534762084000', '0', null, '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000130740001317800);
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '__TASK_CLASS_NAME__2', 'DEFAULT', null, '1534762100000', '-1', '5', 'PAUSED', 'CRON', '1534762084000', '0', null, '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000130740001317800);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-default', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认 skin-default、蓝色 skin-blue、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT '' COMMENT '负责人',
  `phone` varchar(11) DEFAULT '' COMMENT '联系电话',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依集团', '0', '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '100', '0,100', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '100', '0,100', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '100', '0,100', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '研发一部', '1', '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '研发二部', '2', '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场一部', '1', '若依', '15888888888', 'ry@qq.com', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '市场二部', '2', '若依', '15888888888', 'ry@qq.com', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(500) DEFAULT '' COMMENT '样式属性',
  `list_class` varchar(500) DEFAULT '' COMMENT '回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', 'radio radio-info radio-inline', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', 'radio radio-danger radio-inline', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', 'radio radio-warning radio-inline', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', 'radio radio-info radio-inline', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', 'radio radio-danger radio-inline', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', 'radio radio-info radio-inline', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', 'radio radio-danger radio-inline', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', 'radio radio-info radio-inline', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', 'radio radio-danger radio-inline', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '是', 'Y', 'sys_yes_no', 'radio radio-info radio-inline', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '否', 'N', 'sys_yes_no', 'radio radio-danger radio-inline', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '正常', '0', 'sys_notice_status', 'radio radio-info radio-inline', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '关闭', '1', 'sys_notice_status', 'radio radio-danger radio-inline', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('18', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('21', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('22', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('23', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('24', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('25', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('26', '3', '所有', '2', 'sys_show_hide', '', '', 'Y', '0', 'admin', '2018-08-31 14:16:54', 'admin', '2018-08-31 14:17:38', '展示所有');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('6', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('8', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('9', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '0' COMMENT '计划执行错误策略（0默认 1继续 2等待 3放弃）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '0', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '0', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` text COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-20 18:48:32');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-20 20:21:14');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-20 22:26:53');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-20 22:57:32');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-20 23:04:33');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-20 23:16:31');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-20 23:22:36');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-20 23:28:35');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-20 23:30:50');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-20 23:38:06');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-20 23:53:38');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-20 23:59:35');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 00:04:34');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 00:24:19');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '退出成功', '2018-08-21 00:26:58');
INSERT INTO `sys_logininfor` VALUES ('115', 'lzw', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 00:27:12');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 00:32:20');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '1', '验证码错误', '2018-08-21 00:37:39');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '1', '验证码错误', '2018-08-21 00:37:41');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 00:37:45');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 21:11:55');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 21:46:05');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 21:46:47');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 21:55:31');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '1', '验证码错误', '2018-08-21 21:56:33');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 21:56:37');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 22:03:50');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 22:56:32');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 23:03:30');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 23:06:51');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 23:14:18');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 23:28:26');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 23:30:15');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '1', '验证码错误', '2018-08-21 23:35:35');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 23:35:39');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 23:41:26');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 23:45:32');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 23:48:18');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-21 23:51:02');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-22 00:07:26');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-22 00:14:16');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-22 00:20:05');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-22 00:31:53');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-22 00:36:54');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-22 00:49:37');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-22 00:51:52');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-22 00:57:29');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-22 17:12:05');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-30 09:06:11');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-30 11:02:13');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-30 11:08:54');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-30 12:53:01');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-30 16:23:46');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '1', '验证码错误', '2018-08-30 16:29:56');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-30 16:29:59');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-30 16:32:59');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-30 17:31:36');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-31 10:01:57');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-31 10:06:56');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '1', '验证码错误', '2018-08-31 10:09:54');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-31 10:09:56');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-31 13:34:13');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '退出成功', '2018-08-31 13:49:37');
INSERT INTO `sys_logininfor` VALUES ('163', 'lzw', '127.0.0.1', '', 'Chrome', 'Windows 7', '1', '密码输入错误1次，123456', '2018-08-31 13:49:47');
INSERT INTO `sys_logininfor` VALUES ('164', 'lzw', '127.0.0.1', '', 'Chrome', 'Windows 7', '1', '验证码错误', '2018-08-31 13:49:58');
INSERT INTO `sys_logininfor` VALUES ('165', 'lzw', '127.0.0.1', '', 'Chrome', 'Windows 7', '1', '验证码错误', '2018-08-31 13:50:01');
INSERT INTO `sys_logininfor` VALUES ('166', 'lzw', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-31 13:50:11');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-31 14:08:16');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-31 14:11:52');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '退出成功', '2018-08-31 14:12:28');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-31 14:12:30');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '退出成功', '2018-08-31 14:12:32');
INSERT INTO `sys_logininfor` VALUES ('172', 'lzw', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-31 14:12:47');
INSERT INTO `sys_logininfor` VALUES ('173', 'lzw', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '退出成功', '2018-08-31 14:15:27');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-31 14:15:30');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-31 15:21:35');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-31 16:30:07');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-31 16:33:02');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '', 'Chrome', 'Windows 7', '0', '登录成功', '2018-08-31 17:03:59');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT NULL COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) NOT NULL COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2008 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-08-21 00:06:28', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '表单构建', '3', '1', '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('113', '代码生成', '3', '2', '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('114', '系统接口', '3', '3', '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '重置密码', '100', '5', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-08-21 00:08:13', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色导出', '101', '4', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '部门查询', '103', '1', '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门新增', '103', '2', '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门修改', '103', '3', '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门删除', '103', '4', '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '岗位查询', '104', '1', '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位新增', '104', '2', '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位修改', '104', '3', '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位删除', '104', '4', '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位导出', '104', '4', '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典导出', '105', '4', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数删除', '106', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数导出', '106', '4', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '公告查询', '107', '1', '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告新增', '107', '2', '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告修改', '107', '3', '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告删除', '107', '4', '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '操作查询', '500', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作删除', '500', '2', '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '详细信息', '500', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '日志导出', '500', '3', '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '登录查询', '501', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录删除', '501', '2', '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '日志导出', '501', '2', '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '在线查询', '109', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '批量强退', '109', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '单条强退', '109', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '任务查询', '110', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务新增', '110', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务修改', '110', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务删除', '110', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '状态修改', '110', '5', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '任务导出', '110', '5', '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '生成查询', '113', '1', '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '生成代码', '113', '2', '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('2000', '个人中心', '0', '4', '', 'M', '0', '', 'fa fa-map', 'admin', '2018-08-20 22:59:22', 'admin', '2018-08-20 23:02:21', '');
INSERT INTO `sys_menu` VALUES ('2001', '客户管理', '2000', '1', '/hundsun/custinfo', 'C', '0', 'hundsun:custinfo:view', '', 'admin', '2018-08-20 23:01:00', 'admin', '2018-08-21 00:19:26', '');
INSERT INTO `sys_menu` VALUES ('2002', '客户查询', '2001', '1', '', 'F', '0', 'hundsun:custinfo:select', '', 'admin', '2018-08-21 00:17:32', 'admin', '2018-08-21 00:23:05', '');
INSERT INTO `sys_menu` VALUES ('2003', '客户新增', '2001', '2', '', 'F', '0', 'hundsun:custinfo:add', '', 'admin', '2018-08-21 22:58:31', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '正常客户显示', '2001', '3', '', 'F', '0', 'hundsun:custinfo:check', '', 'admin', '2018-08-31 13:48:51', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '客户编辑', '2001', '4', '', 'F', '0', 'hundsun:custinfo:edit', '', 'admin', '2018-08-31 16:07:48', '', null, '');
INSERT INTO `sys_menu` VALUES ('2007', '客户删除', '2001', '5', '', 'F', '0', 'hundsun:custinfo:remove', '', 'admin', '2018-08-31 16:08:23', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(2) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(500) NOT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `action` varchar(100) DEFAULT '' COMMENT '功能请求',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `channel` varchar(20) DEFAULT '' COMMENT '来源渠道（manage后台用户 mobile手机端用户 other其它）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(30) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(255) DEFAULT '' COMMENT '请求参数',
  `status` char(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'admin', '研发一部', '/system/user/add', '127.0.0.1', '', '{\"deptId\":[\"106\"],\"loginName\":[\"lzw\"],\"userName\":[\"依然范特西\"],\"password\":[\"19950724lzw\"],\"email\":[\"a1774214410@163.com\"],\"phonenumber\":[\"13588439394\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}', '0', null, '2018-08-20 21:16:41');
INSERT INTO `sys_oper_log` VALUES ('101', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发一部', '/system/menu/add', '127.0.0.1', '', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"个人中心\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-map\"],\"visible\":[\"0\"]}', '0', null, '2018-08-20 22:59:22');
INSERT INTO `sys_oper_log` VALUES ('102', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发一部', '/system/menu/add', '127.0.0.1', '', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"客户管理\"],\"url\":[\"/hundsun/custinfo\"],\"perms\":[\"hundusn:custinfo:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-08-20 23:01:00');
INSERT INTO `sys_oper_log` VALUES ('103', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发一部', '/system/role/edit', '127.0.0.1', '', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,101,1006,1007,1008,1009,1010,102,1011,1012,1013,1014,103,1015,1016,1017,1018,104,1019,1020,1021,1022,10', '0', null, '2018-08-20 23:01:33');
INSERT INTO `sys_oper_log` VALUES ('104', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发一部', '/system/menu/edit', '127.0.0.1', '', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"个人中心\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-map\"],\"visible\":[\"0\"]}', '0', null, '2018-08-20 23:02:21');
INSERT INTO `sys_oper_log` VALUES ('105', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发一部', '/system/menu/edit', '127.0.0.1', '', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"客户管理\"],\"url\":[\"/hundsun/custinfo\"],\"perms\":[\"hundsun:custinfo:view\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-08-20 23:09:45');
INSERT INTO `sys_oper_log` VALUES ('106', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发一部', '/system/menu/edit', '127.0.0.1', '', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"客户管理\"],\"url\":[\"/hundsun/custinfo\"],\"perms\":[\"hundsun:custinfo:view1\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-08-20 23:56:01');
INSERT INTO `sys_oper_log` VALUES ('107', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发一部', '/system/menu/edit', '127.0.0.1', '', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"客户管理\"],\"url\":[\"/hundsun/custinfo\"],\"perms\":[\"hundsun:custinfo:view\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-08-20 23:56:19');
INSERT INTO `sys_oper_log` VALUES ('108', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发一部', '/system/menu/edit', '127.0.0.1', '', '{\"menuId\":[\"101\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"角色管理\"],\"url\":[\"/system/role\"],\"perms\":[\"system:role:view1\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-08-21 00:06:09');
INSERT INTO `sys_oper_log` VALUES ('109', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发一部', '/system/menu/edit', '127.0.0.1', '', '{\"menuId\":[\"101\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"角色管理\"],\"url\":[\"/system/role\"],\"perms\":[\"system:role:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-08-21 00:06:28');
INSERT INTO `sys_oper_log` VALUES ('110', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发一部', '/system/menu/edit', '127.0.0.1', '', '{\"menuId\":[\"1006\"],\"parentId\":[\"101\"],\"menuType\":[\"F\"],\"menuName\":[\"角色查询\"],\"url\":[\"#\"],\"perms\":[\"system:role:list1\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-08-21 00:06:51');
INSERT INTO `sys_oper_log` VALUES ('111', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发一部', '/system/menu/edit', '127.0.0.1', '', '{\"menuId\":[\"1006\"],\"parentId\":[\"101\"],\"menuType\":[\"F\"],\"menuName\":[\"角色查询\"],\"url\":[\"#\"],\"perms\":[\"system:role:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-08-21 00:08:13');
INSERT INTO `sys_oper_log` VALUES ('112', '角色管理', '5', 'com.ruoyi.project.system.role.controller.RoleController.export()', '1', 'admin', '研发一部', '/system/role/export', '127.0.0.1', '', '{\"roleName\":[\"\"],\"roleKey\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"]}', '0', null, '2018-08-21 00:10:34');
INSERT INTO `sys_oper_log` VALUES ('113', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发一部', '/system/menu/add', '127.0.0.1', '', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"查询\"],\"url\":[\"\"],\"perms\":[\"hundsun:custinfo:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-08-21 00:17:32');
INSERT INTO `sys_oper_log` VALUES ('114', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发一部', '/system/menu/edit', '127.0.0.1', '', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"客户管理\"],\"url\":[\"/hundsun/custinfo\"],\"perms\":[\"hundsun:custinfo:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-08-21 00:19:26');
INSERT INTO `sys_oper_log` VALUES ('115', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发一部', '/system/menu/edit', '127.0.0.1', '', '{\"menuId\":[\"2002\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"客户查询\"],\"url\":[\"\"],\"perms\":[\"hundsun:custinfo:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-08-21 00:19:46');
INSERT INTO `sys_oper_log` VALUES ('116', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发一部', '/system/menu/edit', '127.0.0.1', '', '{\"menuId\":[\"2002\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"客户查询\"],\"url\":[\"\"],\"perms\":[\"hundsun:custinfo:select\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-08-21 00:23:05');
INSERT INTO `sys_oper_log` VALUES ('117', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发一部', '/system/role/edit', '127.0.0.1', '', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,101,1006,1007,1008,1009,1010,102,1011,1012,1013,1014,103,1015,1016,1017,1018,104,1019,1020,1021,1022,10', '0', null, '2018-08-21 00:25:14');
INSERT INTO `sys_oper_log` VALUES ('118', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发一部', '/system/role/edit', '127.0.0.1', '', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,101,1006,1007,1008,1009,1010,102,1011,1012,1013,1014,103,1015,1016,1017,1018,104,1019,1020,1021,1022,10', '0', null, '2018-08-21 00:25:38');
INSERT INTO `sys_oper_log` VALUES ('119', '用户管理', '2', 'com.ruoyi.project.system.user.controller.UserController.editSave()', '1', 'admin', '研发一部', '/system/user/edit', '127.0.0.1', '', '{\"userId\":[\"100\"],\"deptId\":[\"106\"],\"userName\":[\"依然范特西\"],\"email\":[\"a1774214410@163.com\"],\"phonenumber\":[\"13588439394\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}', '0', null, '2018-08-21 00:26:40');
INSERT INTO `sys_oper_log` VALUES ('120', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发一部', '/system/role/edit', '127.0.0.1', '', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,101,1006,1007,1008,1009,1010,102,1011,1012,1013,1014,103,1015,1016,1017,1018,104,1019,1020,1021,1022', '0', null, '2018-08-21 00:26:56');
INSERT INTO `sys_oper_log` VALUES ('121', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发一部', '/hundsun/system/menu/add', '127.0.0.1', '', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"客户新增\"],\"url\":[\"\"],\"perms\":[\"hundsun:custinfo:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-08-21 22:58:31');
INSERT INTO `sys_oper_log` VALUES ('122', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发一部', '/hundsun/system/role/edit', '127.0.0.1', '', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,101,1006,1007,1008,1009,1010,102,1011,1012,1013,1014,103,1015,1016,1017,1018,104,1019,1020,1021,1022,10', '0', null, '2018-08-21 22:58:46');
INSERT INTO `sys_oper_log` VALUES ('123', '岗位管理', '1', 'com.ruoyi.project.system.post.controller.PostController.addSave()', '1', 'admin', '研发一部', '/hundsun/system/post/add', '127.0.0.1', '', '{\"name\":[\"刘正文\"],\"gender\":[\"男\"],\"age\":[\"23\"],\"address\":[\"杭州\"],\"phone\":[\"13588439394\"],\"imageaddr\":[\"123\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'post_code\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.system.post.mapper.PostMapper.insertPost-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_post(                                          create_by,      create_time    )values(                                          ?,      sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'post_code\' doesn\'t have a default value\n; ]; Field \'post_code\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'post_code\' doesn\'t have a default value', '2018-08-21 23:04:35');
INSERT INTO `sys_oper_log` VALUES ('124', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"刘正文\"],\"gender\":[\"男\"],\"age\":[\"23\"],\"address\":[\"杭州\"],\"phone\":[\"13588439394\"],\"imageaddr\":[\"123\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.hundsun.custinfo.mapper.CustinfoMapper.addOne-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO custinfo(                                      ) values(                               )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; ]; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2018-08-21 23:14:37');
INSERT INTO `sys_oper_log` VALUES ('125', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"刘正文\"],\"gender\":[\"男\"],\"age\":[\"23\"],\"address\":[\"杭州\"],\"phone\":[\"13588439394\"],\"imageaddr\":[\"123\"]}', '0', null, '2018-08-21 23:16:04');
INSERT INTO `sys_oper_log` VALUES ('126', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"刘正文\"],\"gender\":[\"男\"],\"age\":[\"23\"],\"address\":[\"杭州滨江区\"],\"phone\":[\"13588439394\"],\"imageaddr\":[\"123\"]}', '0', null, '2018-08-21 23:36:12');
INSERT INTO `sys_oper_log` VALUES ('127', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"刘正文\"],\"gender\":[\"男\"],\"age\":[\"23\"],\"address\":[\"杭州滨江区\"],\"phone\":[\"13588439394\"],\"imageaddr\":[\"123\"],\"status\":[\"0\"]}', '1', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'name != null and name != ’‘\'. Cause: org.apache.ibatis.ognl.ExpressionSyntaxException: Malformed OGNL expression: name != null and name != ’‘ [org.apache.ibatis.ognl.TokenMgrError: Lexical error at line 1, column 26.  Encountered: \"\\u2019\" (8217), after : \"\"]', '2018-08-21 23:41:57');
INSERT INTO `sys_oper_log` VALUES ('128', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"刘正文\"],\"gender\":[\"男\"],\"age\":[\"23\"],\"address\":[\"杭州滨江区\"],\"phone\":[\"13588439394\"],\"imageaddr\":[\"123\"],\"status\":[\"0\"]}', '1', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'name != null and name != ’‘\'. Cause: org.apache.ibatis.ognl.ExpressionSyntaxException: Malformed OGNL expression: name != null and name != ’‘ [org.apache.ibatis.ognl.TokenMgrError: Lexical error at line 1, column 26.  Encountered: \"\\u2019\" (8217), after : \"\"]', '2018-08-21 23:45:59');
INSERT INTO `sys_oper_log` VALUES ('129', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"123\"],\"gender\":[\"123\"],\"age\":[\"123\"],\"address\":[\"123\"],\"phone\":[\"123\"],\"imageaddr\":[\"13\"],\"status\":[\"0\"]}', '1', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'name != null and name != ’‘\'. Cause: org.apache.ibatis.ognl.ExpressionSyntaxException: Malformed OGNL expression: name != null and name != ’‘ [org.apache.ibatis.ognl.TokenMgrError: Lexical error at line 1, column 26.  Encountered: \"\\u2019\" (8217), after : \"\"]', '2018-08-21 23:46:38');
INSERT INTO `sys_oper_log` VALUES ('130', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"刘正文\"],\"gender\":[\"男\"],\"age\":[\"23\"],\"address\":[\"杭州滨江区\"],\"phone\":[\"13588439394\"],\"imageaddr\":[\"123\"],\"status\":[\"0\"]}', '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') values(\n		 \n		 \'åˆ˜æ­£æ–‡\', \n		 \'ç”·\', \n		 \'23\', \n		 \'æ�­å·žæ»¨æ±ŸåŒº\', \n		 \'1\' at line 10\r\n### The error may involve com.ruoyi.project.hundsun.custinfo.mapper.CustinfoMapper.addOne-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO custinfo(          name,      gender,      age,      address,      phone,      imageaddr,      status,    ) values(        ?,     ?,     ?,     ?,     ?,     ?,     ?    )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') values(\n		 \n		 \'åˆ˜æ­£æ–‡\', \n		 \'ç”·\', \n		 \'23\', \n		 \'æ�­å·žæ»¨æ±ŸåŒº\', \n		 \'1\' at line 10\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') values(\n		 \n		 \'åˆ˜æ­£æ–‡\', \n		 \'ç”·\', \n		 \'23\', \n		 \'æ�­å·žæ»¨æ±ŸåŒº\', \n		 \'1\' at line 10', '2018-08-21 23:48:37');
INSERT INTO `sys_oper_log` VALUES ('131', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"刘正文\"],\"gender\":[\"男\"],\"age\":[\"23\"],\"address\":[\"杭州滨江区\"],\"phone\":[\"13588439394\"],\"imageaddr\":[\"123\"],\"status\":[\"0\"]}', '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') values(\n		 \n		 \'åˆ˜æ­£æ–‡\', \n		 \'ç”·\', \n		 \'23\', \n		 \'æ�­å·žæ»¨æ±ŸåŒº\', \n		 \'1\' at line 10\r\n### The error may involve com.ruoyi.project.hundsun.custinfo.mapper.CustinfoMapper.addOne-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO custinfo(          name,      gender,      age,      address,      phone,      imageaddr,      status,    ) values(        ?,     ?,     ?,     ?,     ?,     ?,     ?    )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') values(\n		 \n		 \'åˆ˜æ­£æ–‡\', \n		 \'ç”·\', \n		 \'23\', \n		 \'æ�­å·žæ»¨æ±ŸåŒº\', \n		 \'1\' at line 10\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') values(\n		 \n		 \'åˆ˜æ­£æ–‡\', \n		 \'ç”·\', \n		 \'23\', \n		 \'æ�­å·žæ»¨æ±ŸåŒº\', \n		 \'1\' at line 10', '2018-08-21 23:52:08');
INSERT INTO `sys_oper_log` VALUES ('132', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"刘正文\"],\"gender\":[\"男\"],\"age\":[\"23\"],\"address\":[\"杭州滨江区\"],\"phone\":[\"13588439394\"],\"imageaddr\":[\"123\"],\"status\":[\"1\"]}', '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') values(\n		 \n		 \'åˆ˜æ­£æ–‡\', \n		 \'ç”·\', \n		 \'23\', \n		 \'æ�­å·žæ»¨æ±ŸåŒº\', \n		 \'1\' at line 10\r\n### The error may involve com.ruoyi.project.hundsun.custinfo.mapper.CustinfoMapper.addOne-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO custinfo(          name,      gender,      age,      address,      phone,      imageaddr,      status,    ) values(        ?,     ?,     ?,     ?,     ?,     ?,     ?    )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') values(\n		 \n		 \'åˆ˜æ­£æ–‡\', \n		 \'ç”·\', \n		 \'23\', \n		 \'æ�­å·žæ»¨æ±ŸåŒº\', \n		 \'1\' at line 10\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') values(\n		 \n		 \'åˆ˜æ­£æ–‡\', \n		 \'ç”·\', \n		 \'23\', \n		 \'æ�­å·žæ»¨æ±ŸåŒº\', \n		 \'1\' at line 10', '2018-08-22 00:04:17');
INSERT INTO `sys_oper_log` VALUES ('133', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"213\"],\"gender\":[\"qwe\"],\"age\":[\"qwe\"],\"address\":[\"qwe\"],\"phone\":[\"qwe\"],\"imageaddr\":[\"qwe\"],\"status\":[\"1\"]}', '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'gender\' at row 1\r\n### The error may involve com.ruoyi.project.hundsun.custinfo.mapper.CustinfoMapper.addOne-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO custinfo(          name,      gender,      age,      address,      phone,      imageaddr,      status    ) values(        ?,     ?,     ?,     ?,     ?,     ?,     ?    )\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'gender\' at row 1\n; ]; Data truncation: Data too long for column \'gender\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'gender\' at row 1', '2018-08-22 00:07:47');
INSERT INTO `sys_oper_log` VALUES ('134', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"213\"],\"gender\":[\"q\"],\"age\":[\"qwe\"],\"address\":[\"qwe\"],\"phone\":[\"qwe\"],\"imageaddr\":[\"qwe\"],\"status\":[\"1\"]}', '0', null, '2018-08-22 00:08:38');
INSERT INTO `sys_oper_log` VALUES ('135', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"刘正文\"],\"gender\":[\"男\"],\"age\":[\"23\"],\"address\":[\"杭州滨江区\"],\"phone\":[\"13588439394\"],\"imageaddr\":[\"123\"],\"status\":[\"1\"]}', '0', null, '2018-08-22 00:09:37');
INSERT INTO `sys_oper_log` VALUES ('136', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"\"],\"gender\":[\"\"],\"age\":[\"\"],\"address\":[\"\"],\"phone\":[\"\"],\"imageaddr\":[\"\"],\"status\":[\"0\"]}', '0', null, '2018-08-22 00:14:53');
INSERT INTO `sys_oper_log` VALUES ('137', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"\"],\"gender\":[\"\"],\"age\":[\"\"],\"address\":[\"\"],\"phone\":[\"\"],\"imageaddr\":[\"\"],\"status\":[\"0\"]}', '0', null, '2018-08-22 00:15:14');
INSERT INTO `sys_oper_log` VALUES ('138', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"\"],\"gender\":[\"\"],\"age\":[\"\"],\"address\":[\"\"],\"phone\":[\"\"],\"imageaddr\":[\"\"],\"status\":[\"1\"]}', '0', null, '2018-08-22 00:15:30');
INSERT INTO `sys_oper_log` VALUES ('139', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"\"],\"gender\":[\"\"],\"age\":[\"\"],\"address\":[\"\"],\"phone\":[\"\"],\"imageaddr\":[\"\"],\"status\":[\"0\"]}', '0', null, '2018-08-22 00:32:17');
INSERT INTO `sys_oper_log` VALUES ('140', '客户新增', '1', 'com.ruoyi.project.hundsun.custinfo.controller.CustinfoController.add()', '1', 'admin', '研发一部', '/hundsun/hundsun/custinfo/add', '127.0.0.1', '', '{\"name\":[\"李四\"],\"gender\":[\"2\"],\"age\":[\"12\"],\"address\":[\"杭州滨江区\"],\"phone\":[\"13522223333\"],\"imageaddr\":[\"123\"],\"status\":[\"0\"]}', '0', null, '2018-08-22 00:58:07');
INSERT INTO `sys_oper_log` VALUES ('141', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', '1', 'admin', '研发一部', '/hundsun/tool/gen/genCode/sys_notice', '127.0.0.1', '', '{}', '1', 'name', '2018-08-30 16:48:22');
INSERT INTO `sys_oper_log` VALUES ('142', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', '1', 'admin', '研发一部', '/hundsun/tool/gen/genCode/sys_dict_data', '127.0.0.1', '', '{}', '1', 'name', '2018-08-30 16:49:30');
INSERT INTO `sys_oper_log` VALUES ('143', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发一部', '/hundsun/system/menu/add', '127.0.0.1', '', '{\"parentId\":[\"0\"],\"menuType\":[\"F\"],\"menuName\":[\"正常客户显示\"],\"url\":[\"\"],\"perms\":[\"hundsun:custinfo:check\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-08-31 13:48:08');
INSERT INTO `sys_oper_log` VALUES ('144', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发一部', '/hundsun/system/menu/remove/2004', '127.0.0.1', '', '{}', '0', null, '2018-08-31 13:48:23');
INSERT INTO `sys_oper_log` VALUES ('145', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发一部', '/hundsun/system/menu/add', '127.0.0.1', '', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"正常客户显示\"],\"url\":[\"\"],\"perms\":[\"hundsun:custinfo:check\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-08-31 13:48:51');
INSERT INTO `sys_oper_log` VALUES ('146', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发一部', '/hundsun/system/role/edit', '127.0.0.1', '', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,101,1006,1007,1008,1009,1010,102,1011,1012,1013,1014,103,1015,1016,1017,1018,104,1019,1020,1021,1022,10', '0', null, '2018-08-31 13:49:08');
INSERT INTO `sys_oper_log` VALUES ('147', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发一部', '/hundsun/system/dict/data/add', '127.0.0.1', '', '{\"dictLabel\":[\"所有\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_show_hide\"],\"cssClass\":[\"\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"dictSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-08-31 14:16:54');
INSERT INTO `sys_oper_log` VALUES ('148', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发一部', '/hundsun/system/dict/data/edit', '127.0.0.1', '', '{\"dictCode\":[\"26\"],\"dictLabel\":[\"所有\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_show_hide\"],\"cssClass\":[\"\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"dictSort\":[\"0\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-08-31 14:17:11');
INSERT INTO `sys_oper_log` VALUES ('149', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发一部', '/hundsun/system/dict/data/edit', '127.0.0.1', '', '{\"dictCode\":[\"26\"],\"dictLabel\":[\"所有\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_show_hide\"],\"cssClass\":[\"\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"dictSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"展示所有\"]}', '0', null, '2018-08-31 14:17:28');
INSERT INTO `sys_oper_log` VALUES ('150', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发一部', '/hundsun/system/dict/data/edit', '127.0.0.1', '', '{\"dictCode\":[\"26\"],\"dictLabel\":[\"所有\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_show_hide\"],\"cssClass\":[\"\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"dictSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"展示所有\"]}', '0', null, '2018-08-31 14:17:38');
INSERT INTO `sys_oper_log` VALUES ('151', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发一部', '/hundsun/system/menu/add', '127.0.0.1', '', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"客户编辑\"],\"url\":[\"\"],\"perms\":[\"hundsun:custinfo:edit\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-08-31 16:07:48');
INSERT INTO `sys_oper_log` VALUES ('152', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发一部', '/hundsun/system/menu/add', '127.0.0.1', '', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"客户删除\"],\"url\":[\"\"],\"perms\":[\"hundsun:custinfo:remove\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-08-31 16:08:23');
INSERT INTO `sys_oper_log` VALUES ('153', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发一部', '/hundsun/system/role/edit', '127.0.0.1', '', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,101,1006,1007,1008,1009,1010,102,1011,1012,1013,1014,103,1015,1016,1017,1018,104,1019,1020,1021,1022,10', '0', null, '2018-08-31 16:08:33');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-08-31 16:08:33', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-08-21 00:26:56', '普通角色');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '100');
INSERT INTO `sys_role_menu` VALUES ('1', '101');
INSERT INTO `sys_role_menu` VALUES ('1', '102');
INSERT INTO `sys_role_menu` VALUES ('1', '103');
INSERT INTO `sys_role_menu` VALUES ('1', '104');
INSERT INTO `sys_role_menu` VALUES ('1', '105');
INSERT INTO `sys_role_menu` VALUES ('1', '106');
INSERT INTO `sys_role_menu` VALUES ('1', '107');
INSERT INTO `sys_role_menu` VALUES ('1', '108');
INSERT INTO `sys_role_menu` VALUES ('1', '109');
INSERT INTO `sys_role_menu` VALUES ('1', '110');
INSERT INTO `sys_role_menu` VALUES ('1', '111');
INSERT INTO `sys_role_menu` VALUES ('1', '112');
INSERT INTO `sys_role_menu` VALUES ('1', '113');
INSERT INTO `sys_role_menu` VALUES ('1', '114');
INSERT INTO `sys_role_menu` VALUES ('1', '500');
INSERT INTO `sys_role_menu` VALUES ('1', '501');
INSERT INTO `sys_role_menu` VALUES ('1', '1000');
INSERT INTO `sys_role_menu` VALUES ('1', '1001');
INSERT INTO `sys_role_menu` VALUES ('1', '1002');
INSERT INTO `sys_role_menu` VALUES ('1', '1003');
INSERT INTO `sys_role_menu` VALUES ('1', '1004');
INSERT INTO `sys_role_menu` VALUES ('1', '1005');
INSERT INTO `sys_role_menu` VALUES ('1', '1006');
INSERT INTO `sys_role_menu` VALUES ('1', '1007');
INSERT INTO `sys_role_menu` VALUES ('1', '1008');
INSERT INTO `sys_role_menu` VALUES ('1', '1009');
INSERT INTO `sys_role_menu` VALUES ('1', '1010');
INSERT INTO `sys_role_menu` VALUES ('1', '1011');
INSERT INTO `sys_role_menu` VALUES ('1', '1012');
INSERT INTO `sys_role_menu` VALUES ('1', '1013');
INSERT INTO `sys_role_menu` VALUES ('1', '1014');
INSERT INTO `sys_role_menu` VALUES ('1', '1015');
INSERT INTO `sys_role_menu` VALUES ('1', '1016');
INSERT INTO `sys_role_menu` VALUES ('1', '1017');
INSERT INTO `sys_role_menu` VALUES ('1', '1018');
INSERT INTO `sys_role_menu` VALUES ('1', '1019');
INSERT INTO `sys_role_menu` VALUES ('1', '1020');
INSERT INTO `sys_role_menu` VALUES ('1', '1021');
INSERT INTO `sys_role_menu` VALUES ('1', '1022');
INSERT INTO `sys_role_menu` VALUES ('1', '1023');
INSERT INTO `sys_role_menu` VALUES ('1', '1024');
INSERT INTO `sys_role_menu` VALUES ('1', '1025');
INSERT INTO `sys_role_menu` VALUES ('1', '1026');
INSERT INTO `sys_role_menu` VALUES ('1', '1027');
INSERT INTO `sys_role_menu` VALUES ('1', '1028');
INSERT INTO `sys_role_menu` VALUES ('1', '1029');
INSERT INTO `sys_role_menu` VALUES ('1', '1030');
INSERT INTO `sys_role_menu` VALUES ('1', '1031');
INSERT INTO `sys_role_menu` VALUES ('1', '1032');
INSERT INTO `sys_role_menu` VALUES ('1', '1033');
INSERT INTO `sys_role_menu` VALUES ('1', '1034');
INSERT INTO `sys_role_menu` VALUES ('1', '1035');
INSERT INTO `sys_role_menu` VALUES ('1', '1036');
INSERT INTO `sys_role_menu` VALUES ('1', '1037');
INSERT INTO `sys_role_menu` VALUES ('1', '1038');
INSERT INTO `sys_role_menu` VALUES ('1', '1039');
INSERT INTO `sys_role_menu` VALUES ('1', '1040');
INSERT INTO `sys_role_menu` VALUES ('1', '1041');
INSERT INTO `sys_role_menu` VALUES ('1', '1042');
INSERT INTO `sys_role_menu` VALUES ('1', '1043');
INSERT INTO `sys_role_menu` VALUES ('1', '1044');
INSERT INTO `sys_role_menu` VALUES ('1', '1045');
INSERT INTO `sys_role_menu` VALUES ('1', '1046');
INSERT INTO `sys_role_menu` VALUES ('1', '1047');
INSERT INTO `sys_role_menu` VALUES ('1', '1048');
INSERT INTO `sys_role_menu` VALUES ('1', '1049');
INSERT INTO `sys_role_menu` VALUES ('1', '1050');
INSERT INTO `sys_role_menu` VALUES ('1', '1051');
INSERT INTO `sys_role_menu` VALUES ('1', '1052');
INSERT INTO `sys_role_menu` VALUES ('1', '1053');
INSERT INTO `sys_role_menu` VALUES ('1', '1054');
INSERT INTO `sys_role_menu` VALUES ('1', '1055');
INSERT INTO `sys_role_menu` VALUES ('1', '2000');
INSERT INTO `sys_role_menu` VALUES ('1', '2001');
INSERT INTO `sys_role_menu` VALUES ('1', '2002');
INSERT INTO `sys_role_menu` VALUES ('1', '2003');
INSERT INTO `sys_role_menu` VALUES ('1', '2005');
INSERT INTO `sys_role_menu` VALUES ('1', '2006');
INSERT INTO `sys_role_menu` VALUES ('1', '2007');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '2000');
INSERT INTO `sys_role_menu` VALUES ('2', '2001');
INSERT INTO `sys_role_menu` VALUES ('2', '2002');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(20) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '106', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2018-08-31 17:03:59', 'admin', '2018-03-16 11:33:00', 'ry', '2018-08-31 17:03:59', '管理员');
INSERT INTO `sys_user` VALUES ('2', '108', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');
INSERT INTO `sys_user` VALUES ('100', '106', 'lzw', '依然范特西', '00', 'a1774214410@163.com', '13588439394', '0', '', 'c8de6e5212c2771bac5fb6aca3e92831', 'f80b1e', '0', '0', '127.0.0.1', '2018-08-31 14:12:47', 'admin', '2018-08-20 21:16:41', 'admin', '2018-08-31 14:12:47', '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestsamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `post_id` varchar(64) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('100', '2');
INSERT INTO `sys_user_post` VALUES ('2', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('100', '2');
