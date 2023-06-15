-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 15, 2023 lúc 07:02 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `doan1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(255) DEFAULT NULL,
  `CategoryType` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`, `CategoryType`) VALUES
(1, 'Quần Jean', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `ImageID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`ImageID`, `ProductID`, `URL`) VALUES
(16, 41608168, ' Uploads/648a8dcd778aa_0fc21cfd020bd0c7643332affdda4bed.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetails`
--

INSERT INTO `orderdetails` (`OrderID`, `ProductID`, `OrderDate`, `Quantity`, `Total`) VALUES
(1, 41608168, '2023-06-15', 1, 41),
(2, 41608168, '2023-06-15', 1, 41);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `discription` varchar(200) DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`ProductID`, `CategoryID`, `ProductName`, `Price`, `Quantity`, `discription`, `is_delete`) VALUES
(41608168, 1, 'Quần Dài Carrera Jeans 617F1283X_45L', 41, 56, 'qẻdqwfqef', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shoppingorder`
--

CREATE TABLE `shoppingorder` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shoppingorder`
--

INSERT INTO `shoppingorder` (`OrderID`, `UserID`, `OrderDate`) VALUES
(1, 10, '2023-06-15'),
(2, 10, '2023-06-15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `UserPassword` varchar(255) DEFAULT NULL,
  `UserType` varchar(255) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`UserID`, `UserName`, `Email`, `UserPassword`, `UserType`, `Address`, `PhoneNumber`) VALUES
(10, 'ADMIN', 'admin@admin.com', '123456789', '0', 'HCM', '+123456789');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`ImageID`),
  ADD KEY `fkProductID` (`ProductID`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `fkproductID2` (`ProductID`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `fkCategoryID` (`CategoryID`);

--
-- Chỉ mục cho bảng `shoppingorder`
--
ALTER TABLE `shoppingorder`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `fkUserID` (`UserID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `ImageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `shoppingorder`
--
ALTER TABLE `shoppingorder`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fkProductID` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fkCategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
