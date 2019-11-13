# Host: localhost  (Version 5.1.28-rc-community)
# Date: 2019-11-08 12:08:54
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "comment"
#

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `comment_index` int(11) DEFAULT NULL COMMENT '评论序号',
  `comment_title` varchar(50) DEFAULT NULL COMMENT '评论标题',
  `comment_content` varchar(200) DEFAULT NULL COMMENT '评论内容',
  `comment_time` varchar(25) DEFAULT '' COMMENT '评论发布时间',
  `comment_can_show` int(11) NOT NULL DEFAULT '0' COMMENT '是否显示该评论（0显示，1隐藏）',
  `s_id` int(11) DEFAULT NULL COMMENT '关联发布的学生id',
  `u_id` int(11) DEFAULT NULL COMMENT '关联发布的用户id',
  `v_id` int(11) DEFAULT NULL COMMENT '关联对应的视频id',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='评论';

#
# Data for table "comment"
#

INSERT INTO `comment` VALUES (1,0,'d地方','打发士大夫士大夫收到','2019-10-09 00:00:00',0,1,2,1),(2,1,'1111','222','2019-10-09 00:00:00',0,1,2,1),(3,2,'大师傅','的发射点发射点士大夫士大夫v从v现场v','2019-10-10 00:00:00',0,1,2,1),(4,1,'梵蒂冈反对','法国北部愉快愉快','2019-10-10 11:16:44',0,1,2,1),(5,1,'d第个','非官方大哥','2019-10-10 11:16:44',0,2,2,2),(6,0,'f疯分疯分','水水水水水水水水','2019-10-11 09:52:16',0,2,3,5),(20,0,'那你','那你','2019-10-23 11:42:35',0,1,2,5),(22,0,'不得了','了不得','2019-10-23 11:59:43',0,1,2,5),(23,0,'xxx','ccc','2019-10-25 00:16:58',0,1,2,5);

#
# Structure for table "course"
#

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `c_name` varchar(50) DEFAULT NULL COMMENT '课程名称',
  `c_introduction` varchar(500) DEFAULT NULL COMMENT '课程介绍',
  `c_img` varchar(200) DEFAULT NULL COMMENT '课程图片',
  `c_level` int(11) DEFAULT NULL COMMENT '课程级别（1基础课程，2高级课程）',
  `c_statu` int(11) DEFAULT NULL COMMENT '课程状态（0禁用1可用）',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='课程';

#
# Data for table "course"
#

INSERT INTO `course` VALUES (2,'Spring cloud微服务安全实战','采用流行的微服务架构开发，应用程序访问安全将会面临更多更复杂的挑战，尤其是开发者最关心的三大问题：认证授权、可用性、可视化。本课程从简单的API安全入手，过渡到复杂的微服务场景，解决上述三大问题痛点，并结合实际给出相应解决方案。帮助大家形成对安全问题的系统性思考，实战开发一套可在中小公司落地的完整的安全方案。','courseImg/20190924110238.jpg',1,1),(4,'9','9','courseImg/20190927101659.jpg',1,1),(5,'ccc','nnn','courseImg/20191018110435.jpg',1,0),(6,'fff','ddfdfdf','courseImg/20191108113741.jpg',1,1);

#
# Structure for table "course_selection"
#

DROP TABLE IF EXISTS `course_selection`;
CREATE TABLE `course_selection` (
  `cs_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '选课主键id',
  `c_id` int(11) DEFAULT NULL COMMENT '外键关联课程id',
  `s_id` int(11) DEFAULT NULL COMMENT '外键关联学生id',
  `cs_begin_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '学生选这门课的开始时间',
  PRIMARY KEY (`cs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='课程详情';

#
# Data for table "course_selection"
#

INSERT INTO `course_selection` VALUES (1,2,2,'2019-11-08 11:42:55'),(2,4,2,'2019-10-31 14:12:11'),(3,4,2,'2019-11-07 23:45:40'),(14,4,2,'2019-11-07 23:45:24'),(15,4,2,'2019-11-07 23:45:25'),(16,2,2,'2019-10-31 14:12:13'),(17,2,2,'2019-10-31 14:12:14'),(19,5,1,'2019-11-08 11:42:58'),(20,2,1,'2019-10-31 14:45:19'),(21,4,1,'2019-11-07 23:45:26');

#
# Structure for table "menu"
#

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `m_name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `m_url` varchar(100) DEFAULT NULL COMMENT '菜单地址',
  `m_auth` int(11) DEFAULT NULL COMMENT '菜单权限（1管理员，2用户-即教师，3学生）',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';

#
# Data for table "menu"
#


#
# Structure for table "student"
#

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `s_name` varchar(20) DEFAULT NULL COMMENT '学生姓名',
  `s_account` varchar(20) DEFAULT NULL COMMENT '学生账号',
  `s_sex` int(11) DEFAULT NULL COMMENT '学生性别',
  `s_tel` varchar(20) DEFAULT NULL COMMENT '学生电话',
  `s_statu` int(11) NOT NULL DEFAULT '1' COMMENT '学生状态（1可用2禁用）',
  `s_img` varchar(55) DEFAULT NULL,
  `sp_id` int(11) DEFAULT NULL COMMENT '外键密码id',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='学生';

#
# Data for table "student"
#

INSERT INTO `student` VALUES (1,'234','123456',1,'17323480822',1,'studentImg/20191108110304.jpg',1),(2,'222','222222',0,'22',2,'studentImg/20191108120450.jpg',2),(3,'333333','333333',0,'333333',2,'studentImg/20191108120459.jpg',1),(4,'444444','444444',1,'444444',1,'studentImg/20191017115522.jpg',4),(5,'555555','555555',1,'555555',1,'studentImg/20191108120507.jpg',NULL),(6,'666666','666666',1,'666666',1,'studentImg/20191017115522.jpg',NULL),(7,'杨灿','231231',1,'110',1,'studentImg/20191017115522.jpg',1),(8,'dddd','ddd',1,'dddd',1,'studentImg/20191108120523.jpg',5),(9,'nnn','nn',1,'nnn',1,'studentImg/20191108120814.jpg',6);

#
# Structure for table "students_password"
#

DROP TABLE IF EXISTS `students_password`;
CREATE TABLE `students_password` (
  `sp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生密码主键id',
  `sp_password` varchar(50) DEFAULT NULL COMMENT '学生密码',
  PRIMARY KEY (`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='学生密码';

#
# Data for table "students_password"
#

INSERT INTO `students_password` VALUES (1,'123456'),(2,'123456'),(3,'123456'),(4,'444444'),(5,'123456'),(6,'123456');

#
# Structure for table "user_course"
#

DROP TABLE IF EXISTS `user_course`;
CREATE TABLE `user_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '老师id',
  `course_id` int(11) DEFAULT NULL COMMENT '课程id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师和课程';

#
# Data for table "user_course"
#


#
# Structure for table "userinfo"
#

DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `u_account` varchar(50) DEFAULT NULL COMMENT '用户账号',
  `u_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `u_sex` int(11) DEFAULT NULL COMMENT '用户性别',
  `u_tel` varchar(20) DEFAULT NULL COMMENT '用户电话',
  `u_introduction` varchar(500) DEFAULT NULL COMMENT '用户介绍',
  `u_statu` int(11) DEFAULT NULL COMMENT '用户状态（1可用2禁用）',
  `u_img` varchar(500) DEFAULT NULL COMMENT '用户头像（可选功能）',
  `u_level` int(11) DEFAULT NULL,
  `up_id` int(11) DEFAULT NULL COMMENT '外键密码id',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='教师和管理员';

#
# Data for table "userinfo"
#

INSERT INTO `userinfo` VALUES (1,'000000','f分数',1,'123464565','士大夫大师傅士大夫',1,'userImages\\20191108110501.jpg',0,1),(2,'111111','兜兜88',1,'111111','顶顶顶顶顶顶顶',1,'userImages\\20191108113700.jpg',1,1),(3,'333333','3',1,'3','3',1,'userImages\\20191107234615.jpg',1,3),(4,'222222','222222',1,'2222','222',1,'userImages\\20191108111019.jpg',1,4),(5,'444444','444444',1,'444444','444444',1,'userImages\\20191107234913.jpg',1,5),(6,'555555','555555',1,'555555','555555',1,'userImages\\20191107234917.jpg',1,6),(9,'666666','666666',1,'666666','666666',1,'userImages\\20191107234922.jpg',1,8),(10,'777777','777777',1,'777777','777777',1,'userImages\\20191107234904.jpg',1,9);

#
# Structure for table "users_password"
#

DROP TABLE IF EXISTS `users_password`;
CREATE TABLE `users_password` (
  `up_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户密码主键id',
  `up_password` varchar(50) DEFAULT NULL COMMENT '用户密码',
  PRIMARY KEY (`up_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='教师密码';

#
# Data for table "users_password"
#

INSERT INTO `users_password` VALUES (1,'000000'),(2,'111111'),(3,'333333'),(4,'123456'),(5,'444444'),(6,'555555'),(7,'123456'),(8,'123456'),(9,'123456');

#
# Structure for table "video"
#

DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `v_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频id',
  `v_name` varchar(50) DEFAULT NULL COMMENT '视频名称',
  `v_length` varchar(25) DEFAULT NULL COMMENT '视频时长',
  `v_size` float(3,1) DEFAULT NULL COMMENT '视频大小',
  `v_statu` int(11) DEFAULT '0' COMMENT '视频状态（0未审核，1可用，2禁用）',
  `v_url` varchar(50) DEFAULT NULL COMMENT '视频路径',
  `u_id` int(11) DEFAULT NULL COMMENT '外键关联上传的用户id',
  `c_id` int(11) DEFAULT NULL COMMENT '外键关联所属课程',
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='视频';

#
# Data for table "video"
#

INSERT INTO `video` VALUES (1,'yyyy','300',14.2,2,'uploadCourseVideo/20191008091917.mp4',2,2),(2,'ffxxx','5:29',14.2,1,'uploadCourseVideo/20191008094217.mp4',2,4),(3,'bbbb','3:35',9.2,1,'uploadCourseVideo/20191008110909.mp4',2,5),(4,'bbb','5:29',14.2,1,'uploadCourseVideo/20191018111033.mp4',3,2),(5,'mmm','329',14.2,1,'uploadCourseVideo/20191018111245.mp4',2,2),(6,'dddd','5:29',14.2,1,'uploadCourseVideo/20191018111502.mp4',3,2),(7,'11111','12',12.0,1,'uploadCourseVideo/20191018111502.mp4',2,6),(9,'hahaah','329',14.2,0,'uploadCourseVideo/20191108100737.mp4',2,2);

#
# Structure for table "video_selection"
#

DROP TABLE IF EXISTS `video_selection`;
CREATE TABLE `video_selection` (
  `vs_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '选视频主键id',
  `v_id` int(11) DEFAULT NULL COMMENT '外键关联视频id',
  `s_id` int(11) DEFAULT NULL COMMENT '外键关联学生id',
  `v_watch_begin_time` varchar(20) NOT NULL DEFAULT '' COMMENT '学生看这个视频的开始时间',
  `v_watch_time` int(11) DEFAULT NULL COMMENT '视频观看时长(记录单位 秒，可以每360秒记录一次)',
  `is_watch_end` int(11) DEFAULT NULL COMMENT '是否看完(0未看完1看完)',
  PRIMARY KEY (`vs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "video_selection"
#

INSERT INTO `video_selection` VALUES (2,5,5,'2019-09-24 11:14:52',0,0),(3,6,1,'2019-09-24 11:15:08',30,1),(4,7,3,'2019-09-24 11:15:15',0,0),(5,7,3,'2019-09-24 11:15:21',0,0),(6,5,2,'2019-09-24 11:48:35',0,0),(9,5,1,'2019-10-24 23:37:42',300,1),(10,7,1,'2019-10-29 16:55:58',75,1),(11,1,1,'2019-10-31 11:36:40',311,1),(12,2,1,'2019-11-01 09:45:55',10,1),(14,4,1,'2019-11-01 09:54:15',41,1),(15,3,1,'2019-11-08 10:26:32',19,1);
