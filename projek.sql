/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.4.24-MariaDB : Database - project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`project` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `project`;

/*Table structure for table `guru` */

DROP TABLE IF EXISTS `guru`;

CREATE TABLE `guru` (
  `nip` char(225) NOT NULL,
  `id_user` varchar(20) NOT NULL,
  `id_matapelajaran` varchar(20) NOT NULL,
  `nama` char(225) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  PRIMARY KEY (`nip`),
  KEY `id_user` (`id_user`),
  KEY `id_matapelajaran` (`id_matapelajaran`),
  CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `guru_ibfk_2` FOREIGN KEY (`id_matapelajaran`) REFERENCES `matapelajaran` (`id_matapelajaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `guru` */

/*Table structure for table `kelas` */

DROP TABLE IF EXISTS `kelas`;

CREATE TABLE `kelas` (
  `id_kelas` varchar(20) NOT NULL,
  `angkatan` year(4) DEFAULT NULL,
  `jurusan` char(225) DEFAULT NULL,
  `rombel` char(225) DEFAULT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `kelas` */

insert  into `kelas`(`id_kelas`,`angkatan`,`jurusan`,`rombel`) values 
('RPL-01',2021,'RPL','1'),
('RPL-02',2021,'RPL','2');

/*Table structure for table `komponen` */

DROP TABLE IF EXISTS `komponen`;

CREATE TABLE `komponen` (
  `id_komponen` varchar(20) NOT NULL,
  `id_matapelajaran` varchar(20) NOT NULL,
  `nama` char(225) DEFAULT NULL,
  PRIMARY KEY (`id_komponen`),
  KEY `id_matapelajaran` (`id_matapelajaran`),
  CONSTRAINT `komponen_ibfk_1` FOREIGN KEY (`id_matapelajaran`) REFERENCES `matapelajaran` (`id_matapelajaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `komponen` */

/*Table structure for table `matapelajaran` */

DROP TABLE IF EXISTS `matapelajaran`;

CREATE TABLE `matapelajaran` (
  `id_matapelajaran` varchar(20) NOT NULL,
  `nama` char(225) DEFAULT NULL,
  PRIMARY KEY (`id_matapelajaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `matapelajaran` */

/*Table structure for table `nilai` */

DROP TABLE IF EXISTS `nilai`;

CREATE TABLE `nilai` (
  `id_nilai` varchar(20) NOT NULL,
  `id_komponen` varchar(20) NOT NULL,
  `nis` char(225) NOT NULL,
  `nip` char(225) NOT NULL,
  `index` char(30) DEFAULT NULL,
  `deskripsi` char(30) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_nilai`),
  KEY `nip` (`nip`),
  KEY `nis` (`nis`),
  KEY `id_komponen` (`id_komponen`),
  CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `guru` (`nip`),
  CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`),
  CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`id_komponen`) REFERENCES `komponen` (`id_komponen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `nilai` */

/*Table structure for table `siswa` */

DROP TABLE IF EXISTS `siswa`;

CREATE TABLE `siswa` (
  `nis` char(225) NOT NULL,
  `id_user` varchar(20) NOT NULL,
  `id_kelas` varchar(20) NOT NULL,
  `nama` char(225) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  PRIMARY KEY (`nis`),
  KEY `id_user` (`id_user`),
  KEY `id_kelas` (`id_kelas`),
  CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `siswa_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `siswa` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id_user` varchar(20) NOT NULL,
  `username` char(225) NOT NULL,
  `password` char(225) NOT NULL,
  `role` char(225) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user` */

insert  into `user`(`id_user`,`username`,`password`,`role`) values 
('1','Galang','12345','kurikulum'),
('2','Panji','12345','guru'),
('3','Fahrizza','12345','walikelas'),
('4','Refalza','12345','siswa'),
('5','Rasdi','12345','siswa');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
