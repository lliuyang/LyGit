/*
SQLyog v10.2 
MySQL - 5.5.41 : Database - exam
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`exam` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `exam`;

/*Table structure for table `admintable` */

DROP TABLE IF EXISTS `admintable`;

CREATE TABLE `admintable` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `admintable` */

insert  into `admintable`(`uid`,`username`,`password`) values (1,'admin','888');

/*Table structure for table `answerpaper` */

DROP TABLE IF EXISTS `answerpaper`;

CREATE TABLE `answerpaper` (
  `pnums` int(11) NOT NULL COMMENT '试卷的编号',
  `Sno` varchar(20) NOT NULL COMMENT '学号',
  `Cno` varchar(10) NOT NULL COMMENT '课程号',
  `Qno` varchar(200) NOT NULL DEFAULT '0' COMMENT '简答题号',
  `APanswer` varchar(200) DEFAULT NULL COMMENT '学生答案',
  `APscore` int(11) DEFAULT NULL COMMENT '简答题分数',
  `APstate` varchar(5) DEFAULT NULL COMMENT '答题状态',
  `scscore` int(3) DEFAULT NULL COMMENT '单选题总分数',
  `mcscore` int(3) DEFAULT NULL COMMENT '多选题总分数',
  `jscore` int(3) DEFAULT NULL COMMENT '判断题总分数',
  `pname` varchar(50) DEFAULT NULL COMMENT '试卷名',
  PRIMARY KEY (`pnums`,`Sno`,`Cno`,`Qno`),
  KEY `Sno` (`Sno`),
  KEY `Cno` (`Cno`),
  KEY `Qno` (`Qno`),
  CONSTRAINT `paper_pnum` FOREIGN KEY (`pnums`) REFERENCES `paper` (`Pnum`),
  CONSTRAINT `xsdj_ibfk_1` FOREIGN KEY (`Sno`) REFERENCES `student` (`Sno`) ON DELETE CASCADE,
  CONSTRAINT `xsdj_ibfk_2` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `answerpaper` */

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `Cno` varchar(10) NOT NULL COMMENT '课程号',
  `Cname` varchar(20) DEFAULT NULL COMMENT '课程名',
  PRIMARY KEY (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`Cno`,`Cname`) values ('501','计算机组成原理'),('502','英雄联盟基础知识'),('503','语言艺术'),('504','计算机科学与技术');

/*Table structure for table `grade` */

DROP TABLE IF EXISTS `grade`;

CREATE TABLE `grade` (
  `Sno` varchar(15) NOT NULL DEFAULT '' COMMENT '学号',
  `Cno` varchar(8) NOT NULL DEFAULT '' COMMENT '课程号',
  `Sclass` varchar(4) DEFAULT NULL COMMENT '班级',
  `Sscore` int(11) DEFAULT NULL COMMENT '分数',
  `pname` varchar(100) DEFAULT NULL COMMENT '试卷名称',
  PRIMARY KEY (`Sno`,`Cno`),
  KEY `Sno` (`Sno`),
  KEY `Cno` (`Cno`),
  CONSTRAINT `cj_ibfk_1` FOREIGN KEY (`Sno`) REFERENCES `student` (`Sno`) ON DELETE CASCADE,
  CONSTRAINT `cj_ibfk_2` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `grade` */

insert  into `grade`(`Sno`,`Cno`,`Sclass`,`Sscore`,`pname`) values ('2014001','501','203',45,'67'),('2014001','504','203',89,'67'),('2014002','503','203',541,'67'),('2014003','504','203',111,'67'),('2014010','501','011',24,'67');

/*Table structure for table `paper` */

DROP TABLE IF EXISTS `paper`;

CREATE TABLE `paper` (
  `Pnum` int(11) NOT NULL AUTO_INCREMENT COMMENT '试卷号自增',
  `Pname` varchar(200) DEFAULT NULL COMMENT '试卷名',
  `Cno` varchar(10) DEFAULT NULL COMMENT '课程号',
  `Tno` varchar(10) DEFAULT NULL COMMENT '教师号',
  `PStime` datetime DEFAULT NULL COMMENT '开考时间',
  `PEtime` datetime DEFAULT NULL COMMENT '结束时间',
  `SChoice` varchar(200) DEFAULT NULL COMMENT '选择题',
  `SCscore` int(11) DEFAULT NULL COMMENT '选择题分数',
  `MChoice` varchar(200) DEFAULT NULL COMMENT '多选题',
  `MCscore` int(11) DEFAULT NULL COMMENT '多选题分数',
  `Judge` varchar(200) DEFAULT NULL COMMENT '判断题',
  `Jscore` int(11) DEFAULT NULL COMMENT '判断题分数',
  `SAnswer` varchar(200) DEFAULT NULL COMMENT '简答题',
  `SAscore` int(11) DEFAULT NULL COMMENT '简答题分数',
  `PTotalscore` int(11) DEFAULT NULL COMMENT '试卷总分',
  `Pclass` varchar(50) DEFAULT NULL COMMENT '考试班级',
  PRIMARY KEY (`Pnum`),
  KEY `Tno` (`Tno`),
  KEY `Cno` (`Cno`),
  CONSTRAINT `sj_ibfk_1` FOREIGN KEY (`Tno`) REFERENCES `teacher` (`Tno`),
  CONSTRAINT `sj_ibfk_2` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

/*Data for the table `paper` */

insert  into `paper`(`Pnum`,`Pname`,`Cno`,`Tno`,`PStime`,`PEtime`,`SChoice`,`SCscore`,`MChoice`,`MCscore`,`Judge`,`Jscore`,`SAnswer`,`SAscore`,`PTotalscore`,`Pclass`) values (1,'ly测试试卷','501','c01','2017-04-22 01:17:58','2017-04-25 01:18:02','3/4',2,'5/6',4,'1/2',2,'7/9',10,26,'010/011/022/'),(67,'荣辱观辅导上单','501','c01','2017-04-15 00:00:00','2017-04-16 00:00:00','',1,'',2,'592/593/',1,'589/',50,80,'010/011/022/'),(69,'这是正规测试题','502','c01','2017-04-13 00:00:00','2017-04-13 00:00:00','',1,'593/594/',1,'592/597/',1,'596/',50,8,'010/011/'),(70,'dasd as as asd as','501','c01','2017-04-28 00:00:00','2017-04-29 00:00:00','',11,'593/',1,'597/',1,'589/',1,14,'010/011/'),(71,'这是一个测试类 计算机组成原理','501','c01','2017-04-20 00:00:00','2017-04-20 00:00:00','',1,'',1,'',1,'',20,23,'010/011/'),(72,'这是一个测试类 计算机组成原理','501','c01','2017-04-20 00:00:00','2017-04-20 00:00:00','',1,'',1,'',1,'',20,23,'010/011/');

/*Table structure for table `qbank` */

DROP TABLE IF EXISTS `qbank`;

CREATE TABLE `qbank` (
  `Qno` int(11) NOT NULL AUTO_INCREMENT COMMENT '题号自动增长',
  `Cno` varchar(10) DEFAULT NULL COMMENT '课程号',
  `Qstatement` varchar(200) DEFAULT NULL COMMENT '题目',
  `Qtype` varchar(5) DEFAULT NULL COMMENT '题型',
  `QChoiceA` varchar(50) DEFAULT NULL COMMENT '选项1非选择题为空',
  `QChoiceB` varchar(50) DEFAULT NULL COMMENT '选项2非选择题为空',
  `QChoiceC` varchar(50) DEFAULT NULL COMMENT '选项3非选择题为空',
  `QChoiceD` varchar(50) DEFAULT NULL COMMENT '选项4非选择题为空',
  `Qanswer` varchar(200) DEFAULT NULL COMMENT '答案',
  PRIMARY KEY (`Qno`)
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8;

/*Data for the table `qbank` */

insert  into `qbank`(`Qno`,`Cno`,`Qstatement`,`Qtype`,`QChoiceA`,`QChoiceB`,`QChoiceC`,`QChoiceD`,`Qanswer`) values (1,'501','ly测试判断题1---正确答案A','判断题','A','B',NULL,NULL,'A'),(2,'501','ly测试判断题2---正确答案B','判断题','A','B',NULL,NULL,'B'),(3,'501','ly测试选择题1---正确答案A','选择题','A选项','B选项','C选项','D选项','A'),(4,'501','ly测试选择题2---正确答案B','选择题','A选项','B选项','C选项','D选项','B'),(5,'501','ly测试多选题1---正确答案A','多选题','A选项','B选项','C选项','D选项','A'),(6,'501','ly测试多选题2---正确答案AB','多选题','A选项','B选项','C选项','D选项','AB'),(7,'501','ly测试简答题1---无正确答案','简答题',NULL,NULL,NULL,NULL,NULL),(9,'501','ly测试简答题2---无正确答案','简答题','f','f','f','d',''),(590,'503','这是第二个测试题目','选择题','A','B','C','D','C'),(592,'503','请问地球是不是椭圆的？','判断题','','','','','T'),(593,'503','计算机中什么最有用？','多选题','5','4','34','45','ABCD'),(594,'503','发是顿饭上单上单上单水电费是','多选题',' 第三方电风扇',' 施工队发',' 十多个顿饭电风扇',' 是大法官是大法官凡人歌','B'),(595,'503','热电饭锅df','选择题',' 刚发的给对方','顿饭顿饭df','个是大法官电饭锅','的双方各单方事故','B'),(596,'503','简答题的题目','简答题',NULL,NULL,NULL,NULL,NULL),(597,'503','这是最好的测试','判断题',NULL,NULL,NULL,NULL,'T'),(598,'503','52612+21+5+6','简答题','','','','',''),(599,'503','梵蒂冈地方大锅饭对方答复士大夫的','判断题','','','','','T'),(600,'501','程序下vxc下次下次vxc下次vxcv','选择题','打死','速度发射点','是对方','是否收到','A');

/*Table structure for table `sclass` */

DROP TABLE IF EXISTS `sclass`;

CREATE TABLE `sclass` (
  `SCno` varchar(10) NOT NULL COMMENT '班级编号',
  `SCname` varchar(20) DEFAULT NULL COMMENT '班级名称',
  PRIMARY KEY (`SCno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sclass` */

insert  into `sclass`(`SCno`,`SCname`) values ('010','软件工程'),('011','商业智能'),('022','人文艺术'),('203','经贸管理'),('265','财会1班');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `Sno` varchar(20) NOT NULL COMMENT '学号',
  `Sname` varchar(10) DEFAULT NULL COMMENT '姓名',
  `Ssex` varchar(2) DEFAULT NULL COMMENT '性别',
  `Sclass` varchar(50) DEFAULT NULL COMMENT '班级',
  `Spassword` varchar(20) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`Sno`),
  KEY `ssbk_1` (`Sclass`),
  CONSTRAINT `ssbk_1` FOREIGN KEY (`Sclass`) REFERENCES `sclass` (`SCno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`Sno`,`Sname`,`Ssex`,`Sclass`,`Spassword`) values ('2014001','王新杰','男','203','123'),('2014002','张晓芳5','男','203','123456'),('2014003','黄婷婷','女','203','123568'),('2014006','王典','男','011','123'),('2014010','ly测试人员','男','011','3959');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `Tno` varchar(10) NOT NULL COMMENT '教师号',
  `Tname` varchar(10) DEFAULT NULL COMMENT '教师名',
  `Tsex` varchar(2) DEFAULT NULL COMMENT '教师性别',
  `Tpassword` varchar(50) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`Tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`Tno`,`Tname`,`Tsex`,`Tpassword`) values ('a01','黄林森0','女','123'),('b01','admin','男','123'),('c01','潘铁民','女','789');

/*Table structure for table `teaching` */

DROP TABLE IF EXISTS `teaching`;

CREATE TABLE `teaching` (
  `Tno` varchar(10) DEFAULT NULL COMMENT '教师号',
  `Cno` varchar(10) DEFAULT NULL COMMENT '课程号',
  `Tsdept` varchar(50) DEFAULT NULL COMMENT '课程所在的系',
  `Tclass` varchar(4) DEFAULT NULL COMMENT '课程所在的班级',
  KEY `Tno` (`Tno`),
  KEY `Cno` (`Cno`),
  CONSTRAINT `tc_ibfk_1` FOREIGN KEY (`Tno`) REFERENCES `teacher` (`Tno`) ON DELETE CASCADE,
  CONSTRAINT `tc_ibfk_2` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teaching` */

insert  into `teaching`(`Tno`,`Cno`,`Tsdept`,`Tclass`) values ('a01','501','商业智能1班','203'),('c01','503','语言艺术1班','203'),('c01','504','不知道','011'),('b01','501','商业智能1班','203');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
