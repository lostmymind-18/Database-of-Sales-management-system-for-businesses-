-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2021 at 08:38 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `customer_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `ID` int(11) NOT NULL,
  `PRICE` float DEFAULT NULL,
  `CATEGORY` varchar(50) DEFAULT NULL,
  `TRANSACTION_ID` int(11) NOT NULL,
  `TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`ID`, `PRICE`, `CATEGORY`, `TRANSACTION_ID`, `TIME`) VALUES
(150, 10, 'A B C D', 1, '2020-12-28 17:17:17'),
(151, 22, 'A B C e', 2, '2020-12-28 17:17:17'),
(152, 15, 'A B aC', 3, '2020-12-28 17:17:17'),
(153, 30, 'A B1 C', 4, '2020-12-28 17:17:17'),
(154, 37, 'A B4 C', 5, '2020-12-28 17:17:17'),
(155, 10, 'A B C5', 6, '2020-12-28 17:17:17'),
(156, 60, 'A8 B C', 7, '2020-12-28 17:17:17'),
(157, 100, 'A B1 C', 8, '2020-12-28 17:17:17'),
(158, 102, 'A B C', 9, '2020-12-28 17:17:17');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `BRANCH_ID` int(11) NOT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE` varchar(10) DEFAULT NULL,
  `COMPANY_ID` int(11) NOT NULL,
  `MANAGER_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`BRANCH_ID`, `ADDRESS`, `EMAIL`, `PHONE`, `COMPANY_ID`, `MANAGER_ID`) VALUES
(1, 'TPHCM', 'shopee.tphcm@gmail.com', '082-11182', 1, NULL),
(2, 'Da Nang', 'shopee.danang@gmail.com', '082-13282', 1, '792000013'),
(3, 'TPHCM', 'tiki.tphcm@gmail.com', '082-11442', 2, '792000014'),
(4, 'Can tho', 'zalo.cantho@gmail.com', '082-22182', 3, '792000011'),
(5, 'Nghe An', 'momo.nghean@gmail.com', '083-21182', 4, '792000016'),
(6, 'TPHCM', 'sea.tphcm@gmail.com', '088-11182', 5, '792000017'),
(7, 'TPHCM', 'eastagile.tphcm@gmail.com', '082-12142', 6, '792000018'),
(8, 'Hue', 'unix.hue@gmail.com', '088-25698', 7, '792000020'),
(9, 'TPHCM', 'gameloft.tphcm@gmail.com', '087-12182', 8, '792000021'),
(10, 'Ha Noi', 'gameloft.hanoi@gmail.com', '089-87512', 8, '792000022'),
(11, 'TPHCM', 'vng.tphcm@gmail.com', '084-12182', 9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `COMPANY_ID` int(11) NOT NULL,
  `COMPANY_NAME` varchar(50) DEFAULT NULL,
  `REPRESENTATIVE_NAME` varchar(50) DEFAULT NULL,
  `REPRESENTATIVE_CMND` varchar(50) DEFAULT NULL,
  `REPRESENTATIVE_PHONE` varchar(10) DEFAULT NULL,
  `REPRESENTATIVE_EMAIL` varchar(50) DEFAULT NULL,
  `BUSINESS_MODEL` varchar(50) DEFAULT NULL,
  `BUSINESS_TYPE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`COMPANY_ID`, `COMPANY_NAME`, `REPRESENTATIVE_NAME`, `REPRESENTATIVE_CMND`, `REPRESENTATIVE_PHONE`, `REPRESENTATIVE_EMAIL`, `BUSINESS_MODEL`, `BUSINESS_TYPE`) VALUES
(1, 'Shopee', 'Dao Minh Tan', '0792000001', '0908123654', 'dtan@gmail.com', 'B2B', 'Shopping'),
(2, 'Tiki', 'Truong Minh Hiep', '0792000002', '0908123665', 'tmhiep@gmail.com', 'B2C', 'Shopping'),
(3, 'Zalo', 'Nguyen Viet Long', '0792000003', '0908123111', 'nvlong@gmail.com', 'B2B', 'Service'),
(4, 'Momo', 'Huynh Cong Hai', '0792000004', '0974123654', 'hchai@gmail.com', 'C2C', 'Restaurant'),
(5, 'Sea Group', 'Nguyen Trong Nhat', '0792000005', '0922123654', 'ntnhat@gmail.com', 'B2C', 'Game'),
(6, 'East Agile', 'Ngo Duong Hoang An', '0792000006', '0908741654', 'ndhan@gmail.com', 'B2B', 'Travel'),
(7, 'Unix', 'Hoang Vu Tinh', '0792000007', '0908521665', 'hvtinh@gmail.com', 'C2C', 'Technology'),
(8, 'Gameloft', 'Ho Ngoc Tri', '0792000008', '0908222111', 'hntri@gmail.com', 'B2B', 'Game'),
(9, 'Vinagame', 'Ho Minh Hoang', '0792000009', '0974129857', 'hmhoang@gmail.com', 'B2C', 'Beauty');

-- --------------------------------------------------------

--
-- Table structure for table `company_account`
--

CREATE TABLE `company_account` (
  `ACCOUNT_ID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `COMPANY_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_account`
--

INSERT INTO `company_account` (`ACCOUNT_ID`, `USERNAME`, `PASSWORD`, `COMPANY_ID`) VALUES
(1, 'phankhanhthinh1', '123456', 1),
(2, 'phankhanhthinh2', '123456', 2),
(3, 'phankhanhthinh3', '123456', 3),
(4, 'phankhanhthinh4', '123456', 4),
(5, 'phankhanhthinh5', '123456', 5),
(6, 'phankhanhthinh6', '123456', 6),
(7, 'phankhanhthinh7', '123456', 7),
(8, 'phankhanhthinh8', '123456', 8),
(9, 'phankhanhthinh9', '123456', 9);

-- --------------------------------------------------------

--
-- Table structure for table `company_email`
--

CREATE TABLE `company_email` (
  `COMPANY_ID` int(11) NOT NULL,
  `EMAIL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_email`
--

INSERT INTO `company_email` (`COMPANY_ID`, `EMAIL`) VALUES
(1, 'shopee@gmail.com'),
(1, 'shopee_product@gmail.com'),
(1, 'shopee_service@gmail.com'),
(2, 'tiki@gmail.com'),
(3, 'zalo@gmail.com'),
(4, 'momo.customer.service@gmail.com'),
(4, 'momo@gmail.com'),
(5, 'seagroup@gmail.com'),
(6, 'east.agile@gmail.com'),
(7, 'unix@gmail.com'),
(8, 'gameloft.1@gmail.com'),
(8, 'gameloft.2@gmail.com'),
(8, 'gameloft.3@gmail.com'),
(9, 'vinagame@gmail.com'),
(9, 'vng@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `company_phone`
--

CREATE TABLE `company_phone` (
  `COMPANY_ID` int(11) NOT NULL,
  `PHONE` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_phone`
--

INSERT INTO `company_phone` (`COMPANY_ID`, `PHONE`) VALUES
(1, '0987248512'),
(2, '0987224512'),
(3, '0987296512'),
(4, '0987241112'),
(4, '0987248742'),
(5, '0965248512'),
(6, '0947248512'),
(7, '0988548512'),
(8, '0912248512'),
(8, '0987214712'),
(9, '0985248512');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `PROMOTION_ID` int(11) NOT NULL,
  `DISCOUNT` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`PROMOTION_ID`, `DISCOUNT`) VALUES
(201, 1.5),
(202, 1.6),
(203, 2.5),
(203, 0.5),
(202, 1.5),
(201, 1.9);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CUSTOMER_ID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CUSTOMER_ID`) VALUES
('0792000101'),
('0792000102'),
('0792000103'),
('0792000104'),
('0792000105'),
('0792000106'),
('0792000107'),
('0792000108'),
('0907123111'),
('0907123112'),
('0907123113'),
('0907123114'),
('0907123115'),
('0907123116'),
('0907123117'),
('0907123118');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `CMND` varchar(10) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `PHONE` varchar(10) DEFAULT NULL,
  `HIREDATE` datetime DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `SEX` varchar(50) DEFAULT NULL,
  `BIRTHDATE` datetime DEFAULT NULL,
  `BRANCH_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`CMND`, `NAME`, `PHONE`, `HIREDATE`, `EMAIL`, `SEX`, `BIRTHDATE`, `BRANCH_ID`) VALUES
('792000011', 'Pham Quang Lam', '0987452145', '2010-01-01 00:00:00', 'pqlam@gmail', 'Male', '2000-01-01 10:00:00', 4),
('792000013', 'Ngo Phuong Trinh', '0912452145', '2009-11-01 00:00:00', 'nptrinh@gmail', 'Female', '2000-01-01 10:00:00', 2),
('792000014', 'Ngo Quang Anh', '0984112145', '2010-01-01 00:00:00', 'nqanh@gmail', 'Male', '2000-01-01 10:00:00', 3),
('792000015', 'Bui Huu Dang', '0987452145', '2005-01-01 00:00:00', 'bhdang@gmail', 'Female', '2000-01-01 10:00:00', 4),
('792000016', 'Pham Hong Lam', '0987452145', '2010-01-01 00:00:00', 'phlam@gmail', 'Male', '2000-01-01 10:00:00', 5),
('792000017', 'Hoang Ngoc Thinh', '0987982145', '1999-01-01 00:00:00', 'hnthinh@gmail', 'Female', '2000-01-01 10:00:00', 6),
('792000018', 'Pham Duc Duy Anh', '0987772145', '2010-01-01 00:00:00', 'pddanh@gmail', 'Male', '2000-01-01 10:00:00', 7),
('792000019', 'Phan Khanh Thinh', '0987472145', '2010-01-01 00:00:00', 'pkthinh@gmail', 'Male', '2000-01-01 10:00:00', 7),
('792000020', 'Ho Van Hoa', '0988452145', '2010-01-01 00:00:00', 'hvhoa@gmail', 'Male', '2000-01-01 10:00:00', 8),
('792000021', 'Truong Duc Tuan', '0987452146', '2010-01-01 00:00:00', 'tdtuan@gmail', 'Male', '2000-01-01 10:00:00', 9),
('792000022', 'Nguyen Khang Duy', '0987452147', '2010-01-01 00:00:00', 'nkduy@gmail', 'Female', '2000-01-01 10:00:00', 10),
('792000026', 'Nguyen Le Nhat Nam', '0998452145', '2010-01-01 00:00:00', 'nlnnam@gmail', 'Male', '2000-01-01 10:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `employee_account`
--

CREATE TABLE `employee_account` (
  `ACCOUNT_ID` int(11) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `COMPANY_ACCOUNT_ID` int(11) NOT NULL,
  `EMPLOYEE_ID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_account`
--

INSERT INTO `employee_account` (`ACCOUNT_ID`, `USERNAME`, `PASSWORD`, `COMPANY_ACCOUNT_ID`, `EMPLOYEE_ID`) VALUES
(1, 'pkt12', '123456', 2, '792000011'),
(2, 'pkt13', '123456', 3, '792000013'),
(3, 'pkt14', '123456', 2, '792000015'),
(4, 'pkt15', '123456', 3, '792000016'),
(5, 'pkt16', '123456', 4, '792000017'),
(6, 'pkt17', '123456', 2, '792000018'),
(7, 'pkt20', '123456', 5, '792000019'),
(8, 'pkt21', '123456', 6, '792000020'),
(9, 'pkt22', '123456', 7, '792000021'),
(11, 'pkt24', '123456', 6, '792000026');

-- --------------------------------------------------------

--
-- Table structure for table `gift`
--

CREATE TABLE `gift` (
  `PROMOTION_ID` int(11) NOT NULL,
  `VALUE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gift`
--

INSERT INTO `gift` (`PROMOTION_ID`, `VALUE`) VALUES
(201, 'car'),
(202, 'car1'),
(204, 'car2'),
(202, 'car3'),
(203, 'car4'),
(203, 'car5');

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_card`
--

CREATE TABLE `loyalty_card` (
  `CARD_ID` int(11) NOT NULL,
  `EXPIRE_DAY` datetime DEFAULT NULL,
  `POINT` int(11) DEFAULT NULL,
  `CUSTOMER_ID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loyalty_card`
--

INSERT INTO `loyalty_card` (`CARD_ID`, `EXPIRE_DAY`, `POINT`, `CUSTOMER_ID`) VALUES
(1, '2021-12-12 23:59:59', 100, '0792000101'),
(2, '2021-12-12 23:59:59', 110, '0792000102'),
(3, '2021-12-12 23:59:59', 120, '0792000103'),
(4, '2021-12-12 23:59:59', 100, '0792000104'),
(5, '2021-12-12 23:59:59', 130, '0792000105'),
(6, '2021-12-12 23:59:59', 100, '0792000106'),
(7, '2021-12-12 23:59:59', 150, '0792000107');

-- --------------------------------------------------------

--
-- Table structure for table `member_customer`
--

CREATE TABLE `member_customer` (
  `CMND` varchar(50) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `PHONE` varchar(50) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `SEX` varchar(10) DEFAULT NULL,
  `BIRTHDATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member_customer`
--

INSERT INTO `member_customer` (`CMND`, `NAME`, `PHONE`, `ADDRESS`, `EMAIL`, `SEX`, `BIRTHDATE`) VALUES
('0792000101', 'Pham Duc Duy Anh', '0987456321', 'TPHCM', 'anhpham@gmail.com', 'Male', '2000-01-15 00:00:00'),
('0792000102', 'Pham Quang Huy', '0987451121', 'TPHCM', 'pqhuy@gmail.com', 'Female', '2000-01-15 00:00:00'),
('0792000103', 'Pham Dan Anh', '0987456333', 'TPHCM', 'dananh@gmail.com', 'Female', '2000-01-15 00:00:00'),
('0792000104', 'Ngo Quoc Cuong', '0987422321', 'TPHCM', 'nqcuong@gmail.com', 'Male', '2000-01-15 00:00:00'),
('0792000105', 'Nguyen Le Bao Tran', '0911456321', 'Yen Bai', 'nlbtran@gmail.com', 'Female', '2000-01-15 00:00:00'),
('0792000106', 'Ngo Gia Thuan', '0987456333', 'TPHCM', 'dananh@gmail.com', 'Female', '2000-01-15 00:00:00'),
('0792000107', 'Ngo Gia Tran', '0987422321', 'Hue', 'nqcuong@gmail.com', 'Male', '2000-01-15 00:00:00');

--
-- Triggers `member_customer`
--
DELIMITER $$
CREATE TRIGGER `trg_insert_new_cus` BEFORE INSERT ON `member_customer` FOR EACH ROW BEGIN
INSERT INTO customer VALUES(NEW.cmnd);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `normal_customer`
--

CREATE TABLE `normal_customer` (
  `PHONE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `normal_customer`
--

INSERT INTO `normal_customer` (`PHONE`) VALUES
('0907123111'),
('0907123112'),
('0907123113'),
('0907123114'),
('0907123115'),
('0907123116'),
('0907123117'),
('0907123118');

-- --------------------------------------------------------

--
-- Table structure for table `product_service`
--

CREATE TABLE `product_service` (
  `COMPANY_ID` int(11) NOT NULL,
  `PRODUCT_SERVICE_ID` int(11) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `PRICE` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_service`
--

INSERT INTO `product_service` (`COMPANY_ID`, `PRODUCT_SERVICE_ID`, `NAME`, `PRICE`) VALUES
(1, 1, 'Shoes', 50000),
(1, 2, 'Bag', 100000),
(2, 1, 'Shoes', 50000),
(2, 2, 'T-shirt', 200000),
(3, 1, 'Water bills payment', 250000),
(3, 2, 'Electricity bills payment', 500000),
(3, 3, 'Tax bills payment', 10000),
(4, 1, 'Money transfer', 5000),
(4, 2, 'Payment', 10000),
(5, 1, 'Bang Bang', 5000),
(5, 2, 'Garden on cloud', 5000),
(5, 3, 'Gunny', 5000),
(6, 1, 'Flight ticket', 250000),
(7, 1, 'Software', 2000000),
(7, 2, 'Hardware', 1000000),
(8, 1, 'Bang Bang', 10000),
(8, 2, 'Garden on cloud', 10000),
(8, 3, 'Gunny', 5000),
(9, 1, 'Mascara', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `PROMOTION_ID` int(11) NOT NULL,
  `LICENSE` varchar(50) DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`PROMOTION_ID`, `LICENSE`, `START_TIME`, `END_TIME`) VALUES
(200, 'A', '2020-12-28 17:17:17', '2020-12-30 17:17:17'),
(201, 'B', '2020-12-29 08:17:17', '2020-12-30 17:17:17'),
(202, 'C', '2020-12-28 18:17:17', '2020-12-30 17:17:17'),
(203, 'D', '2020-12-29 17:17:17', '2020-12-30 17:17:17'),
(204, 'E', '2020-12-21 17:17:17', '2020-12-30 17:17:17'),
(205, 'F', '2020-12-22 17:17:17', '2020-12-30 17:17:17');

-- --------------------------------------------------------

--
-- Table structure for table `promotion_join`
--

CREATE TABLE `promotion_join` (
  `PROMOTION_ID` int(11) NOT NULL,
  `CUSTOMER_ID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `promotion_join`
--

INSERT INTO `promotion_join` (`PROMOTION_ID`, `CUSTOMER_ID`) VALUES
(200, '0792000103'),
(202, '0792000104'),
(205, '0792000101'),
(202, '0792000108'),
(205, '0792000102'),
(203, '0792000107');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `PERIODIC` varchar(50) NOT NULL,
  `REPORT_TYPE` varchar(50) DEFAULT NULL,
  `CONTENT` varchar(200) DEFAULT NULL,
  `PRODUCT_SERVICE_ID` int(11) NOT NULL,
  `COMPANY_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`PERIODIC`, `REPORT_TYPE`, `CONTENT`, `PRODUCT_SERVICE_ID`, `COMPANY_ID`) VALUES
('I', 'T', 'adasf', 1, 1),
('II', 'P', 'aadasf', 1, 2),
('III', 'T', 'adfffasf', 1, 3),
('IV', 'P', 'adasfea', 1, 4),
('V', 'T', 'adaarrsf', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `take_care`
--

CREATE TABLE `take_care` (
  `CUSTOMER_ID` varchar(50) NOT NULL,
  `EMPLOYEE_ACCOUNT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `take_care`
--

INSERT INTO `take_care` (`CUSTOMER_ID`, `EMPLOYEE_ACCOUNT_ID`) VALUES
('0792000101', 8),
('0792000102', 9),
('0792000108', 6),
('0792000108', 7),
('0907123111', 2),
('0907123111', 3),
('0907123111', 4),
('0907123114', 5);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `TRANSACTION_ID` int(11) NOT NULL,
  `CONTENT` varchar(50) DEFAULT NULL,
  `COST` float DEFAULT NULL,
  `PRODUCT_SERVICE_ID` int(11) NOT NULL,
  `COMPANY_ID` int(11) NOT NULL,
  `CUSTOMER_ID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`TRANSACTION_ID`, `CONTENT`, `COST`, `PRODUCT_SERVICE_ID`, `COMPANY_ID`, `CUSTOMER_ID`) VALUES
(1, 'Buy shoes', 100000, 1, 1, '0792000102'),
(2, 'Buy bag', 200000, 2, 1, '0792000103'),
(3, 'Playing game', 250000, 2, 3, '0792000108'),
(4, 'Pay tax', 50000, 3, 3, '0792000102'),
(5, 'Playing game', 100000, 1, 5, '0792000102'),
(6, 'Buy ticket', 250000, 1, 6, '0792000102'),
(7, 'Buy elements', 200000, 1, 7, '0792000104'),
(8, 'Buy ticket1', 250001, 1, 6, '0792000102'),
(9, 'Buy elements1', 200001, 1, 7, '0792000104');

-- --------------------------------------------------------

--
-- Table structure for table `use_service`
--

CREATE TABLE `use_service` (
  `COMPANY_ID` int(11) NOT NULL,
  `PRODUCT_SERVICE_ID` int(11) NOT NULL,
  `CUSTOMER_ID` varchar(50) NOT NULL,
  `TRANSACTION_ID` int(11) NOT NULL,
  `START_TIME` datetime NOT NULL,
  `END_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `use_service`
--

INSERT INTO `use_service` (`COMPANY_ID`, `PRODUCT_SERVICE_ID`, `CUSTOMER_ID`, `TRANSACTION_ID`, `START_TIME`, `END_TIME`) VALUES
(1, 1, '0792000107', 1, '2020-12-28 17:17:17', '2021-12-28 17:17:17'),
(1, 2, '0792000107', 1, '2020-12-28 17:17:18', '2021-12-28 17:17:17'),
(2, 1, '0792000102', 2, '2020-12-28 17:17:19', '2021-12-28 17:17:17'),
(3, 1, '0792000103', 4, '2020-12-28 17:17:20', '2021-12-28 17:17:17'),
(3, 2, '0792000107', 3, '2020-12-28 17:17:21', '2021-12-28 17:17:17'),
(4, 1, '0792000107', 1, '2020-12-28 17:17:22', '2021-12-28 17:17:17'),
(5, 1, '0792000107', 6, '2020-12-28 17:17:23', '2021-12-28 17:17:17'),
(6, 1, '0792000107', 5, '2020-12-28 17:17:24', '2021-12-28 17:17:17'),
(7, 1, '0792000107', 5, '2020-12-28 17:17:25', '2021-12-28 17:17:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `TRANSACTION_ID` (`TRANSACTION_ID`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`BRANCH_ID`),
  ADD KEY `fk_branch` (`COMPANY_ID`),
  ADD KEY `fk_employee_manager` (`MANAGER_ID`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`COMPANY_ID`);

--
-- Indexes for table `company_account`
--
ALTER TABLE `company_account`
  ADD PRIMARY KEY (`ACCOUNT_ID`),
  ADD UNIQUE KEY `USERNAME` (`USERNAME`),
  ADD UNIQUE KEY `COMPANY_ID` (`COMPANY_ID`),
  ADD KEY `idx_conpany_account` (`COMPANY_ID`);

--
-- Indexes for table `company_email`
--
ALTER TABLE `company_email`
  ADD PRIMARY KEY (`COMPANY_ID`,`EMAIL`);

--
-- Indexes for table `company_phone`
--
ALTER TABLE `company_phone`
  ADD PRIMARY KEY (`COMPANY_ID`,`PHONE`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD KEY `fk_coupon` (`PROMOTION_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CUSTOMER_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`CMND`),
  ADD KEY `fk_employee` (`BRANCH_ID`);

--
-- Indexes for table `employee_account`
--
ALTER TABLE `employee_account`
  ADD PRIMARY KEY (`ACCOUNT_ID`),
  ADD UNIQUE KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`),
  ADD UNIQUE KEY `USERNAME` (`USERNAME`),
  ADD KEY `fk_employee_account` (`COMPANY_ACCOUNT_ID`),
  ADD KEY `idx_emp_account` (`EMPLOYEE_ID`);

--
-- Indexes for table `gift`
--
ALTER TABLE `gift`
  ADD KEY `fk_gift` (`PROMOTION_ID`);

--
-- Indexes for table `loyalty_card`
--
ALTER TABLE `loyalty_card`
  ADD PRIMARY KEY (`CARD_ID`),
  ADD UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  ADD KEY `idx_loyalty` (`CUSTOMER_ID`,`POINT`);

--
-- Indexes for table `member_customer`
--
ALTER TABLE `member_customer`
  ADD PRIMARY KEY (`CMND`),
  ADD UNIQUE KEY `CMND` (`CMND`);

--
-- Indexes for table `normal_customer`
--
ALTER TABLE `normal_customer`
  ADD PRIMARY KEY (`PHONE`),
  ADD UNIQUE KEY `PHONE` (`PHONE`);

--
-- Indexes for table `product_service`
--
ALTER TABLE `product_service`
  ADD PRIMARY KEY (`COMPANY_ID`,`PRODUCT_SERVICE_ID`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`PROMOTION_ID`);

--
-- Indexes for table `promotion_join`
--
ALTER TABLE `promotion_join`
  ADD KEY `fk_promotion_1` (`PROMOTION_ID`),
  ADD KEY `fk_promotion_2` (`CUSTOMER_ID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`PERIODIC`),
  ADD KEY `fk_report` (`COMPANY_ID`,`PRODUCT_SERVICE_ID`);

--
-- Indexes for table `take_care`
--
ALTER TABLE `take_care`
  ADD PRIMARY KEY (`CUSTOMER_ID`,`EMPLOYEE_ACCOUNT_ID`),
  ADD KEY `fk_take_care_1` (`EMPLOYEE_ACCOUNT_ID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`TRANSACTION_ID`),
  ADD KEY `fk_transaction1` (`COMPANY_ID`,`PRODUCT_SERVICE_ID`),
  ADD KEY `idx_transaction` (`TRANSACTION_ID`);

--
-- Indexes for table `use_service`
--
ALTER TABLE `use_service`
  ADD PRIMARY KEY (`COMPANY_ID`,`PRODUCT_SERVICE_ID`,`CUSTOMER_ID`,`TRANSACTION_ID`,`START_TIME`),
  ADD KEY `fk_use_2` (`CUSTOMER_ID`),
  ADD KEY `fk_use_3` (`TRANSACTION_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `BRANCH_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `COMPANY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `company_account`
--
ALTER TABLE `company_account`
  MODIFY `ACCOUNT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `employee_account`
--
ALTER TABLE `employee_account`
  MODIFY `ACCOUNT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `TRANSACTION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `fk_bill` FOREIGN KEY (`TRANSACTION_ID`) REFERENCES `transactions` (`TRANSACTION_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `fk_branch` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_employee_manager` FOREIGN KEY (`MANAGER_ID`) REFERENCES `employee` (`CMND`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `company_account`
--
ALTER TABLE `company_account`
  ADD CONSTRAINT `fk_company_account` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company_email`
--
ALTER TABLE `company_email`
  ADD CONSTRAINT `fk_email` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company_phone`
--
ALTER TABLE `company_phone`
  ADD CONSTRAINT `fk_phone` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `fk_coupon` FOREIGN KEY (`PROMOTION_ID`) REFERENCES `promotion` (`PROMOTION_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_employee` FOREIGN KEY (`BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_account`
--
ALTER TABLE `employee_account`
  ADD CONSTRAINT `fk_employee_account` FOREIGN KEY (`COMPANY_ACCOUNT_ID`) REFERENCES `company_account` (`ACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_employee_account_emp_id` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employee` (`CMND`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gift`
--
ALTER TABLE `gift`
  ADD CONSTRAINT `fk_gift` FOREIGN KEY (`PROMOTION_ID`) REFERENCES `promotion` (`PROMOTION_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `loyalty_card`
--
ALTER TABLE `loyalty_card`
  ADD CONSTRAINT `fk_loyalty_card` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `member_customer` (`CMND`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member_customer`
--
ALTER TABLE `member_customer`
  ADD CONSTRAINT `fk_member_customer` FOREIGN KEY (`CMND`) REFERENCES `customer` (`CUSTOMER_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `normal_customer`
--
ALTER TABLE `normal_customer`
  ADD CONSTRAINT `fk_normal_customer` FOREIGN KEY (`PHONE`) REFERENCES `customer` (`CUSTOMER_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_service`
--
ALTER TABLE `product_service`
  ADD CONSTRAINT `fk_product_service` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `promotion_join`
--
ALTER TABLE `promotion_join`
  ADD CONSTRAINT `fk_promotion_1` FOREIGN KEY (`PROMOTION_ID`) REFERENCES `promotion` (`PROMOTION_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_promotion_2` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `fk_report` FOREIGN KEY (`COMPANY_ID`,`PRODUCT_SERVICE_ID`) REFERENCES `product_service` (`COMPANY_ID`, `PRODUCT_SERVICE_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `take_care`
--
ALTER TABLE `take_care`
  ADD CONSTRAINT `fk_take_care_1` FOREIGN KEY (`EMPLOYEE_ACCOUNT_ID`) REFERENCES `employee_account` (`ACCOUNT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_take_care_2` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_transaction1` FOREIGN KEY (`COMPANY_ID`,`PRODUCT_SERVICE_ID`) REFERENCES `product_service` (`COMPANY_ID`, `PRODUCT_SERVICE_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `use_service`
--
ALTER TABLE `use_service`
  ADD CONSTRAINT `fk_use_1` FOREIGN KEY (`COMPANY_ID`,`PRODUCT_SERVICE_ID`) REFERENCES `product_service` (`COMPANY_ID`, `PRODUCT_SERVICE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_use_2` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_use_3` FOREIGN KEY (`TRANSACTION_ID`) REFERENCES `transactions` (`TRANSACTION_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
