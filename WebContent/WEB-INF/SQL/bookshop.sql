-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.5.32 - MySQL Community Server (GPL)
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- bookshop 의 데이터베이스 구조 덤핑
CREATE DATABASE IF NOT EXISTS `bookshop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bookshop`;


-- 테이블 bookshop의 구조를 덤프합니다. admin
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_no` int(10) NOT NULL AUTO_INCREMENT,
  `admin_id` varchar(50) NOT NULL,
  `admin_pw` varchar(50) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_date` datetime NOT NULL,
  PRIMARY KEY (`admin_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.admin: ~0 rows (대략적)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. book
CREATE TABLE IF NOT EXISTS `book` (
  `book_no` int(10) NOT NULL AUTO_INCREMENT,
  `bookcode_no` int(10) NOT NULL,
  `publischer_no` int(10) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  `book_author` varchar(50) NOT NULL,
  `book_price` int(10) NOT NULL,
  `book_point` int(10) NOT NULL,
  `book_amount` int(10) NOT NULL,
  `book_out` varchar(50) NOT NULL,
  `book_date` datetime NOT NULL,
  PRIMARY KEY (`book_no`),
  KEY `FK_book_bookcode` (`bookcode_no`),
  KEY `FK_book_publisher` (`publischer_no`),
  CONSTRAINT `FK_book_bookcode` FOREIGN KEY (`bookcode_no`) REFERENCES `bookcode` (`bookcode_no`),
  CONSTRAINT `FK_book_publisher` FOREIGN KEY (`publischer_no`) REFERENCES `publisher` (`publischer_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.book: ~0 rows (대략적)
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. bookcode
CREATE TABLE IF NOT EXISTS `bookcode` (
  `bookcode_no` int(10) NOT NULL AUTO_INCREMENT,
  `bookcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`bookcode_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.bookcode: ~0 rows (대략적)
/*!40000 ALTER TABLE `bookcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookcode` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. bookintro
CREATE TABLE IF NOT EXISTS `bookintro` (
  `bookintro_no` int(10) NOT NULL AUTO_INCREMENT,
  `book_no` int(10) NOT NULL,
  `bookintro_content` text NOT NULL,
  `bookintro_write` varchar(50) NOT NULL,
  PRIMARY KEY (`bookintro_no`),
  KEY `FK__bookintro_book` (`book_no`),
  CONSTRAINT `FK__bookintro_book` FOREIGN KEY (`book_no`) REFERENCES `book` (`book_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.bookintro: ~0 rows (대략적)
/*!40000 ALTER TABLE `bookintro` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookintro` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. bookreview
CREATE TABLE IF NOT EXISTS `bookreview` (
  `bookreview_no` int(10) NOT NULL AUTO_INCREMENT,
  `book_no` int(10) NOT NULL,
  `member_no` int(10) NOT NULL,
  `bookreview_content` int(10) NOT NULL,
  PRIMARY KEY (`bookreview_no`),
  KEY `FK_bookreview_book` (`book_no`),
  KEY `FK_bookreview_member` (`member_no`),
  CONSTRAINT `FK_bookreview_book` FOREIGN KEY (`book_no`) REFERENCES `book` (`book_no`),
  CONSTRAINT `FK_bookreview_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.bookreview: ~0 rows (대략적)
/*!40000 ALTER TABLE `bookreview` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookreview` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. member
CREATE TABLE IF NOT EXISTS `member` (
  `member_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) NOT NULL,
  `member_pw` varchar(50) NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `member_addr` varchar(50) NOT NULL,
  `member_point` int(10) NOT NULL,
  `member_date` datetime NOT NULL,
  PRIMARY KEY (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.member: ~0 rows (대략적)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. memberinter
CREATE TABLE IF NOT EXISTS `memberinter` (
  `memeberinter_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_no` int(10) NOT NULL,
  `bookcode_no` int(10) NOT NULL,
  PRIMARY KEY (`memeberinter_no`),
  KEY `FK_memberinter_bookcode` (`bookcode_no`),
  KEY `FK_memberinter_member` (`member_no`),
  CONSTRAINT `FK_memberinter_bookcode` FOREIGN KEY (`bookcode_no`) REFERENCES `bookcode` (`bookcode_no`),
  CONSTRAINT `FK_memberinter_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.memberinter: ~0 rows (대략적)
/*!40000 ALTER TABLE `memberinter` DISABLE KEYS */;
/*!40000 ALTER TABLE `memberinter` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. orders
CREATE TABLE IF NOT EXISTS `orders` (
  `orders_no` int(10) NOT NULL AUTO_INCREMENT,
  `book_no` int(10) NOT NULL,
  `member_no` int(10) NOT NULL,
  `orders_amount` int(10) NOT NULL,
  `orders_price` int(10) NOT NULL,
  `orders_date` datetime NOT NULL,
  `orders_addr` varchar(50) NOT NULL,
  `orders_state` varchar(50) NOT NULL,
  PRIMARY KEY (`orders_no`),
  KEY `FK_orders_book` (`book_no`),
  KEY `FK_orders_member` (`member_no`),
  CONSTRAINT `FK_orders_book` FOREIGN KEY (`book_no`) REFERENCES `book` (`book_no`),
  CONSTRAINT `FK_orders_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.orders: ~0 rows (대략적)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. publisher
CREATE TABLE IF NOT EXISTS `publisher` (
  `publischer_no` int(10) NOT NULL AUTO_INCREMENT,
  `publischer_name` varchar(50) NOT NULL,
  `publischer_website` varchar(50) NOT NULL,
  PRIMARY KEY (`publischer_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.publisher: ~0 rows (대략적)
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. qna
CREATE TABLE IF NOT EXISTS `qna` (
  `qna_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_no` int(10) NOT NULL,
  `qna_title` varchar(50) NOT NULL,
  `qna_content` varchar(50) NOT NULL,
  `qna_date` datetime NOT NULL,
  PRIMARY KEY (`qna_no`),
  KEY `FK_qna_member` (`member_no`),
  CONSTRAINT `FK_qna_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.qna: ~0 rows (대략적)
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. qnacomment
CREATE TABLE IF NOT EXISTS `qnacomment` (
  `qna_comment_no` int(10) NOT NULL AUTO_INCREMENT,
  `qna_no` int(10) NOT NULL,
  `admin_no` int(10) NOT NULL,
  `comment_content` varchar(50) NOT NULL,
  `comment_date` datetime NOT NULL,
  PRIMARY KEY (`qna_comment_no`),
  KEY `FK_qnacomment_qna` (`qna_no`),
  KEY `FK_qnacomment_admin` (`admin_no`),
  CONSTRAINT `FK_qnacomment_admin` FOREIGN KEY (`admin_no`) REFERENCES `admin` (`admin_no`),
  CONSTRAINT `FK_qnacomment_qna` FOREIGN KEY (`qna_no`) REFERENCES `qna` (`qna_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.qnacomment: ~0 rows (대략적)
/*!40000 ALTER TABLE `qnacomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `qnacomment` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. shopingcart
CREATE TABLE IF NOT EXISTS `shopingcart` (
  `shopingcart_no` int(10) NOT NULL AUTO_INCREMENT,
  `book_no` int(10) NOT NULL,
  `member_no` int(10) NOT NULL,
  `shopingcart_amount` int(10) NOT NULL,
  `shopingcart_price` int(10) NOT NULL,
  `shopingcart_date` datetime NOT NULL,
  PRIMARY KEY (`shopingcart_no`),
  KEY `FK_shopingcart_book` (`book_no`),
  KEY `FK_shopingcart_member` (`member_no`),
  CONSTRAINT `FK_shopingcart_book` FOREIGN KEY (`book_no`) REFERENCES `book` (`book_no`),
  CONSTRAINT `FK_shopingcart_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.shopingcart: ~0 rows (대략적)
/*!40000 ALTER TABLE `shopingcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopingcart` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
