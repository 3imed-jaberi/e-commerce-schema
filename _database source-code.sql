--
-- Imed Jaberi 
-- https://github.com/3imed-jaberi
-- 

SET time_zone = "+00:00";

--
-- DataBase :  Store
--
CREATE DATABASE IF NOT EXISTS store DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE store;

-- --------------------------------------------------------

--
-- Address Model 
--
DROP TABLE IF EXISTS addresses;
CREATE TABLE IF NOT EXISTS addresses (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Street VARCHAR(80) NOT NULL,
  City VARCHAR(40) NOT NULL,
  Country VARCHAR(30) NOT NULL,
  PostCode VARCHAR(6) NOT NULL 
);

--
-- User Model 
--
DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  FirstName VARCHAR(30) NOT NULL,
  LastName VARCHAR(30) NOT NULL,
  Email VARCHAR(50) NOT NULL UNIQUE,
  Password VARCHAR(30) NOT NULL,
  AddressID INT NOT NULL,
  Phone VARCHAR(20) NOT NULL,
  FOREIGN KEY (AddressID) REFERENCES addresses(ID)
);

--
-- Category Model 
--
DROP TABLE IF EXISTS categories;
CREATE TABLE IF NOT EXISTS categories (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(90) NOT NULL
);

--
-- Product Model 
--
DROP TABLE IF EXISTS products;
CREATE TABLE IF NOT EXISTS products (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(250) NOT NULL,
  CategoryID INT NOT NULL,
  Price FLOAT NOT NULL,
  Description TEXT NOT NULL,
  Thumbnail VARCHAR(255) NOT NULL,
  Weight FLOAT NOT NULL,
  Width FLOAT NOT NULL,
  Height FLOAT NOT NULL,
  FOREIGN KEY (CategoryID) REFERENCES categories(ID)
);

--
-- Order Model 
--
DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Code VARCHAR(255) NOT NULL UNIQUE,
  TotalPrice FLOAT NOT NULL,
  UsedID INT NOT NULL,
  DeliverTax FLOAT NOT NULL,
  FOREIGN KEY (UsedID) REFERENCES users(ID)
);

--
-- OrderItem Model 
--
DROP TABLE IF EXISTS order_items;
CREATE TABLE IF NOT EXISTS order_items (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  ProductID INT NOT NULL UNIQUE,
  OrderID INT NOT NULL,
  FOREIGN KEY (ProductID) REFERENCES products(ID),
  FOREIGN KEY (OrderID) REFERENCES orders(ID)
);