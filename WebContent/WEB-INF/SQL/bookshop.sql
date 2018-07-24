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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.admin: ~0 rows (대략적)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`admin_no`, `admin_id`, `admin_pw`, `admin_name`, `admin_date`) VALUES
	(1, 'admin', '1234', '관리자', '2018-07-24 20:37:06');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. book
CREATE TABLE IF NOT EXISTS `book` (
  `book_no` int(10) NOT NULL AUTO_INCREMENT,
  `bookcode_no` int(10) NOT NULL,
  `publisher_no` int(10) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  `book_author` varchar(50) NOT NULL,
  `book_price` int(10) NOT NULL,
  `book_point` int(10) NOT NULL,
  `book_amount` int(10) NOT NULL,
  `book_out` varchar(50) NOT NULL,
  `book_date` datetime NOT NULL,
  PRIMARY KEY (`book_no`),
  KEY `FK_book_bookcode` (`bookcode_no`),
  KEY `FK_book_publisher` (`publisher_no`),
  CONSTRAINT `FK_book_bookcode` FOREIGN KEY (`bookcode_no`) REFERENCES `bookcode` (`bookcode_no`),
  CONSTRAINT `FK_book_publisher` FOREIGN KEY (`publisher_no`) REFERENCES `publisher` (`publisher_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.book: ~0 rows (대략적)
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. bookcode
CREATE TABLE IF NOT EXISTS `bookcode` (
  `bookcode_no` int(10) NOT NULL AUTO_INCREMENT,
  `bookcode_name` varchar(50) NOT NULL,
  PRIMARY KEY (`bookcode_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.bookcode: ~0 rows (대략적)
/*!40000 ALTER TABLE `bookcode` DISABLE KEYS */;
INSERT INTO `bookcode` (`bookcode_no`, `bookcode_name`) VALUES
	(1, '인문학'),
	(2, '소설');
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
  `bookreview_content` varchar(50) NOT NULL,
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
  `member_point` int(10) NOT NULL DEFAULT '0',
  `member_date` datetime NOT NULL,
  PRIMARY KEY (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.member: ~0 rows (대략적)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`member_no`, `member_id`, `member_pw`, `member_name`, `member_addr`, `member_point`, `member_date`) VALUES
	(1, 'id001', 'pw001', '홍길동', '금암동', 0, '2018-07-24 20:35:24');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.memberinter: ~0 rows (대략적)
/*!40000 ALTER TABLE `memberinter` DISABLE KEYS */;
INSERT INTO `memberinter` (`memeberinter_no`, `member_no`, `bookcode_no`) VALUES
	(1, 1, 1),
	(2, 1, 2);
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
  `publisher_no` int(10) NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(50) NOT NULL,
  `publisher_website` varchar(50) NOT NULL,
  PRIMARY KEY (`publisher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.publisher: ~0 rows (대략적)
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` (`publisher_no`, `publisher_name`, `publisher_website`) VALUES
	(1, '집영사', '집영사'),
	(2, '학문사', '학문사'),
	(3, '한마음', '한마음');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.qna: ~0 rows (대략적)
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` (`qna_no`, `member_no`, `qna_title`, `qna_content`, `qna_date`) VALUES
	(1, 1, '안녕하세요?', '안녕하세요?<br>안녕하세요?<br>안녕하세요?', '2018-07-24 20:36:42');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. qna_comment
CREATE TABLE IF NOT EXISTS `qna_comment` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.qna_comment: ~0 rows (대략적)
/*!40000 ALTER TABLE `qna_comment` DISABLE KEYS */;
INSERT INTO `qna_comment` (`qna_comment_no`, `qna_no`, `admin_no`, `comment_content`, `comment_date`) VALUES
	(1, 1, 1, '네 안녕하세요', '2018-07-24 20:38:55');
/*!40000 ALTER TABLE `qna_comment` ENABLE KEYS */;


-- 테이블 bookshop의 구조를 덤프합니다. shoppingcart
CREATE TABLE IF NOT EXISTS `shoppingcart` (
  `shoppingcart_no` int(10) NOT NULL AUTO_INCREMENT,
  `book_no` int(10) NOT NULL,
  `member_no` int(10) NOT NULL,
  `shoppingcart_amount` int(10) NOT NULL,
  `shoppingcart_price` int(10) NOT NULL,
  `shoppingcart_date` datetime NOT NULL,
  PRIMARY KEY (`shoppingcart_no`),
  KEY `FK_shopingcart_book` (`book_no`),
  KEY `FK_shopingcart_member` (`member_no`),
  CONSTRAINT `FK_shopingcart_book` FOREIGN KEY (`book_no`) REFERENCES `book` (`book_no`),
  CONSTRAINT `FK_shopingcart_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bookshop.shoppingcart: ~0 rows (대략적)
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
