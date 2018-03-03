/*
MySQL : Database - service_app_2018
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`service_app_2018` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `service_app_2018`;

/*Table structure for table `proizvodjac` */


DROP TABLE IF EXISTS `proizvodjac`;

CREATE TABLE `proizvodjac` (
  `proizvodjacID` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` text,
    PRIMARY KEY (`proizvodjacID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `proizvodjac` */

insert  into `proizvodjac`(`proizvodjacID`,`naziv`) values (1,'Samsung'),(2,'Panasonic'),(3,'Umi'),(4,'Alpha'),(5,'Netis');

/*Table structure for table `proizvod` */

DROP TABLE IF EXISTS `proizvod`;

CREATE TABLE `proizvod` (
  `proizvodID` int(11) NOT NULL,
  `proizvodjacID` int(11) NOT NULL,
  `naziv` text,
    PRIMARY KEY (`proizvodID`),
   CONSTRAINT `FK_proizvod` FOREIGN KEY (`proizvodjacID`) REFERENCES `proizvodjac` (`proizvodjacID`) ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `proizvod` */





/*Table structure for table `kupac` */

DROP TABLE IF EXISTS `kupac`;

CREATE TABLE `kupac` (
  `kupacID` bigint(11) NOT NULL,
  `naziv` varchar(50) DEFAULT NULL,
  `mesto` varchar(100) DEFAULT NULL,
  `adresa` varchar(100) DEFAULT NULL,
  `pttID` bigint(20) DEFAULT NULL,
  `pib` varchar(8) DEFAULT NULL,
  
  PRIMARY KEY (`kupacID`),
  KEY `pib` (`pib`)  
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `kupac` */

insert  into `kupac`(`kupacID`,`naziv`,`mesto`,`adresa`,`pttID`,`pib`) values (1,'Tehnomanija','Beograd','Ustanicka 10',11000,'34343434'),(2,'Mercator','Beograd','Pozeska 2',11000,'45454545'),(3,'Kondor AS','Kraljevo','Cara Lazara 1',36101,'33333333');



DROP TABLE IF EXISTS `serviser`;

CREATE TABLE `serviser` (
  `serviserID` int(11) NOT NULL,
  `naziv` text,
    PRIMARY KEY (`serviserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `serviser` */

insert  into `serviser`(`serviserID`,`naziv`) values (1,'BG Electronics'),(2,'Nepo'),(3,'Promobi'),(4,'Begram'),(5,'Mobis');


/*Table structure for table `kodobrenje` */

DROP TABLE IF EXISTS `kodobrenje`;

CREATE TABLE `kodobrenje` (
  `kodobrenjeID` int(11) NOT NULL AUTO_INCREMENT,
  `brnaloga` text NOT NULL,
  `serijskibroj` text NOT NULL,
   `proizvodID` int(11) NOT NULL,
   `kupacID` bigint(11) NOT NULL,
  `cena` double DEFAULT '0',
  `serviserID` int(11) NOT NULL,
  PRIMARY KEY (`kodobrenjeID`, `proizvodID`,  `serviserID`),
  KEY `FK_kodobrenje` (`kupacID`),
  CONSTRAINT `FK_kodobrenje` FOREIGN KEY (`kupacID`) REFERENCES `kupac` (`kupacID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_kodobrenje_1` FOREIGN KEY (`proizvodID`) REFERENCES `proizvod` (`proizvodID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_kodobrenje_2` FOREIGN KEY (`serviserID`) REFERENCES `serviser` (`serviserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kodobrenje` */



/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `user` int(11) NOT NULL,
  `roles` varchar(255) DEFAULT NULL,
  KEY `user` (`user`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `roles` */

insert  into `roles`(`user`,`roles`) values (1,'ROLE_ADMIN'),(1,'ROLE_USER'),(2,'ROLE_USER');



/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`firstName`,`lastName`) values (1,'admin','admin','Stefan','Vasic'),(2,'iv','iv','iv','iv');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
