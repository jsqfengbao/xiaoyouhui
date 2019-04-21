/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : taoliyuan

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-04-21 10:35:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for my_activity
-- ----------------------------
DROP TABLE IF EXISTS `my_activity`;
CREATE TABLE `my_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_parent_id` int(10) DEFAULT NULL COMMENT '学校ID',
  `school_id` int(10) DEFAULT NULL COMMENT '关联school表主键',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `author` varchar(32) DEFAULT NULL,
  `content` text COMMENT '活动内容',
  `link_name` varchar(32) DEFAULT NULL COMMENT '联系人',
  `link_telephone` varchar(32) DEFAULT NULL COMMENT '联系人电话',
  `activity_logo` varchar(255) DEFAULT NULL COMMENT '活动图片logo',
  `activity_time` varchar(32) DEFAULT NULL COMMENT '活动时间',
  `activity_end_time` varchar(32) DEFAULT NULL,
  `activity_place` varchar(64) DEFAULT NULL COMMENT '活动地点',
  `is_recommended` varchar(8) DEFAULT NULL COMMENT '0,不推荐，1，推荐',
  `is_delete` varchar(8) DEFAULT NULL COMMENT '0：无效，1:有效',
  `enabled` varchar(8) DEFAULT NULL COMMENT '0：无效，1：有效',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_activity
-- ----------------------------

-- ----------------------------
-- Table structure for my_activity_user
-- ----------------------------
DROP TABLE IF EXISTS `my_activity_user`;
CREATE TABLE `my_activity_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `enabled` varchar(10) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `update_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_activity_user
-- ----------------------------

-- ----------------------------
-- Table structure for my_advice
-- ----------------------------
DROP TABLE IF EXISTS `my_advice`;
CREATE TABLE `my_advice` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(10) DEFAULT NULL,
  `advice_content` text,
  `advice_type` varchar(8) DEFAULT NULL COMMENT '0,建议，1：有问必答',
  `enabled` varchar(8) DEFAULT NULL COMMENT '0：无效，1：有效',
  `create_time` varchar(32) DEFAULT NULL,
  `update_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_advice
-- ----------------------------

-- ----------------------------
-- Table structure for my_alumni_admin
-- ----------------------------
DROP TABLE IF EXISTS `my_alumni_admin`;
CREATE TABLE `my_alumni_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_parent_id` int(10) DEFAULT NULL,
  `school_id` int(10) DEFAULT NULL,
  `school_name` varchar(32) DEFAULT NULL,
  `admin_name` varchar(32) DEFAULT NULL,
  `admin_phone` varchar(32) DEFAULT NULL,
  `enabled` varchar(8) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `update_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_alumni_admin
-- ----------------------------

-- ----------------------------
-- Table structure for my_check_by_user
-- ----------------------------
DROP TABLE IF EXISTS `my_check_by_user`;
CREATE TABLE `my_check_by_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'my_user_school表的主键 相同的表示在审核同一个用户',
  `school_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '待审核用户所申请的学校id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '待审核的user_id',
  `by_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '负责审核的校友的user_id',
  `checked` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 未审核 1审核通过 -1审核未通过 审核后检查其他人二人是否审核及审核状态，然后去my_user_school更改状态及refuse_reason',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '不为0代表被管理员审核了',
  `refuse_reason` varchar(100) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_check_by_user
-- ----------------------------

-- ----------------------------
-- Table structure for my_company
-- ----------------------------
DROP TABLE IF EXISTS `my_company`;
CREATE TABLE `my_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school_parent_id` int(10) DEFAULT NULL,
  `school_id` int(10) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL COMMENT '公司名',
  `content` text,
  `description` text,
  `link1_name` varchar(32) DEFAULT NULL,
  `link1_telephone` varchar(20) DEFAULT NULL,
  `link2_telephone` varchar(32) DEFAULT NULL,
  `link2_name` varchar(20) DEFAULT NULL,
  `is_delete` varchar(8) DEFAULT NULL,
  `enabled` varchar(8) DEFAULT NULL,
  `create_time` varchar(64) DEFAULT NULL,
  `update_time` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_company
-- ----------------------------

-- ----------------------------
-- Table structure for my_forum_comment
-- ----------------------------
DROP TABLE IF EXISTS `my_forum_comment`;
CREATE TABLE `my_forum_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL COMMENT '帖子ID',
  `user_id` int(11) NOT NULL COMMENT '评论人ID',
  `content` varchar(255) NOT NULL COMMENT '评论内容',
  `floor` int(11) NOT NULL DEFAULT '0' COMMENT '楼层',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '对某个评论的回复的评论id',
  `reply_num` int(11) NOT NULL DEFAULT '0' COMMENT '回复数',
  `zan_num` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `to_user_id` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_forum_comment
-- ----------------------------

-- ----------------------------
-- Table structure for my_forum_comment_zan_user
-- ----------------------------
DROP TABLE IF EXISTS `my_forum_comment_zan_user`;
CREATE TABLE `my_forum_comment_zan_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1点赞 0 取消赞',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='评论赞与点赞用户关联';

-- ----------------------------
-- Records of my_forum_comment_zan_user
-- ----------------------------

-- ----------------------------
-- Table structure for my_forum_module
-- ----------------------------
DROP TABLE IF EXISTS `my_forum_module`;
CREATE TABLE `my_forum_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `module_icon` varchar(255) DEFAULT NULL,
  `click_num` int(11) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `update_time` varchar(32) DEFAULT NULL,
  `enabled` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_forum_module
-- ----------------------------

-- ----------------------------
-- Table structure for my_forum_module_subclass
-- ----------------------------
DROP TABLE IF EXISTS `my_forum_module_subclass`;
CREATE TABLE `my_forum_module_subclass` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `click_num` int(11) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `update_time` varchar(32) DEFAULT NULL,
  `enabled` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_forum_module_subclass
-- ----------------------------

-- ----------------------------
-- Table structure for my_forum_module_user
-- ----------------------------
DROP TABLE IF EXISTS `my_forum_module_user`;
CREATE TABLE `my_forum_module_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `sub_module_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `sub_module_id` (`sub_module_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_forum_module_user
-- ----------------------------

-- ----------------------------
-- Table structure for my_forum_post
-- ----------------------------
DROP TABLE IF EXISTS `my_forum_post`;
CREATE TABLE `my_forum_post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户 ID',
  `module_id` int(11) NOT NULL DEFAULT '0' COMMENT '模块 ID',
  `sub_module_id` int(11) NOT NULL DEFAULT '0' COMMENT '模块子类 ID',
  `school_parent_id` int(11) NOT NULL DEFAULT '1' COMMENT '学校id',
  `school_id` int(11) NOT NULL DEFAULT '2' COMMENT '分会id',
  `title` varchar(50) DEFAULT NULL COMMENT '帖子标题',
  `imgs` varchar(2500) DEFAULT NULL COMMENT '帖子图片链接最多9张',
  `top` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `content` text COMMENT '帖子内容',
  `view_num` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `zan_num` int(11) NOT NULL DEFAULT '0' COMMENT '点赞次数',
  `share_num` int(11) NOT NULL DEFAULT '0' COMMENT '分享次数',
  `comment_num` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_comment_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_forum_post
-- ----------------------------

-- ----------------------------
-- Table structure for my_forum_post_zan_user
-- ----------------------------
DROP TABLE IF EXISTS `my_forum_post_zan_user`;
CREATE TABLE `my_forum_post_zan_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1点赞0取消赞',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='贴子的赞与点赞用户关联';

-- ----------------------------
-- Records of my_forum_post_zan_user
-- ----------------------------

-- ----------------------------
-- Table structure for my_invite_user
-- ----------------------------
DROP TABLE IF EXISTS `my_invite_user`;
CREATE TABLE `my_invite_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `invite_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '被哪个人邀请的',
  `school_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '邀请加入的学校id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_invite_user
-- ----------------------------

-- ----------------------------
-- Table structure for my_region
-- ----------------------------
DROP TABLE IF EXISTS `my_region`;
CREATE TABLE `my_region` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_name` varchar(32) DEFAULT NULL,
  `region_code` varchar(32) DEFAULT NULL,
  `enabled` varchar(8) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `update_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_region
-- ----------------------------
INSERT INTO `my_region` VALUES ('1', '广东', '粤', '1', null, null);
INSERT INTO `my_region` VALUES ('2', '河南', '豫', '1', null, null);
INSERT INTO `my_region` VALUES ('3', '上海', '沪', '1', null, null);
INSERT INTO `my_region` VALUES ('4', '贵州', '黔', '1', '2019-01-31 15:56:52', null);
INSERT INTO `my_region` VALUES ('5', '北京', '京', '1', '2019-01-31 18:54:18', null);
INSERT INTO `my_region` VALUES ('6', '福建', '闽', '1', '2019-01-31 21:32:47', null);
INSERT INTO `my_region` VALUES ('7', '黑龙江', '黑', '1', '2019-02-01 10:16:00', null);
INSERT INTO `my_region` VALUES ('8', '四川', '川', '1', '2019-02-01 10:57:56', null);

-- ----------------------------
-- Table structure for my_school
-- ----------------------------
DROP TABLE IF EXISTS `my_school`;
CREATE TABLE `my_school` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) NOT NULL,
  `region_id` int(10) DEFAULT NULL,
  `school_name` varchar(64) NOT NULL,
  `order_num` int(10) NOT NULL COMMENT '排序号',
  `school_type` varchar(10) NOT NULL COMMENT '0：父学校,1:子学校',
  `enabled` varchar(10) DEFAULT NULL COMMENT '0：无效，1:有效',
  `create_time` varchar(32) DEFAULT NULL,
  `update_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_school
-- ----------------------------

-- ----------------------------
-- Table structure for my_school_user
-- ----------------------------
DROP TABLE IF EXISTS `my_school_user`;
CREATE TABLE `my_school_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '小程序用户id',
  `school_parent_id` int(10) NOT NULL DEFAULT '0' COMMENT '所加入学校id',
  `school_id` int(10) NOT NULL DEFAULT '0' COMMENT '所加入学校下的分会id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核状态 1是审核中 2是审核通过 3 需修改 4永久拒绝',
  `admin_id` int(11) NOT NULL DEFAULT '-1' COMMENT '负责审核的管理员Id，0代表校友推荐,-1代表尚未有管理员来审核',
  `check_type` tinyint(4) NOT NULL DEFAULT '3' COMMENT '1证书编号，2校友推荐，3人工电话审核',
  `certificate_no` varchar(30) DEFAULT NULL COMMENT '证书编号',
  `refuse_reason` varchar(255) DEFAULT NULL COMMENT '拒绝原因',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_school_user
-- ----------------------------

-- ----------------------------
-- Table structure for my_sms_code
-- ----------------------------
DROP TABLE IF EXISTS `my_sms_code`;
CREATE TABLE `my_sms_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `phone_num` varchar(20) DEFAULT NULL,
  `sms_code` varchar(16) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `used` varchar(8) DEFAULT NULL COMMENT '是否使用过。0：未使用，1已使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_sms_code
-- ----------------------------

-- ----------------------------
-- Table structure for my_user
-- ----------------------------
DROP TABLE IF EXISTS `my_user`;
CREATE TABLE `my_user` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `invite_user_id` int(11) DEFAULT NULL,
  `admin_id` int(10) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `gender` tinyint(8) DEFAULT NULL,
  `register_time` varchar(32) DEFAULT NULL,
  `last_login_time` varchar(32) DEFAULT NULL,
  `last_login_ip` varchar(32) DEFAULT NULL,
  `nickname` varchar(60) DEFAULT NULL,
  `register_ip` varchar(45) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `wx_oppenid` varchar(32) DEFAULT NULL COMMENT 'oppenid',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `telephone` varchar(32) DEFAULT NULL COMMENT '电话',
  `is_show_mobile` varchar(8) DEFAULT NULL,
  `qq` varchar(32) DEFAULT NULL COMMENT 'qq',
  `webchat` varchar(64) DEFAULT NULL COMMENT '微信号',
  `person_profile` text COMMENT '个人简介',
  `native_province` varchar(32) DEFAULT NULL COMMENT '籍贯-省',
  `native_city` varchar(32) DEFAULT NULL COMMENT '籍贯-市',
  `native_country` varchar(64) DEFAULT NULL COMMENT '籍贯-区（县）',
  `native_position` varchar(255) DEFAULT NULL COMMENT '籍贯-详细地址',
  `school_name` varchar(32) DEFAULT NULL COMMENT '高中学校',
  `education` varchar(8) DEFAULT NULL COMMENT '"0：本科，\n1：硕士，\n2：博士，\n3：博士后，\n4：教师，\n5：职工，\n6：MBA，\n7：EMBA，\n8：台湾清华，\n9：留学生"',
  `in_shool` varchar(32) DEFAULT NULL COMMENT '入学时间',
  `out_shool` varchar(32) DEFAULT NULL COMMENT '毕业时间',
  `depart` varchar(32) DEFAULT NULL COMMENT '系别',
  `major` varchar(64) DEFAULT NULL,
  `user_class` varchar(32) DEFAULT NULL COMMENT '用户班级',
  `student_no` varchar(32) DEFAULT NULL COMMENT '学号',
  `master_tutor` varchar(32) DEFAULT NULL COMMENT '硕士导师',
  `doctor_tutor` varchar(32) DEFAULT NULL COMMENT '博士导师',
  `work_location` varchar(32) DEFAULT NULL COMMENT '工作城市',
  `current_company` varchar(64) DEFAULT NULL COMMENT '所在公司',
  `industry_direction` varchar(64) DEFAULT NULL COMMENT '行业方向',
  `status` varchar(10) DEFAULT NULL COMMENT '状态',
  `job` varchar(32) DEFAULT NULL COMMENT '职务',
  `latitude` double(16,4) DEFAULT NULL COMMENT '纬度',
  `longitude` double(16,4) DEFAULT NULL COMMENT '经度',
  `enabled` varchar(8) DEFAULT NULL COMMENT '0：无效，1：有效',
  `is_delete` varchar(8) DEFAULT NULL COMMENT 'Y:删除，N：没有',
  `create_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(32) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wx_oppenid` (`wx_oppenid`)
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_user
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'localhost1553584635049', '1554525375499', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'test', 'renren', '0', null, '1622', '2018-12-24 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'test', 'renren', '0', null, '1048', '2018-12-24 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-12-24 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'testTask', 'test', 'renren', '0', null, '1023', '2018-12-24 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'test', 'renren', '0', null, '1032', '2018-12-24 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'testTask', 'test', 'renren', '0', null, '1521', '2018-12-25 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'test', 'renren', '0', null, '1077', '2018-12-25 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'test', 'renren', '0', null, '1104', '2018-12-25 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'testTask', 'test', 'renren', '0', null, '1093', '2018-12-25 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-25 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('11', '1', 'testTask', 'test', 'renren', '0', null, '1050', '2018-12-25 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('12', '1', 'testTask', 'test', 'renren', '0', null, '1094', '2018-12-25 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('13', '1', 'testTask', 'test', 'renren', '0', null, '1040', '2018-12-25 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'testTask', 'test', 'renren', '0', null, '1124', '2018-12-25 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('15', '1', 'testTask', 'test', 'renren', '0', null, '1075', '2018-12-25 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('16', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2018-12-25 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('17', '1', 'testTask', 'test', 'renren', '0', null, '1062', '2018-12-25 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('18', '1', 'testTask', 'test', 'renren', '0', null, '1067', '2018-12-25 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('19', '1', 'testTask', 'test', 'renren', '0', null, '1074', '2018-12-25 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('20', '1', 'testTask', 'test', 'renren', '0', null, '1762', '2018-12-25 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('21', '1', 'testTask', 'test', 'renren', '0', null, '1077', '2018-12-25 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('22', '1', 'testTask', 'test', 'renren', '0', null, '1084', '2018-12-25 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('23', '1', 'testTask', 'test', 'renren', '0', null, '1088', '2018-12-25 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('24', '1', 'testTask', 'test', 'renren', '0', null, '1072', '2018-12-25 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('25', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-25 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('26', '1', 'testTask', 'test', 'renren', '0', null, '1022', '2018-12-25 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('27', '1', 'testTask', 'test', 'renren', '0', null, '1059', '2018-12-25 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('28', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-12-25 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('29', '1', 'testTask', 'test', 'renren', '0', null, '1555', '2018-12-26 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('30', '1', 'testTask', 'test', 'renren', '0', null, '1100', '2018-12-26 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('31', '1', 'testTask', 'test', 'renren', '0', null, '1062', '2018-12-26 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('32', '1', 'testTask', 'test', 'renren', '0', null, '1053', '2018-12-26 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('33', '1', 'testTask', 'test', 'renren', '0', null, '1092', '2018-12-26 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('34', '1', 'testTask', 'test', 'renren', '0', null, '1033', '2018-12-26 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('35', '1', 'testTask', 'test', 'renren', '0', null, '1053', '2018-12-26 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('36', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-12-26 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('37', '1', 'testTask', 'test', 'renren', '0', null, '1073', '2018-12-26 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('38', '1', 'testTask', 'test', 'renren', '0', null, '1076', '2018-12-26 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('39', '1', 'testTask', 'test', 'renren', '0', null, '1099', '2018-12-27 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('40', '1', 'testTask', 'test', 'renren', '0', null, '1068', '2018-12-27 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('41', '1', 'testTask', 'test', 'renren', '0', null, '1107', '2018-12-27 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('42', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-12-27 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('43', '1', 'testTask', 'test', 'renren', '0', null, '1090', '2018-12-27 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('44', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-12-27 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('45', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-12-27 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('46', '1', 'testTask', 'test', 'renren', '0', null, '1045', '2018-12-27 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('47', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-12-27 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('48', '1', 'testTask', 'test', 'renren', '0', null, '1043', '2018-12-27 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('49', '1', 'testTask', 'test', 'renren', '0', null, '1096', '2018-12-27 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('50', '1', 'testTask', 'test', 'renren', '0', null, '1452', '2018-12-28 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('51', '1', 'testTask', 'test', 'renren', '0', null, '1090', '2018-12-28 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('52', '1', 'testTask', 'test', 'renren', '0', null, '1110', '2018-12-28 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('53', '1', 'testTask', 'test', 'renren', '0', null, '1063', '2018-12-28 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('54', '1', 'testTask', 'test', 'renren', '0', null, '1086', '2018-12-28 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('55', '1', 'testTask', 'test', 'renren', '0', null, '1128', '2018-12-28 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('56', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-12-30 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('57', '1', 'testTask', 'test', 'renren', '0', null, '1036', '2018-12-30 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('58', '1', 'testTask', 'test', 'renren', '0', null, '1080', '2018-12-30 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('59', '1', 'testTask', 'test', 'renren', '0', null, '1085', '2018-12-30 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('60', '1', 'testTask', 'test', 'renren', '0', null, '1116', '2018-12-30 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('61', '1', 'testTask', 'test', 'renren', '0', null, '1016', '2018-12-30 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('62', '1', 'testTask', 'test', 'renren', '0', null, '1032', '2018-12-30 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('63', '1', 'testTask', 'test', 'renren', '0', null, '1063', '2018-12-30 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('64', '1', 'testTask', 'test', 'renren', '0', null, '1084', '2018-12-30 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('65', '1', 'testTask', 'test', 'renren', '0', null, '1016', '2018-12-30 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('66', '1', 'testTask', 'test', 'renren', '0', null, '1029', '2018-12-30 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('67', '1', 'testTask', 'test', 'renren', '0', null, '1027', '2018-12-30 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('68', '1', 'testTask', 'test', 'renren', '0', null, '1035', '2018-12-30 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('69', '1', 'testTask', 'test', 'renren', '0', null, '1037', '2018-12-30 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('70', '1', 'testTask', 'test', 'renren', '0', null, '1020', '2018-12-30 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('71', '1', 'testTask', 'test', 'renren', '0', null, '1047', '2018-12-31 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('72', '1', 'testTask', 'test', 'renren', '0', null, '1040', '2019-01-03 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('73', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2019-01-03 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('74', '1', 'testTask', 'test', 'renren', '0', null, '1041', '2019-01-03 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('75', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2019-01-03 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('76', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2019-01-03 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('77', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-03 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('78', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-03 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('79', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-03 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('80', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2019-01-03 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('81', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-03 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('82', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('83', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('84', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('85', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('86', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('87', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('88', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('89', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('90', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('91', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('92', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('93', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('94', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('95', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('96', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('97', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('98', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2019-01-04 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('99', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('100', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('101', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('102', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('103', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('104', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('105', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('106', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('107', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('108', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('109', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('110', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('111', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('112', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2019-01-04 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('113', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('114', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('115', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('116', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('117', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2019-01-04 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('118', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('119', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('120', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('121', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('122', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('123', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2019-01-04 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('124', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('125', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('126', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('127', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-04 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('128', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2019-01-04 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('129', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-04 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('130', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-05 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('131', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('132', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2019-01-05 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('133', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-05 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('134', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('135', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-05 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('136', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('137', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('138', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-05 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('139', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2019-01-05 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('140', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('141', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('142', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('143', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('144', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('145', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2019-01-05 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('146', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('147', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2019-01-05 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('148', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-05 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('149', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-05 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('150', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('151', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('152', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-05 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('153', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('154', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-05 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('155', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2019-01-05 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('156', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2019-01-05 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('157', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('158', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-05 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('159', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('160', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('161', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2019-01-05 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('162', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('163', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('164', '1', 'testTask', 'test', 'renren', '0', null, '1001', '2019-01-05 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('165', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('166', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('167', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('168', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('169', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('170', '1', 'testTask', 'test', 'renren', '0', null, '1001', '2019-01-05 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('171', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('172', '1', 'testTask', 'test', 'renren', '0', null, '1001', '2019-01-05 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('173', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('174', '1', 'testTask', 'test', 'renren', '0', null, '1001', '2019-01-05 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('175', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('176', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('177', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-05 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('178', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('179', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('180', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('181', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('182', '1', 'testTask', 'test', 'renren', '0', null, '1001', '2019-01-06 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('183', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('184', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('185', '1', 'testTask', 'test', 'renren', '0', null, '1001', '2019-01-06 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('186', '1', 'testTask', 'test', 'renren', '0', null, '1001', '2019-01-06 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('187', '1', 'testTask', 'test', 'renren', '0', null, '1001', '2019-01-06 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('188', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('189', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('190', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('191', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('192', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('193', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('194', '1', 'testTask', 'test', 'renren', '0', null, '1001', '2019-01-06 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('195', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('196', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('197', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('198', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2019-01-06 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('199', '1', 'testTask', 'test', 'renren', '0', null, '1001', '2019-01-06 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('200', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('201', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-06 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('202', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('203', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('204', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('205', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('206', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('207', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('208', '1', 'testTask', 'test', 'renren', '0', null, '1001', '2019-01-06 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('209', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('210', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('211', '1', 'testTask', 'test', 'renren', '0', null, '1069', '2019-01-06 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('212', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2019-01-06 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('213', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-06 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('214', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('215', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('216', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('217', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-06 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('218', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('219', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2019-01-06 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('220', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('221', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-06 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('222', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2019-01-07 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('223', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2019-01-07 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('224', '1', 'testTask', 'test', 'renren', '0', null, '1002', '2019-01-07 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('225', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2019-01-07 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('226', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2019-01-07 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('227', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2019-01-07 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('228', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-07 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('229', '1', 'testTask', 'test', 'renren', '0', null, '1051', '2019-01-07 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('230', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2019-01-08 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('231', '1', 'testTask', 'test', 'renren', '0', null, '1022', '2019-01-08 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('232', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-08 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('233', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-08 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('234', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-08 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('235', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-08 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('236', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-08 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('237', '1', 'testTask', 'test', 'renren', '0', null, '1069', '2019-01-08 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('238', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2019-01-08 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('239', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2019-01-08 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('240', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2019-01-08 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('241', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2019-01-09 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('242', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2019-01-09 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('243', '1', 'testTask', 'test', 'renren', '0', null, '1041', '2019-01-09 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('244', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2019-01-09 15:00:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('04e458a9-5542-4581-89e8-f519919fb2ea', 'ndb6f', '2018-12-30 16:14:46');
INSERT INTO `sys_captcha` VALUES ('06d00c5a-4441-41ac-8d8f-9e9dac2158aa', 'b56cx', '2019-03-03 14:52:39');
INSERT INTO `sys_captcha` VALUES ('1200c174-21da-4094-855f-d6941e7e01db', 'e5nf5', '2019-03-23 17:27:25');
INSERT INTO `sys_captcha` VALUES ('1bf21f02-7e72-4daf-8434-9b921a386a2c', 'en636', '2019-01-05 13:32:54');
INSERT INTO `sys_captcha` VALUES ('222beac0-6027-4028-81bd-2770d01e5c31', 'gx6e7', '2019-02-01 09:51:55');
INSERT INTO `sys_captcha` VALUES ('289ee572-40e0-410b-820e-f661c3addea7', 'cebmb', '2019-01-19 16:24:10');
INSERT INTO `sys_captcha` VALUES ('28a1c70f-dbf0-486b-87bd-fdf0e494f237', 'npndx', '2019-03-26 13:29:12');
INSERT INTO `sys_captcha` VALUES ('2b0438fc-b2a3-459e-8ce6-59ab1d5eea15', 'w3ew3', '2019-03-26 09:39:01');
INSERT INTO `sys_captcha` VALUES ('2c867810-a96c-4b5a-8516-78163d6cadeb', 'mmgaw', '2019-03-01 16:49:54');
INSERT INTO `sys_captcha` VALUES ('2e94b5a5-39c8-4376-884e-634a785edd6c', 'yxa5p', '2019-03-26 10:42:11');
INSERT INTO `sys_captcha` VALUES ('320150b3-c9cc-4180-8650-edf925789d3c', '8b2a4', '2019-01-21 23:40:46');
INSERT INTO `sys_captcha` VALUES ('3390291f-f145-4b58-8993-fa706dabbb6e', '3mwx6', '2019-01-07 20:53:24');
INSERT INTO `sys_captcha` VALUES ('341f59ce-7eb7-4bbc-8a16-9377beca1b83', '2n6d7', '2019-01-12 19:09:42');
INSERT INTO `sys_captcha` VALUES ('35462a39-712b-498f-81e5-9c2e1f72e66b', 'd8bp2', '2019-01-14 20:09:57');
INSERT INTO `sys_captcha` VALUES ('366018b1-d3a7-4223-8779-d495cd8c0520', 'e2xpg', '2019-03-28 07:53:03');
INSERT INTO `sys_captcha` VALUES ('3d56a4e1-3cb0-4c53-881c-225e121ffede', 'e7fdy', '2019-03-26 09:38:21');
INSERT INTO `sys_captcha` VALUES ('40e6c13a-4d69-495a-80c7-1ad27357d310', '7g7mb', '2019-03-08 12:49:13');
INSERT INTO `sys_captcha` VALUES ('4392c48c-f9bf-47a8-8032-4e9a338562aa', 'pb6x7', '2019-01-08 11:57:28');
INSERT INTO `sys_captcha` VALUES ('47ce9f77-faa8-4790-88ff-8689b1236414', 'mpg5a', '2019-03-26 09:39:38');
INSERT INTO `sys_captcha` VALUES ('4915b51e-99b2-483e-8edc-89da8692b663', 'm4gpm', '2019-03-26 10:32:00');
INSERT INTO `sys_captcha` VALUES ('49900456-0d20-4ff2-8072-a644ad20a73d', 'yyn73', '2019-01-22 11:52:07');
INSERT INTO `sys_captcha` VALUES ('49d47212-338c-48bd-8354-db9956909b2a', 'nyfw4', '2019-03-04 20:41:15');
INSERT INTO `sys_captcha` VALUES ('4a6877b5-7f44-4e99-8917-ae99d6552908', '7nnyg', '2019-01-10 21:27:24');
INSERT INTO `sys_captcha` VALUES ('4b63ba09-0b7d-496c-82f3-04061c4cb430', 'yx387', '2019-01-07 15:20:38');
INSERT INTO `sys_captcha` VALUES ('4b9b79f5-a68b-422e-8b84-e47306a1039a', 'x8wfw', '2019-01-06 18:43:06');
INSERT INTO `sys_captcha` VALUES ('5164a5ba-d683-4609-82df-2ff4612e0381', 'w4b7n', '2019-02-01 12:08:27');
INSERT INTO `sys_captcha` VALUES ('5808f597-1275-4f8d-8d9c-0dfd5a81b9f5', 'cwnde', '2019-03-26 10:38:21');
INSERT INTO `sys_captcha` VALUES ('58eca55c-985c-4692-8b6f-55d5945530f6', 'b6a48', '2019-02-20 15:17:47');
INSERT INTO `sys_captcha` VALUES ('5e3224a5-5099-4ec5-874f-19d6ad2d7f62', 'pn2yf', '2019-01-21 11:20:46');
INSERT INTO `sys_captcha` VALUES ('6020db0f-7d9e-46e3-8d60-ac8dc3792115', 'm7pyn', '2019-03-06 20:16:03');
INSERT INTO `sys_captcha` VALUES ('63a1a5f3-4f21-4e40-8e51-7476cca2cdfb', 'pdfg7', '2019-02-15 21:52:38');
INSERT INTO `sys_captcha` VALUES ('641e622f-88e4-4233-8e1f-f5605e0ed74e', 'g7fxa', '2019-01-06 22:13:36');
INSERT INTO `sys_captcha` VALUES ('67181e3e-769b-4339-8ffa-9958b4f35e55', '4b78e', '2019-02-15 14:39:07');
INSERT INTO `sys_captcha` VALUES ('69646aa5-39c5-499a-8e3b-bb51ba88cd71', '77w2y', '2019-03-21 15:21:24');
INSERT INTO `sys_captcha` VALUES ('6a2581ea-d27d-480b-8ff3-7355a15f0f03', 'mx5nf', '2019-02-01 09:50:02');
INSERT INTO `sys_captcha` VALUES ('6a6ea38c-e14e-4da4-8a7b-fe6cd4219010', 'n8xn6', '2019-03-26 10:43:29');
INSERT INTO `sys_captcha` VALUES ('6ac6fd96-eaf8-434e-87b3-8379f5f8c471', 'xybnc', '2019-03-09 15:20:39');
INSERT INTO `sys_captcha` VALUES ('6ad8de48-5ae0-4ed2-8d81-41c0eb21b862', 'mpamf', '2019-02-26 18:39:47');
INSERT INTO `sys_captcha` VALUES ('7467ad92-cf33-4b9b-87fb-3eeb38d7b78a', 'fdna8', '2019-03-08 15:54:03');
INSERT INTO `sys_captcha` VALUES ('76a3ac79-2a8f-4e75-8812-9f023b0ce206', 'n82pn', '2019-02-20 11:22:12');
INSERT INTO `sys_captcha` VALUES ('78884e21-1d18-4d6b-80ca-4cc4057ef195', 'nf2fm', '2019-03-26 09:29:17');
INSERT INTO `sys_captcha` VALUES ('7fd772b8-854c-4eb7-8ae7-fcd2150b5f4a', 'a6x3n', '2019-03-26 09:55:33');
INSERT INTO `sys_captcha` VALUES ('80fc0d2e-e585-4ea7-888b-76913b7e4941', 'w4gp5', '2019-02-21 13:37:25');
INSERT INTO `sys_captcha` VALUES ('810d8ebd-30f7-4739-84ef-b67979157f86', '2dp4x', '2019-01-21 11:20:43');
INSERT INTO `sys_captcha` VALUES ('8287bde0-def4-4a0d-8356-9b1c185b211e', '7ydn3', '2019-03-21 12:25:04');
INSERT INTO `sys_captcha` VALUES ('846e6be8-3fb8-4e38-80fa-755084041f48', 'm2g5f', '2019-03-09 18:47:13');
INSERT INTO `sys_captcha` VALUES ('8720018e-d929-4c13-8661-af783e622c11', '5dbwn', '2019-03-22 22:12:55');
INSERT INTO `sys_captcha` VALUES ('87f7fc65-ed07-4fad-8ced-79048d89c177', 'fxe8n', '2019-03-08 15:54:02');
INSERT INTO `sys_captcha` VALUES ('88255850-b888-42eb-8129-b3cf5e7b0cdd', 'bwa4n', '2019-03-21 11:05:40');
INSERT INTO `sys_captcha` VALUES ('88def888-0b1b-4aa6-8800-4453fcf410eb', '4nwgp', '2019-01-17 22:36:04');
INSERT INTO `sys_captcha` VALUES ('89a10825-ee16-4997-87d4-110d07153ae2', '537ag', '2019-03-08 20:12:51');
INSERT INTO `sys_captcha` VALUES ('8b384c8a-3d16-49fc-837f-28e58897c15e', 'xgp8g', '2019-04-05 14:55:26');
INSERT INTO `sys_captcha` VALUES ('8dbb6cf1-1b77-4cfa-8192-34402ef94e61', 'cnynp', '2019-03-23 17:23:34');
INSERT INTO `sys_captcha` VALUES ('96c76a67-e7aa-4dd9-8525-978d5d38d199', '2b65e', '2019-01-06 18:43:45');
INSERT INTO `sys_captcha` VALUES ('98675056-bf8b-4393-8169-2f06ccd63de2', 'mxamm', '2019-01-09 18:28:41');
INSERT INTO `sys_captcha` VALUES ('99793138-c81f-4092-8813-3805635528cf', 'fbmwg', '2019-01-12 10:31:18');
INSERT INTO `sys_captcha` VALUES ('9a202a3d-ebc5-4ab5-8959-a96a3e95d8ec', 'xe325', '2019-03-21 15:20:35');
INSERT INTO `sys_captcha` VALUES ('9dc9de57-1082-4435-81ca-52ba57bb705f', '7x7f7', '2019-02-26 18:40:10');
INSERT INTO `sys_captcha` VALUES ('9f36b560-26a8-42aa-88d8-6461368c79a4', 'wdn3b', '2019-02-17 21:12:36');
INSERT INTO `sys_captcha` VALUES ('a0d9092f-5692-4504-8604-b3a377ddffba', 'c4xeb', '2019-01-09 18:32:11');
INSERT INTO `sys_captcha` VALUES ('a20a1596-cd2f-422d-88ba-2884802a7d19', 'c4284', '2019-02-01 09:48:18');
INSERT INTO `sys_captcha` VALUES ('a3991101-c8d7-471e-81ba-262525cd4fea', 'eawn6', '2019-01-21 11:20:45');
INSERT INTO `sys_captcha` VALUES ('a4cee696-40d8-42c4-8552-c2c2e4335fee', 'm2ng7', '2019-03-05 11:17:03');
INSERT INTO `sys_captcha` VALUES ('a68d7330-cd45-49f7-89d9-418e597eacb1', 'g37pe', '2019-01-15 10:34:53');
INSERT INTO `sys_captcha` VALUES ('a8574e4b-ff4a-4213-860f-94b43fb38026', 'nenww', '2019-03-08 12:48:32');
INSERT INTO `sys_captcha` VALUES ('ac71fb98-90c1-4552-809c-4179ac3dc59a', 'dxycg', '2019-03-23 17:24:40');
INSERT INTO `sys_captcha` VALUES ('af1c075b-e63b-4441-8c74-f1ba563c0cea', 'e64p7', '2019-01-14 18:42:23');
INSERT INTO `sys_captcha` VALUES ('b01f287c-5e68-4402-8df5-b5c4df187fad', 'xcfn3', '2019-01-12 18:07:11');
INSERT INTO `sys_captcha` VALUES ('b4078f0a-d7ef-4c47-81ce-f460b8c3df9d', 'nbm6n', '2019-01-14 19:52:25');
INSERT INTO `sys_captcha` VALUES ('b48a9b86-ae0b-4f14-83a9-68f03a11aea8', 'dedg5', '2019-03-26 09:41:36');
INSERT INTO `sys_captcha` VALUES ('b4b577e3-988b-4f43-8861-b1755d65db3b', '657wb', '2019-03-06 21:59:51');
INSERT INTO `sys_captcha` VALUES ('b6b72d8a-daca-47c2-8b90-f5302afe3b18', '4ypym', '2019-01-12 10:52:42');
INSERT INTO `sys_captcha` VALUES ('b77c57de-d888-4d75-8fe3-3d994503d21c', 'bay38', '2019-02-13 18:47:03');
INSERT INTO `sys_captcha` VALUES ('b8ff4411-7b7c-4351-8e4f-b3bb1522c20a', '2eb63', '2019-02-20 11:27:50');
INSERT INTO `sys_captcha` VALUES ('c0e24ca9-abf1-4f9f-8717-3411c4bfc259', '58g25', '2019-02-01 12:33:56');
INSERT INTO `sys_captcha` VALUES ('c210bcdc-8a3d-4bd6-8263-c9984c201404', 'n4ade', '2019-03-26 11:02:10');
INSERT INTO `sys_captcha` VALUES ('c4faa0ac-fc00-4174-83ed-312209b9cb5a', 'fd825', '2019-03-08 20:26:44');
INSERT INTO `sys_captcha` VALUES ('ccee2b46-2018-4be2-8f96-dc82fe50afe9', 'f3bwb', '2019-03-26 10:40:01');
INSERT INTO `sys_captcha` VALUES ('d73cf466-3dc6-4c24-8ee3-806887a3dead', 'ye5f3', '2019-02-14 17:59:24');
INSERT INTO `sys_captcha` VALUES ('d7a62931-34a9-4108-8509-60d44c06d770', 'ym6p4', '2019-02-23 14:45:46');
INSERT INTO `sys_captcha` VALUES ('db72fead-0ce8-4974-8e61-e44ef8096490', '7382x', '2019-02-01 12:12:56');
INSERT INTO `sys_captcha` VALUES ('dbbb2835-3133-4645-8ecd-16f09d286de1', 'f8pw5', '2019-01-07 20:59:20');
INSERT INTO `sys_captcha` VALUES ('dbee50dd-e168-42c5-81c6-3a32fa101cd4', 'xbx35', '2019-01-12 14:41:43');
INSERT INTO `sys_captcha` VALUES ('dc4f8a90-381f-4771-81b7-e19d1a208da1', 'fypaw', '2019-03-24 12:33:36');
INSERT INTO `sys_captcha` VALUES ('dc95a58a-a17d-4b04-8f18-ade455bb6b92', 'cg7y3', '2019-03-09 15:20:50');
INSERT INTO `sys_captcha` VALUES ('e4d8f2f7-cc67-4614-8230-4b73dc5def63', 'cp5c7', '2019-03-26 10:42:42');
INSERT INTO `sys_captcha` VALUES ('e8a7692a-5c51-4602-851d-63e0d0961437', 'dn2y5', '2019-03-26 11:05:14');
INSERT INTO `sys_captcha` VALUES ('ec011bf2-9dcc-45ec-8f4b-87e9497012fb', 'n7mgx', '2019-03-09 15:20:38');
INSERT INTO `sys_captcha` VALUES ('ee1b8e6a-5a28-4dd1-8c84-dc2e8d67ae95', 'nd6fp', '2019-03-26 12:50:52');
INSERT INTO `sys_captcha` VALUES ('ef10f0c8-cb01-45fc-86e9-32ee8b866314', 'p7ygw', '2019-02-01 12:14:06');
INSERT INTO `sys_captcha` VALUES ('ef4ab709-dcf0-4bee-8930-a0e44bfed6e1', 'gpgym', '2019-03-27 09:54:48');
INSERT INTO `sys_captcha` VALUES ('f0940bf7-1c3a-409e-8049-f017aa56cd5b', '5newn', '2019-01-06 18:43:50');
INSERT INTO `sys_captcha` VALUES ('f0cef3d5-405f-4546-825d-90f699b613db', 'pbanf', '2018-12-24 21:15:12');
INSERT INTO `sys_captcha` VALUES ('f1018ec7-c2cc-4c0f-8105-162760dade4b', 'd7m2d', '2019-03-23 17:24:15');
INSERT INTO `sys_captcha` VALUES ('f4efab70-acf4-462c-8172-17de2fe8d504', 'em26x', '2019-01-21 11:20:32');
INSERT INTO `sys_captcha` VALUES ('f7dd639a-107a-43a5-8f78-b1015e4ec13e', 'dcdyb', '2019-03-22 22:12:46');
INSERT INTO `sys_captcha` VALUES ('f800ff9f-419c-4251-8593-bbdb0c110a66', '7ag7n', '2019-03-26 10:19:56');
INSERT INTO `sys_captcha` VALUES ('fcaebe13-df2d-41d4-8c0a-ef2120d97361', 'axg7n', '2019-02-07 22:16:55');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('2', 'test', 'test', '1', null);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"学校管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shouye\",\"orderNum\":0}]', '82', '0:0:0:0:0:0:0:1', '2018-12-24 20:45:31');
INSERT INTO `sys_log` VALUES ('2', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":10}]', '76', '0:0:0:0:0:0:0:1', '2018-12-24 20:45:54');
INSERT INTO `sys_log` VALUES ('3', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"学校列表\",\"url\":\"school/myschool.html\",\"perms\":\"school:list\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":0}]', '87', '0:0:0:0:0:0:0:1', '2018-12-24 20:50:08');
INSERT INTO `sys_log` VALUES ('4', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"学校列表\",\"url\":\"modules/taoliyuan/myschool.html\",\"perms\":\"school:list\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":0}]', '37', '0:0:0:0:0:0:0:1', '2018-12-25 19:59:50');
INSERT INTO `sys_log` VALUES ('5', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"学校列表\",\"url\":\"taoliyuan/myschool.html\",\"perms\":\"school:list\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":0}]', '79', '0:0:0:0:0:0:0:1', '2018-12-25 20:00:56');
INSERT INTO `sys_log` VALUES ('6', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"学校列表\",\"url\":\"taoliyuan/myschool\",\"perms\":\"school:list\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":0}]', '81', '0:0:0:0:0:0:0:1', '2018-12-25 20:02:48');
INSERT INTO `sys_log` VALUES ('7', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"学校列表\",\"url\":\"taoliyuan/myschool\",\"perms\":\"\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":0}]', '85', '0:0:0:0:0:0:0:1', '2018-12-25 20:03:35');
INSERT INTO `sys_log` VALUES ('8', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":32,\"name\":\"查询\",\"url\":\"\",\"perms\":\"\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '110', '0:0:0:0:0:0:0:1', '2018-12-25 20:10:35');
INSERT INTO `sys_log` VALUES ('9', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":33,\"parentId\":32,\"name\":\"查询\",\"perms\":\"taoliyuan:myschool:list,taoliyuan:myschool:info\",\"type\":2,\"orderNum\":0}]', '43', '0:0:0:0:0:0:0:1', '2018-12-25 20:11:37');
INSERT INTO `sys_log` VALUES ('10', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"新增\",\"perms\":\"taoliyuan:school:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '123', '0:0:0:0:0:0:0:1', '2018-12-25 20:13:24');
INSERT INTO `sys_log` VALUES ('11', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":35,\"parentId\":32,\"name\":\"新增\",\"perms\":\"taoliyuan:school:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '31', '0:0:0:0:0:0:0:1', '2018-12-25 20:13:25');
INSERT INTO `sys_log` VALUES ('12', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[35]', '96', '0:0:0:0:0:0:0:1', '2018-12-25 20:13:58');
INSERT INTO `sys_log` VALUES ('13', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"新增\",\"perms\":\"taoliyuan:myschool:save\",\"type\":2,\"orderNum\":0}]', '86', '0:0:0:0:0:0:0:1', '2018-12-25 20:14:19');
INSERT INTO `sys_log` VALUES ('14', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":36,\"parentId\":32,\"name\":\"修改\",\"url\":\"\",\"perms\":\"taoliyuan:myschool:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '60', '0:0:0:0:0:0:0:1', '2018-12-25 20:15:45');
INSERT INTO `sys_log` VALUES ('15', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":37,\"parentId\":32,\"name\":\"删除\",\"url\":\"\",\"perms\":\"taoliyuan:myschool:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '82', '0:0:0:0:0:0:0:1', '2018-12-25 20:16:13');
INSERT INTO `sys_log` VALUES ('16', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":38,\"parentId\":0,\"name\":\"用户管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":1}]', '79', '0:0:0:0:0:0:0:1', '2018-12-25 20:17:31');
INSERT INTO `sys_log` VALUES ('17', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":39,\"parentId\":38,\"name\":\"用户列表\",\"url\":\"myuser/list\",\"perms\":\"\",\"type\":1,\"icon\":\"admin\",\"orderNum\":0}]', '49', '0:0:0:0:0:0:0:1', '2018-12-25 20:18:23');
INSERT INTO `sys_log` VALUES ('18', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":39,\"parentId\":38,\"name\":\"用户列表\",\"url\":\"taoliyuan/myuser/list\",\"type\":1,\"icon\":\"admin\",\"orderNum\":0}]', '86', '0:0:0:0:0:0:0:1', '2018-12-25 20:18:56');
INSERT INTO `sys_log` VALUES ('19', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"学校列表\",\"url\":\"taoliyuan/myschool\",\"perms\":\"taoliyuan:myschool:list\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":0}]', '59', '0:0:0:0:0:0:0:1', '2018-12-25 20:20:08');
INSERT INTO `sys_log` VALUES ('20', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":39,\"parentId\":38,\"name\":\"用户列表\",\"url\":\"myuser/list\",\"perms\":\"taoliyuan:myuser:list\",\"type\":1,\"icon\":\"admin\",\"orderNum\":0}]', '94', '0:0:0:0:0:0:0:1', '2018-12-25 20:20:44');
INSERT INTO `sys_log` VALUES ('21', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":39,\"parentId\":38,\"name\":\"用户列表\",\"url\":\"taoliyuan/myuser\",\"perms\":\"taoliyuan:myuser:list\",\"type\":1,\"icon\":\"admin\",\"orderNum\":0}]', '80', '0:0:0:0:0:0:0:1', '2018-12-25 20:21:35');
INSERT INTO `sys_log` VALUES ('22', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":40,\"parentId\":39,\"name\":\"新增\",\"url\":\"\",\"perms\":\"taoliyuan/myuser/save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '80', '0:0:0:0:0:0:0:1', '2018-12-25 20:32:39');
INSERT INTO `sys_log` VALUES ('23', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":41,\"parentId\":39,\"name\":\"查询\",\"url\":\"\",\"perms\":\"taoliyuan:myuser:list,taoliyuan:myuser:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '92', '0:0:0:0:0:0:0:1', '2018-12-25 20:49:19');
INSERT INTO `sys_log` VALUES ('24', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":42,\"parentId\":39,\"name\":\"更新\",\"url\":\"\",\"perms\":\"taoliyuan:myuser:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '84', '0:0:0:0:0:0:0:1', '2018-12-25 20:50:33');
INSERT INTO `sys_log` VALUES ('25', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":43,\"parentId\":39,\"name\":\"删除\",\"url\":\"\",\"perms\":\"taoliyuan:myuser:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '90', '0:0:0:0:0:0:0:1', '2018-12-25 20:51:01');
INSERT INTO `sys_log` VALUES ('26', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":44,\"parentId\":0,\"name\":\"活动管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"sousuo\",\"orderNum\":2}]', '83', '0:0:0:0:0:0:0:1', '2018-12-25 20:52:28');
INSERT INTO `sys_log` VALUES ('27', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":45,\"parentId\":44,\"name\":\"活动列表\",\"url\":\"taoliyuan/myactivity\",\"perms\":\"taoliyuan:myactivity:list,taoliyuan:myactivity:info\",\"type\":1,\"icon\":\"sousuo\",\"orderNum\":0}]', '87', '0:0:0:0:0:0:0:1', '2018-12-25 20:53:19');
INSERT INTO `sys_log` VALUES ('28', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":45,\"parentId\":44,\"name\":\"活动列表\",\"url\":\"taoliyuan/myactivity\",\"perms\":\"taoliyuan:myactivity:list\",\"type\":1,\"icon\":\"sousuo\",\"orderNum\":0}]', '84', '0:0:0:0:0:0:0:1', '2018-12-25 20:59:22');
INSERT INTO `sys_log` VALUES ('29', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":46,\"parentId\":45,\"name\":\"新增\",\"url\":\"\",\"perms\":\"taoliyuan:myactivity:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '74', '0:0:0:0:0:0:0:1', '2018-12-25 21:01:42');
INSERT INTO `sys_log` VALUES ('30', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":47,\"parentId\":45,\"name\":\"查询\",\"url\":\"\",\"perms\":\"taoliyuan:myactivity:list,taoliyuan:myactivity:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '131', '0:0:0:0:0:0:0:1', '2018-12-25 21:05:23');
INSERT INTO `sys_log` VALUES ('31', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":48,\"parentId\":45,\"name\":\"修改\",\"perms\":\"taoliyuan:myactivity:update\",\"type\":2,\"orderNum\":0}]', '67', '0:0:0:0:0:0:0:1', '2018-12-25 21:22:58');
INSERT INTO `sys_log` VALUES ('32', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":49,\"parentId\":45,\"name\":\"删除\",\"perms\":\"taoliyuan:myactivity:delete\",\"type\":2,\"orderNum\":0}]', '29', '0:0:0:0:0:0:0:1', '2018-12-25 21:23:24');
INSERT INTO `sys_log` VALUES ('33', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":45,\"parentId\":44,\"name\":\"活动列表\",\"url\":\"taoliyuan/myactivity\",\"perms\":\"taoliyuan:myactivity:list\",\"type\":1,\"icon\":\"sousuo\",\"orderNum\":0}]', '93', '0:0:0:0:0:0:0:1', '2018-12-25 21:39:30');
INSERT INTO `sys_log` VALUES ('34', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":48,\"parentId\":45,\"name\":\"修改\",\"perms\":\"taoliyuan:myactivity:update\",\"type\":2,\"orderNum\":0}]', '80', '0:0:0:0:0:0:0:1', '2018-12-25 21:40:34');
INSERT INTO `sys_log` VALUES ('35', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":50,\"parentId\":0,\"name\":\"建议管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"xiangqufill\",\"orderNum\":3}]', '85', '0:0:0:0:0:0:0:1', '2018-12-25 21:46:35');
INSERT INTO `sys_log` VALUES ('36', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":51,\"parentId\":50,\"name\":\"建议列表\",\"url\":\"taoliyuan/myadvice\",\"perms\":\"taoliyuan:myadvice:list\",\"type\":1,\"icon\":\"xiangqufill\",\"orderNum\":0}]', '90', '0:0:0:0:0:0:0:1', '2018-12-25 21:47:26');
INSERT INTO `sys_log` VALUES ('37', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":52,\"parentId\":51,\"name\":\"查询\",\"url\":\"\",\"perms\":\"taoliyuan:myadvice:list,taoliyuan:myadvice:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '95', '0:0:0:0:0:0:0:1', '2018-12-25 21:48:16');
INSERT INTO `sys_log` VALUES ('38', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":53,\"parentId\":51,\"name\":\"新增\",\"url\":\"\",\"perms\":\"taoliyuan:myadvice:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '84', '0:0:0:0:0:0:0:1', '2018-12-25 21:48:44');
INSERT INTO `sys_log` VALUES ('39', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":54,\"parentId\":51,\"name\":\"修改\",\"url\":\"\",\"perms\":\"taoliyuan:myadvice:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '72', '0:0:0:0:0:0:0:1', '2018-12-25 21:49:02');
INSERT INTO `sys_log` VALUES ('40', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":55,\"parentId\":51,\"name\":\"删除\",\"url\":\"\",\"perms\":\"taoliyuan:myadvice:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '89', '0:0:0:0:0:0:0:1', '2018-12-25 21:49:23');
INSERT INTO `sys_log` VALUES ('41', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":56,\"parentId\":0,\"name\":\"企业管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"oss\",\"orderNum\":4}]', '86', '0:0:0:0:0:0:0:1', '2018-12-25 21:50:20');
INSERT INTO `sys_log` VALUES ('42', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":57,\"parentId\":56,\"name\":\"企业列表\",\"url\":\"taoliyuan/mycompany\",\"perms\":\"taoliyuan:mycompany:list\",\"type\":1,\"icon\":\"oss\",\"orderNum\":0}]', '77', '0:0:0:0:0:0:0:1', '2018-12-25 21:50:52');
INSERT INTO `sys_log` VALUES ('43', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":58,\"parentId\":57,\"name\":\"查询\",\"url\":\"\",\"perms\":\"taoliyuan:mycompany:list,taoliyuan:mycompany:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '54', '0:0:0:0:0:0:0:1', '2018-12-25 21:51:51');
INSERT INTO `sys_log` VALUES ('44', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":59,\"parentId\":57,\"name\":\"新增\",\"url\":\"\",\"perms\":\"taoliyuan:mycompany:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '90', '0:0:0:0:0:0:0:1', '2018-12-25 21:52:19');
INSERT INTO `sys_log` VALUES ('45', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":60,\"parentId\":57,\"name\":\"修改\",\"url\":\"\",\"perms\":\"taoliyuan:mycompany:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '47', '0:0:0:0:0:0:0:1', '2018-12-25 21:52:38');
INSERT INTO `sys_log` VALUES ('46', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":61,\"parentId\":57,\"name\":\"删除\",\"url\":\"\",\"perms\":\"taoliyuan:mycompany:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '52', '0:0:0:0:0:0:0:1', '2018-12-25 21:52:55');
INSERT INTO `sys_log` VALUES ('47', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[53]', '185', '0:0:0:0:0:0:0:1', '2018-12-27 18:11:44');
INSERT INTO `sys_log` VALUES ('48', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":42,\"parentId\":39,\"name\":\"审批\",\"perms\":\"taoliyuan:myuser:update\",\"type\":2,\"orderNum\":0}]', '40', '0:0:0:0:0:0:0:1', '2018-12-27 20:29:34');
INSERT INTO `sys_log` VALUES ('49', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":62,\"parentId\":0,\"name\":\"校友会管理员\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"role\",\"orderNum\":5}]', '314', '0:0:0:0:0:0:0:1', '2018-12-28 14:23:45');
INSERT INTO `sys_log` VALUES ('50', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":63,\"parentId\":62,\"name\":\"管理员列表\",\"url\":\"taoliyuan/myalumniadmin\",\"perms\":\"myalumniadmin:list,myalumniadmin:info\",\"type\":1,\"icon\":\"role\",\"orderNum\":6}]', '105', '0:0:0:0:0:0:0:1', '2018-12-30 18:21:54');
INSERT INTO `sys_log` VALUES ('51', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":64,\"parentId\":63,\"name\":\"增加\",\"perms\":\"myalumniadmin:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '87', '0:0:0:0:0:0:0:1', '2018-12-30 18:22:40');
INSERT INTO `sys_log` VALUES ('52', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":65,\"parentId\":63,\"name\":\"修改\",\"perms\":\"myalumniadmin:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '141', '0:0:0:0:0:0:0:1', '2018-12-30 18:23:01');
INSERT INTO `sys_log` VALUES ('53', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":66,\"parentId\":63,\"name\":\"修改\",\"perms\":\"myalumniadmin:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '110', '0:0:0:0:0:0:0:1', '2018-12-30 18:23:02');
INSERT INTO `sys_log` VALUES ('54', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":67,\"parentId\":63,\"name\":\"删除\",\"perms\":\"myalumniadmin:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '92', '0:0:0:0:0:0:0:1', '2018-12-30 18:23:20');
INSERT INTO `sys_log` VALUES ('55', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":63,\"parentId\":62,\"name\":\"管理员列表\",\"url\":\"taoliyuan/myalumniadmin\",\"perms\":\"taoliyuan:myalumniadmin:list,taoliyuan:myalumniadmin:info\",\"type\":1,\"icon\":\"role\",\"orderNum\":6}]', '58', '0:0:0:0:0:0:0:1', '2018-12-30 18:29:42');
INSERT INTO `sys_log` VALUES ('56', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":63,\"parentId\":62,\"name\":\"管理员列表\",\"url\":\"taoliyuan/myalumniadmin\",\"perms\":\"taoliyuan:myalumniadmin:list\",\"type\":1,\"icon\":\"role\",\"orderNum\":6}]', '103', '0:0:0:0:0:0:0:1', '2018-12-30 18:32:46');
INSERT INTO `sys_log` VALUES ('57', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":68,\"parentId\":38,\"name\":\"申请管理\",\"url\":\"taoliyuan/myuserapply\",\"perms\":\"taoliyuan:myuserapply:list\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":0}]', '5', '127.0.0.1', '2019-01-06 12:04:26');
INSERT INTO `sys_log` VALUES ('58', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":69,\"parentId\":68,\"name\":\"审批\",\"url\":\"\",\"perms\":\"taoliyuan:myuserapply:update\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '4', '127.0.0.1', '2019-01-06 12:05:19');
INSERT INTO `sys_log` VALUES ('59', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":64,\"parentId\":63,\"name\":\"增加\",\"perms\":\"taoliyuan:myalumniadmin:save\",\"type\":2,\"orderNum\":0}]', '14', '127.0.0.1', '2019-01-07 16:34:38');
INSERT INTO `sys_log` VALUES ('60', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":65,\"parentId\":63,\"name\":\"修改\",\"perms\":\"taoliyuan:myalumniadmin:update\",\"type\":2,\"orderNum\":0}]', '7', '127.0.0.1', '2019-01-07 16:34:49');
INSERT INTO `sys_log` VALUES ('61', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":66,\"parentId\":63,\"name\":\"修改\",\"perms\":\"taoliyuan:myalumniadmin:update\",\"type\":2,\"orderNum\":0}]', '5', '127.0.0.1', '2019-01-07 16:34:58');
INSERT INTO `sys_log` VALUES ('62', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":67,\"parentId\":63,\"name\":\"删除\",\"perms\":\"taoliyuan:myalumniadmin:delete\",\"type\":2,\"orderNum\":0}]', '6', '127.0.0.1', '2019-01-07 16:35:07');
INSERT INTO `sys_log` VALUES ('63', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"yuqing\",\"password\":\"704c81a5d81b632b49c93d1397b0ead4bc4e8db6ee58d8da44f5e0aaaa78f7d1\",\"salt\":\"NAPqF5SDFotYS4MXRmTt\",\"email\":\"123@qq.com\",\"mobile\":\"13526356478\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Jan 7, 2019 8:58:44 PM\"}]', '121', '127.0.0.1', '2019-01-07 20:58:45');
INSERT INTO `sys_log` VALUES ('64', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":3,\"username\":\"yan\",\"password\":\"f4cf89361cbdf4d46ff5c7504cba13467ec509bb809d576200a47b37d014c306\",\"salt\":\"iI8gErfam9agshYJ09dn\",\"email\":\"123@qq.com\",\"mobile\":\"13493839292\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Jan 7, 2019 8:59:18 PM\"}]', '7', '127.0.0.1', '2019-01-07 20:59:19');
INSERT INTO `sys_log` VALUES ('65', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"平台管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,36,37,38,39,40,41,42,43,68,69,44,45,46,47,48,49,50,51,52,54,55,56,57,58,59,60,61,62,63,64,65,66,67,-666666],\"createTime\":\"Jan 7, 2019 9:00:34 PM\"}]', '78', '127.0.0.1', '2019-01-07 21:00:35');
INSERT INTO `sys_log` VALUES ('66', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"yuqing\",\"salt\":\"NAPqF5SDFotYS4MXRmTt\",\"email\":\"123@qq.com\",\"mobile\":\"13526356478\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '8', '127.0.0.1', '2019-01-07 21:00:46');
INSERT INTO `sys_log` VALUES ('67', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"yan\",\"salt\":\"iI8gErfam9agshYJ09dn\",\"email\":\"123@qq.com\",\"mobile\":\"13493839292\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '6', '127.0.0.1', '2019-01-07 21:00:56');
INSERT INTO `sys_log` VALUES ('68', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"学校列表\",\"url\":\"taoliyuan/school/myschool\",\"perms\":\"taoliyuan:myschool:list\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":0}]', '20', '127.0.0.1', '2019-01-09 09:29:46');
INSERT INTO `sys_log` VALUES ('69', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":70,\"parentId\":31,\"name\":\"校友会列表\",\"url\":\"taoliyuan/school/myschoolarea\",\"perms\":\"taoliyuan:myschool:list\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":1}]', '7', '127.0.0.1', '2019-01-09 09:31:58');
INSERT INTO `sys_log` VALUES ('70', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":71,\"parentId\":70,\"name\":\"查询\",\"url\":\"\",\"perms\":\"taoliyuan:myschool:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '5', '127.0.0.1', '2019-01-09 09:34:52');
INSERT INTO `sys_log` VALUES ('71', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":72,\"parentId\":70,\"name\":\"新增\",\"url\":\"\",\"perms\":\"myschool:myschool:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '14', '127.0.0.1', '2019-01-09 09:35:14');
INSERT INTO `sys_log` VALUES ('72', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":73,\"parentId\":70,\"name\":\"更新\",\"url\":\"\",\"perms\":\"taoliyuan:myschool:update,taoliyuan:myschool:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '6', '127.0.0.1', '2019-01-09 09:35:46');
INSERT INTO `sys_log` VALUES ('73', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":74,\"parentId\":70,\"name\":\"删除\",\"url\":\"\",\"perms\":\"taoliyuan:myschool:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '5', '127.0.0.1', '2019-01-09 09:36:01');
INSERT INTO `sys_log` VALUES ('74', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":71,\"parentId\":70,\"name\":\"查询\",\"perms\":\"taoliyuan:myschool:list,taoliyuan:myschool:info\",\"type\":2,\"orderNum\":0}]', '6', '127.0.0.1', '2019-01-09 09:37:14');
INSERT INTO `sys_log` VALUES ('75', 'admin', '暂停定时任务', 'io.renren.modules.job.controller.ScheduleJobController.pause()', '[[1]]', '34', '127.0.0.1', '2019-01-09 15:06:49');
INSERT INTO `sys_log` VALUES ('76', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":75,\"parentId\":1,\"name\":\"地区管理\",\"url\":\"sys/myregion\",\"perms\":\"taoliyuan:myregion:list\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]', '25', '127.0.0.1', '2019-01-11 10:04:12');
INSERT INTO `sys_log` VALUES ('77', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":76,\"parentId\":75,\"name\":\"新增\",\"url\":\"\",\"perms\":\"taoliyuan:myregion:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '7', '127.0.0.1', '2019-01-11 10:04:38');
INSERT INTO `sys_log` VALUES ('78', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":77,\"parentId\":75,\"name\":\"查询\",\"url\":\"\",\"perms\":\"taoliyuan:myregion:info,taoliyuan:myregion:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '6', '127.0.0.1', '2019-01-11 10:05:16');
INSERT INTO `sys_log` VALUES ('79', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":78,\"parentId\":75,\"name\":\"修改\",\"url\":\"\",\"perms\":\"taoliyuan:myregion:update,taoliyuan:myregion:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '6', '127.0.0.1', '2019-01-11 10:05:50');
INSERT INTO `sys_log` VALUES ('80', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":79,\"parentId\":75,\"name\":\"删除\",\"url\":\"\",\"perms\":\"taoliyuan:myregion:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '14', '127.0.0.1', '2019-01-11 10:06:06');
INSERT INTO `sys_log` VALUES ('81', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":68,\"parentId\":38,\"name\":\"申请管理\",\"url\":\"taoliyuan/user/myuserapply\",\"perms\":\"taoliyuan:myuserapply:list\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":0}]', '12', '127.0.0.1', '2019-01-12 10:46:04');
INSERT INTO `sys_log` VALUES ('82', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":4,\"username\":\"qi\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"123@qq.com\",\"mobile\":\"13526356478\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '142', '127.0.0.1', '2019-01-12 11:14:50');
INSERT INTO `sys_log` VALUES ('83', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":70,\"parentId\":31,\"name\":\"校友会列表\",\"url\":\"taoliyuan/school/schoolarea\",\"perms\":\"taoliyuan:myschool:list\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":1}]', '24', '127.0.0.1', '2019-01-12 19:02:22');
INSERT INTO `sys_log` VALUES ('84', 'yan', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":70,\"parentId\":31,\"name\":\"校友会列表\",\"url\":\"taoliyuan/school/schoolarea\",\"perms\":\"taoliyuan:myschool:list\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":1}]', '6', '127.0.0.1', '2019-01-12 19:02:26');
INSERT INTO `sys_log` VALUES ('85', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":68,\"parentId\":38,\"name\":\"审批管理\",\"url\":\"taoliyuan/user/myuserapply\",\"perms\":\"taoliyuan:myuserapply:list\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":0}]', '21', '127.0.0.1', '2019-01-12 21:40:17');
INSERT INTO `sys_log` VALUES ('86', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":80,\"parentId\":38,\"name\":\"审批记录\",\"url\":\"taoliyuan/user/schoolarea\",\"perms\":\"taoliyuan:myschool:list\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":2}]', '9', '127.0.0.1', '2019-01-12 21:41:15');
INSERT INTO `sys_log` VALUES ('87', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":81,\"parentId\":38,\"name\":\"审批记录\",\"url\":\"taoliyuan/user/schoolarea\",\"perms\":\"taoliyuan:myschool:list\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":2}]', '10', '127.0.0.1', '2019-01-12 21:41:16');
INSERT INTO `sys_log` VALUES ('88', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[81]', '35', '127.0.0.1', '2019-01-12 21:41:46');
INSERT INTO `sys_log` VALUES ('89', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":82,\"parentId\":80,\"name\":\"查询\",\"url\":\"\",\"perms\":\"taoliyuan:myuserapply:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '6', '127.0.0.1', '2019-01-12 21:42:42');
INSERT INTO `sys_log` VALUES ('90', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":80,\"parentId\":38,\"name\":\"审批记录\",\"url\":\"taoliyuan/user/applyed\",\"perms\":\"taoliyuan:myschool:list\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":2}]', '12', '127.0.0.1', '2019-01-12 21:43:36');
INSERT INTO `sys_log` VALUES ('91', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":68,\"parentId\":38,\"name\":\"待审批\",\"url\":\"taoliyuan/user/myuserapply\",\"perms\":\"taoliyuan:myuserapply:list\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":1}]', '47', '127.0.0.1', '2019-01-13 08:21:49');
INSERT INTO `sys_log` VALUES ('92', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":80,\"parentId\":38,\"name\":\"已审批记录\",\"url\":\"taoliyuan/user/applyed\",\"perms\":\"taoliyuan:myschool:list\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":2}]', '6', '127.0.0.1', '2019-01-13 08:22:11');
INSERT INTO `sys_log` VALUES ('93', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":39,\"parentId\":38,\"name\":\"用户列表\",\"url\":\"taoliyuan/user/myuser\",\"perms\":\"taoliyuan:myuser:list\",\"type\":1,\"icon\":\"admin\",\"orderNum\":0}]', '24', '127.0.0.1', '2019-01-13 10:36:32');
INSERT INTO `sys_log` VALUES ('94', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":5,\"schoolId\":1,\"username\":\"zy123\",\"password\":\"8c80d5649a625c9c72766fb792582ccc097bd8c5ff75b7372219daac640c3a8e\",\"salt\":\"dgc8CdSjrjgRq82SlvLA\",\"email\":\"893198358@qq.com\",\"mobile\":\"18675535470\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jan 13, 2019 10:01:42 PM\"}]', '150', '127.0.0.1', '2019-01-13 22:01:43');
INSERT INTO `sys_log` VALUES ('95', 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[4]]', '11', '127.0.0.1', '2019-01-13 22:01:53');
INSERT INTO `sys_log` VALUES ('96', 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[3]]', '4', '127.0.0.1', '2019-01-13 22:01:58');
INSERT INTO `sys_log` VALUES ('97', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":2,\"roleName\":\"学校管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[70,71,72,73,74,38,39,40,41,42,43,68,69,80,82,44,45,46,47,48,49,50,51,52,54,55,56,57,58,59,60,61,-666666,31],\"createTime\":\"Jan 13, 2019 10:03:57 PM\"}]', '39', '127.0.0.1', '2019-01-13 22:03:58');
INSERT INTO `sys_log` VALUES ('98', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":3,\"roleName\":\"校友会管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[38,39,40,41,42,43,68,69,80,82,44,45,46,47,48,49,50,51,52,54,55,56,57,58,59,60,61,-666666],\"createTime\":\"Jan 13, 2019 10:04:32 PM\"}]', '14', '127.0.0.1', '2019-01-13 22:04:33');
INSERT INTO `sys_log` VALUES ('99', 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[2]]', '3', '127.0.0.1', '2019-01-14 11:29:29');
INSERT INTO `sys_log` VALUES ('100', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"schoolId\":1,\"username\":\"admin\",\"password\":\"4f6a306a09c61c49136aa91566e1a4c536a42a34f7c00edc34fa09f6425cfec2\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"jsqfengbao@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '27', '127.0.0.1', '2019-01-14 11:30:02');
INSERT INTO `sys_log` VALUES ('101', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"学校管理员\",\"createUserId\":1,\"menuIdList\":[70,71,72,73,74,40,41,42,68,69,80,82,44,45,46,47,48,49,50,51,52,54,55,56,57,58,59,60,61,-666666,31,38,39]}]', '37', '127.0.0.1', '2019-01-14 12:39:56');
INSERT INTO `sys_log` VALUES ('102', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":3,\"roleName\":\"校友会管理员\",\"createUserId\":1,\"menuIdList\":[40,41,42,68,69,80,82,44,45,46,47,48,49,50,51,52,54,55,56,57,58,59,60,61,-666666,38,39]}]', '14', '127.0.0.1', '2019-01-14 12:40:26');
INSERT INTO `sys_log` VALUES ('103', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":6,\"schoolId\":3,\"username\":\"北风南\",\"password\":\"726ad1591d0ac22a710b56a50c0118e519f784e41429224a6f97eea25d79ed2b\",\"salt\":\"YP5QMHRwK2ybspHRvBPn\",\"email\":\"87904809@qq.com\",\"mobile\":\"13802880219\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Jan 14, 2019 12:41:14 PM\"}]', '8', '127.0.0.1', '2019-01-14 12:41:15');
INSERT INTO `sys_log` VALUES ('104', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"平台管理员\",\"createUserId\":1,\"menuIdList\":[-666666]}]', '21', '127.0.0.1', '2019-01-14 17:43:32');
INSERT INTO `sys_log` VALUES ('105', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"平台管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,75,76,77,78,79,31,32,33,34,36,37,70,71,72,73,74,38,39,40,41,42,43,68,69,80,82,44,45,46,47,48,49,50,51,52,54,55,56,57,58,59,60,61,62,63,64,65,66,67,-666666]}]', '40', '127.0.0.1', '2019-01-14 17:43:51');
INSERT INTO `sys_log` VALUES ('106', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":7,\"schoolId\":1,\"username\":\"haoran\",\"password\":\"d5edd494a1e5efec278bfbf3ae73be27ad6607da8918ee1670b82d7cb9fa0c92\",\"salt\":\"uHPjPRjSunTsnbwHf4dz\",\"email\":\"123@qq.com\",\"mobile\":\"15626482783\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jan 15, 2019 4:01:11 PM\"}]', '187', '127.0.0.1', '2019-01-15 16:01:12');
INSERT INTO `sys_log` VALUES ('107', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":8,\"schoolId\":3,\"username\":\"魏涛\",\"password\":\"d73dc796c33dada26cd9be449b7b7b8b16af1b7b7f5c66842b393295c2d63731\",\"salt\":\"kEvyA2F5unxrRcoTUV3R\",\"email\":\"278624786@qq.com\",\"mobile\":\"13510103202\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Jan 21, 2019 11:38:50 AM\"}]', '140', '127.0.0.1', '2019-01-21 11:38:50');
INSERT INTO `sys_log` VALUES ('108', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":9,\"schoolId\":2,\"username\":\"赵探花\",\"password\":\"3860dd3b2c3b33a7c5a1467cb5dfdb95e20a3ea6324c372426edea76c2a938f5\",\"salt\":\"hrYV7gZmK2cOgQh89fxF\",\"email\":\"147740896@qq.com\",\"mobile\":\"15012682665\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Jan 21, 2019 12:32:45 PM\"}]', '12', '127.0.0.1', '2019-01-21 12:32:45');
INSERT INTO `sys_log` VALUES ('109', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":10,\"schoolId\":1,\"username\":\"sgw\",\"password\":\"6b42abdec63fee79020bf380bcc2104af878060a12ca2fe1b89cc4a2ac328f98\",\"salt\":\"sG05ZtHYTUeJUSsR9Vzx\",\"email\":\"123@qq.com\",\"mobile\":\"13874828374\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Feb 1, 2019 12:32:45 PM\"}]', '247', '127.0.0.1', '2019-02-01 12:32:45');
INSERT INTO `sys_log` VALUES ('110', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":72,\"parentId\":70,\"name\":\"新增\",\"perms\":\"myschool:myschool:saveschoolarea\",\"type\":2,\"orderNum\":0}]', '270', '0:0:0:0:0:0:0:1', '2019-02-07 22:49:22');
INSERT INTO `sys_log` VALUES ('111', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":72,\"parentId\":70,\"name\":\"新增\",\"perms\":\"taoliyuan:myschool:saveschoolarea\",\"type\":2,\"orderNum\":0}]', '303', '0:0:0:0:0:0:0:1', '2019-02-07 22:50:17');
INSERT INTO `sys_log` VALUES ('112', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":83,\"parentId\":68,\"name\":\"修改分会\",\"url\":\"\",\"perms\":\"taoliyuan:myuserapply:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '123', '0:0:0:0:0:0:0:1', '2019-02-16 14:54:44');
INSERT INTO `sys_log` VALUES ('113', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":11,\"schoolId\":1,\"username\":\"汪洋\",\"password\":\"7dad6d76385e0c3d4924bd64642a8aaa36e4fcb2a89531653b93bb63703bb621\",\"salt\":\"XzjCWnAgnqO61hYRPZjE\",\"email\":\"123@qq.com\",\"mobile\":\"15682899876\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Feb 20, 2019 11:18:57 AM\"}]', '449', '127.0.0.1', '2019-02-20 11:18:57');
INSERT INTO `sys_log` VALUES ('114', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":84,\"parentId\":0,\"name\":\"论坛管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"bianji\",\"orderNum\":7}]', '97', '127.0.0.1', '2019-02-21 20:56:58');
INSERT INTO `sys_log` VALUES ('115', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":85,\"parentId\":84,\"name\":\"模块列表\",\"url\":\"/taoliyuan/forum/mymodule\",\"perms\":\"taoliyuan:forum:mymodule\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '120', '127.0.0.1', '2019-02-21 20:58:31');
INSERT INTO `sys_log` VALUES ('116', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":85,\"parentId\":84,\"name\":\"模块列表\",\"url\":\"/taoliyuan/forum/myforummodule\",\"perms\":\"taoliyuan:forum:mymodule\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '117', '127.0.0.1', '2019-02-21 20:59:13');
INSERT INTO `sys_log` VALUES ('117', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":85,\"parentId\":84,\"name\":\"模块列表\",\"url\":\"taoliyuan/forum/myforummodule\",\"perms\":\"taoliyuan:forum:mymodule\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', '108', '127.0.0.1', '2019-02-21 20:59:57');
INSERT INTO `sys_log` VALUES ('118', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":86,\"parentId\":85,\"name\":\"添加\",\"url\":\"\",\"perms\":\"taoliyuan:mymodule:add\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '164', '127.0.0.1', '2019-02-21 21:03:07');
INSERT INTO `sys_log` VALUES ('119', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":86,\"parentId\":85,\"name\":\"增加\",\"perms\":\"taoliyuan:myforummodule:save\",\"type\":2,\"orderNum\":0}]', '113', '127.0.0.1', '2019-02-21 21:03:58');
INSERT INTO `sys_log` VALUES ('120', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":87,\"parentId\":85,\"name\":\"修改\",\"url\":\"\",\"perms\":\"taoliyuan:myforummodule:update,taoliyuan:myforummodule:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '119', '127.0.0.1', '2019-02-21 21:07:20');
INSERT INTO `sys_log` VALUES ('121', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":88,\"parentId\":85,\"name\":\"删除\",\"url\":\"\",\"perms\":\"taoliyuan:myforummodule:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '107', '127.0.0.1', '2019-02-21 21:07:40');
INSERT INTO `sys_log` VALUES ('122', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":89,\"parentId\":84,\"name\":\"模块子类列表\",\"url\":\"taoliyuan/forum/myforummodulesubclass\",\"perms\":\"taoliyuan:myforummodulesubclass:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":1}]', '114', '127.0.0.1', '2019-02-21 21:09:36');
INSERT INTO `sys_log` VALUES ('123', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":90,\"parentId\":89,\"name\":\"增加\",\"url\":\"\",\"perms\":\"taoliyuan:myforummodulesubclass:save\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '116', '127.0.0.1', '2019-02-21 21:10:05');
INSERT INTO `sys_log` VALUES ('124', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":91,\"parentId\":89,\"name\":\"修改\",\"url\":\"\",\"perms\":\"taoliyuan:myforummodulesubclass:update,taoliyuan:myforummodulesubclass:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '113', '127.0.0.1', '2019-02-21 21:10:38');
INSERT INTO `sys_log` VALUES ('125', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":92,\"parentId\":89,\"name\":\"删除\",\"url\":\"\",\"perms\":\"taoliyuan:myforummodulesubclass:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '113', '127.0.0.1', '2019-02-21 21:10:55');
INSERT INTO `sys_log` VALUES ('126', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":93,\"parentId\":84,\"name\":\"贴子列表\",\"url\":\"taoliyuan/forum/myforumreply\",\"perms\":\"taoliyuan:myforumreply:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":2}]', '117', '127.0.0.1', '2019-02-21 21:13:27');
INSERT INTO `sys_log` VALUES ('127', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":94,\"parentId\":93,\"name\":\"修改\",\"url\":\"\",\"perms\":\"taoliyuan:myforumreply:update,taoliyuan:myforumreply:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '105', '127.0.0.1', '2019-02-21 21:14:28');
INSERT INTO `sys_log` VALUES ('128', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":95,\"parentId\":93,\"name\":\"删除\",\"url\":\"\",\"perms\":\"taoliyuan:myforumreply:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0}]', '107', '127.0.0.1', '2019-02-21 21:14:43');
INSERT INTO `sys_log` VALUES ('129', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":93,\"parentId\":84,\"name\":\"贴子列表\",\"url\":\"taoliyuan/forum/myforum\",\"perms\":\"taoliyuan:myforum:list\",\"type\":1,\"icon\":\"log\",\"orderNum\":2}]', '115', '127.0.0.1', '2019-02-21 21:19:35');
INSERT INTO `sys_log` VALUES ('130', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":94,\"parentId\":93,\"name\":\"修改\",\"perms\":\"taoliyuan:myforum:update,taoliyuan:myforum:info\",\"type\":2,\"orderNum\":0}]', '116', '127.0.0.1', '2019-02-21 21:19:53');
INSERT INTO `sys_log` VALUES ('131', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":95,\"parentId\":93,\"name\":\"删除\",\"perms\":\"taoliyuan:myforum:delete\",\"type\":2,\"orderNum\":0}]', '116', '127.0.0.1', '2019-02-21 21:20:09');
INSERT INTO `sys_log` VALUES ('132', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":86,\"parentId\":85,\"name\":\"增加\",\"perms\":\"taoliyuan:myforummodule:save,taoliyuan:myforummodule:list\",\"type\":2,\"orderNum\":0}]', '113', '127.0.0.1', '2019-02-21 21:44:31');
INSERT INTO `sys_log` VALUES ('133', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":12,\"schoolId\":1,\"username\":\"田亚辉\",\"password\":\"4c724bf8e561bab605736a864e68fa2a520ca37e94ee9207a8abf75328de1919\",\"salt\":\"5z78RFxbGOHcGiuCV4k6\",\"email\":\"924688229@qq.com\",\"mobile\":\"15626475894\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Mar 4, 2019 8:39:12 PM\"}]', '217', '127.0.0.1', '2019-03-04 20:39:13');
INSERT INTO `sys_log` VALUES ('134', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":63,\"parentId\":62,\"name\":\"管理员列表\",\"url\":\"taoliyuan/myalumniadmin\",\"perms\":\"taoliyuan:myalumniadmin:list,taoliyuan:myalumniadmin:info\",\"type\":1,\"icon\":\"role\",\"orderNum\":6}]', '153', '127.0.0.1', '2019-03-07 12:36:14');
INSERT INTO `sys_log` VALUES ('135', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":15,\"schoolId\":1,\"username\":\"金双齐\",\"password\":\"b5abe06c96cd8023107c63ee083cb9d9bf9b75ae0192dde3b3ff8dfb88b5b888\",\"salt\":\"VcRsd4LwlsRUQOKcwn8B\",\"email\":\"king@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Mar 7, 2019 5:10:38 PM\"}]', '310', '127.0.0.1', '2019-03-07 17:10:39');
INSERT INTO `sys_log` VALUES ('136', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":15,\"schoolId\":1,\"username\":\"金双齐\",\"salt\":\"VcRsd4LwlsRUQOKcwn8B\",\"email\":\"king@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '267', '127.0.0.1', '2019-03-07 17:35:05');
INSERT INTO `sys_log` VALUES ('137', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":15,\"schoolId\":1,\"username\":\"金双齐\",\"salt\":\"VcRsd4LwlsRUQOKcwn8B\",\"email\":\"king@qq.com\",\"mobile\":\"15626475985\",\"status\":0,\"roleIdList\":[1],\"createUserId\":1}]', '266', '127.0.0.1', '2019-03-07 17:39:37');
INSERT INTO `sys_log` VALUES ('138', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":15,\"schoolId\":1,\"username\":\"金双齐\",\"salt\":\"VcRsd4LwlsRUQOKcwn8B\",\"email\":\"king@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '263', '127.0.0.1', '2019-03-07 17:39:56');
INSERT INTO `sys_log` VALUES ('139', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":15,\"schoolId\":1,\"username\":\"金双齐\",\"salt\":\"VcRsd4LwlsRUQOKcwn8B\",\"email\":\"king@qq.com\",\"mobile\":\"15626475985\",\"status\":0,\"roleIdList\":[1],\"createUserId\":1}]', '264', '127.0.0.1', '2019-03-07 17:44:43');
INSERT INTO `sys_log` VALUES ('140', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":15,\"schoolId\":1,\"username\":\"金双齐\",\"salt\":\"VcRsd4LwlsRUQOKcwn8B\",\"email\":\"king@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '276', '127.0.0.1', '2019-03-07 17:45:15');
INSERT INTO `sys_log` VALUES ('141', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":15,\"schoolId\":1,\"username\":\"金双齐\",\"salt\":\"VcRsd4LwlsRUQOKcwn8B\",\"email\":\"king@qq.com\",\"mobile\":\"15626475985\",\"status\":0,\"roleIdList\":[1],\"createUserId\":1}]', '280', '127.0.0.1', '2019-03-07 17:49:05');
INSERT INTO `sys_log` VALUES ('142', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":15,\"schoolId\":1,\"username\":\"金双齐\",\"salt\":\"VcRsd4LwlsRUQOKcwn8B\",\"email\":\"king@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '267', '127.0.0.1', '2019-03-07 17:49:18');
INSERT INTO `sys_log` VALUES ('143', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":15,\"schoolId\":1,\"username\":\"金双齐\",\"salt\":\"VcRsd4LwlsRUQOKcwn8B\",\"email\":\"king@qq.com\",\"mobile\":\"15626475985\",\"status\":0,\"roleIdList\":[1],\"createUserId\":1}]', '263', '127.0.0.1', '2019-03-07 17:49:43');
INSERT INTO `sys_log` VALUES ('144', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":16,\"schoolId\":1,\"username\":\"余长胜\",\"password\":\"a97abf85b9a5026c90362ace2fc74b7e06b897367e049521af8d17f4ef4eb89e\",\"salt\":\"jbk1DfJDwQrzxaKISwOe\",\"email\":\"123@qq.com\",\"mobile\":\"16562616161\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Mar 8, 2019 12:35:44 PM\"}]', '416', '127.0.0.1', '2019-03-08 12:35:45');
INSERT INTO `sys_log` VALUES ('145', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":69,\"parentId\":68,\"name\":\"审批\",\"perms\":\"taoliyuan:myuserschool:approval,taoliyuan:myuserschool:info\",\"type\":2,\"orderNum\":0}]', '72', '127.0.0.1', '2019-03-19 17:27:20');
INSERT INTO `sys_log` VALUES ('146', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":68,\"parentId\":38,\"name\":\"待审批\",\"url\":\"taoliyuan/user/myuserapply\",\"perms\":\"taoliyuan:myuserschool:listApplyingUser\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":1}]', '74', '127.0.0.1', '2019-03-19 17:30:19');
INSERT INTO `sys_log` VALUES ('147', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":80,\"parentId\":38,\"name\":\"已审批记录\",\"url\":\"taoliyuan/user/applyed\",\"perms\":\"taoliyuan:myuserschool:listApplyedUser\",\"type\":1,\"icon\":\"duanxin\",\"orderNum\":2}]', '55', '127.0.0.1', '2019-03-19 17:30:41');
INSERT INTO `sys_log` VALUES ('148', 'admin', '删除定时任务', 'io.renren.modules.job.controller.ScheduleJobController.delete()', '[[2]]', '171', '127.0.0.1', '2019-03-19 17:55:58');
INSERT INTO `sys_log` VALUES ('149', 'admin', '删除定时任务', 'io.renren.modules.job.controller.ScheduleJobController.delete()', '[[1]]', '172', '127.0.0.1', '2019-03-19 17:56:02');
INSERT INTO `sys_log` VALUES ('150', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":83,\"parentId\":68,\"name\":\"修改分会\",\"perms\":\"taoliyuan:myuserschool:info\",\"type\":2,\"orderNum\":0}]', '60', '127.0.0.1', '2019-03-19 19:18:14');
INSERT INTO `sys_log` VALUES ('151', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":15,\"schoolId\":1,\"username\":\"金双齐\",\"password\":\"b5abe06c96cd8023107c63ee083cb9d9bf9b75ae0192dde3b3ff8dfb88b5b888\",\"salt\":\"VcRsd4LwlsRUQOKcwn8B\",\"email\":\"king@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1}]', '289', '127.0.0.1', '2019-03-19 20:22:08');
INSERT INTO `sys_log` VALUES ('152', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":15,\"schoolId\":1,\"username\":\"金双齐\",\"password\":\"b5abe06c96cd8023107c63ee083cb9d9bf9b75ae0192dde3b3ff8dfb88b5b888\",\"salt\":\"VcRsd4LwlsRUQOKcwn8B\",\"email\":\"king@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1}]', '118', '127.0.0.1', '2019-03-19 20:24:31');
INSERT INTO `sys_log` VALUES ('153', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":15,\"schoolId\":1,\"username\":\"金双齐\",\"password\":\"b5abe06c96cd8023107c63ee083cb9d9bf9b75ae0192dde3b3ff8dfb88b5b888\",\"salt\":\"VcRsd4LwlsRUQOKcwn8B\",\"email\":\"king@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', '138', '127.0.0.1', '2019-03-20 14:49:39');
INSERT INTO `sys_log` VALUES ('154', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":18,\"schoolId\":1,\"username\":\"test\",\"password\":\"7819e79cb4ac7e462bbb9dc0b23780d49a677f35bef0f175e9302b15bcc5878d\",\"salt\":\"71CQIKBXxhzGhXt9lnbL\",\"email\":\"123@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Mar 20, 2019 4:47:57 PM\"}]', '51764', '127.0.0.1', '2019-03-20 16:47:58');
INSERT INTO `sys_log` VALUES ('155', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":21,\"schoolId\":1,\"username\":\"test\",\"password\":\"9ca50e3d358b925c28b965f17fbde7abd20da88bfad477e079589a2b2d1e8c6c\",\"salt\":\"QW6IjyXkWBrYndFtn09t\",\"email\":\"123@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[3],\"schoolIdList\":[9,8],\"createUserId\":1,\"createTime\":\"Mar 20, 2019 5:04:11 PM\"}]', '23054', '127.0.0.1', '2019-03-20 17:04:12');
INSERT INTO `sys_log` VALUES ('156', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":22,\"schoolId\":1,\"username\":\"test\",\"password\":\"4acbcd3be9257d66b3834f9718c19e2d299f1e0dab6648195cecf9ba57c8f46f\",\"salt\":\"qpZNLzItZGKRNUDUKhte\",\"email\":\"123@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[3],\"schoolIdList\":[9,8],\"createUserId\":1,\"createTime\":\"Mar 20, 2019 5:05:45 PM\"}]', '19898', '127.0.0.1', '2019-03-20 17:06:01');
INSERT INTO `sys_log` VALUES ('157', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":23,\"schoolId\":1,\"username\":\"test1\",\"password\":\"d4269f5c024ff04d86758fb877f5875e086d1ce6b281daaebd91f450652124ac\",\"salt\":\"GC3VDmGu6NfVQO36ED4C\",\"email\":\"123@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[3],\"schoolIdList\":[9,8],\"createUserId\":1,\"createTime\":\"Mar 20, 2019 5:07:11 PM\"}]', '89', '127.0.0.1', '2019-03-20 17:07:11');
INSERT INTO `sys_log` VALUES ('158', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":24,\"schoolId\":1,\"username\":\"金双齐\",\"password\":\"231f739975cfe47819cbbbe51dbfeb0de002ebaa76f894955fa4624c37acc404\",\"salt\":\"ZxhYEOriMF7gxmBbfniL\",\"email\":\"123@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[3],\"schoolIdList\":[9,8],\"createUserId\":1,\"createTime\":\"Mar 20, 2019 5:08:10 PM\"}]', '84', '127.0.0.1', '2019-03-20 17:08:10');
INSERT INTO `sys_log` VALUES ('159', 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[23]]', '100', '127.0.0.1', '2019-03-20 17:22:48');
INSERT INTO `sys_log` VALUES ('160', 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[22]]', '60', '127.0.0.1', '2019-03-20 17:23:10');
INSERT INTO `sys_log` VALUES ('161', 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[24]]', '55', '127.0.0.1', '2019-03-20 17:29:24');
INSERT INTO `sys_log` VALUES ('162', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":25,\"schoolId\":1,\"userType\":3,\"username\":\"金双齐\",\"password\":\"52456f554484688abec82050cdecc3f974088caab1b23e2a601bdef026f3b7d0\",\"salt\":\"KPKW5JLjygv84E4dUq8h\",\"email\":\"1234@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[3],\"schoolIdList\":[9,8],\"createUserId\":1,\"createTime\":\"Mar 20, 2019 5:29:42 PM\"}]', '256', '127.0.0.1', '2019-03-20 17:29:43');
INSERT INTO `sys_log` VALUES ('163', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":25,\"schoolId\":1,\"userType\":3,\"username\":\"金双齐\",\"password\":\"52456f554484688abec82050cdecc3f974088caab1b23e2a601bdef026f3b7d0\",\"salt\":\"KPKW5JLjygv84E4dUq8h\",\"email\":\"1234@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[3],\"schoolIdList\":[8],\"createUserId\":1}]', '303', '127.0.0.1', '2019-03-20 20:25:10');
INSERT INTO `sys_log` VALUES ('164', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":25,\"schoolId\":1,\"userType\":3,\"username\":\"金双齐\",\"salt\":\"KPKW5JLjygv84E4dUq8h\",\"email\":\"1234@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[3],\"schoolIdList\":[2],\"createUserId\":1}]', '142', '127.0.0.1', '2019-03-20 20:25:27');
INSERT INTO `sys_log` VALUES ('165', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":25,\"schoolId\":1,\"userType\":3,\"username\":\"金双齐\",\"password\":\"52456f554484688abec82050cdecc3f974088caab1b23e2a601bdef026f3b7d0\",\"salt\":\"KPKW5JLjygv84E4dUq8h\",\"email\":\"1234@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[3],\"schoolIdList\":[2,3,5],\"createUserId\":1}]', '328', '127.0.0.1', '2019-03-21 11:03:08');
INSERT INTO `sys_log` VALUES ('166', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":25,\"schoolId\":1,\"userType\":3,\"username\":\"金双齐\",\"password\":\"52456f554484688abec82050cdecc3f974088caab1b23e2a601bdef026f3b7d0\",\"salt\":\"KPKW5JLjygv84E4dUq8h\",\"email\":\"1234@qq.com\",\"mobile\":\"15626475985\",\"status\":0,\"roleIdList\":[3],\"schoolIdList\":[2,3,5],\"createUserId\":1}]', '343', '127.0.0.1', '2019-03-21 12:39:36');
INSERT INTO `sys_log` VALUES ('167', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":25,\"schoolId\":1,\"userType\":3,\"username\":\"金双齐\",\"salt\":\"KPKW5JLjygv84E4dUq8h\",\"email\":\"1234@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[3],\"schoolIdList\":[],\"createUserId\":1}]', '131', '127.0.0.1', '2019-03-21 12:39:44');
INSERT INTO `sys_log` VALUES ('168', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":87,\"parentId\":85,\"name\":\"修改\",\"perms\":\"taoliyuan:myforummodule:update,taoliyuan:myforummodule:info\",\"type\":2,\"orderNum\":0}]', '70', '127.0.0.1', '2019-03-21 16:56:15');
INSERT INTO `sys_log` VALUES ('169', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":25,\"userType\":3,\"username\":\"金双齐\",\"salt\":\"KPKW5JLjygv84E4dUq8h\",\"email\":\"1234@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[3],\"schoolIdList\":[3],\"createUserId\":1}]', '322', '127.0.0.1', '2019-03-25 14:26:47');
INSERT INTO `sys_log` VALUES ('170', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":25,\"userType\":3,\"username\":\"金双齐\",\"password\":\"52456f554484688abec82050cdecc3f974088caab1b23e2a601bdef026f3b7d0\",\"salt\":\"KPKW5JLjygv84E4dUq8h\",\"email\":\"1234@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[3],\"schoolIdList\":[3,2],\"createUserId\":1}]', '324', '127.0.0.1', '2019-03-25 16:12:54');
INSERT INTO `sys_log` VALUES ('171', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":39,\"parentId\":38,\"name\":\"用户列表\",\"url\":\"taoliyuan/user/myuser\",\"perms\":\"taoliyuan:myuser:list,taoliyuan:myschool:list\",\"type\":1,\"icon\":\"admin\",\"orderNum\":0}]', '67', '127.0.0.1', '2019-03-25 17:33:06');
INSERT INTO `sys_log` VALUES ('172', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":41,\"parentId\":39,\"name\":\"查询\",\"perms\":\"taoliyuan:myuser:list,taoliyuan:myuser:info,taoliyuan:myschool:list\",\"type\":2,\"orderNum\":0}]', '54', '127.0.0.1', '2019-03-25 17:33:53');
INSERT INTO `sys_log` VALUES ('173', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":26,\"userType\":3,\"username\":\"尚岳宁\",\"password\":\"8a6f659bb707e1de4030b9b86f43f7c382b1d95f9622f2c4facb75064b4d3f1d\",\"salt\":\"v5bQDY2itfrwlrgEmOJO\",\"email\":\"123@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[3],\"schoolIdList\":[2,3,5,6],\"createUserId\":1,\"createTime\":\"Mar 26, 2019 9:26:40 AM\"}]', '606', '127.0.0.1', '2019-03-26 09:26:41');
INSERT INTO `sys_log` VALUES ('174', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":10,\"userType\":2,\"username\":\"sgw\",\"salt\":\"sG05ZtHYTUeJUSsR9Vzx\",\"email\":\"123@qq.com\",\"mobile\":\"13874828374\",\"status\":1,\"roleIdList\":[2],\"schoolIdList\":[1],\"createUserId\":1}]', '25', '127.0.0.1', '2019-03-26 09:27:46');
INSERT INTO `sys_log` VALUES ('175', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":11,\"userType\":2,\"username\":\"汪洋\",\"salt\":\"XzjCWnAgnqO61hYRPZjE\",\"email\":\"123@qq.com\",\"mobile\":\"15682899876\",\"status\":1,\"roleIdList\":[2],\"schoolIdList\":[1],\"createUserId\":1}]', '20', '127.0.0.1', '2019-03-26 09:28:11');
INSERT INTO `sys_log` VALUES ('176', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":27,\"userType\":2,\"username\":\"张文丽\",\"password\":\"ec09a715cc5ff14e112138835c040564d13846b51c562a36e2870ba59826bd55\",\"salt\":\"hnLbaTcPzuRsXwvSqJIR\",\"email\":\"123@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[2],\"schoolIdList\":[1,30],\"createUserId\":1,\"createTime\":\"Mar 26, 2019 9:28:55 AM\"}]', '16', '127.0.0.1', '2019-03-26 09:28:55');
INSERT INTO `sys_log` VALUES ('177', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":12,\"userType\":3,\"username\":\"田亚辉\",\"salt\":\"5z78RFxbGOHcGiuCV4k6\",\"email\":\"924688229@qq.com\",\"mobile\":\"15626475894\",\"status\":1,\"roleIdList\":[3],\"schoolIdList\":[2,3,7],\"createUserId\":1}]', '25', '127.0.0.1', '2019-03-26 09:29:29');
INSERT INTO `sys_log` VALUES ('178', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":16,\"userType\":3,\"username\":\"余长胜\",\"salt\":\"jbk1DfJDwQrzxaKISwOe\",\"email\":\"123@qq.com\",\"mobile\":\"16562616161\",\"status\":1,\"roleIdList\":[3],\"schoolIdList\":[2,3],\"createUserId\":1}]', '24', '127.0.0.1', '2019-03-26 09:29:49');
INSERT INTO `sys_log` VALUES ('179', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":7,\"userType\":1,\"username\":\"haoran\",\"salt\":\"uHPjPRjSunTsnbwHf4dz\",\"email\":\"123@qq.com\",\"mobile\":\"15626482783\",\"status\":1,\"roleIdList\":[1],\"schoolIdList\":[2],\"createUserId\":1}]', '277', '127.0.0.1', '2019-03-26 09:50:18');
INSERT INTO `sys_log` VALUES ('180', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":25,\"userType\":3,\"username\":\"金双齐\",\"password\":\"52456f554484688abec82050cdecc3f974088caab1b23e2a601bdef026f3b7d0\",\"salt\":\"KPKW5JLjygv84E4dUq8h\",\"email\":\"1234@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[3],\"schoolIdList\":[],\"createUserId\":1}]', '306', '127.0.0.1', '2019-03-26 11:06:02');
INSERT INTO `sys_log` VALUES ('181', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":25,\"userType\":2,\"username\":\"金双齐\",\"salt\":\"KPKW5JLjygv84E4dUq8h\",\"email\":\"1234@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[3],\"schoolIdList\":[1],\"createUserId\":1}]', '161', '127.0.0.1', '2019-03-26 11:06:48');
INSERT INTO `sys_log` VALUES ('182', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"学校管理员\",\"createUserId\":1,\"menuIdList\":[70,71,72,73,74,40,41,42,68,69,83,80,82,44,45,46,47,48,49,50,51,52,54,55,56,57,58,59,60,61,-666666,31,38,39]}]', '343', '127.0.0.1', '2019-03-26 11:08:10');
INSERT INTO `sys_log` VALUES ('183', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":25,\"userType\":2,\"username\":\"金双齐\",\"password\":\"52456f554484688abec82050cdecc3f974088caab1b23e2a601bdef026f3b7d0\",\"salt\":\"KPKW5JLjygv84E4dUq8h\",\"email\":\"1234@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[2],\"schoolIdList\":[1],\"createUserId\":1}]', '150', '127.0.0.1', '2019-03-26 11:09:55');
INSERT INTO `sys_log` VALUES ('184', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":7,\"userType\":2,\"username\":\"haoran\",\"salt\":\"uHPjPRjSunTsnbwHf4dz\",\"email\":\"123@qq.com\",\"mobile\":\"15626482783\",\"status\":1,\"roleIdList\":[2],\"schoolIdList\":[1],\"createUserId\":1}]', '148', '127.0.0.1', '2019-03-26 11:10:10');
INSERT INTO `sys_log` VALUES ('185', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":27,\"userType\":2,\"username\":\"张文丽\",\"password\":\"ec09a715cc5ff14e112138835c040564d13846b51c562a36e2870ba59826bd55\",\"salt\":\"hnLbaTcPzuRsXwvSqJIR\",\"email\":\"123@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[2],\"schoolIdList\":[1,30],\"createUserId\":1}]', '290', '127.0.0.1', '2019-03-26 11:30:22');
INSERT INTO `sys_log` VALUES ('186', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":25,\"userType\":1,\"username\":\"金双齐\",\"password\":\"52456f554484688abec82050cdecc3f974088caab1b23e2a601bdef026f3b7d0\",\"salt\":\"KPKW5JLjygv84E4dUq8h\",\"email\":\"1234@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[1],\"schoolIdList\":[],\"createUserId\":1}]', '125', '127.0.0.1', '2019-03-26 11:41:57');
INSERT INTO `sys_log` VALUES ('187', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":25,\"userType\":2,\"username\":\"金双齐\",\"password\":\"52456f554484688abec82050cdecc3f974088caab1b23e2a601bdef026f3b7d0\",\"salt\":\"KPKW5JLjygv84E4dUq8h\",\"email\":\"1234@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[2],\"schoolIdList\":[1,30],\"createUserId\":1}]', '143', '127.0.0.1', '2019-03-26 12:31:15');
INSERT INTO `sys_log` VALUES ('188', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[93]', '9', '127.0.0.1', '2019-03-26 15:15:00');
INSERT INTO `sys_log` VALUES ('189', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[95]', '79', '127.0.0.1', '2019-03-26 15:15:06');
INSERT INTO `sys_log` VALUES ('190', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[94]', '66', '127.0.0.1', '2019-03-26 15:15:11');
INSERT INTO `sys_log` VALUES ('191', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[93]', '68', '127.0.0.1', '2019-03-26 15:15:18');
INSERT INTO `sys_log` VALUES ('192', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":42,\"parentId\":39,\"name\":\"审批\",\"perms\":\"taoliyuan:myuserschool:approval\",\"type\":2,\"orderNum\":0}]', '25', '127.0.0.1', '2019-03-27 09:14:46');
INSERT INTO `sys_log` VALUES ('193', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":25,\"userType\":2,\"username\":\"金双齐\",\"salt\":\"KPKW5JLjygv84E4dUq8h\",\"email\":\"1234@qq.com\",\"mobile\":\"15626475985\",\"status\":1,\"roleIdList\":[2],\"schoolIdList\":[1,30],\"createUserId\":1}]', '343', '127.0.0.1', '2019-03-27 10:12:34');
INSERT INTO `sys_log` VALUES ('194', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":75,\"parentId\":31,\"name\":\"地区管理\",\"url\":\"sys/myregion\",\"perms\":\"taoliyuan:myregion:list\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]', '67', '127.0.0.1', '2019-04-02 19:18:21');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'system', '10');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user', null, '1', 'admin', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role', null, '1', 'role', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu', null, '1', 'menu', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', null, '1', 'sql', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'job/schedule', null, '1', 'job', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'sys/log', 'sys:log:list', '1', 'log', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'oss/oss', 'sys:oss:all', '1', 'oss', '6');
INSERT INTO `sys_menu` VALUES ('31', '0', '学校管理', null, null, '0', 'shouye', '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '学校列表', 'taoliyuan/school/myschool', 'taoliyuan:myschool:list', '1', 'shouye', '0');
INSERT INTO `sys_menu` VALUES ('33', '32', '查询', null, 'taoliyuan:myschool:list,taoliyuan:myschool:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '32', '新增', null, 'taoliyuan:myschool:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '32', '修改', null, 'taoliyuan:myschool:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('37', '32', '删除', null, 'taoliyuan:myschool:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('38', '0', '用户管理', null, null, '0', 'admin', '1');
INSERT INTO `sys_menu` VALUES ('39', '38', '用户列表', 'taoliyuan/user/myuser', 'taoliyuan:myuser:list,taoliyuan:myschool:list', '1', 'admin', '0');
INSERT INTO `sys_menu` VALUES ('40', '39', '新增', null, 'taoliyuan/myuser/save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('41', '39', '查询', null, 'taoliyuan:myuser:list,taoliyuan:myuser:info,taoliyuan:myschool:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('42', '39', '审批', null, 'taoliyuan:myuserschool:approval', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('43', '39', '删除', null, 'taoliyuan:myuser:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('44', '0', '活动管理', null, null, '0', 'sousuo', '2');
INSERT INTO `sys_menu` VALUES ('45', '44', '活动列表', 'taoliyuan/myactivity', 'taoliyuan:myactivity:list', '1', 'sousuo', '0');
INSERT INTO `sys_menu` VALUES ('46', '45', '新增', null, 'taoliyuan:myactivity:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('47', '45', '查询', null, 'taoliyuan:myactivity:list,taoliyuan:myactivity:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('48', '45', '修改', null, 'taoliyuan:myactivity:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('49', '45', '删除', null, 'taoliyuan:myactivity:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('50', '0', '建议管理', null, null, '0', 'xiangqufill', '3');
INSERT INTO `sys_menu` VALUES ('51', '50', '建议列表', 'taoliyuan/myadvice', 'taoliyuan:myadvice:list', '1', 'xiangqufill', '0');
INSERT INTO `sys_menu` VALUES ('52', '51', '查询', null, 'taoliyuan:myadvice:list,taoliyuan:myadvice:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('54', '51', '修改', null, 'taoliyuan:myadvice:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('55', '51', '删除', null, 'taoliyuan:myadvice:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('56', '0', '企业管理', null, null, '0', 'oss', '4');
INSERT INTO `sys_menu` VALUES ('57', '56', '企业列表', 'taoliyuan/mycompany', 'taoliyuan:mycompany:list', '1', 'oss', '0');
INSERT INTO `sys_menu` VALUES ('58', '57', '查询', null, 'taoliyuan:mycompany:list,taoliyuan:mycompany:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('59', '57', '新增', null, 'taoliyuan:mycompany:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('60', '57', '修改', null, 'taoliyuan:mycompany:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('61', '57', '删除', null, 'taoliyuan:mycompany:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('62', '0', '校友会管理员', null, null, '0', 'role', '5');
INSERT INTO `sys_menu` VALUES ('63', '62', '管理员列表', 'taoliyuan/myalumniadmin', 'taoliyuan:myalumniadmin:list,taoliyuan:myalumniadmin:info', '1', 'role', '6');
INSERT INTO `sys_menu` VALUES ('64', '63', '增加', null, 'taoliyuan:myalumniadmin:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('65', '63', '修改', null, 'taoliyuan:myalumniadmin:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('66', '63', '修改', null, 'taoliyuan:myalumniadmin:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('67', '63', '删除', null, 'taoliyuan:myalumniadmin:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('68', '38', '待审批', 'taoliyuan/user/myuserapply', 'taoliyuan:myuserschool:listApplyingUser', '1', 'duanxin', '1');
INSERT INTO `sys_menu` VALUES ('69', '68', '审批', null, 'taoliyuan:myuserschool:approval,taoliyuan:myuserschool:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('70', '31', '校友会列表', 'taoliyuan/school/schoolarea', 'taoliyuan:myschool:list', '1', 'shouye', '1');
INSERT INTO `sys_menu` VALUES ('71', '70', '查询', null, 'taoliyuan:myschool:list,taoliyuan:myschool:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('72', '70', '新增', null, 'taoliyuan:myschool:saveschoolarea', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('73', '70', '更新', null, 'taoliyuan:myschool:update,taoliyuan:myschool:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('74', '70', '删除', null, 'taoliyuan:myschool:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('75', '31', '地区管理', 'sys/myregion', 'taoliyuan:myregion:list', '1', 'daohang', '0');
INSERT INTO `sys_menu` VALUES ('76', '75', '新增', null, 'taoliyuan:myregion:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('77', '75', '查询', null, 'taoliyuan:myregion:info,taoliyuan:myregion:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('78', '75', '修改', null, 'taoliyuan:myregion:update,taoliyuan:myregion:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('79', '75', '删除', null, 'taoliyuan:myregion:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('80', '38', '已审批记录', 'taoliyuan/user/applyed', 'taoliyuan:myuserschool:listApplyedUser', '1', 'duanxin', '2');
INSERT INTO `sys_menu` VALUES ('82', '80', '查询', null, 'taoliyuan:myuserapply:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('83', '68', '修改分会', null, 'taoliyuan:myuserschool:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('84', '0', '论坛管理', null, null, '0', 'bianji', '7');
INSERT INTO `sys_menu` VALUES ('85', '84', '模块列表', 'taoliyuan/forum/myforummodule', 'taoliyuan:forum:mymodule', '1', 'log', '0');
INSERT INTO `sys_menu` VALUES ('86', '85', '增加', null, 'taoliyuan:myforummodule:save,taoliyuan:myforummodule:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('87', '85', '修改', null, 'taoliyuan:myforummodule:update,taoliyuan:myforummodule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('88', '85', '删除', null, 'taoliyuan:myforummodule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('89', '84', '模块子类列表', 'taoliyuan/forum/myforummodulesubclass', 'taoliyuan:myforummodulesubclass:list', '1', 'log', '1');
INSERT INTO `sys_menu` VALUES ('90', '89', '增加', null, 'taoliyuan:myforummodulesubclass:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('91', '89', '修改', null, 'taoliyuan:myforummodulesubclass:update,taoliyuan:myforummodulesubclass:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('92', '89', '删除', null, 'taoliyuan:myforummodulesubclass:delete', '2', null, '0');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO `sys_oss` VALUES ('1', 'https://oss-cn-shenzhen.aliyuncs.com/20190105/469955fe6a4946629a9a174377888134.png', '2019-01-05 18:32:49');
INSERT INTO `sys_oss` VALUES ('2', 'https://oss-cn-shenzhen.aliyuncs.com/20190105/0e3c0177a9be47ae863400eb33b84e6c.jpg', '2019-01-05 18:34:14');
INSERT INTO `sys_oss` VALUES ('3', 'https://oss-cn-shenzhen.aliyuncs.com/20190105/35f291da83bd4629be51a22e5f5bb2b9.jpg', '2019-01-05 18:35:02');
INSERT INTO `sys_oss` VALUES ('4', 'https://oss-cn-shenzhen.aliyuncs.com/20190105/aef155a398fe4cd9b2af585b85c4fd3c.jpg', '2019-01-05 19:04:57');
INSERT INTO `sys_oss` VALUES ('5', 'https://oss-cn-shenzhen.aliyuncs.com/20190105/0dea44f84db0496398dd9f7d26bd2f8d.jpg', '2019-01-05 19:06:47');
INSERT INTO `sys_oss` VALUES ('6', 'https://oss-cn-shenzhen.aliyuncs.com/20190105/9ec3ef2d907647459a483b5047364d2a.jpg', '2019-01-05 19:07:18');
INSERT INTO `sys_oss` VALUES ('7', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190105/5351bbd93def4566bd749811be435fc8.png', '2019-01-05 19:27:28');
INSERT INTO `sys_oss` VALUES ('8', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190105/58ceb927813e490abd9bc2958e2439c9.jpg', '2019-01-05 19:30:55');
INSERT INTO `sys_oss` VALUES ('9', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190105/f3ced08f4d4141fbb9fd96069be02f4b.jpg', '2019-01-05 19:33:46');
INSERT INTO `sys_oss` VALUES ('10', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190105/d146b287f3d4492ca193147f2696ce85.jpg', '2019-01-05 19:33:54');
INSERT INTO `sys_oss` VALUES ('11', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190105/b93a1b1644294dadaae455d3a1e6d91e.jpg', '2019-01-05 19:34:06');
INSERT INTO `sys_oss` VALUES ('12', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190105/d2dba016d661408d8ebde44b2b36759f.jpg', '2019-01-05 19:43:19');
INSERT INTO `sys_oss` VALUES ('13', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/93c9239023974230a1cdcfd8bf693dc7.jpg', '2019-01-06 18:25:49');
INSERT INTO `sys_oss` VALUES ('14', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/00af53752c8443118f23f3d29aaec223.jpg', '2019-01-06 18:28:05');
INSERT INTO `sys_oss` VALUES ('15', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/79da03d81dfb41ec9bd37d4b5d8e256f.jpg', '2019-01-06 18:29:45');
INSERT INTO `sys_oss` VALUES ('16', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/efcb31a690ec417d98c92cf086fb3ef8.png', '2019-01-06 19:00:09');
INSERT INTO `sys_oss` VALUES ('17', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/5a78e37401fb48359732c35670deb8f1.jpg', '2019-01-06 19:16:38');
INSERT INTO `sys_oss` VALUES ('18', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/2e1210175da945d288deea3e15a6ebf8.jpg', '2019-01-06 19:16:53');
INSERT INTO `sys_oss` VALUES ('19', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/c5b77bd02fb44253bb9b49d20ffc48df.jpg', '2019-01-06 19:20:19');
INSERT INTO `sys_oss` VALUES ('20', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/f281844dc26c47f5b87bad353672f7c0.jpg', '2019-01-06 19:21:28');
INSERT INTO `sys_oss` VALUES ('21', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/b1b82a7e50cb46edbf002bc9b6ac02ab.jpg', '2019-01-06 19:21:38');
INSERT INTO `sys_oss` VALUES ('22', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/367d7f6269144688b3ad42fb7bd36f42.jpg', '2019-01-06 19:23:23');
INSERT INTO `sys_oss` VALUES ('23', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/449cba2978254b0ebcf68a8a0f214045.jpg', '2019-01-06 19:24:03');
INSERT INTO `sys_oss` VALUES ('24', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/c63f3904396f465b8b80f0ae71105fed.jpg', '2019-01-06 19:26:17');
INSERT INTO `sys_oss` VALUES ('25', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/8ced7ef8d39141c1bd888da78423600b.jpg', '2019-01-06 19:26:42');
INSERT INTO `sys_oss` VALUES ('26', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/fb26ae5351104777b77d98c719fff19e.jpg', '2019-01-06 19:26:52');
INSERT INTO `sys_oss` VALUES ('27', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/19bfb6742c34408faf0bb3570e1da0fd.jpg', '2019-01-06 19:27:38');
INSERT INTO `sys_oss` VALUES ('28', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/b73c1535aa4c488f88ef568ce8251403.jpg', '2019-01-06 19:27:43');
INSERT INTO `sys_oss` VALUES ('29', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190106/903fa494a01441e79f4922db10424bd0.jpg', '2019-01-06 19:30:06');
INSERT INTO `sys_oss` VALUES ('30', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190107/46ee84547a184c10add1f739124717ea.jpg', '2019-01-07 21:25:10');
INSERT INTO `sys_oss` VALUES ('31', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190107/f6bb8f6a02ab444f9ee8c670576dbfc0.jpg', '2019-01-07 21:51:35');
INSERT INTO `sys_oss` VALUES ('32', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190112/587fa9223ad048229b044bc321ff9a1a.png', '2019-01-12 11:16:10');
INSERT INTO `sys_oss` VALUES ('33', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190112/ee1580282e3a4b119670ff461d1dd997.png', '2019-01-12 11:16:15');
INSERT INTO `sys_oss` VALUES ('34', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190113/ea83196807a043a5a8d1f4de5f184045.jpg', '2019-01-13 19:13:47');
INSERT INTO `sys_oss` VALUES ('35', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190113/0a6a7daea2bc429cad466c888d90c432.jpg', '2019-01-13 19:14:21');
INSERT INTO `sys_oss` VALUES ('36', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190113/7c14667911004b739a3fbc3d37d8a084.png', '2019-01-13 22:25:21');
INSERT INTO `sys_oss` VALUES ('37', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190113/418edd0c8b4f4c63b2cdbfe7a97cdd0a.jpg', '2019-01-13 22:37:09');
INSERT INTO `sys_oss` VALUES ('38', 'https://taoliyuan.oss-cn-shenzhen.aliyuncs.com/20190113/8c0cf36ada244980acd0d7a4c9a61e50.png', '2019-01-13 22:48:35');
INSERT INTO `sys_oss` VALUES ('39', 'https://ourtaoliyuan.oss-cn-shenzhen.aliyuncs.com/20190114/37c079bf668f4f0fa58f5100cfc0d5e2.jpg', '2019-01-14 16:15:38');
INSERT INTO `sys_oss` VALUES ('40', 'https://ourtaoliyuan.oss-cn-shenzhen.aliyuncs.com/20190119/1d0d147c837142c7948c91737e631956.jpg', '2019-01-19 17:59:58');
INSERT INTO `sys_oss` VALUES ('41', 'https://ourtaoliyuan.oss-cn-shenzhen.aliyuncs.com/20190119/a9084281674e4bc2b1aa3c682f3937f5.jpg', '2019-01-19 18:00:58');
INSERT INTO `sys_oss` VALUES ('42', 'https://ourtaoliyuan.oss-cn-shenzhen.aliyuncs.com/20190119/bc6a8d84a498404a89b3b5d01689f70d.jpg', '2019-01-19 18:17:08');
INSERT INTO `sys_oss` VALUES ('43', 'https://ourtaoliyuan.oss-cn-shenzhen.aliyuncs.com/20190120/b6c9415523e345ffa343ca90f11d41bf.jpg', '2019-01-20 10:13:58');
INSERT INTO `sys_oss` VALUES ('44', 'https://ourtaoliyuan.oss-cn-shenzhen.aliyuncs.com/20190120/33fd28d2dd2c4b68b50c856449e23452.jpg', '2019-01-20 10:14:29');
INSERT INTO `sys_oss` VALUES ('45', 'https://ourtaoliyuan.oss-cn-shenzhen.aliyuncs.com/20190120/72e299ce92f544b18b99cde77ce833ec.jpg', '2019-01-20 10:36:22');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '平台管理员', null, '1', '2019-01-07 21:00:35');
INSERT INTO `sys_role` VALUES ('2', '学校管理员', null, '1', '2019-01-13 22:03:58');
INSERT INTO `sys_role` VALUES ('3', '校友会管理员', null, '1', '2019-01-13 22:04:32');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('163', '3', '40');
INSERT INTO `sys_role_menu` VALUES ('164', '3', '41');
INSERT INTO `sys_role_menu` VALUES ('165', '3', '42');
INSERT INTO `sys_role_menu` VALUES ('166', '3', '68');
INSERT INTO `sys_role_menu` VALUES ('167', '3', '69');
INSERT INTO `sys_role_menu` VALUES ('168', '3', '80');
INSERT INTO `sys_role_menu` VALUES ('169', '3', '82');
INSERT INTO `sys_role_menu` VALUES ('170', '3', '44');
INSERT INTO `sys_role_menu` VALUES ('171', '3', '45');
INSERT INTO `sys_role_menu` VALUES ('172', '3', '46');
INSERT INTO `sys_role_menu` VALUES ('173', '3', '47');
INSERT INTO `sys_role_menu` VALUES ('174', '3', '48');
INSERT INTO `sys_role_menu` VALUES ('175', '3', '49');
INSERT INTO `sys_role_menu` VALUES ('176', '3', '50');
INSERT INTO `sys_role_menu` VALUES ('177', '3', '51');
INSERT INTO `sys_role_menu` VALUES ('178', '3', '52');
INSERT INTO `sys_role_menu` VALUES ('179', '3', '54');
INSERT INTO `sys_role_menu` VALUES ('180', '3', '55');
INSERT INTO `sys_role_menu` VALUES ('181', '3', '56');
INSERT INTO `sys_role_menu` VALUES ('182', '3', '57');
INSERT INTO `sys_role_menu` VALUES ('183', '3', '58');
INSERT INTO `sys_role_menu` VALUES ('184', '3', '59');
INSERT INTO `sys_role_menu` VALUES ('185', '3', '60');
INSERT INTO `sys_role_menu` VALUES ('186', '3', '61');
INSERT INTO `sys_role_menu` VALUES ('187', '3', '-666666');
INSERT INTO `sys_role_menu` VALUES ('188', '3', '38');
INSERT INTO `sys_role_menu` VALUES ('189', '3', '39');
INSERT INTO `sys_role_menu` VALUES ('191', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('192', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('193', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('194', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('195', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('196', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('197', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('198', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('199', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('200', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('201', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('202', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('203', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('204', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('205', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('206', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('207', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('208', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('209', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('210', '1', '8');
INSERT INTO `sys_role_menu` VALUES ('211', '1', '9');
INSERT INTO `sys_role_menu` VALUES ('212', '1', '10');
INSERT INTO `sys_role_menu` VALUES ('213', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('214', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('215', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('216', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('217', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('218', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('219', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('220', '1', '75');
INSERT INTO `sys_role_menu` VALUES ('221', '1', '76');
INSERT INTO `sys_role_menu` VALUES ('222', '1', '77');
INSERT INTO `sys_role_menu` VALUES ('223', '1', '78');
INSERT INTO `sys_role_menu` VALUES ('224', '1', '79');
INSERT INTO `sys_role_menu` VALUES ('225', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('226', '1', '32');
INSERT INTO `sys_role_menu` VALUES ('227', '1', '33');
INSERT INTO `sys_role_menu` VALUES ('228', '1', '34');
INSERT INTO `sys_role_menu` VALUES ('229', '1', '36');
INSERT INTO `sys_role_menu` VALUES ('230', '1', '37');
INSERT INTO `sys_role_menu` VALUES ('231', '1', '70');
INSERT INTO `sys_role_menu` VALUES ('232', '1', '71');
INSERT INTO `sys_role_menu` VALUES ('233', '1', '72');
INSERT INTO `sys_role_menu` VALUES ('234', '1', '73');
INSERT INTO `sys_role_menu` VALUES ('235', '1', '74');
INSERT INTO `sys_role_menu` VALUES ('236', '1', '38');
INSERT INTO `sys_role_menu` VALUES ('237', '1', '39');
INSERT INTO `sys_role_menu` VALUES ('238', '1', '40');
INSERT INTO `sys_role_menu` VALUES ('239', '1', '41');
INSERT INTO `sys_role_menu` VALUES ('240', '1', '42');
INSERT INTO `sys_role_menu` VALUES ('241', '1', '43');
INSERT INTO `sys_role_menu` VALUES ('242', '1', '68');
INSERT INTO `sys_role_menu` VALUES ('243', '1', '69');
INSERT INTO `sys_role_menu` VALUES ('244', '1', '80');
INSERT INTO `sys_role_menu` VALUES ('245', '1', '82');
INSERT INTO `sys_role_menu` VALUES ('246', '1', '44');
INSERT INTO `sys_role_menu` VALUES ('247', '1', '45');
INSERT INTO `sys_role_menu` VALUES ('248', '1', '46');
INSERT INTO `sys_role_menu` VALUES ('249', '1', '47');
INSERT INTO `sys_role_menu` VALUES ('250', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('251', '1', '49');
INSERT INTO `sys_role_menu` VALUES ('252', '1', '50');
INSERT INTO `sys_role_menu` VALUES ('253', '1', '51');
INSERT INTO `sys_role_menu` VALUES ('254', '1', '52');
INSERT INTO `sys_role_menu` VALUES ('255', '1', '54');
INSERT INTO `sys_role_menu` VALUES ('256', '1', '55');
INSERT INTO `sys_role_menu` VALUES ('257', '1', '56');
INSERT INTO `sys_role_menu` VALUES ('258', '1', '57');
INSERT INTO `sys_role_menu` VALUES ('259', '1', '58');
INSERT INTO `sys_role_menu` VALUES ('260', '1', '59');
INSERT INTO `sys_role_menu` VALUES ('261', '1', '60');
INSERT INTO `sys_role_menu` VALUES ('262', '1', '61');
INSERT INTO `sys_role_menu` VALUES ('263', '1', '62');
INSERT INTO `sys_role_menu` VALUES ('264', '1', '63');
INSERT INTO `sys_role_menu` VALUES ('265', '1', '64');
INSERT INTO `sys_role_menu` VALUES ('266', '1', '65');
INSERT INTO `sys_role_menu` VALUES ('267', '1', '66');
INSERT INTO `sys_role_menu` VALUES ('268', '1', '67');
INSERT INTO `sys_role_menu` VALUES ('269', '1', '-666666');
INSERT INTO `sys_role_menu` VALUES ('270', '2', '70');
INSERT INTO `sys_role_menu` VALUES ('271', '2', '71');
INSERT INTO `sys_role_menu` VALUES ('272', '2', '72');
INSERT INTO `sys_role_menu` VALUES ('273', '2', '73');
INSERT INTO `sys_role_menu` VALUES ('274', '2', '74');
INSERT INTO `sys_role_menu` VALUES ('275', '2', '40');
INSERT INTO `sys_role_menu` VALUES ('276', '2', '41');
INSERT INTO `sys_role_menu` VALUES ('277', '2', '42');
INSERT INTO `sys_role_menu` VALUES ('278', '2', '68');
INSERT INTO `sys_role_menu` VALUES ('279', '2', '69');
INSERT INTO `sys_role_menu` VALUES ('280', '2', '83');
INSERT INTO `sys_role_menu` VALUES ('281', '2', '80');
INSERT INTO `sys_role_menu` VALUES ('282', '2', '82');
INSERT INTO `sys_role_menu` VALUES ('283', '2', '44');
INSERT INTO `sys_role_menu` VALUES ('284', '2', '45');
INSERT INTO `sys_role_menu` VALUES ('285', '2', '46');
INSERT INTO `sys_role_menu` VALUES ('286', '2', '47');
INSERT INTO `sys_role_menu` VALUES ('287', '2', '48');
INSERT INTO `sys_role_menu` VALUES ('288', '2', '49');
INSERT INTO `sys_role_menu` VALUES ('289', '2', '50');
INSERT INTO `sys_role_menu` VALUES ('290', '2', '51');
INSERT INTO `sys_role_menu` VALUES ('291', '2', '52');
INSERT INTO `sys_role_menu` VALUES ('292', '2', '54');
INSERT INTO `sys_role_menu` VALUES ('293', '2', '55');
INSERT INTO `sys_role_menu` VALUES ('294', '2', '56');
INSERT INTO `sys_role_menu` VALUES ('295', '2', '57');
INSERT INTO `sys_role_menu` VALUES ('296', '2', '58');
INSERT INTO `sys_role_menu` VALUES ('297', '2', '59');
INSERT INTO `sys_role_menu` VALUES ('298', '2', '60');
INSERT INTO `sys_role_menu` VALUES ('299', '2', '61');
INSERT INTO `sys_role_menu` VALUES ('300', '2', '-666666');
INSERT INTO `sys_role_menu` VALUES ('301', '2', '31');
INSERT INTO `sys_role_menu` VALUES ('302', '2', '38');
INSERT INTO `sys_role_menu` VALUES ('303', '2', '39');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_type` smallint(10) DEFAULT NULL COMMENT '用户类型:1,平台管理，2学校管理，3，校友会管理',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'jsqfengbao@qq.com', '110', '1', '1', '2018-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '2', '1');
INSERT INTO `sys_user_role` VALUES ('2', '3', '1');
INSERT INTO `sys_user_role` VALUES ('3', '4', '1');
INSERT INTO `sys_user_role` VALUES ('4', '5', '1');
INSERT INTO `sys_user_role` VALUES ('5', '1', '1');
INSERT INTO `sys_user_role` VALUES ('6', '6', '3');
INSERT INTO `sys_user_role` VALUES ('8', '8', '3');
INSERT INTO `sys_user_role` VALUES ('9', '9', '3');
INSERT INTO `sys_user_role` VALUES ('13', '13', '1');
INSERT INTO `sys_user_role` VALUES ('30', '15', '1');
INSERT INTO `sys_user_role` VALUES ('31', '18', '3');
INSERT INTO `sys_user_role` VALUES ('32', '21', '3');
INSERT INTO `sys_user_role` VALUES ('33', '22', '3');
INSERT INTO `sys_user_role` VALUES ('34', '23', '3');
INSERT INTO `sys_user_role` VALUES ('35', '24', '3');
INSERT INTO `sys_user_role` VALUES ('44', '26', '3');
INSERT INTO `sys_user_role` VALUES ('45', '10', '2');
INSERT INTO `sys_user_role` VALUES ('46', '11', '2');
INSERT INTO `sys_user_role` VALUES ('48', '12', '3');
INSERT INTO `sys_user_role` VALUES ('49', '16', '3');
INSERT INTO `sys_user_role` VALUES ('54', '7', '2');
INSERT INTO `sys_user_role` VALUES ('55', '27', '2');
INSERT INTO `sys_user_role` VALUES ('58', '25', '2');

-- ----------------------------
-- Table structure for sys_user_school
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_school`;
CREATE TABLE `sys_user_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_user_id` int(11) NOT NULL COMMENT '系统用户表ID',
  `school_id` int(11) NOT NULL COMMENT 'my_school表ID',
  `enabled` tinyint(4) DEFAULT '1' COMMENT '是否有效',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_school
-- ----------------------------
INSERT INTO `sys_user_school` VALUES ('17', '2', '1', '1', '2019-03-24 11:24:44', '2019-03-24 11:24:44');
INSERT INTO `sys_user_school` VALUES ('22', '26', '2', '1', '2019-03-26 09:26:40', '2019-03-26 09:26:40');
INSERT INTO `sys_user_school` VALUES ('23', '26', '3', '1', '2019-03-26 09:26:40', '2019-03-26 09:26:40');
INSERT INTO `sys_user_school` VALUES ('24', '26', '5', '1', '2019-03-26 09:26:40', '2019-03-26 09:26:40');
INSERT INTO `sys_user_school` VALUES ('25', '26', '6', '1', '2019-03-26 09:26:40', '2019-03-26 09:26:40');
INSERT INTO `sys_user_school` VALUES ('26', '10', '1', '1', '2019-03-26 09:27:45', '2019-03-26 09:27:45');
INSERT INTO `sys_user_school` VALUES ('27', '11', '1', '1', '2019-03-26 09:28:11', '2019-03-26 09:28:11');
INSERT INTO `sys_user_school` VALUES ('30', '12', '2', '1', '2019-03-26 09:29:29', '2019-03-26 09:29:29');
INSERT INTO `sys_user_school` VALUES ('31', '12', '3', '1', '2019-03-26 09:29:29', '2019-03-26 09:29:29');
INSERT INTO `sys_user_school` VALUES ('32', '12', '7', '1', '2019-03-26 09:29:29', '2019-03-26 09:29:29');
INSERT INTO `sys_user_school` VALUES ('33', '16', '2', '1', '2019-03-26 09:29:49', '2019-03-26 09:29:49');
INSERT INTO `sys_user_school` VALUES ('34', '16', '3', '1', '2019-03-26 09:29:49', '2019-03-26 09:29:49');
INSERT INTO `sys_user_school` VALUES ('38', '7', '1', '1', '2019-03-26 11:09:59', '2019-03-26 11:09:59');
INSERT INTO `sys_user_school` VALUES ('39', '27', '1', '1', '2019-03-26 11:30:12', '2019-03-26 11:30:12');
INSERT INTO `sys_user_school` VALUES ('40', '27', '30', '1', '2019-03-26 11:30:12', '2019-03-26 11:30:12');
INSERT INTO `sys_user_school` VALUES ('43', '25', '1', '1', '2019-03-27 10:12:23', '2019-03-27 10:12:23');
INSERT INTO `sys_user_school` VALUES ('44', '25', '30', '1', '2019-03-27 10:12:23', '2019-03-27 10:12:23');

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', '2e1d1ce21cbe12a9438c358da2164da3', '2019-04-06 02:52:09', '2019-04-05 14:52:09');
INSERT INTO `sys_user_token` VALUES ('2', 'ae2adc73f5c5776537c7f1a097a057e1', '2019-01-08 09:00:41', '2019-01-07 21:00:41');
INSERT INTO `sys_user_token` VALUES ('3', '26e9905de212c3dc639a4b476ba83add', '2019-01-14 04:47:49', '2019-01-13 16:47:49');
INSERT INTO `sys_user_token` VALUES ('4', '32fb6c922ebba916f1f74b828d740e87', '2019-01-13 06:50:26', '2019-01-12 18:50:26');
INSERT INTO `sys_user_token` VALUES ('5', '760a7c49fb62a99335649b0e214d1cf9', '2019-03-26 22:12:11', '2019-03-26 10:12:11');
INSERT INTO `sys_user_token` VALUES ('6', 'b40846f2e67928573d54dcf7e7339298', '2019-01-15 01:05:56', '2019-01-14 13:05:56');
INSERT INTO `sys_user_token` VALUES ('7', '877aecb3b388b9e0ebadbfb80e286212', '2019-03-26 23:07:09', '2019-03-26 11:07:09');
INSERT INTO `sys_user_token` VALUES ('8', '3e16b8372f60a766c695898e0ca7b69b', '2019-01-21 23:48:19', '2019-01-21 11:48:19');
INSERT INTO `sys_user_token` VALUES ('9', 'c5be692cc414119efb4093c2d49f1962', '2019-01-22 00:39:04', '2019-01-21 12:39:04');
INSERT INTO `sys_user_token` VALUES ('10', '885771fdf839025dac0e629e659b185c', '2019-02-22 01:47:27', '2019-02-21 13:47:27');
INSERT INTO `sys_user_token` VALUES ('11', 'e0a80eba4e50d2e373d586ee0cbbed9c', '2019-02-20 23:30:03', '2019-02-20 11:30:03');
INSERT INTO `sys_user_token` VALUES ('12', '17daadbe8314bc07b0e87f118ee12571', '2019-03-09 08:23:07', '2019-03-08 20:23:07');
INSERT INTO `sys_user_token` VALUES ('15', '42d3fd0ed57b14e7e7078796b22a0557', '2019-03-21 02:50:51', '2019-03-20 14:50:51');
INSERT INTO `sys_user_token` VALUES ('16', '111a084d70f30e46ba1c52f9433cd1bb', '2019-03-27 01:01:47', '2019-03-26 13:01:47');
INSERT INTO `sys_user_token` VALUES ('25', 'e24d7e195f41350989e07d96551ed036', '2019-03-27 22:12:47', '2019-03-27 10:12:47');
INSERT INTO `sys_user_token` VALUES ('26', '94231aa260b97dbbaee2f2bb965675cb', '2019-03-26 21:37:11', '2019-03-26 09:37:11');
INSERT INTO `sys_user_token` VALUES ('27', '83ea2b355e154d754a652da7dd60ceed', '2019-03-26 23:32:07', '2019-03-26 11:32:07');

-- ----------------------------
-- Table structure for tb_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_token`;
CREATE TABLE `tb_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';

-- ----------------------------
-- Records of tb_token
-- ----------------------------
INSERT INTO `tb_token` VALUES ('395', 'n007lzqqwxvy6ya8fkge3g3zdw4mpsin', '2019-04-07 12:24:39', '2019-04-06 12:24:39');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

-- ----------------------------
-- View structure for view_user_school
-- ----------------------------
DROP VIEW IF EXISTS `view_user_school`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_school` AS select `u`.`id` AS `user_id`,`u`.`name` AS `name`,`u`.`avatar` AS `avatar`,`u`.`in_shool` AS `in_shool`,`u`.`out_shool` AS `out_shool`,`u`.`education` AS `education`,`u`.`depart` AS `depart`,`u`.`latitude` AS `latitude`,`u`.`longitude` AS `longitude`,`s`.`status` AS `status`,`s`.`school_id` AS `school_id`,`s`.`school_parent_id` AS `school_parent_id`,`u`.`current_company` AS `current_company` from (`my_user` `u` left join `my_school_user` `s` on((`u`.`id` = `s`.`user_id`))) ;
SET FOREIGN_KEY_CHECKS=1;
