/*
SQLyog Ultimate v8.55 
MySQL - 5.1.37 : Database - traveliq
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`traveliq` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `traveliq`;

/*Table structure for table `adminusers` */

CREATE TABLE `adminusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `id_num` int(11) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `user_group` int(11) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mobilenumber` varchar(100) DEFAULT NULL,
  `terminal_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_susers_0` (`user_group`),
  UNIQUE KEY `pk_susers_1` (`terminal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `adminusers` */

/*Table structure for table `all_users` */

CREATE TABLE `all_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `id_num` int(11) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `user_group` int(11) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mobilenumber` varchar(100) DEFAULT NULL,
  `terminal_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `pass_change` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `all_users` */

insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (1,NULL,NULL,NULL,'2dff4fc90e2973f54d62e257480de234bc59e2c4',NULL,NULL,1,'2012-12-12 21:06:59',NULL,NULL,'oscar',NULL,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (2,'John','Doe','oscar@gmail.com','2dff4fc90e2973f54d62e257480de234bc59e2c4',78945236,NULL,2,'2012-12-12 21:15:32','john',NULL,'john',1,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (3,'Diana','Ross','dr@gmail.com','2dff4fc90e2973f54d62e257480de234bc59e2c4',5648921,NULL,4,'2012-12-12 21:18:19','4578962',NULL,'ross',1,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (4,'Fiona','Bungei','fiona@yahoo.com',NULL,7542235,NULL,0,'2012-12-13 10:51:25','796854123',NULL,NULL,NULL,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (5,'Bram','Okumu','linanyagaki@yahoo.com','2dff4fc90e2973f54d62e257480de234bc59e2c4',9088,NULL,2,'2012-12-13 15:08:43','000999',NULL,'Bram',2,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (7,'Lost','Keys','lost@keys.com',NULL,0,NULL,0,'2012-12-13 15:28:37','nnnnnnnnnnnnnnnnnnn',NULL,NULL,NULL,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (8,'Jane','Doe','phinkoholism@gmail.com','8a8deed44623d4c44268c26652d80945851c4f7f',785522,NULL,2,'2012-12-14 08:54:53','7855226',NULL,'jane',3,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (9,'Gladys','Wanja','glad@gmail.com','e5939bba9d6676dbdf9b4ce60b6cdd74dd1ce357',2147483647,NULL,5,'2012-12-14 08:59:34','7485233',NULL,'gladys',3,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (10,'Fred','Musyoki','fred@yahoo.com','24464a07919de27d0530918e9b55dfc57bd2fddf',78422333,NULL,7,'2012-12-14 09:00:35','4855652696',NULL,'fred',3,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (11,'Sam','Machoka','machoka@gmail.com',NULL,78916332,NULL,0,'2012-12-14 09:08:32','248866998',NULL,NULL,NULL,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (12,'tEST','LAST NAME','TEST.COM','59ed297f8fa9272d16caa19e5474833b87db98f9',0,NULL,2,'2012-12-14 16:52:52','OUU8989080',NULL,'OSCAR',4,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (13,'Paul','Okinyo','paul.okinyo@gmail.com','d025188b182c164b41353c91073c9a874bd177bb',26895500,NULL,2,'2012-12-14 16:57:58','2752035963',NULL,'paulo1',5,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (14,'Conductor','Mash','Mash conductor','37d7e96b5bbb14f7370277268bf31b7d207938b3',0,NULL,5,'2012-12-14 17:04:59','0766993322',NULL,'conductor1',5,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (15,'Driver','Mash','','22117d51f6d85b48ddcd485b4d1c085197d5c6e8',0,NULL,7,'2012-12-14 17:05:57','077895623',NULL,'driver1',5,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (16,'pAUL','TESTING','PAUL@TESTING.COM',NULL,7897466,NULL,0,'2012-12-14 17:23:42','98797989',NULL,NULL,NULL,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (17,'TESTING','TWO','',NULL,0,NULL,0,'2012-12-14 17:29:51','',NULL,NULL,NULL,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (18,'','','',NULL,0,NULL,0,'2012-12-14 17:32:54','',NULL,NULL,NULL,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (19,'','','',NULL,0,NULL,0,'2012-12-14 17:34:29','',NULL,NULL,NULL,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (20,'KK','KK','KK@KK.COM',NULL,1111111111,NULL,0,'2012-12-14 18:01:17','222222222',NULL,NULL,NULL,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (21,'','','',NULL,0,NULL,0,'2012-12-14 18:03:53','',NULL,NULL,NULL,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (22,'John','Njuguna','oscarpalmer9@gmail.com','e71976d6921182bd1df46cdfa1db09302e9522b7',78964122,NULL,2,'2012-12-19 10:59:08','79232223',NULL,'mara',6,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (23,'','','',NULL,0,NULL,0,'2012-12-20 08:49:36','',NULL,NULL,NULL,1);
insert  into `all_users`(`id`,`firstname`,`lastname`,`email`,`pass`,`id_num`,`passport`,`user_group`,`datecreated`,`mobilenumber`,`terminal_id`,`username`,`company`,`pass_change`) values (24,'','','',NULL,0,NULL,0,'2012-12-20 08:55:03','',NULL,NULL,NULL,1);

/*Table structure for table `booked_seats` */

CREATE TABLE `booked_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_id` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `passenger_id` varchar(100) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `booked_seats` */

/*Table structure for table `bookings_details` */

CREATE TABLE `bookings_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) DEFAULT NULL,
  `receipt_num` varchar(100) DEFAULT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `passenger_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bookings_details` (`passenger_id`),
  UNIQUE KEY `pk_bookings_details_0` (`trip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bookings_details` */

/*Table structure for table `bookings_seats` */

CREATE TABLE `bookings_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) DEFAULT NULL,
  `seat_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bookings_seats_0` (`booking_id`),
  UNIQUE KEY `pk_bookings_seats_1` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bookings_seats` */

/*Table structure for table `bram_booked_seats` */

CREATE TABLE `bram_booked_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_id` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `passenger_id` varchar(100) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `bram_booked_seats` */

insert  into `bram_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (1,1,1,2,'7',1,'2012-12-13 15:27:32');

/*Table structure for table `bram_bookings_details` */

CREATE TABLE `bram_bookings_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) DEFAULT NULL,
  `receipt_num` varchar(100) DEFAULT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `passenger_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bookings_details` (`passenger_id`),
  UNIQUE KEY `pk_bookings_details_0` (`trip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bram_bookings_details` */

/*Table structure for table `bram_bookings_seats` */

CREATE TABLE `bram_bookings_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) DEFAULT NULL,
  `seat_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bookings_seats_0` (`booking_id`),
  UNIQUE KEY `pk_bookings_seats_1` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bram_bookings_seats` */

/*Table structure for table `bram_bus_categories` */

CREATE TABLE `bram_bus_categories` (
  `description` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bus_categories_0` (`company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bram_bus_categories` */

/*Table structure for table `bram_buses` */

CREATE TABLE `bram_buses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_num` varchar(100) DEFAULT NULL,
  `bus_code` varchar(100) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `seat_config_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `bram_buses` */

insert  into `bram_buses`(`id`,`registration_num`,`bus_code`,`seats`,`seat_config_id`,`category_id`) values (2,'KJK 024K','TEST1',32,1,1);

/*Table structure for table `bram_journeys` */

CREATE TABLE `bram_journeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) DEFAULT NULL,
  `actual_starttime` datetime DEFAULT NULL,
  `actual_endtime` datetime DEFAULT NULL,
  `start_mileage` int(11) DEFAULT NULL,
  `end_mileage` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `conductor` int(11) DEFAULT NULL,
  `driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_journeys_0` (`trip_id`),
  UNIQUE KEY `pk_journeys_1` (`status`),
  UNIQUE KEY `pk_journeys_2` (`conductor`),
  UNIQUE KEY `pk_journeys_3` (`driver`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bram_journeys` */

/*Table structure for table `bram_location_mapping` */

CREATE TABLE `bram_location_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journey_id` int(11) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `datetime_logged` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_location_mapping_0` (`journey_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bram_location_mapping` */

/*Table structure for table `bram_loyalty` */

CREATE TABLE `bram_loyalty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_loyalty_0` (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bram_loyalty` */

/*Table structure for table `bram_parcels` */

CREATE TABLE `bram_parcels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parcel_no` varchar(255) DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  `receiver` int(11) DEFAULT NULL,
  `description` text,
  `created_by` int(11) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trip_id` int(11) DEFAULT NULL,
  `dimensions` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_parcels` (`sender`),
  UNIQUE KEY `pk_parcels_0` (`receiver`),
  UNIQUE KEY `pk_parcels_1` (`created_by`),
  UNIQUE KEY `pk_parcels_2` (`trip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bram_parcels` */

/*Table structure for table `bram_passengers` */

CREATE TABLE `bram_passengers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `id_num` int(11) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cash_credit` int(11) DEFAULT NULL,
  `cash_debit` int(11) DEFAULT NULL,
  `cash_bal` int(11) DEFAULT '0',
  `loyaty_saved` int(11) DEFAULT '0',
  `loyalty_redeemed` int(11) DEFAULT '0',
  `loyalty_bal` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_edited` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bram_passengers` */

/*Table structure for table `bram_payment_methods` */

CREATE TABLE `bram_payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bram_payment_methods` */

/*Table structure for table `bram_routes` */

CREATE TABLE `bram_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `terminal_start` int(11) DEFAULT NULL,
  `terminal_end` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `duration` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `bram_routes` */

insert  into `bram_routes`(`id`,`description`,`terminal_start`,`terminal_end`,`company_id`,`distance`,`duration`) values (1,'Get away from life',1,2,NULL,249.065,3.45805555555556);

/*Table structure for table `bram_seat_config` */

CREATE TABLE `bram_seat_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_file` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bram_seat_config` */

/*Table structure for table `bram_seats` */

CREATE TABLE `bram_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `seat_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

/*Data for the table `bram_seats` */

insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (1,1,'A1');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (2,1,'A2');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (3,1,'A3');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (4,1,'A4');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (5,1,'A5');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (6,1,'A6');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (7,1,'A7');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (8,1,'B8');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (9,1,'B9');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (10,1,'B10');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (11,1,'B11');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (12,1,'B12');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (13,1,'B13');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (14,1,'B14');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (15,1,'B15');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (16,1,'C16');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (17,1,'C17');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (18,1,'C18');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (19,1,'C19');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (20,1,'C20');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (21,1,'C21');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (22,1,'C22');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (23,1,'C23');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (24,1,'C24');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (25,1,'C25');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (26,1,'C26');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (27,1,'C27');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (28,1,'C28');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (29,1,'C29');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (30,1,'C30');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (31,1,'C31');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (32,1,'C32');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (33,2,'A1');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (34,2,'A2');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (35,2,'A3');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (36,2,'A4');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (37,2,'A5');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (38,2,'A6');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (39,2,'A7');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (40,2,'B8');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (41,2,'B9');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (42,2,'B10');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (43,2,'B11');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (44,2,'B12');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (45,2,'B13');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (46,2,'B14');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (47,2,'B15');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (48,2,'C16');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (49,2,'C17');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (50,2,'C18');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (51,2,'C19');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (52,2,'C20');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (53,2,'C21');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (54,2,'C22');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (55,2,'C23');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (56,2,'C24');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (57,2,'C25');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (58,2,'C26');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (59,2,'C27');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (60,2,'C28');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (61,2,'C29');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (62,2,'C30');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (63,2,'C31');
insert  into `bram_seats`(`id`,`bus_id`,`seat_no`) values (64,2,'C32');

/*Table structure for table `bram_status` */

CREATE TABLE `bram_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bram_status` */

/*Table structure for table `bram_sub_route` */

CREATE TABLE `bram_sub_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `terminal_start` int(11) DEFAULT NULL,
  `terminal_end` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_sub_route_0` (`route_id`),
  UNIQUE KEY `pk_sub_route_1` (`terminal_start`),
  UNIQUE KEY `pk_sub_route_2` (`terminal_end`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bram_sub_route` */

/*Table structure for table `bram_susers` */

CREATE TABLE `bram_susers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `id_num` int(11) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `user_group` int(11) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mobilenumber` varchar(100) DEFAULT NULL,
  `terminal_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bram_susers` */

/*Table structure for table `bram_terminals` */

CREATE TABLE `bram_terminals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `terminal_name` varchar(100) DEFAULT NULL,
  `terminal_desc` text,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `terminal_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `bram_terminals` */

insert  into `bram_terminals`(`id`,`terminal_name`,`terminal_desc`,`longitude`,`latitude`,`terminal_code`) values (2,'Meru, Kenya',NULL,37.6456042,0.0514721,NULL);

/*Table structure for table `bram_timetable` */

CREATE TABLE `bram_timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `eta` time DEFAULT NULL,
  `fare` int(11) DEFAULT NULL,
  `start_terminal` int(11) DEFAULT NULL,
  `day_desc` varchar(100) DEFAULT NULL,
  `conductor` int(11) DEFAULT NULL,
  `driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `bram_timetable` */

insert  into `bram_timetable`(`id`,`bus_id`,`route_id`,`start_time`,`eta`,`fare`,`start_terminal`,`day_desc`,`conductor`,`driver`) values (1,1,1,'01:00:00',NULL,350,1,'Fri',0,0);

/*Table structure for table `bram_transactions` */

CREATE TABLE `bram_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_no` varchar(100) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `transaction_num` int(11) DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `passenger` int(11) DEFAULT NULL,
  `uuser` int(11) DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `trip` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `bram_transactions` */

insert  into `bram_transactions`(`id`,`receipt_no`,`amount`,`transaction_num`,`payment_method`,`passenger`,`uuser`,`payment_type`,`trip`) values (1,'KYH01-1-1',350,NULL,2,7,0,1,1);

/*Table structure for table `bram_trip` */

CREATE TABLE `bram_trip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `trip_date_time` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `bram_trip` */

insert  into `bram_trip`(`id`,`bus_id`,`trip_date_time`,`status`,`route_id`) values (1,1,1355436000,NULL,1);

/*Table structure for table `bram_user_group` */

CREATE TABLE `bram_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bram_user_group` */

/*Table structure for table `bus_categories` */

CREATE TABLE `bus_categories` (
  `description` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bus_categories_0` (`company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `bus_categories` */

/*Table structure for table `buses` */

CREATE TABLE `buses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_num` varchar(100) DEFAULT NULL,
  `bus_code` varchar(100) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `seat_config_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `buses` */

/*Table structure for table `ci_sessions` */

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `ci_sessions` */

insert  into `ci_sessions`(`session_id`,`ip_address`,`user_agent`,`last_activity`,`user_data`) values ('76efa85db8bfd6fb814482519eb8da21','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0',1373273110,'');

/*Table structure for table `companies` */

CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` text,
  `company_loc` text,
  `status` int(11) DEFAULT '0',
  `company_admin` int(11) DEFAULT '0',
  `db_prefix` varchar(100) DEFAULT NULL,
  `when_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email_add` varchar(255) DEFAULT NULL,
  `postal_adress` text,
  `created_by_admin` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `companies` */

insert  into `companies`(`id`,`company_name`,`company_loc`,`status`,`company_admin`,`db_prefix`,`when_created`,`email_add`,`postal_adress`,`created_by_admin`,`tel`,`controller`) values (1,'kbs','Nairobi',0,0,'kbs','2012-12-12 21:14:40','kba@hotmail.co.ke','48558887',1,'78954413',NULL);
insert  into `companies`(`id`,`company_name`,`company_loc`,`status`,`company_admin`,`db_prefix`,`when_created`,`email_add`,`postal_adress`,`created_by_admin`,`tel`,`controller`) values (2,'Bram Sacco','Tea room',0,0,'Bram','2012-12-13 15:07:28','tearoomu@kirinyagard.com','98 Kirinyaga road',1,'',NULL);
insert  into `companies`(`id`,`company_name`,`company_loc`,`status`,`company_admin`,`db_prefix`,`when_created`,`email_add`,`postal_adress`,`created_by_admin`,`tel`,`controller`) values (3,'Lopha Travels','Nbi',0,0,'lopha','2012-12-14 08:54:12','oscarababu@gmail.com','7556566',1,'4557889',NULL);
insert  into `companies`(`id`,`company_name`,`company_loc`,`status`,`company_admin`,`db_prefix`,`when_created`,`email_add`,`postal_adress`,`created_by_admin`,`tel`,`controller`) values (4,'Coast Air','Mombasa Kenyatta avenue',0,0,'KBS','2012-12-14 16:51:21','TESTING.COM','PO BOX 98908 MOMBASA',1,'072568975G',NULL);
insert  into `companies`(`id`,`company_name`,`company_loc`,`status`,`company_admin`,`db_prefix`,`when_created`,`email_add`,`postal_adress`,`created_by_admin`,`tel`,`controller`) values (5,'Mash POA','Mombasa',0,0,'Mash','2012-12-14 16:56:58','paul.okinyo@gmail.com','Moi Avenue',1,'0756235689',NULL);
insert  into `companies`(`id`,`company_name`,`company_loc`,`status`,`company_admin`,`db_prefix`,`when_created`,`email_add`,`postal_adress`,`created_by_admin`,`tel`,`controller`) values (6,'Maranatha','Githurai',0,0,'mara','2012-12-19 10:58:26','mara@natha.com','5965224',1,'89647123',NULL);

/*Table structure for table `journeys` */

CREATE TABLE `journeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) DEFAULT NULL,
  `actual_starttime` datetime DEFAULT NULL,
  `actual_endtime` datetime DEFAULT NULL,
  `start_mileage` int(11) DEFAULT NULL,
  `end_mileage` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `conductor` int(11) DEFAULT NULL,
  `driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_journeys_0` (`trip_id`),
  UNIQUE KEY `pk_journeys_1` (`status`),
  UNIQUE KEY `pk_journeys_2` (`conductor`),
  UNIQUE KEY `pk_journeys_3` (`driver`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `journeys` */

/*Table structure for table `kbs_booked_seats` */

CREATE TABLE `kbs_booked_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_id` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `passenger_id` varchar(100) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `kbs_booked_seats` */

insert  into `kbs_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (1,72,1,2,'4',3,'2012-12-13 10:50:38');

/*Table structure for table `kbs_bookings_details` */

CREATE TABLE `kbs_bookings_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) DEFAULT NULL,
  `receipt_num` varchar(100) DEFAULT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `passenger_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bookings_details` (`passenger_id`),
  UNIQUE KEY `pk_bookings_details_0` (`trip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kbs_bookings_details` */

/*Table structure for table `kbs_bookings_seats` */

CREATE TABLE `kbs_bookings_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) DEFAULT NULL,
  `seat_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bookings_seats_0` (`booking_id`),
  UNIQUE KEY `pk_bookings_seats_1` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kbs_bookings_seats` */

/*Table structure for table `kbs_bus_categories` */

CREATE TABLE `kbs_bus_categories` (
  `description` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bus_categories_0` (`company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kbs_bus_categories` */

/*Table structure for table `kbs_buses` */

CREATE TABLE `kbs_buses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_num` varchar(100) DEFAULT NULL,
  `bus_code` varchar(100) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `seat_config_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `kbs_buses` */

insert  into `kbs_buses`(`id`,`registration_num`,`bus_code`,`seats`,`seat_config_id`,`category_id`) values (1,'KAB 123U','BU-12',32,0,0);
insert  into `kbs_buses`(`id`,`registration_num`,`bus_code`,`seats`,`seat_config_id`,`category_id`) values (2,'KBB 976G','BU-13',32,6,1);
insert  into `kbs_buses`(`id`,`registration_num`,`bus_code`,`seats`,`seat_config_id`,`category_id`) values (3,'KAC 123Z','TEST-1',32,1,1);

/*Table structure for table `kbs_journeys` */

CREATE TABLE `kbs_journeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) DEFAULT NULL,
  `actual_starttime` datetime DEFAULT NULL,
  `actual_endtime` datetime DEFAULT NULL,
  `start_mileage` int(11) DEFAULT NULL,
  `end_mileage` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `conductor` int(11) DEFAULT NULL,
  `driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_journeys_0` (`trip_id`),
  UNIQUE KEY `pk_journeys_1` (`status`),
  UNIQUE KEY `pk_journeys_2` (`conductor`),
  UNIQUE KEY `pk_journeys_3` (`driver`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kbs_journeys` */

/*Table structure for table `kbs_location_mapping` */

CREATE TABLE `kbs_location_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journey_id` int(11) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `datetime_logged` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_location_mapping_0` (`journey_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kbs_location_mapping` */

/*Table structure for table `kbs_loyalty` */

CREATE TABLE `kbs_loyalty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_loyalty_0` (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kbs_loyalty` */

/*Table structure for table `kbs_parcels` */

CREATE TABLE `kbs_parcels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parcel_no` varchar(255) DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  `receiver` int(11) DEFAULT NULL,
  `description` text,
  `created_by` int(11) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trip_id` int(11) DEFAULT NULL,
  `dimensions` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_parcels` (`sender`),
  UNIQUE KEY `pk_parcels_0` (`receiver`),
  UNIQUE KEY `pk_parcels_1` (`created_by`),
  UNIQUE KEY `pk_parcels_2` (`trip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kbs_parcels` */

/*Table structure for table `kbs_passengers` */

CREATE TABLE `kbs_passengers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `id_num` int(11) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cash_credit` int(11) DEFAULT NULL,
  `cash_debit` int(11) DEFAULT NULL,
  `cash_bal` int(11) DEFAULT '0',
  `loyaty_saved` int(11) DEFAULT '0',
  `loyalty_redeemed` int(11) DEFAULT '0',
  `loyalty_bal` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_edited` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kbs_passengers` */

/*Table structure for table `kbs_payment_methods` */

CREATE TABLE `kbs_payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kbs_payment_methods` */

/*Table structure for table `kbs_routes` */

CREATE TABLE `kbs_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `terminal_start` int(11) DEFAULT NULL,
  `terminal_end` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `duration` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `kbs_routes` */

insert  into `kbs_routes`(`id`,`description`,`terminal_start`,`terminal_end`,`company_id`,`distance`,`duration`) values (1,'Nairobi - Kisii',1,2,NULL,306.415,4.21);
insert  into `kbs_routes`(`id`,`description`,`terminal_start`,`terminal_end`,`company_id`,`distance`,`duration`) values (2,'kisii - Nairobi',2,1,NULL,305.783,4.13694444444444);
insert  into `kbs_routes`(`id`,`description`,`terminal_start`,`terminal_end`,`company_id`,`distance`,`duration`) values (3,'Nairobi - Mombasa',1,3,NULL,485.684,6.31);
insert  into `kbs_routes`(`id`,`description`,`terminal_start`,`terminal_end`,`company_id`,`distance`,`duration`) values (4,'Mombasa - Nairobi',3,1,NULL,500.836,6.695);
insert  into `kbs_routes`(`id`,`description`,`terminal_start`,`terminal_end`,`company_id`,`distance`,`duration`) values (5,'Nairobi - Nakuru',1,4,NULL,160.653,2.45833333333333);
insert  into `kbs_routes`(`id`,`description`,`terminal_start`,`terminal_end`,`company_id`,`distance`,`duration`) values (6,'Nakuru - Nairobi',4,1,NULL,159.267,2.39722222222222);
insert  into `kbs_routes`(`id`,`description`,`terminal_start`,`terminal_end`,`company_id`,`distance`,`duration`) values (7,'Nakuru - Mombasa',4,3,NULL,644.241,8.66833333333333);
insert  into `kbs_routes`(`id`,`description`,`terminal_start`,`terminal_end`,`company_id`,`distance`,`duration`) values (8,'Mombasa - Nakuru',3,4,NULL,660.623,9.10416666666667);

/*Table structure for table `kbs_seat_config` */

CREATE TABLE `kbs_seat_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_file` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kbs_seat_config` */

/*Table structure for table `kbs_seats` */

CREATE TABLE `kbs_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `seat_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;

/*Data for the table `kbs_seats` */

insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (1,1,'A1');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (2,1,'A2');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (3,1,'A3');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (4,1,'A4');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (5,1,'A5');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (6,1,'A6');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (7,1,'A7');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (8,1,'B8');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (9,1,'B9');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (10,1,'B10');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (11,1,'B11');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (12,1,'B12');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (13,1,'B13');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (14,1,'B14');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (15,1,'B15');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (16,1,'C16');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (17,1,'C17');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (18,1,'C18');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (19,1,'C19');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (20,1,'C20');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (21,1,'C21');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (22,1,'C22');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (23,1,'C23');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (24,1,'C24');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (25,1,'C25');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (26,1,'C26');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (27,1,'C27');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (28,1,'C28');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (29,1,'C29');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (30,1,'C30');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (31,1,'C31');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (32,1,'C32');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (33,2,'A1');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (34,2,'A2');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (35,2,'A3');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (36,2,'A4');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (37,2,'A5');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (38,2,'A6');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (39,2,'A7');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (40,2,'B8');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (41,2,'B9');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (42,2,'B10');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (43,2,'B11');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (44,2,'B12');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (45,2,'B13');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (46,2,'B14');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (47,2,'B15');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (48,2,'C16');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (49,2,'C17');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (50,2,'C18');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (51,2,'C19');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (52,2,'C20');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (53,2,'C21');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (54,2,'C22');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (55,2,'C23');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (56,2,'C24');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (57,2,'C25');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (58,2,'C26');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (59,2,'C27');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (60,2,'C28');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (61,2,'C29');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (62,2,'C30');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (63,2,'C31');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (64,2,'C32');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (65,3,'A1');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (66,3,'A2');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (67,3,'A3');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (68,3,'A4');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (69,3,'A5');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (70,3,'A6');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (71,3,'A7');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (72,3,'B8');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (73,3,'B9');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (74,3,'B10');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (75,3,'B11');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (76,3,'B12');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (77,3,'B13');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (78,3,'B14');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (79,3,'B15');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (80,3,'C16');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (81,3,'C17');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (82,3,'C18');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (83,3,'C19');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (84,3,'C20');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (85,3,'C21');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (86,3,'C22');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (87,3,'C23');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (88,3,'C24');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (89,3,'C25');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (90,3,'C26');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (91,3,'C27');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (92,3,'C28');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (93,3,'C29');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (94,3,'C30');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (95,3,'C31');
insert  into `kbs_seats`(`id`,`bus_id`,`seat_no`) values (96,3,'C32');

/*Table structure for table `kbs_status` */

CREATE TABLE `kbs_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kbs_status` */

/*Table structure for table `kbs_sub_route` */

CREATE TABLE `kbs_sub_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `terminal_start` int(11) DEFAULT NULL,
  `terminal_end` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_sub_route_0` (`route_id`),
  UNIQUE KEY `pk_sub_route_1` (`terminal_start`),
  UNIQUE KEY `pk_sub_route_2` (`terminal_end`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kbs_sub_route` */

/*Table structure for table `kbs_susers` */

CREATE TABLE `kbs_susers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `id_num` int(11) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `user_group` int(11) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mobilenumber` varchar(100) DEFAULT NULL,
  `terminal_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kbs_susers` */

/*Table structure for table `kbs_terminals` */

CREATE TABLE `kbs_terminals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `terminal_name` varchar(100) DEFAULT NULL,
  `terminal_desc` text,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `terminal_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `kbs_terminals` */

insert  into `kbs_terminals`(`id`,`terminal_name`,`terminal_desc`,`longitude`,`latitude`,`terminal_code`) values (1,'Nairobi, Kenya',NULL,36.8219462,-1.2920659,NULL);
insert  into `kbs_terminals`(`id`,`terminal_name`,`terminal_desc`,`longitude`,`latitude`,`terminal_code`) values (2,'Kisii, Kenya',NULL,34.771966,-0.678306,NULL);
insert  into `kbs_terminals`(`id`,`terminal_name`,`terminal_desc`,`longitude`,`latitude`,`terminal_code`) values (3,'Mombasa, Kenya',NULL,39.6682065,-4.0434771,NULL);
insert  into `kbs_terminals`(`id`,`terminal_name`,`terminal_desc`,`longitude`,`latitude`,`terminal_code`) values (4,'Nakuru, Kenya',NULL,36.080026,-0.3030988,NULL);

/*Table structure for table `kbs_timetable` */

CREATE TABLE `kbs_timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `eta` time DEFAULT NULL,
  `fare` int(11) DEFAULT NULL,
  `start_terminal` int(11) DEFAULT NULL,
  `day_desc` varchar(100) DEFAULT NULL,
  `conductor` int(11) DEFAULT NULL,
  `driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `kbs_timetable` */

insert  into `kbs_timetable`(`id`,`bus_id`,`route_id`,`start_time`,`eta`,`fare`,`start_terminal`,`day_desc`,`conductor`,`driver`) values (1,3,1,'08:00:00',NULL,1200,1,'Mon',0,0);
insert  into `kbs_timetable`(`id`,`bus_id`,`route_id`,`start_time`,`eta`,`fare`,`start_terminal`,`day_desc`,`conductor`,`driver`) values (3,3,2,'19:00:00',NULL,1000,2,'Mon',0,0);

/*Table structure for table `kbs_transactions` */

CREATE TABLE `kbs_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_no` varchar(100) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `transaction_num` int(11) DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `passenger` int(11) DEFAULT NULL,
  `uuser` int(11) DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `trip` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `kbs_transactions` */

insert  into `kbs_transactions`(`id`,`receipt_no`,`amount`,`transaction_num`,`payment_method`,`passenger`,`uuser`,`payment_type`,`trip`) values (1,'TEST-1-1-1',1200,NULL,1,4,0,1,1);

/*Table structure for table `kbs_trip` */

CREATE TABLE `kbs_trip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `trip_date_time` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `kbs_trip` */

insert  into `kbs_trip`(`id`,`bus_id`,`trip_date_time`,`status`,`route_id`) values (1,3,1356930000,NULL,1);

/*Table structure for table `kbs_user_group` */

CREATE TABLE `kbs_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `kbs_user_group` */

/*Table structure for table `location_mapping` */

CREATE TABLE `location_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journey_id` int(11) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `datetime_logged` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_location_mapping_0` (`journey_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `location_mapping` */

/*Table structure for table `lopha_booked_seats` */

CREATE TABLE `lopha_booked_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_id` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `passenger_id` varchar(100) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `lopha_booked_seats` */

insert  into `lopha_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (1,8,1,2,'11',1,'2012-12-14 09:08:00');

/*Table structure for table `lopha_bookings_details` */

CREATE TABLE `lopha_bookings_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) DEFAULT NULL,
  `receipt_num` varchar(100) DEFAULT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `passenger_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bookings_details` (`passenger_id`),
  UNIQUE KEY `pk_bookings_details_0` (`trip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `lopha_bookings_details` */

/*Table structure for table `lopha_bookings_seats` */

CREATE TABLE `lopha_bookings_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) DEFAULT NULL,
  `seat_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bookings_seats_0` (`booking_id`),
  UNIQUE KEY `pk_bookings_seats_1` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `lopha_bookings_seats` */

/*Table structure for table `lopha_bus_categories` */

CREATE TABLE `lopha_bus_categories` (
  `description` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bus_categories_0` (`company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `lopha_bus_categories` */

/*Table structure for table `lopha_buses` */

CREATE TABLE `lopha_buses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_num` varchar(100) DEFAULT NULL,
  `bus_code` varchar(100) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `seat_config_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `lopha_buses` */

insert  into `lopha_buses`(`id`,`registration_num`,`bus_code`,`seats`,`seat_config_id`,`category_id`) values (1,'KAB 895K','TEST - 567',32,1,4);

/*Table structure for table `lopha_journeys` */

CREATE TABLE `lopha_journeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) DEFAULT NULL,
  `actual_starttime` datetime DEFAULT NULL,
  `actual_endtime` datetime DEFAULT NULL,
  `start_mileage` int(11) DEFAULT NULL,
  `end_mileage` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `conductor` int(11) DEFAULT NULL,
  `driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_journeys_0` (`trip_id`),
  UNIQUE KEY `pk_journeys_1` (`status`),
  UNIQUE KEY `pk_journeys_2` (`conductor`),
  UNIQUE KEY `pk_journeys_3` (`driver`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `lopha_journeys` */

/*Table structure for table `lopha_location_mapping` */

CREATE TABLE `lopha_location_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journey_id` int(11) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `datetime_logged` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_location_mapping_0` (`journey_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `lopha_location_mapping` */

/*Table structure for table `lopha_loyalty` */

CREATE TABLE `lopha_loyalty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_loyalty_0` (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `lopha_loyalty` */

/*Table structure for table `lopha_parcels` */

CREATE TABLE `lopha_parcels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parcel_no` varchar(255) DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  `receiver` int(11) DEFAULT NULL,
  `description` text,
  `created_by` int(11) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trip_id` int(11) DEFAULT NULL,
  `dimensions` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_parcels` (`sender`),
  UNIQUE KEY `pk_parcels_0` (`receiver`),
  UNIQUE KEY `pk_parcels_1` (`created_by`),
  UNIQUE KEY `pk_parcels_2` (`trip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `lopha_parcels` */

/*Table structure for table `lopha_passengers` */

CREATE TABLE `lopha_passengers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `id_num` int(11) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cash_credit` int(11) DEFAULT NULL,
  `cash_debit` int(11) DEFAULT NULL,
  `cash_bal` int(11) DEFAULT '0',
  `loyaty_saved` int(11) DEFAULT '0',
  `loyalty_redeemed` int(11) DEFAULT '0',
  `loyalty_bal` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_edited` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `lopha_passengers` */

/*Table structure for table `lopha_payment_methods` */

CREATE TABLE `lopha_payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `lopha_payment_methods` */

/*Table structure for table `lopha_routes` */

CREATE TABLE `lopha_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `terminal_start` int(11) DEFAULT NULL,
  `terminal_end` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `duration` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `lopha_routes` */

insert  into `lopha_routes`(`id`,`description`,`terminal_start`,`terminal_end`,`company_id`,`distance`,`duration`) values (1,'Nairobi - Malindi',1,2,NULL,575.578,7.595);

/*Table structure for table `lopha_seat_config` */

CREATE TABLE `lopha_seat_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_file` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `lopha_seat_config` */

/*Table structure for table `lopha_seats` */

CREATE TABLE `lopha_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `seat_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `lopha_seats` */

insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (1,1,'A1');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (2,1,'A2');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (3,1,'A3');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (4,1,'A4');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (5,1,'A5');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (6,1,'A6');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (7,1,'A7');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (8,1,'B8');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (9,1,'B9');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (10,1,'B10');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (11,1,'B11');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (12,1,'B12');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (13,1,'B13');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (14,1,'B14');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (15,1,'B15');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (16,1,'C16');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (17,1,'C17');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (18,1,'C18');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (19,1,'C19');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (20,1,'C20');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (21,1,'C21');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (22,1,'C22');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (23,1,'C23');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (24,1,'C24');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (25,1,'C25');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (26,1,'C26');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (27,1,'C27');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (28,1,'C28');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (29,1,'C29');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (30,1,'C30');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (31,1,'C31');
insert  into `lopha_seats`(`id`,`bus_id`,`seat_no`) values (32,1,'C32');

/*Table structure for table `lopha_status` */

CREATE TABLE `lopha_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `lopha_status` */

/*Table structure for table `lopha_sub_route` */

CREATE TABLE `lopha_sub_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `terminal_start` int(11) DEFAULT NULL,
  `terminal_end` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_sub_route_0` (`route_id`),
  UNIQUE KEY `pk_sub_route_1` (`terminal_start`),
  UNIQUE KEY `pk_sub_route_2` (`terminal_end`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `lopha_sub_route` */

/*Table structure for table `lopha_susers` */

CREATE TABLE `lopha_susers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `id_num` int(11) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `user_group` int(11) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mobilenumber` varchar(100) DEFAULT NULL,
  `terminal_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `lopha_susers` */

/*Table structure for table `lopha_terminals` */

CREATE TABLE `lopha_terminals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `terminal_name` varchar(100) DEFAULT NULL,
  `terminal_desc` text,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `terminal_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `lopha_terminals` */

insert  into `lopha_terminals`(`id`,`terminal_name`,`terminal_desc`,`longitude`,`latitude`,`terminal_code`) values (1,'Nairobi, Kenya',NULL,36.8219462,-1.2920659,NULL);
insert  into `lopha_terminals`(`id`,`terminal_name`,`terminal_desc`,`longitude`,`latitude`,`terminal_code`) values (2,'Malindi, Kenya',NULL,40.1168906,-3.2191864,NULL);

/*Table structure for table `lopha_timetable` */

CREATE TABLE `lopha_timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `eta` time DEFAULT NULL,
  `fare` int(11) DEFAULT NULL,
  `start_terminal` int(11) DEFAULT NULL,
  `day_desc` varchar(100) DEFAULT NULL,
  `conductor` int(11) DEFAULT NULL,
  `driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `lopha_timetable` */

insert  into `lopha_timetable`(`id`,`bus_id`,`route_id`,`start_time`,`eta`,`fare`,`start_terminal`,`day_desc`,`conductor`,`driver`) values (1,1,1,'12:00:00',NULL,2000,1,'Sat',9,10);

/*Table structure for table `lopha_transactions` */

CREATE TABLE `lopha_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_no` varchar(100) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `transaction_num` int(11) DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `passenger` int(11) DEFAULT NULL,
  `uuser` int(11) DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `trip` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `lopha_transactions` */

insert  into `lopha_transactions`(`id`,`receipt_no`,`amount`,`transaction_num`,`payment_method`,`passenger`,`uuser`,`payment_type`,`trip`) values (1,'TEST - 567-1-1',2000,NULL,1,11,0,1,1);

/*Table structure for table `lopha_trip` */

CREATE TABLE `lopha_trip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `trip_date_time` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `lopha_trip` */

insert  into `lopha_trip`(`id`,`bus_id`,`trip_date_time`,`status`,`route_id`) values (1,1,1356166800,NULL,1);

/*Table structure for table `lopha_user_group` */

CREATE TABLE `lopha_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `lopha_user_group` */

/*Table structure for table `loyalty` */

CREATE TABLE `loyalty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_loyalty_0` (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `loyalty` */

/*Table structure for table `mara_booked_seats` */

CREATE TABLE `mara_booked_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_id` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `passenger_id` varchar(100) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `mara_booked_seats` */

insert  into `mara_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (1,20,2,1,'6d19d2f716069343a79a354865503410',1,'2013-01-04 15:25:08');

/*Table structure for table `mara_bookings_details` */

CREATE TABLE `mara_bookings_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) DEFAULT NULL,
  `receipt_num` varchar(100) DEFAULT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `passenger_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bookings_details` (`passenger_id`),
  UNIQUE KEY `pk_bookings_details_0` (`trip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mara_bookings_details` */

/*Table structure for table `mara_bookings_seats` */

CREATE TABLE `mara_bookings_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) DEFAULT NULL,
  `seat_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bookings_seats_0` (`booking_id`),
  UNIQUE KEY `pk_bookings_seats_1` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mara_bookings_seats` */

/*Table structure for table `mara_bus_categories` */

CREATE TABLE `mara_bus_categories` (
  `description` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bus_categories_0` (`company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mara_bus_categories` */

/*Table structure for table `mara_buses` */

CREATE TABLE `mara_buses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_num` varchar(100) DEFAULT NULL,
  `bus_code` varchar(100) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `seat_config_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `mara_buses` */

insert  into `mara_buses`(`id`,`registration_num`,`bus_code`,`seats`,`seat_config_id`,`category_id`) values (1,'KAY 789Q','TEST1',32,1,1);

/*Table structure for table `mara_journeys` */

CREATE TABLE `mara_journeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) DEFAULT NULL,
  `actual_starttime` datetime DEFAULT NULL,
  `actual_endtime` datetime DEFAULT NULL,
  `start_mileage` int(11) DEFAULT NULL,
  `end_mileage` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `conductor` int(11) DEFAULT NULL,
  `driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_journeys_0` (`trip_id`),
  UNIQUE KEY `pk_journeys_1` (`status`),
  UNIQUE KEY `pk_journeys_2` (`conductor`),
  UNIQUE KEY `pk_journeys_3` (`driver`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mara_journeys` */

/*Table structure for table `mara_location_mapping` */

CREATE TABLE `mara_location_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journey_id` int(11) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `datetime_logged` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_location_mapping_0` (`journey_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mara_location_mapping` */

/*Table structure for table `mara_loyalty` */

CREATE TABLE `mara_loyalty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_loyalty_0` (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mara_loyalty` */

/*Table structure for table `mara_parcels` */

CREATE TABLE `mara_parcels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parcel_no` varchar(255) DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  `receiver` int(11) DEFAULT NULL,
  `description` text,
  `created_by` int(11) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trip_id` int(11) DEFAULT NULL,
  `dimensions` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_parcels` (`sender`),
  UNIQUE KEY `pk_parcels_0` (`receiver`),
  UNIQUE KEY `pk_parcels_1` (`created_by`),
  UNIQUE KEY `pk_parcels_2` (`trip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mara_parcels` */

/*Table structure for table `mara_passengers` */

CREATE TABLE `mara_passengers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `id_num` int(11) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cash_credit` int(11) DEFAULT NULL,
  `cash_debit` int(11) DEFAULT NULL,
  `cash_bal` int(11) DEFAULT '0',
  `loyaty_saved` int(11) DEFAULT '0',
  `loyalty_redeemed` int(11) DEFAULT '0',
  `loyalty_bal` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_edited` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mara_passengers` */

/*Table structure for table `mara_payment_methods` */

CREATE TABLE `mara_payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mara_payment_methods` */

/*Table structure for table `mara_routes` */

CREATE TABLE `mara_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `terminal_start` int(11) DEFAULT NULL,
  `terminal_end` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `duration` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `mara_routes` */

insert  into `mara_routes`(`id`,`description`,`terminal_start`,`terminal_end`,`company_id`,`distance`,`duration`) values (1,'Nairobi - Malaba',1,2,NULL,452.921,6.22555555555556);

/*Table structure for table `mara_seat_config` */

CREATE TABLE `mara_seat_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_file` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mara_seat_config` */

/*Table structure for table `mara_seats` */

CREATE TABLE `mara_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `seat_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `mara_seats` */

insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (1,1,'A1');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (2,1,'A2');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (3,1,'A3');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (4,1,'A4');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (5,1,'A5');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (6,1,'A6');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (7,1,'A7');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (8,1,'B8');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (9,1,'B9');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (10,1,'B10');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (11,1,'B11');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (12,1,'B12');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (13,1,'B13');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (14,1,'B14');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (15,1,'B15');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (16,1,'C16');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (17,1,'C17');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (18,1,'C18');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (19,1,'C19');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (20,1,'C20');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (21,1,'C21');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (22,1,'C22');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (23,1,'C23');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (24,1,'C24');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (25,1,'C25');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (26,1,'C26');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (27,1,'C27');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (28,1,'C28');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (29,1,'C29');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (30,1,'C30');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (31,1,'C31');
insert  into `mara_seats`(`id`,`bus_id`,`seat_no`) values (32,1,'C32');

/*Table structure for table `mara_status` */

CREATE TABLE `mara_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mara_status` */

/*Table structure for table `mara_sub_route` */

CREATE TABLE `mara_sub_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `terminal_start` int(11) DEFAULT NULL,
  `terminal_end` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_sub_route_0` (`route_id`),
  UNIQUE KEY `pk_sub_route_1` (`terminal_start`),
  UNIQUE KEY `pk_sub_route_2` (`terminal_end`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mara_sub_route` */

/*Table structure for table `mara_susers` */

CREATE TABLE `mara_susers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `id_num` int(11) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `user_group` int(11) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mobilenumber` varchar(100) DEFAULT NULL,
  `terminal_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mara_susers` */

/*Table structure for table `mara_terminals` */

CREATE TABLE `mara_terminals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `terminal_name` varchar(100) DEFAULT NULL,
  `terminal_desc` text,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `terminal_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `mara_terminals` */

insert  into `mara_terminals`(`id`,`terminal_name`,`terminal_desc`,`longitude`,`latitude`,`terminal_code`) values (1,'Nairobi, Kenya',NULL,36.8219462,-1.2920659,NULL);
insert  into `mara_terminals`(`id`,`terminal_name`,`terminal_desc`,`longitude`,`latitude`,`terminal_code`) values (2,'Malaba, Kenya',NULL,34.269444,0.6327779,NULL);

/*Table structure for table `mara_timetable` */

CREATE TABLE `mara_timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `eta` time DEFAULT NULL,
  `fare` int(11) DEFAULT NULL,
  `start_terminal` int(11) DEFAULT NULL,
  `day_desc` varchar(100) DEFAULT NULL,
  `conductor` int(11) DEFAULT NULL,
  `driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `mara_timetable` */

insert  into `mara_timetable`(`id`,`bus_id`,`route_id`,`start_time`,`eta`,`fare`,`start_terminal`,`day_desc`,`conductor`,`driver`) values (1,1,1,'09:00:00',NULL,1000,1,'Wed',0,0);

/*Table structure for table `mara_transactions` */

CREATE TABLE `mara_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_no` varchar(100) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `transaction_num` int(11) DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `passenger` int(11) DEFAULT NULL,
  `uuser` int(11) DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `trip` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mara_transactions` */

/*Table structure for table `mara_trip` */

CREATE TABLE `mara_trip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `trip_date_time` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `mara_trip` */

insert  into `mara_trip`(`id`,`bus_id`,`trip_date_time`,`status`,`route_id`) values (1,1,1355896800,NULL,1);
insert  into `mara_trip`(`id`,`bus_id`,`trip_date_time`,`status`,`route_id`) values (2,1,1358316000,NULL,1);

/*Table structure for table `mara_user_group` */

CREATE TABLE `mara_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mara_user_group` */

/*Table structure for table `mash_booked_seats` */

CREATE TABLE `mash_booked_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_id` int(11) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `passenger_id` varchar(100) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `mash_booked_seats` */

insert  into `mash_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (1,1,1,2,'16',1,'2012-12-14 17:22:56');
insert  into `mash_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (2,2,1,2,'16',1,'2012-12-14 17:22:57');
insert  into `mash_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (3,3,1,2,'16',1,'2012-12-14 17:22:58');
insert  into `mash_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (4,22,1,2,'16',1,'2012-12-14 17:22:59');
insert  into `mash_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (5,30,1,2,'16',1,'2012-12-14 17:23:01');
insert  into `mash_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (6,24,1,2,'16',1,'2012-12-14 17:23:02');
insert  into `mash_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (7,32,1,2,'16',1,'2012-12-14 17:23:03');
insert  into `mash_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (8,17,1,2,'16',1,'2012-12-14 17:23:11');
insert  into `mash_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (9,25,1,2,'16',1,'2012-12-14 17:23:13');
insert  into `mash_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (10,18,1,2,'19',1,'2012-12-14 17:34:22');
insert  into `mash_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (11,4,1,1,'56b89498ee11b0572eb4a95d6c8b3bef',1,'2012-12-14 17:54:46');
insert  into `mash_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (12,11,1,1,'56b89498ee11b0572eb4a95d6c8b3bef',1,'2012-12-14 17:54:47');
insert  into `mash_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (13,20,1,1,'56b89498ee11b0572eb4a95d6c8b3bef',1,'2012-12-14 17:55:19');
insert  into `mash_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (14,28,1,1,'56b89498ee11b0572eb4a95d6c8b3bef',1,'2012-12-14 17:55:20');
insert  into `mash_booked_seats`(`id`,`seat_id`,`trip_id`,`status`,`passenger_id`,`bus_id`,`date_created`) values (15,21,1,2,'20',1,'2012-12-14 18:00:58');

/*Table structure for table `mash_bookings_details` */

CREATE TABLE `mash_bookings_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) DEFAULT NULL,
  `receipt_num` varchar(100) DEFAULT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `passenger_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bookings_details` (`passenger_id`),
  UNIQUE KEY `pk_bookings_details_0` (`trip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mash_bookings_details` */

/*Table structure for table `mash_bookings_seats` */

CREATE TABLE `mash_bookings_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) DEFAULT NULL,
  `seat_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bookings_seats_0` (`booking_id`),
  UNIQUE KEY `pk_bookings_seats_1` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mash_bookings_seats` */

/*Table structure for table `mash_bus_categories` */

CREATE TABLE `mash_bus_categories` (
  `description` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_bus_categories_0` (`company_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mash_bus_categories` */

/*Table structure for table `mash_buses` */

CREATE TABLE `mash_buses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_num` varchar(100) DEFAULT NULL,
  `bus_code` varchar(100) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `seat_config_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `mash_buses` */

insert  into `mash_buses`(`id`,`registration_num`,`bus_code`,`seats`,`seat_config_id`,`category_id`) values (1,'KBT800C','0890',32,1,0);

/*Table structure for table `mash_journeys` */

CREATE TABLE `mash_journeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) DEFAULT NULL,
  `actual_starttime` datetime DEFAULT NULL,
  `actual_endtime` datetime DEFAULT NULL,
  `start_mileage` int(11) DEFAULT NULL,
  `end_mileage` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `conductor` int(11) DEFAULT NULL,
  `driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_journeys_0` (`trip_id`),
  UNIQUE KEY `pk_journeys_1` (`status`),
  UNIQUE KEY `pk_journeys_2` (`conductor`),
  UNIQUE KEY `pk_journeys_3` (`driver`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mash_journeys` */

/*Table structure for table `mash_location_mapping` */

CREATE TABLE `mash_location_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journey_id` int(11) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `datetime_logged` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_location_mapping_0` (`journey_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mash_location_mapping` */

/*Table structure for table `mash_loyalty` */

CREATE TABLE `mash_loyalty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_loyalty_0` (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mash_loyalty` */

/*Table structure for table `mash_parcels` */

CREATE TABLE `mash_parcels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parcel_no` varchar(255) DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  `receiver` int(11) DEFAULT NULL,
  `description` text,
  `created_by` int(11) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trip_id` int(11) DEFAULT NULL,
  `dimensions` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_parcels` (`sender`),
  UNIQUE KEY `pk_parcels_0` (`receiver`),
  UNIQUE KEY `pk_parcels_1` (`created_by`),
  UNIQUE KEY `pk_parcels_2` (`trip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mash_parcels` */

/*Table structure for table `mash_passengers` */

CREATE TABLE `mash_passengers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `id_num` int(11) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cash_credit` int(11) DEFAULT NULL,
  `cash_debit` int(11) DEFAULT NULL,
  `cash_bal` int(11) DEFAULT '0',
  `loyaty_saved` int(11) DEFAULT '0',
  `loyalty_redeemed` int(11) DEFAULT '0',
  `loyalty_bal` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_edited` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mash_passengers` */

/*Table structure for table `mash_payment_methods` */

CREATE TABLE `mash_payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mash_payment_methods` */

/*Table structure for table `mash_routes` */

CREATE TABLE `mash_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `terminal_start` int(11) DEFAULT NULL,
  `terminal_end` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `duration` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `mash_routes` */

insert  into `mash_routes`(`id`,`description`,`terminal_start`,`terminal_end`,`company_id`,`distance`,`duration`) values (1,'Machakos-Embu',1,2,NULL,173.281,2.51111111111111);

/*Table structure for table `mash_seat_config` */

CREATE TABLE `mash_seat_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_file` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mash_seat_config` */

/*Table structure for table `mash_seats` */

CREATE TABLE `mash_seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `seat_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `mash_seats` */

insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (1,1,'A1');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (2,1,'A2');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (3,1,'A3');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (4,1,'A4');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (5,1,'A5');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (6,1,'A6');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (7,1,'A7');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (8,1,'B8');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (9,1,'B9');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (10,1,'B10');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (11,1,'B11');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (12,1,'B12');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (13,1,'B13');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (14,1,'B14');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (15,1,'B15');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (16,1,'C16');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (17,1,'C17');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (18,1,'C18');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (19,1,'C19');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (20,1,'C20');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (21,1,'C21');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (22,1,'C22');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (23,1,'C23');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (24,1,'C24');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (25,1,'C25');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (26,1,'C26');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (27,1,'C27');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (28,1,'C28');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (29,1,'C29');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (30,1,'C30');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (31,1,'C31');
insert  into `mash_seats`(`id`,`bus_id`,`seat_no`) values (32,1,'C32');

/*Table structure for table `mash_status` */

CREATE TABLE `mash_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mash_status` */

/*Table structure for table `mash_sub_route` */

CREATE TABLE `mash_sub_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `terminal_start` int(11) DEFAULT NULL,
  `terminal_end` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_sub_route_0` (`route_id`),
  UNIQUE KEY `pk_sub_route_1` (`terminal_start`),
  UNIQUE KEY `pk_sub_route_2` (`terminal_end`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mash_sub_route` */

/*Table structure for table `mash_susers` */

CREATE TABLE `mash_susers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `id_num` int(11) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `user_group` int(11) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mobilenumber` varchar(100) DEFAULT NULL,
  `terminal_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mash_susers` */

/*Table structure for table `mash_terminals` */

CREATE TABLE `mash_terminals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `terminal_name` varchar(100) DEFAULT NULL,
  `terminal_desc` text,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `terminal_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `mash_terminals` */

insert  into `mash_terminals`(`id`,`terminal_name`,`terminal_desc`,`longitude`,`latitude`,`terminal_code`) values (1,'Machakos, Kenya',NULL,37.2655191980468,-1.52133622934584,NULL);
insert  into `mash_terminals`(`id`,`terminal_name`,`terminal_desc`,`longitude`,`latitude`,`terminal_code`) values (2,'Embu, Kenya',NULL,37.4596409000001,-0.5388381,NULL);

/*Table structure for table `mash_timetable` */

CREATE TABLE `mash_timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `eta` time DEFAULT NULL,
  `fare` int(11) DEFAULT NULL,
  `start_terminal` int(11) DEFAULT NULL,
  `day_desc` varchar(100) DEFAULT NULL,
  `conductor` int(11) DEFAULT NULL,
  `driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `mash_timetable` */

insert  into `mash_timetable`(`id`,`bus_id`,`route_id`,`start_time`,`eta`,`fare`,`start_terminal`,`day_desc`,`conductor`,`driver`) values (1,1,1,'08:00:00',NULL,590,1,'Fri',14,15);
insert  into `mash_timetable`(`id`,`bus_id`,`route_id`,`start_time`,`eta`,`fare`,`start_terminal`,`day_desc`,`conductor`,`driver`) values (2,1,1,'09:00:00',NULL,90,1,'Mon',0,0);

/*Table structure for table `mash_transactions` */

CREATE TABLE `mash_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_no` varchar(100) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `transaction_num` int(11) DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `passenger` int(11) DEFAULT NULL,
  `uuser` int(11) DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `trip` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `mash_transactions` */

insert  into `mash_transactions`(`id`,`receipt_no`,`amount`,`transaction_num`,`payment_method`,`passenger`,`uuser`,`payment_type`,`trip`) values (1,'0890-1-1',5310,NULL,1,16,0,1,1);
insert  into `mash_transactions`(`id`,`receipt_no`,`amount`,`transaction_num`,`payment_method`,`passenger`,`uuser`,`payment_type`,`trip`) values (2,'0890-1-2',0,NULL,1,17,0,1,1);
insert  into `mash_transactions`(`id`,`receipt_no`,`amount`,`transaction_num`,`payment_method`,`passenger`,`uuser`,`payment_type`,`trip`) values (3,'0890-1-3',590,NULL,1,19,0,1,1);
insert  into `mash_transactions`(`id`,`receipt_no`,`amount`,`transaction_num`,`payment_method`,`passenger`,`uuser`,`payment_type`,`trip`) values (4,'0890-1-4',590,NULL,1,20,0,1,1);
insert  into `mash_transactions`(`id`,`receipt_no`,`amount`,`transaction_num`,`payment_method`,`passenger`,`uuser`,`payment_type`,`trip`) values (5,'0890-1-5',0,NULL,2,21,0,1,1);

/*Table structure for table `mash_trip` */

CREATE TABLE `mash_trip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `trip_date_time` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `mash_trip` */

insert  into `mash_trip`(`id`,`bus_id`,`trip_date_time`,`status`,`route_id`) values (1,1,1355461200,NULL,1);
insert  into `mash_trip`(`id`,`bus_id`,`trip_date_time`,`status`,`route_id`) values (2,1,1356066000,NULL,1);

/*Table structure for table `mash_user_group` */

CREATE TABLE `mash_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `mash_user_group` */

/*Table structure for table `parcels` */

CREATE TABLE `parcels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parcel_no` varchar(255) DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  `receiver` int(11) DEFAULT NULL,
  `description` text,
  `created_by` int(11) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trip_id` int(11) DEFAULT NULL,
  `dimensions` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_parcels` (`sender`),
  UNIQUE KEY `pk_parcels_0` (`receiver`),
  UNIQUE KEY `pk_parcels_1` (`created_by`),
  UNIQUE KEY `pk_parcels_2` (`trip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `parcels` */

/*Table structure for table `passengers` */

CREATE TABLE `passengers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `id_num` int(11) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cash_credit` int(11) DEFAULT NULL,
  `cash_debit` int(11) DEFAULT NULL,
  `cash_bal` int(11) DEFAULT '0',
  `loyaty_saved` int(11) DEFAULT '0',
  `loyalty_redeemed` int(11) DEFAULT '0',
  `loyalty_bal` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_edited` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `passengers` */

/*Table structure for table `payment_methods` */

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `payment_methods` */

/*Table structure for table `routes` */

CREATE TABLE `routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `terminal_start` int(11) DEFAULT NULL,
  `terminal_end` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `duration` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `routes` */

/*Table structure for table `seat_config` */

CREATE TABLE `seat_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_file` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `seat_config` */

/*Table structure for table `seats` */

CREATE TABLE `seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `seat_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `seats` */

/*Table structure for table `status` */

CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `status` */

/*Table structure for table `sub_route` */

CREATE TABLE `sub_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `terminal_start` int(11) DEFAULT NULL,
  `terminal_end` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_sub_route_0` (`route_id`),
  UNIQUE KEY `pk_sub_route_1` (`terminal_start`),
  UNIQUE KEY `pk_sub_route_2` (`terminal_end`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `sub_route` */

/*Table structure for table `susers` */

CREATE TABLE `susers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `id_num` int(11) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `user_group` int(11) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mobilenumber` varchar(100) DEFAULT NULL,
  `terminal_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `susers` */

/*Table structure for table `temp_users` */

CREATE TABLE `temp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

/*Data for the table `temp_users` */

insert  into `temp_users`(`id`,`session_id`,`date_created`) values (42,'592f706c50d476ac1b1474b3300c202a','2012-12-14 09:07:38');
insert  into `temp_users`(`id`,`session_id`,`date_created`) values (45,'fccb33e45ea1410b4a57f7f225bb22e8','2012-12-20 08:49:13');
insert  into `temp_users`(`id`,`session_id`,`date_created`) values (47,'dc8c4e44f7ff15a3160599eaf6702bfb','2012-12-20 09:23:32');
insert  into `temp_users`(`id`,`session_id`,`date_created`) values (48,'8e34183f13c65357ff30ba3d2385443e','2012-12-20 10:09:34');
insert  into `temp_users`(`id`,`session_id`,`date_created`) values (49,'6d19d2f716069343a79a354865503410','2013-01-04 15:25:03');

/*Table structure for table `terminals` */

CREATE TABLE `terminals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `terminal_name` varchar(100) DEFAULT NULL,
  `terminal_desc` text,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `terminal_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `terminals` */

/*Table structure for table `timetable` */

CREATE TABLE `timetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `eta` time DEFAULT NULL,
  `fare` int(11) DEFAULT NULL,
  `start_terminal` int(11) DEFAULT NULL,
  `day_desc` varchar(100) DEFAULT NULL,
  `conductor` int(11) DEFAULT NULL,
  `driver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `timetable` */

/*Table structure for table `transactions` */

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_no` varchar(100) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `transaction_num` int(11) DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `passenger` int(11) DEFAULT NULL,
  `uuser` int(11) DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `trip` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `transactions` */

/*Table structure for table `trip` */

CREATE TABLE `trip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) DEFAULT NULL,
  `trip_date_time` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `trip` */

/*Table structure for table `user_company_list` */

CREATE TABLE `user_company_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_agent_company_list_0` (`company_id`),
  UNIQUE KEY `pk_user_company_list` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='List of companies an agent/users can access';

/*Data for the table `user_company_list` */

/*Table structure for table `user_group` */

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `user_group` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
